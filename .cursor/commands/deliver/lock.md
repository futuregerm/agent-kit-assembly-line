# lock

Deliver-track. Lock exactly one slice (WIP=1) as the active work item.

Follow `.claude/skills/lock/SKILL.md` and `docs/agent/README.md` (deliver stage). Do not duplicate the process.

Quick path:
1. Read `.agent/workflow_state.md`.
2. If a slice is locked and not `done`, refuse and report it.
3. Prerequisite check: new scope with no decision log / approved backlog → refuse, name the missing stage (`intake`/`backlog`). Existing published law counts as the log. See Recovery in `docs/agent/README.md`.
4. Set the chosen slice active (weight + spec path), status `ready`.
5. Recommend `run`.
