#!/usr/bin/env bash
# Requirement `access-level-row` of scripts/check-ia.py: the access level is data (extra.access_level)
# rendered derived in the page header as a link to the classification page; a hand-written
# "| **Přístupová úroveň** | … |" row in content drifts and is refused. A page without the row passes;
# a non-kompendium page is not judged.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case39.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
d=content/kompendium/techniques
page() { printf '+++\ntitle = "%s"\n+++\n\n%s\n' "$2" "$3" > "$1/$2.md"; }
listed() { python3 scripts/check-ia.py --list access-level-row > "$work/list" 2>/dev/null || true; }
has()   { grep -q "/$1.md" "$work/list" || { echo "$1 not refused"; exit 1; }; }
hasnt() { if grep -q "/$1.md" "$work/list"; then echo "$1 wrongly refused"; exit 1; fi; }

page "$d" c39-row '| A | B |
|---|---|
| **Přístupová úroveň** | L3 (omezená) |
| **Riziková úroveň** | high |'
page "$d" c39-norow '| A | B |
|---|---|
| **Riziková úroveň** | high |'
mkdir -p content/philosophy
page content/philosophy c39-nonkompendium '| **Přístupová úroveň** | L3 |'

listed
has   c39-row            # a hand-written Přístupová úroveň row on a kompendium page
hasnt c39-norow          # no such row
hasnt c39-nonkompendium  # not a kompendium page

echo "access-level-row: a hand-written Přístupová úroveň row on a kompendium page is refused; a page without it and a non-kompendium page are not"
