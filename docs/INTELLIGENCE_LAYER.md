# Intelligence Layer

## Messy Input
User pastes a raw URL — often no title, no tags, no context.

## Auto-Structure (on URL paste)
```json
{
  "url": "https://paulgraham.com/makersschedule.html",
  "title": "Maker's Schedule, Manager's Schedule",  // from Open Graph
  "tag_suggestions": ["productivity", "essays", "management"],
  "tag_suggestions_source": "openai/gpt-4o",
  "tag_suggestions_confidence": 0.87,
  "tag_suggestions_review_status": "unreviewed"
}
```

## Events to Track
- Link saved
- Tag suggestion accepted / dismissed
- Link opened (updates `last_visited_at`)
- Link edited

## Scoring Rules (rule-based first)
- **Recency score:** links saved in the last 7 days rank higher.
- **Neglect score:** links not visited in 30+ days surface in a "revisit" sort.
- No ML model needed in v1 — pure SQL ordering.

## What Gets Ranked
- Default list order: newest first.
- Later: "least recently visited" sort to resurface forgotten links.

## v1 vs Later
- **v1:** Open Graph title fetch + AI tag suggestions (auto, low-risk).
- **Later:** Weekly digest email, duplicate/dead-link detection, semantic search.
