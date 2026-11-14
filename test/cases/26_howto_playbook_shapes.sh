#!/usr/bin/env bash
# The howto gate's 04 playbook shapes (ADR 0010 amendment), on a copy of the committed tree:
#
#  - the applier checklist "před aplikací … protokol … ověř:" is refused;
#  - the "### Úroveň E1…4" escalation ladder, the "### Vrstva N" build-order sequence and a
#    "… criteria" heading are each refused;
#  - the "### Fáze N" heading is NOT refused (03 scenario analysis is legitimate recognition text);
#  - the "## Kritický krok" heading alone is NOT refused — it is a book-wide key-takeaway / reader
#    recognition heading; only the applier content under it is a playbook;
#  - the same applier content on a page outside content/kompendium/ is not judged.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case26.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
d=content/kompendium/04-terminalni-protokoly
mkdir -p "$d" content/glossary

page() { printf '+++\ntitle = "%s"\n+++\n\n' "$2" > "$1/$2.md"; cat >> "$1/$2.md"; }
listed() { python3 scripts/check-ia.py --list howto > "$work/list" 2>/dev/null || true; }
has() { grep -q "/$1.md" "$work/list" || { echo "$1 not refused"; exit 1; }; }
hasnt() { if grep -q "/$1.md" "$work/list"; then echo "$1 wrongly refused"; exit 1; fi; }

page "$d" case26-applier <<'P'
## Kritický krok

**Tato sekce není použitelná bez supervize.** Před aplikací jakéhokoli
terminálního protokolu ověř: 1. etický kodex, 2. supervizní rámec, 3. screening.
P
page "$d" case26-applier-shape <<'P'
## Kritický krok

Před aplikací:

1. Konzultuj s licencovaným psychoterapeutem
2. Potvrď, že indikátory odpovídají profilu klienta
P
page "$d" case26-applier-prose <<'P'
Pozorovatel si všimne, že před aplikací nátlaku se mění slovník skupiny.

1. Prvním znakem je změna slovníku.
P
page "$d" case26-uroven <<'P'
### Úroveň E1: zvýšená pozornost

Monitorovací stupeň eskalace.
P
page "$d" case26-vrstva <<'P'
### Vrstva 1: psychiatrická anamnéza

První vrstva sekvence.
P
page "$d" case26-criteria <<'P'
### Exit criteria

Kdy ukončit.
P
# Dropped shapes / legitimate recognition text — must NOT be refused.
page "$d" case26-faze <<'P'
### Fáze 1: Strategické mapování

Popis fáze, jak jev probíhá — rozpoznání, ne návod.
P
page content/kompendium/03-zakladni-kategorie case26-kriticky <<'P'
## Kritický krok

Vyber si jednu techniku, kterou jsi pozoroval, a projdi sekci Detekční markery.
P
# Outside content/kompendium/ — not judged by the kompendium-scoped shapes.
page content/glossary case26-outside <<'P'
Před aplikací jakéhokoli terminálního protokolu ověř: 1. kodex, 2. rámec.
P

listed
has case26-applier
has case26-applier-shape   # a "Před aplikací:" lead with a numbered list, whatever the verbs
hasnt case26-applier-prose  # the words in prose, no list under them
has case26-uroven
has case26-vrstva
has case26-criteria
hasnt case26-faze
hasnt case26-kriticky
hasnt case26-outside

echo "howto playbook shapes: applier content + Úroveň/Vrstva/criteria refused; Fáze N and bare Kritický krok heading not"
