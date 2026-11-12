#!/usr/bin/env bash
# Requirement `placeholder` of scripts/check-ia.py, on a copy of the committed tree.
# majordomus-skill: kompendium-page-expansion
#
#  - a seeded page with a reconstruction note is refused, its finished form passes;
#  - ordinary Czech ("součástí probíhajícího …") and a marker quoted in code are not placeholders;
#  - the requirement is never baselined: --introduce refuses it, a hand-written baseline entry
#    does not excuse it, and one more page than PENDING_ZERO allows fails the gate.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case10.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
d=content/kompendium/case-10-fixture
mkdir -p "$d"
page() { printf '+++\ntitle = "%s"\n+++\n\n' "$1" > "$d/$1.md"; cat >> "$d/$1.md"; }
listed() { python3 scripts/check-ia.py --list "$1" | cut -f1 > "$work/list"; }
has() { grep -qx "$d/$1.md" "$work/list" || { echo "$1 not listed"; exit 1; }; }
hasnt() { if grep -qx "$d/$1.md" "$work/list"; then echo "$1 wrongly listed"; exit 1; fi; }

page seeded <<'PAGE'
Obsah této stránky je v rekonstrukci a bude doplněn později.
PAGE
page fixed <<'PAGE'
Stránka pojednává o tématu v plném rozsahu a nic neodkládá.
PAGE
page prose <<'PAGE'
Lékař zjišťuje, zda stav není součástí probíhajícího vztahu donucující kontroly.

```text
obsah je v rekonstrukci   (citace značky v ukázce kódu)
```
PAGE
listed placeholder
has seeded; hasnt fixed; hasnt prose

if python3 scripts/check-ia.py --introduce placeholder >/dev/null; then
  echo "--introduce placeholder accepted"; exit 1; fi
python3 - <<'PY'
import json, pathlib
p = pathlib.Path("scripts/ia-baseline.json"); b = json.loads(p.read_text())
b["content/kompendium/case-10-fixture/seeded.md"] = ["placeholder"]
p.write_text(json.dumps(b))
PY
if python3 scripts/check-ia.py >"$work/gate.out" 2>&1; then
  echo "a hand-written baseline excused a placeholder"; cat "$work/gate.out"; exit 1; fi
grep -q "placeholder grew to" "$work/gate.out"
echo "case 10: placeholder is refused and never baselined"
