#!/usr/bin/env bash
# No module-level constant is assigned twice in a gate script. A second `NAME = re.compile(...)`
# silently replaces the first for every function that reads it: on 2026-11-12 a precompiled
# MD_LINK (link text) shadowed the relative-link gate's MD_LINK (link target) and every page of
# the book failed relative-link, while each gate's own --list stayed byte-identical.
set -euo pipefail
root=$(cd "$(dirname "$0")/../.." && pwd)
python3 - "$root" <<'PY'
import pathlib, re, sys
root = pathlib.Path(sys.argv[1])
bad = []
for p in sorted((root / "scripts").glob("*.py")):
    names = re.findall(r"^([A-Z_][A-Z0-9_]*)\s*=(?!=)", p.read_text(), re.M)
    bad += [f"{p.name}: {n}" for n in sorted({n for n in names if names.count(n) > 1})]
if bad:
    sys.exit("module constant assigned twice: " + ", ".join(bad))
PY
