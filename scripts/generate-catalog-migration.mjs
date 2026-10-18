import { readFileSync, writeFileSync } from 'node:fs';

const catalog = JSON.parse(readFileSync(new URL('../data/fruits.json', import.meta.url), 'utf8'));
if (!Array.isArray(catalog)) throw new Error('data/fruits.json must contain an array.');

const escape = (value) => value == null ? 'NULL' : `'${String(value).replaceAll("'", "''")}'`;
const number = (value) => typeof value === 'number' && Number.isFinite(value) ? String(value) : 'NULL';
const ids = new Set();
for (const item of catalog) {
  if (!item.id || !item.name || !item.category || ids.has(item.id)) {
    throw new Error(`Catalog entry has missing required fields or a duplicate ID: ${item.id || '(missing ID)'}`);
  }
  ids.add(item.id);
}

const catalogRows = catalog.map((item) => `  (${escape(item.id)}, ${escape(item.name)}, ${escape(item.id.replace(/^fruit-/, ''))}, ${escape(item.category)}, ${escape(item.rarity)}, ${escape(item.type)}, ${item.enabled ? 1 : 0}, 1)`).join(',\n');
const catalogSql = `-- Generated from data/fruits.json. Existing identities are never overwritten.\nINSERT OR IGNORE INTO canonical_items(id, name, slug, category, rarity, item_type, enabled, catalog_version) VALUES\n${catalogRows};\n`;
writeFileSync(new URL('../migrations/0002_seed_catalog.sql', import.meta.url), catalogSql);

const permanentByFruitId = new Map(catalog
  .filter((item) => item.category === 'permanent-fruit' && item.relatedFruitId && Number.isFinite(item.value))
  .map((item) => [item.relatedFruitId, item]));
const allowedTrends = new Set(['rising', 'falling', 'stable', 'unknown']);
const trendForApp = (value) => {
  const normalized = String(value || '').toLowerCase();
  return allowedTrends.has(normalized) ? normalized : 'unknown';
};
const sourceNote = (item) => [
  `Source: ${item.valueSource || 'data/fruits.json'}`,
  item.valueObserved ? `observed ${item.valueObserved}` : null,
  item.valueUnit ? `unit ${item.valueUnit}` : null,
  item.trend ? `source trend ${item.trend}` : null,
].filter(Boolean).join('; ');

const seededValues = catalog.map((item) => {
  const linkedPermanent = item.category === 'fruit' ? permanentByFruitId.get(item.id) : undefined;
  const regularValue = Number.isFinite(item.value) ? item.value : null;
  const permanentValue = linkedPermanent ? linkedPermanent.value : null;
  const demand = Number.isInteger(item.demand) && item.demand >= 1 && item.demand <= 10 ? item.demand : null;
  const trend = trendForApp(item.trend);
  if (regularValue === null && permanentValue === null && demand === null && trend === 'unknown') return null;

  const notes = [sourceNote(item)];
  if (linkedPermanent) notes.push(`Permanent value ${linkedPermanent.value}; source: ${linkedPermanent.valueSource || 'data/fruits.json'}${linkedPermanent.valueObserved ? `; observed ${linkedPermanent.valueObserved}` : ''}`);
  const note = notes.join('. ');
  if (note.length > 240) throw new Error(`Generated source note exceeds 240 characters for ${item.id}.`);

  return {
    id: item.id,
    regularValue,
    permanentValue,
    demand,
    trend,
    confidence: 'unrated',
    note,
    observed: item.valueObserved || null,
  };
}).filter(Boolean);

const valueSourceSql = seededValues.map((item) => `SELECT ${escape(item.id)} AS id, ${number(item.regularValue)} AS regular_value, ${number(item.permanentValue)} AS permanent_value, ${number(item.demand)} AS demand, ${escape(item.trend)} AS trend, ${escape(item.confidence)} AS confidence, ${escape(item.note)} AS note, ${escape(item.observed)} AS observed`).join('\nUNION ALL\n');
const notAlreadySeeded = 'NOT EXISTS (SELECT 1 FROM current_values AS existing WHERE existing.fruit_id = seed.id)';
const seedFilter = `(seed.regular_value IS NOT NULL OR seed.permanent_value IS NOT NULL OR seed.demand IS NOT NULL OR seed.trend <> 'unknown') AND ${notAlreadySeeded}`;
const seedValuesSql = `-- Generated from data/fruits.json. Existing current values are never overwritten.\n-- Permanent-fruit values also populate the linked fruit's permanent_value. Unsupported source trend labels are retained in note and normalized to unknown.\nINSERT OR IGNORE INTO canonical_items(id, name, slug, category, rarity, item_type, enabled, catalog_version) VALUES\n${catalogRows};\n\nINSERT INTO published_datasets(version, published_by, published_at, item_count, changes_json)\nSELECT COALESCE(MAX(version), 0) + 1, 'catalog-seed', CURRENT_TIMESTAMP,\n  (SELECT COUNT(*) FROM (${valueSourceSql}) AS seed WHERE ${seedFilter}),\n  COALESCE((SELECT json_group_array(json_object('id', seed.id, 'regularValue', seed.regular_value, 'permanentValue', seed.permanent_value)) FROM (${valueSourceSql}) AS seed WHERE ${seedFilter}), '[]')\nFROM published_datasets\nHAVING (SELECT COUNT(*) FROM (${valueSourceSql}) AS seed WHERE ${seedFilter}) > 0;\n\nINSERT INTO value_history(fruit_id, dataset_version, previous_regular_value, regular_value, previous_permanent_value, permanent_value, previous_demand, demand, previous_trend, trend, previous_confidence, confidence, previous_note, note, changed_by, changed_at)\nSELECT seed.id, (SELECT MAX(version) FROM published_datasets), NULL, seed.regular_value, NULL, seed.permanent_value, NULL, seed.demand, NULL, seed.trend, NULL, seed.confidence, NULL, seed.note, 'catalog-seed', CURRENT_TIMESTAMP\nFROM (${valueSourceSql}) AS seed\nWHERE ${seedFilter};\n\nINSERT OR IGNORE INTO current_values(fruit_id, regular_value, permanent_value, demand, trend, confidence, note, last_updated, last_published, dataset_version)\nSELECT seed.id, seed.regular_value, seed.permanent_value, seed.demand, seed.trend, seed.confidence, seed.note, seed.observed, seed.observed, (SELECT MAX(version) FROM published_datasets)\nFROM (${valueSourceSql}) AS seed\nWHERE ${seedFilter};\n`;
writeFileSync(new URL('../migrations/0003_seed_catalog_values.sql', import.meta.url), seedValuesSql);

console.log(`Wrote ${catalog.length} catalog items and ${seededValues.length} value rows from data/fruits.json.`);
