#!/usr/bin/env bash
# scripts/extract-shared-passages.py (ADR 0016), on a copy of the committed tree with fixture pages:
#
#  - a paragraph pasted on 3 pages, split across lines and carrying emphasis and an @/ link, moves
#    into one partial, and each page includes it where the paragraph stood;
#  - a second paragraph directly below it on the same 3 pages joins the same partial;
#  - a paragraph whose first words equal the first one's, on 3 other pages, gets its own name;
#  - every changed page expands (ia_model.expand_includes) back to its old text byte for byte;
#  - a paragraph that differs per page only by the page's own EA code, on pages that declare that
#    code in extra.ea_code, moves into ONE parameterised partial that carries
#    {{ page.extra.ea_code }} (bold markers kept literal); each page expands back byte for byte once
#    its own ea_code is substituted;
#  - the same shape on pages WITHOUT extra.ea_code is refused and reported as remaining, never
#    templated (the byte-exact proof could not be honoured);
#  - duplicate-passage no longer charges the moved pages (a, b and c) and still charges the d ones;
#  - a second run changes nothing and --check passes.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case71.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"

d=content/kompendium/c71
mkdir -p "$d"
printf '+++\ntitle = "C71"\ndescription = "Fixture section for case 71, the shared passages, long enough for the description floor."\nsort_by = "weight"\n+++\n\nRejstřík fixtur.\n' > "$d/_index.md"
# page <dir> <slug> <extra-toml-line>: front matter (title, description, an optional extra line
# such as a [extra]/ea_code pair), then the body from stdin.
page() {
  { printf '+++\ntitle = "%s"\ndescription = "Fixture 71 for the shared passages, %s, long enough for the description floor."\n' "$2" "$2"
    [ -n "${3:-}" ] && printf '%s\n' "$3"
    printf '+++\n\n'; } > "$1/$2.md"
  cat >> "$1/$2.md"
}
for n in 1 2 3; do
  page "$d" "c71-a$n" "" <<EOF
## Úvod fixtury $n

Vlastní úvodní odstavec stránky číslo $n, který se nikde jinde neopakuje a drží stránku pohromadě.

Rámec případu sedmdesát jedna platí pro **celou rodinu fixtur** a ne pro jednu stránku;
podrobnosti popisuje [rejstřík](@/kompendium/c71/_index.md), na nějž se čtenář může
kdykoli vrátit, protože text zůstává na každé stránce beze změny.

Druhý odstavec rámce případu sedmdesát jedna stojí hned pod prvním na všech třech stránkách,
a proto patří do téže sdílené šablony jako odstavec nad ním.

Závěr stránky $n je opět vlastní a nesdílený.
EOF
  page "$d" "c71-b$n" "" <<EOF
Vlastní odstavec stránky b$n, odlišný od všech ostatních fixtur tohoto případu.

Rámec případu sedmdesát jedna platí také pro druhou skupinu stránek, ale jiným textem, který
začíná stejnými slovy, a proto potřebuje vlastní jméno šablony.
EOF
  # c pages DECLARE their own EA code; the paragraph differs only by it, so it parameterises.
  page "$d" "c71-c$n" "[extra]
ea_code = \"EA-9.9.$n\"" <<EOF
Vlastní odstavec stránky c$n, odlišný od všech ostatních fixtur tohoto případu.

Klinický kontext **EA-9.9.$n** připouští v této fixtuře popis, který se liší jen kódem techniky
a jinak zní na všech třech stránkách stejně, takže se vejde do jedné parametrizované šablony.
EOF
  # d pages carry the same EA-code-differing shape but NO extra.ea_code, so it must be refused.
  page "$d" "c71-d$n" "" <<EOF
Vlastní odstavec stránky d$n, odlišný od všech ostatních fixtur tohoto případu.

