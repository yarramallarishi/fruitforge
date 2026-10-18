import { describe, expect, it } from 'vitest';
import fruits from '../data/fruits.json';
import { validatePatch, parseCsv, valueFromCsv } from '../worker/index';

describe('canonical fruit catalog', () => {
  it('has a non-empty stable ID and canonical name for every entry', () => {
    expect(fruits.length).toBeGreaterThan(0);
    for (const item of fruits) { expect(item.id).toMatch(/^fruit-[a-z0-9-]+$/); expect(item.name.trim().length).toBeGreaterThan(0); }
  });
  it('contains no duplicate IDs or canonical names', () => {
    expect(new Set(fruits.map((item) => item.id)).size).toBe(fruits.length);
    expect(new Set(fruits.map((item) => item.name.toLowerCase())).size).toBe(fruits.length);
  });
  it('rejects attempts to rename catalog entries or pass unsupported fields', () => {
    expect(validatePatch({ name: 'Different Name' })).toContain('Only');
    expect(validatePatch({ id: 'fruit-a', regularValue: 1 })).toContain('Only');
  });
  it('validates numeric values and demand without coercion', () => {
    expect(validatePatch({ regularValue: 0, permanentValue: null, demand: 10 })).toEqual({ regularValue: 0, permanentValue: null, demand: 10 });
    expect(validatePatch({ regularValue: -1 })).toContain('non-negative');
    expect(validatePatch({ regularValue: Number.NaN })).toContain('non-negative');
    expect(validatePatch({ regularValue: '12' })).toContain('non-negative');
    expect(validatePatch({ demand: 11 })).toContain('1 to 10');
    expect(validatePatch({ demand: 4.5 })).toContain('1 to 10');
  });
  it('parses CSV quotes and rejects malformed rows before database writes', () => {
    expect(parseCsv('id,note\nfruit-rocket,"said ""hello"""')).toEqual([['id', 'note'], ['fruit-rocket', 'said "hello"']]);
    expect(parseCsv('id,note\nfruit-rocket,"not closed')).toContain('unclosed');
    expect(valueFromCsv('-1', 'regularValue')).toBeNaN();
    expect(valueFromCsv('0', 'regularValue')).toBe(0);
    expect(valueFromCsv('', 'regularValue')).toBeNull();
  });
});

describe('administrative API access', () => {
  it('rejects an unauthenticated publish request server-side', async () => {
    const env = { DB: {} as D1Database, ASSETS: {} as Fetcher };
    const request = new Request('https://fruitforge.test/api/admin/values/publish', {
      method: 'POST', headers: { Origin: 'https://fruitforge.test', 'Content-Type': 'application/json' }, body: JSON.stringify({ confirm: true }),
    });
    const response = await (await import('../worker/index')).default.fetch(request, env as never);
    expect(response.status).toBe(401);
  });
});
