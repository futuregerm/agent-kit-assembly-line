# Schema — workflow_state.md

The volatile session-handoff file. Lives at `.agent/workflow_state.md` in a consuming project. **Gitignored.** Read at session start; update at session end.

Required sections below. Copy this shape into the project (see `examples/consuming-project/.agent/workflow_state.example.md`).

---

```markdown
# Workflow State

**Last updated:** YYYY-MM-DD
**Updated by:** <stage or human>

## Current objective

<one or two lines: what we're trying to accomplish right now>

## Active slice

| Field | Value |
|-------|-------|
| Slice | <number + title, or "none locked"> |
| Weight | light | full | write-security |
| Spec | <path to slice/spec, or n/a> |
| Design | <path in .agent/designs/, or n/a> |
| Status | ready | planning | implementing | reviewing | blocked | done |

## Decisions log

| Date | Decision | Rationale |
|------|----------|-----------|

## Open blockers

| # | Blocker | Status |
|---|---------|--------|

## Files touched this session

- <path> - <why>

## Next 3 actions

1.
2.
3.
```

---

## Rules

- **WIP=1:** at most one row in Active slice with a non-`done` status.
- Status values are fixed: `ready | planning | implementing | reviewing | blocked | done`.
- If `Status = blocked`, the blocker must appear in Open blockers.
