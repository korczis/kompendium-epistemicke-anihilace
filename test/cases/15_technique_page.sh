#!/usr/bin/env bash
# Requirement `technique-page` of scripts/check-ia.py, on a copy of the committed tree.
# majordomus-skill: kompendium-page-expansion
#
#  - a page naming an EA code that has no technique page is refused; a code with a page passes;
#    a code inside a fenced code sample or a path is not a mention;
#  - the requirement is never baselined: --introduce and --extend refuse it, and more pages than
#    PENDING_ZERO allows fails the gate.
#
# How many fixtures that last assertion needs is derived from the gate itself, never assumed. The
# case used to seed exactly one and relied on the live book sitting at the cap; a content wave that
# removed a technique page took the book to 4 of at most 5, one seeded fixture no longer exceeded
# anything, and the case died with no output. A gate's test owns its own precondition.
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

# What the committed book already owes and what the gate still allows, read from the gate.
python3 scripts/check-ia.py > "$work/before.out" 2>&1 || true
line=$(grep -m1 'technique-page is never baselined' "$work/before.out" || true)
[ -n "$line" ] || { echo "the gate no longer reports the technique-page ratchet"; cat "$work/before.out"; exit 1; }
live=$(printf '%s' "$line" | sed -n 's/.*must reach 0: \([0-9]*\) page(s).*/\1/p')
cap=$(printf '%s' "$line" | sed -n 's/.*(at most \([0-9]*\)).*/\1/p')
[ -n "$live" ] && [ -n "$cap" ] || { echo "cannot read live count and cap from: $line"; exit 1; }
need=$((cap - live + 1))
[ "$need" -ge 1 ] || { echo "the cap ($cap) is already below the live count ($live)"; exit 1; }

page fixed <<<"Technika EA-1.1.1 vlastní stránku má."
page code <<<$'```\nEA-9.9.98 v ukázce kódu\n```\n\nCesta x/EA-9.9.97 není zmínka.'
# One page per missing code, as many as it takes to pass the cap.
for i in $(seq 1 "$need"); do
  page "seeded$i" <<<"Technika EA-9.9.$((90 + i)) nemá vlastní stránku."
done
listed technique-page
grep -qx "$d/seeded1.md	EA-9.9.91" "$work/list" \
  || { echo "a page naming a code with no technique page was not listed"; exit 1; }
if grep -q "$d/\(fixed\|code\).md" "$work/list"; then echo "wrongly listed"; exit 1; fi

for flag in --introduce --extend; do
  if python3 scripts/check-ia.py $flag technique-page >/dev/null; then
    echo "$flag technique-page accepted"; exit 1; fi
done
if python3 scripts/check-ia.py >"$work/gate.out" 2>&1; then
  echo "the gate passed a new technique without a page"; cat "$work/gate.out"; exit 1; fi
grep -q "technique-page grew to" "$work/gate.out" \
  || { echo "the gate failed, but not because technique-page grew past $cap"; tail -5 "$work/gate.out"; exit 1; }
echo "case 15: every EA code named has its own technique page"
