#!/usr/bin/env bash
# Requirement `authority-without-source` of scripts/check-ia.py (ADR 0014), on a copy of the
# committed tree. A parenthetical group of 2+ surnames with no year on the line, pasted identically
# on 3+ pages, is name-dropped authority and is refused on all of them. NOT refused: the same on
# only 2 pages (below the pasted threshold); a group with a year on the line (a real citation); a
# capitalised pair whose words the book uses in lowercase prose (concept words, not surnames —
# "(Přesvědčení, Imprint)"). Invented tokens keep the fixtures independent of the live corpus.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case33.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
d=content/kompendium/techniques
mkdir -p "$d"
page() { printf '+++\ntitle = "%s"\n+++\n\n' "$2" > "$1/$2.md"; cat >> "$1/$2.md"; }
listed() { python3 scripts/check-ia.py --list authority-without-source > "$work/list" 2>/dev/null || true; }
has()   { grep -q "/$1.md" "$work/list" || { echo "$1 not refused"; exit 1; }; }
hasnt() { if grep -q "/$1.md" "$work/list"; then echo "$1 wrongly refused"; exit 1; fi; }

# invented surnames that never appear lowercased anywhere → pure name-drops
for n in c33-a c33-b c33-c; do page "$d" "$n" <<<"Opírá se o klinickou tradici (Qwendolyn, Zyrtakul) bez bližšího určení."; done
# only two pages: below the pasted threshold
for n in c33-two1 c33-two2; do page "$d" "$n" <<<"Zmínka (Hradecky, Oswaldus) stojí jen na dvou stránkách."; done
# a year on the line → a real citation, the line is skipped
for n in c33-yr1 c33-yr2 c33-yr3; do page "$d" "$n" <<<"Doloženo (Marenburg, Teplitzer, 2019) v recenzované práci."; done
# a capitalised pair whose words the book uses in lowercase prose → concept words, not surnames
for n in c33-con1 c33-con2 c33-con3; do page "$d" "$n" <<<"Dvojice (Trojmezi, Blankyt) se opakuje na třech stránkách."; done
# make the lowercase forms genuine corpus words (>2 occurrences) so the discriminator drops them
page "$d" c33-lex <<'P'
Pojem trojmezi a pojem blankyt jsou běžná slova: trojmezi, trojmezi, blankyt, blankyt v textu.
P

listed
has   c33-a; has c33-b; has c33-c      # pasted name-drop on 3 pages
hasnt c33-two1; hasnt c33-two2         # only 2 pages — below threshold
hasnt c33-yr1; hasnt c33-yr2           # a year on the line is a real citation
hasnt c33-con1; hasnt c33-con2         # concept words the book uses lowercased, not surnames

echo "authority-without-source: a surname pair pasted on 3+ pages with no year is refused; 2 pages, a year, and concept-word pairs are not"
