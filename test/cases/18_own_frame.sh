#!/usr/bin/env bash
# Requirement `citations` of scripts/check-ia.py: the book's own frame, on a copy of the tree.
# majordomus-skill: kompendium-page-expansion
#
#  - an uncited prose paragraph of 20+ words is refused;
#  - the same paragraph linking one of the four method pages (eticke-aspekty, jak-pouzivat,
#    eticky-kodex, metodologicke-poznamky) passes: it states the book's frame, not a finding;
#  - a link to any other page does not count, so the exemption is no loophole;
#  - more than three such paragraphs on one page are refused (the fourth counts as uncited).
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case18.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "$(git -C "$root" write-tree)" | tar -x -C "$work"
cd "$work"
d=content/kompendium/case-18-fixture
mkdir -p "$d"
page() { printf '+++\ntitle = "%s"\n+++\n\n' "$1" > "$d/$1.md"; cat >> "$d/$1.md"; }
para() {
  printf 'Kniha popisuje tento vzorec jen jako rozpoznatelnou strukturu, aby ho čtenář poznal a %s\n' "$1"
  printf 'odlišil, a nikdy jako postup; proč a s jakými mezemi, vysvětlují %s.\n\n' "$2"
}
ethics='[etické aspekty](@/kompendium/01-predmluva/eticke-aspekty.md)'
method='[metodologické poznámky](@/kompendium/02-uvod/metodologicke-poznamky.md#rozsah)'
other='[glosář](@/glossary/_index.md)'

para "dokázal" "zásady knihy" | page uncited
para "dokázal" "$ethics" | page ethics
para "dokázal" "$method" | page method
para "dokázal" "$other" | page other
{ para "a" "$ethics"; para "b" "$ethics"; para "c" "$method"; } | page three
{ para "a" "$ethics"; para "b" "$ethics"; para "c" "$method"; para "d" "$ethics"; } | page four

python3 scripts/check-ia.py --list citations > "$work/list"
has() { grep -q "^$d/$1.md" "$work/list" || { echo "$1 not listed"; exit 1; }; }
hasnt() { if grep -q "^$d/$1.md" "$work/list"; then echo "$1 wrongly listed"; exit 1; fi; }

has uncited
hasnt ethics
hasnt method
has other
hasnt three
has four
echo "own frame: method pages only, at most three paragraphs per page"
