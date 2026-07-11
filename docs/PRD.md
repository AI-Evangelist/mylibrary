# mylibrary — Product Requirements

## Problem
Valuable links and knowledge get saved across browsers, notes apps, and chat threads and are never found again. There is no single place to capture, tag, and retrieve them.

## Target User
Anyone who collects links — primarily the builder, used personally.

## Core Object
**Link** — the one thing the app tracks.

## MVP Must-Haves (v1)
- [ ] Save a link: URL, title, tags, notes
- [ ] List all links — searchable by title/URL/tag
- [ ] Filter links by tag
- [ ] Edit any link
- [ ] Delete any link with a confirmation step
- [ ] App loads with demo links so it is immediately useful-looking
- [ ] All screens handle loading, empty, error, and data states
- [ ] No login required to view or add in v1

## Non-Goals (v1)
- User accounts / authentication
- Collections or folders
- Browser extension
- Public sharing
- Import from other services

## Definition of Done
**Pass:** A visitor opens the app, sees demo links, pastes a new URL, fills the form, clicks Save — the link appears in the list and persists after a hard refresh. They can edit the title, change tags, and delete the link; the list reflects every change without a page reload. Fail if any button is inert, any change is lost on refresh, or any state (empty, error, loading) shows a blank screen.
