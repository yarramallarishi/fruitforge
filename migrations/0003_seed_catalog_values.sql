-- Generated from data/fruits.json. Existing current values are never overwritten.
-- Permanent-fruit values also populate the linked fruit's permanent_value. Unsupported source trend labels are retained in note and normalized to unknown.
INSERT OR IGNORE INTO canonical_items(id, name, slug, category, rarity, item_type, enabled, catalog_version) VALUES
  ('fruit-rocket', 'Rocket', 'rocket', 'fruit', 'Common', 'Natural', 1, 1),
  ('fruit-spin', 'Spin', 'spin', 'fruit', 'Common', 'Natural', 1, 1),
  ('fruit-blade', 'Blade', 'blade', 'fruit', 'Common', 'Natural', 1, 1),
  ('fruit-spring', 'Spring', 'spring', 'fruit', 'Common', 'Natural', 1, 1),
  ('fruit-bomb', 'Bomb', 'bomb', 'fruit', 'Common', 'Natural', 1, 1),
  ('fruit-smoke', 'Smoke', 'smoke', 'fruit', 'Common', 'Elemental', 1, 1),
  ('fruit-spike', 'Spike', 'spike', 'fruit', 'Common', 'Natural', 1, 1),
  ('fruit-flame', 'Flame', 'flame', 'fruit', 'Uncommon', 'Elemental', 1, 1),
  ('fruit-ice', 'Ice', 'ice', 'fruit', 'Uncommon', 'Elemental', 1, 1),
  ('fruit-sand', 'Sand', 'sand', 'fruit', 'Uncommon', 'Elemental', 1, 1),
  ('fruit-dark', 'Dark', 'dark', 'fruit', 'Uncommon', 'Elemental', 1, 1),
  ('fruit-eagle', 'Eagle', 'eagle', 'fruit', 'Uncommon', 'Beast', 1, 1),
  ('fruit-diamond', 'Diamond', 'diamond', 'fruit', 'Uncommon', 'Natural', 1, 1),
  ('fruit-light', 'Light', 'light', 'fruit', 'Rare', 'Elemental', 1, 1),
  ('fruit-rubber', 'Rubber', 'rubber', 'fruit', 'Rare', 'Natural', 1, 1),
  ('fruit-ghost', 'Ghost', 'ghost', 'fruit', 'Rare', 'Natural', 1, 1),
  ('fruit-magma', 'Magma', 'magma', 'fruit', 'Rare', 'Elemental', 1, 1),
  ('fruit-quake', 'Quake', 'quake', 'fruit', 'Legendary', 'Natural', 1, 1),
  ('fruit-buddha', 'Buddha', 'buddha', 'fruit', 'Legendary', 'Beast', 1, 1),
  ('fruit-love', 'Love', 'love', 'fruit', 'Legendary', 'Natural', 1, 1),
  ('fruit-creation', 'Creation', 'creation', 'fruit', 'Legendary', 'Natural', 1, 1),
  ('fruit-spider', 'Spider', 'spider', 'fruit', 'Legendary', 'Natural', 1, 1),
  ('fruit-sound', 'Sound', 'sound', 'fruit', 'Legendary', 'Natural', 1, 1),
  ('fruit-phoenix', 'Phoenix', 'phoenix', 'fruit', 'Legendary', 'Beast', 1, 1),
  ('fruit-portal', 'Portal', 'portal', 'fruit', 'Legendary', 'Natural', 1, 1),
  ('fruit-lightning', 'Lightning', 'lightning', 'fruit', 'Legendary', 'Elemental', 1, 1),
  ('fruit-pain', 'Pain', 'pain', 'fruit', 'Legendary', 'Natural', 1, 1),
  ('fruit-blizzard', 'Blizzard', 'blizzard', 'fruit', 'Legendary', 'Elemental', 1, 1),
  ('fruit-gravity', 'Gravity', 'gravity', 'fruit', 'Mythical', 'Natural', 1, 1),
  ('fruit-mammoth', 'Mammoth', 'mammoth', 'fruit', 'Mythical', 'Beast', 1, 1),
  ('fruit-t-rex', 'T-Rex', 't-rex', 'fruit', 'Mythical', 'Beast', 1, 1),
  ('fruit-dough', 'Dough', 'dough', 'fruit', 'Mythical', 'Elemental', 1, 1),
  ('fruit-shadow', 'Shadow', 'shadow', 'fruit', 'Mythical', 'Natural', 1, 1),
  ('fruit-venom', 'Venom', 'venom', 'fruit', 'Mythical', 'Natural', 1, 1),
  ('fruit-gas', 'Gas', 'gas', 'fruit', 'Mythical', 'Elemental', 1, 1),
  ('fruit-spirit', 'Spirit', 'spirit', 'fruit', 'Mythical', 'Natural', 1, 1),
  ('fruit-tiger', 'Tiger', 'tiger', 'fruit', 'Mythical', 'Beast', 1, 1),
  ('fruit-yeti', 'Yeti', 'yeti', 'fruit', 'Mythical', 'Beast', 1, 1),
  ('fruit-kitsune', 'Kitsune', 'kitsune', 'fruit', 'Mythical', 'Beast', 1, 1),
  ('fruit-control', 'Control', 'control', 'fruit', 'Mythical', 'Natural', 1, 1),
  ('fruit-dragon', 'Dragon', 'dragon', 'fruit', 'Mythical', 'Beast', 1, 1),
  ('fruit-magnet', 'Magnet', 'magnet', 'fruit', 'Mythical', 'Natural', 1, 1),
  ('perm-fruit-rocket', 'Permanent Rocket', 'perm-fruit-rocket', 'permanent-fruit', 'Common', 'Natural', 1, 1),
  ('perm-fruit-spin', 'Permanent Spin', 'perm-fruit-spin', 'permanent-fruit', 'Common', 'Natural', 1, 1),
  ('perm-fruit-blade', 'Permanent Blade', 'perm-fruit-blade', 'permanent-fruit', 'Common', 'Natural', 1, 1),
  ('perm-fruit-spring', 'Permanent Spring', 'perm-fruit-spring', 'permanent-fruit', 'Common', 'Natural', 1, 1),
  ('perm-fruit-bomb', 'Permanent Bomb', 'perm-fruit-bomb', 'permanent-fruit', 'Common', 'Natural', 1, 1),
  ('perm-fruit-smoke', 'Permanent Smoke', 'perm-fruit-smoke', 'permanent-fruit', 'Common', 'Elemental', 1, 1),
  ('perm-fruit-spike', 'Permanent Spike', 'perm-fruit-spike', 'permanent-fruit', 'Common', 'Natural', 1, 1),
  ('perm-fruit-flame', 'Permanent Flame', 'perm-fruit-flame', 'permanent-fruit', 'Uncommon', 'Elemental', 1, 1),
  ('perm-fruit-ice', 'Permanent Ice', 'perm-fruit-ice', 'permanent-fruit', 'Uncommon', 'Elemental', 1, 1),
  ('perm-fruit-sand', 'Permanent Sand', 'perm-fruit-sand', 'permanent-fruit', 'Uncommon', 'Elemental', 1, 1),
  ('perm-fruit-dark', 'Permanent Dark', 'perm-fruit-dark', 'permanent-fruit', 'Uncommon', 'Elemental', 1, 1),
  ('perm-fruit-eagle', 'Permanent Eagle', 'perm-fruit-eagle', 'permanent-fruit', 'Uncommon', 'Beast', 1, 1),
  ('perm-fruit-diamond', 'Permanent Diamond', 'perm-fruit-diamond', 'permanent-fruit', 'Uncommon', 'Natural', 1, 1),
  ('perm-fruit-light', 'Permanent Light', 'perm-fruit-light', 'permanent-fruit', 'Rare', 'Elemental', 1, 1),
  ('perm-fruit-rubber', 'Permanent Rubber', 'perm-fruit-rubber', 'permanent-fruit', 'Rare', 'Natural', 1, 1),
  ('perm-fruit-ghost', 'Permanent Ghost', 'perm-fruit-ghost', 'permanent-fruit', 'Rare', 'Natural', 1, 1),
  ('perm-fruit-magma', 'Permanent Magma', 'perm-fruit-magma', 'permanent-fruit', 'Rare', 'Elemental', 1, 1),
  ('perm-fruit-quake', 'Permanent Quake', 'perm-fruit-quake', 'permanent-fruit', 'Legendary', 'Natural', 1, 1),
  ('perm-fruit-buddha', 'Permanent Buddha', 'perm-fruit-buddha', 'permanent-fruit', 'Legendary', 'Beast', 1, 1),
  ('perm-fruit-love', 'Permanent Love', 'perm-fruit-love', 'permanent-fruit', 'Legendary', 'Natural', 1, 1),
  ('perm-fruit-creation', 'Permanent Creation', 'perm-fruit-creation', 'permanent-fruit', 'Legendary', 'Natural', 1, 1),
  ('perm-fruit-spider', 'Permanent Spider', 'perm-fruit-spider', 'permanent-fruit', 'Legendary', 'Natural', 1, 1),
  ('perm-fruit-sound', 'Permanent Sound', 'perm-fruit-sound', 'permanent-fruit', 'Legendary', 'Natural', 1, 1),
  ('perm-fruit-phoenix', 'Permanent Phoenix', 'perm-fruit-phoenix', 'permanent-fruit', 'Legendary', 'Beast', 1, 1),
  ('perm-fruit-portal', 'Permanent Portal', 'perm-fruit-portal', 'permanent-fruit', 'Legendary', 'Natural', 1, 1),
  ('perm-fruit-lightning', 'Permanent Lightning', 'perm-fruit-lightning', 'permanent-fruit', 'Legendary', 'Elemental', 1, 1),
  ('perm-fruit-pain', 'Permanent Pain', 'perm-fruit-pain', 'permanent-fruit', 'Legendary', 'Natural', 1, 1),
  ('perm-fruit-blizzard', 'Permanent Blizzard', 'perm-fruit-blizzard', 'permanent-fruit', 'Legendary', 'Elemental', 1, 1),
  ('perm-fruit-gravity', 'Permanent Gravity', 'perm-fruit-gravity', 'permanent-fruit', 'Mythical', 'Natural', 1, 1),
  ('perm-fruit-mammoth', 'Permanent Mammoth', 'perm-fruit-mammoth', 'permanent-fruit', 'Mythical', 'Beast', 1, 1),
  ('perm-fruit-t-rex', 'Permanent T-Rex', 'perm-fruit-t-rex', 'permanent-fruit', 'Mythical', 'Beast', 1, 1),
  ('perm-fruit-dough', 'Permanent Dough', 'perm-fruit-dough', 'permanent-fruit', 'Mythical', 'Elemental', 1, 1),
  ('perm-fruit-shadow', 'Permanent Shadow', 'perm-fruit-shadow', 'permanent-fruit', 'Mythical', 'Natural', 1, 1),
  ('perm-fruit-venom', 'Permanent Venom', 'perm-fruit-venom', 'permanent-fruit', 'Mythical', 'Natural', 1, 1),
  ('perm-fruit-gas', 'Permanent Gas', 'perm-fruit-gas', 'permanent-fruit', 'Mythical', 'Elemental', 1, 1),
  ('perm-fruit-spirit', 'Permanent Spirit', 'perm-fruit-spirit', 'permanent-fruit', 'Mythical', 'Natural', 1, 1),
  ('perm-fruit-tiger', 'Permanent Tiger', 'perm-fruit-tiger', 'permanent-fruit', 'Mythical', 'Beast', 1, 1),
  ('perm-fruit-yeti', 'Permanent Yeti', 'perm-fruit-yeti', 'permanent-fruit', 'Mythical', 'Beast', 1, 1),
  ('perm-fruit-kitsune', 'Permanent Kitsune', 'perm-fruit-kitsune', 'permanent-fruit', 'Mythical', 'Beast', 1, 1),
  ('perm-fruit-control', 'Permanent Control', 'perm-fruit-control', 'permanent-fruit', 'Mythical', 'Natural', 1, 1),
  ('perm-fruit-dragon', 'Permanent Dragon', 'perm-fruit-dragon', 'permanent-fruit', 'Mythical', 'Beast', 1, 1),
  ('perm-fruit-magnet', 'Permanent Magnet', 'perm-fruit-magnet', 'permanent-fruit', 'Mythical', 'Natural', 1, 1),
  ('skin-blade-lime', 'Lime Blade', 'skin-blade-lime', 'limited-skin', 'Limited', 'Skin', 1, 1),
  ('skin-bomb-nuclear', 'Nuclear Bomb', 'skin-bomb-nuclear', 'limited-skin', 'Limited', 'Skin', 1, 1),
  ('skin-bomb-thermite', 'Thermite Bomb', 'skin-bomb-thermite', 'limited-skin', 'Limited', 'Skin', 1, 1),
  ('skin-bomb-azura', 'Azura Bomb', 'skin-bomb-azura', 'limited-skin', 'Limited', 'Skin', 1, 1),
  ('skin-bomb-celebration', 'Celebration Bomb', 'skin-bomb-celebration', 'limited-skin', 'Limited', 'Skin', 1, 1),
  ('skin-diamond-emerald', 'Emerald Diamond', 'skin-diamond-emerald', 'limited-skin', 'Limited', 'Skin', 1, 1),
  ('skin-diamond-rose-quartz', 'Rose Quartz Diamond', 'skin-diamond-rose-quartz', 'limited-skin', 'Limited', 'Skin', 1, 1),
  ('skin-diamond-topaz', 'Topaz Diamond', 'skin-diamond-topaz', 'limited-skin', 'Limited', 'Skin', 1, 1),
  ('skin-diamond-ruby', 'Ruby Diamond', 'skin-diamond-ruby', 'limited-skin', 'Limited', 'Skin', 1, 1),
  ('skin-ghost-scarlet', 'Scarlet Ghost', 'skin-ghost-scarlet', 'limited-skin', 'Limited', 'Skin', 1, 1),
  ('skin-gravity-starlight', 'Starlight Gravity', 'skin-gravity-starlight', 'limited-skin', 'Limited', 'Skin', 1, 1),
  ('skin-lightning-purple', 'Purple Lightning', 'skin-lightning-purple', 'limited-skin', 'Limited', 'Skin', 1, 1),
  ('skin-lightning-yellow', 'Yellow Lightning', 'skin-lightning-yellow', 'limited-skin', 'Limited', 'Skin', 1, 1),
  ('skin-lightning-green', 'Green Lightning', 'skin-lightning-green', 'limited-skin', 'Limited', 'Skin', 1, 1),
  ('skin-lightning-red', 'Red Lightning', 'skin-lightning-red', 'limited-skin', 'Limited', 'Skin', 1, 1),
  ('skin-portal-divine', 'Divine Portal', 'skin-portal-divine', 'limited-skin', 'Limited', 'Skin', 1, 1),
  ('skin-kitsune-crimson', 'Crimson Kitsune', 'skin-kitsune-crimson', 'limited-skin', 'Limited', 'Skin', 1, 1),
  ('skin-kitsune-galaxy', 'Galaxy Empyrean Kitsune', 'skin-kitsune-galaxy', 'limited-skin', 'Limited', 'Skin', 1, 1),
  ('skin-magnet-arcsteel', 'Arcsteel Magnet', 'skin-magnet-arcsteel', 'limited-skin', 'Limited', 'Skin', 1, 1),
  ('skin-yeti-runic', 'Runic Fiend', 'skin-yeti-runic', 'limited-skin', 'Limited', 'Skin', 1, 1),
  ('gamepass-fruit-notifier', 'Fruit Notifier', 'gamepass-fruit-notifier', 'gamepass', 'Premium', 'Gamepass', 1, 1),
  ('gamepass-dark-blade', 'Dark Blade', 'gamepass-dark-blade', 'gamepass', 'Premium', 'Gamepass', 1, 1),
  ('gamepass-mythical-scrolls', 'Mythical Scrolls', 'gamepass-mythical-scrolls', 'gamepass', 'Premium', 'Gamepass', 1, 1),
  ('gamepass-legendary-scrolls', 'Legendary Scrolls', 'gamepass-legendary-scrolls', 'gamepass', 'Premium', 'Gamepass', 1, 1),
  ('gamepass-fruit-storage', '+1 Fruit Storage', 'gamepass-fruit-storage', 'gamepass', 'Premium', 'Gamepass', 1, 1),
  ('gamepass-2x-mastery', '2x Mastery', 'gamepass-2x-mastery', 'gamepass', 'Premium', 'Gamepass', 1, 1),
  ('gamepass-2x-money', '2x Money', 'gamepass-2x-money', 'gamepass', 'Premium', 'Gamepass', 1, 1),
  ('gamepass-2x-boss-drops', '2x Boss Drops', 'gamepass-2x-boss-drops', 'gamepass', 'Premium', 'Gamepass', 1, 1),
  ('gamepass-fast-boats', 'Fast Boats', 'gamepass-fast-boats', 'gamepass', 'Premium', 'Gamepass', 1, 1),
  ('limited-doghouse-frame-break', 'Doghouse (Frame Break)', 'limited-doghouse-frame-break', 'limited-asset', 'Limited', 'Limited', 1, 1),
  ('limited-rabid-dog-blade', 'Rabid Dog Blade', 'limited-rabid-dog-blade', 'limited-asset', 'Limited', 'Limited', 1, 1),
  ('limited-dog-blade', 'Dog Blade', 'limited-dog-blade', 'limited-asset', 'Limited', 'Limited', 1, 1),
  ('limited-fiend-yeti', 'Fiend Yeti', 'limited-fiend-yeti', 'limited-asset', 'Limited', 'Limited', 1, 1),
  ('limited-ember-west-dragon', 'Ember West Dragon', 'limited-ember-west-dragon', 'limited-asset', 'Limited', 'Limited', 1, 1),
  ('limited-vibe-frame-break', 'Vibe (Frame Break)', 'limited-vibe-frame-break', 'limited-asset', 'Limited', 'Limited', 1, 1),
  ('limited-runic-fiend', 'Runic Fiend', 'limited-runic-fiend', 'limited-asset', 'Limited', 'Limited', 1, 1),
  ('limited-meme-meme', 'Meme-Meme', 'limited-meme-meme', 'limited-asset', 'Limited', 'Limited', 1, 1),
  ('limited-parrot', 'Parrot', 'limited-parrot', 'limited-asset', 'Limited', 'Limited', 1, 1),
  ('limited-werewolf', 'Werewolf', 'limited-werewolf', 'limited-asset', 'Limited', 'Limited', 1, 1),
  ('limited-super-spirit-pain', 'Super Spirit Pain', 'limited-super-spirit-pain', 'limited-asset', 'Limited', 'Limited', 1, 1),
  ('limited-torment-pain', 'Torment Pain', 'limited-torment-pain', 'limited-asset', 'Limited', 'Limited', 1, 1),
  ('limited-sadness-pain', 'Sadness Pain', 'limited-sadness-pain', 'limited-asset', 'Limited', 'Limited', 1, 1),
  ('limited-frustration-pain', 'Frustration Pain', 'limited-frustration-pain', 'limited-asset', 'Limited', 'Limited', 1, 1),
  ('limited-celestial-pain', 'Celestial Pain', 'limited-celestial-pain', 'limited-asset', 'Limited', 'Limited', 1, 1),
  ('limited-eagle-requiem', 'Eagle Requiem', 'limited-eagle-requiem', 'limited-asset', 'Limited', 'Limited', 1, 1),
  ('limited-eagle-glacier', 'Eagle Glacier', 'limited-eagle-glacier', 'limited-asset', 'Limited', 'Limited', 1, 1),
  ('limited-eagle-matrix', 'Eagle Matrix', 'limited-eagle-matrix', 'limited-asset', 'Limited', 'Limited', 1, 1);

