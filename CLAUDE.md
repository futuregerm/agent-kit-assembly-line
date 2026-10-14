# CLAUDE.md — Agent Kit Assembly Line

Front door for Claude Code. This repo is the kit. Keep this thin — the process lives in `docs/agent/`.

Import the shared front door and constitution:

@AGENTS.md
@docs/agent/README.md

## The line

```text
discover/intake -> discover/backlog
    -> deliver/lock -> deliver/run (design? -> implement -> prove -> review, fix <= 3)
    -> ops/commit   (x N slices)
    -> ops/ship
```

## Claude packaging

- **Skills** (entry points): `.claude/skills/{intake,backlog,lock,run,commit,ship,oneline,plain}/`
- **Agents** (specialists): `.claude/agents/{architect,implementer,reviewer}.md`
- **Hooks** (deterministic gates): `.claude/settings.json`
- **Session rule**: `.claude/rules/session.md`

## Non-negotiables

- WIP = 1. Remediation cap = 3, then human.
- Auto-commit OFF. Never push unless asked.
- Never self-approve a write-security design.
