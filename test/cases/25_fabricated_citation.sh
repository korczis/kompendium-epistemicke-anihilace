#!/usr/bin/env bash
# Requirement `fabricated-citation` of scripts/check-ia.py (ADR 0012), on a copy of the committed
# tree. A paragraph, list item or table row that pairs an author-year citation with a study
# statistic and stands byte-identical on 3+ content/kompendium pages is a pasted (fabricated or
# misattributed) study, not one a page draws on.
#
#  - an identical citation+stat sentence on 3 pages is refused on all three, in BOTH citation forms:
#    the parenthetical "(Author a kol., rok)" (cited_names) and the narrative "Author, I. I., et al.
#    (rok)" that cited_names misses (AUTHOR_YEAR);
#  - the same on only 2 pages is not (the threshold is the evidence it is pasted, not drawn on);
#  - a study statistic without a citation, and a citation without a study statistic, are not refused;
#  - a page that rewrites its own copy drops out while the rest stay;
#  - the same line inside `## Literatura` is not judged (a bibliography lists studies);
#  - a page outside content/kompendium/ is not judged.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case25.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "$(git -C "$root" write-tree)" | tar -x -C "$work"
cd "$work"
d=content/kompendium/techniques
mkdir -p content/glossary

page() { printf '+++\ntitle = "%s"\n+++\n\n' "$2" > "$1/$2.md"; cat >> "$1/$2.md"; }
listed() { python3 scripts/check-ia.py --list fabricated-citation > "$work/list" 2>/dev/null || true; }
has() { grep -q "/$1.md" "$work/list" || { echo "$1 not refused"; exit 1; }; }
hasnt() { if grep -q "/$1.md" "$work/list"; then echo "$1 wrongly refused"; exit 1; fi; }

claim='**Smith, J. A., et al. (2019)** — RCT, n=150, *Journal of Trauma*. Klíčový nález: d = 0.80 pro PCL-5.'
claim_paren='Meta-analýza (Novák a kol., 2020) dokumentuje srovnatelnou účinnost (g = 0.65) napříč modalitami.'
stat_only='RCT, n=150, d = 0.80 pro PCL-5 — bez jakéhokoli odkazu na pramen v tomto odstavci.'
cite_only='Podle (Novák a kol., 2020) jde o obecně rozšířený a dobře popsaný jev v odborné literatuře.'

# Narrative-initials form, byte-identical on four technique pages.
for n in case25-a case25-b case25-c case25-d; do page "$d" "$n" <<P
$claim
P
done
# Parenthetical form, byte-identical on three technique pages.
for n in case25-p1 case25-p2 case25-p3; do page "$d" "$n" <<P
$claim_paren
P
done
listed
has case25-a; has case25-b; has case25-c; has case25-d
has case25-p1; has case25-p2; has case25-p3

# Two pages are not enough: the rule needs three identical to call it pasted.
rm "$d/case25-p3.md"
listed
hasnt case25-p1; hasnt case25-p2
page "$d" case25-p3 <<P
$claim_paren
P

# A statistic without a citation, and a citation without a statistic, are not fabricated-citation.
for n in case25-s1 case25-s2 case25-s3; do page "$d" "$n" <<P
$stat_only
P
done
for n in case25-c1 case25-c2 case25-c3; do page "$d" "$n" <<P
$cite_only
P
done
listed
hasnt case25-s1; hasnt case25-s2; hasnt case25-s3
hasnt case25-c1; hasnt case25-c2; hasnt case25-c3

# A page that rewrites its own copy drops out; the other three (a,b,c) still carry it.
page "$d" case25-d <<P
Studie Smithe (2019) uvádí střední účinek na symptomy PTSD; konkrétní hodnoty viz uvedený pramen.
P
listed
hasnt case25-d
has case25-a; has case25-b; has case25-c

# The same line inside ## Literatura is a bibliography entry, not a pasted claim.
for n in case25-b1 case25-b2 case25-b3; do page "$d" "$n" <<P
Text bez čísel.

## Literatura

- $claim
P
done
listed
hasnt case25-b1; hasnt case25-b2; hasnt case25-b3

# A page outside content/kompendium/ is not judged by this rule.
for n in case25-g1 case25-g2 case25-g3; do page content/glossary "$n" <<P
$claim
P
done
listed
hasnt case25-g1; hasnt case25-g2; hasnt case25-g3

echo "fabricated-citation: identical citation+stat units on 3+ kompendium pages are refused, both forms; negatives pass"
