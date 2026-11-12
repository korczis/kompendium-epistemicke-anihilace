#!/usr/bin/env bash
# scripts/check-derived-currency.sh (the pre-push gate): a commit whose derived data is current
# passes; a commit with a stale graph.json is refused, so a stale push can never reach main and
# turn the Pages deploy red. Runs on a throwaway git repo seeded from a copy of the tree, so it
# never touches the checkout.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case20.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
git init -q -b main
git add -A
git -c user.email=t@example.com -c user.name=test commit -qm base >/dev/null

# 1) a current tree passes
if ! bash scripts/check-derived-currency.sh >/dev/null 2>&1; then
  echo "a tree with current derived data was wrongly refused"; exit 1
fi

# 2) a stale graph.json is refused (build-graph --check sees it)
printf '{"schema":"kompendium-graph/v1","nodes":[],"edges":[],"families":{},"categories":{}}\n' \
  > static/data/graph.json
git add -A
git -c user.email=t@example.com -c user.name=test commit -qm "stale graph.json" >/dev/null
if bash scripts/check-derived-currency.sh >/dev/null 2>&1; then
  echo "a stale graph.json was wrongly accepted — the gate would let a red deploy through"; exit 1
fi

echo "ok: current tree passes, stale graph.json refused"
