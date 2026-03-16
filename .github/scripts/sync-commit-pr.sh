#!/usr/bin/env bash
# Usage: sync-commit-pr.sh <target-repo> <source-sha> <source-repo>
set -euo pipefail

TARGET_REPO="$1"
SOURCE_SHA="$2"
SOURCE_REPO="$3"

cd target

git config user.name  "github-actions[bot]"
git config user.email "github-actions[bot]@users.noreply.github.com"

# Ensure pushes use the token explicitly.
git remote set-url origin "https://x-access-token:${GH_TOKEN}@github.com/${TARGET_REPO}.git"

# Detect the default branch of the target repo.
DEFAULT_BRANCH=$(gh repo view "$TARGET_REPO" --json defaultBranchRef --jq '.defaultBranchRef.name')

# Always base the sync branch on the latest default branch so the PR
# is never out of date, even if main moved forward since checkout.
git fetch origin "$DEFAULT_BRANCH"
SYNC_BRANCH="sync/scala-settings"
git checkout -B "$SYNC_BRANCH" "origin/$DEFAULT_BRANCH"

git add -A

if git diff --cached --quiet; then
  echo "No changes to commit for ${TARGET_REPO}."
  exit 0
fi

git commit -m "[config]: Sync settings from `scala-settings`."

# Force-push so a second run updates the branch in place.
# If a PR is already open against this branch it will reflect the
# new commits automatically — no need to close and reopen.
git push --force origin "$SYNC_BRANCH"

# Open a PR only if one isn't already open for this branch.
existing=$(gh pr list \
  --repo "$TARGET_REPO" \
  --head "$SYNC_BRANCH" \
  --state open \
  --json number \
  --jq 'length')

if [[ "$existing" -eq 0 ]]; then
  gh pr create \
    --repo "$TARGET_REPO" \
    --head "$SYNC_BRANCH" \
    --base "$DEFAULT_BRANCH" \
    --title "[config]: Sync settings from `scala-settings`." \
    --body "Automatic synchronisation from [scala-settings](https://github.com/${SOURCE_REPO}) ([\`${SOURCE_SHA}\`](https://github.com/${SOURCE_REPO}/commit/${SOURCE_SHA}))."
else
  echo "PR already open for $SYNC_BRANCH — updated by force-push."
fi
