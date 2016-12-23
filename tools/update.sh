#!/usr/bin/env bash
# Author michael <themichaeleden@gmail.com>
set -euo pipefail

PWD=$(pwd)
export REV=$(git rev-parse --short HEAD)
export REMOTE="https://$GH_TOKEN@github.com/illegalprime/illegalprime.github.io.git"
export N_PREFIX="$PWD/node_modules/.bin/nodes"

# update node
n="$PWD/node_modules/.bin/n"
npm install n
$n lts
node="$N_PREFIX/bin/node"
npm="$N_PREFIX/bin/npm"

$node $npm install
cleancss="$PWD/node_modules/.bin/cleancss"
uncss="$PWD/node_modules/.bin/uncss"

gem install jekyll
bundle install
bundle exec jekyll build

cd _site

# process css
echo "Processing CSS..."
find -type f -name '*.html' | \
    grep -v -f ../exclude | \
    xargs $node $uncss -H . -s /assets/css/main.css | \
    $node $cleancss \
    > assets/css/main.min.css
mv assets/css/main.min.css assets/css/main.css

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
