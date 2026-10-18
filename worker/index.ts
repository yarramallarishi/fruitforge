interface Env {
  DB: D1Database;
  ASSETS: Fetcher;
  ADMIN_PASSWORD?: string;
  PUBLIC_SITE_URL?: string;
}

type ValueFields = {
  regularValue: number | null;
  permanentValue: number | null;
  demand: number | null;
  trend: string;
  confidence: string;
  note: string | null;
};
type CatalogRow = { id: string; name: string; slug: string; category: string; rarity: string | null; type: string | null; enabled: number; catalogVersion: number };
type ValueRow = ValueFields & { id: string; name: string; slug: string; category: string; rarity: string | null; type: string | null; enabled: boolean; lastUpdated: string | null; lastPublished: string | null; datasetVersion: number; draft?: ValueFields; draftUpdatedAt?: string | null };
const valueKeys = ['regularValue', 'permanentValue', 'demand', 'trend', 'confidence', 'note'] as const;
const sqlColumn: Record<(typeof valueKeys)[number], string> = {
  regularValue: 'regular_value', permanentValue: 'permanent_value', demand: 'demand',
  trend: 'trend', confidence: 'confidence', note: 'note',
};
const allowedTrends = new Set(['rising', 'falling', 'stable', 'unknown']);
const allowedConfidence = new Set(['high', 'medium', 'low', 'unrated']);
const isoNow = () => new Date().toISOString();

function json(data: unknown, status = 200, headers: HeadersInit = {}) {
  return Response.json(data, { status, headers: { 'Cache-Control': 'no-store', 'X-Content-Type-Options': 'nosniff', ...headers } });
}
function error(message: string, status = 400, details?: unknown) {
  return json({ error: message, ...(details === undefined ? {} : { details }) }, status);
}
function fieldMap<T extends Record<string, unknown>>(row: T | null): ValueFields {
  return {
    regularValue: row?.regular_value == null ? null : Number(row.regular_value),
    permanentValue: row?.permanent_value == null ? null : Number(row.permanent_value),
    demand: row?.demand == null ? null : Number(row.demand),
    trend: String(row?.trend ?? 'unknown'), confidence: String(row?.confidence ?? 'unrated'),
    note: row?.note == null ? null : String(row.note),
  };
}
function sameFields(a: ValueFields, b: ValueFields) {
  return valueKeys.every((key) => a[key] === b[key]);
}
async function readJson(request: Request, maxBytes = 100_000): Promise<Record<string, unknown> | null> {
  const length = Number(request.headers.get('content-length') || 0);
  if (length > maxBytes) return null;
  try {
    const text = await request.text();
    if (text.length > maxBytes) return null;
    const data: unknown = JSON.parse(text);
    return data && typeof data === 'object' && !Array.isArray(data) ? data as Record<string, unknown> : null;
  } catch { return null; }
}
function sameOrigin(request: Request) {
  const origin = request.headers.get('Origin');
  return !!origin && origin === new URL(request.url).origin;
}
function validatePatch(data: Record<string, unknown>, allowId = false): Partial<ValueFields> | string {
  const keys = Object.keys(data);
  if (keys.some((key) => !valueKeys.includes(key as typeof valueKeys[number]) && !(allowId && key === 'id'))) {
    return 'Only regularValue, permanentValue, demand, trend, confidence, and note can be changed.';
  }
  if (!keys.some((key) => valueKeys.includes(key as typeof valueKeys[number]))) return 'Provide at least one value field.';
  const result: Partial<ValueFields> = {};
  for (const key of valueKeys) {
    if (!(key in data)) continue;
    const value = data[key];
    if (key === 'regularValue' || key === 'permanentValue') {
      if (value !== null && (typeof value !== 'number' || !Number.isFinite(value) || value < 0)) return `${key} must be a non-negative number or blank.`;
      result[key] = value as number | null;
    } else if (key === 'demand') {
      if (value !== null && (typeof value !== 'number' || !Number.isInteger(value) || value < 1 || value > 10)) return 'demand must be an integer from 1 to 10 or blank.';
      result[key] = value as number | null;
    } else if (key === 'trend') {
      if (typeof value !== 'string' || !allowedTrends.has(value)) return 'trend must be rising, falling, stable, or unknown.';
      result[key] = value;
    } else if (key === 'confidence') {
      if (typeof value !== 'string' || !allowedConfidence.has(value)) return 'confidence must be high, medium, low, or unrated.';
      result[key] = value;
    } else {
      if (value !== null && (typeof value !== 'string' || value.length > 240)) return 'note must be 240 characters or fewer.';
      result[key] = value === '' ? null : value as string | null;
    }
  }
  return result;
}
async function getCatalog(db: D1Database, activeOnly = false): Promise<CatalogRow[]> {
  const where = activeOnly ? 'WHERE enabled = 1' : '';
  const result = await db.prepare(`SELECT id, name, slug, category, rarity, item_type AS type, enabled, catalog_version AS catalogVersion FROM canonical_items ${where} ORDER BY name COLLATE NOCASE`).all<CatalogRow>();
  return result.results;
}
async function getPublished(db: D1Database): Promise<{ values: ValueRow[]; version: number; lastUpdated: string | null; publishedAt: string | null }> {
  const [items, latest] = await Promise.all([
    db.prepare(`SELECT c.id, c.name, c.slug, c.category, c.rarity, c.item_type AS type, c.enabled,
      v.regular_value AS regular_value, v.permanent_value AS permanent_value, v.demand AS demand,
      v.trend AS trend, v.confidence AS confidence, v.note AS note, v.last_updated AS lastUpdated,
      v.last_published AS lastPublished, v.dataset_version AS datasetVersion
      FROM canonical_items c LEFT JOIN current_values v ON v.fruit_id = c.id ORDER BY c.name COLLATE NOCASE`).all<Record<string, unknown>>(),
    db.prepare('SELECT version, published_at AS publishedAt FROM published_datasets ORDER BY version DESC LIMIT 1').first<{ version: number; publishedAt: string }>(),
  ]);
  const values = items.results.map((row) => ({
    id: String(row.id), name: String(row.name), slug: String(row.slug), category: String(row.category),
    rarity: row.rarity == null ? null : String(row.rarity), type: row.type == null ? null : String(row.type), enabled: Number(row.enabled) === 1,
    ...fieldMap(row), lastUpdated: row.lastUpdated == null ? null : String(row.lastUpdated),
    lastPublished: row.lastPublished == null ? null : String(row.lastPublished), datasetVersion: Number(row.datasetVersion ?? 0),
  }));
  return { values, version: Number(latest?.version ?? 0), lastUpdated: latest?.publishedAt ?? null, publishedAt: latest?.publishedAt ?? null };
}

