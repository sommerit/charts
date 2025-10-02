#!/usr/bin/env bash
set -euo pipefail

# Simple audit: list image-related values for each chart
# Outputs a human-friendly summary for maintainers.

shopt -s nullglob
for chart in sommerit/*; do
  values_file="$chart/values.yaml"
  if [[ -f "$values_file" ]]; then
    echo "===== $(basename "$chart") ====="
    # Show image-related defaults
    grep -nE '\b(image:|repository:|registry:|tag:|pullSecrets:|imageRegistry)\b' "$values_file" || true
    echo
  fi
done

echo "Tip: Most charts support global overrides, e.g. --set global.imageRegistry=REGISTRY --set global.imagePullSecrets={name}"
