# Architecture

## Stack
- **Frontend:** Next.js 14 (App Router) on Vercel
- **Database + API:** Supabase (Postgres + RLS + Edge Functions)
- **AI:** OpenAI API called from a Next.js server action (never the browser)

## Now vs Later
**Now:** Single `links` table, full CRUD, search/filter, demo seed data, no auth.
**Next:** Auth, per-user RLS, collections.
**Later:** AI digest, browser extension, import/export.

## Key User Action — "Save a link" (step by step)
1. User pastes a URL into the Add Link form.
2. Browser sends URL to a server action; server fetches Open Graph metadata and returns title.
3. AI endpoint suggests tags; suggestions stored with `source`, `confidence`, `review_status`.
4. User edits/accepts and clicks Save.
5. Server action inserts the row into `links` via Supabase service-role client.
6. Client receives the new row and appends it to the list — no full reload.
7. Hard refresh: list re-fetches from Supabase and includes the new link.

## Layer Order
1. **Data** — schema + RLS enforced in Postgres.
2. **App logic** — CRUD via server actions; search/filter in SQL.
3. **Smart features** — AI tag suggestion layered on top; removing it does not break saves.

## Core Without AI
All CRUD works with no AI calls. AI is an optional enrichment step only.
