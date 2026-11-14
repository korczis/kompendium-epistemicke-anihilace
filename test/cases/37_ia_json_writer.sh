#!/usr/bin/env bash
# static/data/ia.json has exactly ONE writer. build-graph.py regenerates it (and graph.json,
# metrics.json); build-ui-data.py and render-graphics.py only READ it. CI checks ia.json with
# `build-graph.py --check`, so if a second script also wrote ia.json — differently — a branch
# regenerated with that other script would pass its own --check locally and still fail CI. This
# test refuses a second writer: grep scripts/ for a write of that path and expect exactly one,
# build-graph.py. A writer either lists ia.json as a build() output target (`"ia.json":`) or writes
# the path directly (write_text / open-for-write / json.dump); a reader uses `… "ia.json").read_text`.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
cd "$root"

pattern='"ia\.json"[[:space:]]*:|(write_text|json\.dump)[[:space:]]*\([^)]*ia\.json|open[[:space:]]*\([^)]*ia\.json[^)]*["'"'"'][wa]'
writers=$(grep -lE "$pattern" scripts/*.py 2>/dev/null | sort -u || true)
n=$(printf '%s' "$writers" | grep -c . || true)

if [ "$n" != "1" ]; then
    echo "expected exactly 1 writer of static/data/ia.json, found $n:"
    printf '  %s\n' $writers
    exit 1
fi
case "$writers" in
    *scripts/build-graph.py) : ;;
    *) echo "the sole ia.json writer must be scripts/build-graph.py, is: $writers"; exit 1 ;;
esac

echo "ia.json single-writer: exactly one ($writers); build-ui-data and render-graphics only read it"
