#!/usr/bin/env bash
# The wasm engine (crates/kompendium-engine, loaded by static/js/viz/jadro-wasm.js through
# jadro.js) keeps the contract kompendium-engine/v1, on a copy of the committed tree:
#
#  - its Unicode tables are current (scripts/build-engine-unicode.py --check);
#  - jadro.js picks it (engine "wasm") for every create, the data-override fixtures included;
#  - it reproduces every fixture in test/cases/engine/ (error.message aside) and answers the
#    sweep of 05 plus edge requests (number forms, field order, EA code spellings, folding)
#    byte for byte as the reference scripts/engine.py does, error messages included;
#  - its normalise equals the reference's on every code point (in runs of 128) and on seeded
#    strings around U+03A3 (Final_Sigma);
#  - a module with one tier name changed fails the run, and a module that names another
#    contract is refused by the loader, so jadro.js answers with its JS engine.
#
# static/wasm/kompendium_engine.wasm is a build product (gitignored, so not in the export): it
# is read from the checkout. When it is missing the case is skipped with a notice, unless
# KEA_WASM_BUILD=1 and cargo are present, which build it here first (CI builds it in its own
# step; on the owner's Mac the build runs on another host, see crates/kompendium-engine/README.md).
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
module="$root/static/wasm/kompendium_engine.wasm"
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case06.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "$(git -C "$root" write-tree)" | tar -x -C "$work"
cd "$work"
export PYTHONDONTWRITEBYTECODE=1

if [ ! -f "$module" ]; then
  if [ "${KEA_WASM_BUILD:-}" = 1 ] && command -v cargo >/dev/null 2>&1; then
    CARGO_TARGET_DIR="$work/target" cargo build --quiet --release --locked \
      --target wasm32-unknown-unknown --manifest-path crates/kompendium-engine/Cargo.toml
    module="$work/target/wasm32-unknown-unknown/release/kompendium_engine.wasm"
  else
    echo "skip: no wasm build; run on a host with cargo (static/wasm/kompendium_engine.wasm is missing)"
    exit 0
  fi
fi
mkdir -p static/wasm
cp "$module" static/wasm/kompendium_engine.wasm

python3 scripts/build-engine-unicode.py --check

# The sweep of 05 plus edge requests, answered by the reference engine, as compact JSON.
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
queries.update({"ea-007", "EA 1-2-F", "ea-1.ab", "ea-1.", "ea--1", "EA-0001.0002", "ea1 2",
                "ea99999999999999999999", "1.2.3", "ﬁ", "ΣΑΣ ΟΔΟΣ", "  　 x  ", "∇∞",
                "İstanbul", "Straße", "한국어", "ǅ", "x" * 200})
requests = []
for q in sorted(queries):
    requests += [{"op": "search", "query": q}, {"op": "search", "query": q, "limit": 50}]
for n in graph["nodes"][::7]:
    for depth in (1, 2):
        requests.append({"op": "neighbourhood", "path": n["path"], "depth": depth})
hub = max(graph["nodes"], key=lambda n: (n["in"], n["path"]))["path"]
requests += [
    {"op": "search", "query": "x" * 201}, {"op": "search", "query": " \t "},
    {"op": "search", "query": "a", "limit": 2.0}, {"op": "search", "query": "a", "limit": 50.5},
    {"op": "search", "query": "a", "limit": 0}, {"op": "search", "query": "a", "limit": 51},
    {"op": "search", "query": "a", "limit": True}, {"op": "search", "query": "a", "limit": None},
    {"op": "search", "query": "a", "limit": "3"}, {"op": "search", "query": "a", "limit": 10**30},
    {"op": "search", "query": "a", "zeta": 1, "alpha": 2, "Beta": 3},
    {"op": "search", "query": "a", "é": 1, "z": 2}, {"op": "search"}, {"op": "Search"},
    {"op": 1}, {"query": "a"}, [], None, "search", 3, {},
    {"op": "neighbourhood", "path": hub, "depth": 2.0, "limit": 200},
    {"op": "neighbourhood", "path": hub, "depth": 3}, {"op": "neighbourhood", "path": hub, "depth": "1"},
    {"op": "neighbourhood", "path": hub, "limit": 201}, {"op": "neighbourhood", "path": ""},
    {"op": "neighbourhood", "path": "x" * 513}, {"op": "neighbourhood", "path": "x" * 512},
    {"op": "neighbourhood", "path": hub, "query": "a"}, {"op": "neighbourhood"},
]
for req in requests:
    out = ref.run(req)
    print(json.dumps({"input": req, "expected": out,
                      "text": json.dumps(out, ensure_ascii=False, separators=(",", ":"))},
                     ensure_ascii=False))
