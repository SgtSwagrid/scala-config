#!/usr/bin/env bash
set -euo pipefail

# Load exceptions into an associative set for O(1) lookup.
declare -A EXCEPTED
while IFS= read -r line; do
  EXCEPTED["$line"]=1
done < <(grep -v '^\s*#' source/.github/sync-exceptions.txt | grep -v '^\s*$')

is_excepted() { [[ -n "${EXCEPTED[$1]+_}" ]]; }

cd source

# --- 1. Copy all currently tracked files (minus exceptions) ------------------
mapfile -t CURRENT < <(git ls-files)
for file in "${CURRENT[@]}"; do
  if is_excepted "$file"; then
    echo "Skipping (excepted): $file"
    continue
  fi
  dest="../target/$file"
  mkdir -p "$(dirname "$dest")"
  cp "$file" "$dest"
  echo "Copied: $file"
done

# --- 2. Delete files removed from this repo (and not excepted) ---------------
# Files ever deleted in git history, minus files currently tracked
# (handles the case where a file was deleted then re-added).
mapfile -t EVER_DELETED < <(
  git log --diff-filter=D --name-only --pretty=format: | sort -u
)
declare -A CURRENT_SET
for f in "${CURRENT[@]}"; do CURRENT_SET["$f"]=1; done

for file in "${EVER_DELETED[@]}"; do
  [[ -z "$file" ]] && continue
  # Skip if re-added to this repo.
  [[ -n "${CURRENT_SET[$file]+_}" ]] && continue
  # Skip if excepted.
  is_excepted "$file" && continue

  target_file="../target/$file"
  if [[ -e "$target_file" ]]; then
    rm "$target_file"
    echo "Deleted (removed from source): $file"
  fi
done
