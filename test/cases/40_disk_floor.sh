#!/usr/bin/env bash
# The content gate and the test suite refuse to start on a nearly full disk (scripts/disk-floor.sh):
# below the floor a run fails with ENOSPC in ways that look like content defects. A floor above the
# free space refuses with exit 3 and names the reading; KEA_MIN_FREE_MIB=0 disables the check.
set -euo pipefail
root=$(cd "$(dirname "$0")/../.." && pwd)
out=$(mktemp "${TMPDIR:-/tmp}/kea-case40.XXXXXX")
trap 'rm -f "$out"' EXIT
rc=0; KEA_MIN_FREE_MIB=99999999 bash "$root/test/run.sh" 40 >"$out" 2>&1 || rc=$?
[ "$rc" = 3 ] || { echo "run.sh below the floor exited $rc, not 3"; cat "$out"; exit 1; }
grep -- "refusing to start" "$out" >/dev/null || { echo "run.sh did not name the reason"; exit 1; }
rc=0; KEA_MIN_FREE_MIB=99999999 bash "$root/scripts/verify-content.sh" >"$out" 2>&1 || rc=$?
[ "$rc" = 3 ] || { echo "verify-content below the floor exited $rc, not 3"; cat "$out"; exit 1; }
( . "$root/scripts/disk-floor.sh"; KEA_MIN_FREE_MIB=0 kea_disk_floor probe ) \
  || { echo "KEA_MIN_FREE_MIB=0 did not disable the check"; exit 1; }
echo "case 40: below the disk floor the gate and the suite refuse with exit 3; 0 disables it"
