#!/usr/bin/env bash
# Runs every behavioural case under test/cases/ (or the ones named) and reports each.
# A case is a bash script that exits 0 on success; it works on a temporary copy of the
# repository and never changes the checkout, so cases run in parallel (TEST_JOBS, default the
# CPUs up to 4): each case calls check-ia several times at ~25 s a call, and run one after
# another the suite outgrew CI's 70-minute job (2026-11-12). Output stays in case order.
#
#   test/run.sh            every case
#   test/run.sh 01 02      the cases whose number is given
set -uo pipefail

root=$(cd "$(dirname "$0")/.." && pwd)
cd "$root"
# At most 4 by default: each case extracts the tree and some build the whole site (~600 MB),
# so jobs are bounded by disk, not only by CPUs; 18 at once filled this Mac's disk (2026-11-12).
cpus=$(getconf _NPROCESSORS_ONLN 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 2)
jobs=${TEST_JOBS:-$(( cpus < 4 ? cpus : 4 ))}
out_dir=$(mktemp -d "${TMPDIR:-/tmp}/kea-tests.XXXXXX")
# One snapshot of the index for every case: `git write-tree` refreshes the index and takes
# index.lock, so cases computing it in parallel collided ("index.lock: File exists").
KEA_TEST_TREE=$(git write-tree) || { echo "test/run.sh: git write-tree failed" >&2; exit 1; }
export KEA_TEST_TREE
trap 'rm -rf "$out_dir"' EXIT

cases=()
for case in test/cases/*_*.sh; do
  n=$(basename "$case"); n=${n%%_*}
  if [ $# -gt 0 ] && ! printf '%s\n' "$@" | grep -x "$n" >/dev/null; then continue; fi
  cases+=("$case")
done

running=0
for case in "${cases[@]+"${cases[@]}"}"; do
  key=$(basename "$case" .sh)
  ( bash "$case" > "$out_dir/$key.out" 2>&1; echo $? > "$out_dir/$key.rc" ) &
  running=$((running + 1))
  if [ "$running" -ge "$jobs" ]; then wait -n 2>/dev/null || wait; running=$((running - 1)); fi
done
wait

failed=0 ran=0
for case in "${cases[@]+"${cases[@]}"}"; do
  key=$(basename "$case" .sh); ran=$((ran + 1))
  if [ "$(cat "$out_dir/$key.rc" 2>/dev/null)" = 0 ]; then
    echo "ok   $case"
  else
    failed=$((failed + 1))
    echo "FAIL $case"
    sed 's/^/     /' "$out_dir/$key.out" | tail -20
  fi
done
echo "test/run.sh: $ran case(s), $failed failure(s)"
[ "$failed" -eq 0 ]
