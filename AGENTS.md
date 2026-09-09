# AGENTS.md — Agent Kit Assembly Line

Front door for Cursor. This repo **is** the kit. The process lives in `docs/agent/`; everything else is a thin adapter.

## What this is

A portable, project-agnostic agent delivery process: **discover -> deliver -> ship**. Clone it into any repo, fill in config + domain, and run the same pipeline.

## The line

```text
discover/intake -> discover/backlog
    -> deliver/lock -> deliver/run (design? -> implement -> review, fix <= 3)
    -> ops/commit   (x N slices)
    -> ops/ship
```

## Start here

1. `REQUIREMENTS.md` — scope + principles.
2. `docs/agent/README.md` — the constitution (single source of truth).
3. `docs/agent/classes.md` — slice weights + gates.

## Map

| What | Path |
|------|------|
| Process (SSOT) | `docs/agent/` |
| Skills (entrypoints, `/name`) | `.claude/skills/*/SKILL.md` — read by Cursor **and** Claude; `disable-model-invocation: true` = explicit `/`-trigger only |
| Cursor session rule | `.cursor/rules/session.mdc` |
| Claude agents | `.claude/agents/` |
| Claude hooks stub | `.claude/settings.json` |
| CI templates | `scripts/pre-pr-check.TEMPLATE.*` |
| Adoption example | `examples/consuming-project/` |

## Non-negotiables

- WIP = 1. Remediation cap = 3, then human.
- Auto-commit OFF. Never push unless asked.
- Process prose changes go in `docs/agent/` only — adapters stay thin.
