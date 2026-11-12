#!/usr/bin/env bash
# Pre-push gate: refuse pushing a commit whose DERIVED artifacts are stale.
#
# The GitHub Pages "Validate and build" job regenerates nothing — it runs the derived `--check`
# gates and fails if graph.json, the IA data, the UI data, the engine fixtures, the README table
# or the graphics are not current for the pushed content. A push that skips the regeneration
# (scripts/verify-content.sh --fix) therefore turns the live deploy red. This gate runs those same
# pure, fast checks on the PUSHED tree before the push leaves the machine, so a stale commit never
# reaches main. It runs no zola build, no browser suite and no tests — only the derived checks,
# bounded to a few seconds.
#
# Canonical fuller sequence (adds zola build, surfaces, graph-url resolution and test/run.sh) is
# scripts/verify-content.sh; this is deliberately its pre-push-cheap subset. Keep the gate list
# here in step with the "--check" steps there.
#
# Usage: scripts/check-derived-currency.sh [<sha>]   (default HEAD — the commit being pushed)
set -euo pipefail

sha="${1:-HEAD}"
root=$(git rev-parse --show-toplevel)
cd "$root"
resolved=$(git rev-parse --verify "$sha^{commit}" 2>/dev/null) || {
  echo "check-derived-currency: not a commit: $sha" >&2; exit 2; }

work=$(mktemp -d "${TMPDIR:-/tmp}/kea-derived.XXXXXX")
trap 'rm -rf "$work"' EXIT
git archive "$resolved" | tar -x -C "$work"
cd "$work"

start=$(date +%s)
fin() { echo "check-derived-currency: the pushed tree's derived data is current ($(( $(date +%s) - start ))s)"; }
refuse() {
  echo "check-derived-currency: FAIL in $(( $(date +%s) - start ))s — the pushed tree's derived data is stale." >&2
  echo "  run: scripts/verify-content.sh --fix   then commit the regenerated files and push again." >&2
  exit 1
}
# Fail-fast: a stale artifact stops the gate (verify-content --fix regenerates all of them anyway,
# so naming the first is enough). Derived-artifact gates first — those are what go stale when
# content changes without a regen — then the content-format checks.
step() {
  printf '  %-30s ' "$1"; shift
  if out=$("$@" 2>&1); then echo "ok"; else echo "STALE"; printf '%s\n' "$out" | sed 's/^/      /' | tail -8; refuse; fi
}

echo "check-derived-currency: ${resolved:0:12}"
step "build-references --check"     python3 scripts/build-references.py --check
step "build-graph --check"          python3 scripts/build-graph.py --check
step "build-ui-data --check"        python3 scripts/build-ui-data.py --check
step "build-engine-fixtures --check" python3 scripts/build-engine-fixtures.py --check
step "build-readme --check"         python3 scripts/build-readme.py --check
if command -v rsvg-convert >/dev/null 2>&1; then
  step "render-graphics --check"    python3 scripts/render-graphics.py --check
else
  echo "  render-graphics --check        SKIPPED — rsvg-convert absent, GRAPHICS CURRENCY NOT VERIFIED"
  echo "      (install librsvg so this machine can gate graphics; CI still enforces it)"
fi
step "migrate-content --check"      python3 scripts/migrate-content.py --check
step "normalize-front-matter --check" python3 scripts/normalize-front-matter.py --check
step "polish-markdown --check"      python3 scripts/polish-markdown.py --check
step "link-terms --check"           python3 scripts/link-terms.py --bold --check
step "check-ia"                     python3 scripts/check-ia.py
fin
