#!/usr/bin/env bash
# Requirement `bullets` of scripts/check-ia.py, on a copy of the committed tree.
# majordomus-skill: kompendium-page-expansion
#
#  - a list item in the running text is refused, the same point written as a paragraph passes;
#  - not lists: "2011)" or "44." starting a wrapped line of an open paragraph (CommonMark: an
#    ordered item interrupts a paragraph only when its number is 1), lists in Literatura and
#    Související, lists in a generated block.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case11.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
d=content/kompendium/case-11-fixture
mkdir -p "$d"
page() { printf '+++\ntitle = "%s"\n+++\n\n' "$1" > "$d/$1.md"; cat >> "$d/$1.md"; }
listed() { python3 scripts/check-ia.py --list "$1" | cut -f1 > "$work/list"; }
has() { grep -qx "$d/$1.md" "$work/list" || { echo "$1 not listed"; exit 1; }; }
hasnt() { if grep -qx "$d/$1.md" "$work/list"; then echo "$1 wrongly listed"; exit 1; fi; }

page seeded <<'PAGE'
Úvodní odstavec.

- odrážka místo odstavce
PAGE
page numbered <<'PAGE'
Úvodní odstavec:
1. číslovaný bod přeruší odstavec
PAGE
page fixed <<'PAGE'
Úvodní odstavec.

Tentýž bod napsaný jako odstavec.
PAGE
page wrapped <<'PAGE'
Studie vyšla v roce (Lifton, 1961; Singer,
2011) a její závěry se opakují v pozdější literatuře, kterou shrnuje kapitola
44. svazku řady, jež vyšla o mnoho let později.

## Literatura

- Lifton, R. J. (1961). *Thought Reform*. Norton.
1. Singer, M. T. (2011). *Cults in Our Midst*. Jossey-Bass.

## Související

- [Úvod](@/kompendium/_index.md)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->
- [Odvozená vazba](@/kompendium/_index.md)
<!-- kompendium:odvozene-vazby:end -->
PAGE
listed bullets
has seeded; has numbered; hasnt fixed; hasnt wrapped
echo "case 11: bullets outside Literatura and Související are refused"
