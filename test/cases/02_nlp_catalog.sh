#!/usr/bin/env bash
# The NLP catalogue gate (rule project.nlp-catalog) holds on the committed tree and catches each
# defect it exists for, on a copy of the index:
#
#  - scripts/nlp-catalog.py --check passes on the tree and a second write changes nothing;
#  - a citation of a work outside data/nlp/_sources.toml fails (fabrication guard);
#  - a hand edit inside a generated block fails as stale;
#  - an imperative aimed at a target person fails (defensive frame, lexicon HOWTO);
#  - a page without a catalogue entry fails (bijection);
#  - a trainer item without its benign contrast fails.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case02.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "$(git -C "$root" write-tree)" | tar -x -C "$work"
cd "$work"

if [ ! -f data/nlp/_families.toml ]; then echo "no NLP catalogue in this tree; nothing to test"; exit 0; fi

python3 scripts/nlp-catalog.py --check >/dev/null
python3 scripts/nlp-catalog.py >/dev/null
python3 scripts/nlp-catalog.py --check >/dev/null
if python3 scripts/nlp-catalog.py --bogus >/dev/null 2>&1; then echo "accepted --bogus"; exit 1; fi

page=content/kompendium/nlp-vzorce/predpoklady/mapa-neni-uzemi.md
expect_fail() {
  local what=$1
  if python3 scripts/nlp-catalog.py --check >/dev/null 2>&1; then echo "gate passed despite: $what"; exit 1; fi
  git -C "$root" archive "$(git -C "$root" write-tree)" -- "$page" data/nlp | tar -x -C "$work"
  rm -f content/kompendium/nlp-vzorce/predpoklady/seeded.md
  python3 scripts/nlp-catalog.py --check >/dev/null
}

python3 - "$page" <<'PY'
import pathlib, sys
p = pathlib.Path(sys.argv[1])
t = p.read_text(encoding="utf-8")
p.write_text(t.replace("## Struktura vzorce", "Vymyšlené tvrzení (Novák 2001).\n\n## Struktura vzorce", 1),
             encoding="utf-8")
PY
expect_fail "a citation outside _sources.toml"

python3 - "$page" <<'PY'
import pathlib, sys
p = pathlib.Path(sys.argv[1])
t = p.read_text(encoding="utf-8")
p.write_text(t.replace("**Rodina a hierarchie**", "**Rodina**", 1), encoding="utf-8")
PY
expect_fail "a hand edit of the generated block"

python3 - "$page" <<'PY'
import pathlib, sys
p = pathlib.Path(sys.argv[1])
t = p.read_text(encoding="utf-8")
p.write_text(t.replace("## Obrana a zotavení", "Navoďte mu pocit viny.\n\n## Obrana a zotavení", 1),
             encoding="utf-8")
PY
expect_fail "an imperative aimed at a target"

cp "$page" content/kompendium/nlp-vzorce/predpoklady/seeded.md
expect_fail "a page without a catalogue entry"

python3 - <<'PY'
import pathlib, re
p = pathlib.Path("data/nlp/predpoklady.toml")
t = p.read_text(encoding="utf-8")
p.write_text(re.sub(r"benign = true", "benign = false", t, count=1), encoding="utf-8")
PY
expect_fail "a trainer without a benign contrast"

echo "nlp-catalog: gate holds and catches every seeded defect"
