#!/usr/bin/env bash
# Requirement `citation-unresolved` of scripts/check-ia.py, on a copy of the committed tree.
# majordomus-skill: kompendium-page-expansion
#
#  - a cited surname missing from the page's Literatura is refused; adding the entry fixes it;
#  - Czech case endings resolve to the entry: Lifton/Liftona/Liftonovi, Arendtová/Arendt,
#    Havla/Havel, Tverského/Tversky; particles (van der Kolk), Czech capitals (Čapek);
#  - a § number is not a year, so "§ 1724" names no author.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case14.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
d=content/kompendium/case-14-fixture
mkdir -p "$d"
page() { printf '+++\ntitle = "%s"\n+++\n\n' "$1" > "$d/$1.md"; cat >> "$d/$1.md"; }
listed() { python3 scripts/check-ia.py --list "$1" > "$work/list"; }
has() { grep -q "^$d/$1.md" "$work/list" || { echo "$1 not listed"; exit 1; }; }
hasnt() { if grep -q "^$d/$1.md" "$work/list"; then echo "$1 wrongly listed"; grep "$1" "$work/list"; exit 1; fi; }

page seeded <<'PAGE'
Tento odstavec cituje autora, který v literatuře chybí (Neexistující, 1999).

## Literatura

- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism*. Norton.
PAGE
page fixed <<'PAGE'
Tento odstavec cituje autora, který v literatuře je (Neexistující, 1999).

## Literatura

- Neexistující, A. (1999). *Kniha*. Nakladatel.
PAGE
page inflected <<'PAGE'
Podle Liftona (1961) a podle studie přisuzované Liftonovi (1961, s. 5) je reforma myšlení
proces. Arendtová (1951) a Havla (1978) cituje i analýza Tverského (1974). Trauma popsal
van der Kolk (2014), u nás Čapek (1920). Občanský zákoník OZ (§ 1724) zde jen připomínáme.

## Literatura

- Arendt, H. (1951). *The Origins of Totalitarianism*. Schocken.
- Čapek, K. (1920). *R.U.R.* Aventinum.
- Havel, V. (1978). *Moc bezmocných*. Samizdat.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism*. Norton.
- Tversky, A. a Kahneman, D. (1974). Judgment under Uncertainty. *Science*, 185, 1124–1131.
- van der Kolk, B. (2014). *The Body Keeps the Score*. Viking.
PAGE
listed citation-unresolved
has seeded; hasnt fixed; hasnt inflected
grep -q "^$d/seeded.md	Neexistující$" "$work/list"
echo "case 14: cited surnames resolve in the page's Literatura"
