#!/usr/bin/env bash
# chrome-trailer: no hand-pasted site chrome in content. templates/partials/footer.html renders the
# author, licence, wiki and repository on every page from config.extra; a pasted "## Connect &
# Contribute" section or a "Created by […]" credit line duplicates it and drifts (2026-11-14: five
# variants on 294 pages, some with broken bold, 60 linking the wrong repository). On a copy:
#
#  - a page ending in a "## Connect & Contribute" section is refused;
#  - a page with a "*Created by [...]**" line after a rule is refused;
#  - a page that only mentions the phrase "created by" in prose is not;
#  - the footer partial still renders author and licence from config, so removing the copies
#    loses nothing.
set -euo pipefail
root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case36.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"

grep -- 'config.extra.author' templates/partials/footer.html >/dev/null \
  || { echo "footer partial no longer renders the author"; exit 1; }
grep -- 'config.extra.licence_url' templates/partials/footer.html >/dev/null \
  || { echo "footer partial no longer renders the licence"; exit 1; }

d=content/kompendium/techniques
page() { printf '+++\ntitle = "%s"\n+++\n\nText stránky.\n\n' "$2" > "$1/$2.md"; cat >> "$1/$2.md"; }
page "$d" c36-connect <<'P'
## Connect & Contribute

**Created by [Autor](https://example.com)** | Licence: [GHL](https://example.com/LICENSE)
P
page "$d" c36-credit <<'P'
---

*Created by [Autor](https://example.com)** | [GitHub](https://example.com)
P
page "$d" c36-prose <<'P'
Pojem byl created by komisí jako pracovní název; věta je jen zmínka v próze.
P
python3 scripts/check-ia.py --list chrome-trailer > "$work/list" 2>/dev/null || true
grep -- "/c36-connect.md" "$work/list" >/dev/null || { echo "a Connect & Contribute section passed"; exit 1; }
grep -- "/c36-credit.md" "$work/list" >/dev/null || { echo "a pasted credit line passed"; exit 1; }
if grep -- "/c36-prose.md" "$work/list" >/dev/null; then echo "prose mention wrongly refused"; exit 1; fi
echo "case 36: pasted chrome trailers are refused; the footer partial carries author and licence"
