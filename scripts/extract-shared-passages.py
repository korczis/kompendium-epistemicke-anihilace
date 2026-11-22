#!/usr/bin/env python3
"""Move every prose paragraph that `duplicate-passage` charges into one shared partial (ADR 0016).

The owner decided (ADR 0016) that a passage pasted word for word on several pages stays on each of
them, but comes from one template: templates/partials/<slug>.md, pulled in with
`{% include "partials/<slug>.md" %}` at exactly the place where the paragraph stood. This tool
does that move, and only that move:

  * The blocks are the gate's own: dup-passages.py's groups(), i.e. check-ia's passage_blocks on
    3+ content/kompendium pages. Nothing is hand-picked.
  * A partial holds the paragraph's lines exactly as they stood in the source (line breaks,
    emphasis, @/ links). A block is moved only when its raw text is byte-identical on every
    carrier; a block that check-ia matches only after normalising the page's own EA code
    (DUP_CODE) differs per page and is left where it is, reported as remaining.
  * Blocks with the same carrier set that are adjacent (separated only by the same blank lines)
    on every carrier become one partial.
  * The partial name is a Czech-ASCII slug of the block's first words, lengthened until it is
    unique; a name already taken by a different text is never reused.
  * Before a page is written, ia_model.expand_includes(new page) must equal the old page byte for
    byte. If any page fails that, nothing is written and the partials this run created are removed.

A second run finds nothing charged and changes nothing.

Run from the repo root:
  python3 scripts/extract-shared-passages.py           apply the move
  python3 scripts/extract-shared-passages.py --check   report only; exit 1 when a move is pending
"""
import collections
import importlib.util
import pathlib
import re
import sys
import tomllib
import unicodedata

ROOT = pathlib.Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "scripts"))
import ia_model as m  # noqa: E402


def _load(name: str, file: str):
    spec = importlib.util.spec_from_file_location(name, ROOT / "scripts" / file)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


cia = _load("check_ia", "check-ia.py")
dup = _load("dup_passages", "dup-passages.py")

PARTIALS = ROOT / "templates" / "partials"
CONTENT = ROOT / "content"
SLUG_WORDS = 5
SLUG_MAX_WORDS = 12
# Tera markup inside a paragraph would be rendered in another template's scope once it moves.
TERA = re.compile(r"\{[{%#]")
END_MARK = "{#- -#}"
# Zola renders no Tera on these pages, so an include there would be printed, not expanded.
NO_TERA = set(tomllib.loads((ROOT / "zola.toml").read_text(encoding="utf-8"))
              .get("skip_content_templating", []))
WRAP = 96


def normalised(lines: list) -> str:
    """A paragraph as check-ia's passage_blocks stores it."""
    return cia.DUP_CODE.sub("EA-§", cia.SPACE_RUN.sub(" ", " ".join(lines)).strip())


def param_own_code(raw: str, code: str) -> str:
    """The block with only the page's own bare EA code replaced by the Tera placeholder, so just
    the code is the per-page variable and any ** bold markers around it stay literal. The trailing
    (?![\\d.]) keeps EA-5.5.3 from matching inside EA-5.5.30 or EA-5.5.3.1. An empty code leaves
    raw unchanged and the caller then refuses the block."""
    if not code:
        return raw
    return re.sub(re.escape(code) + r"(?![\d.])", m.EA_CODE_PLACEHOLDER, raw)


def paragraphs(text: str) -> list:
    """(first line, last line) of every run of non-blank lines outside a ``` fence."""
    lines = text.split("\n")
    fenced, inside = set(), False
    for i, line in enumerate(lines):
        if line.lstrip().startswith("```"):
            fenced.add(i)
            inside = not inside
        elif inside:
            fenced.add(i)
    out, start = [], None
    for i, line in enumerate(lines + [""]):
        if line.strip() and i not in fenced:
            start = i if start is None else start
        elif start is not None:
            out.append((start, i - 1))
            start = None
    return out


def slug_words(block: str) -> list:
    text = re.sub(r"\{[{%].*?[%}]\}", "", re.sub(r"\]\([^)]*\)", "", block))
    text = unicodedata.normalize("NFKD", text).encode("ascii", "ignore").decode().lower()
    return re.findall(r"[a-z0-9]+", text)


def natural(code: str) -> list:
    return [int(x) if x.isdigit() else x for x in re.split(r"(\d+)", code)]


