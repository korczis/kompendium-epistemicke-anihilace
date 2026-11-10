#!/usr/bin/env python3
"""Link the first unlinked mention of every term that has its own page (derived, idempotent).

The dictionary is derived from the content, never written by hand:

  - every glossary entry, by its title and by the parts of a title like
    "Pseudověda (pseudoscience)" (both "Pseudověda" and "pseudoscience");
  - every technique page, by its code: "EA-1.1.1" links to the fullest page named
    content/kompendium/techniques/ea-1-1-1*.md (never a short-code stub when a full page exists).

On each page the first plain-prose occurrence of a term is linked, unless the page already
links that target or is that target. Never touched: front matter, fenced and inline code,
headings, the bibliography (a `## Literatura` section and its synonyms, which names works, not
terms), existing links and images, HTML, Tera expressions and URLs. Conservative matching:
whole words only, case-insensitive; a single-word term needs at least 8 letters and must not be
on the stop list; each target is linked at most once per page, longest terms first, so a
second run changes nothing.

With --bold, every **bold** span whose text names a glossary entry (its title, the title
without the parenthesised part, the parenthesised alias, extra.aliases or the file slug; lower
case, no diacritics) becomes **[X](@/glossary/x.md)**, every occurrence and not only the
first, on every page but the entry's own (requirement bold-term of scripts/check-ia.py). Labels
("**X**:", "**X:**", "**X.** Text"), table header rows and first cells, key sentences of more
than six words, headings, code, generated blocks and the Související and Literatura sections
are left as they are; the spans are found by ia_model.bold_spans, the same code the gate uses.

Usage:
  scripts/link-terms.py [path ...]          add the links (content/ or the given paths)
  scripts/link-terms.py --check [path ...]  exit 1 when a page would gain a link
  scripts/link-terms.py --bold [path ...]   also link bold spans that name a term
  scripts/link-terms.py --help              this text; other options are refused
"""
import pathlib
import re
import sys

sys.dont_write_bytecode = True
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
from ia_model import CONTENT, bold_spans, bold_term_index, load_pages, slugify  # noqa: E402

MAX_NEW = 10**6  # no cap: each target is linked at most once per page, which bounds it
STOP = {
    "kompendium", "technika", "techniky", "manipulace", "fenomenologie", "inference",
    "protokol", "agentnost", "epistemologie", "psychologie", "filozofie",
}
FRONT = re.compile(r"\A(\+\+\+\n.*?\n\+\+\+\n|---\n.*?\n---\n)", re.S)
FENCE = re.compile(r"^\s*(```|~~~)")
PROTECTED = re.compile(
    r"`+[^`]*`+|<!--.*?-->|<[^>\n]+>|\{\{.*?\}\}|\{%.*?%\}|!?\[[^\]\n]*\]\([^)\n]*\)"
    r"|\[[^\]\n]*\]|\]\([^)\n]*\)|\(@/[^)\n]*\)|https?://\S+"
    # A link whose text wraps onto this line ("…vlivu](@/x.md)") is protected from the line
    # start, and a link text left open at the end of the line is protected to the line end.
    r"|^[^\[\]\n]*\]\([^)\n]*\)|\[[^\]\n]*$"
)
EA = re.compile(r"(?<![\w/-])EA-(\d+)\.(\d+)\.(\d+)(?![\w.]*\d)")
# A bibliography names works, not the book's terms: "Coercive Control" there is Stark's title.
BIBLIOGRAPHY = re.compile(r"^#{1,2}\s+(Literatura|Bibliografie|Reference|Zdroje|Prameny)\b", re.I)
SECTION = re.compile(r"^#{1,2}\s")


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


def link_bold(body: str, own: str, bold_terms: dict) -> tuple:
    """(body with each bold span that names a term linked to it, the targets linked)."""
    linked = set()
    for start, end, text, is_link in reversed(list(bold_spans(body))):
        target = bold_terms.get(slugify(text))
        if is_link or not target or target == own:
            continue
        body = f"{body[:start]}**[{body[start + 2:end - 2]}](@/{target})**{body[end:]}"
        linked.add(target)
    return body, linked


def link_page(text: str, own: str, links: set, terms: dict, codes: dict, pattern,
              bold_terms: dict = None) -> str:
    m = FRONT.match(text)
    head, body = (m.group(0), text[m.end():]) if m else ("", text)
    added = 0
    done = set(links) | {own}
    if bold_terms:
        body, linked = link_bold(body, own, bold_terms)
        done |= linked  # a term linked in bold needs no second link in the prose
    out, in_code, in_bibliography = [], False, False
    for line in body.split("\n"):
        if FENCE.match(line):
            in_code = not in_code
            out.append(line)
            continue
        if not in_code and SECTION.match(line):
            in_bibliography = bool(BIBLIOGRAPHY.match(line))
        if in_code or in_bibliography or line.lstrip().startswith("#") or added >= MAX_NEW:
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
    unknown = [a for a in args if a.startswith("-") and a not in ("--check", "--bold")]
    if unknown:
        print(f"link-terms: unknown option {unknown[0]}; see --help", file=sys.stderr)
        return 2
    check = "--check" in args
    pages = load_pages(with_body="--bold" in args)
    by_path = {p["path"]: p for p in pages}
    terms, codes = dictionary(pages)
    bold_terms = bold_term_index(pages) if "--bold" in args else None
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
        new = link_page(text, rel, set(page["links"]), terms, codes, pattern, bold_terms)
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
