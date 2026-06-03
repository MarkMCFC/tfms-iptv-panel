# TFMS IPTV Panel - Cloudflare Pages

[![Deploy to Cloudflare](https://deploy.workers.cloudflare.com/button)](https://deploy.workers.cloudflare.com/?url=https://github.com/smokindope/panel-pages-1click)

> Replace `YOUR_GITHUB_USERNAME/tfms-iptv-panel` with your public GitHub repo URL before sharing the button.

## Cloudflare Pages settings

Use these when importing the repo:

- Framework preset: None
- Build command: `npm run build`
- Build output directory: `public`
- Functions directory: `functions`

## Required bindings

Create these in your Cloudflare Pages project settings:

| Binding type | Binding name | Suggested resource name |
|---|---|---|
| D1 database | `DB` | `tfms-iptv-panel-db` |
| KV namespace | `KV_CONNECTIONS` | `tfms-iptv-panel-connections` |

Then run the SQL migration in `migrations/0001_init.sql` against your D1 database.

## Local setup

```bash
npm install
npm run pages:dev
```

## D1 setup

```bash
npx wrangler d1 create tfms-iptv-panel-db
npx wrangler kv namespace create KV_CONNECTIONS
npx wrangler d1 execute tfms-iptv-panel-db --file=./migrations/0001_init.sql --remote
```

Copy the generated D1 database ID and KV namespace ID into `wrangler.toml`, or configure them in the Cloudflare dashboard.
