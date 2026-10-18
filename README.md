# FruitForge

FruitForge is a full-stack, mobile-ready Blox Fruits values reference, trade calculator, and community trading hub. The public site and API deploy together as one Cloudflare Worker with static assets and a D1 database.

The catalog contains **131 entries** across fruits, permanent fruits, gamepasses, limited assets, and fruit skins. Trading estimates and source metadata are maintained in `data/fruits.json`; Beli and Robux shop prices remain separate and are never used as trading values. D1 seeds available estimates from that file without overwriting existing values. Administrators can review and publish later changes through the values manager.

## What is included

- A version-controlled catalog in `data/fruits.json`, with stable `fruit-<slug>` IDs and read-only names.
- A browser-local trade calculator with quantities, missing-value handling, fairness tolerance, recent trades, copy/share links, undo, swapping, and print layout.
- Searchable fruit values, item detail pages, history, filters, favorites, value guides, privacy/terms pages, and a public sitemap.
- A protected values manager with drafts, validation, bulk CSV import/export, review preview, atomic publication, audit history, and draft-based rollback.
- A community trading hub with server-validated listings, owner-key edit/removal, age and fruit filters, abuse reports, moderation, and feedback inbox.
- Cloudflare Worker API, D1 schema migrations, a catalog seed migration, and a GitHub Actions deployment workflow for the `main` branch.
- Unit tests for catalog invariants, calculator behavior, server-side field validation, CSV parsing, and denied admin access.

Fruit thumbnails are original, generated visual tokens rather than game artwork. No game assets or reference-site copy are bundled.

## Requirements

- Node.js 22.12 or newer and npm.
- A Cloudflare account with Workers and D1 enabled for deployment.
- A GitHub repository if you want the included push-to-deploy workflow.

Install the packages and run the source checks:

```sh
npm ci
npm test
npm run build
```

`npm run build` runs TypeScript checks and creates the static site in `dist/`.

## Local development

The standalone Vite server is useful for front-end iteration. The API and D1-backed pages run under Wrangler.

```sh
npm ci
npm run build
npx wrangler d1 migrations apply fruitforge-db --local
npm run worker:dev
```

Open the local address printed by Wrangler (normally `http://localhost:8787`). Local D1 starts with the schema, catalog, and available values from `data/fruits.json`. Cloudflare Access secrets are not set locally, so admin writes fail closed. Test administrator flows in a protected Cloudflare preview environment; there is no local password bypass.

To refresh the seed migrations after an approved catalog change, edit `data/fruits.json`, then run:

```sh
node scripts/generate-catalog-migration.mjs
```

Review the generated `migrations/0002_seed_catalog.sql` and `migrations/0003_seed_catalog_values.sql` before committing them. The catalog migration adds missing identities. The values migration imports available source estimates only for items without an existing D1 value row; it preserves existing values and records source details in the note. Unsupported source trend labels are retained in the note and shown as unrated by the app. Never edit a canonical name or reuse an ID after publication. Deactivate an item through the admin dashboard instead; its ID, old links, and history remain intact.

## Cloudflare setup

### 1. Create the D1 databases

Authenticate Wrangler, create the production database, and replace the placeholder `database_id` in `wrangler.jsonc` with the returned ID:

```sh
npx wrangler login
npx wrangler d1 create fruitforge-db
```

For isolated previews, also create `fruitforge-preview-db` and put its ID in `env.preview.d1_databases`:

```sh
npx wrangler d1 create fruitforge-preview-db
```

Apply the checked-in schema and seed:

```sh
npm run db:remote
npx wrangler d1 migrations apply fruitforge-preview-db --remote --env preview
```

The catalog seed adds item identities, and the values seed imports available estimates from `data/fruits.json` only where D1 has no existing value row. Neither migration overwrites existing identities or values. Migrations are also applied automatically by the GitHub deployment workflow before it deploys the Worker.

### 2. Configure administrator authentication

Create two Cloudflare Access self-hosted applications on the production hostname:

1. Protect `/admin*`.
2. Protect `/api/admin*`.

Set each Access policy to allow only the exact administrator email addresses you intend to use. These path-specific applications keep the public site anonymous while protecting both the dashboard page and every admin API request. Keep the Access applications and identity provider restricted; do not add an “Everyone” allow policy.

