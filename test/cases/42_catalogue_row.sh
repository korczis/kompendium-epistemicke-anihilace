#!/usr/bin/env bash
# Requirement `catalogue-row` of scripts/check-ia.py (ADR 0015): a technique's catalogue entry is its
# page's front matter, and a chapter renders its catalogue table from static/data/catalogue.json with
# load_data. A hand-written catalogue row in content, a table row whose first cell is a bold EA
# code, is refused: it is the row that drifted from its page (kapitola-8 to 10 named 70 of 90
# techniques other than the pages they linked) and the reason six codes came to sit on thirteen
# pages.
#
# Not charged, each because it is not a hand-written catalogue row:
#   * the same row produced by a load_data loop: the source holds the loop, not the row;
#   * a heading naming a technique ("#### [EA-5.2.11 …](…)"), kapitola-7's form, with prose under it;
#   * a row whose first cell is not a bold code: a family table ("| **Rodina** | 5.1.1 — 5.1.5 |"),
#     a case table with the code in a later cell, a card's "| **EA kód** | `EA-1.2.4` |".
# The fixtures are pages of their own, so the case does not depend on the live book.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case42.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
d=content/kompendium/03-zakladni-kategorie
page() { printf '+++\ntitle = "%s"\n+++\n\n%s\n' "$2" "$3" > "$d/$2.md"; }
listed() { python3 scripts/check-ia.py --list catalogue-row > "$work/list" 2>/dev/null || true; }
has()   { grep -q "/$1.md" "$work/list" || { echo "$1 not refused"; exit 1; }; }
hasnt() { if grep -q "/$1.md" "$work/list"; then echo "$1 wrongly refused"; exit 1; fi; }

page c42-linked "c42-linked" '| EA | Technika | Shrnutí |
|---|---|---|
| **[EA-1.2.1](@/kompendium/techniques/ea-1-2-1-falesne-dilema.md)** | Falešné dilema | Binární volba |'
page c42-bare "c42-bare" '| EA | Technika |
|---|---|
| **EA-5.3.22** | Vývojová inverze |'
page c42-loop "c42-loop" '{% set cat = load_data(path="static/data/catalogue.json") %}| EA | Technika | Shrnutí |
|---|---|---|
{% for t in cat.families["1.2"] %}| **[{{ t.code }}](@/kompendium/techniques/{{ t.slug }}.md)** | {{ t.name }} | {{ t.summary }} |
{% endfor %}'
page c42-heading "c42-heading" '#### [EA-5.2.11 Kategoriální anihilace](@/kompendium/techniques/ea-5-2-11-kategorialni-anihilace.md)

Text.'
page c42-family "c42-family" '| Rodina | Kódy |
|---|---|
| **Sebevztažný kolaps** | 5.1.1 — 5.1.5 |
| Mapování | EA-1.2.1 |
| **EA kód** | `EA-1.2.4` |'

listed
has   c42-linked                 # a hand-written row linking its technique
has   c42-bare                   # a hand-written row naming a code, linked or not
hasnt c42-loop                   # the row a load_data loop renders
hasnt c42-heading                # a technique heading with prose under it
hasnt c42-family                 # family row, code in a later cell, a card's field
echo ok
