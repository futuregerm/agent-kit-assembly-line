---
name: run
description: Orchestrate the build pipeline for the locked slice - architect (if full/write-security) then implementer then reviewer, with a max 3 remediation cycles. Enforces the write-security human gate. Use after a slice is locked.
disable-model-invocation: true
---

# run

The orchestrator. Follow `docs/agent/README.md` (deliver stage) and `docs/agent/classes.md` for the weight gate. This skill owns the loop; the specialists are the `.claude/agents/` subagents.

## Loop

0. **Prerequisite check:** a slice must be locked (WIP=1) and its scope must have a decision log / published law. If the human says "just run/build" with nothing locked, don't improvise — redirect to `lock` (or `intake`/`backlog` if the scope is new). See Recovery / skip guards in `docs/agent/README.md`.
1. Read the locked slice + weight from `.agent/workflow_state.md`.
2. Weight gate:
   - `light` -> skip design; go to implement.
   - `full` -> spawn **architect** agent for a design doc in `.agent/designs/`, then implement.
   - `write-security` -> spawn **architect**, then **STOP for human approval** of the design. Do not implement until approved.
3. Spawn **implementer** agent to build from the design/slice. Prove is part of that exit (`docs/agent/prove.md`) — not a separate agent.
4. If values prove is not runnable: status `blocked`, ask the human, **do not** spawn the reviewer. This does not burn a fix cycle.
5. Spawn **reviewer** agent; it returns a verdict per `docs/agent/checklist.md`.
6. If `Approved? no`: spawn implementer to fix, re-prove kinds that still apply, then re-review. **At most 3 cycles** (failed prove counts; deferred or skipped UI does not).
7. After 3 unresolved cycles -> stop, summarize P0/P1, ask the human. Do not commit.
8. On `Approved? yes` (no open P0/P1; if the kind is `values` or `both`, values is `pass`) -> hand off to `commit`. Explicit `ui: deferred` or `ui: skipped` is allowed.

## Rules

- Never self-approve a `write-security` design.
- Update `workflow_state.md` status as you move: `planning` -> `implementing` -> `reviewing`. If values prove cannot run, status is `blocked` — do not move to `reviewing`.
- Keep each agent scoped to its stage (least privilege).
