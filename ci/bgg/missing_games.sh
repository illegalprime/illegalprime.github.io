#!/usr/bin/env bash
set -euo pipefail

DATA_DIR="${1:-.}"
BGG_YAML="${2:-$DATA_DIR/bgg_data.yaml}"
MY_YAML="${3:-$DATA_DIR/my_data.yaml}"

ALL=$(yq -r 'keys[]' < "$BGG_YAML")
ENTERED=$(yq -r 'to_entries[] | select(.value.tags == null) | .key' < "$MY_YAML")

comm -1 <(sort -u <<< "$ALL") <(sort -u <<< "$ENTERED")
