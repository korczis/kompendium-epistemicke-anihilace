#!/usr/bin/env bash
# The catalogue engine refuses excluded platform material by rule (data/platform-exclusions.toml,
# ADR 0005), on a copy of the index:
#
#  - scripts/catalogs.py --check passes on the tree (no false positive);
#  - an excluded platform path in a catalogue's data fails;
#  - a refused marker (platform machine text, appendix A) in a catalogue page fails;
#  - an e-mail address in the bibliography fails (owner-personal class);
#  - a missing exclusions file fails: the engine never runs without its refusal list;
#  - a rule without `because` fails.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case03.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "$(git -C "$root" write-tree)" | tar -x -C "$work"
cd "$work"

if [ ! -f data/catalogs.toml ]; then echo "no catalogue declaration in this tree; nothing to test"; exit 0; fi

python3 scripts/catalogs.py --check >/dev/null

restore() {
  git -C "$root" archive "$(git -C "$root" write-tree)" -- data content | tar -x -C "$work"
  python3 scripts/catalogs.py --check >/dev/null
}
expect_fail() {
  local what=$1 want=$2 out
  if out=$(python3 scripts/catalogs.py --check 2>&1); then echo "gate passed despite: $what"; exit 1; fi
  if ! grep -q -- "$want" <<<"$out"; then echo "failed without naming '$want' for: $what"; echo "$out" | tail -5; exit 1; fi
  restore
}

data=$(find data -path 'data/fauly/*.toml' -o -path 'data/nlp/*.toml' | sort | head -1)
page=$(find content/kompendium -path '*nlp-vzorce/*' -name '*.md' ! -name '_index.md' | sort | head -1)
[ -n "$data" ] && [ -n "$page" ] || { echo "no catalogue data or page to seed"; exit 1; }

printf '\n# provenance: apps/prismatic_web/priv/dd_cases/x.json\n' >> "$data"
expect_fail "a due-diligence path in catalogue data" "due-diligence-evidence"

printf '\n<!-- ENHANCED:NLLB-AUTO-BLOCK BEGIN -->\n' >> "$page"
expect_fail "an NLLB block in a catalogue page" "refused marker"

printf '\nPříloha A s implementačními fázemi.\n' >> "$page"
expect_fail "appendix A text in a catalogue page" "refused marker"

printf '\n# kontakt: someone@example.org\n' >> data/sources.toml
expect_fail "an e-mail address in the bibliography" "owner-personal"

rm data/platform-exclusions.toml
expect_fail "a missing exclusions file" "missing"

python3 - <<'PY'
import pathlib
p = pathlib.Path("data/platform-exclusions.toml")
t = p.read_text(encoding="utf-8")
p.write_text(t.replace('because = "a summary of a third-party book (copyright)"\n', "", 1), encoding="utf-8")
PY
expect_fail "a rule without because" "needs \`because\`"

echo "platform exclusions: every refusal holds"
