#!/usr/bin/env bash
set -euo pipefail

# Read .github/sync-targets.txt, strip comments and blank lines,
# and emit a compact JSON array, e.g. ["myorg/repo-a","myorg/repo-b"]
json=$(grep -v '^\s*#' .github/sync-targets.txt \
  | grep -v '^\s*$' \
  | jq -Rsc '[split("\n")[] | select(. != "")]')
echo "targets=$json" >> "$GITHUB_OUTPUT"
