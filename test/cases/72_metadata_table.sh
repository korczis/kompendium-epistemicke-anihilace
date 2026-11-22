#!/usr/bin/env bash
# scripts/extract-metadata-table.py (duplicate-table, ADR 0013/0016/0017), on a copy of the
# committed tree with fixture technique pages:
#
#  - a page whose six-row metadata table matches front matter and whose Kategorie cell already
#    equals the canonical label moves its first five rows into
#    {% include "partials/technique-meta.md" %} and expands (ia_model.expand_includes) back byte for
#    byte; the Riziková úroveň and Reverzibilita cells move verbatim into extra.ea_risk_text /
#    extra.ea_reversibility_text; the header, separator and Rodičovská kapitola row stay;
#  - a page whose Kategorie cell differs from the canonical chapter-title label (ADR 0017) still
#    moves, but the rendered Kategorie cell deliberately becomes the canonical label; EVERY OTHER
#    row stays byte-exact (the tool's proof swaps only that one cell);
#  - a page with a seventh row (Rychlá karta) after Rodičovská moves its first five rows and keeps
#    the trailing rows literal;
#  - a page whose Subkategorie cell carries a glossary link the front-matter ea_subcategory lacks is
#    refused untouched (the partial would drop the link) — a genuine drift, never guessed;
#  - a page whose ea_category is not a key of data/ea-categories.toml is refused untouched;
#  - ia_model.expand_includes renders ONLY the two bounded Tera forms: a partial with any other Tera
#    is left as written, so a move carrying it could not pass the byte-exact proof;
#  - a second run changes nothing.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case72.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"

