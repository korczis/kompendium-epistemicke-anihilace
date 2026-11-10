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
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case16.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "$(git -C "$root" write-tree)" | tar -x -C "$work"
cd "$work"
d=content/kompendium/case-16-fixture
mkdir -p "$d"
page() { printf '+++\ntitle = "%s"\n+++\n\n' "$1" > "$d/$1.md"; cat >> "$d/$1.md"; }
listed() { python3 scripts/check-ia.py --list "$1" | cut -f1 > "$work/list"; }
has() { grep -qx "$d/$1.md" "$work/list" || { echo "$1 not listed"; exit 1; }; }
hasnt() { if grep -qx "$d/$1.md" "$work/list"; then echo "$1 wrongly listed"; exit 1; fi; }

page seeded <<'PAGE'
Vzorec **Gaslighting** se opakuje. Druhá zmínka **gaslighting** i třetí **GASLIGHTING**.
Alias z názvu „Adapter Pattern (vzor adaptér)“: **vzor adaptér** i **Adapter Pattern**.
PAGE
page exempt <<'PAGE'
**Gaslighting**: popisek, **Gaslighting:** také.

**Gaslighting.** Úvod odstavce v běhu (run-in nadpis).

- **Gaslighting.** Run-in nadpis bodu.

| **Gaslighting** | sloupec |
|---|---|
| **Gaslighting** | buňka |

Klíčová věta **gaslighting je vzorec, který rozkládá důvěru ve vlastní vnímání** je delší.
Odkazy **[Gaslighting](@/glossary/gaslighting.md)** a [**Gaslighting**](@/kompendium/_index.md).

## Související

- **Gaslighting** – heslo glosáře.
PAGE
cp "$d/exempt.md" "$work/exempt.before"
listed bold-term
has seeded; hasnt exempt
# The entry's own page bolds its own title in the definition: never charged.
grep -q '^\*\*Gaslighting\*\*' content/glossary/gaslighting.md
listed bold-term
if grep -qx content/glossary/gaslighting.md "$work/list"; then echo "own page charged"; exit 1; fi

if python3 scripts/link-terms.py --bold --check "$d" >/dev/null; then echo "link-terms --bold --check missed bold terms"; exit 1; fi
python3 scripts/link-terms.py --bold "$d" >/dev/null
grep -o '\*\*\[[^]]*\](@/glossary/gaslighting.md)\*\*' "$d/seeded.md" | wc -l | grep -x ' *3' >/dev/null \
  || { echo "not every bold mention was linked"; cat "$d/seeded.md"; exit 1; }
grep -F '**[vzor adaptér](@/glossary/adapter-pattern.md)**' "$d/seeded.md" >/dev/null
grep -F '**[Adapter Pattern](@/glossary/adapter-pattern.md)**' "$d/seeded.md" >/dev/null
cmp -s "$d/exempt.md" "$work/exempt.before" || { echo "link-terms --bold changed an exempt span"; diff "$work/exempt.before" "$d/exempt.md"; exit 1; }
python3 scripts/link-terms.py --bold --check "$d" >/dev/null   # idempotent
listed bold-term
hasnt seeded
echo "case 16: bold that names a term is a link to it"
