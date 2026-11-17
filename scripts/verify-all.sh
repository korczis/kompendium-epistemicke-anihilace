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

# The site is built into a temporary directory, never into public/: a build left in the worktree is
# ~560 MB, and every verify in every worktree used to leave one (2026-11-12: thirteen of them took
# ~7 GB and the shared disk fell to 326 MiB, killing peers' builds with ENOSPC). One cleanup owns
# every temporary path this script makes.
tmp_paths=()
server=""
cleanup() { [ -n "$server" ] && kill "$server" 2>/dev/null || true; for p in "${tmp_paths[@]+"${tmp_paths[@]}"}"; do rm -rf "$p"; done; }
trap cleanup EXIT
site=$(mktemp -d "${TMPDIR:-/tmp}/kea-verify.XXXXXX"); tmp_paths+=("$site")
echo $$ > "$site/.kea-verify.pid"

step() { printf '\n== %s\n' "$1"; }
run() { step "$1"; shift; "$@"; }

run "Migrace obsahu je úplná" python3 scripts/migrate-content.py --check
run "Reference jsou aktuální" python3 scripts/build-references.py --check
run "Graf odkazů a metriky jsou aktuální" python3 scripts/build-graph.py --check
run "Data shellu jsou aktuální" python3 scripts/build-ui-data.py --check
run "Fixtures kontraktu enginu jsou aktuální" python3 scripts/build-engine-fixtures.py --check
run "Grafiky jsou aktuální" python3 scripts/render-graphics.py --check
run "README je aktuální" python3 scripts/build-readme.py --check
run "Vizualizace jdou přes komponentovou vrstvu" python3 scripts/check-viz-layer.py
run "Front matter je normalizovaný" python3 scripts/normalize-front-matter.py --check
run "Markdown je upravený" python3 scripts/polish-markdown.py --check
run "Pojmy jsou propojené" python3 scripts/link-terms.py --bold --check
run "Informační architektura se nezhoršuje" python3 scripts/check-ia.py
run "Katalogy knihy souhlasí se stránkami" python3 scripts/catalogs.py --check
run "Testy nástrojů obsahu" bash test/run.sh
# Wasm engine jako v ci.yml: po test/run.sh (06 bez modulu přeskočí) a před sestavením, aby modul
# byl v sestaveném webu. Bez něj surfaces hlásí 404 /wasm/kompendium_engine.wasm v každém scénáři
# a lokální verify nemohl projít nikdy (audit 2026-11-17: 0/134 scénářů).
build_engine() {
  rustup target list --installed 2>/dev/null | grep -qx wasm32-unknown-unknown || {
    echo "chybí cíl wasm32-unknown-unknown: rustup target add wasm32-unknown-unknown"; return 1; }
  cargo build --release --locked --target wasm32-unknown-unknown \
    --manifest-path crates/kompendium-engine/Cargo.toml
  mkdir -p static/wasm
  cp crates/kompendium-engine/target/wasm32-unknown-unknown/release/kompendium_engine.wasm static/wasm/
  size=$(wc -c < static/wasm/kompendium_engine.wasm)
  echo "kompendium_engine.wasm: $size bytes (limit 307200)"
  test "$size" -le 307200
}
run "Wasm engine se sestaví do static/wasm/ (jako CI)" build_engine
run "Wasm engine drží kontrakt kompendium-engine/v1" bash test/cases/06_engine_wasm.sh
run "Sestavení (interní odkazy jsou chyba)" sh -c 'npm run --silent assets && zola build --output-dir "$1"' _ "$site/out"
# Patří k build-ui-data, ale čte sestavený web (pohledy stránek, scénáře derived()),
# proto běží až po sestavení.
run "Katalog ploch a pokrytí tříd stránek" python3 scripts/build-surfaces.py --check --site "$site/out"
run "Flowbite Pro" node "$HOME/.claude/skills/flowbite-pro/verify.mjs" .

if [ "$fast" = 1 ]; then
  printf '\nverify: všechny gaty kromě interaktivních ploch a auditu prošly (--fast)\n'
  exit 0
fi

step "Interaktivní plochy (Playwright pod produkční cestou)"
port=$(python3 -c 'import socket; s=socket.socket(); s.bind(("127.0.0.1", 0)); print(s.getsockname()[1]); s.close()')
root=$(mktemp -d "${TMPDIR:-/tmp}/kea-verify.XXXXXX"); tmp_paths+=("$root")
echo $$ > "$root/.kea-verify.pid"
zola build --base-url "http://127.0.0.1:$port/kompendium-epistemicke-anihilace" \
  --output-dir "$root/kompendium-epistemicke-anihilace" >/dev/null
(cd "$root" && exec python3 -m http.server "$port" --bind 127.0.0.1 >/dev/null 2>&1) &
server=$!
for _ in $(seq 1 50); do curl -fs -o /dev/null "http://127.0.0.1:$port/kompendium-epistemicke-anihilace/" && break; sleep 0.2; done
BASE_URL="http://127.0.0.1:$port/kompendium-epistemicke-anihilace/" \
  SITE_DIR="$root/kompendium-epistemicke-anihilace" node test/e2e/surfaces.cjs

step "Přístupnost, rozvržení a odkazy (axe-core WCAG 2.2 AA, CLS, přetečení, interní odkazy)"
BASE_URL="http://127.0.0.1:$port/kompendium-epistemicke-anihilace/" \
  SITE_DIR="$root/kompendium-epistemicke-anihilace" node scripts/audit-ui.cjs

printf '\nverify: všechny gaty prošly\n'
