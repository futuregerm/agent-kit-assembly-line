---
name: lock
description: Lock exactly one slice as the active work item (WIP=1) and record it in workflow_state. Refuses if another slice is already locked and not done. Use before run.
disable-model-invocation: true
---

# lock

Follow `docs/agent/README.md` (deliver stage). Enforce **WIP=1**.

1. Read `.agent/workflow_state.md`.
2. If a slice is already locked and its status is not `done`, **refuse** and report the active slice.
3. **Prerequisite check:** the slice must come from an approved backlog whose scope has a decision log (or published law). If the human jumps to lock for a **new** scope with no decision log / no approved backlog, refuse and name the missing stage (`intake` or `backlog`) rather than locking blind. See Recovery / skip guards in `docs/agent/README.md`.
4. If the card has no **Prove** field, infer the kind per `docs/agent/prove.md` and write it on the card. Do not invent clicks.
5. Set the chosen slice as Active slice with its weight and spec path, status `ready`.
6. Confirm the lock and recommend `run`.
