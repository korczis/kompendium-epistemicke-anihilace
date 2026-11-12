#!/usr/bin/env bash
# detail and weak-link, now never-baselined (PENDING_ZERO, ceiling only falls), on a copy of the
# committed tree:
#
#  - a page under the word floor (1100 for a page) is a `detail` finding;
#  - a page at/over the floor is not;
#  - a thin page that another page links is a `weak-link` finding on the TARGET (the thin page),
#    never on the linker;
#  - a page at/over the floor that is linked is not a weak-link finding.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case27.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "$(git -C "$root" write-tree)" | tar -x -C "$work"
cd "$work"
d=content/kompendium/techniques

# A thin page: well under the 1100-word floor.
printf '+++\ntitle = "case27-thin"\n+++\n\nKrátká stránka pod prahem; nemá dost běžného textu.\n' > "$d/case27-thin.md"
# A full page: a sentence repeated past the floor (academic_profile counts running words).
{ printf '+++\ntitle = "case27-full"\n+++\n\n'
  for i in $(seq 1 140); do
    echo "Toto je věta číslo $i, která přidává běžný odborný text, aby stránka pohodlně překročila práh jedenácti set slov a splnila tak požadavek na podstatu a hloubku výkladu daného tématu."
  done; } > "$d/case27-full.md"
# A linker whose own body is full, so it is not itself a detail finding; it links both targets.
{ printf '+++\ntitle = "case27-linker"\n+++\n\n'
  echo "Viz [tenká](@/kompendium/techniques/case27-thin.md) a [plná](@/kompendium/techniques/case27-full.md) stránka."
  for i in $(seq 1 140); do
    echo "Doplňující věta číslo $i, která dává odkazující stránce dost vlastního běžného textu, aby sama o sobě nebyla tenkým cílem a neobjevila se v detailu kvůli nedostatku podstaty."
  done; } > "$d/case27-linker.md"

python3 scripts/check-ia.py --list detail    > "$work/detail"    2>/dev/null || true
python3 scripts/check-ia.py --list weak-link  > "$work/weak"      2>/dev/null || true
has()   { grep -q "/$1.md" "$2" || { echo "$1 not in $2"; exit 1; }; }
hasnt() { if grep -q "/$1.md" "$2"; then echo "$1 wrongly in $2"; exit 1; fi; }

has   case27-thin   "$work/detail"   # under the floor -> detail
hasnt case27-full   "$work/detail"   # over the floor  -> not detail
hasnt case27-linker "$work/detail"   # full linker     -> not detail
has   case27-thin   "$work/weak"     # thin LINKED target -> weak-link on the target
hasnt case27-full   "$work/weak"     # full linked target -> not weak-link
hasnt case27-linker "$work/weak"     # the linker is never charged

echo "detail/weak-link: thin page refused by detail and (when linked) weak-link; a full page is not"
