#!/usr/bin/env bash
# The four never-baselined gates ADR 0007 part 2 adds to check-ia, each refusing a class a
# name-in-prose sweep cannot see: a relative markdown link (require @/), a platform component name
# in a link LABEL, a platform name in FRONT MATTER, and development-philosophy framing in
# content/philosophy. Seeds one offending page per class on a copy of the tree and asserts each is
# listed; never touches the checkout.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case22.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
d=content/kompendium/case-22-fixture
mkdir -p "$d" content/philosophy

# relative-link: a target that is not @/ / URL / #/mailto/tel/absolute
printf '+++\ntitle = "Case 22 rel"\n+++\n\nViz [sousední](sibling-page/) stránka.\n' > "$d/rel.md"
# platform-label: a platform component name inside a link label
printf '+++\ntitle = "Case 22 label"\n+++\n\n[Vztah ke Decision Engine](@/glossary/_index.md) zde.\n' > "$d/label.md"
# platform-frontmatter: a component name in front matter
printf '+++\ntitle = "Case 22 fm"\ndescription = "O NABLA Infinity na platformě."\n+++\n\nText.\n' > "$d/fm.md"
# philosophy-frame: dev-philosophy framing inside content/philosophy
printf '+++\ntitle = "Case 22 philo"\n+++\n\nTento text popisuje filozofii platformy Prismatic.\n' > content/philosophy/case-22-philo.md

listed() { python3 scripts/check-ia.py --list "$1" 2>/dev/null | grep -- "$2" >/dev/null || { echo "$1 did not refuse $2"; exit 1; }; }
listed relative-link        "$d/rel.md"
listed platform-label       "$d/label.md"
listed platform-frontmatter "$d/fm.md"
listed philosophy-frame     content/philosophy/case-22-philo.md

echo "ok: relative-link, platform-label, platform-frontmatter, philosophy-frame all refuse"
