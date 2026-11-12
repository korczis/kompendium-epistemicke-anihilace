#!/usr/bin/env bash
# Rule project.site-zola-engine (ADR 0011) through scripts/check-viz-layer.py, on a copy of the
# committed tree:
#
#  - the committed tree passes (every script folds text through KompendiumJadro.normalise or
#    KompendiumVrstva.slug and reads data through the existing loaders);
#  - a new script with its own diacritics folding (`.normalize('NFD')`) is refused;
#  - a new script that fetches static/data itself is refused;
#  - the same script calling the engine and the layer instead is accepted.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case23.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"

python3 scripts/check-viz-layer.py > /dev/null || { echo "committed tree refused"; exit 1; }

f=static/js/viz/case23.js
refused() {
  if python3 scripts/check-viz-layer.py > "$work/out" 2>&1; then echo "$1 not refused"; exit 1; fi
  grep -q "static/js/viz/case23.js" "$work/out" || { echo "$1 refused for another file"; exit 1; }
}

printf "function fold(s) { return String(s).normalize('NFD').replace(/x/g, '').toLowerCase(); }\n" > "$f"
refused "own folding"

printf "fetch('/static/data/graph.json').then(function (r) { return r.json(); });\n" > "$f"
refused "own data fetch"

printf "var a = window.KompendiumJadro.normalise('Řád');\nvar b = window.KompendiumVrstva.slug('Řád');\n" > "$f"
python3 scripts/check-viz-layer.py > /dev/null || { echo "engine and layer calls refused"; exit 1; }
echo "ok: engine ownership"
