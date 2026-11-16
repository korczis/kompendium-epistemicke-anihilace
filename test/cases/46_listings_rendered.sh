#!/usr/bin/env bash
# Rule project.listings-derived: a declared listing is not only declared, it is rendered. The
# committed tree is built with zola and scripts/listings.py --check-site compares the site with
# data/listings.toml: every page a listing names in index_pages must render a link to every
# member its loops select (one group, one parent, or the whole listing).
#
#   * the real tree passes;
#   * a listing JSON that lost a member (stale derived data) fails, naming the missing page;
#   * an index page declared for a listing that it does not loop over fails.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case46.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
# The stylesheet is built by npm (ignored by git); zola only needs the file for its cachebust.
mkdir -p static/css && touch static/css/app.css
site="$work/.site"
out="$work/check.out"
build() { rm -rf "$site"; zola build --output-dir "$site" >"$out" 2>&1 || { cat "$out"; exit 1; }; }
check() { python3 scripts/listings.py --check-site "$site" >"$out" 2>&1; }

build
check || { echo "the committed tree fails the rendered-listing check:"; cat "$out"; exit 1; }

# stale derived data: section-bridges.json loses a member that only the listing links (one the
# index's prose does not name), so the rendered page has one member fewer
python3 - <<'PY'
import json
p = "static/data/listings/section-bridges.json"
d = json.load(open(p, encoding="utf-8"))
prose = open("content/kompendium/section-bridges/_index.md", encoding="utf-8").read()
gone = next(i for i in d["items"] if i["path"] not in prose)
d["items"] = [i for i in d["items"] if i is not gone]
open(p, "w", encoding="utf-8").write(json.dumps(d, ensure_ascii=False))
PY
build
if check; then echo "a listing missing a member passed"; exit 1; fi
grep 'section-bridges/_index.md: renders' "$out" >/dev/null || { echo "no finding for the missing member"; cat "$out"; exit 1; }
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" static/data/listings | tar -x -C "$work"

# a declared index page that loops over none of its listing
python3 - <<'PY'
p = "data/listings.toml"
s = open(p, encoding="utf-8").read()
s = s.replace('index_pages = ["kompendium/section-bridges/_index.md"]',
              'index_pages = ["kompendium/section-bridges/_index.md", "kompendium/02-uvod/_index.md"]', 1)
open(p, "w", encoding="utf-8").write(s)
PY
if check; then echo "an index page without a loop passed"; exit 1; fi
grep '02-uvod/_index.md: declared as an index page of section-bridges but loops over none' "$out" >/dev/null \
  || { echo "no finding for the index page without a loop"; cat "$out"; exit 1; }
echo ok
