#!/usr/bin/env python3
"""Map every glossary entry's `extra.category` onto the controlled vocabulary.

The glossary page derives its facets from the categories (scripts/build-graph.py writes
static/data/glossary.json), so a free-form value is a broken facet. The vocabulary and the map
of old values are in scripts/ia_model.py (GLOSSARY_CATEGORIES, CATEGORY_MAP); check-ia.py fails
on a value outside the vocabulary. Only the `category = "…"` line changes.

Usage:
  scripts/normalize-categories.py           rewrite content/glossary/ in place
  scripts/normalize-categories.py --check   exit 1 when a page would change or is unmapped
"""
import json
import pathlib
import re
import sys

sys.dont_write_bytecode = True  # no __pycache__ in the checkout
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
from ia_model import CATEGORY_MAP, CONTENT, GLOSSARY_CATEGORIES  # noqa: E402

LINE = re.compile(r'^(category\s*=\s*)"([^"]*)"\s*$', re.M)


def main() -> int:
    check = "--check" in sys.argv[1:]
    changed, unmapped = [], []
    for path in sorted((CONTENT / "glossary").glob("*.md")):
        if path.name == "_index.md":
            continue
        text = path.read_text(encoding="utf-8")
        m = LINE.search(text)
        current = m.group(2) if m else ""
        target = current if current in GLOSSARY_CATEGORIES else CATEGORY_MAP.get(current)
        if not target:
            unmapped.append(f"{path.relative_to(CONTENT.parent)}: '{current}'")
            continue
        if target == current:
            continue
        changed.append(path.relative_to(CONTENT.parent).as_posix())
        if not check:
            text = LINE.sub(lambda x: x.group(1) + json.dumps(target, ensure_ascii=False), text, 1)
            path.write_text(text, encoding="utf-8")
    for line in unmapped:
        print(f"normalize-categories: unmapped {line}")
    if check:
        if changed:
            print(f"normalize-categories: {len(changed)} page(s) would change")
        return 1 if changed or unmapped else 0
    print(f"normalize-categories: rewrote {len(changed)} page(s)")
    return 1 if unmapped else 0


if __name__ == "__main__":
    sys.exit(main())
