#!/usr/bin/env bash
# The surfaces gate (scripts/build-surfaces.py) is a ratchet, on a copy of the committed tree.
#
#  - --check passes on the real tree, built with zola;
#  - removing a class from KNOWN_GAPS fails while that class still lacks a covered view;
#  - an entry of KNOWN_GAPS that is covered fails (the list only shrinks);
#  - a new page class (a fixture section) with no scenario fails while the graph does not know
#    it; once the graph is regenerated, a derived per-class scenario covers it when one of its
#    pages renders a view, and a class without any view stays a gap.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case02.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "$(git -C "$root" write-tree)" | tar -x -C "$work"  # the index: what is about to be committed
cd "$work"
# The stylesheet is built by npm (ignored by git); zola only needs the file for its cachebust.
mkdir -p static/css && touch static/css/app.css

site="$work/.site"
out="$work/gate.out"
build() {
  rm -rf "$site"
  zola build --output-dir "$site" >"$out" 2>&1 || { cat "$out"; exit 1; }
}
gate() { python3 scripts/build-surfaces.py --check --site "$site" >"$out" 2>&1; }
expect_fail() {
  if gate; then echo "build-surfaces passed: $1"; cat "$out"; exit 1; fi
  grep -F -- "$2" "$out" >/dev/null || { echo "missing finding for $1: $2"; cat "$out"; exit 1; }
}

# Unknown options are refused before anything is written; --help only prints.
python3 scripts/build-surfaces.py --help >/dev/null
if python3 scripts/build-surfaces.py --bogus >/dev/null 2>&1; then
  echo "build-surfaces accepted --bogus"; exit 1
fi

build
gate || { echo "build-surfaces --check fails on the committed tree"; cat "$out"; exit 1; }

# Removing a gap that still lacks a view fails, naming it.
cp scripts/build-surfaces.py "$work/gate.py.orig"
first=$(awk '/^KNOWN_GAPS = \(/ {on = 1; next} on {gsub(/[ ",]/, ""); print; exit}' \
  scripts/build-surfaces.py)
[ -n "$first" ] || { echo "KNOWN_GAPS is empty: pick another removal case"; exit 1; }
grep -v -x "    \"$first\"," "$work/gate.py.orig" > scripts/build-surfaces.py
expect_fail "removed gap $first" "$first: new class without a view covered by a scenario"

# A covered class listed as a gap fails: the list only shrinks.
covered=$(python3 -c 'import json; c = json.load(open("static/data/surfaces.json"))["classes"]
print(next(k for k in sorted(c) if c[k]["status"] == "covered"))')
python3 - "$covered" "$work/gate.py.orig" scripts/build-surfaces.py <<'PY'
import sys
cls, src, dst = sys.argv[1:]
text = open(src, encoding="utf-8").read()
open(dst, "w", encoding="utf-8").write(
    text.replace("KNOWN_GAPS = (\n", f'KNOWN_GAPS = (\n    "{cls}",\n', 1))
PY
expect_fail "covered class $covered on the list" "$covered: covered now; remove it from KNOWN_GAPS"
cp "$work/gate.py.orig" scripts/build-surfaces.py

# A new page class fails without a scenario, even when its page renders a view (a diagram).
fixture=content/kompendium/case-02-fixture
mkdir -p "$fixture"
printf '+++\ntitle = "Fixture"\n+++\n\nOddíl bez scénáře.\n' > "$fixture/_index.md"
printf '+++\ntitle = "Stránka"\n+++\n\n```mermaid\ngraph LR\n  A --> B\n```\n' \
  > "$fixture/stranka.md"
build
expect_fail "fixture class" \
  "kompendium/case-02-fixture: new class without a view covered by a scenario (its views mermaid"

# With the link graph regenerated, derived() sees the fixture class: its most linked page that
# renders a view gets a per-class scenario, so the class is covered without a hand-written one.
python3 scripts/build-graph.py >/dev/null
build
python3 scripts/build-surfaces.py --site "$site" >"$out" 2>&1 \
  || { echo "build-surfaces fails with the fixture class in the graph"; cat "$out"; exit 1; }
python3 - <<'PY'
import json
c = json.load(open("static/data/surfaces.json"))["classes"]["kompendium/case-02-fixture"]
assert c["status"] == "covered", f"fixture class is {c['status']}, not covered"
assert any(s["origin"] == "derived" and s["covers"] for s in c["scenarios"]), c["scenarios"]
PY

# A class whose pages render no view gets no scenario and stays a gap.
bare=content/kompendium/case-02-bez-pohledu
mkdir -p "$bare"
printf '+++\ntitle = "Bez pohledu"\n+++\n\nOddíl bez pohledu.\n' > "$bare/_index.md"
python3 scripts/build-graph.py >/dev/null
build
expect_fail "class without a view" \
  "kompendium/case-02-bez-pohledu: new class without a view covered by a scenario (its pages render no class view"
