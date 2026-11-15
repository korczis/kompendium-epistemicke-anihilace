#!/usr/bin/env bash
# Requirement `duplicate-ea-code` of scripts/check-ia.py: one EA code names one technique. Two
# technique pages (content/kompendium/techniques/) whose front matter carries the same extra.ea_code
# are both refused, and the remedy is the catalogue's: the page the chapter table names keeps the
# code, another page describing the same technique is merged into it, a distinct technique takes the
# next free code of its family. Six codes sat on thirteen pages when the rule came in, which split
# the links between the pages and let a chapter link one technique under another's name.
#
# Not charged, each because it is not a second technique under the code:
#   * a quick-reference card or another page outside techniques/ carrying a technique's code — it
#     is about that technique, not another one;
#   * extra.ea_codes, the list a page cites — only the page's own extra.ea_code is its identity;
#   * a technique page whose code no other page carries.
# The fixtures use codes the book does not have, so the case does not depend on the live book.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case41.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
t=content/kompendium/techniques
q=content/kompendium/quick-reference
page() { printf '+++\ntitle = "%s"\n\n[extra]\n%s\n+++\n\nText.\n' "$3" "$4" > "$1/$2.md"; }
listed() { python3 scripts/check-ia.py --list duplicate-ea-code > "$work/list" 2>/dev/null || true; }
has()   { grep -q "/$1.md" "$work/list" || { echo "$1 not refused"; exit 1; }; }
hasnt() { if grep -q "/$1.md" "$work/list"; then echo "$1 wrongly refused"; exit 1; fi; }

page "$t" ea-9-9-97-prvni   "EA-9.9.97 První"   'ea_code = "EA-9.9.97"'
page "$t" ea-9-9-97-druha   "EA-9.9.97 Druhá"   'ea_code = "EA-9.9.97"'
page "$t" ea-9-9-98-jedina  "EA-9.9.98 Jediná"  'ea_code = "EA-9.9.98"'
page "$t" ea-9-9-99-cituje  "EA-9.9.99 Cituje"  'ea_code = "EA-9.9.99"
ea_codes = ["EA-9.9.98"]'
page "$q" qr-ea-9-9-98      "QR EA-9.9.98"      'ea_code = "EA-9.9.98"'

listed
has   ea-9-9-97-prvni; has ea-9-9-97-druha   # two technique pages under one code: both refused
hasnt ea-9-9-98-jedina                       # its code is shared only by a QR card and a citation
hasnt ea-9-9-99-cituje                       # cites EA-9.9.98 in ea_codes; its own code is unique
hasnt qr-ea-9-9-98                           # a card about a technique is not a second technique
grep -q 'EA-9.9.97' "$work/list" || { echo "the listing does not name the shared code"; exit 1; }
echo ok
