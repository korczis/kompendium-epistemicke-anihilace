#!/usr/bin/env bash
# What `{% include %}` means to the tools, on a copy of the committed tree.
#
# A shared notice moved into templates/partials/ is the remedy that `duplicate-passage` itself
# names. But every tool that judges a page reads the page's SOURCE, and the source now says
# `{% include %}` where the notice used to be. Moving four section notices this way cost the book
# 17 `@/` links, measured against origin/main — edges a reader navigates by, gone silently.
#
# So load_pages() reads the page twice, and which copy a field comes from follows what the field
# is about:
#
#   * SOURCE, unexpanded — the duplication requirements (`duplicate-passage`, `duplicate-table`).
#     Duplication is a property of the source: the defect is a notice MAINTAINED in forty places,
#     not one RENDERED in forty places. Expanding here would cancel the remedy the requirement
#     prescribes, taking duplicate-passage straight back from 252 to 281.
#   * RENDERED, expanded — `links` (and so the graph, `links-out`, `not-orphan`), `words` (and so
#     `detail` and `weak-link`), `diacritics`, `language`, `has_related`, `has_definition`. Each
#     of those describes the page a reader is handed.
#
# This case holds both halves, each against its own control, because either one alone passes for
# the wrong reason: no expansion at all satisfies the duplication half, and expanding everywhere
# satisfies the link half.
#
# Writing a body back is what would make the expansion destructive — link-terms, derive-links and
# normalize-front-matter all rewrite content files. They each re-read the file from disk and
# transform that text; none writes `page["body"]`, which is why expansion cannot inline a partial
# into content. If that ever changes, this case will not catch it: it is checked by reading those
# three scripts.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case50.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"

d=content/kompendium/c50
mkdir -p "$d" templates/partials

# a page these fixtures can link to, so the links resolve and broken-link stays quiet
page() {
  printf '+++\ntitle = "%s"\ndescription = "Fixture 50 for the include expansion, %s, long enough for the description floor."\n+++\n\n' "$2" "$2" > "$1/$2.md"
  cat >> "$1/$2.md"
}
page "$d" c50-target <<'EOF'
Cílová stránka existuje, aby na ni fixtury mohly odkazovat a odkaz se vyřešil.
EOF
# A page's links are deduplicated into a set of targets (ia_model.py:230), so the partial must
# link a target the including page does not link itself, or it adds no edge and this case would
# pass for the wrong reason. That is how the first version of this case failed.
page "$d" c50-extra <<'EOF'
Druhá cílová stránka: na ni odkazuje jen vložené oznámení, nikdy stránka sama.
EOF

# the notice carried by a partial: one link, and prose long enough to be a duplicate-passage block
cat > templates/partials/c50-notice.md <<'EOF'
Toto oznámení platí pro celý oddíl a je uloženo na jednom místě, takže se nemůže rozejít samo se
sebou; podrobnosti vysvětluje [cílová stránka](@/kompendium/c50/c50-target.md) a čtenář se k ní
dostane z každé stránky, která oznámení zobrazuje — i na [druhý cíl](@/kompendium/c50/c50-extra.md).
EOF
# a second partial with no link at all, for the control below
cat > templates/partials/c50-bare.md <<'EOF'
Toto oznámení neobsahuje žádný odkaz a je tu jen proto, aby kontrolní stránka měla stejný tvar
jako ty ostatní a lišila se právě jen tím, co partial nese.
EOF

notice=$(cat templates/partials/c50-notice.md)

# --- the rendered half: a link inside the partial is the including page's link ----------------
# Each page carries two links of its own plus the partial's one. links-out charges a page with
# fewer than three, so the page passes only if the included link counts.
for n in 1 2 3; do
  page "$d" "c50-inc-$n" <<EOF
Fixtura číslo $n si píše vlastní odstavec, protože tři stránky se stejnou výplní by samy byly
duplicitní pasáží a případ by se obvinil místo zkoumané věci. Dva vlastní odkazy vedou na
[cíl](@/kompendium/c50/c50-target.md) a na [rejstřík](@/kompendium/c50/_index.md), třetí přináší
vložené oznámení.

{% include "partials/c50-notice.md" %}
EOF
done
# the control: same two own links, but the included partial carries none -> charged
page "$d" c50-bare <<'EOF'
Kontrolní stránka má týž tvar jako ty tři výše a liší se jen tím, co její partial nese: dva
vlastní odkazy vedou na [cíl](@/kompendium/c50/c50-target.md) a na
[rejstřík](@/kompendium/c50/_index.md), a vložené oznámení žádný třetí nepřináší.

{% include "partials/c50-bare.md" %}
EOF

# --- the source half: the included text is not duplication ------------------------------------
# The three c50-inc-* pages above all include the same notice. Pasted on three pages that block
# would be charged, which is what the control proves.
for n in 1 2 3; do
  page "$d" "c50-pasted-$n" <<EOF
Vlepená fixtura číslo $n má rovněž vlastní odstavec, aby to, co se na ní účtuje, mohlo být jedině
oznámení vlepené pod ním, a nikoli její vlastní okolí.

$notice
EOF
done

printf '+++\ntitle = "C50"\ndescription = "Fixture section for case 50, the include expansion, long enough for the description floor."\nsort_by = "weight"\n+++\n\nRejstřík fixtur.\n' > "$d/_index.md"

listed() { python3 scripts/check-ia.py --list "$1" > "$work/list" 2>/dev/null || true; }
has()   { grep -q "/$1.md" "$work/list" || { echo "$1 not charged by $2"; exit 1; }; }
hasnt() { if grep -q "/$1.md" "$work/list"; then echo "$1 wrongly charged by $2"; exit 1; fi; }

listed links-out
hasnt c50-inc-1 links-out   # two own links plus the partial's one
hasnt c50-inc-2 links-out
hasnt c50-inc-3 links-out
has   c50-bare  links-out   # two own links and a partial that carries none

listed duplicate-passage
hasnt c50-inc-1 duplicate-passage   # the notice lives in one place; including it is not pasting
hasnt c50-inc-2 duplicate-passage
hasnt c50-inc-3 duplicate-passage
has   c50-pasted-1 duplicate-passage  # the same text pasted on three pages is the defect
has   c50-pasted-2 duplicate-passage
has   c50-pasted-3 duplicate-passage

echo "include expansion: a link inside an included partial counts as the including page's link, while the included text is not duplication — the same notice pasted on three pages still is"