const adminCookieName = 'ff_admin';
const adminSessionSeconds = 8 * 60 * 60;
function decodeBase64Url(value: string): Uint8Array {
  const padded = value.replaceAll('-', '+').replaceAll('_', '/') + '='.repeat((4 - value.length % 4) % 4);
  return Uint8Array.from(atob(padded), (character) => character.charCodeAt(0));
}
function encodeBase64Url(value: Uint8Array): string {
  let binary = '';
  for (const byte of value) binary += String.fromCharCode(byte);
  return btoa(binary).replaceAll('+', '-').replaceAll('/', '_').replace(/=+$/, '');
}
function cookie(request: Request, name: string): string | null {
  const prefix = `${name}=`;
  const entry = (request.headers.get('Cookie') || '').split(';').map((part) => part.trim()).find((part) => part.startsWith(prefix));
  return entry ? entry.slice(prefix.length) : null;
}
async function derivedAdminKey(password: string, purpose: string, usages: KeyUsage[]) {
  const root = await crypto.subtle.importKey('raw', new TextEncoder().encode(password), { name: 'HMAC', hash: 'SHA-256' }, false, ['sign']);
  const material = await crypto.subtle.sign('HMAC', root, new TextEncoder().encode(`FruitForge:${purpose}:v1`));
  return crypto.subtle.importKey('raw', material, { name: 'HMAC', hash: 'SHA-256' }, false, usages);
}
async function createAdminSession(password: string): Promise<string> {
  const claims = { sub: 'site-admin', exp: Math.floor(Date.now() / 1000) + adminSessionSeconds };
  const payload = encodeBase64Url(new TextEncoder().encode(JSON.stringify(claims)));
  const key = await derivedAdminKey(password, 'admin-session', ['sign']);
  const signature = await crypto.subtle.sign('HMAC', key, new TextEncoder().encode(payload));
  return `${payload}.${encodeBase64Url(new Uint8Array(signature))}`;
}
async function verifyAdminSession(request: Request, env: Env): Promise<string | null> {
  const password = env.ADMIN_PASSWORD || '';
  const token = cookie(request, adminCookieName);
  if (password.length < 16 || !token) return null;
  try {
    const parts = token.split('.');
    if (parts.length !== 2) return null;
    const key = await derivedAdminKey(password, 'admin-session', ['verify']);
    const valid = await crypto.subtle.verify('HMAC', key, decodeBase64Url(parts[1]) as unknown as BufferSource, new TextEncoder().encode(parts[0]) as unknown as BufferSource);
    if (!valid) return null;
    const claims = JSON.parse(new TextDecoder().decode(decodeBase64Url(parts[0]))) as { sub?: string; exp?: number };
    return claims.sub === 'site-admin' && Number.isInteger(claims.exp) && Number(claims.exp) > Date.now() / 1000 ? 'site-admin' : null;
  } catch { return null; }
}
async function admin(request: Request, env: Env, mutation = false): Promise<string | Response> {
  if (mutation && !sameOrigin(request)) return error('Request origin could not be verified.', 403);
  const identity = await verifyAdminSession(request, env);
  if (!identity) return error('Administrator session required. Sign in with the site password.', 401);
  if (mutation) {
    const key = await hash(`admin:${identity}`), nowSeconds = Math.floor(Date.now() / 1000), windowSeconds = 60;
    await env.DB.prepare(`INSERT INTO submission_windows(key_hash, action, window_started, count) VALUES (?, 'admin-write', ?, 1)
      ON CONFLICT(key_hash, action) DO UPDATE SET count=CASE WHEN window_started<=? THEN 1 ELSE count+1 END,
      window_started=CASE WHEN window_started<=? THEN excluded.window_started ELSE window_started END`)
      .bind(key, nowSeconds, nowSeconds - windowSeconds, nowSeconds - windowSeconds).run();
    const count = await env.DB.prepare(`SELECT count FROM submission_windows WHERE key_hash=? AND action='admin-write'`).bind(key).first<{ count: number }>();
    if (Number(count?.count ?? 0) > 120) return error('Too many administrative changes in a short period. Try again shortly.', 429);
  }
  const now = isoNow();
  await env.DB.prepare(`INSERT INTO administrators(email, first_seen_at, last_seen_at) VALUES (?, ?, ?)
    ON CONFLICT(email) DO UPDATE SET last_seen_at = excluded.last_seen_at`).bind(identity, now, now).run();
  return identity;
}
function audit(db: D1Database, email: string, action: string, ids: string[], details: unknown, at = isoNow()) {
  return db.prepare('INSERT INTO audit_logs(admin_email, action, affected_ids_json, details_json, created_at) VALUES (?, ?, ?, ?, ?)')
    .bind(email, action, JSON.stringify(ids), JSON.stringify(details), at);
}
async function baseline(db: D1Database, id: string): Promise<ValueFields> {
  const row = await db.prepare(`SELECT regular_value, permanent_value, demand, trend, confidence, note FROM draft_values WHERE fruit_id = ?`)
    .bind(id).first<Record<string, unknown>>()
    ?? await db.prepare(`SELECT regular_value, permanent_value, demand, trend, confidence, note FROM current_values WHERE fruit_id = ?`).bind(id).first<Record<string, unknown>>();
  return fieldMap(row);
}
async function writeDraft(db: D1Database, id: string, patch: Partial<ValueFields>, email: string) {
  const exists = await db.prepare('SELECT id FROM canonical_items WHERE id = ?').bind(id).first();
  if (!exists) return false;
  const values = { ...(await baseline(db, id)), ...patch };
  const now = isoNow();
  await db.prepare(`INSERT INTO draft_values(fruit_id, regular_value, permanent_value, demand, trend, confidence, note, updated_by, updated_at)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    ON CONFLICT(fruit_id) DO UPDATE SET regular_value=excluded.regular_value, permanent_value=excluded.permanent_value,
    demand=excluded.demand, trend=excluded.trend, confidence=excluded.confidence, note=excluded.note,
    updated_by=excluded.updated_by, updated_at=excluded.updated_at`)
    .bind(id, values.regularValue, values.permanentValue, values.demand, values.trend, values.confidence, values.note, email, now).run();
  return true;
}
function parseCsv(text: string): string[][] | string {
  const rows: string[][] = [];
  let row: string[] = [], cell = '', quoted = false;
  const input = text.replace(/^\uFEFF/, '');
  for (let i = 0; i < input.length; i++) {
    const ch = input[i];
    if (quoted) {
      if (ch === '"' && input[i + 1] === '"') { cell += '"'; i++; }
      else if (ch === '"') quoted = false;
      else cell += ch;
    } else if (ch === '"' && cell.length === 0) quoted = true;
    else if (ch === ',') { row.push(cell); cell = ''; }
    else if (ch === '\n' || ch === '\r') {
      if (ch === '\r' && input[i + 1] === '\n') i++;
      row.push(cell); cell = '';
      if (row.some((field) => field.trim() !== '')) rows.push(row);
      row = [];
    } else cell += ch;
  }
  if (quoted) return 'CSV contains an unclosed quoted field.';
  row.push(cell);
  if (row.some((field) => field.trim() !== '')) rows.push(row);
  return rows;
}
function valueFromCsv(value: string, key: typeof valueKeys[number]): unknown {
  const clean = value.trim();
  if (clean === '') return key === 'trend' ? 'unknown' : key === 'confidence' ? 'unrated' : null;
  if (key === 'regularValue' || key === 'permanentValue' || key === 'demand') {
    if (!/^(?:\d+\.?\d*|\.\d+)$/.test(clean)) return Number.NaN;
    const parsed = Number(clean);
    return Number.isFinite(parsed) ? parsed : Number.NaN;
  }
  return clean;
}
async function handleImport(request: Request, env: Env, email: string) {
  const body = await readJson(request);
  if (typeof body?.csv !== 'string' || body.csv.length > 80_000) return error('Provide a CSV file smaller than 80 KB.');
  const parsed = parseCsv(body.csv);
  if (typeof parsed === 'string') return error(parsed);
  if (parsed.length < 2) return error('The CSV has no value rows.');
  const headers = parsed[0].map((header) => header.trim());
  const supported = new Set(['id', ...valueKeys]);
  if (new Set(headers).size !== headers.length) return error('The CSV contains duplicate column names.');
  const invalidHeaders = headers.filter((header) => !supported.has(header));
  if (invalidHeaders.length || !headers.includes('id')) return error('CSV columns must use id, regularValue, permanentValue, demand, trend, confidence, and note. Unknown fields are never imported.', 400, { unsupported: invalidHeaders });
  const seen = new Set<string>(), prepared: { id: string; fields: Partial<ValueFields> }[] = [], issues: { row: number; error: string }[] = [];
  if (parsed.length - 1 > 250) return error('A single import can contain at most 250 rows.');
  const catalogIds = new Set((await getCatalog(env.DB)).map((item) => item.id));
  for (let rowIndex = 1; rowIndex < parsed.length; rowIndex++) {
    const row = parsed[rowIndex];
    if (row.length !== headers.length) { issues.push({ row: rowIndex + 1, error: 'Column count does not match the header.' }); continue; }
    const record = Object.fromEntries(headers.map((header, index) => [header, row[index]]));
    const id = String(record.id || '').trim();
    if (!catalogIds.has(id)) { issues.push({ row: rowIndex + 1, error: `Unknown catalog ID: ${id || '(blank)'}.` }); continue; }
    if (seen.has(id)) { issues.push({ row: rowIndex + 1, error: `Duplicate ID: ${id}.` }); continue; }
    seen.add(id);
    const input: Record<string, unknown> = {};
    for (const key of valueKeys) if (headers.includes(key)) input[key] = valueFromCsv(String(record[key] ?? ''), key);
    const validated = validatePatch(input);
    if (typeof validated === 'string') issues.push({ row: rowIndex + 1, error: validated });
    else prepared.push({ id, fields: validated });
  }
  if (issues.length) return error('Import rejected. Fix every listed row before importing; no drafts were changed.', 422, { issues });
  const batch = [];
  for (const item of prepared) {
    const fields = { ...(await baseline(env.DB, item.id)), ...item.fields };
    batch.push(env.DB.prepare(`INSERT INTO draft_values(fruit_id, regular_value, permanent_value, demand, trend, confidence, note, updated_by, updated_at)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) ON CONFLICT(fruit_id) DO UPDATE SET regular_value=excluded.regular_value,
      permanent_value=excluded.permanent_value, demand=excluded.demand, trend=excluded.trend, confidence=excluded.confidence,
      note=excluded.note, updated_by=excluded.updated_by, updated_at=excluded.updated_at`)
      .bind(item.id, fields.regularValue, fields.permanentValue, fields.demand, fields.trend, fields.confidence, fields.note, email, isoNow()));
  }
  batch.push(audit(env.DB, email, 'csv_import', prepared.map((item) => item.id), { count: prepared.length }));
  await env.DB.batch(batch);
  return json({ imported: prepared.length, message: `${prepared.length} rows saved as drafts. Review them before publishing.` });
}
async function adminTable(env: Env) {
  return env.DB.prepare(`SELECT c.id, c.name, c.slug, c.category, c.rarity, c.item_type AS type, c.enabled,
    v.regular_value, v.permanent_value, v.demand, v.trend, v.confidence, v.note,
    v.last_updated AS lastUpdated, v.last_published AS lastPublished, v.dataset_version AS datasetVersion,
    d.regular_value AS d_regular_value, d.permanent_value AS d_permanent_value, d.demand AS d_demand,
    d.trend AS d_trend, d.confidence AS d_confidence, d.note AS d_note, d.updated_at AS draftUpdatedAt
    FROM canonical_items c LEFT JOIN current_values v ON v.fruit_id=c.id LEFT JOIN draft_values d ON d.fruit_id=c.id
    ORDER BY c.name COLLATE NOCASE`).all<Record<string, unknown>>();
}
function mappedAdmin(row: Record<string, unknown>): ValueRow {
  const draft = row.draftUpdatedAt ? fieldMap({ regular_value: row.d_regular_value, permanent_value: row.d_permanent_value, demand: row.d_demand, trend: row.d_trend, confidence: row.d_confidence, note: row.d_note }) : undefined;
  return { id: String(row.id), name: String(row.name), slug: String(row.slug), category: String(row.category),
    ...fieldMap(row), lastUpdated: row.lastUpdated == null ? null : String(row.lastUpdated),
    lastPublished: row.lastPublished == null ? null : String(row.lastPublished), datasetVersion: Number(row.datasetVersion ?? 0),
    ...(draft ? { draft, draftUpdatedAt: String(row.draftUpdatedAt) } : {}),
    enabled: Number(row.enabled) === 1, rarity: row.rarity == null ? null : String(row.rarity), type: row.type == null ? null : String(row.type),
  } as ValueRow;
}
async function previewPublish(env: Env) {
  const drafts = await env.DB.prepare(`SELECT d.*, c.name, v.regular_value AS old_regular, v.permanent_value AS old_permanent,
    v.demand AS old_demand, v.trend AS old_trend, v.confidence AS old_confidence, v.note AS old_note
    FROM draft_values d JOIN canonical_items c ON c.id=d.fruit_id LEFT JOIN current_values v ON v.fruit_id=d.fruit_id ORDER BY c.name`).all<Record<string, unknown>>();
  const changes = drafts.results.map((row) => {
    const from = fieldMap({ regular_value: row.old_regular, permanent_value: row.old_permanent, demand: row.old_demand, trend: row.old_trend, confidence: row.old_confidence, note: row.old_note });
    const to = fieldMap(row);
    return { id: String(row.fruit_id), name: String(row.name), from, to, changed: !sameFields(from, to) };
  });
  return { changes, changedCount: changes.filter((change) => change.changed).length, draftCount: changes.length };
}
async function publish(env: Env, email: string) {
  const { changes, changedCount } = await previewPublish(env);
  if (!changedCount) return error('There are no changed drafts to publish.', 409);
  const latest = await env.DB.prepare('SELECT MAX(version) AS version FROM published_datasets').first<{ version: number | null }>();
  const version = Number(latest?.version ?? 0) + 1;
  const now = isoNow();
  const statements = [env.DB.prepare(`INSERT INTO published_datasets(version, published_by, published_at, item_count, changes_json)
    VALUES (?, ?, ?, ?, ?)`).bind(version, email, now, changedCount, JSON.stringify(changes.filter((change) => change.changed)))];
  for (const change of changes.filter((entry) => entry.changed)) {
    statements.push(env.DB.prepare(`INSERT INTO value_history(fruit_id, dataset_version, previous_regular_value, regular_value,
      previous_permanent_value, permanent_value, previous_demand, demand, previous_trend, trend, previous_confidence,
      confidence, previous_note, note, changed_by, changed_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`)
      .bind(change.id, version, change.from.regularValue, change.to.regularValue, change.from.permanentValue, change.to.permanentValue,
        change.from.demand, change.to.demand, change.from.trend, change.to.trend, change.from.confidence, change.to.confidence,
        change.from.note, change.to.note, email, now));
    statements.push(env.DB.prepare(`INSERT INTO current_values(fruit_id, regular_value, permanent_value, demand, trend, confidence, note, last_updated, last_published, dataset_version)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ON CONFLICT(fruit_id) DO UPDATE SET regular_value=excluded.regular_value,
      permanent_value=excluded.permanent_value, demand=excluded.demand, trend=excluded.trend, confidence=excluded.confidence,
      note=excluded.note, last_updated=excluded.last_updated, last_published=excluded.last_published, dataset_version=excluded.dataset_version`)
      .bind(change.id, change.to.regularValue, change.to.permanentValue, change.to.demand, change.to.trend, change.to.confidence, change.to.note, now, now, version));
  }
  statements.push(env.DB.prepare('DELETE FROM draft_values'));
  statements.push(audit(env.DB, email, 'publish', changes.filter((change) => change.changed).map((change) => change.id), { version, changes: changes.filter((change) => change.changed) }, now));
  await env.DB.batch(statements);
  return json({ version, publishedAt: now, changedCount });
}

