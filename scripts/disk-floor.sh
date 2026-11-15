#!/usr/bin/env bash
# Refuse to start a content gate or the test suite on a nearly full disk.
#
# Below a few GiB free, zola builds, tree exports and parallel test cases fail with ENOSPC in ways
# that read exactly like content or gate defects (2026-11-15: two branches reported 1 and 3 test
# failures at 1.2–2.4 GiB free; both ran green once the disk had room, and an hour went into
# chasing failures that were the machine's). Sourced by scripts/verify-content.sh and test/run.sh.
#
#   KEA_MIN_FREE_MIB   the floor in MiB (default 3072); 0 disables the check
#
# The space measured is the filesystem holding ${TMPDIR:-/tmp}, where the exports and test copies go.
kea_disk_floor() {
  local floor=${KEA_MIN_FREE_MIB:-3072} dir=${TMPDIR:-/tmp} free
  [ "$floor" = 0 ] && return 0
  free=$(df -Pm "$dir" 2>/dev/null | awk 'NR == 2 {print $4}')
  [ -n "$free" ] || return 0   # no reading: do not block on an instrument that failed
  if [ "$free" -lt "$floor" ]; then
    echo "$1: refusing to start: $free MiB free on the filesystem of $dir, floor $floor MiB" >&2
    echo "$1: a run this close to a full disk fails with ENOSPC and looks like a defect; free space" >&2
    echo "$1: first (or set KEA_MIN_FREE_MIB, 0 disables)" >&2
    exit 3
  fi
}
