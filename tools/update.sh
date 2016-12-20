#!/usr/bin/env bash
# Author michael <themichaeleden@gmail.com>
set -euo pipefail

OLD_BRANCH=$(git branch | grep '^*' | cut -d' ' -f2)
COMMIT_MSG="$1"

jekyll build -d /tmp/_site

git co master

git fetch

git reset --hard origin/master

git clean -d -f

rsync -auP --checksum /tmp/_site/ "$(pwd)"

git add -A

git commit -m "$COMMIT_MSG"

git push origin master

git co "$OLD_BRANCH"
