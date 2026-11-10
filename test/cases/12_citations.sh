#!/usr/bin/env bash
# Requirement `citations` of scripts/check-ia.py, on a copy of the committed tree.
# majordomus-skill: kompendium-page-expansion
#
#  - a paragraph of 20+ words without a citation is refused; with (Autor, rok) it passes;
#  - every accepted form passes: (Autor rok), Autor (rok), (A a B, rok), (A a kol., rok),
#    a name with Czech capitals (Čapek, Říha), zákon č. N/RRRR Sb., an EU instrument;
#  - a § number 1500-2049 is not a year, so "(§ 1724 OZ)" alone is not a citation;
#  - exempt: short paragraphs, blockquote callouts, tables, Literatura, generated blocks.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case12.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "$(git -C "$root" write-tree)" | tar -x -C "$work"
cd "$work"
d=content/kompendium/case-12-fixture
mkdir -p "$d"
page() { printf '+++\ntitle = "%s"\n+++\n\n' "$1" > "$d/$1.md"; cat >> "$d/$1.md"; }
listed() { python3 scripts/check-ia.py --list "$1" | cut -f1 > "$work/list"; }
has() { grep -qx "$d/$1.md" "$work/list" || { echo "$1 not listed"; exit 1; }; }
hasnt() { if grep -qx "$d/$1.md" "$work/list"; then echo "$1 wrongly listed"; exit 1; fi; }

long="Tento odstavec má přes dvacet slov a vykládá myšlenku, kterou čtenář musí umět dohledat v literatuře, protože jde o odborné tvrzení"
page seeded <<<"$long bez jakékoli citace."
page fixed <<<"$long (Lifton, 1961)."
page paren-no-comma <<<"$long (Lifton 1961)."
page narrative <<<"Lifton (1961) uvádí, že $long."
page two-authors <<<"$long (Marwick a boyd, 2011)."
page et-al <<<"$long (Cloitre a kol., 2019)."
page czech-capitals <<<"Čapek (1920) i $long (Říha, 2004)."
page statute <<<"$long podle zákona č. 40/2009 Sb."
page eu <<<"$long podle nařízení (EU) 2016/679."
page paragraph-sign <<<"$long podle OZ (§ 1724)."
page exempt <<PAGE
> **Pozor**: $long a jde o upozornění v rámečku.

| sloupec | $long |
|---|---|
| a | b |

Krátký odstavec bez citace.

## Literatura

$long ve formě poznámky k literatuře.
PAGE
listed citations
has seeded; has paragraph-sign
for p in fixed paren-no-comma narrative two-authors et-al czech-capitals statute eu exempt; do hasnt "$p"; done
echo "case 12: uncited paragraphs are refused, every accepted form passes"
