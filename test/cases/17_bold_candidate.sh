#!/usr/bin/env bash
# Requirement `bold-candidate` of scripts/check-ia.py, on a copy of the committed tree.
# majordomus-skill: kompendium-page-expansion
#
#  - a bold phrase of up to six words on three or more pages, not a term and not a link, is
#    listed per phrase with its page count (bold:<slug>), and a new one fails the gate;
#  - on two pages, as a label, in a table's first cell or in a link it is not listed;
#  - as the lead label of a list item (`- **X** …`, `1. **X** …`) it is structure, not a term
#    use, and is not counted; the same phrase bolded mid-sentence on three pages still is;
#  - it is NEVER baselined: a hand-written baseline entry does not excuse a candidate, and
#    `--introduce bold-candidate` is refused (the worklist reached 0 in batch D, 2026-11-14);
#  - once a glossary entry carries the phrase, it leaves the worklist and bold-term enforces it.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case17.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
d=content/kompendium/case-17-fixture
mkdir -p "$d"
page() { printf '+++\ntitle = "%s"\n+++\n\n' "$1" > "$d/$1.md"; cat >> "$d/$1.md"; }

for n in 1 2 3; do
  page "p$n" <<'PAGE'
Text s **Fixturová fráze** v běhu a s **Dvojí fixturou** jen na dvou stránkách.

**Fixturový popisek**: hodnota. [**Fixturový odkaz**](@/kompendium/_index.md) vede jinam.

| **Fixturová buňka** | hodnota |
|---|---|
| **Fixturová buňka** | hodnota |
PAGE
done
sed -i.bak 's/s \*\*Dvojí fixturou\*\* jen/bez ní/' "$d/p3.md" && rm "$d/p3.md.bak"
python3 scripts/check-ia.py --list bold-candidate > "$work/list"
grep -qx $'bold:fixturova-fraze\t3 pages\tFixturová fráze' "$work/list" || { echo "phrase not listed"; grep fixtur "$work/list"; exit 1; }
if grep -q 'bold:\(dvoji-fixturou\|fixturovy-popisek\|fixturova-bunka\|fixturovy-odkaz\)' "$work/list"; then
  echo "an exempt phrase was listed"; grep fixtur "$work/list"; exit 1; fi
if python3 scripts/check-ia.py >"$work/gate.out" 2>&1; then
  echo "the gate passed a new bold candidate"; exit 1; fi
grep -Eq 'bold-candidate grew to [0-9]+ page\(s\):.*bold:fixturova-fraze|bold:fixturova-fraze: bold-candidate' "$work/gate.out" \
  || { echo "the new bold candidate was not named"; grep -i bold "$work/gate.out"; exit 1; }

# a list whose items lead with bold labels, on three pages: structure, never a candidate
for n in 1 2 3; do
  page "l$n" <<'PAGE'
Postup má tři kroky:

- **Fixturová položka** první krok v seznamu.
- **Druhá položka** druhý krok v seznamu.
1. **Fixturová položka** číslovaný krok.
PAGE
done
python3 scripts/check-ia.py --list bold-candidate > "$work/list"
if grep -q '^bold:fixturova-polozka' "$work/list"; then
  echo "a list item's lead label was counted"; grep fixtur "$work/list"; exit 1; fi
# the same phrase bolded mid-sentence on three other pages is still charged, and only those count
for n in 1 2 3; do
  page "m$n" <<'PAGE'
Uprostřed věty stojí **Fixturová položka** jako zvýraznění, ne jako popisek seznamu.
PAGE
done
python3 scripts/check-ia.py --list bold-candidate > "$work/list"
grep -qx $'bold:fixturova-polozka\t3 pages\tFixturová položka' "$work/list" \
  || { echo "a mid-sentence bold phrase was not charged on exactly its three pages"; grep fixtur "$work/list"; exit 1; }
rm "$d"/l?.md "$d"/m?.md

# never baselined: an entry written into the baseline by hand does not excuse the candidate
python3 - <<'PY'
import json, pathlib
p = pathlib.Path("scripts/ia-baseline.json")
b = json.loads(p.read_text(encoding="utf-8")) if p.exists() else {}
b["bold:fixturova-fraze"] = ["bold-candidate"]
p.write_text(json.dumps(b, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
PY
if python3 scripts/check-ia.py >"$work/gate.out" 2>&1; then
  echo "a baselined bold candidate was excused"; exit 1; fi
grep -Eq 'bold-candidate grew to [0-9]+ page\(s\):.*bold:fixturova-fraze|bold:fixturova-fraze: bold-candidate' "$work/gate.out" \
  || { echo "the baseline entry excused bold:fixturova-fraze"; grep -i bold "$work/gate.out"; exit 1; }
if python3 scripts/check-ia.py --introduce bold-candidate >"$work/intro.out" 2>&1; then
  echo "--introduce bold-candidate was accepted"; exit 1; fi
grep -q 'never accepted into the baseline' "$work/intro.out" || { cat "$work/intro.out"; exit 1; }

cat > content/glossary/fixturova-fraze.md <<'PAGE'
+++
title = "Fixturová fráze"
+++

## Definice

Heslo jen pro test.
PAGE
python3 scripts/check-ia.py --list bold-candidate > "$work/list"
if grep -q '^bold:fixturova-fraze' "$work/list"; then echo "still a candidate"; exit 1; fi
python3 scripts/check-ia.py --list bold-term > "$work/list"
grep -qx "$d/p1.md	Fixturová fráze" "$work/list"
echo "case 17: widespread bold phrases are a worklist of missing glossary pages"
