# ship

Ops-track. Run pre-PR CI, push, and open a PR into a named base branch.

Follow `.claude/skills/ship/SKILL.md` and `docs/agent/README.md` (ops stage). Do not duplicate the process.

Quick path:
1. Require an explicit base branch; if missing, stop and ask.
2. Run the CI command from `.agent/project_config.md` (`scripts/pre-pr-check.*`).
3. Auto-fix mechanical failures, re-run, **max 3** loops, then stop.
4. On green: push, open PR with the repo template, report the URL.

Never force-push. Never push without CI green + human intent.
