#!/usr/bin/env bash
# Requirement `bold-candidate` of scripts/check-ia.py, on a copy of the committed tree.
# majordomus-skill: kompendium-page-expansion
#
#  - a bold phrase of up to six words on three or more pages, not a term and not a link, is
#    listed per phrase with its page count (bold:<slug>), and a new one fails the gate;
#  - on two pages, as a label, in a table's first cell or in a link it is not listed;
#  - once a glossary entry carries the phrase, it leaves the worklist and bold-term enforces it.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case17.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "$(git -C "$root" write-tree)" | tar -x -C "$work"
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
grep -q 'bold:fixturova-fraze: bold-candidate' "$work/gate.out"

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
