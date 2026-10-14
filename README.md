# Agent Kit Assembly Line

A portable, project-agnostic kit that gives any repo a repeatable agent delivery process — **discover -> deliver -> ship** — and exposes it to both **Cursor** and **Claude Code** from one source of truth.

## Why

Agent workflows drift: commands multiply, limits diverge, and the "brain" lives in gitignored scratch nobody can reuse. This kit packages the proven happy path once, so a new repo adopts it by filling in config + domain — nothing else.

## The pipeline

```text
discover/intake -> discover/backlog
    -> deliver/lock -> deliver/run (design? -> implement -> prove -> review, fix <= 3)
    -> ops/commit   (x N slices)
    -> ops/ship
```

- **discover** — business input -> ordered backlog of weighted slices (no code).
- **deliver** — lock one slice (WIP=1), then `run` the build pipeline (architect -> implement -> prove -> review, max 3 fix cycles).
- **ship** — after N slices: CI gate -> push -> open PR.

## Layout

```text
agent-kit-assembly-line/
├── REQUIREMENTS.md          # scope + principles
├── AGENTS.md / CLAUDE.md    # thin front doors
├── docs/agent/              # THE process (single source of truth)
│   ├── README.md            # the assembly line
│   ├── classes.md           # slice weights: light | full | write-security
│   ├── prove.md             # values / UI prove (implementer exit)
│   ├── checklist.md         # review checklist + verdict format
│   ├── principles.md        # design principles
│   └── schemas/             # workflow_state + project_config templates
├── .claude/                 # Claude packaging: skills, agents, hooks, rule
├── .cursor/                 # Cursor packaging: commands + session rule
├── scripts/                 # pre-PR CI templates
└── examples/consuming-project/  # adoption stub
```

## Core rules

| Rule | Value |
|------|-------|
| WIP (locked slices) | 1 |
| Remediation cycles | 3, then human |
| Slice weight gate | `light` / `full` / `write-security` |
| Auto-commit | OFF |
| Process source of truth | `docs/agent/` only |

## Use it in your project

See `examples/consuming-project/README.md`. Short version:

1. Copy `docs/agent/`, `.cursor/`, `.claude/`, `scripts/` into your repo.
2. Add thin `AGENTS.md` / `CLAUDE.md` front doors.
3. Fill `.agent/project_config.md` (from the schema) + your `docs/core/` domain truth.
4. Wire real CI into `scripts/pre-pr-check.*`.
5. Create `.agent/workflow_state.md` (gitignored) and run the line.

## Design stance

Cursor and Claude Code share the same `docs/agent/` constitution; their folders are **adapters**, not copies. Change the process in `docs/agent/` and both tools follow. See `docs/agent/principles.md`.

## Status

v0 scaffold — structure and process docs. CI implementations, MCP configs, and product rules are intentionally left to consuming projects.
