#!/usr/bin/env bash
# Requirement `duplicate-passage` of scripts/check-ia.py (ADR 0013), on a copy of the committed tree:
#
#  - a prose paragraph (15+ words) byte-identical on 3 content/kompendium pages is refused on all 3;
#  - the same on only 2 pages is not (3 is the evidence it is pasted boilerplate);
#  - the same paragraph wrapped differently still groups after whitespace normalisation;
#  - excluded: a figure-bearing paragraph (template-figure's domain), the "Created by …" chrome
#    footer, and a cross-reference list line — each identical on 3 pages is NOT refused.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case30.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "$(git -C "$root" write-tree)" | tar -x -C "$work"
cd "$work"
d=content/kompendium/techniques
page() { printf '+++\ntitle = "%s"\n+++\n\n' "$2" > "$1/$2.md"; cat >> "$1/$2.md"; }
listed() { python3 scripts/check-ia.py --list duplicate-passage > "$work/list" 2>/dev/null || true; }
has()   { grep -q "/$1.md" "$work/list" || { echo "$1 not refused"; exit 1; }; }
hasnt() { if grep -q "/$1.md" "$work/list"; then echo "$1 wrongly refused"; exit 1; fi; }

PROSE="Tento odstavec je obecná klinická vsuvka o více než patnácti slovech, která je vložena beze změny na mnoho stránek a předstírá, že je obsahem konkrétní techniky."
PROSE2="Jiná obecná vsuvka o více než patnácti slovech, která stojí jen na dvou stránkách, a proto nedosahuje prahu tří stránek pro boilerplate."
FIG="Tato věta o více než patnácti slovech obsahuje číselný údaj, konkrétně účinnost 42 % a dávku 150 mg, takže patří do template-figure."
CHROME="**Created by [Tomáš Korcak (korczis)](https://github.com/korczis/kompendium)** — všechny stránky knihy sdílejí tuto patičku beze změny."
XREF="- [EA-5.1.3 Reflexivní paradoxie](@/kompendium/techniques/ea-5-1-3-reflexivni-paradoxie.md) — křížový odkaz sdílený mnoha stránkami v knize."

for n in c30-a c30-b c30-c; do page "$d" "$n" <<<"$PROSE"; done
page "$d" c30-two1 <<<"$PROSE2"
page "$d" c30-two2 <<<"$PROSE2"
for n in c30-fig1 c30-fig2 c30-fig3; do page "$d" "$n" <<<"$FIG"; done
for n in c30-chr1 c30-chr2 c30-chr3; do page "$d" "$n" <<<"$CHROME"; done
for n in c30-xr1 c30-xr2 c30-xr3; do page "$d" "$n" <<<"$XREF"; done
# whitespace variant: same words, different wrapping/spacing, on 3 pages
for n in c30-ws1 c30-ws2 c30-ws3; do
  printf '+++\ntitle = "%s"\n+++\n\nTento odstavec je obecná   klinická vsuvka o více\nnež patnácti slovech, která se objevuje\nna třech stránkách se zalomením jinak, ale po normalizaci mezer je totožná a je tedy boilerplate.\n' "$n" > "$d/$n.md"
done

listed
has c30-a; has c30-b; has c30-c            # prose boilerplate on 3 pages
hasnt c30-two1; hasnt c30-two2             # only 2 pages — below the threshold
hasnt c30-fig1; hasnt c30-fig2             # figure-bearing — template-figure's domain
hasnt c30-chr1; hasnt c30-chr2             # chrome footer — excluded
hasnt c30-xr1; hasnt c30-xr2               # cross-reference list line — excluded
has c30-ws1; has c30-ws2; has c30-ws3      # whitespace-normalised duplicates still caught

echo "duplicate-passage: pasted prose on 3+ pages refused (whitespace-normalised); figure/chrome/xref excluded; 2 pages pass"
