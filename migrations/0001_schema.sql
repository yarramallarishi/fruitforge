PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS canonical_items (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  category TEXT NOT NULL,
  rarity TEXT,
  item_type TEXT,
  enabled INTEGER NOT NULL DEFAULT 1 CHECK (enabled IN (0, 1)),
  catalog_version INTEGER NOT NULL DEFAULT 1,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS current_values (
  fruit_id TEXT PRIMARY KEY REFERENCES canonical_items(id),
  regular_value REAL CHECK (regular_value IS NULL OR regular_value >= 0),
  permanent_value REAL CHECK (permanent_value IS NULL OR permanent_value >= 0),
  demand INTEGER CHECK (demand IS NULL OR (demand BETWEEN 1 AND 10)),
  trend TEXT NOT NULL DEFAULT 'unknown' CHECK (trend IN ('rising', 'falling', 'stable', 'unknown')),
  confidence TEXT NOT NULL DEFAULT 'unrated' CHECK (confidence IN ('high', 'medium', 'low', 'unrated')),
  note TEXT,
  last_updated TEXT,
  last_published TEXT,
  dataset_version INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS draft_values (
  fruit_id TEXT PRIMARY KEY REFERENCES canonical_items(id),
  regular_value REAL CHECK (regular_value IS NULL OR regular_value >= 0),
  permanent_value REAL CHECK (permanent_value IS NULL OR permanent_value >= 0),
  demand INTEGER CHECK (demand IS NULL OR (demand BETWEEN 1 AND 10)),
  trend TEXT NOT NULL DEFAULT 'unknown' CHECK (trend IN ('rising', 'falling', 'stable', 'unknown')),
  confidence TEXT NOT NULL DEFAULT 'unrated' CHECK (confidence IN ('high', 'medium', 'low', 'unrated')),
  note TEXT,
  updated_by TEXT NOT NULL,
  updated_at TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS published_datasets (
  version INTEGER PRIMARY KEY,
  published_by TEXT,
  published_at TEXT NOT NULL,
  item_count INTEGER NOT NULL DEFAULT 0,
  changes_json TEXT NOT NULL DEFAULT '[]'
);

CREATE TABLE IF NOT EXISTS value_history (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  fruit_id TEXT NOT NULL REFERENCES canonical_items(id),
  dataset_version INTEGER NOT NULL REFERENCES published_datasets(version),
  previous_regular_value REAL,
  regular_value REAL,
  previous_permanent_value REAL,
  permanent_value REAL,
  previous_demand INTEGER,
  demand INTEGER,
  previous_trend TEXT,
  trend TEXT,
  previous_confidence TEXT,
  confidence TEXT,
  previous_note TEXT,
  note TEXT,
  changed_by TEXT NOT NULL,
  changed_at TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_value_history_fruit_version ON value_history(fruit_id, dataset_version DESC);

CREATE TABLE IF NOT EXISTS administrators (
  email TEXT PRIMARY KEY,
  first_seen_at TEXT NOT NULL,
  last_seen_at TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS audit_logs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  admin_email TEXT NOT NULL,
  action TEXT NOT NULL,
  affected_ids_json TEXT NOT NULL DEFAULT '[]',
  details_json TEXT NOT NULL DEFAULT '{}',
  created_at TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_audit_logs_created ON audit_logs(created_at DESC);

CREATE TABLE IF NOT EXISTS trade_listings (
  id TEXT PRIMARY KEY,
  offer_json TEXT NOT NULL,
  wanted_json TEXT NOT NULL,
  contact TEXT NOT NULL DEFAULT '',
  note TEXT NOT NULL DEFAULT '',
  owner_token_hash TEXT NOT NULL,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,
  expires_at TEXT NOT NULL,
  active INTEGER NOT NULL DEFAULT 1 CHECK (active IN (0, 1))
);
CREATE INDEX IF NOT EXISTS idx_trade_listings_active_created ON trade_listings(active, created_at DESC);

CREATE TABLE IF NOT EXISTS reports (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  trade_id TEXT NOT NULL REFERENCES trade_listings(id),
  reason TEXT NOT NULL,
  detail TEXT NOT NULL DEFAULT '',
  status TEXT NOT NULL DEFAULT 'open' CHECK (status IN ('open', 'resolved', 'dismissed')),
  created_at TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS feedback (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  category TEXT NOT NULL,
  message TEXT NOT NULL,
  created_at TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS submission_windows (
  key_hash TEXT NOT NULL,
  action TEXT NOT NULL,
  window_started INTEGER NOT NULL,
  count INTEGER NOT NULL,
  PRIMARY KEY(key_hash, action)
);

INSERT OR IGNORE INTO published_datasets(version, published_by, published_at, item_count, changes_json)
VALUES (0, NULL, CURRENT_TIMESTAMP, 0, '[]');
