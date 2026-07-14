# Consuming Project — Wire-Up Checklist

How to adopt the agent kit in a real repo. The kit provides the process; you provide domain + config.

## 1. Bring in the kit

Copy (or submodule) the kit's `docs/agent/`, `.cursor/`, `.claude/`, and `scripts/` into your repo root. Keep paths identical so adapters resolve.

## 2. Add front doors

- Root `AGENTS.md` (Cursor) and `CLAUDE.md` (Claude) — thin, pointing at `docs/agent/README.md`. See the stubs in this folder.

## 3. Fill config + domain

- `.agent/project_config.md` — from `docs/agent/schemas/project_config.md`. Set repos, limits, CI command, gates. See `project_config.example.md`.
- `docs/core/` — your contracts, auth, and domain truth.
- Your engineering rules file (e.g. `.cursor/rules/engineering.mdc`) — stack-specific standards. Not shipped by the kit.

## 4. Wire CI

- Copy `scripts/pre-pr-check.TEMPLATE.*` to `pre-pr-check.*` and implement real checks.
- Point `.agent/project_config.md` CI command at them.

## 5. Initialize state

- Create `.agent/workflow_state.md` from `docs/agent/schemas/workflow_state.md` (or copy `workflow_state.example.md`). It stays gitignored.

## 6. Run the line

```text
intake -> backlog -> lock -> run -> commit (x N) -> ship
```

## Layering reminder

- **Kit** (committed, portable): `docs/agent/`, `.cursor/`, `.claude/`, `scripts/`.
- **Project** (committed, yours): `docs/core/`, `project_config.md`, engineering rules.
- **Scratch** (gitignored): `workflow_state.md`, `.agent/scratch/`, `.agent/_imports/`.
