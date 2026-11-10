#!/usr/bin/env bash
# Requirement `technique-page` of scripts/check-ia.py, on a copy of the committed tree.
# majordomus-skill: kompendium-page-expansion
#
#  - a page naming an EA code that has no technique page is refused; a code with a page passes;
#    a code inside a fenced code sample or a path is not a mention;
#  - the requirement is never baselined: --introduce and --extend refuse it, and one more page
#    than PENDING_ZERO allows fails the gate.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case15.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "$(git -C "$root" write-tree)" | tar -x -C "$work"
cd "$work"
d=content/kompendium/case-15-fixture
mkdir -p "$d"
page() { printf '+++\ntitle = "%s"\n+++\n\n' "$1" > "$d/$1.md"; cat >> "$d/$1.md"; }
listed() { python3 scripts/check-ia.py --list "$1" > "$work/list"; }

page seeded <<<"Technika EA-9.9.99 nemá vlastní stránku."
page fixed <<<"Technika EA-1.1.1 vlastní stránku má."
page code <<<$'```\nEA-9.9.98 v ukázce kódu\n```\n\nCesta x/EA-9.9.97 není zmínka.'
listed technique-page
grep -qx "$d/seeded.md	EA-9.9.99" "$work/list"
if grep -q "$d/\(fixed\|code\).md" "$work/list"; then echo "wrongly listed"; exit 1; fi

for flag in --introduce --extend; do
  if python3 scripts/check-ia.py $flag technique-page >/dev/null; then
    echo "$flag technique-page accepted"; exit 1; fi
done
if python3 scripts/check-ia.py >"$work/gate.out" 2>&1; then
  echo "the gate passed a new technique without a page"; cat "$work/gate.out"; exit 1; fi
grep -q "technique-page grew to" "$work/gate.out"
echo "case 15: every EA code named has its own technique page"
