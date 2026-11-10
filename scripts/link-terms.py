#!/usr/bin/env python3
"""Link the first mention of every glossary term on every page to the term's entry.

Rule project.content-linked-and-built: a concept with its own page is a link where it is
first mentioned. The glossary entries are the concepts; their titles (and both halves of a
title written `A (B)`) are the surface forms. The match is whole-word and case-insensitive,
in prose only: never in headings, code, tables, HTML, existing links, or the Související and
Literatura sections, and never a page linking to itself. A term the page already links to
anywhere is left alone. Idempotent: a second run changes nothing. check-ia.py reports what
this script would fix as requirement `term-links`.

Usage:
  scripts/link-terms.py [path ...]   link content/ (or the given pages) in place
  scripts/link-terms.py --check      exit 1 when a page has an unlinked first mention
"""
import pathlib
import sys

sys.dont_write_bytecode = True  # no __pycache__ in the checkout
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
from ia_model import (AT_LINK, CONTENT, TOML_FM, YAML_FM, glossary_terms,  # noqa: E402
                      load_pages, unlinked_terms)


def main() -> int:
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    check = "--check" in sys.argv[1:]
    pages = load_pages()
    known = {p["path"] for p in pages}
    terms = glossary_terms(pages)
    wanted = None
    if args:
        wanted = {str(pathlib.Path(a).resolve().relative_to(CONTENT.resolve())) for a in args}
    changed, inserted = 0, 0
    for page in pages:
        if page["path"] == "references.md" or (wanted and page["path"] not in wanted):
            continue
        path = CONTENT / page["path"]
        text = path.read_text(encoding="utf-8")
        m = TOML_FM.match(text) or YAML_FM.match(text)
        head, body = (text[:m.end()], text[m.end():]) if m else ("", text)
        linked = {t.group(1) for t in AT_LINK.finditer(body)} & known
        found = unlinked_terms(body, page["path"], linked, terms)
        if not found:
            continue
        changed += 1
        inserted += len(found)
        if check:
            print(f"content/{page['path']}: " + ", ".join(f"„{f[0]}“" for f in found[:6])
                  + (" …" if len(found) > 6 else ""))
            continue
        for word, target, offset, length in sorted(found, key=lambda f: f[2], reverse=True):
            body = body[:offset] + f"[{word}](@/{target})" + body[offset + length:]
        path.write_text(head + body, encoding="utf-8")
    verb = "would link" if check else "linked"
    print(f"link-terms: {verb} {inserted} first mention(s) on {changed} page(s)")
    return 1 if check and changed else 0


if __name__ == "__main__":
    sys.exit(main())
