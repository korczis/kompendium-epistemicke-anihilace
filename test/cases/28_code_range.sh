#!/usr/bin/env bash
# Requirement `code-range` of scripts/check-ia.py, on a copy of the committed tree:
#
#  - a hand-written range of EA codes ("EA-5.4.1 — 5.4.30", "EA-4.1.1 až 4.1.10", a linked first
#    code followed by "— 5.4.30") is refused;
#  - a single linked code with "a další", or a wildcard "EA-5.4.*", is not;
#  - a page outside content/ is never judged (the gate reads content only).
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case28.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
d=content/kompendium/techniques

page() { printf '+++\ntitle = "%s"\n+++\n\n' "$2" > "$1/$2.md"; cat >> "$1/$2.md"; }
listed() { python3 scripts/check-ia.py --list code-range > "$work/list" 2>/dev/null || true; }
has() { grep -q "/$1.md" "$work/list" || { echo "$1 not refused"; exit 1; }; }
hasnt() { if grep -q "/$1.md" "$work/list"; then echo "$1 wrongly refused"; exit 1; fi; }

page "$d" case28-dash <<'P'
Subkategorie zahrnuje techniky EA-5.4.1 — 5.4.30, popsané níže.
P
page "$d" case28-az <<'P'
Výcviková sekvence EA-4.1.1 až 4.1.10 je popsaná v kapitole 4.
P
page "$d" case28-linked <<'P'
| Kapitola 9 | [EA-5.4.1](@/kompendium/techniques/_index.md) — 5.4.30 |
P
page "$d" case28-ok <<'P'
Subkategorie začíná technikou [EA-5.4.1](@/kompendium/techniques/_index.md) a další jsou v rejstříku; souhrnně EA-5.4.*.
P

listed
has case28-dash
has case28-az
has case28-linked
hasnt case28-ok
echo "case 28: hand-written EA code ranges are refused, a first code or a wildcard is not"
