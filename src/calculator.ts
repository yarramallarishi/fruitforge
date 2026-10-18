import type { Fruit, TradeLine, TradeResult, TradeSideResult } from './domain';
import { SITE } from './config';

export const FAIR_TRADE_TOLERANCE_PERCENT = SITE.fairTradeTolerancePercent;

export function calculateSide(lines: TradeLine[], values: Map<string, Fruit>): TradeSideResult {
  let total = 0;
  const missing = new Set<string>();
  for (const line of lines) {
    const item = values.get(line.id);
    if (!item || item.regularValue === null || !Number.isFinite(item.regularValue)) {
      missing.add(item?.name || line.id);
      continue;
    }
    total += item.regularValue * line.quantity;
    if (!Number.isFinite(total)) missing.add('Calculated total exceeds the supported range');
  }
  return missing.size ? { total: null, missing: [...missing] } : { total: roundValue(total, 2), missing: [] };
}

export function calculateTrade(give: TradeLine[], receive: TradeLine[], values: Map<string, Fruit>, tolerance = FAIR_TRADE_TOLERANCE_PERCENT): TradeResult {
  const giveResult = calculateSide(give, values), receiveResult = calculateSide(receive, values);
  if (giveResult.total === null || receiveResult.total === null) {
    return { give: giveResult, receive: receiveResult, difference: null, percentage: null, verdict: 'incomplete' };
  }
  const difference = roundValue(receiveResult.total - giveResult.total, 2);
  if (!give.length && !receive.length) return { give: giveResult, receive: receiveResult, difference: null, percentage: null, verdict: 'unavailable' };
  if (giveResult.total === 0) {
    return { give: giveResult, receive: receiveResult, difference, percentage: null, verdict: receiveResult.total === 0 ? 'fair' : 'unavailable' };
  }
  const rawPercentage = (difference / giveResult.total) * 100;
  const percentage = Number.isFinite(rawPercentage) ? roundValue(rawPercentage, 2) : null;
  const threshold = giveResult.total * (tolerance / 100);
  const verdict = difference > threshold ? 'win' : difference < -threshold ? 'lose' : 'fair';
  return { give: giveResult, receive: receiveResult, difference, percentage, verdict };
}

export function roundValue(value: number, decimals = 0) {
  if (!Number.isFinite(value) || Math.abs(value) >= 1e20) return value;
  const factor = 10 ** decimals;
  return Math.round((value + Math.sign(value) * Number.EPSILON) * factor) / factor;
}

export function encodeTrade(give: TradeLine[], receive: TradeLine[]): string {
  const side = (lines: TradeLine[]) => lines.map((line) => `${line.id}:${line.quantity}`).join(',');
  return `${side(give)}|${side(receive)}`;
}

export function decodeTrade(value: string, validIds: Set<string>): { give: TradeLine[]; receive: TradeLine[] } | null {
  if (value.length > 500) return null;
  const parts = value.split('|');
  if (parts.length !== 2) return null;
  const parse = (part: string): TradeLine[] | null => {
    if (part === '') return [];
    const entries = part.split(',');
    if (entries.length > 8) return null;
    const seen = new Set<string>(), lines: TradeLine[] = [];
    for (const entry of entries) {
      const match = /^([a-z0-9-]+):([1-9]\d?)$/.exec(entry);
      if (!match || !validIds.has(match[1]) || seen.has(match[1])) return null;
      seen.add(match[1]); lines.push({ id: match[1], quantity: Number(match[2]) });
    }
    return lines;
  };
  const give = parse(parts[0]), receive = parse(parts[1]);
  return give && receive ? { give, receive } : null;
}