INSERT INTO published_datasets(version, published_by, published_at, item_count, changes_json)
SELECT COALESCE(MAX(version), 0) + 1, 'catalog-seed', CURRENT_TIMESTAMP,
  (SELECT COUNT(*) FROM (SELECT 'fruit-rocket' AS id, 5000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-spin' AS id, 7500 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-blade' AS id, 50000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-spring' AS id, 60000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-bomb' AS id, 80000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-smoke' AS id, 100000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-spike' AS id, 180000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-flame' AS id, 250000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-ice' AS id, 550000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-sand' AS id, 420000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-dark' AS id, 400000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-eagle' AS id, 800000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-diamond' AS id, 1000000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-light' AS id, 800000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-rubber' AS id, 700000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-ghost' AS id, 800000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Underpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-magma' AS id, 1150000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Overpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-quake' AS id, 1000000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-buddha' AS id, 10000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Overpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-love' AS id, 1500000 AS regular_value, NULL AS permanent_value, 3 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-creation' AS id, 2500000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-spider' AS id, 1500000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-sound' AS id, 2500000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-phoenix' AS id, 2750000 AS regular_value, NULL AS permanent_value, 3 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-portal' AS id, 10000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Overpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-lightning' AS id, 30000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-pain' AS id, 10000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-blizzard' AS id, 5000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-gravity' AS id, 10000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-mammoth' AS id, 10000000 AS regular_value, 4100000000 AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 4100000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-t-rex' AS id, 20000000 AS regular_value, NULL AS permanent_value, 8 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-dough' AS id, 30000000 AS regular_value, 4100000000 AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Overpaid. Permanent value 4100000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-shadow' AS id, 6500000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-venom' AS id, 25000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-gas' AS id, 60000000 AS regular_value, 4520000000 AS permanent_value, 9 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 4520000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-spirit' AS id, 10000000 AS regular_value, 4520000000 AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 4520000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-tiger' AS id, 100000000 AS regular_value, 5150000000 AS permanent_value, 8 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 5150000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-yeti' AS id, 90000000 AS regular_value, 5150000000 AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 5150000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-kitsune' AS id, 540000000 AS regular_value, 5980000000 AS permanent_value, 10 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 5980000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-control' AS id, 120000000 AS regular_value, 5980000000 AS permanent_value, 8 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 5980000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-dragon' AS id, NULL AS regular_value, 6900000000 AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Unrated. Permanent value 6900000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-magnet' AS id, 570000000 AS regular_value, 4890000000 AS permanent_value, 7 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Unstable. Permanent value 4890000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-mammoth' AS id, 4100000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-dough' AS id, 4100000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-gas' AS id, 4520000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-spirit' AS id, 4520000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-tiger' AS id, 5150000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-yeti' AS id, 5150000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-kitsune' AS id, 5980000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-control' AS id, 5980000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-dragon' AS id, 6900000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-magnet' AS id, 4890000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-blade-lime' AS id, 10000000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-bomb-nuclear' AS id, 540000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-bomb-thermite' AS id, 510000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-bomb-azura' AS id, 570000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-bomb-celebration' AS id, 10000000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-diamond-emerald' AS id, 180000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-diamond-rose-quartz' AS id, 240000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-diamond-topaz' AS id, 10000000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-diamond-ruby' AS id, 110000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-ghost-scarlet' AS id, 20000000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-gravity-starlight' AS id, 420000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-lightning-purple' AS id, 4860000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-lightning-yellow' AS id, 150000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-lightning-green' AS id, 270000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-lightning-red' AS id, 2340000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-portal-divine' AS id, 2610000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Overpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-kitsune-crimson' AS id, 7860000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-kitsune-galaxy' AS id, 9750000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-magnet-arcsteel' AS id, 2820000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-yeti-runic' AS id, 1800000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'gamepass-fruit-notifier' AS id, 3410000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-dark-blade' AS id, 900000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-mythical-scrolls' AS id, 1340000000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-legendary-scrolls' AS id, 570000000 AS regular_value, NULL AS permanent_value, 3 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-fruit-storage' AS id, 360000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-2x-mastery' AS id, 390000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-2x-money' AS id, 390000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-2x-boss-drops' AS id, 240000000 AS regular_value, NULL AS permanent_value, 8 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-fast-boats' AS id, 240000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'limited-doghouse-frame-break' AS id, 17670000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend SOON' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-rabid-dog-blade' AS id, 26670000000 AS regular_value, NULL AS permanent_value, 8 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend SOON' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-dog-blade' AS id, 1800000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Overpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-fiend-yeti' AS id, 1260000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-ember-west-dragon' AS id, 6780000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-vibe-frame-break' AS id, 14370000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Unstable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-runic-fiend' AS id, 1800000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-meme-meme' AS id, 6240000000 AS regular_value, NULL AS permanent_value, 8 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-parrot' AS id, 7590000000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-werewolf' AS id, 1320000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-super-spirit-pain' AS id, 2700000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-torment-pain' AS id, 110000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-sadness-pain' AS id, 540000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-frustration-pain' AS id, 540000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-celestial-pain' AS id, 690000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-eagle-requiem' AS id, 210000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-eagle-glacier' AS id, 20000000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-eagle-matrix' AS id, 390000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed) AS seed WHERE (seed.regular_value IS NOT NULL OR seed.permanent_value IS NOT NULL OR seed.demand IS NOT NULL OR seed.trend <> 'unknown') AND NOT EXISTS (SELECT 1 FROM current_values AS existing WHERE existing.fruit_id = seed.id)),
  COALESCE((SELECT json_group_array(json_object('id', seed.id, 'regularValue', seed.regular_value, 'permanentValue', seed.permanent_value)) FROM (SELECT 'fruit-rocket' AS id, 5000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-spin' AS id, 7500 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-blade' AS id, 50000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-spring' AS id, 60000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-bomb' AS id, 80000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-smoke' AS id, 100000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-spike' AS id, 180000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-flame' AS id, 250000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-ice' AS id, 550000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-sand' AS id, 420000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-dark' AS id, 400000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-eagle' AS id, 800000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-diamond' AS id, 1000000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-light' AS id, 800000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-rubber' AS id, 700000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-ghost' AS id, 800000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Underpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-magma' AS id, 1150000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Overpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-quake' AS id, 1000000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-buddha' AS id, 10000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Overpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-love' AS id, 1500000 AS regular_value, NULL AS permanent_value, 3 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-creation' AS id, 2500000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-spider' AS id, 1500000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-sound' AS id, 2500000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-phoenix' AS id, 2750000 AS regular_value, NULL AS permanent_value, 3 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-portal' AS id, 10000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Overpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-lightning' AS id, 30000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-pain' AS id, 10000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-blizzard' AS id, 5000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-gravity' AS id, 10000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-mammoth' AS id, 10000000 AS regular_value, 4100000000 AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 4100000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-t-rex' AS id, 20000000 AS regular_value, NULL AS permanent_value, 8 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-dough' AS id, 30000000 AS regular_value, 4100000000 AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Overpaid. Permanent value 4100000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-shadow' AS id, 6500000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-venom' AS id, 25000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-gas' AS id, 60000000 AS regular_value, 4520000000 AS permanent_value, 9 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 4520000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-spirit' AS id, 10000000 AS regular_value, 4520000000 AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 4520000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-tiger' AS id, 100000000 AS regular_value, 5150000000 AS permanent_value, 8 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 5150000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-yeti' AS id, 90000000 AS regular_value, 5150000000 AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 5150000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-kitsune' AS id, 540000000 AS regular_value, 5980000000 AS permanent_value, 10 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 5980000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-control' AS id, 120000000 AS regular_value, 5980000000 AS permanent_value, 8 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 5980000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-dragon' AS id, NULL AS regular_value, 6900000000 AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Unrated. Permanent value 6900000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-magnet' AS id, 570000000 AS regular_value, 4890000000 AS permanent_value, 7 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Unstable. Permanent value 4890000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-mammoth' AS id, 4100000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-dough' AS id, 4100000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-gas' AS id, 4520000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-spirit' AS id, 4520000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-tiger' AS id, 5150000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-yeti' AS id, 5150000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-kitsune' AS id, 5980000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-control' AS id, 5980000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-dragon' AS id, 6900000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-magnet' AS id, 4890000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-blade-lime' AS id, 10000000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-bomb-nuclear' AS id, 540000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-bomb-thermite' AS id, 510000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-bomb-azura' AS id, 570000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-bomb-celebration' AS id, 10000000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-diamond-emerald' AS id, 180000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-diamond-rose-quartz' AS id, 240000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-diamond-topaz' AS id, 10000000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-diamond-ruby' AS id, 110000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-ghost-scarlet' AS id, 20000000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-gravity-starlight' AS id, 420000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-lightning-purple' AS id, 4860000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-lightning-yellow' AS id, 150000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-lightning-green' AS id, 270000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-lightning-red' AS id, 2340000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-portal-divine' AS id, 2610000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Overpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-kitsune-crimson' AS id, 7860000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-kitsune-galaxy' AS id, 9750000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-magnet-arcsteel' AS id, 2820000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-yeti-runic' AS id, 1800000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'gamepass-fruit-notifier' AS id, 3410000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-dark-blade' AS id, 900000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-mythical-scrolls' AS id, 1340000000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-legendary-scrolls' AS id, 570000000 AS regular_value, NULL AS permanent_value, 3 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-fruit-storage' AS id, 360000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-2x-mastery' AS id, 390000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-2x-money' AS id, 390000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-2x-boss-drops' AS id, 240000000 AS regular_value, NULL AS permanent_value, 8 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-fast-boats' AS id, 240000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'limited-doghouse-frame-break' AS id, 17670000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend SOON' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-rabid-dog-blade' AS id, 26670000000 AS regular_value, NULL AS permanent_value, 8 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend SOON' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-dog-blade' AS id, 1800000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Overpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-fiend-yeti' AS id, 1260000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-ember-west-dragon' AS id, 6780000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-vibe-frame-break' AS id, 14370000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Unstable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-runic-fiend' AS id, 1800000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-meme-meme' AS id, 6240000000 AS regular_value, NULL AS permanent_value, 8 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-parrot' AS id, 7590000000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-werewolf' AS id, 1320000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-super-spirit-pain' AS id, 2700000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-torment-pain' AS id, 110000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-sadness-pain' AS id, 540000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-frustration-pain' AS id, 540000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-celestial-pain' AS id, 690000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-eagle-requiem' AS id, 210000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-eagle-glacier' AS id, 20000000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-eagle-matrix' AS id, 390000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed) AS seed WHERE (seed.regular_value IS NOT NULL OR seed.permanent_value IS NOT NULL OR seed.demand IS NOT NULL OR seed.trend <> 'unknown') AND NOT EXISTS (SELECT 1 FROM current_values AS existing WHERE existing.fruit_id = seed.id)), '[]')
