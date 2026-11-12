#!/usr/bin/env bash
# Requirement `clinical-figure` of scripts/check-ia.py (ADR 0012), on a copy of the committed tree:
#
#  - a duration range, a share of sessions, a session count and a score threshold in prose
#    without a citation are each refused;
#  - the same sentence with an author-year citation is accepted;
#  - a figure inside `## Literatura` is not judged;
#  - a page outside content/kompendium/ is not judged.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case24.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "$(git -C "$root" write-tree)" | tar -x -C "$work"
cd "$work"
d=content/kompendium/techniques

page() { printf '+++\ntitle = "%s"\n+++\n\n' "$2" > "$1/$2.md"; cat >> "$1/$2.md"; }
listed() { python3 scripts/check-ia.py --list clinical-figure > "$work/list" 2>/dev/null || true; }
has() { grep -q "/$1.md" "$work/list" || { echo "$1 not refused"; exit 1; }; }
hasnt() { if grep -q "/$1.md" "$work/list"; then echo "$1 wrongly refused"; exit 1; fi; }

page "$d" case24-duration <<'P'
Zotavení po odchodu ze skupiny typicky vyžaduje 12–36 měsíců strukturované práce s terapeutem.
P
page "$d" case24-share <<'P'
- Kvalita se hlídá supervizí alespoň 10 % sessions a pravidelnou konzultací.
P
page "$d" case24-count <<'P'
| Fáze | Rozsah |
|---|---|
| Stabilizace | 6–12 sezení |
P
page "$d" case24-threshold <<'P'
Intervence se přeruší, když skóre DES > 30 nebo když HRV klesne pod výchozí hodnotu.
P
page "$d" case24-dose <<'P'
Supervize na supervizi vyžaduje minimum 100h, než supervizor převezme vlastní skupinu.
P
page "$d" case24-techniques <<'P'
Většina reálných epizod je kombinací 3–7 elementárních technik, které se navzájem posilují.
P
page "$d" case24-cited <<'P'
Zotavení po odchodu ze skupiny trvá podle studie měsíce až roky, typicky 12–36 měsíců (Lalich, 2004).

## Literatura

- Lalich, J. (2004). Bounded Choice. University of California Press. 12–36 měsíců.
P
page "$d" case24-cds <<'P'
Rozlišení podporuje Cambridge Depersonalization Scale (CDS) skore >70 v kombinaci s anamnézou.
P
page "$d" case24-subscale <<'P'
Patognomické je skóre dissociation subscale >10 při současném zachování testování reality.
P
page "$d" case24-hours <<'P'
Akutní derealizace typicky resolvuje do 24–72h po odeznění spouštěče.
P
page content/glossary case24-glossary <<'P'
Zotavení typicky vyžaduje 12–36 měsíců strukturované práce.
P

listed
has case24-duration
has case24-share
has case24-count
has case24-threshold
has case24-dose
has case24-techniques
has case24-cds
has case24-subscale
has case24-hours
hasnt case24-cited
hasnt case24-glossary
echo "case 24: unsourced clinical figures are refused, cited ones and bibliographies are not"
