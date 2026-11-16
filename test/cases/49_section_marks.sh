#!/usr/bin/env bash
# Every section that scripts/render-graphics.py generated a mark for shows that mark on its own
# index page (templates/partials/header.html), on a build of the committed tree:
#
#  - the generator's manifest maps each section path to its mark, and each of those sections'
#    pages renders exactly that file with data-section-mark;
#  - a page that is not a section index, and the home page, render no mark;
#  - a section the map does not name renders none (a mark is never borrowed from another section).
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case49.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
mkdir -p static/css && touch static/css/app.css
site="$work/.site"
zola build --output-dir "$site" >"$work/zola.log" 2>&1 || { cat "$work/zola.log"; exit 1; }

python3 - "$site" <<'EOF'
import json, pathlib, re, sys

site = pathlib.Path(sys.argv[1])
manifest = json.loads(pathlib.Path("static/img/generated/manifest.json").read_text(encoding="utf-8"))
sections = manifest["sections"]
if not sections:
    sys.exit("the manifest names no section; render-graphics.py wrote no map")

MARK = re.compile(r'<img src="[^"]*/img/generated/([^"/]+)"[^>]*data-section-mark')


def marks(html_path):
    return MARK.findall(html_path.read_text(encoding="utf-8"))


problems = []
for key, files in sorted(sections.items()):
    page = site / key / "index.html"
    if not page.exists():
        problems.append(f"{key}: no built index page")
        continue
    found = marks(page)
    if found != [files["mark"]]:
        problems.append(f"{key}: renders {found}, expected [{files['mark']}]")

# Not a section index, and the home page: no mark.
for rel in ["index.html", "kompendium/techniques/ea-1-2-4-argumentacni-oslabeni/index.html"]:
    if marks(site / rel):
        problems.append(f"{rel}: renders a mark but is not a section in the map")

# Every built page that renders a mark is a section the map names.
for html in site.rglob("index.html"):
    rel = html.parent.relative_to(site).as_posix()
    if marks(html) and rel not in sections:
        problems.append(f"{rel}: renders a mark the map does not give it")

if problems:
    sys.exit("\n".join(problems))
print(f"case 49: {len(sections)} sections show their own generated mark, no other page does")
EOF
