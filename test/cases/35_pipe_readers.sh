#!/usr/bin/env bash
# Every case runs under `set -o pipefail`. A reader that stops early (`head`, `grep -q`) closes
# the pipe while the writer may still be writing; the writer then dies of SIGPIPE and the whole
# pipeline fails, depending only on timing. On 2026-11-12 case 03 failed in CI that way
# ("sort: write failed: 'standard output': Broken pipe") once cases ran in parallel. Readers
# that consume their whole input (`sed -n 1p`, `grep ... >/dev/null`) do not race.
set -euo pipefail
root=$(cd "$(dirname "$0")/../.." && pwd)
bad=$(grep -nE '\|[[:space:]]*(head\b|grep[[:space:]]+(-[[:alpha:]]*q))' "$root"/test/cases/*.sh "$root"/test/run.sh \
  | grep -v '^[^:]*:[0-9]*:[[:space:]]*#' || true)
if [ -n "$bad" ]; then
  echo "early-exit reader in a pipe (use sed -n 1p, or grep ... >/dev/null):"
  echo "$bad"
  exit 1
fi
