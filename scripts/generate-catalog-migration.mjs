import { readFileSync, writeFileSync } from 'node:fs';

const catalog = JSON.parse(readFileSync(new URL('../data/fruits.json', import.meta.url), 'utf8'));
const escape = (value) => value == null ? 'NULL' : `'${String(value).replaceAll("'", "''")}'`;
const rows = catalog.map((item) => `  (${escape(item.id)}, ${escape(item.name)}, ${escape(item.id.replace(/^fruit-/, ''))}, ${escape(item.category)}, ${escape(item.rarity)}, ${escape(item.type)}, ${item.enabled ? 1 : 0}, 1)`).join(',\n');
const sql = `-- Generated from data/fruits.json. Existing identities are never overwritten.\nINSERT OR IGNORE INTO canonical_items(id, name, slug, category, rarity, item_type, enabled, catalog_version) VALUES\n${rows};\n`;
writeFileSync(new URL('../migrations/0002_seed_catalog.sql', import.meta.url), sql);
console.log(`Wrote catalog seed for ${catalog.length} canonical fruits.`);
