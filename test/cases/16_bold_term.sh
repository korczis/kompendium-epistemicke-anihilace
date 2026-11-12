#!/usr/bin/env bash
# Requirement `bold-term` of scripts/check-ia.py and its auto-fix `link-terms.py --bold`, on a
# copy of the committed tree.
# majordomus-skill: kompendium-page-expansion
#
#  - bold that names a glossary entry (title, title without the parenthesis, the parenthesised
#    alias, the slug; any case, any diacritics) and links nowhere is refused;
#  - link-terms --bold links every such span, not only the first; --check sees it; a second
#    run changes nothing; the gate then passes the page;
#  - never charged (structural exemptions): a label ("**X**:", "**X:**", "**X.** Text"), a
#    table header row and first cell, Související, a key sentence over six words, the entry's
#    own page, a bold span that is already a link (whatever the target, thin or not: the rule
#    charges a missing link, never a link).
#
# Every page this case judges is one it seeds itself, the glossary entries included. It used to
# assert on live entries (gaslighting, adapter-pattern), and a content wave that removed an
# unlinked bold self-mention — which this very rule asks for — took the precondition away and
# the case died with no output. A gate's fixtures are its own.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case16.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
d=content/kompendium/case-16-fixture
g=content/glossary
mkdir -p "$d"
page() { printf '+++\ntitle = "%s"\n+++\n\n' "$1" > "$d/$1.md"; cat >> "$d/$1.md"; }
entry() { printf '+++\ntitle = "%s"\n+++\n\n' "$2" > "$g/$1.md"; cat >> "$g/$1.md"; }
listed() { python3 scripts/check-ia.py --list "$1" | cut -f1 > "$work/list"; }
has() { grep -qx "$d/$1.md" "$work/list" || { echo "$1 not listed"; exit 1; }; }
hasnt() { if grep -qx "$d/$1.md" "$work/list"; then echo "$1 wrongly listed"; exit 1; fi; }

# The term under test, and a second entry whose title carries a parenthesised alias. Both names
# are invented for this case, so nothing in the book can claim the same slug.
entry case-16-vzorec "Kasuistický vzorec" <<'PAGE'
**Kasuistický vzorec** je heslo zavedené jen pro tento případ. Vlastní stránka hesla smí svůj
název zvýraznit, a požadavek `bold-term` jí to nevyčítá.
PAGE
entry case-16-alias "Zkušební vzor (vzor ZV)" <<'PAGE'
Heslo nese v názvu alias, aby se dal ověřit obojí tvar jména.
PAGE

page seeded <<'PAGE'
Vzorec **Kasuistický vzorec** se opakuje. Druhá zmínka **kasuistický vzorec** i třetí
**KASUISTICKÝ VZOREC**.
Alias z názvu „Zkušební vzor (vzor ZV)“: **vzor ZV** i **Zkušební vzor**.
PAGE
page exempt <<'PAGE'
**Kasuistický vzorec**: popisek, **Kasuistický vzorec:** také.

**Kasuistický vzorec.** Úvod odstavce v běhu (run-in nadpis).

- **Kasuistický vzorec.** Run-in nadpis bodu.

| **Kasuistický vzorec** | sloupec |
|---|---|
| **Kasuistický vzorec** | buňka |

Klíčová věta **kasuistický vzorec je heslo, které rozkládá důvěru ve vlastní vnímání** je delší.
Odkazy **[Kasuistický vzorec](@/glossary/case-16-vzorec.md)** a
[**Kasuistický vzorec**](@/kompendium/_index.md).

## Související

- **Kasuistický vzorec** – heslo glosáře.
PAGE
cp "$d/exempt.md" "$work/exempt.before"
listed bold-term
has seeded; hasnt exempt
# The entry's own page bolds its own title in the definition: never charged.
grep -q '^\*\*Kasuistický vzorec\*\*' "$g/case-16-vzorec.md" \
  || { echo "fixture entry does not bold its own title"; exit 1; }
if grep -qx "$g/case-16-vzorec.md" "$work/list"; then echo "own page charged"; exit 1; fi

if python3 scripts/link-terms.py --bold --check "$d" >/dev/null; then echo "link-terms --bold --check missed bold terms"; exit 1; fi
python3 scripts/link-terms.py --bold "$d" >/dev/null
grep -o '\*\*\[[^]]*\](@/glossary/case-16-vzorec.md)\*\*' "$d/seeded.md" | wc -l | grep -x ' *3' >/dev/null \
  || { echo "not every bold mention was linked"; cat "$d/seeded.md"; exit 1; }
grep -F '**[vzor ZV](@/glossary/case-16-alias.md)**' "$d/seeded.md" >/dev/null \
  || { echo "the parenthesised alias was not linked"; exit 1; }
grep -F '**[Zkušební vzor](@/glossary/case-16-alias.md)**' "$d/seeded.md" >/dev/null \
  || { echo "the title without its parenthesis was not linked"; exit 1; }
cmp -s "$d/exempt.md" "$work/exempt.before" || { echo "link-terms --bold changed an exempt span"; diff "$work/exempt.before" "$d/exempt.md"; exit 1; }
python3 scripts/link-terms.py --bold --check "$d" >/dev/null   # idempotent
listed bold-term
hasnt seeded
echo "case 16: bold that names a term is a link to it"
