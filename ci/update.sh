#!/usr/bin/env bash
# Author michael <themichaeleden@gmail.com>
set -euo pipefail
set -x

PWD=$(pwd)
export REV=$(git rev-parse --short HEAD)
export REMOTE="${REMOTE:-https://$GH_TOKEN@github.com/illegalprime/illegalprime.github.io.git}"

echo "Building Website..."
jekyll build

cd _site

echo "Processing CSS..."
find -type f -name '*.html' | \
    xargs uncss -H . -s /assets/css/main.css | \
    cleancss \
    > assets/css/main.min.css
mv assets/css/main.min.css assets/css/main.css

echo "Pushing to Git..."
git init
git config user.name 'Michael Eden'
git config user.email 'themichaeleden@gmail.com'
git remote add upstream "$REMOTE"
git fetch upstream
git reset upstream/master
git status
git add -A .
git commit -m "Automatic deploy of website for commit $REV"
git push -q upstream HEAD:master

echo "Purging Cloudflare Cache..."
curl -X DELETE "https://api.cloudflare.com/client/v4/zones/$CF_ZONE/purge_cache" \
     -H "X-Auth-Email: $CF_EMAIL" \
     -H "X-Auth-Key: $CF_KEY" \
     -H "Content-Type: application/json" \
     --data '{"purge_everything":true}' &>/dev/null
