#!/usr/bin/env bash
# The reader sees the book's one word count. On a build of the committed tree:
#
#  - every page's word badge (data-word-count) and its schema.org wordCount equal
#    static/data/words.json for that page, which scripts/build-graph.py derives from ia_model,
#    the same count the gates judge;
#  - no template reads Zola's page.word_count, which counts the path fragments of @/ links as
#    words and does not see text an {% include %} adds (2026-11-16: badges 8.5-17 % above the
#    article on every page; Zola's exact metric was not reproducible, so nothing compares with it).
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case55.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"

if grep -rnE --include='*.html' '\b(page|p|s|section)\.word_count\b' templates; then
  echo "a template reads Zola's word_count; read static/data/words.json instead"; exit 1
fi

mkdir -p static/css && touch static/css/app.css
site="$work/.site"
zola build --output-dir "$site" >"$work/zola.log" 2>&1 || { cat "$work/zola.log"; exit 1; }

python3 - "$site" <<'EOF'
import json, pathlib, re, sys

site = pathlib.Path(sys.argv[1])
words = json.loads(pathlib.Path("static/data/words.json").read_text(encoding="utf-8"))
nodes = json.loads(pathlib.Path("static/data/graph.json").read_text(encoding="utf-8"))["nodes"]
url_of = {n["path"]: n["url"] for n in nodes}
BADGE = re.compile(r'data-word-count[^>]*>(\d+) slov<')
SCHEMA = re.compile(r'"wordCount":(\d+)')

problems, checked = [], 0
for path, n in words.items():
    url = url_of.get(path)
    if url is None or path.endswith("_index.md"):
        continue
    html = site / url.strip("/") / "index.html"
    if not html.exists():
        continue
    text = html.read_text(encoding="utf-8")
    badge = BADGE.findall(text)
    if n and badge != [str(n)]:
        problems.append(f"{path}: badge {badge}, words.json {n}")
    schema = SCHEMA.findall(text)
    if schema and schema != [str(n)]:
        problems.append(f"{path}: schema.org wordCount {schema}, words.json {n}")
    checked += 1

if checked < 1000:
    problems.append(f"only {checked} pages checked; the build or the map is incomplete")
if problems:
    sys.exit("\n".join(problems[:20]))
print(f"case 55: {checked} pages show the one word count (badge and schema.org = words.json)")
EOF
