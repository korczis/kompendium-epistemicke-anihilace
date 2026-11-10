#!/usr/bin/env bash
# The "Pokračovat" picks (static/data/pokracovat.json, scripts/build-ui-data.py pokracovat())
# are data the partial only renders, on a copy of the committed tree.
#
#  - build-ui-data.py --check passes on the committed tree and fails when pokracovat.json is
#    stale (a changed link graph);
#  - every pick obeys the rules: a worked-out page (in ia.json without "detail"/"generated"),
#    never the page itself, each target at most once, `term` a glossary entry and `protocol` a
#    crisis protocol (neither on a page of its own section), titles from graph.json;
#  - the built page renders exactly its entry: the hrefs and kinds of its block.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case03.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "$(git -C "$root" write-tree)" | tar -x -C "$work"  # the index: what is about to be committed
cd "$work"
mkdir -p static/css && touch static/css/app.css

python3 scripts/build-ui-data.py --check >/dev/null \
  || { echo "build-ui-data --check fails on the committed tree"; exit 1; }

python3 - <<'PY'
import json
ia = {p["path"]: set(p["violations"]) for p in json.load(open("static/data/ia.json"))["pages"]}
nodes = {n["path"]: n for n in json.load(open("static/data/graph.json"))["nodes"]}
pages = json.load(open("static/data/pokracovat.json"))["pages"]
assert pages, "pokracovat.json has no entries"
for here, entry in pages.items():
    assert set(entry) <= {"next", "related", "term", "protocol"}, (here, entry)
    targets = [v[0] for v in entry.values()]
    assert len(targets) == len(set(targets)), f"{here}: a target twice {targets}"
    for kind, (path, title) in entry.items():
        assert path != here, f"{here}: {kind} is the page itself"
        assert path in ia and not {"detail", "generated"} & ia[path], f"{here}: {kind} {path} weak"
        assert path in nodes and title == nodes[path]["title"], f"{here}: {kind} title"
    me = nodes.get(here, {}).get("section")
    if "term" in entry:
        assert nodes[entry["term"][0]]["section"] == "glossary" != me, (here, entry["term"])
    if "protocol" in entry:
        protocols = "kompendium/emergency-protocols"
        assert nodes[entry["protocol"][0]]["section"] == protocols != me, (here, entry["protocol"])
print(f"{len(pages)} entries obey the rules")
PY

# The block renders its entry: kinds and hrefs of the built page match pokracovat.json.
site="$work/.site"
zola build --output-dir "$site" >"$work/build.out" 2>&1 || { cat "$work/build.out"; exit 1; }
python3 - "$site" <<'PY'
import json, pathlib, re, sys
sys.path.insert(0, "scripts")
from ia_model import url_of
site = pathlib.Path(sys.argv[1])
pages = json.load(open("static/data/pokracovat.json"))["pages"]
link = re.compile(r'<a href="([^"]+)" data-pokracovat-kind="(\w+)"')
checked = 0
for here, entry in sorted(pages.items()):
    html = site / url_of(pathlib.PurePosixPath(here)).strip("/") / "index.html"
    text = html.read_text(encoding="utf-8")
    if "data-pokracovat " not in text:
        continue  # a template without the block (not page.html)
    found = {kind: href.split("/kompendium-epistemicke-anihilace", 1)[-1]
             for href, kind in link.findall(text)}
    want = {kind: url_of(pathlib.PurePosixPath(v[0])) for kind, v in entry.items()}
    assert found == want, f"{here}: rendered {found}, data {want}"
    checked += 1
assert checked > 100, f"only {checked} pages render the block"
PY

# A changed link graph makes pokracovat.json stale.
python3 - <<'PY'
import json
path = "static/data/graph.json"
g = json.load(open(path))
g["edges"] = g["edges"][:len(g["edges"]) // 2]
json.dump(g, open(path, "w"))
PY
if python3 scripts/build-ui-data.py --check >"$work/check.out" 2>&1; then
  echo "build-ui-data --check missed a stale pokracovat.json"; exit 1
fi
grep -F "stale pokracovat.json" "$work/check.out" >/dev/null \
  || { echo "build-ui-data --check failed for another reason:"; cat "$work/check.out"; exit 1; }
