#!/usr/bin/env bash
# Runs every behavioural case under test/cases/ (or the ones named) and reports each.
# A case is a bash script that exits 0 on success; it works on a temporary copy of the
# repository and never changes the checkout.
#
#   test/run.sh            every case
#   test/run.sh 01 02      the cases whose number is given
set -uo pipefail

root=$(cd "$(dirname "$0")/.." && pwd)
cd "$root"
failed=0 ran=0
for case in test/cases/*_*.sh; do
  n=$(basename "$case"); n=${n%%_*}
  if [ $# -gt 0 ] && ! printf '%s\n' "$@" | grep -qx "$n"; then continue; fi
  ran=$((ran + 1))
  if out=$(bash "$case" 2>&1); then
    echo "ok   $case"
  else
    failed=$((failed + 1))
    echo "FAIL $case"
    printf '%s\n' "$out" | sed 's/^/     /' | tail -20
  fi
done
echo "test/run.sh: $ran case(s), $failed failure(s)"
[ "$failed" -eq 0 ]