function safeUrl(value: string): boolean {
  try { const url = new URL(value); return ['https:', 'http:'].includes(url.protocol) && !url.username && !url.password; } catch { return false; }
}
async function hash(text: string) {
  const digest = await crypto.subtle.digest('SHA-256', new TextEncoder().encode(text));
  return [...new Uint8Array(digest)].map((byte) => byte.toString(16).padStart(2, '0')).join('');
}
async function keyedHash(secret: string, purpose: string, value: string) {
  const key = await derivedAdminKey(secret, purpose, ['sign']);
  const digest = await crypto.subtle.sign('HMAC', key, new TextEncoder().encode(value));
  return encodeBase64Url(new Uint8Array(digest));
}
async function rateCheck(request: Request, env: Env, action: string, maximum: number, windowSeconds = 3600) {
  const ip = request.headers.get('CF-Connecting-IP') || 'unknown';
  const key = await keyedHash(env.ADMIN_PASSWORD || 'development-only-change-this', 'rate-limit-ip', ip);
  const now = Math.floor(Date.now() / 1000);
  await env.DB.prepare(`INSERT INTO submission_windows(key_hash, action, window_started, count) VALUES (?, ?, ?, 1)
    ON CONFLICT(key_hash, action) DO UPDATE SET
      count=CASE WHEN window_started <= ? THEN 1 ELSE count+1 END,
      window_started=CASE WHEN window_started <= ? THEN excluded.window_started ELSE window_started END`)
    .bind(key, action, now, now - windowSeconds, now - windowSeconds).run();
  const entry = await env.DB.prepare('SELECT count FROM submission_windows WHERE key_hash=? AND action=?').bind(key, action).first<{ count: number }>();
  return Number(entry?.count ?? 0) <= maximum;
}
async function validateItems(db: D1Database, value: unknown): Promise<{ id: string; quantity: number }[] | string> {
  if (!Array.isArray(value) || value.length > 8) return 'Each side needs a list of up to 8 fruit rows.';
  const seen = new Set<string>(), result: { id: string; quantity: number }[] = [];
  for (const item of value) {
    if (!item || typeof item !== 'object') return 'Every item needs a canonical ID and quantity.';
    const row = item as Record<string, unknown>;
    if (typeof row.id !== 'string' || !Number.isInteger(row.quantity) || Number(row.quantity) < 1 || Number(row.quantity) > 99) return 'Every item needs a known ID and a quantity from 1 to 99.';
    if (seen.has(row.id)) return 'Use one row per fruit and change its quantity instead of duplicating it.';
    seen.add(row.id);
    const exists = await db.prepare('SELECT id FROM canonical_items WHERE id=? AND enabled=1').bind(row.id).first();
    if (!exists) return `Unknown or disabled fruit ID: ${row.id}.`;
    result.push({ id: row.id, quantity: Number(row.quantity) });
  }
  return result;
}
async function submission(request: Request, env: Env, action: string, maximum = 5) {
  if (!sameOrigin(request)) return error('Request origin could not be verified.', 403);
  if (!await rateCheck(request, env, action, maximum)) return error('Too many submissions. Please try again later.', 429);
  return null;
}

