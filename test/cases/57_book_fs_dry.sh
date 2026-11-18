#!/usr/bin/env bash
# The book's filesystem/slug/front-matter primitives live in ONE place, scripts/book_fs.py (the
# leaf module every generator and checker imports). dev-31's DRY audit (2026-11-17) found them
# copied across the scripts: front_matter x9, TOML_FM x5, the slug x6 (zola_slug == slugify in one
# file). The owner's order is no duplication — extend the one generic mechanism. This gate refuses
# a second definition: no scripts/*.py other than book_fs.py may `def front_matter|slug|slugify|
# zola_slug` or assign `TOML_FM =`. A script that needs one imports it from book_fs. Modelled on
# case 34 (a static scan of scripts/, not of the book), so it is silent until a duplicate reappears.
set -euo pipefail
root=$(cd "$(dirname "$0")/../.." && pwd)
python3 - "$root" <<'PY'
import pathlib, re, sys
root = pathlib.Path(sys.argv[1])
HOME = "book_fs.py"                       # the one module allowed to define these
DEF = re.compile(r"^def (front_matter|slug|slugify|zola_slug)\b", re.M)
TOML = re.compile(r"^TOML_FM\s*=(?!=)", re.M)
bad = []
for p in sorted((root / "scripts").glob("*.py")):
    if p.name == HOME:
        continue
    text = p.read_text(encoding="utf-8")
    for m in DEF.finditer(text):
        bad.append(f"{p.name}: def {m.group(1)}  (import it from book_fs instead)")
    if TOML.search(text):
        bad.append(f"{p.name}: TOML_FM =  (import it from book_fs instead)")
if bad:
    sys.exit("primitive redefined outside scripts/book_fs.py:\n  " + "\n  ".join(bad))
print("ok: book_fs.py is the single source of the shared primitives")
PY
