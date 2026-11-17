#!/usr/bin/env bash
# Requirement `platform-prose` of scripts/check-ia.py: the book BODY (kompendium/) must not name an
# internal platform (PLATFORM_NAME) or a named runtime/model (BEAM, Elixir, Erlang, Phoenix, Ollama,
# qwen, deepseek[-coder]) in running prose, case-sensitive and word-bounded. Refused on the page.
# Not charged, by design:
#   * a name inside a markdown link LABEL [ … ](…) — platform-label owns that, not prose;
#   * a name inside inline code `…` or a fenced block — prose only;
#   * a lower-cased or hyphen-joined occurrence (a URL slug like prismatic-promo) — word-bounded.
# The gate is NEVER_BASELINED at 0 (pure prevention), so it is silent on the live book; this case
# teaches the gate its own vocabulary on fixture pages it creates, each with its own distinct prose
# so no two share a paragraph (that would trip duplicate-passage). It does not read the live book.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case56.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
d=content/kompendium/techniques
page() {  # name, body line (each distinct — no shared boilerplate)
  printf '+++\ntitle = "%s"\n+++\n\n%s\n' "$1" "$2" > "$d/$1.md"
}
listed() { python3 scripts/check-ia.py --list platform-prose > "$work/list" 2>/dev/null || true
           cut -f1 "$work/list" > "$work/pages"; }
has()   { grep -q "/$1.md$" "$work/pages" || { echo "$1 not refused"; exit 1; }; }
hasnt() { if grep -q "/$1.md$" "$work/pages"; then echo "$1 wrongly refused"; exit 1; fi; }

page ea-9-9-71-puvod   'Formalizace této techniky proběhla uvnitř prostředí Prismatic, odkud pochází její slovník.'
page ea-9-9-72-beh     'Analytický modul tu běží na Elixir a Phoenix, takže nasazení zůstává horizontálně škálovatelné.'
page ea-9-9-73-odkaz   'Podrobnosti shrnuje [dokumentace Prismatic](https://example.org/doc) mimo rozsah knihy.'
page ea-9-9-74-kod     'Konfigurace se zapisuje do `Decision Engine` manifestu a čte se při startu procesu.'
page ea-9-9-75-cisty   'Technika popisuje postupný rozpad identity bez jakéhokoli odkazu na konkrétní nástroje.'

listed
has   ea-9-9-71-puvod            # internal platform name in prose
has   ea-9-9-72-beh              # named runtimes (Elixir, Phoenix) in prose
hasnt ea-9-9-73-odkaz            # name in a link label — platform-label owns it
hasnt ea-9-9-74-kod              # name in inline code — prose only
hasnt ea-9-9-75-cisty            # no platform name
grep -q 'ea-9-9-71-puvod' "$work/list" || { echo "the listing does not name the page"; exit 1; }
echo ok