async function api(request: Request, env: Env): Promise<Response> {
  const url = new URL(request.url), path = url.pathname, method = request.method;
  const noCache = { 'Cache-Control': 'no-store' };
  if (path === '/api/admin/login' && method === 'POST') {
    if (!sameOrigin(request)) return error('Request origin could not be verified.', 403);
    const expected = env.ADMIN_PASSWORD || '';
    if (expected.length < 16) return error('Admin password sign-in is not configured.', 503);
    if (!await rateCheck(request, env, 'admin-login', 8, 3600)) return error('Too many sign-in attempts. Try again later.', 429);
    const body = await readJson(request, 2_048);
    if (!body || typeof body.password !== 'string' || body.password.length > 256) return error('The password is incorrect.', 401);
    const [providedHash, expectedHash] = await Promise.all([hash(body.password), hash(expected)]);
    let mismatch = providedHash.length ^ expectedHash.length;
    for (let i = 0; i < Math.max(providedHash.length, expectedHash.length); i++) {
      mismatch |= (providedHash.charCodeAt(i) || 0) ^ (expectedHash.charCodeAt(i) || 0);
    }
    if (mismatch !== 0) return error('The password is incorrect.', 401);
    const session = await createAdminSession(expected);
    return json({ authenticated: true }, 200, { 'Set-Cookie': `${adminCookieName}=${session}; Max-Age=${adminSessionSeconds}; Path=/api/admin; HttpOnly; Secure; SameSite=Strict` });
  }
  if (path === '/api/admin/logout' && method === 'POST') {
    if (!sameOrigin(request)) return error('Request origin could not be verified.', 403);
    return json({ authenticated: false }, 200, { 'Set-Cookie': `${adminCookieName}=; Max-Age=0; Path=/api/admin; HttpOnly; Secure; SameSite=Strict` });
  }
  if (path === '/api/catalog' && method === 'GET') return json({ items: await getCatalog(env.DB, true), catalogVersion: 1 }, 200, { 'Cache-Control': 'public, max-age=3600' });
  if (path === '/api/values' && method === 'GET') {
    const data = await getPublished(env.DB);
    return json(data, 200, { 'Cache-Control': 'public, max-age=30, stale-while-revalidate=120', ETag: `"dataset-${data.version}"` });
  }
  if (path === '/api/dataset/version' && method === 'GET') {
    const latest = await env.DB.prepare('SELECT version, published_at AS publishedAt, item_count AS changedItems FROM published_datasets ORDER BY version DESC LIMIT 1').first();
    return json(latest || { version: 0, publishedAt: null, changedItems: 0 }, 200, { 'Cache-Control': 'public, max-age=30' });
  }
  if (path === '/api/guides' && method === 'GET') return json({ guides: [
    { slug: 'using-the-calculator', title: 'How to use the trade calculator', summary: 'Build a trade on both sides and understand the result.', path: '/guides/using-the-calculator' },
    { slug: 'value-methodology', title: 'How FruitForge values work', summary: 'Learn how estimates, confidence, and history are handled.', path: '/guides/value-methodology' },
    { slug: 'demand-and-trading', title: 'Reading demand and trade context', summary: 'Use demand as context when comparing offers.', path: '/guides/demand-and-trading' },
  ] });
  if (path === '/api/site-config' && method === 'GET') return json({
    siteUrl: env.PUBLIC_SITE_URL || url.origin,
    adSense: { enabled: false },
  }, 200, { 'Cache-Control': 'public, max-age=3600' });
  if (path === '/api/values' && method !== 'GET') return error('Method not allowed.', 405);
  const single = path.match(/^\/api\/values\/([a-z0-9-]+)$/);
  if (single && method === 'GET') {
    const data = await getPublished(env.DB), item = data.values.find((value) => value.id === single[1]);
    return item ? json({ item, version: data.version }) : error('Fruit not found.', 404);
  }
  const history = path.match(/^\/api\/values\/([a-z0-9-]+)\/history$/);
  if (history && method === 'GET') {
    const rows = await env.DB.prepare(`SELECT dataset_version AS version, regular_value AS regularValue,
      permanent_value AS permanentValue, demand, trend, confidence, note, changed_by AS changedBy, changed_at AS changedAt
      FROM value_history WHERE fruit_id=? ORDER BY dataset_version DESC LIMIT 100`).bind(history[1]).all();
    return json({ history: rows.results });
  }

  if (path === '/api/admin/values' && method === 'GET') {
    const email = await admin(request, env); if (email instanceof Response) return email;
    const result = await adminTable(env);
    return json({ items: result.results.map(mappedAdmin), version: (await getPublished(env.DB)).version });
  }
  const oneAdmin = path.match(/^\/api\/admin\/values\/([a-z0-9-]+)$/);
  if (oneAdmin && method === 'PATCH') {
    const email = await admin(request, env, true); if (email instanceof Response) return email;
    const body = await readJson(request); if (!body) return error('Provide a valid JSON object.');
    const validated = validatePatch(body); if (typeof validated === 'string') return error(validated);
    const exists = await env.DB.prepare('SELECT id FROM canonical_items WHERE id=?').bind(oneAdmin[1]).first();
    if (!exists) return error('Unknown canonical fruit ID.', 404);
    await writeDraft(env.DB, oneAdmin[1], validated, email);
    await audit(env.DB, email, 'save_draft', [oneAdmin[1]], validated).run();
    return json({ saved: true, id: oneAdmin[1] });
  }
  if (oneAdmin && method === 'DELETE') {
    const email = await admin(request, env, true); if (email instanceof Response) return email;
    await env.DB.prepare('DELETE FROM draft_values WHERE fruit_id=?').bind(oneAdmin[1]).run();
    await audit(env.DB, email, 'reset_draft', [oneAdmin[1]], {}).run();
    return json({ reset: true });
  }
  if (path === '/api/admin/values/import' && method === 'POST') {
    const email = await admin(request, env, true); if (email instanceof Response) return email;
    return handleImport(request, env, email);
  }
  if (path === '/api/admin/values/preview' && method === 'POST') {
    const email = await admin(request, env, true); if (email instanceof Response) return email;
    const body = await readJson(request); if (body?.confirm !== true) return error('Explicit preview confirmation is required.');
    return json(await previewPublish(env));
  }
  if (path === '/api/admin/values/publish' && method === 'POST') {
    const email = await admin(request, env, true); if (email instanceof Response) return email;
    const body = await readJson(request); if (body?.confirm !== true) return error('Confirm the reviewed changes before publishing.');
    return publish(env, email);
  }
  if (path === '/api/admin/drafts' && method === 'DELETE') {
    const email = await admin(request, env, true); if (email instanceof Response) return email;
    const result = await env.DB.prepare('SELECT fruit_id AS id FROM draft_values').all<{ id: string }>();
    await env.DB.batch([env.DB.prepare('DELETE FROM draft_values'), audit(env.DB, email, 'discard_drafts', result.results.map((row) => row.id), { count: result.results.length })]);
    return json({ discarded: result.results.length });
  }
  if (path === '/api/admin/audit-log' && method === 'GET') {
    const email = await admin(request, env); if (email instanceof Response) return email;
    const limit = Math.max(1, Math.min(100, Number(url.searchParams.get('limit') || 50)));
    const rows = await env.DB.prepare(`SELECT id, admin_email AS adminEmail, action, affected_ids_json AS affectedIds,
      details_json AS details, created_at AS createdAt FROM audit_logs ORDER BY id DESC LIMIT ?`).bind(limit).all<Record<string, unknown>>();
    return json({ entries: rows.results.map((row) => ({ ...row, affectedIds: JSON.parse(String(row.affectedIds)), details: JSON.parse(String(row.details)) })) });
  }
  if (path === '/api/admin/feedback' && method === 'GET') {
    const email = await admin(request, env); if (email instanceof Response) return email;
    const limit = Math.max(1, Math.min(100, Number(url.searchParams.get('limit') || 50)));
    const rows = await env.DB.prepare('SELECT id, category, message, created_at AS createdAt FROM feedback ORDER BY id DESC LIMIT ?').bind(limit).all();
    return json({ entries: rows.results });
  }
  if (path === '/api/admin/reports' && method === 'GET') {
    const email = await admin(request, env); if (email instanceof Response) return email;
    const rows = await env.DB.prepare(`SELECT r.id, r.trade_id AS tradeId, r.reason, r.detail, r.status, r.created_at AS createdAt,
      t.offer_json AS offer, t.wanted_json AS wanted, t.contact, t.active FROM reports r JOIN trade_listings t ON t.id=r.trade_id
      ORDER BY CASE r.status WHEN 'open' THEN 0 ELSE 1 END, r.id DESC LIMIT 100`).all<Record<string, unknown>>();
    return json({ entries: rows.results.map((row) => ({ ...row, offer: JSON.parse(String(row.offer)), wanted: JSON.parse(String(row.wanted)), active: Number(row.active) === 1 })) });
  }
  const reportAdmin = path.match(/^\/api\/admin\/reports\/(\d+)$/);
  if (reportAdmin && method === 'PATCH') {
    const email = await admin(request, env, true); if (email instanceof Response) return email;
    const body = await readJson(request);
    if (!body || !['resolved', 'dismissed', 'open'].includes(String(body.status)) || Object.keys(body).some((key) => key !== 'status')) return error('Report status must be open, resolved, or dismissed.');
    const result = await env.DB.prepare('UPDATE reports SET status=? WHERE id=?').bind(body.status, Number(reportAdmin[1])).run();
    if (!result.meta.changes) return error('Report not found.', 404);
    await audit(env.DB, email, 'update_report', [], { reportId: Number(reportAdmin[1]), status: body.status }).run();
    return json({ updated: true });
  }
  const tradeAdmin = path.match(/^\/api\/admin\/trades\/([0-9a-f-]+)$/i);
  if (tradeAdmin && method === 'PATCH') {
    const email = await admin(request, env, true); if (email instanceof Response) return email;
    const body = await readJson(request);
    if (typeof body?.active !== 'boolean' || Object.keys(body).some((key) => key !== 'active')) return error('Only the listing active status can be changed here.');
    const result = await env.DB.prepare('UPDATE trade_listings SET active=?, updated_at=? WHERE id=?').bind(body.active ? 1 : 0, isoNow(), tradeAdmin[1]).run();
    if (!result.meta.changes) return error('Trade listing not found.', 404);
    await audit(env.DB, email, 'moderate_trade', [tradeAdmin[1]], { active: body.active }).run();
    return json({ updated: true });
  }
  const adminHistory = path.match(/^\/api\/admin\/history\/([a-z0-9-]+)$/);
  if (adminHistory && method === 'GET') {
    const email = await admin(request, env); if (email instanceof Response) return email;
    const rows = await env.DB.prepare(`SELECT dataset_version AS version, previous_regular_value AS previousRegularValue,
      regular_value AS regularValue, previous_permanent_value AS previousPermanentValue, permanent_value AS permanentValue,
      previous_demand AS previousDemand, demand, previous_trend AS previousTrend, trend, previous_confidence AS previousConfidence,
      confidence, previous_note AS previousNote, note, changed_by AS changedBy, changed_at AS changedAt
      FROM value_history WHERE fruit_id=? ORDER BY dataset_version DESC LIMIT 100`).bind(adminHistory[1]).all();
    return json({ history: rows.results });
  }
  if (path === '/api/admin/values/rollback' && method === 'POST') {
    const email = await admin(request, env, true); if (email instanceof Response) return email;
    const body = await readJson(request);
    if (typeof body?.id !== 'string' || !Number.isInteger(body.version) || Number(body.version) < 1) return error('Provide a fruit ID and published version to roll back.');
    const row = await env.DB.prepare(`SELECT previous_regular_value AS regularValue, previous_permanent_value AS permanentValue,
      previous_demand AS demand, previous_trend AS trend, previous_confidence AS confidence, previous_note AS note
      FROM value_history WHERE fruit_id=? AND dataset_version=?`).bind(body.id, body.version).first<Record<string, unknown>>();
    if (!row) return error('That fruit has no history at the requested version.', 404);
    await writeDraft(env.DB, body.id, fieldMap(row), email);
    await audit(env.DB, email, 'rollback_to_draft', [body.id], { version: body.version }).run();
    return json({ drafted: true, id: body.id, targetVersion: body.version });
  }
  if (path === '/api/admin/catalog' && method === 'PATCH') {
    const email = await admin(request, env, true); if (email instanceof Response) return email;
    const body = await readJson(request);
    if (typeof body?.id !== 'string' || typeof body.enabled !== 'boolean' || Object.keys(body).some((key) => !['id', 'enabled'].includes(key))) return error('Only an item ID and enabled status can be changed.');
    const result = await env.DB.prepare('UPDATE canonical_items SET enabled=? WHERE id=?').bind(body.enabled ? 1 : 0, body.id).run();
    if (!result.meta.changes) return error('Unknown canonical fruit ID.', 404);
    await audit(env.DB, email, 'set_catalog_status', [body.id], { enabled: body.enabled }).run();
    return json({ updated: true });
  }

  if (path === '/api/trades' && method === 'GET') {
    const limit = Math.max(1, Math.min(100, Number(url.searchParams.get('limit') || 40)));
    const rows = await env.DB.prepare(`SELECT id, offer_json AS offer, wanted_json AS wanted, contact, note,
      created_at AS createdAt, updated_at AS updatedAt, expires_at AS expiresAt
      FROM trade_listings WHERE active=1 AND expires_at>? ORDER BY created_at DESC LIMIT ?`).bind(isoNow(), limit).all<Record<string, unknown>>();
    const offerFilter = url.searchParams.get('offer'), wantFilter = url.searchParams.get('want');
    const listings = rows.results.map((row) => ({ ...row, offer: JSON.parse(String(row.offer)), wanted: JSON.parse(String(row.wanted)) }))
      .filter((row) => !offerFilter || row.offer.some((item: { id: string }) => item.id === offerFilter))
      .filter((row) => !wantFilter || row.wanted.some((item: { id: string }) => item.id === wantFilter));
    return json({ listings });
  }
  if (path === '/api/trades' && method === 'POST') {
    const limited = await submission(request, env, 'trade', 3); if (limited) return limited;
    const body = await readJson(request);
    if (!body || body.company) return error('Provide valid listing details.');
    const offer = await validateItems(env.DB, body.offer), wanted = await validateItems(env.DB, body.wanted);
    if (typeof offer === 'string') return error(`Offer: ${offer}`);
    if (typeof wanted === 'string') return error(`Wanted: ${wanted}`);
    if (!offer.length && !wanted.length) return error('Add at least one fruit to the offer or wanted side.');
    if (typeof body.note !== 'string' || body.note.length > 240) return error('Listing note must be 240 characters or fewer.');
    if (typeof body.contact !== 'string' || !/^[A-Za-z0-9_]{3,20}$/.test(body.contact)) return error('Enter a Roblox username with 3–20 letters, numbers, or underscores. Never enter a password.');
    if (typeof body.ownerToken !== 'string' || body.ownerToken.length < 32) return error('Listing owner token is missing. Refresh the page and try again.');
    const id = crypto.randomUUID(), now = new Date(), createdAt = now.toISOString(), expiresAt = new Date(now.getTime() + 7 * 86400_000).toISOString();
    await env.DB.prepare(`INSERT INTO trade_listings(id, offer_json, wanted_json, contact, note, owner_token_hash, created_at, updated_at, expires_at)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`).bind(id, JSON.stringify(offer), JSON.stringify(wanted), body.contact, body.note.trim(), await hash(body.ownerToken), createdAt, createdAt, expiresAt).run();
    return json({ id, createdAt, expiresAt }, 201);
  }
  const tradePath = path.match(/^\/api\/trades\/([0-9a-f-]+)$/i);
  if (tradePath && method === 'PATCH') {
    const limited = await submission(request, env, 'trade-edit', 10); if (limited) return limited;
    const body = await readJson(request), token = typeof body?.ownerToken === 'string' ? body.ownerToken : '';
    const existing = await env.DB.prepare('SELECT owner_token_hash FROM trade_listings WHERE id=? AND active=1').bind(tradePath[1]).first<{ owner_token_hash: string }>();
    if (!existing || !token || await hash(token) !== existing.owner_token_hash) return error('Listing not found or owner token is incorrect.', 404);
    const offer = await validateItems(env.DB, body?.offer), wanted = await validateItems(env.DB, body?.wanted);
    if (typeof offer === 'string') return error(`Offer: ${offer}`); if (typeof wanted === 'string') return error(`Wanted: ${wanted}`);
    if (typeof body?.note !== 'string' || body.note.length > 240 || typeof body.contact !== 'string' || !/^[A-Za-z0-9_]{3,20}$/.test(body.contact)) return error('Enter a valid username and a listing note of 240 characters or fewer.');
    await env.DB.prepare('UPDATE trade_listings SET offer_json=?, wanted_json=?, contact=?, note=?, updated_at=? WHERE id=?')
      .bind(JSON.stringify(offer), JSON.stringify(wanted), body.contact, body.note.trim(), isoNow(), tradePath[1]).run();
    return json({ updated: true });
  }
  if (tradePath && method === 'DELETE') {
    const limited = await submission(request, env, 'trade-edit', 10); if (limited) return limited;
    const body = await readJson(request), token = typeof body?.ownerToken === 'string' ? body.ownerToken : '';
    const existing = await env.DB.prepare('SELECT owner_token_hash FROM trade_listings WHERE id=? AND active=1').bind(tradePath[1]).first<{ owner_token_hash: string }>();
    if (!existing || !token || await hash(token) !== existing.owner_token_hash) return error('Listing not found or owner token is incorrect.', 404);
    await env.DB.prepare('UPDATE trade_listings SET active=0, updated_at=? WHERE id=?').bind(isoNow(), tradePath[1]).run();
    return json({ removed: true });
  }
  const reportPath = path.match(/^\/api\/trades\/([0-9a-f-]+)\/report$/i);
  if (reportPath && method === 'POST') {
    const limited = await submission(request, env, 'report', 10); if (limited) return limited;
    const body = await readJson(request);
    const reasons = new Set(['scam', 'spam', 'abusive', 'other']);
    if (!body || typeof body.reason !== 'string' || !reasons.has(body.reason) || typeof body.detail !== 'string' || body.detail.length > 500) return error('Choose a report reason and provide a short optional detail.');
    const exists = await env.DB.prepare('SELECT id FROM trade_listings WHERE id=?').bind(reportPath[1]).first();
    if (!exists) return error('Listing not found.', 404);
    await env.DB.prepare('INSERT INTO reports(trade_id, reason, detail, created_at) VALUES (?, ?, ?, ?)').bind(reportPath[1], body.reason, body.detail.trim(), isoNow()).run();
    return json({ reported: true }, 201);
  }
  if (path === '/api/feedback' && method === 'POST') {
    const limited = await submission(request, env, 'feedback', 5); if (limited) return limited;
    const body = await readJson(request), categories = new Set(['feedback', 'bug', 'correction']);
    if (!body || typeof body.category !== 'string' || !categories.has(body.category) || typeof body.message !== 'string' || body.message.trim().length < 8 || body.message.length > 1500) return error('Choose a category and enter 8–1,500 characters.');
    await env.DB.prepare('INSERT INTO feedback(category, message, created_at) VALUES (?, ?, ?)').bind(body.category, body.message.trim(), isoNow()).run();
    return json({ received: true }, 201);
  }
  if (path.startsWith('/api/')) return error('API route not found.', 404);
  return env.ASSETS.fetch(request);
}

