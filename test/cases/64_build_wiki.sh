#!/usr/bin/env bash
# scripts/build-wiki.py writes the GitHub wiki from the book, on a copy of the committed tree with a
# fixture technique page:
#
#  - without exactly one argument it prints its usage and exits 2;
#  - it writes every wiki page (Home, Kapitoly, Katalog-technik, Případy, Provenience, Sestavení,
#    Licence, _Sidebar, _Footer) and removes a page it no longer writes (Chapters.md);
#  - the technique catalogue lists the fixture page under its family with a link to the site, and
#    Home's technique count is the number of technique pages measured from content/.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case64.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"

rc=0; python3 scripts/build-wiki.py >/dev/null 2>&1 || rc=$?
[ "$rc" = 2 ] || { echo "no argument: exit $rc, expected 2"; exit 1; }

d=content/kompendium/techniques
printf '+++\ntitle = "C59 fixturová technika"\n[extra]\nea_code = "EA-99.9.9"\n+++\n\nText.\n' > "$d/ea-99-9-9-c59-fixture.md"
wiki="$work/wiki"
mkdir -p "$wiki"
echo stale > "$wiki/Chapters.md"
python3 scripts/build-wiki.py "$wiki" > "$work/out"

for f in Home Kapitoly Katalog-technik Případy Provenience Sestavení Licence _Sidebar _Footer; do
  [ -s "$wiki/$f.md" ] || { echo "$f.md not written"; exit 1; }
done
[ ! -e "$wiki/Chapters.md" ] || { echo "retired Chapters.md not removed"; exit 1; }
grep -q '^## EA-99 (1)$' "$wiki/Katalog-technik.md" || { echo "family EA-99 of the fixture missing"; exit 1; }
grep -qF '[C59 fixturová technika](https://korczis.github.io/kompendium-epistemicke-anihilace/' \
  "$wiki/Katalog-technik.md" || { echo "fixture page not linked to the site"; exit 1; }
n=$(find "$d" -maxdepth 1 -name '*.md' ! -name _index.md | wc -l | tr -d ' ')
grep -q "| \*\*[0-9]*\*\* | \*\*$n\*\* |" "$wiki/Home.md" || { echo "Home does not carry the measured technique count $n"; exit 1; }

echo "build-wiki: usage on no argument, every page written, retired page removed, fixture catalogued, counts measured"
