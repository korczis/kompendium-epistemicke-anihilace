#!/usr/bin/env bash
# The catalogue loop of ADR 0015 passes through the content tooling untouched. A chapter's
# catalogue table is a Tera loop over static/data/listings/techniques.json, so its source holds
# `{{ t.slug }}` inside a link target and a table row. That must not register as:
#   * a rewrite by link-terms (it skips {{ }} and {% %} spans) or polish-markdown (it skips Tera
#     expressions and table rows);
#   * a hand-written catalogue row (catalogue-row), a bullet, an uncited paragraph or a duplicate
#     passage for scripts/check-ia.py;
#   * a missing chapter-to-technique edge: ia_model adds a loop's links from the catalogue's own
#     front matter, so the graph has an edge from the page to every technique of the family.
# The fixture is a page of its own, looping over family 1.2, written in the form polish-markdown
# leaves (a blank line before the heading); the case does not depend on the live book's chapters.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case43.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
f=content/kompendium/03-zakladni-kategorie/c43-loop.md
cat > "$f" <<'EOF'
+++
title = "c43 loop"
+++

{% set cat = load_data(path="static/data/listings/techniques.json") %}

## Rodina 1.2

| EA | Technika | Shrnutí |
|----|----------|---------|
{% for t in cat.groups["1.2"] %}| **[{{ t.code }}](@/kompendium/techniques/{{ t.slug }}.md)** | {{ t.name }} | {{ t.summary }} |
{% endfor %}
EOF
before=$(shasum "$f")
python3 scripts/link-terms.py --bold >/dev/null 2>&1 || true
python3 scripts/polish-markdown.py >/dev/null 2>&1 || true
[ "$(shasum "$f")" = "$before" ] || { echo "the loop page was rewritten"; diff <(git -C "$work" show HEAD:"$f" 2>/dev/null || true) "$f" | sed -n 1,10p; exit 1; }
for rule in catalogue-row bullets citations duplicate-passage; do
  if python3 scripts/check-ia.py --list "$rule" 2>/dev/null | grep '/c43-loop.md' >/dev/null; then
    echo "loop charged by $rule"; exit 1
  fi
done
python3 - <<'PY'
import json, sys
sys.path.insert(0, "scripts")
import ia_model
pages = {p["path"]: p for p in ia_model.load_pages()}
fam = json.load(open("static/data/listings/techniques.json"))["groups"]["1.2"]
want = {f"kompendium/techniques/{e['slug']}.md" for e in fam}
got = set(pages["kompendium/03-zakladni-kategorie/c43-loop.md"]["links"])
missing = want - got
if missing:
    print("loop edges missing:", sorted(missing)); sys.exit(1)
if pages["kompendium/03-zakladni-kategorie/c43-loop.md"]["broken_links"]:
    print("loop registered broken links"); sys.exit(1)
PY
echo ok
