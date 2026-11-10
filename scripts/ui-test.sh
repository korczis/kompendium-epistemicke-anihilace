#!/usr/bin/env bash
# Browser gate of the site: build it under the production path prefix, serve it, then run the
# interactivity smoke test (scripts/smoke-ui.cjs) and the accessibility/layout audit
# (scripts/audit-ui.cjs). Exit non-zero on any failure. Needs `npm ci` and a Chromium for
# Playwright (`npx playwright-core install chromium`).
#
#   scripts/ui-test.sh            smoke + audit
#   AUDIT=0 scripts/ui-test.sh    smoke only (fast)
set -euo pipefail

root=$(cd "$(dirname "$0")/.." && pwd)
cd "$root"
port=${PORT:-1199}
prefix=kompendium-epistemicke-anihilace
out=$(mktemp -d "${TMPDIR:-/tmp}/kea-ui-test.XXXXXX")
trap 'kill "${server:-0}" 2>/dev/null || true; rm -rf "$out"' EXIT

npm run --silent assets
zola build --force -u "http://127.0.0.1:$port/$prefix" -o "$out/site/$prefix" >/dev/null
python3 -m http.server "$port" --bind 127.0.0.1 --directory "$out/site" >/dev/null 2>&1 &
server=$!
for _ in $(seq 50); do curl -fs -o /dev/null "http://127.0.0.1:$port/$prefix/" && break; sleep 0.2; done

node scripts/smoke-ui.cjs "http://127.0.0.1:$port/$prefix" "$out/shots"
if [ "${AUDIT:-1}" = 1 ]; then
  node scripts/audit-ui.cjs "http://127.0.0.1:$port/$prefix" "${AUDIT_OUT:-$out/audit}"
fi