FROM published_datasets
HAVING (SELECT COUNT(*) FROM (SELECT 'fruit-rocket' AS id, 5000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-spin' AS id, 7500 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-blade' AS id, 50000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-spring' AS id, 60000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-bomb' AS id, 80000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-smoke' AS id, 100000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-spike' AS id, 180000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-flame' AS id, 250000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-ice' AS id, 550000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-sand' AS id, 420000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-dark' AS id, 400000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-eagle' AS id, 800000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-diamond' AS id, 1000000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-light' AS id, 800000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-rubber' AS id, 700000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-ghost' AS id, 800000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Underpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-magma' AS id, 1150000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Overpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-quake' AS id, 1000000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-buddha' AS id, 10000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Overpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-love' AS id, 1500000 AS regular_value, NULL AS permanent_value, 3 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-creation' AS id, 2500000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-spider' AS id, 1500000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-sound' AS id, 2500000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-phoenix' AS id, 2750000 AS regular_value, NULL AS permanent_value, 3 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-portal' AS id, 10000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Overpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-lightning' AS id, 30000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-pain' AS id, 10000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-blizzard' AS id, 5000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-gravity' AS id, 10000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-mammoth' AS id, 10000000 AS regular_value, 4100000000 AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 4100000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-t-rex' AS id, 20000000 AS regular_value, NULL AS permanent_value, 8 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-dough' AS id, 30000000 AS regular_value, 4100000000 AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Overpaid. Permanent value 4100000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-shadow' AS id, 6500000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-venom' AS id, 25000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-gas' AS id, 60000000 AS regular_value, 4520000000 AS permanent_value, 9 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 4520000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-spirit' AS id, 10000000 AS regular_value, 4520000000 AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 4520000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-tiger' AS id, 100000000 AS regular_value, 5150000000 AS permanent_value, 8 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 5150000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-yeti' AS id, 90000000 AS regular_value, 5150000000 AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 5150000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-kitsune' AS id, 540000000 AS regular_value, 5980000000 AS permanent_value, 10 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 5980000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-control' AS id, 120000000 AS regular_value, 5980000000 AS permanent_value, 8 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 5980000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-dragon' AS id, NULL AS regular_value, 6900000000 AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Unrated. Permanent value 6900000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-magnet' AS id, 570000000 AS regular_value, 4890000000 AS permanent_value, 7 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Unstable. Permanent value 4890000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-mammoth' AS id, 4100000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-dough' AS id, 4100000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-gas' AS id, 4520000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-spirit' AS id, 4520000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-tiger' AS id, 5150000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-yeti' AS id, 5150000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-kitsune' AS id, 5980000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-control' AS id, 5980000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-dragon' AS id, 6900000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-magnet' AS id, 4890000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-blade-lime' AS id, 10000000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-bomb-nuclear' AS id, 540000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-bomb-thermite' AS id, 510000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-bomb-azura' AS id, 570000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-bomb-celebration' AS id, 10000000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-diamond-emerald' AS id, 180000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-diamond-rose-quartz' AS id, 240000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-diamond-topaz' AS id, 10000000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-diamond-ruby' AS id, 110000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-ghost-scarlet' AS id, 20000000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-gravity-starlight' AS id, 420000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-lightning-purple' AS id, 4860000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-lightning-yellow' AS id, 150000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-lightning-green' AS id, 270000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-lightning-red' AS id, 2340000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-portal-divine' AS id, 2610000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Overpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-kitsune-crimson' AS id, 7860000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-kitsune-galaxy' AS id, 9750000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-magnet-arcsteel' AS id, 2820000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-yeti-runic' AS id, 1800000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'gamepass-fruit-notifier' AS id, 3410000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-dark-blade' AS id, 900000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-mythical-scrolls' AS id, 1340000000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-legendary-scrolls' AS id, 570000000 AS regular_value, NULL AS permanent_value, 3 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-fruit-storage' AS id, 360000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-2x-mastery' AS id, 390000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-2x-money' AS id, 390000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-2x-boss-drops' AS id, 240000000 AS regular_value, NULL AS permanent_value, 8 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-fast-boats' AS id, 240000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'limited-doghouse-frame-break' AS id, 17670000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend SOON' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-rabid-dog-blade' AS id, 26670000000 AS regular_value, NULL AS permanent_value, 8 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend SOON' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-dog-blade' AS id, 1800000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Overpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-fiend-yeti' AS id, 1260000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-ember-west-dragon' AS id, 6780000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-vibe-frame-break' AS id, 14370000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Unstable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-runic-fiend' AS id, 1800000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-meme-meme' AS id, 6240000000 AS regular_value, NULL AS permanent_value, 8 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-parrot' AS id, 7590000000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-werewolf' AS id, 1320000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-super-spirit-pain' AS id, 2700000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-torment-pain' AS id, 110000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-sadness-pain' AS id, 540000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-frustration-pain' AS id, 540000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-celestial-pain' AS id, 690000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-eagle-requiem' AS id, 210000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-eagle-glacier' AS id, 20000000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-eagle-matrix' AS id, 390000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed) AS seed WHERE (seed.regular_value IS NOT NULL OR seed.permanent_value IS NOT NULL OR seed.demand IS NOT NULL OR seed.trend <> 'unknown') AND NOT EXISTS (SELECT 1 FROM current_values AS existing WHERE existing.fruit_id = seed.id)) > 0;

