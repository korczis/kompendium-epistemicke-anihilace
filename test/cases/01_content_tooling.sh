#!/usr/bin/env bash
# The content tooling a wave relies on behaves as documented, on a copy of the committed tree.
# majordomus-skill: kompendium-page-expansion
#
#  - polish-markdown.py and normalize-front-matter.py are idempotent (second run: no change);
#  - normalize-front-matter.py refuses derived [extra] keys (word_count, reading_time,
#    quality_score, ref_count_at_creation, parent) under --check and removes them under --fix,
#    refuses a wrong controlled value, lists (without failing) a key outside its schema, and
#    --doc --check refuses a stale schema table in the rule;
#  - check-ia.py passes on the tree with its baseline and fails on a seeded violation;
#  - build-graph.py --check passes on a regenerated tree and fails after a content change.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case01.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "$(git -C "$root" write-tree)" | tar -x -C "$work"  # the index: what is about to be committed
cd "$work"

# An unknown option is refused and changes nothing; --help only prints.
before=$(find content -name '*.md' -exec cat {} + | shasum)
for tool in polish-markdown normalize-front-matter; do
  python3 scripts/$tool.py --help >/dev/null
  if python3 scripts/$tool.py --bogus >/dev/null 2>&1; then echo "$tool accepted --bogus"; exit 1; fi
done
[ "$before" = "$(find content -name '*.md' -exec cat {} + | shasum)" ] || { echo "a refused option changed content"; exit 1; }

python3 scripts/polish-markdown.py >/dev/null
python3 scripts/polish-markdown.py --check

python3 scripts/normalize-front-matter.py >/dev/null
python3 scripts/normalize-front-matter.py --check >/dev/null

# Derived or unread [extra] keys are refused by --check and removed by --fix; nothing else moves,
# an [extra] they leave empty goes, and a second run is a no-op.
mkdir -p content/kompendium/case-01-fm
cat > content/kompendium/case-01-fm/derived.md <<'PAGE'
+++
title = "Odvozená metadata"
description = "Fixtura: klíče, které jen opakují odvozená data nebo které nic nečte."

[taxonomies]
tags = ["kompendium"]

[extra]
category = "metodologie"
word_count = 1234
reading_time = 6
quality_score = 75
ref_count_at_creation = 3
+++

Text.
PAGE
cat > content/kompendium/case-01-fm/parent.md <<'PAGE'
+++
title = "Rodič"
description = "Fixtura: extra.parent nečte žádná šablona, hierarchii dává strom adresářů."

[taxonomies]
tags = ["kompendium"]

[extra]
parent = "kompendium/_index.md"
+++

Text.
PAGE
for f in derived parent; do
  if python3 scripts/normalize-front-matter.py --check content/kompendium/case-01-fm/$f.md >/dev/null; then
    echo "normalize-front-matter --check accepted derived keys in $f.md"; exit 1; fi
