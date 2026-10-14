# Workflow State (example)

Filled-in example of `docs/agent/schemas/workflow_state.md`. In a real project this file is gitignored.

**Last updated:** 2026-01-01
**Updated by:** human

## Current objective

Ship the first slice of the login rework.

## Active slice

| Field | Value |
|-------|-------|
| Slice | 1 - Email/password login form |
| Weight | full |
| Spec | .agent/slices/login-rework-slices.md |
| Design | .agent/designs/2026-01-01-login-form.md |
| Status | implementing |

## Prove this slice

| Field | Value |
|-------|-------|
| values | n/a |
| ui | n/a |
| env | n/a |
| seen | Not run yet — implement in progress |

## Decisions log

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-01-01 | Slice 1 weight = full | Multiple files + validation design choices |

## Open blockers

| # | Blocker | Status |
|---|---------|--------|
| - | none | - |

## Files touched this session

- .agent/designs/2026-01-01-login-form.md - new design

## Next 3 actions

1. Implement the login form component per design.
2. Add validation tests, then prove values against one real row (UI click path stays on the card if the screen env is down).
3. Run review.
