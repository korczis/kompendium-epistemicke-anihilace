#!/usr/bin/env bash
# scripts/lint-bare-surname.py, the advisory worklist of bare-surname attributions, on a copy of the
# committed tree with a fixture author in content/references.md and three fixture pages:
#
#  - "Surname <verb>" and "podle Surname" with the author cited nowhere on the page are hits;
#  - the same attribution on a page that cites the author with a year elsewhere is not;
#  - the lint is advisory: it exits 0 with hits, and --count prints only the totals.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case62.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"

printf '\n- Fixturovsky, A. (2001). Kniha pro test.\n' >> content/references.md
d=content/kompendium/techniques
page() { printf '+++\ntitle = "%s"\n+++\n\n' "$(basename "$1" .md)" > "$1"; cat >> "$1"; }
page "$d/c62-bare.md" <<<"Fixturovsky tvrdí, že rozpoznání vzorce předchází obraně."
page "$d/c62-podle.md" <<<"Vzorec se podle Fixturovsky rozpozná dřív, než působí."
page "$d/c62-cited.md" <<'MD'
Fixturovsky (2001) popsal vzorec poprvé.

Fixturovsky tvrdí, že rozpoznání vzorce předchází obraně.
MD

python3 scripts/lint-bare-surname.py > "$work/out" 2> "$work/err"
tab=$(printf '\t')
grep -qF "content/kompendium/techniques/c62-bare.md${tab}Fixturovsky${tab}" "$work/out" || { echo "bare attribution not listed"; exit 1; }
grep -qF "content/kompendium/techniques/c62-podle.md${tab}Fixturovsky${tab}" "$work/out" || { echo "'podle X' not listed"; exit 1; }
if grep -q 'c62-cited' "$work/out"; then echo "page citing the author with a year wrongly listed"; exit 1; fi
grep -q 'bare-surname worklist:' "$work/err" || { echo "no summary"; exit 1; }
python3 scripts/lint-bare-surname.py --count > "$work/count" 2>/dev/null
[ ! -s "$work/count" ] || { echo "--count printed hits"; exit 1; }

echo "lint-bare-surname: bare and 'podle' attributions listed, a page citing the author is not, advisory exit 0"