done
python3 scripts/normalize-front-matter.py --fix content/kompendium/case-01-fm >/dev/null
if grep -E '^(word_count|reading_time|quality_score|ref_count_at_creation|parent) *=' \
    content/kompendium/case-01-fm/*.md; then echo "a derived key survived --fix"; exit 1; fi
grep -x 'category = "metodologie"' content/kompendium/case-01-fm/derived.md >/dev/null
if grep -qx '\[extra\]' content/kompendium/case-01-fm/parent.md; then echo "empty [extra] left behind"; exit 1; fi
cp content/kompendium/case-01-fm/derived.md "$work/derived.once"
python3 scripts/normalize-front-matter.py --check content/kompendium/case-01-fm >/dev/null
python3 scripts/normalize-front-matter.py content/kompendium/case-01-fm >/dev/null
cmp -s content/kompendium/case-01-fm/derived.md "$work/derived.once"

# The schema (data/front-matter.toml): a wrong controlled value is refused in
# either mode; a key with no schema row is listed, not refused; the rule's table is generated.
sed 's/^category = "metodologie"$/category = "metodologie"\nrisk_level = "obrovské"/' \
  content/kompendium/case-01-fm/derived.md > content/kompendium/case-01-fm/value.md
if python3 scripts/normalize-front-matter.py --check content/kompendium/case-01-fm/value.md >/dev/null; then
  echo "normalize-front-matter --check accepted risk_level = obrovské"; exit 1; fi
if python3 scripts/normalize-front-matter.py --fix content/kompendium/case-01-fm/value.md >/dev/null; then
  echo "normalize-front-matter --fix passed over a wrong controlled value"; exit 1; fi
sed 's/risk_level = "obrovské"/risk_level = "high"/' content/kompendium/case-01-fm/value.md \
  > "$work/value.md" && mv "$work/value.md" content/kompendium/case-01-fm/value.md
python3 scripts/normalize-front-matter.py --check content/kompendium/case-01-fm/value.md >/dev/null
sed 's/^category = "metodologie"$/category = "metodologie"\nfixture_key = 1/' \
  content/kompendium/case-01-fm/derived.md > content/kompendium/case-01-fm/unknown.md
python3 scripts/normalize-front-matter.py --check content/kompendium/case-01-fm/unknown.md >/dev/null
python3 scripts/normalize-front-matter.py --list unknown-keys content/kompendium/case-01-fm > "$work/unknown"
grep -qx "content/kompendium/case-01-fm/unknown.md	extra.fixture_key	page" "$work/unknown"
[ "$(wc -l < "$work/unknown")" -eq 1 ] || { echo "unexpected unknown keys"; cat "$work/unknown"; exit 1; }
# Data driven: a row added to data/front-matter.toml makes the key known.
cp data/front-matter.toml "$work/schema.orig"
sed -i.bak 's/^keys = \[$/keys = [\n  { where = "extra", key = "fixture_key", type = "int", classes = "page" },/' \
  data/front-matter.toml && rm -f data/front-matter.toml.bak
python3 scripts/normalize-front-matter.py --list unknown-keys content/kompendium/case-01-fm > "$work/unknown"
[ ! -s "$work/unknown" ] || { echo "a schema row did not make the key known"; cat "$work/unknown"; exit 1; }
cp "$work/schema.orig" data/front-matter.toml
rm -r content/kompendium/case-01-fm
python3 scripts/normalize-front-matter.py --doc --check >/dev/null
rule=.ai/repo/rules/project/information-architecture.v1.md
cp "$rule" "$work/rule.orig"
sed -i.bak 's/^| top | `title` | všechny |.*$/| top | `title` | ručně upraveno |/' "$rule" && rm -f "$rule.bak"
if python3 scripts/normalize-front-matter.py --doc --check >/dev/null; then
  echo "--doc --check accepted a hand-edited schema table"; exit 1; fi
python3 scripts/normalize-front-matter.py --doc --fix >/dev/null
cmp -s "$rule" "$work/rule.orig" || { echo "--doc --fix did not restore the table"; exit 1; }

if [ -f scripts/ia-baseline.json ]; then
  python3 scripts/check-ia.py >/dev/null   # the committed tree meets its own baseline
fi

# Seed a page that breaks the architecture: no description, no tags, no links, English.
mkdir -p content/kompendium/case-01-fixture
cat > content/kompendium/case-01-fixture/seeded.md <<'PAGE'
+++
title = "Seeded"
+++

This page is written in English and it has none of the things the architecture requires.
It exists only so that the gate has something to refuse, and the case removes it after.
PAGE
if python3 scripts/check-ia.py >"$work/ia.out" 2>&1; then
  echo "check-ia passed a seeded violation"; cat "$work/ia.out"; exit 1
fi
python3 scripts/check-ia.py --list description | grep -x 'content/kompendium/case-01-fixture/seeded.md' >/dev/null
python3 scripts/check-ia.py --list tags | grep -x 'content/kompendium/case-01-fixture/seeded.md' >/dev/null
python3 scripts/check-ia.py --list detail | grep -x 'content/kompendium/case-01-fixture/seeded.md' >/dev/null
printf '\n<!-- ENHANCED:NLLB-AUTO-BLOCK BEGIN -->\nx\n<!-- ENHANCED:NLLB-AUTO-BLOCK END -->\n' \
  >> content/kompendium/case-01-fixture/seeded.md
python3 scripts/check-ia.py --list generated | grep -x 'content/kompendium/case-01-fixture/seeded.md' >/dev/null
# A thin page that another page links carries weak-link (the debt is on the target, never on the
# linking page, so a link is never removed to pass the gate); --debt ranks it by inbound links.
# A glossary entry without Definice carries summary.
printf '+++\ntitle = "Odkazující"\n+++\n\nViz [seeded](@/kompendium/case-01-fixture/seeded.md).\n' \
  > content/kompendium/case-01-fixture/linking.md
python3 scripts/check-ia.py --list weak-link | grep -x 'content/kompendium/case-01-fixture/seeded.md' >/dev/null
if python3 scripts/check-ia.py --list weak-link \
    | grep -x 'content/kompendium/case-01-fixture/linking.md' >/dev/null; then
  echo "weak-link must not be charged to the linking page"; exit 1
fi
python3 scripts/check-ia.py --debt | grep -x '1	content/kompendium/case-01-fixture/seeded.md' >/dev/null
printf '+++\ntitle = "Fixturové heslo"\n+++\n\nBez oddílu definice.\n' > content/glossary/case-01-fixture.md
python3 scripts/check-ia.py --list summary | grep -x 'content/glossary/case-01-fixture.md' >/dev/null
rm content/glossary/case-01-fixture.md
# The detail threshold comes from zola.toml [extra] (single source): raising it there flags a long page.
cp zola.toml "$work/zola.toml.orig"
sed -i.bak 's/^ia_detail_words = .*/ia_detail_words = 1000000/' zola.toml && rm -f zola.toml.bak
python3 scripts/check-ia.py --list detail | grep -x 'content/kompendium/02-uvod/definice.md' >/dev/null
cp "$work/zola.toml.orig" zola.toml

