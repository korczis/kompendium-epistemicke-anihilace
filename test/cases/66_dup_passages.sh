#!/usr/bin/env bash
# scripts/dup-passages.py, the writing worklist of requirement `duplicate-passage`, on a copy of the
# committed tree with fixture pages:
#
#  - a prose paragraph pasted on 3 content/kompendium pages is one block listed with its 3 pages
#    (--full) and the section counts;
#  - the same paragraph on only 2 pages is not listed, nor a paragraph pasted outside kompendium/.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case66.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"

page() { printf '+++\ntitle = "%s"\n+++\n\n' "$(basename "$1" .md)" > "$1"; cat >> "$1"; }
P3="Fixturový odstavec případu šedesát jedna o více než patnácti slovech, který je vložen beze změny na tři stránky knihy."
P2="Jiný fixturový odstavec případu šedesát jedna o více než patnácti slovech, který stojí jen na dvou stránkách knihy."
PG="Fixturový odstavec glosáře případu šedesát jedna o více než patnácti slovech, vložený na tři hesla mimo oddíl kompendia."
t=content/kompendium/techniques
c=content/kompendium/case-studies
page "$t/c61-a.md" <<<"$P3"; page "$t/c61-b.md" <<<"$P3"; page "$c/c61-c.md" <<<"$P3"
page "$t/c61-d.md" <<<"$P2"; page "$t/c61-e.md" <<<"$P2"
for n in c61-g1 c61-g2 c61-g3; do page "content/glossary/$n.md" <<<"$PG"; done

python3 scripts/dup-passages.py --full > "$work/out"
python3 - "$work/out" <<'PY'
import re, sys
text = open(sys.argv[1], encoding="utf-8").read()
blocks = re.split(r"\n(?=\s*\d+ pages \[)", text)
mine = [b for b in blocks if "případu šedesát jedna" in b]
if len(mine) != 1:
    sys.exit(f"expected one fixture block, got {len(mine)}")
b = mine[0]
if not re.match(r"\s*3 pages \[techniques:2, case-studies:1\]", b):
    sys.exit("fixture block header: " + b.splitlines()[0])
for p in ("techniques/c61-a.md", "techniques/c61-b.md", "case-studies/c61-c.md"):
    if "kompendium/" + p not in b:
        sys.exit(f"{p} missing from the block's pages")
if "c61-d" in text or "c61-g1" in text:
    sys.exit("a 2-page paragraph or one outside kompendium/ is listed")
PY

echo "dup-passages: a paragraph on 3 kompendium pages is one block with its pages; 2 pages and glossary are not"
