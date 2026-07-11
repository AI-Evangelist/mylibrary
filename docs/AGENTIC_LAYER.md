# Agentic Layer

## Risk Levels & Actions

### Low — Auto (no approval needed)
- Fetch page title from URL via Open Graph
- Suggest tags via AI on URL paste
- Score/sort links by recency or neglect

### Medium — Light Approval (user confirms)
- Bulk re-tag a set of links based on AI suggestion
- Mark a batch of links as archived

### High — Always Approval
- Send a digest email to the user *(later sprint)*

### Critical — Human Only
- Bulk delete all links
- Export / wipe account data

## Named Tools (approved list)
- `fetch_og_metadata(url)` — server action, no secrets to browser
- `suggest_tags(url, title)` — server action calling OpenAI
- `upsert_link(payload)` — Supabase server-side insert/update
- `delete_link(id)` — Supabase delete, requires confirmation UI step

## Audit Log Fields (on every meaningful action)
`action_type | object_id | object_table | actor_user_id | before_snapshot | after_snapshot | created_at`

## v1
Only `fetch_og_metadata` and `suggest_tags` run automatically. All writes are user-initiated.