d=content/kompendium/techniques
# page <slug> <ea_code> <ea_category> <subcat-cell> <kategorie-cell> [<trailing row>]
# ea_subcategory in front matter is always the plain "9.9 …"; $4 is the Subkategorie CELL (equal to
# it, or — for the drift fixture — carrying a link it lacks). $5 is the Kategorie CELL (canonical or
# an old source variant). $6, if given, is a seventh table row kept after Rodičovská.
page() {
  cat > "$d/$1.md" <<EOF
+++
title = "$2 fixture"
description = "Fixture 72 for the metadata-table move, $1, long enough for the description floor of the book."
weight = 9900

[extra]
ea_code = "$2"
ea_category = "$3"
ea_subcategory = "9.9 Fixturní subkategorie případu sedmdesát dva"
+++

# $2 fixture

## Identifikace

| Pole | Hodnota |
|------|---------|
| **EA kód** | \`$2\` |
| **Kategorie** | $5 |
| **Subkategorie** | $4 |
| **Riziková úroveň** | Nízká — fixturní věta o riziku, kterou tabulka nese jako vlastní posudek techniky. |
| **Reverzibilita** | Vysoká — fixturní věta o reverzibilitě, odlišná od řádku o riziku. |
| **Rodičovská kapitola** | [Kapitola 9](@/kompendium/techniques/_index.md) |${6:+
$6}

## Definice

Vlastní tělo fixtury $1, které se nikde jinde neopakuje a drží stránku pohromadě.
EOF
}

SUB="9.9 Fixturní subkategorie případu sedmdesát dva"
EDU_CANON="3. [Edukativní implementace](@/glossary/edukativni-implementace.md)"
AKA_OLD="1. Akademické techniky"
DEL_OLD="2. Scénáře [delegitimizace](@/glossary/delegitimizace.md)"
QR='| **Rychlá karta** | [QR: EA-9.9.4](@/kompendium/quick-reference/qr-ea-9-9-4.md) |'

page ea-c72-exact   "EA-9.9.1" "3. Edukativní implementace" "$SUB" "$EDU_CANON"
page ea-c72-relabel "EA-9.9.2" "1. Akademické techniky"     "$SUB" "$AKA_OLD"
page ea-c72-subdrift "EA-9.9.3" "3. Edukativní implementace" \
  "$SUB a [odkaz](@/glossary/falsifikace.md)" "$EDU_CANON"
page ea-c72-trailing "EA-9.9.4" "2. Scénáře delegitimizace" "$SUB" "$DEL_OLD" "$QR"
page ea-c72-badcat  "EA-9.9.5" "99. Neznámá kategorie"      "$SUB" "99. Neznámá kategorie"

mkdir -p "$work/before"
cp "$d"/ea-c72-*.md "$work/before/"

python3 - "$work" <<'PY'
import importlib.util, pathlib, re, sys, tomllib
work = pathlib.Path(sys.argv[1])
sys.path.insert(0, "scripts")
import ia_model as m
spec = importlib.util.spec_from_file_location("emt", "scripts/extract-metadata-table.py")
emt = importlib.util.module_from_spec(spec)
spec.loader.exec_module(emt)
d = pathlib.Path("content/kompendium/techniques")
INCLUDE = '{% include "partials/technique-meta.md" %}'
cats = tomllib.loads(pathlib.Path("data/ea-categories.toml").read_text(encoding="utf-8"))


def split(text):
    mo = m.TOML_FM.match(text)
    return tomllib.loads(mo.group(1)), text[mo.end():]


moves, remaining = emt.plan()
byrel = {mv["rel"]: mv for mv in moves}
rem = {rel for rel, _ in remaining}
P = "kompendium/techniques/"


def moved(slug, want_changed):
    mv = byrel.get(P + slug + ".md")
    if mv is None:
        sys.exit(f"{slug}: expected to move, but it is not in the plan")
    if mv["kat_changed"] != want_changed:
        sys.exit(f"{slug}: kat_changed={mv['kat_changed']}, expected {want_changed}")
    return mv


moved("ea-c72-exact", False)      # cell already canonical → pure byte-exact
moved("ea-c72-relabel", True)     # cell differs from canonical → ADR-0017 relabel
moved("ea-c72-trailing", True)    # 7-row table, DEL cell differs from canonical
for slug, why in (("ea-c72-subdrift", "Subkategorie link the front matter lacks"),
                  ("ea-c72-badcat", "ea_category not a key of the data file")):
    if P + slug + ".md" not in rem:
        sys.exit(f"{slug}: expected to be refused ({why}), but it was not")

emt.apply(moves)  # writes the fixtures; sys.exit if any byte-exact proof fails

# the refused fixtures are byte-identical to before (untouched, no include).
for slug in ("ea-c72-subdrift", "ea-c72-badcat"):
    before = (work / "before" / f"{slug}.md").read_text(encoding="utf-8")
    after = (d / f"{slug}.md").read_text(encoding="utf-8")
    if after != before or INCLUDE in after:
        sys.exit(f"{slug}: a refused page was modified")

# the moved fixtures: the Kategorie cell renders to canonical, every other row byte-exact.
KAT = re.compile(r"^\| \*\*Kategorie\*\* \| (.*) \|$", re.M)


def check_move(slug, canonical, old_cell, trailing=None):
    front, body = split((d / f"{slug}.md").read_text(encoding="utf-8"))
    extra = front["extra"]
    if INCLUDE not in body or "| **Rodičovská kapitola** |" not in body:
        sys.exit(f"{slug}: include missing or Rodičovská row dropped")
    if trailing and trailing not in body:
        sys.exit(f"{slug}: the trailing row was not kept literally")
    rendered = m.expand_includes(body, extra=extra)
    km = KAT.search(rendered)
    if not km or km.group(1) != canonical:
        sys.exit(f"{slug}: rendered Kategorie {km and km.group(1)!r} != canonical {canonical!r}")
    # every other row byte-exact: the rendered body equals the old body with ONLY the Kategorie
    # cell swapped to canonical (independent of the tool's own proof).
    _, old_body = split((work / "before" / f"{slug}.md").read_text(encoding="utf-8"))
    old_canon = old_body.replace(f"| **Kategorie** | {old_cell} |",
                                 f"| **Kategorie** | {canonical} |")
    if rendered != m.expand_includes(old_canon, extra=extra):
        sys.exit(f"{slug}: a row other than Kategorie changed")
    if (old_cell != canonical) == (rendered == m.expand_includes(old_body, extra=extra)):
        sys.exit(f"{slug}: relabel/byte-exact classification inconsistent with the cells")


check_move("ea-c72-exact", cats["3. Edukativní implementace"],
           "3. [Edukativní implementace](@/glossary/edukativni-implementace.md)")
check_move("ea-c72-relabel", cats["1. Akademické techniky"], "1. Akademické techniky")
check_move("ea-c72-trailing", cats["2. Scénáře delegitimizace"],
           "2. Scénáře [delegitimizace](@/glossary/delegitimizace.md)",
           trailing="| **Rychlá karta** | [QR: EA-9.9.4](@/kompendium/quick-reference/qr-ea-9-9-4.md) |")

# ia_model renders ONLY the two bounded forms; other Tera is left as written.
bad = pathlib.Path("templates/partials/c72-unsupported.md")
bad.write_text('{% if page.extra.ea_code %}{{ page.extra.ea_code }}{% endif %}\n', encoding="utf-8")
out = m.expand_includes('{% include "partials/c72-unsupported.md" %}\n', extra={"ea_code": "EA-9.9.1"})
if "{% if page.extra.ea_code %}" not in out or "{% endif %}" not in out:
    sys.exit(f"unsupported Tera ({{% if %}}) was expanded, not left as written: {out!r}")
bad.unlink()
PY

# idempotent: a second run writes nothing among the fixtures.
snap() { find content templates -type f -print0 | sort -z | xargs -0 shasum | shasum; }
s1=$(snap)
python3 scripts/extract-metadata-table.py > /dev/null
[ "$(snap)" = "$s1" ] || { echo "a second run changed files"; exit 1; }

echo "metadata table: a canonical-cell table moves byte-exact; a page whose Kategorie cell differs moves with the cell relabelled to the ADR-0017 canonical and every other row byte-exact; a seventh Rychlá karta row is kept; a Subkategorie-link drift or an unknown ea_category is refused untouched; unsupported Tera is left as written; a second run is a no-op"
