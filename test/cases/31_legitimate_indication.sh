#!/usr/bin/env bash
# Requirement `legitimate-indication` of scripts/check-ia.py (ADR 0013), on a copy of the committed
# tree. On a technique page, a heading naming legitimate indications / permitted use / conditions
# for application grants applier permission and is refused; the byte-identical permission item is
# refused too (so renaming the heading does not evade); an EXCLUSION / contraindication heading is
# not; a non-technique page is not judged.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case31.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "$(git -C "$root" write-tree)" | tar -x -C "$work"
cd "$work"
d=content/kompendium/techniques
mkdir -p "$d" content/glossary
page() { printf '+++\ntitle = "%s"\n+++\n\n' "$2" > "$1/$2.md"; cat >> "$1/$2.md"; }
listed() { python3 scripts/check-ia.py --list legitimate-indication > "$work/list" 2>/dev/null || true; }
has()   { grep -q "/$1.md" "$work/list" || { echo "$1 not refused"; exit 1; }; }
hasnt() { if grep -q "/$1.md" "$work/list"; then echo "$1 wrongly refused"; exit 1; fi; }

page "$d" c31-heading <<'P'
### Legitimní indikace (vzácné, výhradně supervidovaný kontext)

- Klinická intervence u striktně vymezených diagnóz.
P
page "$d" c31-reworded <<'P'
## Podmínky použití techniky v supervidovaném kontextu

Text popisující, kdy je legitimní techniku nasadit.
P
page "$d" c31-permission <<'P'
## Poznámka

Klinická intervence u striktně vymezených diagnóz, kde benefit prokazatelně převažuje riziko.
P
page "$d" c31-exclusion <<'P'
## Vylučující okolnosti

Za těchto okolností se technika nikdy neaplikuje.
P
page "$d" c31-contra <<'P'
## Kontraindikace

## Indikace

Běžné nadpisy, které nejsou povolením k aplikaci.
P
page content/glossary c31-glossary <<'P'
### Legitimní indikace (vzácné, výhradně supervidovaný kontext)

Mimo techniky se tento nadpis neposuzuje.
P

listed
has   c31-heading      # the legitimate-indications heading
has   c31-reworded     # a reworded permission heading (shape, not exact string)
has   c31-permission   # the permission item, even without the heading
hasnt c31-exclusion    # an exclusion / contraindication heading is the fix, not the offence
hasnt c31-contra       # plain "Kontraindikace" / "Indikace" are not applier permission
hasnt c31-glossary     # not a technique page

echo "legitimate-indication: a permission heading or item on a technique page is refused; exclusion/contra and non-technique are not"
