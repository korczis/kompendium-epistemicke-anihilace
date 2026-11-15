#!/usr/bin/env bash
# Requirement `citations` of scripts/check-ia.py, the quick-reference exemption, on a copy of the
# committed tree:
#
#  - a card under kompendium/quick-reference/ that links its technique page as "**Plná stránka:**"
#    owes no citations of its own: the parent page carries the apparatus, and asking a ten-line
#    summary to cite the same works again would duplicate its parent's credibility;
#  - the exemption is keyed on that RELATION, so it cannot outlive its reason: a card with no such
#    link, or whose link points at a page that does not exist, is charged like any other prose;
#  - quick-reference/_index.md is not a card and is charged;
#  - a page outside quick-reference/ is unaffected.
#
# The implementation takes two passes and this case would pass vacuously if they were merged: the
# decision needs each page's body, which analyse() empties, while `uncited` is computed BY analyse()
# and absent from a freshly loaded page. A single pass before analyse() creates a key analyse() then
# overwrites — it fired on all 123 cards and changed nothing. The c40-ok fixture is what catches that.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case40.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
q=content/kompendium/quick-reference
t=content/kompendium/techniques
page() { printf '+++\ntitle = "%s"\n+++\n\n' "$2" > "$1/$2.md"; cat >> "$1/$2.md"; }
listed() { python3 scripts/check-ia.py --list citations > "$work/list" 2>/dev/null || true; }
has()   { grep -q "/$1.md" "$work/list" || { echo "$1 not charged"; exit 1; }; }
hasnt() { if grep -q "/$1.md" "$work/list"; then echo "$1 wrongly charged"; exit 1; fi; }

# the parent page the good cards point at
page "$t" c40-parent <<'EOF'
Tato stránka nese aparát: tvrzení jsou doložena a zdroj je uveden v Literatuře, takže souhrn
odkazující sem nemusí citovat totéž znovu (Lifton, 1961).

## Literatura

- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism*.
EOF

# a card that links an existing parent: four uncited paragraphs, none charged
page "$q" c40-ok <<'EOF'
**Plná stránka:** [C40 parent](@/kompendium/techniques/c40-parent.md)

Karta shrnuje vzorec tak, aby šel poznat zevnitř, a popisuje strukturu, nikoli postup, protože
čtenář potřebuje rozpoznání a ne instrukci k použití.

Druhý odstavec pokračuje ve shrnutí a je dost dlouhý na to, aby ho pravidlo citations posuzovalo
jako prózu nad dvacet slov bez jakékoli citace v textu.

Třetí odstavec dělá totéž, aby karta překročila strop tří odstavců, který metodická výjimka
OWN_FRAME dovoluje, a prokázala, že ji nezachraňuje ona.

Čtvrtý odstavec je tu ze stejného důvodu a drží kartu nad tím stropem i po jakékoli budoucí
úpravě kteréhokoli z předchozích tří odstavců.
EOF

# the same card without the parent link: charged
page "$q" c40-nolink <<'EOF'
Karta shrnuje vzorec tak, aby šel poznat zevnitř, a popisuje strukturu, nikoli postup, protože
čtenář potřebuje rozpoznání a ne instrukci k použití.

Druhý odstavec pokračuje ve shrnutí a je dost dlouhý na to, aby ho pravidlo citations posuzovalo
jako prózu nad dvacet slov bez jakékoli citace v textu.
EOF

# a card whose parent link points at a page that does not exist: charged
page "$q" c40-broken <<'EOF'
**Plná stránka:** [C40 chybějící](@/kompendium/techniques/c40-neexistuje.md)

Karta shrnuje vzorec tak, aby šel poznat zevnitř, a popisuje strukturu, nikoli postup, protože
čtenář potřebuje rozpoznání a ne instrukci k použití.

Druhý odstavec pokračuje ve shrnutí a je dost dlouhý na to, aby ho pravidlo citations posuzovalo
jako prózu nad dvacet slov bez jakékoli citace v textu.
EOF

# a page outside quick-reference/ with the same link: unaffected, charged
page "$t" c40-elsewhere <<'EOF'
**Plná stránka:** [C40 parent](@/kompendium/techniques/c40-parent.md)

Tato stránka není karta a odkaz na rodiče jí nic neodpouští; próza nad dvacet slov bez citace se
posuzuje jako na každé jiné stránce knihy.
EOF

listed
hasnt c40-ok         # links an existing technique page -> the parent carries the apparatus
has   c40-nolink     # no parent link -> charged
has   c40-broken     # parent link resolves to nothing -> charged
has   c40-elsewhere  # not a card -> unaffected by the exemption

echo "citations: a quick-reference card that links an existing technique page owes no citations; one without that link, one whose link is broken, and a page outside quick-reference/ are charged"
