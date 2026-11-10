#!/usr/bin/env bash
# The content tooling a wave relies on behaves as documented, on a copy of the committed tree.
# majordomus-skill: kompendium-page-expansion
#
#  - polish-markdown.py and normalize-front-matter.py are idempotent (second run: no change);
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

python3 scripts/build-graph.py >/dev/null
python3 scripts/build-graph.py --check >/dev/null
printf '\nEin [Link](@/kompendium/_index.md).\n' >> content/about.md
if python3 scripts/build-graph.py --check >/dev/null 2>&1; then
  echo "build-graph --check missed a content change"; exit 1
fi
echo "case 01: content tooling behaves"
