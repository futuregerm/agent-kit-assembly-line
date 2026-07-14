#!/usr/bin/env bash
# Pre-PR CI gate (TEMPLATE). Copy to pre-pr-check.sh in the consuming project
# and wire the real checks. `ship` runs this before push/PR.
#
# Contract: exit 0 = green (ok to push), non-zero = red (block).
set -euo pipefail

echo "[pre-pr-check] TEMPLATE - replace with real project checks."

# Example wiring (uncomment + adapt per project):
# echo "[pre-pr-check] backend tests"
# poetry run pytest -q
#
# echo "[pre-pr-check] frontend build + tests"
# npm ci
# npm run test --silent
# npm run build

echo "[pre-pr-check] no real checks configured yet - failing closed."
exit 1
