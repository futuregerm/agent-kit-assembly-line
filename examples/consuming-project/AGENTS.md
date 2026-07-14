# AGENTS.md (consuming project stub)

Front door for Cursor. Keep thin — the process lives in `docs/agent/`.

## Start here

1. `.agent/project_config.md` — this project's config, limits, gates.
2. `.agent/workflow_state.md` — active slice + status (gitignored).
3. `docs/agent/README.md` — the assembly line.

## The line

```text
intake -> backlog -> lock -> run -> commit (x N) -> ship
```

## Non-negotiables

- WIP = 1. Remediation cap = 3, then human.
- Auto-commit OFF. Never push unless asked.
- Process edits go in `docs/agent/` only; this file stays thin.

## Domain

- Contracts / auth / domain truth: `docs/core/`.
- Stack rules: `<your engineering rules file>`.
