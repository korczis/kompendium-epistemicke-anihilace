#!/usr/bin/env bash
# scripts/detail-gap.py, the writing worklist of requirement `detail`, on a copy of the committed tree
# with two thin fixture pages (a glossary term and a technique):
#
#  - each is listed in its lane (glossary vs the rest) with gap = threshold - words, the threshold
#    and word count check-ia judges (scripts/check-ia.py --list detail lists the same pages);
#  - a fixture page long enough for its threshold is not listed.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case60.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"

words() { python3 -c 'import sys; print(" ".join(["slovo"] * int(sys.argv[1])))' "$1"; }
page() { printf '+++\ntitle = "%s"\ndescription = "Fixturová stránka testu detail-gap s dostatečně dlouhým popisem v hlavičce."\n+++\n\n%s\n' "$2" "$3" > "$1"; }
page content/glossary/c60-tenke-heslo.md "C60 tenké heslo" "$(words 40)"
page content/kompendium/techniques/c60-tenka-technika.md "C60 tenká technika" "$(words 40)"
page content/kompendium/techniques/c60-dlouha-technika.md "C60 dlouhá technika" "$(words 3000)"

python3 scripts/detail-gap.py > "$work/out"
python3 - "$work/out" <<'PY'
import re, sys
text = open(sys.argv[1], encoding="utf-8").read()
lanes = re.split(r"^## ", text, flags=re.M)
glossary = next(l for l in lanes if l.startswith("glossary"))
rest = next(l for l in lanes if l.startswith("techniques"))
def row(lane, path):
    m = re.search(r"^\s*(-?\d+)\s+(\d+)\s+(\d+)\s+(\w+)\s+" + re.escape(path) + r"$", lane, re.M)
    if not m:
        sys.exit(f"{path} not listed in its lane")
    gap, words, thr = map(int, m.groups()[:3])
    if gap != thr - words:
        sys.exit(f"{path}: gap {gap} is not threshold {thr} - words {words}")
    return words
row(glossary, "glossary/c60-tenke-heslo.md")
row(rest, "kompendium/techniques/c60-tenka-technika.md")
if "c60-dlouha-technika" in text:
    sys.exit("a page above its threshold is listed")
if "c60-tenka-technika" in glossary or "c60-tenke-heslo" in rest:
    sys.exit("a page is listed in the wrong lane")
PY
python3 scripts/check-ia.py --list detail > "$work/detail" 2>/dev/null || true
grep -q 'c60-tenka-technika.md' "$work/detail" || { echo "check-ia does not list the fixture the worklist lists"; exit 1; }

echo "detail-gap: thin fixture pages listed per lane with gap = threshold - words; a long page is not"
