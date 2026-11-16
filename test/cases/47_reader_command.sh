#!/usr/bin/env bash
# Requirement `reader-command` of scripts/check-ia.py: a technique page describes, it does not
# prescribe self-care to the reader. Refused: a line that opens with a help-seeking imperative
# (Vyhledej, Konzultuj, Kontaktuj, Zavolej, Požádej, Obrať se, Svěř se, Promluv, Oslov, Navštiv)
# and names a person / clinical / help target (osoba, odborník, terapeut, lékař, psycholog,
# blízcí, přátelé, rodina, pomoc, linka, poradna…). The protective substance stays; only the mood
# changes — "Ochranným faktorem bývá dlouhodobý kontakt s blízkými osobami…".
# Not charged, by design (narrow, high-precision core; the wider class is a content worklist, not a
# gate — Czech imperative morphology is unbounded without a lemmatiser):
#   * a reading exercise (Identifikuj, Formuluj, Analyzuj…): the second person is deliberate;
#   * an analytic imperative whose object is a claim, not a person (Konfrontuj tvrzení…);
#   * a descriptive sentence with no imperative.
# The fixtures are pages of their own, so the case does not depend on the live book.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case47.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
d=content/kompendium/techniques
page() {  # name, first body line
  printf '+++\ntitle = "%s"\n+++\n\n%s\n' "$1" "$2" > "$d/$1.md"
}
listed() { python3 scripts/check-ia.py --list reader-command > "$work/list" 2>/dev/null || true
           cut -f1 "$work/list" > "$work/pages"; }
has()   { grep -q "/$1.md$" "$work/pages" || { echo "$1 not refused"; exit 1; }; }
hasnt() { if grep -q "/$1.md$" "$work/pages"; then echo "$1 wrongly refused"; exit 1; fi; }

page ea-9-9-81-hledani  'Vyhledej dlouhodobé blízké osoby, které tě znají z doby před manipulací.'
page ea-9-9-82-kontakt  '- Konzultuj svůj stav s odborníkem, pokud potíže přetrvávají.'
page ea-9-9-83-cteni    '1. Identifikuj konkrétní tvrzení, se kterým nesouhlasíš.'
page ea-9-9-84-analyza  'Konfrontuj klíčová tvrzení s osobami z odlišných tradic.'
page ea-9-9-85-popis    'Ochranným faktorem bývá dlouhodobý kontakt s blízkými osobami.'

listed
has   ea-9-9-81-hledani            # help-seeking imperative + person object
has   ea-9-9-82-kontakt            # same, as a bullet, Konzultuj + odborník
hasnt ea-9-9-83-cteni              # a reading exercise: Identifikuj stays
hasnt ea-9-9-84-analyza            # Konfrontuj is analytic, object is a claim, not a help target
hasnt ea-9-9-85-popis              # descriptive, no imperative
grep -q 'ea-9-9-81-hledani' "$work/list" || { echo "the listing does not name the page"; exit 1; }
echo ok
