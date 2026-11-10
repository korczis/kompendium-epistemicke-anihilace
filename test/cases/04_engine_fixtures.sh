#!/usr/bin/env bash
# The engine contract kompendium-engine/v1 holds, on a copy of the committed tree.
#
#  - scripts/engine.py reproduces every fixture in test/cases/engine/ (error.message aside);
#  - build-engine-fixtures.py --check passes, and refuses unknown options;
#  - a hand-edited fixture fails both the check and the conformance run;
#  - an output that violates data/schemas/kompendium-engine.v1.schema.json fails validation
#    (a stdlib validator for the keywords the schema uses, in build-engine-fixtures.py);
#  - the engine answers malformed requests and broken data with an error object, never raises.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case04.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "$(git -C "$root" write-tree)" | tar -x -C "$work"  # the index: what is about to be committed
cd "$work"
export PYTHONDONTWRITEBYTECODE=1

python3 scripts/build-engine-fixtures.py --help >/dev/null
if python3 scripts/build-engine-fixtures.py --bogus >/dev/null 2>&1; then
  echo "build-engine-fixtures accepted --bogus"; exit 1
fi
python3 scripts/build-engine-fixtures.py --check

# conform: every fixture reproduced by the reference engine; prints the failures.
conform() {
  python3 - <<'PY'
import importlib.util, json, pathlib, sys
sys.path.insert(0, "scripts")
import engine
spec = importlib.util.spec_from_file_location("fixtures", "scripts/build-engine-fixtures.py")
fx = importlib.util.module_from_spec(spec); spec.loader.exec_module(fx)
out = pathlib.Path("test/cases/engine")
manifest = json.loads((out / "manifest.json").read_text(encoding="utf-8"))
listed = [f["file"] for f in manifest["fixtures"]]
on_disk = sorted(p.name for p in out.glob("*.json") if p.name != "manifest.json")
assert listed == on_disk, "manifest and fixture files differ"
search, graph = fx.read("search.json"), fx.read("graph.json")
reference = engine.Engine(search, graph)
failed = 0
for name in listed:
    case = json.loads((out / name).read_text(encoding="utf-8"))
    built = fx.apply(search, graph, case["data"]) if "data" in case else reference
    got = built.run(case["input"])
    if fx.strip_message(got) != fx.strip_message(case["expected"]):
        failed += 1
        print(f"does not reproduce {name}")
print(f"conform: {len(listed)} fixture(s), {failed} failure(s)")
sys.exit(1 if failed else 0)
PY
}
conform

# A hand-edited fixture: the check names it stale and the engine no longer reproduces it.
target=test/cases/engine/search-none.json
cp "$target" "$work/fixture.orig"
python3 - "$target" <<'PY'
import json, sys
case = json.load(open(sys.argv[1], encoding="utf-8"))
case["expected"]["total"] += 1
json.dump(case, open(sys.argv[1], "w", encoding="utf-8"), ensure_ascii=False, indent=2)
PY
if python3 scripts/build-engine-fixtures.py --check >"$work/check.out" 2>&1; then
  echo "--check passed a hand-edited fixture"; exit 1
fi
grep -F "search-none.json" "$work/check.out" >/dev/null || { cat "$work/check.out"; exit 1; }
if conform >"$work/conform.out" 2>&1; then
  echo "the conformance run passed a hand-edited fixture"; exit 1
fi
grep -F "does not reproduce search-none.json" "$work/conform.out" >/dev/null || {
  cat "$work/conform.out"; exit 1; }
cp "$work/fixture.orig" "$target"

# The schema rejects outputs that break the contract and accepts the engine's own.
python3 - <<'PY'
import copy, importlib.util, sys
sys.path.insert(0, "scripts")
import engine
spec = importlib.util.spec_from_file_location("fixtures", "scripts/build-engine-fixtures.py")
fx = importlib.util.module_from_spec(spec); spec.loader.exec_module(fx)
schema = fx.load_schema()
e = engine.load()
hub = fx.most_linked(e.nodes)[0]
good = [e.run({"op": "search", "query": hub["title"]}),
        e.run({"op": "neighbourhood", "path": hub["path"], "depth": 2, "limit": 3}),
        e.run({"op": "neighbourhood", "path": hub["path"] + ".x"})]
for out in good:
    assert not fx.against(out, schema, "response"), fx.against(out, schema, "response")


def broken(out, change):
    bad = copy.deepcopy(out)
    change(bad)
    return bad


bad = [
    broken(good[0], lambda r: r["hits"][0].update(why="fuzzy")),
    broken(good[0], lambda r: r.pop("schema")),
    broken(good[0], lambda r: r.update(schema="kompendium-engine/v2")),
    broken(good[0], lambda r: r["hits"][0].update(tier=True)),
    broken(good[1], lambda r: r["edges"][0].update(kind="cites")),
    broken(good[1], lambda r: r["nodes"][0].update(extra=1)),
    broken(good[2], lambda r: r["error"].update(code="not_found")),
    broken(good[2], lambda r: r.update(ok=True)),
]
for i, out in enumerate(bad):
    assert fx.against(out, schema, "response"), f"schema accepted violation {i}"

# Never raises: odd requests and broken data give a typed error object.
odd = [None, 1, "search", [], {}, {"op": None}, {"op": "search", "query": None},
       {"op": "search", "query": "x", "limit": 1.5}, {"op": "search", "query": "x", "limit": True},
       {"op": "neighbourhood", "path": 3}, {"op": "neighbourhood", "path": "x", "depth": 0}]
for request in odd:
    out = e.run(request)
    assert out["ok"] is False and out["error"]["code"] == "bad_input", (request, out)
    assert not fx.against(out, schema, "response")
search, graph = fx.read("search.json"), fx.read("graph.json")
stray = ["t", "", "/nowhere/", "", "", [], 0, 0, []]  # an entry with no node in graph.json
for s, g in ((None, graph), (search, []), ({**search, "entries": [[1]]}, graph),
             (search, {**graph, "edges": [[0, len(graph["nodes"])]]}),
             ({**search, "entries": search["entries"] + [stray]}, graph)):
    out = engine.Engine(s, g).run({"op": "search", "query": "x"})
    assert out["error"]["code"] == "schema_mismatch", out
print("schema and error cases: ok")
PY
