#!/usr/bin/env bash
# Rule project.site-zola-engine (ADR 0011) through scripts/check-viz-layer.py, on a copy of the
# committed tree:
#
#  - the committed tree passes (every script folds text through KompendiumJadro.normalise or
#    KompendiumVrstva.slug and reads data through the existing loaders);
#  - a new script with its own diacritics folding (`.normalize('NFD')`) is refused;
#  - a new script that fetches static/data itself is refused;
#  - the same script calling the engine and the layer instead is accepted;
#  - a script with its own copy of a layer helper (esc, plural, ink, … as a function or an
#    arrow), its own IntersectionObserver or its own history.replaceState is refused, and the
#    same script calling KompendiumVrstva (an alias included) is accepted.
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

printf "function esc(s) { return String(s); }\n" > "$f"
refused "own esc"

printf "const plural = (n, forms) => forms[n === 1 ? 0 : 2];\n" > "$f"
refused "own arrow plural"

printf "var ink = function (hex) { return '#fff'; };\n" > "$f"
refused "own function-expression ink"

printf "new IntersectionObserver(function () {}).observe(document.body);\n" > "$f"
refused "own IntersectionObserver"

printf "window.history.replaceState(null, '', '?q=1');\n" > "$f"
refused "own URL state"

cat > "$f" <<'JS'
var L = window.KompendiumVrstva;
var failed = window.KompendiumVrstva.failed;
L.mount('case23', function (root) { root.textContent = L.count(3, ['a', 'b', 'c']) + L.esc('<'); });
L.urlState.set({ q: L.urlState.get().get('q') });
JS
python3 scripts/check-viz-layer.py > /dev/null || { echo "layer helper calls refused"; exit 1; }
echo "ok: engine ownership"