def scope_of(carriers: list, codes: dict) -> str:
    """What the passage frames, from where its carriers sit: one family, one section, or more."""
    fams = {codes[p].rsplit(".", 1)[0] for p in carriers if codes.get(p)}
    sections = {p.split("/")[1] for p in carriers}
    if sections == {"techniques"} and len(fams) == 1:
        return f"framing of family {fams.pop()}"
    if sections == {"techniques"} and fams:
        return "framing shared by families " + ", ".join(sorted(fams, key=natural))
    if len(sections) == 1:
        return f"framing of section {sections.pop()}"
    return "framing shared across families and sections of the book"


def header(scope: str, plural: bool) -> str:
    what, it, stood = (("passages", "them", "they stood") if plural
                       else ("a passage", "it", "it stood"))
    words = (f"The {scope}: {what} that every page including {it} carries word for word. "
             f"ADR 0016 keeps {it} on each page but in one place; "
             f"scripts/extract-shared-passages.py moved {it} here unchanged, from where {stood} on "
             f"each page, so the text is edited here, once. The empty comment after the text "
             f"removes the file's final newline, so a page receives exactly the text it had."
             ).split()
    lines, cur = [], "{#-"
    for w in words:
        if len(cur) + 1 + len(w) > WRAP:
            lines.append(cur)
            cur = "   "
        cur += " " + w
    lines.append(cur + " -#}")
    return "\n".join(lines)


def plan():
    """(moves, remaining): moves are dicts with the partial's text and each carrier's line span."""
    groups = dup.groups()
    pages = {p["path"]: p for p in m.load_pages(with_body=True)}
    codes = {path: str(p.get("extra", {}).get("ea_code") or "") for path, p in pages.items()}
    texts = {}
    remaining = []
    # block -> {page: (start, end)}; only blocks whose raw text is one and the same everywhere
    spans = {}
    param_moves = []   # EA-code-parameterised blocks: one partial per block, not chained
    for block, carriers in groups.items():
        raw_by_path, where, why = {}, {}, None
        for path in carriers:
            if path in NO_TERA:
                why = f"{path} skips content templating"
                break
            text = texts.setdefault(path, (CONTENT / path).read_text(encoding="utf-8"))
            lines = text.split("\n")
            hits = [(s, e) for s, e in paragraphs(text) if normalised(lines[s:e + 1]) == block]
            if len(hits) != 1:
                why = f"{len(hits)} matching paragraphs on {path}"
                break
            s, e = hits[0]
            raw_by_path[path] = "\n".join(lines[s:e + 1])
            where[path] = (s, e)
        raws = set(raw_by_path.values())
        raw = next(iter(raws)) if len(raws) == 1 else None
        if why is None and len(raws) > 1:
            # The raw differs per page. If the one difference is each page's own EA code and every
            # carrier declares that code (extra.ea_code), the block becomes one parameterised
            # partial: the bare own code becomes {{ page.extra.ea_code }}, bold markers kept.
            params = {param_own_code(raw_by_path[p], codes.get(p, "")) for p in carriers}
            if all(codes.get(p) for p in carriers) and len(params) == 1:
                param_moves.append({
                    "blocks": [block], "text": params.pop(), "carriers": list(carriers),
                    "span": {p: where[p] for p in carriers},
                    "scope": scope_of(list(carriers), codes),
                })
                continue
            by_code = {cia.DUP_CODE.sub("EA-§", r) for r in raws}
            why = ("differs by each page's own EA code, but a carrier lacks extra.ea_code or a "
                   "non-own code also varies" if len(by_code) == 1
                   else f"text differs per page ({len(raws)} variants: line breaks or spacing)")
        elif why is None and TERA.search(raw):
            why = "contains Tera markup"
        elif why is None and (raw[:1].isspace() or raw.split("\n")[-1][-1:].isspace()):
            why = "leading or trailing whitespace a comment would trim"
        if why:
            remaining.append((block, carriers, why))
        else:
            spans[block] = where

    # chains of blocks adjacent on every carrier of one carrier set
    by_set = collections.defaultdict(list)
    for block, where in spans.items():
        by_set[tuple(sorted(where))].append(block)
    moves = []
    for carriers, blocks in sorted(by_set.items()):
        first = carriers[0]
        index = {path: {s: i for i, (s, _) in enumerate(paragraphs(texts[path]))}
                 for path in carriers}
        blocks.sort(key=lambda b: spans[b][first][0])
        chains, cur = [], [blocks[0]]
        for b in blocks[1:]:
            prev = cur[-1]
            if all(index[p][spans[b][p][0]] == index[p][spans[prev][p][0]] + 1 for p in carriers):
                cur.append(b)
            else:
                chains.append(cur)
                cur = [b]
        chains.append(cur)
        for chain in chains:
            def raw_of(path, ch):
                lines = texts[path].split("\n")
                return "\n".join(lines[spans[ch[0]][path][0]:spans[ch[-1]][path][1] + 1])
            if len({raw_of(p, chain) for p in carriers}) > 1:
                parts = [[b] for b in chain]   # separators differ: one partial per block
            else:
                parts = [chain]
            for part in parts:
                moves.append({
                    "blocks": part,
                    "text": raw_of(first, part),
                    "carriers": list(carriers),
                    "span": {p: (spans[part[0]][p][0], spans[part[-1]][p][1]) for p in carriers},
                    "scope": scope_of(list(carriers), codes),
                })
    moves.extend(param_moves)   # the EA-code-parameterised blocks join the byte-identical ones
    # names: most widespread first, then by text, so the order (and every name) is deterministic
    moves.sort(key=lambda mv: (-len(mv["carriers"]), mv["text"]))
    taken = {}
    for f in PARTIALS.glob("*"):
        taken[f.stem] = f.read_text(encoding="utf-8")
    for mv in moves:
        body = "\n".join([header(mv["scope"], len(mv["blocks"]) > 1), mv["text"], END_MARK, ""])
        words = slug_words(mv["text"]) or ["pasaz"]
        n, name = SLUG_WORDS, None
        while name is None:
            cand = "-".join(words[:n])
            if n > SLUG_MAX_WORDS or n > len(words):
                base, k = "-".join(words[:SLUG_MAX_WORDS]), 2
                while f"{base}-{k}" in taken and taken[f"{base}-{k}"] != body:
                    k += 1
                cand = f"{base}-{k}"
            if cand not in taken or taken[cand] == body:
                name = cand
            n += 1
        taken[name] = body
        mv["name"], mv["body"] = name, body
    return moves, remaining, texts, codes


