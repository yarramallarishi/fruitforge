import rawCatalog from '../data/fruits.json';
import type { Fruit } from './domain';

export interface CatalogItem { id: string; name: string; slug: string; category: string; rarity: string; type: string; enabled: boolean; catalogVersion: number }
export const catalog: CatalogItem[] = (rawCatalog as Omit<CatalogItem, 'slug' | 'catalogVersion'>[]).map((item) => ({
  ...item, slug: item.id.replace(/^fruit-/, ''), catalogVersion: 1,
}));
export const catalogById = new Map(catalog.map((item) => [item.id, item]));
export const blankFruitValues = (): Fruit[] => catalog.map((item) => ({
  ...item, regularValue: null, permanentValue: null, demand: null, trend: 'unknown', confidence: 'unrated',
  note: null, lastUpdated: null, lastPublished: null, datasetVersion: 0,
}));
export const rarityOrder = ['Common', 'Uncommon', 'Rare', 'Legendary', 'Mythical'];
