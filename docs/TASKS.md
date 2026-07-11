# Tasks & Sprints

## Sprint 1 — DB + Core Link CRUD ✦ v1 functional milestone
**Goal:** The app is demoable end-to-end without a login wall.

- [ ] Run migration SQL; verify 5 seed rows appear in Supabase table viewer
- [ ] `/links` page: fetch and render all links (loading skeleton, empty-state copy, error banner)
- [ ] Add Link form: URL, title, tags (comma-separated), notes — server action inserts row
- [ ] On URL paste: server action fetches Open Graph title, pre-fills title field
- [ ] Edit Link modal: all fields editable, server action updates row
- [ ] Delete Link: confirmation dialog → server action deletes row → list updates
- [ ] Search input: filters rendered list by title, URL, or tag (client-side)
- [ ] Tag filter chips: clicking a tag narrows list to matching links
- [ ] Homepage (`/`) renders `/links` — no redirect to `/login`
- [ ] Smoke-test: add a link, hard-refresh, confirm it persists

**Definition of Done:** A new link saved via the form survives a hard refresh and appears in search results. Edit and delete both reflect immediately. No screen shows a blank state.

---

## Sprint 2 — AI Tag Suggestions
**Goal:** Saving a link is smarter — tags are suggested, not just typed.

- [ ] Server action `suggest_tags(url, title)` calls OpenAI, returns up to 5 tags
- [ ] Suggestion chips appear below the tags field; user can accept or dismiss each
- [ ] Accepted tags merge into the `tags` array; `tag_suggestions_review_status` updated
- [ ] Confidence score and source stored in DB for every suggestion
- [ ] If AI call fails, form still submits normally with no error shown to user

**Definition of Done:** Paste a URL → suggestions appear within 3 s → accepting one adds it to tags → DB row has `tag_suggestions_confidence` populated.

---

## Sprint 3 — Lock It Down (Auth + Per-User RLS)
**Goal:** Each user sees only their own links; demo data remains visible via fixture account.

- [ ] Enable Supabase Auth (email + magic link)
- [ ] Login / signup pages at `/login`
- [ ] Server actions populate `user_id` from `auth.uid()` on every insert
- [ ] Replace `v1` RLS policies with `auth.uid() = user_id` owner policies
- [ ] Unauthenticated visitors redirected to `/login`
- [ ] Smoke-test: two accounts — user A cannot see user B's links

**Definition of Done:** Logged-out visitor hits `/links` → redirected to `/login`. Two test accounts have zero cross-visibility.

---

## Sprint 4 — Collections & Smart Sorting
**Goal:** Links can be grouped and resurfaced intelligently.

- [ ] `collections` table + `link_collections` join table (migration)
- [ ] Create / rename / delete collections in UI
- [ ] Assign links to one or more collections
- [ ] Sort options: newest, oldest, least recently visited
- [ ] `last_visited_at` updated when user clicks to open a link

**Definition of Done:** Create a collection, assign two links, filter by collection — only those two links appear.

---

## Gantt (sprint → feature)
```
Sprint 1 │ DB schema · CRUD · search · tag filter · demo seed
Sprint 2 │ AI tag suggestions · OG title fetch
Sprint 3 │ Auth · RLS lock-down · login UI
Sprint 4 │ Collections · smart sort · visit tracking
```
