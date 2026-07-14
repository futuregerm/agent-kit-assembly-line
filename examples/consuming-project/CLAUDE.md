# CLAUDE.md (consuming project stub)

Front door for Claude Code. Keep thin — the process lives in `docs/agent/`.

Import the shared front door and constitution:

@AGENTS.md
@docs/agent/README.md

## Start here

1. `.agent/project_config.md` — config, limits, gates.
2. `.agent/workflow_state.md` — active slice + status (gitignored).

## The line

```text
intake -> backlog -> lock -> run -> commit (x N) -> ship
```

Skills: `.claude/skills/`. Specialists: `.claude/agents/`. Deterministic gates: `.claude/settings.json`.

## Non-negotiables

- WIP = 1. Remediation cap = 3, then human.
- Auto-commit OFF. Never push unless asked.
- Never self-approve a write-security design.