function escapeHtml(value: string) {
  return value.replaceAll('&', '&amp;').replaceAll('<', '&lt;').replaceAll('>', '&gt;').replaceAll('"', '&quot;').replaceAll("'", '&#39;');
}
async function seoAsset(request: Request, env: Env, status = 200): Promise<Response> {
  const url = new URL(request.url), path = url.pathname;
  const source = await env.ASSETS.fetch(new Request(new URL('/', url), request));
  if (!source.ok) return source;
  const html = await source.text();
  let title = 'FruitForge — Know your worth. Trade smarter.';
  let description = 'Fruit values, transparent market updates, and an instant Blox Fruits trade calculator.';
  let indexable = path === '/' || ['/values', '/guides', '/about', '/privacy', '/terms', '/feedback'].includes(path);
  const guideDescriptions: Record<string, [string, string]> = {
    '/guides/using-the-calculator': ['How to use the trade calculator', 'Build both sides of a trade and understand FruitForge’s local calculation and missing-value handling.'],
    '/guides/value-methodology': ['How FruitForge values work', 'See how editor-entered estimates, confidence, history, and dataset publications work.'],
    '/guides/demand-and-trading': ['Reading demand and trade context', 'Understand how editorial demand ratings can inform a trade without promising acceptance.'],
  };
  if (guideDescriptions[path]) { [title, description] = guideDescriptions[path]; indexable = true; }
  if (path === '/values') { title = 'Fruit values | FruitForge'; description = 'Search the canonical Blox Fruits catalog and check current FruitForge published values, demand, and trends.'; }
  if (path === '/calculator') { title = 'Trade calculator | FruitForge'; description = 'Compare both sides of a Blox Fruits trade instantly with current published values.'; indexable = false; }
  if (path === '/trading') { title = 'Trading hub | FruitForge'; description = 'Browse community-submitted Blox Fruits trade offers. Listings are not identity-verified.'; indexable = false; }
  if (path === '/admin') { title = 'Values manager | FruitForge'; description = 'Protected FruitForge administrator tools.'; indexable = false; }
  const fruitMatch = path.match(/^\/fruit\/([a-z0-9-]+)$/);
  if (fruitMatch) {
    const item = await env.DB.prepare('SELECT c.name, c.slug, c.enabled, v.regular_value AS regularValue, v.permanent_value AS permanentValue, v.last_published AS lastPublished FROM canonical_items c LEFT JOIN current_values v ON v.fruit_id=c.id WHERE c.slug=?').bind(fruitMatch[1]).first<{ name: string; slug: string; enabled: number; regularValue: number | null; permanentValue: number | null; lastPublished: string | null }>();
    if (!item) { title = 'Fruit not found | FruitForge'; description = 'This fruit is not in the active catalog.'; indexable = false; status = 404; }
    else {
      title = `${item.name} value and history | FruitForge`;
      description = item.regularValue != null || item.permanentValue != null ? `Review the latest published ${item.name} trading estimate, demand context, and history on FruitForge.` : `${item.name} is in the canonical catalog, but no trading value has been published yet.`;
      indexable = item.enabled === 1 && (item.regularValue != null || item.permanentValue != null);
    }
  }
  const canonical = `${(env.PUBLIC_SITE_URL || url.origin).replace(/\/$/, '')}${path}`;
  let rendered = html.replace(/<title>[^<]*<\/title>/i, `<title>${escapeHtml(title)}</title>`);
  rendered = rendered.replace(/<meta name="description"[^>]*>/i, `<meta name="description" content="${escapeHtml(description)}">`);
  rendered = rendered.replace(/<meta property="og:title"[^>]*>/i, `<meta property="og:title" content="${escapeHtml(title)}">`);
  rendered = rendered.replace(/<meta property="og:description"[^>]*>/i, `<meta property="og:description" content="${escapeHtml(description)}">`);
  rendered = rendered.replace(/<link rel="canonical"[^>]*>/i, `<link rel="canonical" href="${escapeHtml(canonical)}">`);
  rendered = rendered.replace(/<meta name="robots"[^>]*>/i, `<meta name="robots" content="${indexable && !url.searchParams.has('trade') ? 'index,follow' : 'noindex,follow'}">`);
  // The noscript summary gives crawlers and people without scripts an accurate starting point.
  if (fruitMatch && status === 200) rendered = rendered.replace('</body>', `<noscript><main><h1>${escapeHtml(title)}</h1><p>${escapeHtml(description)}</p></main></noscript></body>`);
  const headers = new Headers(source.headers); headers.set('Content-Type', 'text/html; charset=utf-8'); headers.set('X-Robots-Tag', indexable ? 'index, follow' : 'noindex, follow');
  headers.set('Cache-Control', path.startsWith('/fruit/') ? 'public, max-age=30, stale-while-revalidate=120' : 'public, max-age=300');
  return new Response(rendered, { status, headers });
}

