# Data Model

## Table: `links`

| Field | Type | Notes |
|---|---|---|
| `id` | uuid PK | `gen_random_uuid()` |
| `user_id` | uuid (nullable) | owner scope — enforced at lock-down sprint |
| `url` | text NOT NULL | the saved link |
| `title` | text | human-readable label |
| `notes` | text | free-form context |
| `tags` | text[] | user-confirmed tags |
| `tag_suggestions` | jsonb | **AI field** — array of suggested tags |
| `tag_suggestions_source` | text | e.g. `openai/gpt-4o` |
| `tag_suggestions_confidence` | numeric | 0–1 per suggestion |
| `tag_suggestions_review_status` | text | `unreviewed` \| `accepted` \| `dismissed` |
| `last_visited_at` | timestamptz | updated when user opens the link |
| `created_at` | timestamptz NOT NULL | `now()` default |

## Relationships
- No foreign keys in v1 (user_id is nullable, no FK constraint yet).
- Sprint 4 adds `collections` and `link_collections` join table.

## RLS — v1 (demo-first)
- `links_v1_read`: `select` open to all — `using (true)`
- `links_v1_write`: `insert/update/delete` open to all — replaced at lock-down sprint with `auth.uid() = user_id`.
