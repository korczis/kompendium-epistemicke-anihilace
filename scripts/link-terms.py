#!/usr/bin/env python3
"""Link the first unlinked mention of every term that has its own page (derived, idempotent).

The dictionary is derived from the content, never written by hand:

  - every glossary entry, by its title and by the parts of a title like
    "Pseudověda (pseudoscience)" (both "Pseudověda" and "pseudoscience");
  - every technique page, by its code: "EA-1.1.1" links to the fullest page named
    content/kompendium/techniques/ea-1-1-1*.md (never a short-code stub when a full page exists).

On each page the first plain-prose occurrence of a term is linked, unless the page already
links that target or is that target. Never touched: front matter, fenced and inline code,
headings, existing links and images, HTML, Tera expressions and URLs. Conservative matching:
whole words only, case-insensitive; a single-word term needs at least 8 letters and must not be
on the stop list; each target is linked at most once per page, longest terms first, so a
second run changes nothing.

Usage:
  scripts/link-terms.py [path ...]          add the links (content/ or the given paths)
  scripts/link-terms.py --check [path ...]  exit 1 when a page would gain a link
  scripts/link-terms.py --help              this text; other options are refused
"""
import pathlib
import re
import sys

sys.dont_write_bytecode = True
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
from ia_model import CONTENT, load_pages  # noqa: E402

MAX_NEW = 10**6  # no cap: each target is linked at most once per page, which bounds it
STOP = {
    "kompendium", "technika", "techniky", "manipulace", "fenomenologie", "inference",
    "protokol", "agentnost", "epistemologie", "psychologie", "filozofie",
}
FRONT = re.compile(r"\A(\+\+\+\n.*?\n\+\+\+\n|---\n.*?\n---\n)", re.S)
FENCE = re.compile(r"^\s*(```|~~~)")
PROTECTED = re.compile(
    r"`+[^`]*`+|<!--.*?-->|<[^>\n]+>|\{\{.*?\}\}|\{%.*?%\}|!?\[[^\]\n]*\]\([^)\n]*\)"
    r"|\[[^\]\n]*\]|https?://\S+"
)
EA = re.compile(r"(?<![\w/-])EA-(\d+)\.(\d+)\.(\d+)(?![\w.]*\d)")


def dictionary(pages: list) -> tuple:
    terms = {}
    for page in pages:
        path = page["path"]
        if not path.startswith("glossary/") or page["is_index"] or not page["title"]:
            continue
        title = page["title"].strip()
        variants = {title}
        m = re.match(r"^(.*?)\s*\((.*?)\)\s*$", title)
        if m:
            variants |= {m.group(1).strip(), m.group(2).strip()}
        for variant in variants:
            words = variant.split()
            if not variant or (len(words) == 1 and (len(variant) < 8 or variant.lower() in STOP)):
                continue
            terms.setdefault(variant.lower(), path)
    codes = {}
    for page in pages:
        m = re.match(r"kompendium/techniques/ea-(\d+)-(\d+)-(\d+)(?:-.+)?\.md$", page["path"])
        if not m:
            continue
        code = ".".join(m.groups())
        best = codes.get(code)
        # Several pages for one code: the fullest one (a short-code stub never wins).
        if best is None or page["words"] > best["words"]:
            codes[code] = page
    codes = {code: page["path"] for code, page in codes.items()}
    return terms, codes


def link_page(text: str, own: str, links: set, terms: dict, codes: dict, pattern) -> str:
    m = FRONT.match(text)
    head, body = (m.group(0), text[m.end():]) if m else ("", text)
    added = 0
    done = set(links) | {own}
    out, in_code = [], False
    for line in body.split("\n"):
        if FENCE.match(line):
            in_code = not in_code
            out.append(line)
            continue
        if in_code or line.lstrip().startswith("#") or added >= MAX_NEW:
            out.append(line)
            continue
        pieces, last = [], 0
        for p in PROTECTED.finditer(line):
            pieces.append((False, line[last:p.start()]))
            pieces.append((True, p.group(0)))
            last = p.end()
        pieces.append((False, line[last:]))
        rebuilt = []
        for protected, chunk in pieces:
            if protected or added >= MAX_NEW:
                rebuilt.append(chunk)
                continue

            def code_link(mt):
                nonlocal added
                target = codes.get(".".join(mt.groups()))
                if not target or target in done or added >= MAX_NEW:
                    return mt.group(0)
                done.add(target)
                added += 1
                return f"[{mt.group(0)}](@/{target})"

            chunk = EA.sub(code_link, chunk)
            if pattern is not None:
                # Work on the text between links just created, never inside them.
                parts = re.split(r"(\[[^\]]*\]\(@/[^)]*\))", chunk)
                for i in range(0, len(parts), 2):

                    def term_link(mt):
                        nonlocal added
                        target = terms.get(mt.group(0).lower())
                        if not target or target in done or added >= MAX_NEW:
                            return mt.group(0)
                        done.add(target)
                        added += 1
                        return f"[{mt.group(0)}](@/{target})"

                    parts[i] = pattern.sub(term_link, parts[i])
                chunk = "".join(parts)
            rebuilt.append(chunk)
        out.append("".join(rebuilt))
    return head + "\n".join(out)


def main() -> int:
    args = sys.argv[1:]
    if any(a in ("-h", "--help") for a in args):
        print(__doc__.strip())
        return 0
    unknown = [a for a in args if a.startswith("-") and a != "--check"]
    if unknown:
        print(f"link-terms: unknown option {unknown[0]}; see --help", file=sys.stderr)
        return 2
    check = "--check" in args
    pages = load_pages()
    by_path = {p["path"]: p for p in pages}
    terms, codes = dictionary(pages)
    ordered = sorted(terms, key=len, reverse=True)
    pattern = re.compile(
        r"(?<![\w])(" + "|".join(re.escape(t) for t in ordered) + r")(?![\w])", re.I
    ) if ordered else None
    targets = []
    for arg in (a for a in args if not a.startswith("-")):
        path = pathlib.Path(arg)
        targets.extend(sorted(path.rglob("*.md")) if path.is_dir() else [path])
    changed = []
    for path in targets or sorted(CONTENT.rglob("*.md")):
        rel = path.resolve().relative_to(CONTENT).as_posix()
        page = by_path.get(rel)
        if page is None or rel == "references.md":
            continue
        text = path.read_text(encoding="utf-8")
        new = link_page(text, rel, set(page["links"]), terms, codes, pattern)
        if new != text:
            changed.append(path)
            if not check:
                path.write_text(new, encoding="utf-8")
    verb = "would link" if check else "linked"
    print(f"link-terms: {verb} {len(changed)} page(s); dictionary {len(terms)} terms, "
          f"{len(codes)} technique codes")
    return 1 if check and changed else 0


if __name__ == "__main__":
    sys.exit(main())
