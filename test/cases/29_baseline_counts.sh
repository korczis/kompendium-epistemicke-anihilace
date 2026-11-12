#!/usr/bin/env bash
# Count-bearing baseline for `citations` (and `bullets`), on a copy of the committed tree. The
# baseline stores a per-page COUNT ("citations:N"); the gate refuses an INCREASE on a baselined
# page, accepts a decrease, and --update-baseline only re-stamps the lower count. So turning a
# list into uncited prose — more uncited paragraphs under the same rule name — can no longer pass.
#
#  - a page baselined with 3 uncited paragraphs passes;
#  - raising it to 4 is refused and reported as "citations (3->4)";
#  - lowering it to 2 passes (the count only falls);
#  - --update-baseline then re-stamps the baseline at the lower count.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case29.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "$(git -C "$root" write-tree)" | tar -x -C "$work"
cd "$work"
d=content/kompendium/case-29-fixture
key=content/kompendium/case-29-fixture/case29.md
mkdir -p "$d"

L="Tento odstavec má přes dvacet slov a vykládá odborné tvrzení o manipulaci, které čtenář musí umět dohledat, protože nejde o běžnou úvahu ale o doložitelný fakt z literatury"
# N uncited paragraphs plus cited padding past the 1100-word floor and a Literatura section, so the
# page's uncited COUNT is exactly N; it carries other new-page findings too, which the step below
# baselines wholesale — the test then moves ONLY the citations count.
mk() {
  { printf '+++\ntitle = "case29"\n+++\n\n'
    for _ in $(seq 1 "$1"); do printf '%s bez citace.\n\n' "$L"; done
    for _ in $(seq 1 45); do printf '%s (Lifton, 1961).\n\n' "$L"; done
    printf '## Literatura\n\n- Lifton, R. J. (1961). *Thought Reform*. New York: Norton.\n'
  } > "$d/case29.md"
}
ci() { python3 scripts/check-ia.py >/dev/null 2>&1; echo $?; }

# Baseline the page's whole current violation set, stamping count-bearing rules at their count,
# via check-ia's own current()/stamp (same as --extend for every rule the page has).
baseline_all() {
  python3 - "$key" <<'PY'
import json, sys, importlib.util
spec = importlib.util.spec_from_file_location("cia", "scripts/check-ia.py")
cia = importlib.util.module_from_spec(spec); spec.loader.exec_module(cia)
counts = {}; now = cia.current(None, counts)
key = sys.argv[1]
b = json.load(open("scripts/ia-baseline.json", encoding="utf-8"))
b[key] = [cia.stamp(key, r, counts) for r in now[key]]
json.dump(b, open("scripts/ia-baseline.json", "w", encoding="utf-8"),
          ensure_ascii=False, indent=1, sort_keys=True)
PY
}

mk 3
baseline_all
[ "$(ci)" = 0 ] || { echo "page baselined at citations:3 is still refused"; exit 1; }

mk 4
# capture first: check-ia exits 1 here, and under `set -o pipefail` a `| grep` would mask the match.
python3 scripts/check-ia.py > "$work/out" 2>/dev/null || true
grep -q "case29.md: citations (3->4)" "$work/out" || { echo "count increase 3->4 not reported"; exit 1; }
[ "$(ci)" = 1 ] || { echo "count increase 3->4 not refused"; exit 1; }

mk 2
[ "$(ci)" = 0 ] || { echo "count decrease 3->2 wrongly refused"; exit 1; }
python3 scripts/check-ia.py --update-baseline >/dev/null 2>&1
python3 -c "import json; d=json.load(open('scripts/ia-baseline.json')); print('\n'.join(d['$key']))" > "$work/entry"
grep -qx "citations:2" "$work/entry" || { echo "--update-baseline did not re-stamp to citations:2"; exit 1; }

echo "baseline counts: a baselined citations count is frozen; an increase is refused, a decrease passes and re-stamps"