# Content that writes the site's base path is refused (hardcoded-path).
printf '\n<script src="/kompendium-epistemicke-anihilace/js/kompendium/x.js"></script>\n' \
  >> content/kompendium/case-01-fixture/linking.md
python3 scripts/check-ia.py --list hardcoded-path | grep -x 'content/kompendium/case-01-fixture/linking.md' >/dev/null
# The normalizer infers the missing tags from where the page is, and a second run is a no-op.
python3 scripts/normalize-front-matter.py content/kompendium/case-01-fixture >/dev/null
grep -x 'tags = \["kompendium", "case-01-fixture"\]' content/kompendium/case-01-fixture/seeded.md >/dev/null
python3 scripts/normalize-front-matter.py --check content/kompendium/case-01-fixture >/dev/null
rm -r content/kompendium/case-01-fixture

# A term added to the index of terms without a page of its own is refused as term-page.
printf '| **Fixturový pojem** | Fixture term [=] | `X` | Jen pro test. |\n' \
  >> content/kompendium/08-prilohy/index-pojmu.md
python3 scripts/check-ia.py --list term-page | grep -x 'term:fixturovy-pojem' >/dev/null
git -C "$root" show "$(git -C "$root" write-tree):content/kompendium/08-prilohy/index-pojmu.md" \
  > content/kompendium/08-prilohy/index-pojmu.md

# The autolinker links the first mention of a term that has a page, and only once.
mkdir -p content/kompendium/case-01-links
cat > content/kompendium/case-01-links/page.md <<'PAGE'
+++
title = "Odkazy"
+++

Gaslighting je vzorec. Gaslighting se opakuje. Viz také EA-1.6.1 a zase EA-1.6.1.

