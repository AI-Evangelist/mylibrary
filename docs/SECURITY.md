# Security

## Secret Handling
- `OPENAI_API_KEY` and `SUPABASE_SERVICE_ROLE_KEY` live in Vercel environment variables only.
- Never imported into any client component or exposed via a public API route without auth.
- All AI and DB writes happen in Next.js **server actions** or **Route Handlers**.

## Permission Model (current)
- v1: permissive RLS policies — read/write open so demo works without login.
- Lock-down sprint: policies replaced with `auth.uid() = user_id`; service-role key used only server-side.

## Approved Tools Rule
- Only the four named tools in AGENTIC_LAYER.md may be called by automated code paths.
- No `eval`, no `run_any`, no dynamic SQL construction from user input.

## Audit Principle
- Every create, update, delete, and AI action writes a row to `audit_logs`.
- Audit rows are append-only (no update/delete policy on `audit_logs`).

## Honest Gaps (v1)
- No rate limiting on the Add Link form — add before real users arrive.
- No input sanitisation beyond Supabase parameterised queries — review before public launch.
- If payments or legal data are ever added, stop and bring in a specialist.
