#!/usr/bin/env bash
# Requirement `alias-collision` of scripts/check-ia.py: a Zola alias is the old address of a page,
# so it redirects only when nothing else is served there. Refused, on the page that carries it:
#   * an alias equal to the page's own address: a no-op that redirects nothing. c5200028 gave six
#     renumbered techniques such an alias instead of their old address, and the old URLs returned
#     404 on production;
#   * an alias equal to another page's address, or to an alias of another page: two things served
#     at one path, one of them lost.
# Not charged: an alias to a free path (the old address of a renamed page), written with or
# without the trailing slash. The fixtures are pages of their own, so the case does not depend on
# the live book.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case44.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
d=content/kompendium/techniques
page() { printf '+++\ntitle = "%s"\naliases = [%s]\n+++\n\nText.\n' "$2" "$3" > "$d/$2.md"; }
# the listing is "<page>\t<detail>"; a detail names other pages, so only the first column counts
listed() { python3 scripts/check-ia.py --list alias-collision > "$work/list" 2>/dev/null || true
           cut -f1 "$work/list" > "$work/pages"; }
has()   { grep -q "/$1.md$" "$work/pages" || { echo "$1 not refused"; exit 1; }; }
hasnt() { if grep -q "/$1.md$" "$work/pages"; then echo "$1 wrongly refused"; exit 1; fi; }

page ea-9-9-91-sama    ea-9-9-91-sama    '"/kompendium/techniques/ea-9-9-91-sama/"'
page ea-9-9-92-cizi    ea-9-9-92-cizi    '"/kompendium/techniques/ea-9-9-93-volna"'
page ea-9-9-93-volna   ea-9-9-93-volna   '"/kompendium/techniques/ea-9-9-90-stara/"'
page ea-9-9-94-dvojice ea-9-9-94-dvojice '"/kompendium/techniques/ea-9-9-89-spolecna/"'
page ea-9-9-95-dvojice ea-9-9-95-dvojice '"/kompendium/techniques/ea-9-9-89-spolecna/"'
page ea-9-9-96-prejm   ea-9-9-96-prejm   '"/kompendium/techniques/ea-9-9-88-prejmenovana"'

listed
has   ea-9-9-91-sama                 # its own address: a no-op
has   ea-9-9-92-cizi                 # another page's address (no trailing slash in the alias)
has   ea-9-9-94-dvojice; has ea-9-9-95-dvojice   # one old address claimed by two pages
hasnt ea-9-9-93-volna                # an old address nothing else serves
hasnt ea-9-9-96-prejm                # the same without the trailing slash
grep -q 'ea-9-9-91-sama/' "$work/list" || { echo "the listing does not name the alias"; exit 1; }
echo ok