Klinický rozbor **EA-9.9.$n** v této fixtuře nemá v hlavičce ea_code, takže se parametrizovat
nedá a zůstává, kde je, na všech třech stránkách jinak shodný text.
EOF
done
mkdir -p "$work/before"
cp "$d"/*.md "$work/before/"

python3 scripts/extract-shared-passages.py > "$work/run1"
python3 - "$work" <<'PY'
import pathlib, re, sys
work = pathlib.Path(sys.argv[1])
sys.path.insert(0, "scripts")
import ia_model as m
d = pathlib.Path("content/kompendium/c71")
inc = re.compile(r'\{% include "partials/([^"]+)" %\}')
fm_code = re.compile(r'ea_code\s*=\s*"([^"]+)"')
names = {}
for f in sorted(d.glob("c71-*.md")):
    old = (work / "before" / f.name).read_text(encoding="utf-8")
    new = f.read_text(encoding="utf-8")
    mo = fm_code.search(new)
    code = mo.group(1) if mo else ""
    if m.expand_includes(new, extra={"ea_code": code}) != old:
        sys.exit(f"{f.name}: expansion (ea_code={code!r}) does not reproduce the old page")
    names[f.stem] = inc.findall(new)
for n in "123":
    a, b, c, dd = (names[f"c71-a{n}"], names[f"c71-b{n}"],
                   names[f"c71-c{n}"], names[f"c71-d{n}"])
    if len(a) != 1:
        sys.exit(f"c71-a{n}: expected one include for the two adjacent paragraphs, got {a}")
    if len(b) != 1 or b == a:
        sys.exit(f"c71-b{n}: expected one include of its own, got {b} (a: {a})")
    if len(c) != 1:
        sys.exit(f"c71-c{n}: the EA-code paragraph should parameterise into one include, got {c}")
    if dd:
        sys.exit(f"c71-d{n}: the EA-code paragraph without ea_code must stay, got {dd}")
    new = (d / f"c71-a{n}.md").read_text(encoding="utf-8")
    if "Vlastní úvodní odstavec stránky číslo" not in new or "Závěr stránky" not in new:
        sys.exit(f"c71-a{n}: the page's own paragraphs moved")
if len({tuple(names[f"c71-a{n}"]) for n in "123"}) != 1:
    sys.exit("the a pages include different partials")
if len({tuple(names[f"c71-c{n}"]) for n in "123"}) != 1:
    sys.exit("the c pages include different partials (should be one parameterised template)")
part = pathlib.Path("templates/partials") / names["c71-a1"][0]
text = part.read_text(encoding="utf-8")
if not text.startswith("{#-") or not text.endswith("\n{#- -#}\n"):
    sys.exit(f"{part}: header comment or closing mark missing")
if "**celou rodinu fixtur**" not in text or "Druhý odstavec rámce" not in text:
    sys.exit(f"{part}: does not hold both paragraphs as written")
cpart = pathlib.Path("templates/partials") / names["c71-c1"][0]
ctext = cpart.read_text(encoding="utf-8")
if "**{{ page.extra.ea_code }}**" not in ctext:
    sys.exit(f"{cpart}: the own EA code is not the parameterised variable with bold kept literal")
if "EA-9.9." in ctext:
    sys.exit(f"{cpart}: a literal per-page EA code leaked into the shared template")
PY
grep -q "remains .*EA code.*Klinický rozbor EA-§ v této fixtuře" "$work/run1" \
  || { echo "the EA-code paragraph without ea_code is not reported as remaining"; cat "$work/run1"; exit 1; }

# the gate: moved pages (a, b, c) are no longer charged, the d pages still are
python3 scripts/check-ia.py --list duplicate-passage > "$work/list" 2>/dev/null || true
for p in c71-a1 c71-a2 c71-a3 c71-b1 c71-b2 c71-b3 c71-c1 c71-c2 c71-c3; do
  if grep -q "/$p.md" "$work/list"; then echo "$p still charged by duplicate-passage"; exit 1; fi
done
for p in c71-d1 c71-d2 c71-d3; do
  grep -q "/$p.md" "$work/list" || { echo "$p not charged by duplicate-passage"; exit 1; }
done

# idempotent: a second run writes nothing, and --check finds nothing to move
snap() { find content templates -type f -print0 | sort -z | xargs -0 shasum | shasum; }
s1=$(snap)
python3 scripts/extract-shared-passages.py > /dev/null
[ "$(snap)" = "$s1" ] || { echo "a second run changed files"; exit 1; }
python3 scripts/extract-shared-passages.py --check > /dev/null \
  || { echo "--check reports a pending move after a run"; exit 1; }

echo "shared passages: pasted paragraphs move into one partial each (adjacent ones together), the per-page EA-code paragraph parameterises into one {{ page.extra.ea_code }} template when the page declares ea_code and is refused without it, every page expands back to its old text, and a second run is a no-op"
