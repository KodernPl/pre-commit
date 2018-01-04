#!/bin/sh

# test only commited changes
STASH_NAME="pre-commit-$(date +%s)"
git stash save -q --keep-index $STASH_NAME


echo "Runnign lint..."
npm run lint

echo "Runnint tests..."
npm run test

# pop out stash
STASHES=$(git stash list)
if [[ $STASHES == "$STASH_NAME" ]]; then
  git stash pop -q
fi