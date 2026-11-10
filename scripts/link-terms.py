#!/usr/bin/env python3
"""Link the first unlinked mention of every term that has its own page (derived, idempotent).

The dictionary is derived from the content, never written by hand:

  - every glossary entry, by its title and by the parts of a title like
    "Pseudověda (pseudoscience)" (both "Pseudověda" and "pseudoscience");
  - every NLP catalogue page (content/kompendium/nlp-vzorce/<family>/<slug>.md), by its title
    and its nlp_aliases – both written there by scripts/nlp-catalog.py – in two strengths.
    Everywhere in the book only a distinctive NLP name links: a loanword (the Czech and
    English names agree: "Reframing", "Sleight of Mouth") or a hyphenated one ("Meta-model");
    most NLP labels are ordinary Czech ("časová osa" is also a timeline of events,
    "interpretační rámec" is not only NLP). Inside the NLP section also the multi-word titles
    and aliases link. A glossary entry wins over an NLP page for the same term;
  - every technique page, by its code: "EA-1.1.1" links to the fullest page named
    content/kompendium/techniques/ea-1-1-1*.md (never a short-code stub when a full page exists).

A term links only to a page that is itself detailed (it meets the `detail` threshold of
zola.toml and is not machine-generated), exactly as the IA requirement `weak-link` demands; a
glossary entry that is still short is linked by the first run after it has been developed.

Generated blocks (between <!-- kompendium:…:begin and <!-- kompendium:…:end -->) are skipped:
their scripts own them.

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
from ia_model import CONTENT, detail_thresholds, load_pages  # noqa: E402

THRESHOLDS = detail_thresholds()


def detailed(page: dict) -> bool:
    """The page may be a link target under the IA requirement weak-link."""
    if page["generated"]:
        return False
    if page["template"] and not page["is_index"]:
        return True
    if page["path"].startswith("kompendium/quick-reference/"):
        return page["words"] >= THRESHOLDS["qr"]
    return page["words"] >= THRESHOLDS["index" if page["is_index"] else "page"]

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


def dictionary(pages: list) -> tuple:
    terms, local = {}, {}
    pages = [p for p in pages if detailed(p)]
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
    for page in pages:
        path = page["path"]
        if not path.startswith("kompendium/nlp-vzorce/") or page["is_index"] or not page["title"]:
            continue
        if path.count("/") != 3:  # the trainer and other surfaces of the section
            continue
        en = fold(page.get("en", ""))
        for variant in {page["title"].strip(), *[a.strip() for a in page.get("aliases", [])]}:
            words = variant.split()
            if not variant or variant.lower() in STOP or len(variant) < 5:
                continue
            # A loanword counts as distinctive only as the page title: an alias such as
            # "root cause" is ordinary English in the rest of the book.
            distinctive = "-" in variant or (variant == page["title"].strip() and fold(variant) == en)
            if distinctive:
                terms.setdefault(variant.lower(), path)
            elif len(words) > 1:
                local.setdefault(variant.lower(), path)
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
    local = {k: v for k, v in local.items() if k not in terms}
    return terms, codes, local


def fold(text: str) -> str:
    import unicodedata
    return unicodedata.normalize("NFKD", text).encode("ascii", "ignore").decode().lower().strip()


GEN_BEGIN = re.compile(r"<!-- kompendium:[\w-]+:begin")
GEN_END = re.compile(r"<!-- kompendium:[\w-]+:end -->")


def link_page(text: str, own: str, links: set, terms: dict, codes: dict, pattern) -> str:
    m = FRONT.match(text)
    head, body = (m.group(0), text[m.end():]) if m else ("", text)
    added = 0
    done = set(links) | {own}
    out, in_code, in_generated = [], False, False
    for line in body.split("\n"):
        if GEN_BEGIN.search(line):
            in_generated = True
        if in_generated:
            out.append(line)
            if GEN_END.search(line):
                in_generated = False
            continue
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
    terms, codes, local = dictionary(pages)

    def compile_terms(words: dict):
        ordered = sorted(words, key=len, reverse=True)
        return re.compile(
            r"(?<![\w])(" + "|".join(re.escape(t) for t in ordered) + r")(?![\w])", re.I
        ) if ordered else None

    pattern = compile_terms(terms)
    nlp_terms = {**local, **terms}
    nlp_pattern = compile_terms(nlp_terms)
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
        if rel.startswith("kompendium/nlp-vzorce/"):
            new = link_page(text, rel, set(page["links"]), nlp_terms, codes, nlp_pattern)
        else:
            new = link_page(text, rel, set(page["links"]), terms, codes, pattern)
        if new != text:
            changed.append(path)
            if not check:
                path.write_text(new, encoding="utf-8")
    verb = "would link" if check else "linked"
    print(f"link-terms: {verb} {len(changed)} page(s); dictionary {len(terms)} terms "
          f"(+{len(local)} inside the NLP section), "
          f"{len(codes)} technique codes")
    return 1 if check and changed else 0


if __name__ == "__main__":
    sys.exit(main())
