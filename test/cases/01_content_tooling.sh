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
rm -r content/kompendium/case-01-fixture

# A term added to the index of terms without a page of its own is refused as term-page.
printf '| **Fixturový pojem** | Fixture term [=] | `X` | Jen pro test. |\n' \
  >> content/kompendium/08-prilohy/index-pojmu.md
python3 scripts/check-ia.py --list term-page | grep -x 'term:fixturovy-pojem' >/dev/null
git -C "$root" show "$(git -C "$root" write-tree):content/kompendium/08-prilohy/index-pojmu.md" \
  > content/kompendium/08-prilohy/index-pojmu.md

python3 scripts/build-graph.py >/dev/null
python3 scripts/build-graph.py --check >/dev/null
printf '\nEin [Link](@/kompendium/_index.md).\n' >> content/about.md
if python3 scripts/build-graph.py --check >/dev/null 2>&1; then
  echo "build-graph --check missed a content change"; exit 1
fi
echo "case 01: content tooling behaves"