Odkaz přes konec řádku: [Doktrína o
gaslighting vlivu](@/kompendium/forensic-legal/gaslighting-test.md) zůstane nedotčen.
PAGE
python3 scripts/link-terms.py content/kompendium/case-01-links >/dev/null
grep -c '](@/glossary/gaslighting.md)' content/kompendium/case-01-links/page.md | grep -x 1 >/dev/null
grep -x 'gaslighting vlivu](@/kompendium/forensic-legal/gaslighting-test.md) zůstane nedotčen.' \
  content/kompendium/case-01-links/page.md >/dev/null   # a wrapped link is never relinked
grep -c '](@/kompendium/techniques/ea-1-6-1-' content/kompendium/case-01-links/page.md | grep -x 1 >/dev/null
python3 scripts/link-terms.py --check content/kompendium/case-01-links >/dev/null
# A bibliography names works, not terms: a title there is never linked, prose after it is.
cat > content/kompendium/case-01-links/lit.md <<'PAGE'
+++
title = "Literatura"
+++

Text bez pojmu.

## Literatura

- Sweet, P. L. (2019). The sociology of gaslighting. *American Sociological Review*.

## Další oddíl

Gaslighting v próze.
PAGE
python3 scripts/link-terms.py content/kompendium/case-01-links >/dev/null
grep -x -- '- Sweet, P. L. (2019). The sociology of gaslighting. \*American Sociological Review\*.' \
  content/kompendium/case-01-links/lit.md >/dev/null
grep -x '\[Gaslighting\](@/glossary/gaslighting.md) v próze.' content/kompendium/case-01-links/lit.md >/dev/null
rm -r content/kompendium/case-01-links

# derive-links: a quick-reference card and its technique link each other in a generated block,
# and a second run changes nothing.
python3 scripts/derive-links.py content/kompendium/quick-reference content/kompendium/techniques >/dev/null
card=$(ls content/kompendium/quick-reference/qr-ea-*.md | head -1)
grep -F 'kompendium:odvozene-vazby:begin' "$card" >/dev/null
python3 scripts/derive-links.py --check content/kompendium/quick-reference content/kompendium/techniques >/dev/null

# merge-duplicate: the full page gains the stub's address as an alias, links follow, stub goes.
mkdir -p content/kompendium/case-01-dup
printf '+++\ntitle = "Stub"\n+++\n\nKrátký stub.\n' > content/kompendium/case-01-dup/x.md
printf '+++\ntitle = "Plná"\nweight = 1\n\n[extra]\nk = 1\n+++\n\nPlná stránka.\n' > content/kompendium/case-01-dup/x-plna.md
printf '+++\ntitle = "Odkaz"\n+++\n\nViz [stub](@/kompendium/case-01-dup/x.md#a).\n' > content/kompendium/case-01-dup/ref.md
python3 scripts/merge-duplicate.py kompendium/case-01-dup/x.md kompendium/case-01-dup/x-plna.md >/dev/null
[ ! -e content/kompendium/case-01-dup/x.md ]
grep -x 'aliases = \["/kompendium/case-01-dup/x/"\]' content/kompendium/case-01-dup/x-plna.md >/dev/null
grep -F '](@/kompendium/case-01-dup/x-plna.md#a)' content/kompendium/case-01-dup/ref.md >/dev/null
rm -r content/kompendium/case-01-dup

# strip-generated-blocks: the hand-copied footer goes in both languages, the derived block and
# the text before it stay, and --check then passes.
mkdir -p content/kompendium/case-01-strip
for h in 'Connect & Contribute' 'Kontakt a příspěvky'; do
  f="content/kompendium/case-01-strip/$(echo "$h" | tr -cd 'A-Za-z').md"
  printf '+++\ntitle = "S"\n+++\n\nText zůstane.\n\n---\n\n## %s\n\n- [GitHub](https://x)\n' "$h" > "$f"
  printf '\n## Související\n\n- [Hub](@/kompendium/_index.md)\n' >> "$f"
  printf '\n<!-- kompendium:odvozene-vazby:begin -->\nB\n<!-- kompendium:odvozene-vazby:end -->\n' >> "$f"
