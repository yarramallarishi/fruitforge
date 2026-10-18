import type { Fruit } from './domain';
import { blankFruitValues } from './catalog';

export interface Dataset { values: Fruit[]; version: number; lastUpdated: string | null; publishedAt: string | null }
export class ApiError extends Error {
  status: number; details?: unknown;
  constructor(message: string, status: number, details?: unknown) { super(message); this.status = status; this.details = details; }
}
export async function api<T>(path: string, init: RequestInit = {}): Promise<T> {
  let response: Response;
  try {
    response = await fetch(path, { ...init, headers: { ...(init.body ? { 'Content-Type': 'application/json' } : {}), ...init.headers } });
  } catch { throw new ApiError('Could not reach the FruitForge API.', 0); }
  const data = await response.json().catch(() => ({})) as { error?: string; details?: unknown };
  if (!response.ok) throw new ApiError(data.error || `Request failed (${response.status}).`, response.status, data.details);
  return data as T;
}
export async function loadDataset(): Promise<{ dataset: Dataset; connected: boolean }> {
  try {
    const dataset = await api<Dataset>('/api/values');
    return { dataset, connected: true };
  } catch {
    return { dataset: { values: blankFruitValues(), version: 0, lastUpdated: null, publishedAt: null }, connected: false };
  }
}
