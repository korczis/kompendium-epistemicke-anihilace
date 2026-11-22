#!/usr/bin/env bash
# scripts/extract-shared-passages.py (ADR 0016), on a copy of the committed tree with fixture pages:
#
#  - a paragraph pasted on 3 pages, split across lines and carrying emphasis and an @/ link, moves
#    into one partial, and each page includes it where the paragraph stood;
#  - a second paragraph directly below it on the same 3 pages joins the same partial;
#  - a paragraph whose first words equal the first one's, on 3 other pages, gets its own name;
#  - every changed page expands (ia_model.expand_includes) back to its old text byte for byte;
#  - a paragraph that differs per page only by the page's own EA code is left alone and reported;
#  - duplicate-passage no longer charges the moved pages and still charges the EA-code ones;
#  - a second run changes nothing and --check passes.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case71.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"

d=content/kompendium/c71
mkdir -p "$d"
printf '+++\ntitle = "C71"\ndescription = "Fixture section for case 71, the shared passages, long enough for the description floor."\nsort_by = "weight"\n+++\n\nRejstřík fixtur.\n' > "$d/_index.md"
page() {
  printf '+++\ntitle = "%s"\ndescription = "Fixture 71 for the shared passages, %s, long enough for the description floor."\n+++\n\n' "$2" "$2" > "$1/$2.md"
  cat >> "$1/$2.md"
}
for n in 1 2 3; do
  page "$d" "c71-a$n" <<EOF
## Úvod fixtury $n

Vlastní úvodní odstavec stránky číslo $n, který se nikde jinde neopakuje a drží stránku pohromadě.

Rámec případu sedmdesát jedna platí pro **celou rodinu fixtur** a ne pro jednu stránku;
podrobnosti popisuje [rejstřík](@/kompendium/c71/_index.md), na nějž se čtenář může
kdykoli vrátit, protože text zůstává na každé stránce beze změny.

Druhý odstavec rámce případu sedmdesát jedna stojí hned pod prvním na všech třech stránkách,
a proto patří do téže sdílené šablony jako odstavec nad ním.

Závěr stránky $n je opět vlastní a nesdílený.
EOF
  page "$d" "c71-b$n" <<EOF
Vlastní odstavec stránky b$n, odlišný od všech ostatních fixtur tohoto případu.

Rámec případu sedmdesát jedna platí také pro druhou skupinu stránek, ale jiným textem, který
začíná stejnými slovy, a proto potřebuje vlastní jméno šablony.
EOF
  page "$d" "c71-c$n" <<EOF
Vlastní odstavec stránky c$n, odlišný od všech ostatních fixtur tohoto případu.

Klinický kontext **EA-9.9.$n** připouští v této fixtuře popis, který se liší jen kódem techniky
a jinak zní na všech třech stránkách stejně, takže zůstává tam, kde je.
EOF
done
mkdir -p "$work/before"
cp "$d"/*.md "$work/before/"

python3 scripts/extract-shared-passages.py > "$work/run1"
python3 - "$work" <<'PY'
import pathlib, re, sys
work = pathlib.Path(sys.argv[1])
sys.path.insert(0, "scripts")
import ia_model as m
d = pathlib.Path("content/kompendium/c71")
inc = re.compile(r'\{% include "partials/([^"]+)" %\}')
names = {}
for f in sorted(d.glob("c71-*.md")):
    old = (work / "before" / f.name).read_text(encoding="utf-8")
    new = f.read_text(encoding="utf-8")
    if m.expand_includes(new) != old:
        sys.exit(f"{f.name}: expansion does not reproduce the old page")
    names[f.stem] = inc.findall(new)
for n in "123":
    a, b, c = names[f"c71-a{n}"], names[f"c71-b{n}"], names[f"c71-c{n}"]
    if len(a) != 1:
        sys.exit(f"c71-a{n}: expected one include for the two adjacent paragraphs, got {a}")
    if len(b) != 1 or b == a:
        sys.exit(f"c71-b{n}: expected one include of its own, got {b} (a: {a})")
    if c:
        sys.exit(f"c71-c{n}: the EA-code paragraph moved: {c}")
    new = (d / f"c71-a{n}.md").read_text(encoding="utf-8")
    if "Vlastní úvodní odstavec stránky číslo" not in new or "Závěr stránky" not in new:
        sys.exit(f"c71-a{n}: the page's own paragraphs moved")
if len({tuple(names[f"c71-a{n}"]) for n in "123"}) != 1:
    sys.exit("the a pages include different partials")
part = pathlib.Path("templates/partials") / names["c71-a1"][0]
text = part.read_text(encoding="utf-8")
if not text.startswith("{#-") or not text.endswith("\n{#- -#}\n"):
    sys.exit(f"{part}: header comment or closing mark missing")
if "**celou rodinu fixtur**" not in text or "Druhý odstavec rámce" not in text:
    sys.exit(f"{part}: does not hold both paragraphs as written")
PY
grep -q "remains .*the page's own EA code.*Klinický kontext EA-§ připouští v této fixtuře" "$work/run1" \
  || { echo "the EA-code paragraph is not reported as remaining"; cat "$work/run1"; exit 1; }

# the gate: moved pages are no longer charged, the EA-code pages still are
python3 scripts/check-ia.py --list duplicate-passage > "$work/list" 2>/dev/null || true
for p in c71-a1 c71-a2 c71-a3 c71-b1 c71-b2 c71-b3; do
  if grep -q "/$p.md" "$work/list"; then echo "$p still charged by duplicate-passage"; exit 1; fi
done
for p in c71-c1 c71-c2 c71-c3; do
  grep -q "/$p.md" "$work/list" || { echo "$p not charged by duplicate-passage"; exit 1; }
done

# idempotent: a second run writes nothing, and --check finds nothing to move
snap() { find content templates -type f -print0 | sort -z | xargs -0 shasum | shasum; }
s1=$(snap)
python3 scripts/extract-shared-passages.py > /dev/null
[ "$(snap)" = "$s1" ] || { echo "a second run changed files"; exit 1; }
python3 scripts/extract-shared-passages.py --check > /dev/null \
  || { echo "--check reports a pending move after a run"; exit 1; }

echo "shared passages: pasted paragraphs move into one partial each (adjacent ones together), every page expands back to its old text, the per-page EA-code paragraph stays, and a second run is a no-op"
