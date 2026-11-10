#!/usr/bin/env bash
# The site's engine (static/js/viz/jadro.js) keeps the contract kompendium-engine/v1, on a copy
# of the committed tree:
#
#  - it reproduces every fixture in test/cases/engine/ (error.message aside), including the
#    fixtures whose `data` override breaks search.json or graph.json;
#  - it gives byte-identical answers to the reference scripts/engine.py on a sweep derived
#    from the data (every title, every code, the first word and a three-letter prefix of every
#    title, folded and spaced variants, and the neighbourhood of every 7th page at depth 1
#    and 2), so a fixture regeneration cannot let the two implementations drift apart;
#  - a broken copy of the engine (one tier swapped) fails both checks.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case05.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "$(git -C "$root" write-tree)" | tar -x -C "$work"
cd "$work"
export PYTHONDONTWRITEBYTECODE=1

# The sweep: requests derived from the data, answered by the reference engine.
python3 - <<'PY' > "$work/sweep.jsonl"
import json, sys
sys.path.insert(0, "scripts")
import engine
search = json.load(open("static/data/search.json", encoding="utf-8"))
graph = json.load(open("static/data/graph.json", encoding="utf-8"))
ref = engine.Engine(search, graph)
f = {n: i for i, n in enumerate(search["fields"])}
queries = set()
for e in search["entries"]:
    t = e[f["title"]]
    queries.add(t)
    words = t.split()
    if words:
        queries.add(words[0])
        queries.add(t[:3])
        queries.add("  " + t.upper() + "\t")
    if e[f["code"]]:
        c = e[f["code"]]
        queries.update({c, c.lower().replace("-", " "), c.lower().replace("-", "").replace(".", "-")})
for q in sorted(queries):
    for req in ({"op": "search", "query": q}, {"op": "search", "query": q, "limit": 50}):
        print(json.dumps({"input": req, "expected": ref.run(req)}, ensure_ascii=False))
for n in graph["nodes"][::7]:
    for depth in (1, 2):
        req = {"op": "neighbourhood", "path": n["path"], "depth": depth}
        print(json.dumps({"input": req, "expected": ref.run(req)}, ensure_ascii=False))
PY

cat > "$work/conform.cjs" <<'JS'
'use strict';
const fs = require('fs');
const path = require('path');
const jadro = require(path.resolve(process.argv[2]));
const read = (n) => JSON.parse(fs.readFileSync(path.join('static/data', n), 'utf8'));
const search = read('search.json');
const graph = read('graph.json');
const engine = jadro.create(search, graph);
const strip = (r) => (r && r.error ? { ...r, error: { code: r.error.code, field: r.error.field } } : r);
const same = (a, b) => JSON.stringify(strip(a)) === JSON.stringify(strip(b));
// Key order does not matter for equality: canonicalise by sorting keys.
const canon = (v) => Array.isArray(v) ? v.map(canon) : v && typeof v === 'object'
  ? Object.keys(v).sort().reduce((o, k) => { o[k] = canon(v[k]); return o; }, {}) : v;
let failed = 0;
const dir = 'test/cases/engine';
const manifest = JSON.parse(fs.readFileSync(path.join(dir, 'manifest.json'), 'utf8'));
for (const { file } of manifest.fixtures) {
  const c = JSON.parse(fs.readFileSync(path.join(dir, file), 'utf8'));
  const e = c.data
    ? jadro.create({ ...search, ...(c.data.search || {}) }, { ...graph, ...(c.data.graph || {}) })
    : engine;
  if (!same(canon(e.run(c.input)), canon(c.expected))) { failed++; console.log('fixture ' + file); }
}
let swept = 0;
for (const line of fs.readFileSync(process.argv[3], 'utf8').split('\n')) {
  if (!line) continue;
  const c = JSON.parse(line);
  swept++;
  if (!same(canon(engine.run(c.input)), canon(c.expected))) {
    failed++;
    if (failed <= 10) console.log('sweep ' + JSON.stringify(c.input));
  }
}
console.log(`jadro: ${manifest.fixtures.length} fixture(s), ${swept} sweep request(s), ${failed} difference(s)`);
process.exit(failed ? 1 : 0);
JS

node "$work/conform.cjs" static/js/viz/jadro.js "$work/sweep.jsonl"

# A broken engine (title_prefix and exact_title swapped) must fail.
sed "s/e.t === q, e.aliases.indexOf(q) >= 0,/e.t.startsWith(q), e.aliases.indexOf(q) >= 0,/" \
  static/js/viz/jadro.js > "$work/broken.js"
if cmp -s static/js/viz/jadro.js "$work/broken.js"; then echo "could not seed the broken engine"; exit 1; fi
if node "$work/conform.cjs" "$work/broken.js" "$work/sweep.jsonl" >/dev/null 2>&1; then
  echo "a broken engine passed the conformance run"; exit 1
fi
echo "ok: jadro.js keeps kompendium-engine/v1"
