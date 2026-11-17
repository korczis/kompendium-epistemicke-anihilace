#!/usr/bin/env bash
# No link in content/ leads into an external location measured dead. Measured 2026-11-17 with
# curl: 30 technique pages linked the platform-era copy of chapter 1
# (prismatic-reality-com.github.io/prismatic-promo/kompendium/01-zakladni-techniky/, 404) and two
# linked a promotional site at korczis.github.io/prismatic-promo (404). Refused:
#   * korczis.github.io/prismatic-promo, any path: never served;
#   * any page below prismatic-reality-com.github.io/prismatic-promo/kompendium/: the copy of this
#     book from the platform era; its pages are gone or moved, and every one has its page here,
#     so the link is `@/…` (the copy's root stays allowed as the provenance link of the book).
# The weekly .github/workflows/external-links.yml finds the next dead URL; a dead location found
# there that keeps coming back belongs in DEAD below, with its measurement.
# The case first proves each pattern on fixture lines (catches the dead URL, passes a live
# neighbour), then refuses any occurrence in the snapshot tree's content/.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
tree=${KEA_TEST_TREE:-$(git -C "$root" write-tree)}

DEAD=(
  'korczis\.github\.io/prismatic-promo'
  'prismatic-reality-com\.github\.io/prismatic-promo/kompendium/[^][()<>"[:space:]]'
)
re=$(IFS='|'; echo "${DEAD[*]}")

catches() { printf '%s\n' "$1" | grep -qE "$re" || { echo "pattern misses: $1"; exit 1; }; }
passes()  { if printf '%s\n' "$1" | grep -qE "$re"; then echo "pattern wrongly refuses: $1"; exit 1; fi; }

catches '- [EA-1.6](https://prismatic-reality-com.github.io/prismatic-promo/kompendium/01-zakladni-techniky/#subkategorie-1-6)'
catches '- [Propagační web](https://korczis.github.io/prismatic-promo) | [Kompendium](@/kompendium/_index.md)'
catches '<https://korczis.github.io/prismatic-promo/about/>'
passes  '- Web z doby platformy: [kompendium](https://prismatic-reality-com.github.io/prismatic-promo/kompendium/).'
passes  '- [EA-1.6 Charizmatické vedení](@/kompendium/03-zakladni-kategorie/kapitola-1.md)'
passes  '- [Kniha](https://korczis.github.io/kompendium-epistemicke-anihilace/)'

hits=$(git -C "$root" grep -nE "$re" "$tree" -- content/ || true)
if [ -n "$hits" ]; then
  echo "links into locations measured dead (replace with the page here, or remove the link):"
  printf '%s\n' "$hits" | sed "s|^$tree:||"
  exit 1
fi
echo ok
