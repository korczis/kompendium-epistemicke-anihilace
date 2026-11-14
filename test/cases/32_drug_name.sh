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
# Owner, ADR 0013 doplněk 2 ("Keep in history"): a historical case names its drug; a link to it
# carries the case's name; the body's own chemistry is not medication. A drug outside such a link
# on the same page is still refused, so the exemption cannot widen into a cover.
mkdir -p content/kompendium/historical-cases
page content/kompendium/historical-cases c32-history <<'P'
Případ ukazuje, jak marketing proměnil vědění o závislosti a přispěl k opioidové epidemii.
P
page "$d" c32-history-link <<'P'
Historicky: [FDA a opioidy](@/kompendium/historical-cases/c32-history.md), selhání regulátoru.
P
page "$d" c32-history-link-plus <<'P'
Historicky: [FDA a opioidy](@/kompendium/historical-cases/c32-history.md); nasazují se opioidy.
P
mkdir -p content/glossary
page content/glossary c32-endogenous <<'P'
Při smíření tělo vyplaví oxytocin a endogenní opioidy, tytéž látky jako při citové vazbě.
P
# Owner, ADR 0013 doplněk 3 ("Keep recognition"): a page listed in data/drug-recognition.toml may
# name a class to recognise; a listed page that names none is stale and charged.
page "$d" c32-recognition <<'P'
Náhlé vysazení antidepresiv může mít nebezpečné následky; rozhodnutí patří lékaři.
P
page "$d" c32-stale <<'P'
Stránka, která už žádnou látku nejmenuje.
P
cat >> data/drug-recognition.toml <<'T'

[[page]]
path = "content/kompendium/techniques/c32-recognition.md"
kind = "emergency"
because = "fixture: recognition of an abrupt-stop danger"

[[page]]
path = "content/kompendium/techniques/c32-stale.md"
kind = "differential"
because = "fixture: a stale entry whose page names no drug"
T
# content/references.md is EXEMPT (generated bibliography) even if it names a drug
printf '+++\ntitle = "Reference"\n+++\n\n- Studie o benzodiazepiny a opioidy v klinické praxi.\n' > content/references.md

listed
has   c32-class     # a drug class in prose
has   c32-inn       # a named INN in prose
hasnt c32-biblio    # a drug only inside ## Literatura (a work's title)
hasnt c32-clean     # no drug named
hasnt references    # references.md is EXEMPT
hasnt c32-history          # a historical case names its subject
hasnt c32-history-link     # a link to a historical case carries the case's name
has   c32-history-link-plus  # a drug outside that link is still refused
hasnt c32-endogenous       # the body's own chemistry is not medication
hasnt c32-recognition      # listed as recognition and names a class: passes
has   c32-stale            # listed but names nothing: the stale entry is charged

# an entry without a reason is a hard error, so the list never grows by accident
printf '\n[[page]]\npath = "content/kompendium/techniques/c32-inn.md"\nkind = "harm"\n' >> data/drug-recognition.toml
if python3 scripts/check-ia.py --list drug-name >/dev/null 2>"$work/err"; then echo "entry without because accepted"; exit 1; fi
grep -- "needs kind and because" "$work/err" >/dev/null || { echo "wrong error for an entry without because"; cat "$work/err"; exit 1; }

echo "drug-name: a drug class or INN in prose on a content page is refused; a bibliography title, references.md and a clean page are not"