def apply(moves: list, texts: dict, codes: dict) -> dict:
    """Write partials, rewrite pages, prove each page expands back to itself; all or nothing."""
    created = []
    for mv in moves:
        f = PARTIALS / f"{mv['name']}.md"
        if not f.exists():
            f.write_text(mv["body"], encoding="utf-8")
            created.append(f)
    per_page = collections.defaultdict(list)
    for mv in moves:
        for path in mv["carriers"]:
            per_page[path].append((mv["span"][path], mv["name"]))
    new = {}
    for path, edits in per_page.items():
        lines = texts[path].split("\n")
        for (s, e), name in sorted(edits, reverse=True):
            lines[s:e + 1] = [f'{{% include "partials/{name}.md" %}}']
        new[path] = "\n".join(lines)
    # Two proofs per page. Expanding only this run's includes gives back the old source byte for
    # byte; expanding every include (a page may already carry others) gives the old page as the
    # tools and the reader see it.
    mine = {f'{{% include "partials/{mv["name"]}.md" %}}': m.strip_comments(mv["body"])
            for mv in moves}
    own = re.compile("|".join(re.escape(k) for k in mine)) if mine else None
    bad = []
    for p, t in new.items():
        code = codes.get(p, "")
        restored = (own.sub(lambda i: mine[i.group(0)].replace(m.EA_CODE_PLACEHOLDER, code), t)
                    if own else t)
        if (restored != texts[p]
                or m.expand_includes(t, ea_code=code) != m.expand_includes(texts[p], ea_code=code)):
            bad.append(p)
    if bad:
        for f in created:
            f.unlink()
        sys.exit("extract-shared-passages: expansion does not reproduce "
                 f"{len(bad)} page(s), nothing written: {', '.join(sorted(bad)[:5])}")
    for path, text in new.items():
        (CONTENT / path).write_text(text, encoding="utf-8")
    return new


def main():
    check = "--check" in sys.argv
    moves, remaining, texts, codes = plan()
    instances = sum(len(mv["carriers"]) * len(mv["blocks"]) for mv in moves)
    pages = {p for mv in moves for p in mv["carriers"]}
    print(f"extract-shared-passages: {sum(len(mv['blocks']) for mv in moves)} block(s) "
          f"({instances} instances on {len(pages)} pages) into {len(moves)} partial(s); "
          f"{len(remaining)} block(s) remain")
    for mv in moves:
        print(f"  {len(mv['carriers']):>3} pages  partials/{mv['name']}.md  "
              f"({len(mv['blocks'])} block(s), {mv['scope']})")
    for block, carriers, why in sorted(remaining, key=lambda r: (-len(r[1]), r[0])):
        print(f"  remains  {len(carriers):>3} pages  {why}: {block[:70]}…")
    if check:
        sys.exit(1 if moves else 0)
    if moves:
        new = apply(moves, texts, codes)
        print(f"extract-shared-passages: rewrote {len(new)} page(s); every page expands back to "
              f"its previous text byte for byte")


if __name__ == "__main__":
    main()