Copy both Application Audience tags. Set the following Worker secrets using Wrangler’s secure prompt (do not commit them):

```sh
npx wrangler secret put CF_ACCESS_TEAM_DOMAIN
npx wrangler secret put CF_ACCESS_AUD
npx wrangler secret put ADMIN_EMAILS
npx wrangler secret put RATE_LIMIT_SALT
```

- `CF_ACCESS_TEAM_DOMAIN`: your team hostname such as `team-name.cloudflareaccess.com` (no scheme).
- `CF_ACCESS_AUD`: the two audience tags, separated by a comma.
- `ADMIN_EMAILS`: the exact comma-separated email allowlist. It must match the Access policy.
- `RATE_LIMIT_SALT`: a random secret with at least 32 characters, used to hash request IPs before short-window rate-limit records are stored.

For the preview Worker, create equivalent Access applications on its preview hostname, then set environment-scoped secrets:

```sh
npx wrangler secret put CF_ACCESS_TEAM_DOMAIN --env preview
npx wrangler secret put CF_ACCESS_AUD --env preview
npx wrangler secret put ADMIN_EMAILS --env preview
npx wrangler secret put RATE_LIMIT_SALT --env preview
```

The Worker validates the Access JWT signature, issuer, expiration, audience, and email against Cloudflare’s signing keys on every administrative operation. It also checks request origin for writes and rate-limits administrative mutations. Cloudflare Access handles the sign-in flow; this application never asks for Roblox credentials.

### 3. Set the public URL and custom domain

Change `PUBLIC_SITE_URL` in `wrangler.jsonc` to the HTTPS production URL. The placeholder `.example` domain must be replaced before launch so sitemap and robots output point at the real site. Optionally change `src/config.ts` to rename FruitForge; that file also holds the calculator’s safe fairness tolerance and disabled AdSense configuration.

Deploy once from the configured repository, then add the production custom domain in **Cloudflare → Workers & Pages → fruitforge → Settings → Domains & Routes**. The production `npm run deploy` command applies pending remote D1 migrations before building and deploying the Worker. The Worker uses same-origin API calls, so no cross-origin API allowlist is needed.

### 4. Connect GitHub automatic deployment

Create a GitHub repository, commit the project, and use `main` as its production branch. Add these GitHub repository secrets:

- `CLOUDFLARE_API_TOKEN` — a token scoped to this account with Workers Scripts edit and D1 edit permissions.
- `CLOUDFLARE_ACCOUNT_ID` — your Cloudflare account ID.

The included `.github/workflows/deploy.yml` runs on pushes to `main` and calls `npm run deploy`, which applies remote D1 migrations, builds the site, and deploys the Worker and `dist/` assets. Pull requests do not deploy automatically; use the isolated preview commands below.

If using Cloudflare Workers Builds instead of this GitHub Actions workflow, set **Settings → Builds → Deploy command** to `npm run deploy`. The default `npx wrangler deploy` only deploys the Worker and does not apply D1 migrations. Ensure the build token can edit D1 databases as well as Workers Scripts.

### 5. Preview deployments

The `preview` Wrangler environment points to its own Worker name and D1 database. After the preview database ID and Access secrets are configured, use:

```sh
npm run build
npx wrangler d1 migrations apply fruitforge-preview-db --remote --env preview
npx wrangler deploy --env preview
```

Use separate preview Access audience tags, a restricted email policy, and preview-only data. Never point preview at the production database.

## Admin workflow

1. Open `/admin` and sign in through Cloudflare Access with an allowed email.
2. Search the fixed catalog and edit regular/permanent estimates, demand, trend, confidence, or an optional note.
3. Save one row or save all edited rows as drafts.
4. Import/export CSV or download the template. Imports only accept existing catalog IDs and known value columns; an invalid row rejects the whole import.
5. Preview all saved changes. Check the affected fruit and old/new values.
6. Publish after the explicit confirmation. The Worker validates the complete draft set and writes a new dataset version, history rows, current values, audit record, and draft deletion in one D1 batch transaction.