INSERT INTO value_history(fruit_id, dataset_version, previous_regular_value, regular_value, previous_permanent_value, permanent_value, previous_demand, demand, previous_trend, trend, previous_confidence, confidence, previous_note, note, changed_by, changed_at)
SELECT seed.id, (SELECT MAX(version) FROM published_datasets), NULL, seed.regular_value, NULL, seed.permanent_value, NULL, seed.demand, NULL, seed.trend, NULL, seed.confidence, NULL, seed.note, 'catalog-seed', CURRENT_TIMESTAMP
FROM (SELECT 'fruit-rocket' AS id, 5000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-spin' AS id, 7500 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-blade' AS id, 50000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-spring' AS id, 60000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-bomb' AS id, 80000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-smoke' AS id, 100000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-spike' AS id, 180000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-flame' AS id, 250000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-ice' AS id, 550000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-sand' AS id, 420000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-dark' AS id, 400000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-eagle' AS id, 800000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-diamond' AS id, 1000000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-light' AS id, 800000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-rubber' AS id, 700000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-ghost' AS id, 800000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Underpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-magma' AS id, 1150000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Overpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-quake' AS id, 1000000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-buddha' AS id, 10000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Overpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-love' AS id, 1500000 AS regular_value, NULL AS permanent_value, 3 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-creation' AS id, 2500000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-spider' AS id, 1500000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-sound' AS id, 2500000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-phoenix' AS id, 2750000 AS regular_value, NULL AS permanent_value, 3 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-portal' AS id, 10000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Overpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-lightning' AS id, 30000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-pain' AS id, 10000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-blizzard' AS id, 5000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-gravity' AS id, 10000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-mammoth' AS id, 10000000 AS regular_value, 4100000000 AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 4100000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-t-rex' AS id, 20000000 AS regular_value, NULL AS permanent_value, 8 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-dough' AS id, 30000000 AS regular_value, 4100000000 AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Overpaid. Permanent value 4100000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-shadow' AS id, 6500000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-venom' AS id, 25000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-gas' AS id, 60000000 AS regular_value, 4520000000 AS permanent_value, 9 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 4520000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-spirit' AS id, 10000000 AS regular_value, 4520000000 AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 4520000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-tiger' AS id, 100000000 AS regular_value, 5150000000 AS permanent_value, 8 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 5150000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-yeti' AS id, 90000000 AS regular_value, 5150000000 AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 5150000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-kitsune' AS id, 540000000 AS regular_value, 5980000000 AS permanent_value, 10 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 5980000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-control' AS id, 120000000 AS regular_value, 5980000000 AS permanent_value, 8 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 5980000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-dragon' AS id, NULL AS regular_value, 6900000000 AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Unrated. Permanent value 6900000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-magnet' AS id, 570000000 AS regular_value, 4890000000 AS permanent_value, 7 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Unstable. Permanent value 4890000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-mammoth' AS id, 4100000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-dough' AS id, 4100000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-gas' AS id, 4520000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-spirit' AS id, 4520000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-tiger' AS id, 5150000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-yeti' AS id, 5150000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-kitsune' AS id, 5980000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-control' AS id, 5980000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-dragon' AS id, 6900000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-magnet' AS id, 4890000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-blade-lime' AS id, 10000000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-bomb-nuclear' AS id, 540000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-bomb-thermite' AS id, 510000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-bomb-azura' AS id, 570000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-bomb-celebration' AS id, 10000000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-diamond-emerald' AS id, 180000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-diamond-rose-quartz' AS id, 240000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-diamond-topaz' AS id, 10000000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-diamond-ruby' AS id, 110000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-ghost-scarlet' AS id, 20000000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-gravity-starlight' AS id, 420000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-lightning-purple' AS id, 4860000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-lightning-yellow' AS id, 150000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-lightning-green' AS id, 270000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-lightning-red' AS id, 2340000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-portal-divine' AS id, 2610000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Overpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-kitsune-crimson' AS id, 7860000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-kitsune-galaxy' AS id, 9750000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-magnet-arcsteel' AS id, 2820000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-yeti-runic' AS id, 1800000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'gamepass-fruit-notifier' AS id, 3410000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-dark-blade' AS id, 900000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-mythical-scrolls' AS id, 1340000000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-legendary-scrolls' AS id, 570000000 AS regular_value, NULL AS permanent_value, 3 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-fruit-storage' AS id, 360000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-2x-mastery' AS id, 390000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-2x-money' AS id, 390000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-2x-boss-drops' AS id, 240000000 AS regular_value, NULL AS permanent_value, 8 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-fast-boats' AS id, 240000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'limited-doghouse-frame-break' AS id, 17670000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend SOON' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-rabid-dog-blade' AS id, 26670000000 AS regular_value, NULL AS permanent_value, 8 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend SOON' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-dog-blade' AS id, 1800000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Overpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-fiend-yeti' AS id, 1260000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-ember-west-dragon' AS id, 6780000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-vibe-frame-break' AS id, 14370000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Unstable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-runic-fiend' AS id, 1800000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-meme-meme' AS id, 6240000000 AS regular_value, NULL AS permanent_value, 8 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-parrot' AS id, 7590000000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-werewolf' AS id, 1320000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-super-spirit-pain' AS id, 2700000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-torment-pain' AS id, 110000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-sadness-pain' AS id, 540000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-frustration-pain' AS id, 540000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-celestial-pain' AS id, 690000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-eagle-requiem' AS id, 210000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-eagle-glacier' AS id, 20000000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-eagle-matrix' AS id, 390000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed) AS seed
WHERE (seed.regular_value IS NOT NULL OR seed.permanent_value IS NOT NULL OR seed.demand IS NOT NULL OR seed.trend <> 'unknown') AND NOT EXISTS (SELECT 1 FROM current_values AS existing WHERE existing.fruit_id = seed.id);

