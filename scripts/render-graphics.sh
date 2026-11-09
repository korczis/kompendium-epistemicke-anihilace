#!/usr/bin/env bash
# Renders the SVG graphics, then rasterises the social card and the README banner to PNG.
set -euo pipefail
cd "$(dirname "$0")/.."
python3 scripts/render-graphics.py
command -v rsvg-convert >/dev/null || { echo "render-graphics: rsvg-convert is required (brew install librsvg)" >&2; exit 1; }
rsvg-convert -w 1200 -h 630 static/img/og.svg -o static/img/og.png
rsvg-convert -w 1600 -h 400 static/img/banner.svg -o static/img/banner.png
rsvg-convert -w 600 -h 800 static/img/cover.svg -o static/img/cover.png
echo "wrote static/img/{og,banner,cover}.png"
