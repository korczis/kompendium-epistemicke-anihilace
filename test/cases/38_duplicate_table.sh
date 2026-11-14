#!/usr/bin/env bash
# Requirement `duplicate-table` of scripts/check-ia.py (ADR 0013), on a copy of the committed tree.
# The complement of duplicate-passage (which skips tables): a table DATA row (8+ words, whitespace-
# and EA-code-normalised) re-pasted byte-identical on 3 content/kompendium pages is refused on all
# three. NOT refused: the same on only 2 pages; a metadata field (bold-label first cell AND a short
# second cell — a code/level/link). A pasted prose sentence in the second cell of a bold-label row
# ("| **Mechanismus** | long sentence |") STAYS refused. An interpolated own EA code still groups.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case38.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
d=content/kompendium/techniques
tbl() { printf '+++\ntitle = "%s"\n+++\n\n| A | B |\n|---|---|\n%s\n' "$2" "$3" > "$1/$2.md"; }
listed() { python3 scripts/check-ia.py --list duplicate-table > "$work/list" 2>/dev/null || true; }
has()   { grep -q "/$1.md" "$work/list" || { echo "$1 not refused"; exit 1; }; }
hasnt() { if grep -q "/$1.md" "$work/list"; then echo "$1 wrongly refused"; exit 1; fi; }

ROW="| Subjekt opakovaně používá naučené fráze ve více než osmi slovech řádku | Pozorovatel to čte jako jasný znak |"
ROW2="| Jiný řádek o více než osmi slovech, který stojí jen na dvou stránkách knihy | hodnota |"
META="| **Toto je dlouhý tučný popisek o osmi slovech celkem** | L3 |"
MECH="| **Mechanismus** | Dlouhá pasovaná věta o více než pěti slovech, totožná na všech stránkách knihy |"

for n in c38-a c38-b c38-c; do tbl "$d" "$n" "$ROW"; done
for n in c38-two1 c38-two2; do tbl "$d" "$n" "$ROW2"; done
for n in c38-meta1 c38-meta2 c38-meta3; do tbl "$d" "$n" "$META"; done
for n in c38-mech1 c38-mech2 c38-mech3; do tbl "$d" "$n" "$MECH"; done
# interpolated own code: each row carries the page's OWN code; after normalisation the three group
cr() { printf '| Řádek nese vlastní kód **EA-%s** a více než osm slov po normalizaci | hodnota |' "$1"; }
for n in c38-code1:4.2.5 c38-code2:6.3.3 c38-code3:5.4.1; do tbl "$d" "${n%%:*}" "$(cr "${n##*:}")"; done

listed
has   c38-a; has c38-b; has c38-c         # pasted prose-in-cell table row on 3 pages
hasnt c38-two1; hasnt c38-two2            # only 2 pages — below threshold
hasnt c38-meta1; hasnt c38-meta2          # bold-label + short value (level) — metadata field, exempt
has   c38-mech1; has c38-mech2; has c38-mech3  # bold label but a prose SENTENCE in cell 2 — still refused
has   c38-code1; has c38-code2; has c38-code3  # interpolated own-code row, grouped after normalisation

echo "duplicate-table: a pasted table row on 3+ pages is refused (whitespace/EA-normalised); a bold-label metadata field is exempt only with a short value; 2 pages pass"