export default {
  async fetch(request: Request, env: Env): Promise<Response> {
    try {
      const url = new URL(request.url);
      if (url.pathname === '/sitemap.xml' && request.method === 'GET') {
        const data = await getPublished(env.DB);
        const base = (env.PUBLIC_SITE_URL || url.origin).replace(/\/$/, '');
        const fixed = ['', '/values', '/calculator', '/guides', '/trading', '/about', '/privacy', '/terms', '/feedback',
          '/guides/using-the-calculator', '/guides/value-methodology', '/guides/demand-and-trading'];
        const items = data.values.filter((item) => item.enabled && (item.regularValue !== null || item.permanentValue !== null))
          .map((item) => `/fruit/${item.slug}`);
        const locations = [...fixed, ...items].map((path) => `<url><loc>${base}${path}</loc></url>`).join('');
        return new Response(`<?xml version="1.0" encoding="UTF-8"?><urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">${locations}</urlset>`, {
          headers: { 'Content-Type': 'application/xml; charset=utf-8', 'Cache-Control': 'public, max-age=300', 'X-Content-Type-Options': 'nosniff' },
        });
      }
      if (url.pathname === '/robots.txt' && request.method === 'GET') {
        const base = (env.PUBLIC_SITE_URL || url.origin).replace(/\/$/, '');
        return new Response(`User-agent: *\nAllow: /\nDisallow: /admin\nDisallow: /trading/new\nDisallow: /api/admin/\nSitemap: ${base}/sitemap.xml\n`, {
          headers: { 'Content-Type': 'text/plain; charset=utf-8', 'Cache-Control': 'public, max-age=3600' },
        });
      }
      if (url.pathname.startsWith('/api/')) return await api(request, env);
      if (request.method === 'GET' && (url.pathname === '/' || url.pathname === '/values' || url.pathname === '/calculator' || url.pathname === '/trading' || url.pathname === '/admin' || url.pathname === '/guides' || url.pathname.startsWith('/guides/') || url.pathname === '/about' || url.pathname === '/privacy' || url.pathname === '/terms' || url.pathname === '/feedback' || url.pathname.startsWith('/fruit/'))) return await seoAsset(request, env);
      if (url.pathname.includes('.')) return env.ASSETS.fetch(request);
      return seoAsset(request, env, 404);
    } catch (cause) {
      console.error('FruitForge request failed', cause instanceof Error ? cause.message : 'unknown error');
      return error('The request could not be completed. Please try again.', 500);
    }
  },
};

export { validatePatch, parseCsv, valueFromCsv };
