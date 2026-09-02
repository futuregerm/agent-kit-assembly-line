# Agent Constitution — The Assembly Line

This is the **single source of truth** for the agent process. Every command, skill, and agent points here. Change the process by editing this folder — nowhere else.

---

## The pipeline

```text
discover/intake -> discover/backlog
    -> deliver/lock -> deliver/run (design? -> implement -> review, fix <= 3)
    -> ops/commit   (docs-on-commit, x N slices)
    -> ops/ship
```

```mermaid
flowchart TD
  intake[intake] --> backlog[backlog]
  backlog --> lock[lock]
  lock --> run[run]
  run --> weight{slice_weight}
  weight -->|light| impl[implement]
  weight -->|full_or_write_security| arch[architect]
  arch --> human{human_gate}
  human -->|approved_or_not_required| impl
  impl --> rev[review]
  rev -->|fix_le_3| impl
  rev -->|ok| commit[commit_docs]
  commit --> more{more_slices}
  more -->|yes| lock
  more -->|no| ship[ship]
```

---

## Stages

### discover

| Step | Input | Output | Notes |
|------|-------|--------|-------|
| `intake` | Raw business input (requests, notes, CSV) dropped in `.agent/_imports/` | Structured summary | Plan-only. Never writes code. |
| `backlog` | Intake summary | Ordered slices in `.agent/slices/` | Each slice gets a **weight** (see `classes.md`). |

### deliver

| Step | Input | Output | Notes |
|------|-------|--------|-------|
| `lock` | Chosen slice number | `workflow_state.md` active slice set | **WIP=1**. Refuse if a slice is already locked and not `done`. |
| `run` | Locked slice | Working code + review verdict | Orchestrates the stage loop below. Owns remediation cap. |

`run` internal loop:

1. Read slice weight.
2. `light` -> go straight to **implement**.
3. `full` / `write-security` -> **architect** produces a design doc in `.agent/designs/` first.
4. `write-security` -> **STOP for human approval** of the design before implement.
5. **implement** -> **review**.
6. If review returns issues: **implement** fix. Repeat review. **At most 3 fix cycles.**
7. After 3 unresolved cycles -> stop, summarize, ask the human.
8. On approval (no open P0/P1) -> prepare commit.

### ops

| Step | Input | Output | Notes |
|------|-------|--------|-------|
| `commit` | Approved slice | One commit | Auto-commit OFF by default; prepare + wait unless told to commit. **Docs-on-commit (optional per project):** if the slice locked product/contract/identity meaning and the project defines an owner map, update the one owning `docs/` page in the same commit. |
| `ship` | Branch with N commits | Pushed branch + PR | Runs CI gate first. Only after CI passes. |

---

## Stage exits (role handoffs)

Each stage owns a **role** and must leave a **required artifact** before the next stage begins. Human gates are about intent, not exact phrasing.

| Role | Stage | Required exit | Human gate |
|------|-------|---------------|------------|
| Analyst | `intake` | Decision log: headline question, locked rules, explicit out-of-scope | Approve decisions -> then backlog |
| Planner | `backlog` | Thin slices, each with Done when / Depends on / Weight / owning decision-log section | Approve card list -> then lock |
| Architect | `run` (`full` / `write-security`) | Design doc in `.agent/designs/` | write-security stop (mandatory) |
| Dev | `run` -> implement | Code + tests for one locked slice | — |
| Reviewer | `run` -> review | Verdict per `checklist.md`, judged against slice AC **and** decision log / owning docs | Fix <= 3 then human |
| Documenter | `commit` | Owning `docs/` page updated when product/contract/identity changed (docs-on-commit, if the project uses it) | — |

Docs-on-commit is the **documenter** exit — it lives inside `commit`. Do not add a separate documentation stage after `ship`.

---

## Recovery / skip guards

The line should **guide**, not require memorized phrases. If the human jumps ahead, the agent detects the missing exit and offers the next role step (one question at a time) rather than silently proceeding.

| Human skips… | Agent response |
|--------------|----------------|
| Decision log, jumps to backlog | Run analyst first: "No decision log yet — headline question?" |
| Decision log, jumps to lock / build | Refuse lock/run for a **new** scope; start intake. If the scope already has published law, treat that as the decision log and proceed. |
| Backlog approval, locks anyway | Confirm a thin card list + human OK exists; else run backlog |
| Design for `write-security` | Existing stop — show design, wait for approval |
| Docs-on-commit | Reviewer flags P1 / `commit` catches it |
| Wrong stage mid-chat | Session start reads `workflow_state`; reply with **Next 3 actions** and ask whether to continue or change course |

**Default: guide and wait.** Hard-refuse only when proceeding would burn WIP=1 or skip a `write-security` gate. Intent-based approval counts — exact gate phrases are not required. Recovery lives inside `intake` / `lock` / `run`; do not add a separate coach agent or persona files.

---

## Hard rules

- **WIP = 1.** One locked slice at a time.
- **Remediation cap = 3**, then human.
- **Weight gate** decides whether a design doc and human approval are required.
- **Auto-commit OFF**; never push unless the human says "push" or "open a PR".
- **Scope is binding.** Out-of-scope discoveries go to `.agent/follow-ups/`, not the current slice.

---

## Session protocol

**Start:** read `.agent/project_config.md` then `.agent/workflow_state.md`. If either is missing, stop and ask.

**End:** update `.agent/workflow_state.md` (status, active slice, decisions, blockers, files touched, next 3 actions).

See `schemas/` for the required shape of both files.

---

## Where things live

| What | Path |
|------|------|
| Process (this) | `docs/agent/` |
| Slice weights + gates | `docs/agent/classes.md` |
| Review checklist | `docs/agent/checklist.md` |
| Design principles | `docs/agent/principles.md` |
| State/config schemas | `docs/agent/schemas/` |
| Domain truth (per project) | `docs/core/` |
| Config values (per project) | `.agent/project_config.md` |
| Session memory (volatile) | `.agent/workflow_state.md` |
