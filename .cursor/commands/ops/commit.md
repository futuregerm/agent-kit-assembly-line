# commit

Ops-track. Prepare a single commit for the approved slice. Auto-commit OFF.

Follow `.claude/skills/commit/SKILL.md` and `docs/agent/README.md` (ops stage). Do not duplicate the process.

Quick path:
1. Confirm reviewer `Approved? yes` (no open P0/P1).
2. Stage only this slice's files.
3. Draft a short functionality-level message.
4. Present staged diff + message and wait, unless the user said "commit"/"ship it". Never push here.
