#!/usr/bin/env bash
# Requirement `template-figure` of scripts/check-ia.py, on a copy of the committed tree.
# majordomus-skill: kompendium-page-expansion
#
#  - a numeric row repeated byte-identically on 3 technique pages is refused on all three;
#  - the same row on 2 pages is not (the threshold is the evidence that it is template filler);
#  - editing the figure on one page clears that page and leaves the rest, while dropping the
#    group below the threshold clears them all;
#  - a row without a figure (no unit, comparison or statistic) is never refused, however often
#    it repeats — a shared label or an EA code is not a fabricated measurement;
#  - a citation year and a plain ordinal are not figures;
#  - a page outside content/kompendium/techniques/ is not judged by this rule.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case19.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "$(git -C "$root" write-tree)" | tar -x -C "$work"
cd "$work"
d=content/kompendium/techniques
g=content/glossary

page() { printf '+++\ntitle = "%s"\n+++\n\n' "$2" > "$1/$2.md"; cat >> "$1/$2.md"; }
listed() { python3 scripts/check-ia.py --list template-figure > "$work/list"; }
has() { grep -q "/$1.md\$" "$work/list" || { echo "$1 not refused"; exit 1; }; }
hasnt() { if grep -q "/$1.md\$" "$work/list"; then echo "$1 wrongly refused"; exit 1; fi; }

shared='| **Účinnost** | Cohenovo d = 0.92, NNT 2.4 |'
label='| **Kategorie** | 4. Terminální protokoly |'
cite='Podle Liftona (1961) jde o vzorec, který se opakuje; viz také Herman (1992).'

for n in case19-a case19-b case19-c case19-d; do
  page "$d" "$n" <<PAGE
$shared
$label
$cite

- Vzorec má 3 roviny a popisuje je oddíl níže.
PAGE
done
page "$g" case19-term <<PAGE
$shared
$label
PAGE

listed
has case19-a; has case19-b; has case19-c; has case19-d
hasnt case19-term   # not a technique page

# Two pages are not enough: the rule needs 3 to call a figure template filler.
rm "$d/case19-c.md" "$d/case19-d.md"
listed
hasnt case19-a; hasnt case19-b

# Back to four, then one page edits its own figure: that page clears, the other three stay.
for n in case19-c case19-d; do
  page "$d" "$n" <<PAGE
$shared
$label
PAGE
done
listed
has case19-a
python3 - <<'PY'
import pathlib
p = pathlib.Path("content/kompendium/techniques/case19-a.md")
p.write_text(p.read_text(encoding="utf-8").replace("d = 0.92, NNT 2.4", "d = 0.41"), encoding="utf-8")
PY
listed
hasnt case19-a
has case19-b; has case19-c; has case19-d

echo "template figures: identical numbers on 3+ technique pages are refused, unique ones are not"
