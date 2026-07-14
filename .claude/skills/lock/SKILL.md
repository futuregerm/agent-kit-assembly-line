---
name: lock
description: Lock exactly one slice as the active work item (WIP=1) and record it in workflow_state. Refuses if another slice is already locked and not done. Use before run.
---

# lock

Follow `docs/agent/README.md` (deliver stage). Enforce **WIP=1**.

1. Read `.agent/workflow_state.md`.
2. If a slice is already locked and its status is not `done`, **refuse** and report the active slice.
3. Otherwise set the chosen slice as Active slice with its weight and spec path, status `ready`.
4. Confirm the lock and recommend `run`.
