import { describe, expect, it } from 'vitest';
import { calculateSide, calculateTrade, decodeTrade, encodeTrade } from '../src/calculator';
import type { Fruit, TradeLine } from '../src/domain';

function fruit(id: string, regularValue: number | null, permanentValue: number | null = null): Fruit {
  return { id, name: id, slug: id, category: 'fruit', rarity: 'Common', type: 'Natural', enabled: true,
    regularValue, permanentValue, demand: 5, trend: 'stable', confidence: 'medium', note: null,
    lastUpdated: null, lastPublished: null, datasetVersion: 1 };
}
const prices = new Map<string, Fruit>([
  ['fruit-a', fruit('fruit-a', 100)], ['fruit-b', fruit('fruit-b', 50)], ['fruit-zero', fruit('fruit-zero', 0)],
  ['fruit-missing', fruit('fruit-missing', null)],
]);

describe('trade calculator', () => {
  it('calculates a single item and multiple quantities', () => {
    expect(calculateSide([{ id: 'fruit-a', quantity: 1 }], prices).total).toBe(100);
    expect(calculateSide([{ id: 'fruit-a', quantity: 2 }, { id: 'fruit-b', quantity: 3 }], prices).total).toBe(350);
  });
  it('does not describe an empty trade as fair', () => {
    expect(calculateTrade([], [], prices).verdict).toBe('unavailable');
  });
  it('keeps a real zero value distinct from a missing value', () => {
    expect(calculateSide([{ id: 'fruit-zero', quantity: 1 }], prices)).toEqual({ total: 0, missing: [] });
    expect(calculateSide([{ id: 'fruit-missing', quantity: 1 }], prices)).toEqual({ total: null, missing: ['fruit-missing'] });
    expect(calculateTrade([{ id: 'fruit-a', quantity: 1 }], [{ id: 'fruit-missing', quantity: 1 }], prices).verdict).toBe('incomplete');
  });
  it('handles a zero denominator explicitly', () => {
    const receive = calculateTrade([{ id: 'fruit-zero', quantity: 1 }], [{ id: 'fruit-a', quantity: 1 }], prices);
    expect(receive.verdict).toBe('unavailable'); expect(receive.percentage).toBeNull();
    const bothZero = calculateTrade([{ id: 'fruit-zero', quantity: 1 }], [{ id: 'fruit-zero', quantity: 1 }], prices);
    expect(bothZero.verdict).toBe('fair'); expect(bothZero.percentage).toBeNull();
  });
  it('applies the configured fairness threshold symmetrically', () => {
    const baseline = new Map(prices); baseline.set('fruit-a', fruit('fruit-a', 100)); baseline.set('fruit-b', fruit('fruit-b', 95));
    expect(calculateTrade([{ id: 'fruit-a', quantity: 1 }], [{ id: 'fruit-b', quantity: 1 }], baseline).verdict).toBe('fair');
    baseline.set('fruit-b', fruit('fruit-b', 94));
    expect(calculateTrade([{ id: 'fruit-a', quantity: 1 }], [{ id: 'fruit-b', quantity: 1 }], baseline).verdict).toBe('lose');
    baseline.set('fruit-b', fruit('fruit-b', 106));
    expect(calculateTrade([{ id: 'fruit-a', quantity: 1 }], [{ id: 'fruit-b', quantity: 1 }], baseline).verdict).toBe('win');
  });
  it('rounds fractional values consistently and supports large quantities', () => {
    const fractional = new Map(prices); fractional.set('fruit-a', fruit('fruit-a', 0.1));
    expect(calculateSide([{ id: 'fruit-a', quantity: 3 }], fractional).total).toBe(0.3);
    expect(calculateSide([{ id: 'fruit-a', quantity: 99 }], prices).total).toBe(9900);
  });
  it('encodes only canonical IDs and quantities and rejects invalid links', () => {
    const give: TradeLine[] = [{ id: 'fruit-a', quantity: 2 }], receive = [{ id: 'fruit-b', quantity: 1 }];
    const encoded = encodeTrade(give, receive);
    expect(decodeTrade(encoded, new Set(['fruit-a', 'fruit-b']))).toEqual({ give, receive });
    expect(decodeTrade('fruit-unknown:2|fruit-b:1', new Set(['fruit-a', 'fruit-b']))).toBeNull();
    expect(decodeTrade('fruit-a:100|', new Set(['fruit-a']))).toBeNull();
    expect(decodeTrade('fruit-a:1,fruit-a:2|', new Set(['fruit-a']))).toBeNull();
  });
  it('uses a newly loaded dataset atomically when its values change', () => {
    const versionOne = new Map(prices), versionTwo = new Map(prices); versionTwo.set('fruit-a', fruit('fruit-a', 120));
    const trade: TradeLine[] = [{ id: 'fruit-a', quantity: 1 }];
    expect(calculateSide(trade, versionOne).total).toBe(100);
    expect(calculateSide(trade, versionTwo).total).toBe(120);
  });
});