done
python3 scripts/strip-generated-blocks.py content/kompendium/case-01-strip >/dev/null
python3 scripts/strip-generated-blocks.py --check content/kompendium/case-01-strip >/dev/null
for f in content/kompendium/case-01-strip/*.md; do
  grep -x 'Text zůstane.' "$f" >/dev/null && grep -x 'B' "$f" >/dev/null
  grep -x '## Související' "$f" >/dev/null  # a section after the footer survives
  if grep -E '^## (Connect|Kontakt)' "$f" >/dev/null; then echo "footer kept in $f"; exit 1; fi
done
rm -r content/kompendium/case-01-strip
# An empty path list is refused instead of meaning the whole book; --all is explicit.
if python3 scripts/strip-generated-blocks.py >/dev/null 2>&1; then
  echo "strip-generated-blocks ran without paths"; exit 1
fi
python3 scripts/strip-generated-blocks.py --check >/dev/null || true

python3 scripts/build-graph.py >/dev/null
python3 scripts/build-graph.py --check >/dev/null
printf '\nEin [Link](@/kompendium/_index.md).\n' >> content/about.md
if python3 scripts/build-graph.py --check >/dev/null 2>&1; then
  echo "build-graph --check missed a content change"; exit 1
fi
# howto: a page with an "Operační modus" section (a playbook) is refused and never baselined;
# technique-name: a coded heading must name what the catalogue page with that code names.
mkdir -p content/kompendium/case-01-howto
printf '+++\ntitle = "Hra"\n+++\n\n## Operační modus\n\n### Krok 1\nUdělej to.\n' \
  > content/kompendium/case-01-howto/x.md
python3 scripts/check-ia.py --list howto | cut -f1 | grep -x 'content/kompendium/case-01-howto/x.md' >/dev/null
if python3 scripts/check-ia.py --introduce howto >/dev/null 2>&1; then
  echo "--introduce howto accepted"; exit 1; fi
rm -r content/kompendium/case-01-howto
# drug-dose: a dose in prose is refused; the same number in a bibliography title is not.
mkdir -p content/kompendium/case-01-dose
printf '+++\ntitle = "D"\n+++\n\nLékař zváží SSRI v dávce 20 mg denně.\n' > content/kompendium/case-01-dose/x.md
python3 scripts/check-ia.py --list drug-dose | cut -f1 | grep -x 'content/kompendium/case-01-dose/x.md' >/dev/null
printf '+++\ntitle = "D"\n+++\n\nText bez dávky.\n\n## Literatura\n\n- Frachon, I. (2010). *Mediator 150 mg*. Dialogues.\n' > content/kompendium/case-01-dose/x.md
if python3 scripts/check-ia.py --list drug-dose | cut -f1 | grep -qx 'content/kompendium/case-01-dose/x.md'; then
  echo "drug-dose flagged a bibliography title"; exit 1; fi
if python3 scripts/check-ia.py --introduce drug-dose >/dev/null 2>&1; then
  echo "--introduce drug-dose accepted"; exit 1; fi
rm -r content/kompendium/case-01-dose

# technique-name: a heading under a real code with the wrong name is listed; the right name is not.
first=$(ls content/kompendium/techniques/ea-1-1-1-*.md | head -1)
code_title=$(grep -m1 '^title' "$first" | sed -E 's/^title = "EA-[0-9.]+ (.*)"/\1/')
mkdir -p content/kompendium/case-01-tn
printf '+++\ntitle = "N"\n+++\n\n#### EA-1.1.1 Úplně jiný název\nText.\n' > content/kompendium/case-01-tn/x.md
python3 scripts/check-ia.py --list technique-name | cut -f1 | grep -x 'content/kompendium/case-01-tn/x.md' >/dev/null
printf '+++\ntitle = "N"\n+++\n\n#### EA-1.1.1 %s\nText.\n' "$code_title" > content/kompendium/case-01-tn/x.md
if python3 scripts/check-ia.py --list technique-name | cut -f1 | grep -qx 'content/kompendium/case-01-tn/x.md'; then
  echo "technique-name flagged the catalogue name"; exit 1; fi
rm -r content/kompendium/case-01-tn

echo "case 01: content tooling behaves"
