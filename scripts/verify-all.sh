#!/usr/bin/env bash
# Lokálně spustí stejné gaty jako CI (.github/workflows/ci.yml), v tomtéž pořadí, a skončí
# u první chyby. Gate interaktivních ploch a audit přístupnosti stavějí web pod produkční
# cestou do dočasné složky a servírují ho na volném portu (porty jiných sessions nepoužívají
# ani neukončují).
#
# Použití: npm run verify            (vše)
#          npm run verify -- --fast  (bez gate interaktivních ploch a auditu)
# Playwright: proměnná PLAYWRIGHT, jinak balíček playwright-core z node_modules.
set -euo pipefail
cd "$(dirname "$0")/.."

fast=0
[ "${1:-}" = "--fast" ] && fast=1

step() { printf '\n== %s\n' "$1"; }
run() { step "$1"; shift; "$@"; }

run "Migrace obsahu je úplná" python3 scripts/migrate-content.py --check
run "Reference jsou aktuální" python3 scripts/build-references.py --check
run "Graf odkazů a metriky jsou aktuální" python3 scripts/build-graph.py --check
run "Data shellu jsou aktuální" python3 scripts/build-ui-data.py --check
run "README je aktuální" python3 scripts/build-readme.py --check
run "Vizualizace jdou přes komponentovou vrstvu" python3 scripts/check-viz-layer.py
run "Front matter je normalizovaný" python3 scripts/normalize-front-matter.py --check
run "Markdown je upravený" python3 scripts/polish-markdown.py --check
run "Pojmy jsou propojené" python3 scripts/link-terms.py --check
run "Informační architektura se nezhoršuje" python3 scripts/check-ia.py
run "Testy nástrojů obsahu" bash test/run.sh
run "Sestavení (interní odkazy jsou chyba)" npm run --silent build
run "Flowbite Pro" node "$HOME/.claude/skills/flowbite-pro/verify.mjs" .

if [ "$fast" = 1 ]; then
  printf '\nverify: všechny gaty kromě interaktivních ploch a auditu prošly (--fast)\n'
  exit 0
fi

step "Interaktivní plochy (Playwright pod produkční cestou)"
port=$(python3 -c 'import socket; s=socket.socket(); s.bind(("127.0.0.1", 0)); print(s.getsockname()[1]); s.close()')
root=$(mktemp -d "${TMPDIR:-/tmp}/kea-verify.XXXXXX")
server=""
cleanup() { [ -n "$server" ] && kill "$server" 2>/dev/null || true; rm -rf "$root"; }
trap cleanup EXIT
zola build --base-url "http://127.0.0.1:$port/kompendium-epistemicke-anihilace" \
  --output-dir "$root/kompendium-epistemicke-anihilace" >/dev/null
(cd "$root" && exec python3 -m http.server "$port" --bind 127.0.0.1 >/dev/null 2>&1) &
server=$!
for _ in $(seq 1 50); do curl -fs -o /dev/null "http://127.0.0.1:$port/kompendium-epistemicke-anihilace/" && break; sleep 0.2; done
BASE_URL="http://127.0.0.1:$port/kompendium-epistemicke-anihilace/" node test/e2e/surfaces.cjs

step "Přístupnost, rozvržení a odkazy (axe-core WCAG 2.2 AA, CLS, přetečení, interní odkazy)"
BASE_URL="http://127.0.0.1:$port/kompendium-epistemicke-anihilace/" node scripts/audit-ui.cjs

printf '\nverify: všechny gaty prošly\n'
