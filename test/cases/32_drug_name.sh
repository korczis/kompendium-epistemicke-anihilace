#!/usr/bin/env bash
# Requirement `drug-name` of scripts/check-ia.py (ADR 0013/0014), on a copy of the committed tree.
# The book names no drugs: a drug class or INN in prose on any content page is refused; a drug named
# only inside a `## Literatura` section (a cited work's title) is not; content/references.md (the
# generated bibliography, EXEMPT) is not; a page with no drug is not. Asserts on its own fixtures,
# not on a live count, so it holds whatever the book currently measures.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case32.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
d=content/kompendium/techniques
mkdir -p "$d"
page() { printf '+++\ntitle = "%s"\n+++\n\n' "$2" > "$1/$2.md"; cat >> "$1/$2.md"; }
listed() { python3 scripts/check-ia.py --list drug-name > "$work/list" 2>/dev/null || true; }
has()   { grep -q "/$1.md" "$work/list" || { echo "$1 not refused"; exit 1; }; }
hasnt() { if grep -q "/$1.md" "$work/list"; then echo "$1 wrongly refused"; exit 1; fi; }

page "$d" c32-class <<'P'
Supervidovaná stabilizace může zahrnovat antipsychotika v akutní fázi dekompenzace.
P
page "$d" c32-inn <<'P'
V klinické praxi se nasazuje sertralin jako první volba u této indikace.
P
page "$d" c32-biblio <<'P'
Stabilizace probíhá bez jmenování konkrétních látek.

## Literatura

- Smith, J. (2019). *Olanzapine and relapse prevention*. Journal of X.
P
page "$d" c32-clean <<'P'
Supervidovaná stabilizace popsaná obecně, bez jmenování jakékoli látky či skupiny.
P
# content/references.md is EXEMPT (generated bibliography) even if it names a drug
printf '+++\ntitle = "Reference"\n+++\n\n- Studie o benzodiazepiny a opioidy v klinické praxi.\n' > content/references.md

listed
has   c32-class     # a drug class in prose
has   c32-inn       # a named INN in prose
hasnt c32-biblio    # a drug only inside ## Literatura (a work's title)
hasnt c32-clean     # no drug named
hasnt references    # references.md is EXEMPT

echo "drug-name: a drug class or INN in prose on a content page is refused; a bibliography title, references.md and a clean page are not"