PY

# normalise on every code point, in runs of 128, and on seeded strings around U+03A3.
python3 - <<'PY' > "$work/fold.jsonl"
import json, random, re, sys, unicodedata
sys.path.insert(0, "scripts")
import engine
tables = open("crates/kompendium-engine/src/tables.rs", encoding="utf-8").read()
recorded = re.search(r'UNICODE_VERSION: &str = "([^"]+)"', tables).group(1)
points = [cp for cp in range(0x110000) if not 0xD800 <= cp < 0xE000]
texts = ["".join(map(chr, points[i:i + 128])) for i in range(0, len(points), 128)]
if recorded != unicodedata.unidata_version:
    # Another Unicode version than the tables': code points it newly assigns may fold
    # differently, so only the seeded strings below are compared (build-engine-unicode --check
    # says the same); regenerate the tables on that Python to compare everything.
    print(f"notice: tables are Unicode {recorded}, this Python {unicodedata.unidata_version}; "
          "every-code-point sweep skipped", file=sys.stderr)
    texts = []
alphabet = ["Σ", "a", "A", " ", "'", ".", "­", "́", "ʰ", "’", "1", "ﬁ", "İ",
            "ᾈ", "ͅ", "　", "-", "Ω"]
rng = random.Random(6)
texts += ["".join(rng.choice(alphabet) for _ in range(rng.randint(1, 8))) for _ in range(5000)]
for t in texts:
    print(json.dumps({"text": t, "norm": engine.normalise(t)}, ensure_ascii=False))
PY

cat > "$work/conform.cjs" <<'JS'
'use strict';
const fs = require('fs');
const path = require('path');
const [, , modulePath, sweepPath, foldPath] = process.argv;
const jadro = require(path.resolve('static/js/viz/jadro.js'));
const W = require(path.resolve('static/js/viz/jadro-wasm.js'));
if (!W.loadSync(fs.readFileSync(modulePath))) {
  console.log('wasm: the loader refused the module (not kompendium-engine/v1)');
  process.exit(1);
}
jadro.useWasm(W);
const read = (n) => JSON.parse(fs.readFileSync(path.join('static/data', n), 'utf8'));
const search = read('search.json');
const graph = read('graph.json');
let failed = 0;
const fail = (what) => {
  failed++;
  if (failed <= 10) console.log(what);
  if (process.env.FAIL_FAST) process.exit(1);  // the broken-module runs need one difference
};
const build = (s, g) => {
  const e = jadro.create(s, g);
  if (e.engine !== 'wasm') fail('jadro.js answered with the ' + e.engine + ' engine');
  return e;
};
const engine = build(search, graph);
const strip = (r) => (r && r.error ? { ...r, error: { code: r.error.code, field: r.error.field } } : r);
const canon = (v) => Array.isArray(v) ? v.map(canon) : v && typeof v === 'object'
  ? Object.keys(v).sort().reduce((o, k) => { o[k] = canon(v[k]); return o; }, {}) : v;
