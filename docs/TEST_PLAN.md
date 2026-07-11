# Test Plan

## Success Scenario (manual walkthrough)
1. Open `/` — list renders with 5 seeded demo links. No login prompt.
2. Click **Add Link** — form opens.
3. Paste `https://fs.blog/mental-models/` — title field auto-fills within 2 s.
4. Tag suggestions appear; accept "thinking" and "reference".
5. Add a note: "Good framework primer".
6. Click **Save** — modal closes; new link appears at top of list.
7. Hard-refresh the page — link still present.
8. Click edit on the new link — change title to "Mental Models (FS)", save.
9. Confirm updated title shows in list.
10. Delete the link — confirm dialog appears — confirm — link removed from list and absent after refresh.

## Empty State
- Delete all links (or use a fresh DB) → list shows "No links yet. Add your first one." with an Add button.

## Error Cases
- Submit form with empty URL → inline validation error, no DB call.
- AI tag endpoint unreachable → form still saves, no tag suggestions shown, no crash.
- Network drops mid-save → error banner "Could not save link — please try again"; list unchanged.

## Loading State
- Throttle network to Slow 3G in DevTools → skeleton cards visible while list loads.

## Edge Cases
- Duplicate URL: allowed in v1 (no unique constraint) — both rows save.
- Very long URL (2000+ chars): saves without truncation.
- Tags with spaces: stored as entered; search matches on full tag string.