Published values power the homepage, catalog, item pages, API, and calculator. A browser refreshes the public dataset in the background every minute and when it regains focus; each calculation uses one complete dataset snapshot. The calculator does not request the API for each edit.

To undo an accidental publication, open the fruit’s history in `/admin`, select **Restore previous as draft**, review the new draft, preview, and publish it. Rollback creates a new audited dataset version; it does not delete history.

## Canonical catalog source

The names were checked against the [Blox Fruits experience page published by Gamer Robot Inc](https://www.roblox.com/games/2753915549/Blox-Fruits), which listed 42 current fruit names when checked on October 17, 2026. See [`data/catalog-sources.md`](data/catalog-sources.md) for scope and secondary metadata sources. Fruit names are not sourced from the reference values website.

The rarity/type fields are catalog metadata, not price estimates. Verify them again after game updates. The versioned roster excludes mutations, skins, variants, retired names, and admin-only items. No current trading value is inferred from the game’s shop prices.

## API

Public endpoints:

- `GET /api/catalog`
- `GET /api/values`
- `GET /api/values/:id`
- `GET /api/values/:id/history`
- `GET /api/dataset/version`
- `GET /api/guides`
- `GET /api/trades`
- `POST /api/trades`, `PATCH /api/trades/:id`, `DELETE /api/trades/:id`
- `POST /api/trades/:id/report`
- `POST /api/feedback`

Administrative endpoints are under `/api/admin/*`, and every one validates the Access JWT on the Worker. The Worker serves the Vite SPA assets and SEO metadata from the same hostname; requests to unknown page paths return the app’s 404 response with HTTP 404.

D1 is SQLite-compatible. Queries use prepared statements and bound values. Multi-write publication and bulk import use D1 batches; Cloudflare documents that a failed statement aborts and rolls back the batch. Reads use the primary database, so a newly published version is not combined with values from a stale replica.

## SEO, advertising, and privacy

- Titles, descriptions, canonicals, Open Graph tags, `robots.txt`, and `/sitemap.xml` are provided. The sitemap adds fruit pages only after a regular or permanent value is published. Empty calculator/share results and the admin route are `noindex`.
- Google Search Console: add the verification meta tag supplied by Search Console to `index.html`, deploy it, and then complete verification in the property.
- AdSense is off by default. No publisher ID or slot is fabricated. Before enabling, configure only valid IDs in `src/config.ts`, review consent obligations for your audience/regions, and use Google’s certified consent platform where required. The component reserves space, loads the script only after opt-in, and loads it once.
- The site stores no public accounts. Calculator selections and favorites remain in local browser storage. Listings contain a user-provided Roblox username but never a password; listings are not identity-verified and expire after seven days. The owner edit key is stored in that browser’s local storage. Feedback and reports are stored in D1 and can be reviewed through `/admin`.
- The feedback form stores messages for the site operator; it does not send email notifications. Check the protected admin inbox regularly and add a monitored contact address to `src/App.tsx` before public launch if one is available.

## Rollback and operational notes

- **Application code/assets:** inspect Worker deployments in the Cloudflare dashboard and roll back a selected Worker version, or run `npx wrangler rollback <VERSION_ID>`. A Worker rollback does not roll back D1 data or migrations.
- **A bad value publication:** use the admin history rollback flow above, which creates a new publication and keeps the audit trail intact.
- **Migrations:** keep schema changes backward-compatible with the previous Worker version. D1 state is not part of a Worker version rollback.
- **Secrets:** never put real secrets in GitHub files or `.env`. Runtime credentials belong in Cloudflare Worker secrets; GitHub deployment credentials belong in repository secrets. `.env` and `.dev.vars` are ignored by Git.

Cloudflare Workers have a JavaScript/TypeScript runtime rather than a conventional long-running Node or Python server. This project uses TypeScript and Web Crypto APIs that fit Workers. Python Workers have separate runtime and package compatibility constraints; Python was not selected or required here.

## Quality checks

```sh
npm test
npm run build
```

The source includes tests for canonical IDs/names, value field validation, CSV parsing, zero/missing values, rounding, quantity math, fairness thresholds, share-link parsing, dataset replacement, and unauthenticated admin publication. Run them in your environment before a release. The tests do not claim to exercise a live Cloudflare Access provider or a remote D1 account.
