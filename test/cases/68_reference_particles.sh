#!/usr/bin/env bash
# build-references.py must collect particle surnames (van der Kolk, de Jongh, von Elm). A biblio
# entry writes the author as "van der Kolk, B. (2014)" — the particle before the capitalised name —
# so an ENTRY regex that required an upper-case first letter dropped every particle author from
# content/references.md (11 authors missing, e.g. van der Kolk, van der Hart, de Young, von Elm).
# This builds a fixture page citing a particle author and a plain author, runs the generator, and
# checks references.md collects both; a lower-case line that is not a citation is not collected.
set -euo pipefail
root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case68.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
cat > content/kompendium/techniques/ea-9-9-91-particle-fixture.md <<'EOF'
+++
title = "Particle fixture"
+++

## Literatura

- van der Kolk, B. (2099). *Fixture Title One*. Fixture Press.
- Novak, J. (2099). *Fixture Title Two*. Fixture Press.
- de facto this line is prose, not a citation, and has no year.
EOF
python3 scripts/build-references.py >/dev/null 2>&1
grep -q "van der Kolk, B. (2099)" content/references.md || { echo "particle surname not collected"; exit 1; }
grep -q "Novak, J. (2099)" content/references.md || { echo "plain surname regressed"; exit 1; }
if grep -q "de facto this line is prose" content/references.md; then
  echo "non-citation lower-case line wrongly collected"; exit 1
fi
echo ok
