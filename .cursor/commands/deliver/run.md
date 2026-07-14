# run

Deliver-track. Orchestrate the build pipeline for the locked slice.

Follow `.claude/skills/run/SKILL.md`, `docs/agent/README.md` (deliver stage), and `docs/agent/classes.md` (weight gate). The stage prompts are `.claude/agents/{architect,implementer,reviewer}.md` — in Cursor, run them as Task subagents or sequential stages. Do not duplicate the process.

Loop (authoritative version in `docs/agent/README.md`):
1. Read slice weight.
2. `light` -> implement. `full` -> architect design then implement. `write-security` -> architect design then STOP for human approval.
3. implement -> review (verdict per `docs/agent/checklist.md`).
4. Fix cycle on P0/P1, re-review, **max 3**, then human.
5. On approval -> hand off to `commit`.
