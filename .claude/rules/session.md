# Session Rule (Claude)

Applies to every session. The process itself is defined in `docs/agent/` — this rule only enforces how sessions start and end.

## Start

1. Read `.agent/project_config.md`, then `.agent/workflow_state.md`.
2. If either is missing or unreadable, stop and ask the human.
3. If a slice is locked with an open blocker, report it and ask before proceeding.

## During

- **WIP = 1.** Never lock a second slice while one is active and not `done`.
- Follow `docs/agent/README.md` for stage behavior and `docs/agent/classes.md` for weight gates.
- Remediation cap is **3**, then human. Never self-approve a `write-security` design.
- Out-of-scope work goes to `.agent/follow-ups/`, not the current slice.

## End

Update `.agent/workflow_state.md` per `docs/agent/schemas/workflow_state.md`:
status, active slice, decisions log, open blockers, files touched, next 3 actions.