INSERT OR IGNORE INTO current_values(fruit_id, regular_value, permanent_value, demand, trend, confidence, note, last_updated, last_published, dataset_version)
SELECT seed.id, seed.regular_value, seed.permanent_value, seed.demand, seed.trend, seed.confidence, seed.note, seed.observed, seed.observed, (SELECT MAX(version) FROM published_datasets)
FROM (SELECT 'fruit-rocket' AS id, 5000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-spin' AS id, 7500 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-blade' AS id, 50000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-spring' AS id, 60000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-bomb' AS id, 80000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-smoke' AS id, 100000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-spike' AS id, 180000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-flame' AS id, 250000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-ice' AS id, 550000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-sand' AS id, 420000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-dark' AS id, 400000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-eagle' AS id, 800000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-diamond' AS id, 1000000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-light' AS id, 800000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-rubber' AS id, 700000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-ghost' AS id, 800000 AS regular_value, NULL AS permanent_value, 1 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Underpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-magma' AS id, 1150000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Overpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-quake' AS id, 1000000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-buddha' AS id, 10000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Overpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-love' AS id, 1500000 AS regular_value, NULL AS permanent_value, 3 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-creation' AS id, 2500000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-spider' AS id, 1500000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-sound' AS id, 2500000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-phoenix' AS id, 2750000 AS regular_value, NULL AS permanent_value, 3 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-portal' AS id, 10000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Overpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-lightning' AS id, 30000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-pain' AS id, 10000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-blizzard' AS id, 5000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-gravity' AS id, 10000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-mammoth' AS id, 10000000 AS regular_value, 4100000000 AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 4100000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-t-rex' AS id, 20000000 AS regular_value, NULL AS permanent_value, 8 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-dough' AS id, 30000000 AS regular_value, 4100000000 AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Overpaid. Permanent value 4100000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-shadow' AS id, 6500000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-venom' AS id, 25000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-gas' AS id, 60000000 AS regular_value, 4520000000 AS permanent_value, 9 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 4520000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-spirit' AS id, 10000000 AS regular_value, 4520000000 AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 4520000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-tiger' AS id, 100000000 AS regular_value, 5150000000 AS permanent_value, 8 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 5150000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-yeti' AS id, 90000000 AS regular_value, 5150000000 AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 5150000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-kitsune' AS id, 540000000 AS regular_value, 5980000000 AS permanent_value, 10 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 5980000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-control' AS id, 120000000 AS regular_value, 5980000000 AS permanent_value, 8 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Stable. Permanent value 5980000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-dragon' AS id, NULL AS regular_value, 6900000000 AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Unrated. Permanent value 6900000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'fruit-magnet' AS id, 570000000 AS regular_value, 4890000000 AS permanent_value, 7 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/fruits; observed 2026-10-17; unit community-trading-value; source trend Unstable. Permanent value 4890000000; source: BFFR community values where quote was available; otherwise null; observed 2026-10-17' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-mammoth' AS id, 4100000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-dough' AS id, 4100000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-gas' AS id, 4520000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-spirit' AS id, 4520000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-tiger' AS id, 5150000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-yeti' AS id, 5150000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-kitsune' AS id, 5980000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-control' AS id, 5980000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-dragon' AS id, 6900000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'perm-fruit-magnet' AS id, 4890000000 AS regular_value, NULL AS permanent_value, NULL AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: BFFR community values where quote was available; otherwise null; observed 2026-10-17; unit community-trading-value' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-blade-lime' AS id, 10000000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-bomb-nuclear' AS id, 540000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-bomb-thermite' AS id, 510000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-bomb-azura' AS id, 570000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-bomb-celebration' AS id, 10000000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-diamond-emerald' AS id, 180000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-diamond-rose-quartz' AS id, 240000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-diamond-topaz' AS id, 10000000 AS regular_value, NULL AS permanent_value, 2 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-diamond-ruby' AS id, 110000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-ghost-scarlet' AS id, 20000000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-gravity-starlight' AS id, 420000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-lightning-purple' AS id, 4860000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-lightning-yellow' AS id, 150000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-lightning-green' AS id, 270000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-lightning-red' AS id, 2340000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-portal-divine' AS id, 2610000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Overpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-kitsune-crimson' AS id, 7860000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-kitsune-galaxy' AS id, 9750000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-magnet-arcsteel' AS id, 2820000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'skin-yeti-runic' AS id, 1800000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'gamepass-fruit-notifier' AS id, 3410000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-dark-blade' AS id, 900000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-mythical-scrolls' AS id, 1340000000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-legendary-scrolls' AS id, 570000000 AS regular_value, NULL AS permanent_value, 3 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-fruit-storage' AS id, 360000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-2x-mastery' AS id, 390000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-2x-money' AS id, 390000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-2x-boss-drops' AS id, 240000000 AS regular_value, NULL AS permanent_value, 8 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'gamepass-fast-boats' AS id, 240000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/gamepasses; observed 2026-10-15; unit community-trading-value' AS note, '2026-10-15' AS observed
UNION ALL
SELECT 'limited-doghouse-frame-break' AS id, 17670000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend SOON' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-rabid-dog-blade' AS id, 26670000000 AS regular_value, NULL AS permanent_value, 8 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend SOON' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-dog-blade' AS id, 1800000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Overpaid' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-fiend-yeti' AS id, 1260000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-ember-west-dragon' AS id, 6780000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-vibe-frame-break' AS id, 14370000000 AS regular_value, NULL AS permanent_value, 9 AS demand, 'unknown' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Unstable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-runic-fiend' AS id, 1800000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-meme-meme' AS id, 6240000000 AS regular_value, NULL AS permanent_value, 8 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-parrot' AS id, 7590000000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-werewolf' AS id, 1320000000 AS regular_value, NULL AS permanent_value, 10 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-super-spirit-pain' AS id, 2700000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-torment-pain' AS id, 110000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-sadness-pain' AS id, 540000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-frustration-pain' AS id, 540000000 AS regular_value, NULL AS permanent_value, 5 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-celestial-pain' AS id, 690000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-eagle-requiem' AS id, 210000000 AS regular_value, NULL AS permanent_value, 6 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-eagle-glacier' AS id, 20000000 AS regular_value, NULL AS permanent_value, 4 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed
UNION ALL
SELECT 'limited-eagle-matrix' AS id, 390000000 AS regular_value, NULL AS permanent_value, 7 AS demand, 'stable' AS trend, 'unrated' AS confidence, 'Source: bloxfruitsvalues.net/values/limiteds; observed 2026-10-17; unit community-trading-value; source trend Stable' AS note, '2026-10-17' AS observed) AS seed
WHERE (seed.regular_value IS NOT NULL OR seed.permanent_value IS NOT NULL OR seed.demand IS NOT NULL OR seed.trend <> 'unknown') AND NOT EXISTS (SELECT 1 FROM current_values AS existing WHERE existing.fruit_id = seed.id);