const same = (a, b) => JSON.stringify(canon(strip(a))) === JSON.stringify(canon(strip(b)));
const dir = 'test/cases/engine';
const manifest = JSON.parse(fs.readFileSync(path.join(dir, 'manifest.json'), 'utf8'));
for (const { file } of manifest.fixtures) {
  const c = JSON.parse(fs.readFileSync(path.join(dir, file), 'utf8'));
  const e = c.data
    ? build({ ...search, ...(c.data.search || {}) }, { ...graph, ...(c.data.graph || {}) })
    : engine;
  if (!same(e.run(c.input), c.expected)) fail('fixture ' + file);
}
const raw = W.create(search, graph);
let swept = 0;
let identical = 0;
for (const line of fs.readFileSync(sweepPath, 'utf8').split('\n')) {
  if (!line) continue;
  const c = JSON.parse(line);
  swept++;
  if (!same(engine.run(c.input), c.expected)) { fail('sweep ' + JSON.stringify(c.input).slice(0, 200)); continue; }
  const text = JSON.stringify(c.input === undefined ? null : c.input);
  if (raw.runText(text) === c.text) identical++;
  else fail('sweep (bytes) ' + text.slice(0, 200));
}
let folded = 0;
for (const line of fs.readFileSync(foldPath, 'utf8').split('\n')) {
  if (!line) continue;
  const c = JSON.parse(line);
  folded++;
  if (raw.normalise(c.text) !== c.norm) fail('normalise ' + JSON.stringify(c.text).slice(0, 120));
}
console.log(`wasm: ${manifest.fixtures.length} fixture(s), ${swept} sweep request(s) ` +
  `(${identical} byte-identical), ${folded} normalise string(s), ${failed} difference(s)`);
process.exit(failed ? 1 : 0);
JS

wasm=static/wasm/kompendium_engine.wasm
node "$work/conform.cjs" "$wasm" "$work/sweep.jsonl" "$work/fold.jsonl"

# Broken modules. One tier name changed must fail the conformance run. A module that names
# another contract must be refused by the loader, and jadro.js must then answer with its JS
# engine, correctly.
node - "$wasm" "$work" <<'JS'
const fs = require('fs');
const [, , wasm, work] = process.argv;
const bytes = fs.readFileSync(wasm);
const seed = (from, to, name) => {
  const out = Buffer.from(bytes);
  let n = 0;
  for (let at = out.indexOf(from); at >= 0; at = out.indexOf(from, at + 1), n++) out.write(to, at);
  if (!n) { console.log('could not seed ' + name); process.exit(1); }
  fs.writeFileSync(`${work}/${name}.wasm`, out);
};
seed('title_prefix', 'title_prefiy', 'broken-tier');
seed('kompendium-engine/v1', 'kompendium-engine/v9', 'broken-contract');
JS
if FAIL_FAST=1 node "$work/conform.cjs" "$work/broken-tier.wasm" "$work/sweep.jsonl" "$work/fold.jsonl" >/dev/null 2>&1; then
  echo "a broken module (one tier renamed) passed the conformance run"; exit 1
fi
node - "$work/broken-contract.wasm" <<'JS'
const fs = require('fs');
const path = require('path');
const jadro = require(path.resolve('static/js/viz/jadro.js'));
const W = require(path.resolve('static/js/viz/jadro-wasm.js'));
if (W.loadSync(fs.readFileSync(process.argv[2]))) {
  console.log('the loader accepted a module of another contract'); process.exit(1);
}
jadro.useWasm(W);
const read = (n) => JSON.parse(fs.readFileSync(path.join('static/data', n), 'utf8'));
const e = jadro.create(read('search.json'), read('graph.json'));
const c = JSON.parse(fs.readFileSync('test/cases/engine/search-none.json', 'utf8'));
if (e.engine !== 'js' || JSON.stringify(e.run(c.input).total) !== JSON.stringify(c.expected.total)) {
  console.log('jadro.js did not fall back to its JS engine'); process.exit(1);
}
JS
size=$(wc -c < "$wasm" | tr -d ' ')
echo "ok: the wasm engine ($size bytes) keeps kompendium-engine/v1"
