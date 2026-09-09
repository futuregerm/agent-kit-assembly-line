# Agent Kit Assembly Line — Requirements (v0)

A portable, project-agnostic kit that gives any repo a repeatable agent delivery process: **discover -> deliver -> ship**. It packages the process once and exposes it to both Cursor and Claude Code without duplicating prose.

---

## Problem

Agent workflows drift: commands multiply, models/limits diverge, and the "brain" lives in gitignored scratch that can't be reused. Teams end up with clutter and no portable happy path.

## Goal

One proven pipeline, named in industry-ish verbs, packaged so a fresh repo can adopt it by filling in config + domain truth — nothing else.

---

## The assembly line (sweet spot)

```text
discover/intake -> discover/backlog
    -> deliver/lock -> deliver/run (design? -> implement -> review, fix <= 3)
    -> ops/commit   (x N slices)
    -> ops/ship
```

- **discover** — turn business input into an ordered backlog of slices. No code.
- **deliver** — lock one slice (WIP=1), then `run` the build pipeline for it.
- **ship** — after N slices, run CI + push + open PR.

## Non-negotiables

1. **WIP = 1** — exactly one locked slice at a time (tracked in `workflow_state`).
2. **Remediation cap = 3** — reviewer -> implementer fix loop runs at most 3 times, then stop and ask a human.
3. **Slice weight gate** — `light` (implement only), `full` (design doc first), `write-security` (design + mandatory human approval before implement).
4. **Single source of truth** — all process prose lives in `docs/agent/`. Tool folders (`.cursor/`, `.claude/`) are thin adapters that point at it.
5. **Kit names nothing product-specific** — no domain, stack, or company names in the kit.

---

## Layering: kit vs project vs scratch

| Layer | Lives where | Committed? | Purpose |
|-------|-------------|-----------|---------|
| **Kit** (portable) | `docs/agent/`, `.cursor/`, `.claude/`, `scripts/` | yes | process, commands, agents, schemas |
| **Project** (per repo) | `docs/core/`, `.agent/project_config.md`, domain rules | yes | domain truth, contracts, CI wiring |
| **Scratch** (volatile) | `.agent/workflow_state.md`, `.agent/scratch/`, `.agent/_imports/` | no | session memory + experiments |

## Adapter DRY rule

- Full stage prose: **only** in `docs/agent/`.
- `.claude/skills/*/SKILL.md`: short entrypoints (read by Cursor **and** Claude) that say "follow `docs/agent/<x>`." Set `disable-model-invocation: true` for explicit `/`-trigger-only stages.
- Changing the process = editing `docs/agent/` only.

---

## In scope (v0)

- Requirements + `docs/agent/` constitution (README, classes, checklist, principles, schemas).
- Claude packaging: skills (`intake, backlog, lock, run, commit, ship, oneline`), agents (`architect, implementer, reviewer`), session rule, settings stub.
- Cursor adapters: `discover/deliver/ops` commands + session rule.
- CI templates (placeholders) + hook stub.
- `examples/consuming-project/` wire-up stub + root README/AGENTS/CLAUDE.

## Out of scope (v0)

- Migrating or touching `appyhourweb-v2`.
- Real CI implementations, MCP configs, product rules.
- Extra modes (sprint-board, batch-ship, diagram, learn, doc-sync).
- Publishing to GitHub / npm; any remote push.

---

## Success criteria

1. A fresh clone of the kit alone fully documents the assembly line.
2. A consumer fills `.agent/project_config.md` + domain rules and can go `lock -> run` without reading any other project's docs.
3. Editing process text touches **only** `docs/agent/`; adapters stay thin.
