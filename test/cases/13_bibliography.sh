#!/usr/bin/env bash
# Requirement `bibliography` of scripts/check-ia.py, on a copy of the committed tree.
# majordomus-skill: kompendium-page-expansion
#
#  - a page that cites without `## Literatura`, or with Literatura after Související, is refused;
#  - Literatura before Související passes; a page that cites nothing needs no Literatura.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case13.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
d=content/kompendium/case-13-fixture
mkdir -p "$d"
page() { printf '+++\ntitle = "%s"\n+++\n\n' "$1" > "$d/$1.md"; cat >> "$d/$1.md"; }
listed() { python3 scripts/check-ia.py --list "$1" | cut -f1 > "$work/list"; }
has() { grep -qx "$d/$1.md" "$work/list" || { echo "$1 not listed"; exit 1; }; }
hasnt() { if grep -qx "$d/$1.md" "$work/list"; then echo "$1 wrongly listed"; exit 1; fi; }

lit=$'## Literatura\n\n- Lifton, R. J. (1961). *Thought Reform*. Norton.\n'
rel=$'## Související\n\n- [Úvod](@/kompendium/_index.md)\n'
page missing <<<"Myšlenkovou reformu popsal Lifton (1961)."
page after <<<$'Myšlenkovou reformu popsal Lifton (1961).\n\n'"$rel"$'\n'"$lit"
page fixed <<<$'Myšlenkovou reformu popsal Lifton (1961).\n\n'"$lit"$'\n'"$rel"
page no-citation <<<$'Stránka bez citací.\n\n'"$rel"
listed bibliography
has missing; has after; hasnt fixed; hasnt no-citation
echo "case 13: a citing page carries Literatura before Související"
