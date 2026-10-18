# Canonical catalog provenance

Catalog version 1 is scoped to the ordinary fruit names listed as current in the Blox Fruits experience, including the new Magnet fruit. The standard catalog does not include separate fruit mutations, Dragon variants, skins, retired names, event-only lookalikes, or administrator-only items.

The primary name check is the [Blox Fruits experience page on Roblox](https://www.roblox.com/games/2753915549/Blox-Fruits), published by Gamer Robot Inc. Its current description lists the fruits and was updated October 11, 2026. It lists 42 fruit names. This manifest was checked on October 17, 2026.

Rarity and type labels in `fruits.json` are reference metadata, not a market quote. They were cross-checked against the community-maintained [Blox Fruits Wiki rarity pages](https://blox-fruits-wiki.com/wiki/rarities/) and [fruit pages](https://bloxfruitswiki.org/wiki/magnet/). Community wiki content is not managed by the game developer. Recheck metadata when game content changes.

The seed intentionally contains **no regular or permanent trading values**. Editors should only publish market estimates after their own review. Do not treat Beli or Robux shop prices as trading values.

IDs are internal permanent keys (`fruit-<slug>`). Once an ID has been published, do not rename or reuse it. To retire an entry, set `enabled` to `false`; keep its record and historical value rows. For additions, update this file, increment catalog metadata when appropriate, regenerate the seed migration, and review the catalog migration before release.
