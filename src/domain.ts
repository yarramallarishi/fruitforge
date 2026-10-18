export type Trend = 'rising' | 'falling' | 'stable' | 'unknown';
export type Confidence = 'high' | 'medium' | 'low' | 'unrated';
export interface Fruit {
  id: string; name: string; slug: string; category: string; rarity: string | null; type: string | null;
  enabled: boolean; regularValue: number | null; permanentValue: number | null; demand: number | null;
  trend: Trend; confidence: Confidence; note: string | null; lastUpdated: string | null;
  lastPublished: string | null; datasetVersion: number;
}
export interface TradeLine { id: string; quantity: number }
export interface TradeSideResult { total: number | null; missing: string[] }
export interface TradeResult {
  give: TradeSideResult; receive: TradeSideResult; difference: number | null;
  percentage: number | null; verdict: 'win' | 'fair' | 'lose' | 'incomplete' | 'unavailable';
}
