---
name: ship
description: Run the pre-PR CI gate, push the branch, and open a pull request into a named base branch. Only pushes after CI passes. Use when N committed slices are ready to become a PR.
disable-model-invocation: true
---

# ship

Follow `docs/agent/README.md` (ops stage). Requires an explicit target/base branch from the human.

1. Confirm the human named a base branch. If not, stop and ask.
2. Run the project CI command from `.agent/project_config.md` (see `scripts/pre-pr-check.*`).
3. On failure: auto-fix mechanical issues and re-run, up to **3** loops, then stop and report.
4. When CI is green: push the branch.
5. Open a PR into the named base branch using the repo PR template.
6. Report the PR URL.

Never force-push. Never push without CI green and human intent to ship.
