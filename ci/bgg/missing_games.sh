#!/usr/bin/env bash
set -euo pipefail

DATA_DIR="${1:-.}"
BGG_YAML="${2:-$DATA_DIR/bgg_data.yaml}"
MY_YAML="${3:-$DATA_DIR/my_data.yaml}"

ALL=$(yq -r 'keys[]' < "$BGG_YAML")

# entered games
ENTERED=$(yq -r 'to_entries[] | .key' < "$MY_YAML")
# hidden
HIDDEN=$(yq -r 'to_entries[] | select(.value.tags == null) | .key' < "$MY_YAML")
# remove hidden from entered
VISIBLE=$(comm -23 <(sort -u <<< "$ENTERED") <(sort -u <<< "$HIDDEN"))
# show only games that appear in bgg and not in my own data
echo -e 'To Add\tTo Remove\n'
comm -3 <(sort -u <<< "$ALL") <(sort -u <<< "$VISIBLE")
