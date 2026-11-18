#!/usr/bin/env bash
# The JS coverage gate (scripts/check-js-coverage.py) is a ratchet over the coverage that
# test/e2e/surfaces.cjs writes with COVERAGE_OUT. On a fixture tree (static/js with two scripts
# and a vendored bundle) and fixture coverage JSON:
#
#  - unknown options and a missing coverage file are refused (exit 2), --help only prints;
#  - --update writes the first baseline; the same measurement then passes;
#  - a script of unchanged source covering fewer functions fails, naming it;
#  - a script whose source changed passes at the same share and fails below it;
#  - a script no scenario loads fails, whether new or in the baseline; a new loaded one passes;
#  - --update refuses while any finding stands and leaves the baseline byte for byte, and raises
#    it after an improvement; a script that no longer exists is a note, and --update drops it;
#  - vendored and minified scripts are never judged;
#  - the committed baseline lists only scripts that exist, each loaded at the time.
set -euo pipefail
root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case69.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"

gate="python3 scripts/check-js-coverage.py"
fx="$work/fixture"
mkdir -p "$fx/static/js/viz" "$fx/static/js/vendor" "$fx/test"
echo 'function a() {} function b() {}' > "$fx/static/js/viz/a.js"
echo 'function c() {}' > "$fx/static/js/viz/c.js"
echo 'function v() {}' > "$fx/static/js/vendor/v.js"
echo 'function m() {}' > "$fx/static/js/viz/x.min.js"
base="$fx/test/js-coverage-baseline.json"
out="$work/gate.out"

# cov FILE a:<functions>/<covered> ...: coverage JSON as surfaces.cjs writes it (bytes > 0 when
# any function ran, or with a "+" suffix when only top-level code ran).
cov() {
  local file=$1; shift
  python3 - "$file" "$@" <<'PY'
import json, sys
files = {}
for spec in sys.argv[2:]:
    name, frac = spec.split(":")
    loaded = frac.endswith("+")
    fn, hit = (int(x) for x in frac.rstrip("+").split("/"))
    files[f"static/js/viz/{name}.js"] = {"functions": fn, "coveredFunctions": hit, "bytes": 40,
                                        "coveredBytes": 40 if hit or loaded else 0,
                                        "uncoveredFunctions": []}
json.dump({"schema": "kompendium-js-coverage/v1", "files": files}, open(sys.argv[1], "w"))
PY
}
pass() { $gate "$@" --root "$fx" >"$out" 2>&1 || { echo "gate failed: $*"; cat "$out"; exit 1; }; }
fail() {
  local want=$1; shift
  if $gate "$@" --root "$fx" >"$out" 2>&1; then echo "gate passed: $*"; cat "$out"; exit 1; fi
  grep -F -- "$want" "$out" >/dev/null || { echo "missing finding: $want"; cat "$out"; exit 1; }
}

$gate --help >/dev/null
for bad in "--bogus $work/x.json" "" "$work/missing.json"; do
  # shellcheck disable=SC2086
  if $gate $bad --root "$fx" >/dev/null 2>&1; then echo "gate accepted: '$bad'"; exit 1; fi
done
cov "$work/c1.json" a:2/1 c:1/1
fail "no baseline" "$work/c1.json"

# First baseline, then the same measurement passes; vendor/ and *.min.js are not in it.
pass "$work/c1.json" --update
python3 - "$base" <<'PY'
import json, sys
b = json.load(open(sys.argv[1]))
assert sorted(b["files"]) == ["static/js/viz/a.js", "static/js/viz/c.js"], b["files"]
assert b["files"]["static/js/viz/a.js"]["covered"] == 1 and b["files"]["static/js/viz/a.js"]["pct"] == 50.0
PY
pass "$work/c1.json"

# Unchanged source covering fewer functions fails; more functions listed with the same covered
# count (V8 revealed inner functions) does not.
cov "$work/c2.json" a:2/0+ c:1/1
fail "static/js/viz/a.js: covers 0 functions, the baseline 1 (source unchanged)" "$work/c2.json"
cov "$work/c3.json" a:4/1 c:1/1
pass "$work/c3.json"

# --update refuses a drop and leaves the baseline byte for byte.
cp "$base" "$work/base.before"
fail "--update refused" "$work/c2.json" --update
cmp -s "$base" "$work/base.before" || { echo "refused --update changed the baseline"; exit 1; }

# A changed source is judged by its share: 1/2 holds 50 %, 1/3 falls below it.
echo 'function a() {} function b() {} function b2() {}' > "$fx/static/js/viz/a.js"
cov "$work/c4.json" a:2/1 c:1/1
pass "$work/c4.json"
cov "$work/c5.json" a:3/1 c:1/1
fail "static/js/viz/a.js: function coverage 33.3 % (1/3) is below the baseline 50.0 % (source changed)" "$work/c5.json"

# A script in the baseline that the run did not load fails; so does a new one; a new loaded
# script only gets a note.
cov "$work/c6.json" a:2/1
fail "static/js/viz/c.js: not loaded by the surfaces run" "$work/c6.json"
echo 'function n() {}' > "$fx/static/js/viz/n.js"
fail "static/js/viz/n.js: not loaded by the surfaces run" "$work/c4.json"
cov "$work/c7.json" a:2/1 c:1/1 n:1/0+
pass "$work/c7.json"
grep -F "static/js/viz/n.js: new" "$out" >/dev/null || { echo "no note for the new script"; cat "$out"; exit 1; }

# An improvement raises the baseline; a removed script is a note and --update drops it.
rm "$fx/static/js/viz/c.js"
cov "$work/c8.json" a:3/3 n:1/1
pass "$work/c8.json"
grep -F "static/js/viz/c.js: in the baseline but no longer under static/js" "$out" >/dev/null \
  || { echo "no note for the removed script"; cat "$out"; exit 1; }
pass "$work/c8.json" --update
python3 - "$base" <<'PY'
import json, sys
f = json.load(open(sys.argv[1]))["files"]
assert sorted(f) == ["static/js/viz/a.js", "static/js/viz/n.js"], f
assert f["static/js/viz/a.js"]["covered"] == 3 and f["static/js/viz/a.js"]["pct"] == 100.0, f
PY
cov "$work/c9.json" a:3/2 n:1/1
fail "static/js/viz/a.js: covers 2 functions, the baseline 3" "$work/c9.json"

# The committed baseline: every entry is a script that exists, and each was loaded.
python3 - <<'PY'
import json, pathlib
b = json.load(open("test/js-coverage-baseline.json"))
assert b["schema"] == "kompendium-js-coverage-baseline/v1", b["schema"]
for rel, row in b["files"].items():
    assert pathlib.Path(rel).is_file(), f"baseline lists {rel}, which does not exist"
    assert not rel.startswith("static/js/vendor/") and not rel.endswith(".min.js"), rel
    assert 0 <= row["covered"] <= row["functions"], (rel, row)
PY
