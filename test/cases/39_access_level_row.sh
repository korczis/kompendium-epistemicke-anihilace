#!/usr/bin/env bash
# Requirement `access-level-row` of scripts/check-ia.py: the access level is data (extra.access_level)
# rendered derived in the page header as a link to the classification page; a hand-written
# "| **Přístupová úroveň** | … |" row in content drifts and is refused. A page without the row passes;
# a non-kompendium page is not judged.
#
# The rule also refuses the same claim written as PROSE, in any dress the book uses: with or without
# bold, with or without an admonition marker, "L3", "L3–L4" or "L2 (rozšířený přístup)". Removing the
# row from 420 pages left 41 prose occurrences in 40 files standing, 30 of them byte-identical on the
# quick-reference cards beside the very technique pages the row had just been cleared from.
#
# Two shapes must NOT be charged, and each is here as a fixture because each was got wrong once:
#   * a HEADING ("## Přístupová úroveň: L3–L4") — the documented classification section is its own
#     decision, not a stray claim. A first version of the pattern charged it, because the engine
#     backtracked and used the en dash inside "L3–L4" as the sentence's terminator.
#   * a markdown LINK LABEL ("[Přístupová úroveň oddílu](…)") — navigation to that section, not an
#     assertion about the page it sits on.
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

# the prose shapes, as they actually appear in the book
page "$d" c39-prose-card  '> Přístupová úroveň L3. Karta slouží k rozpoznání a ochraně; popis je strukturní, ne návod.'
page "$d" c39-prose-range '> 🚨 **Přístupová úroveň L3–L4**. Kapitola popisuje třicet technik.'
page "$d" c39-prose-colon '> 🚨 **Přístupová úroveň L3–L4**: Tato sekce popisuje nejpokročilejší formy.'
page "$d" c39-prose-paren '> ⚠️ **Přístupová úroveň L2 (rozšířený přístup)** — Tato sekce popisuje fenomény.'
# and the two shapes that must pass
page "$d" c39-heading '## Přístupová úroveň: L3–L4

Materiály sekce nejsou veřejně dostupné.'
page "$d" c39-link '| Předmluva | Oddíl 05 |
|---|---|
| [Bezpečnostní klasifikace](@/kompendium/01-predmluva/bezpecnostni-klasifikace.md) | [Přístupová úroveň oddílu](@/kompendium/05-ultramari-techniky/_index.md) |'

listed
has   c39-row            # a hand-written Přístupová úroveň row on a kompendium page
hasnt c39-norow          # no such row
hasnt c39-nonkompendium  # not a kompendium page
has   c39-prose-card     # the claim as a sentence, unbolded, no marker
has   c39-prose-range    # bold, a marker, a range closed by "."
has   c39-prose-colon    # the same closed by ":"
has   c39-prose-paren    # "L2 (rozšířený přístup)" closed by an em dash
hasnt c39-heading        # a documented classification section is its own decision
hasnt c39-link           # a link label is navigation, not an assertion

echo "access-level-row: a hand-written Přístupová úroveň row or the same claim in prose is refused on a kompendium page; a heading, a link label, a page without it and a non-kompendium page are not"
