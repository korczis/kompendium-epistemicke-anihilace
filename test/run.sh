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
# shellcheck source=../scripts/disk-floor.sh
. "$root/scripts/disk-floor.sh"
kea_disk_floor "test/run.sh"
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
# The owning pid, as scripts/verify-content.sh writes for its export: a tree holding only .out
# files has no open handle between case writes, so `lsof +D` reads a running suite's directory as
# unheld (2026-11-16, a peer's cleanup removed one mid-run and failed all 43 cases). Clean up a
# kea-tests.* tree only when this pid is gone.
echo $$ > "$out_dir/.kea-test.pid"

# A case number names one case: `test/run.sh 40` must not run two unrelated files, and a failure
# reported as "case 40" must point at one. Lanes take numbers from `majordomus mesh allocate case`;
# three numbers had two files each on main (02, 03, 40, 2026-11-16) before this refused it.
dupes=$(for c in test/cases/*_*.sh; do b=$(basename "$c"); echo "${b%%_*}"; done | sort | uniq -d)
if [ -n "$dupes" ]; then
  for n in $dupes; do echo "test/run.sh: case number $n names more than one file:" $(ls test/cases/"$n"_*.sh) >&2; done
  exit 2
fi

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

failed=0 ran=0 names=""
for case in "${cases[@]+"${cases[@]}"}"; do
  key=$(basename "$case" .sh); ran=$((ran + 1))
  if [ "$(cat "$out_dir/$key.rc" 2>/dev/null)" = 0 ]; then
    echo "ok   $case"
  else
    failed=$((failed + 1)); names="$names $key"
    echo "FAIL $case"
    sed 's/^/     /' "$out_dir/$key.out" | tail -20
  fi
done
# The failed names are repeated on the last line: a caller that shows only the tail of this output
# (verify-content.sh does) otherwise reports a count without saying which cases failed
# (2026-11-15: "38 case(s), 1 failure(s)" with the failing case scrolled out of the tail).
if [ "$failed" -gt 0 ]; then
  echo "test/run.sh: $ran case(s), $failed failure(s):$names"
else
  echo "test/run.sh: $ran case(s), $failed failure(s)"
fi
[ "$failed" -eq 0 ]
