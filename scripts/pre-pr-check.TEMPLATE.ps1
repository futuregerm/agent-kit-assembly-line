# Pre-PR CI gate (TEMPLATE). Copy to pre-pr-check.ps1 in the consuming project
# and wire the real checks. `ship` runs this before push/PR.
#
# Contract: exit 0 = green (ok to push), non-zero = red (block).
$ErrorActionPreference = "Stop"

Write-Host "[pre-pr-check] TEMPLATE - replace with real project checks."

# Example wiring (uncomment + adapt per project):
# Write-Host "[pre-pr-check] backend tests"
# poetry run pytest -q
#
# Write-Host "[pre-pr-check] frontend build + tests"
# npm ci
# npm run test --silent
# npm run build

Write-Host "[pre-pr-check] no real checks configured yet - failing closed."
exit 1
