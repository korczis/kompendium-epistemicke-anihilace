#!/usr/bin/env bash
# The catalogue engine's gate (rule project.content-catalogs) holds on the committed tree and
# catches each defect it exists for, on a copy of the index:
#
#  - scripts/catalogs.py --check passes on the tree and a second write changes nothing;
#  - a citation of a work outside data/nlp/_sources.toml fails (fabrication guard);
#  - a hand edit inside a generated block fails as stale;
#  - an imperative aimed at a target person fails (defensive frame, lexicon HOWTO);
#  - a page without a catalogue entry fails (bijection);
#  - a page of its own for a canonical entry fails (no duplicates);
#  - a trainer item without its benign contrast fails.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case02.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "$(git -C "$root" write-tree)" | tar -x -C "$work"
cd "$work"

if [ ! -f data/catalogs.toml ]; then echo "no catalogue declaration in this tree; nothing to test"; exit 0; fi

python3 scripts/catalogs.py --check >/dev/null
python3 scripts/catalogs.py >/dev/null
python3 scripts/catalogs.py --check >/dev/null
if python3 scripts/catalogs.py --bogus >/dev/null 2>&1; then echo "accepted --bogus"; exit 1; fi

page=content/kompendium/nlp-vzorce/predpoklady/mapa-neni-uzemi.md
expect_fail() {
  local what=$1
  if python3 scripts/catalogs.py --check >/dev/null 2>&1; then echo "gate passed despite: $what"; exit 1; fi
  git -C "$root" archive "$(git -C "$root" write-tree)" -- "$page" data | tar -x -C "$work"
  rm -f content/kompendium/nlp-vzorce/zakladni-pojmy/disociace.md
  rm -f content/kompendium/nlp-vzorce/predpoklady/seeded.md
}
# expect_fail restores the page and data the first --check above proved clean and removes the
# seeded files, so the tree is not re-checked after each defect (~15 s per --check in CI).

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

# The NLP entry "disociace" is canonical at glossary/disociace.md: a page of its own is a duplicate.
cp "$page" content/kompendium/nlp-vzorce/zakladni-pojmy/disociace.md
expect_fail "a page of its own for a canonical entry"

python3 - <<'PY'
import pathlib, re
p = pathlib.Path("data/nlp/predpoklady.toml")
t = p.read_text(encoding="utf-8")
p.write_text(re.sub(r"benign = true", "benign = false", t, count=1), encoding="utf-8")
PY
expect_fail "a trainer without a benign contrast"

# A book page the entry links (`kompendium`) that no longer exists (a page removed on main) is
# reported by name, not a crash of the engine (2026-11-11: glossary/addiction-recovery.md).
python3 - <<'PY'
import pathlib, re
p = pathlib.Path("data/nlp/predpoklady.toml")
t = p.read_text(encoding="utf-8")
p.write_text(re.sub(r"kompendium = \[", 'kompendium = [\n  "glossary/odstranena-stranka.md",', t, count=1),
             encoding="utf-8")
PY
if out=$(python3 scripts/catalogs.py --check 2>&1); then echo "gate passed despite a removed book page"; exit 1; fi
if ! grep -q "glossary/odstranena-stranka.md' does not exist" <<<"$out"; then
  echo "a removed book page was not reported by name:"; echo "$out" | tail -3; exit 1
fi

# Coverage of the standard references: a name with neither an entry nor a reason is refused,
# and so is a reason too short to say why (data/<dir>/_coverage.toml).
git -C "$root" archive "$(git -C "$root" write-tree)" -- data | tar -x -C "$work"
printf '\n[[term]]\nname = "Vymyšlený klam bez hesla"\nsources = ["hamblin-1970"]\n' >> data/fauly/_coverage.toml
if out=$(python3 scripts/catalogs.py --check 2>&1); then echo "gate passed despite an unmapped name"; exit 1; fi
grep -q "Vymyšlený klam bez hesla: needs exactly one of" <<<"$out" || { echo "unmapped name not reported"; echo "$out" | tail -3; exit 1; }
git -C "$root" archive "$(git -C "$root" write-tree)" -- data | tar -x -C "$work"
printf '\n[[term]]\nname = "Krátký důvod"\nsources = ["hamblin-1970"]\nexcluded = "nehodí se"\n' >> data/nlp/_coverage.toml
if out=$(python3 scripts/catalogs.py --check 2>&1); then echo "gate passed despite a reason too short"; exit 1; fi
grep -q "at least 40 characters" <<<"$out" || { echo "short reason not reported"; echo "$out" | tail -3; exit 1; }

echo "catalogs: gate holds and catches every seeded defect"
