#!/usr/bin/env python3
"""Write the links that follow from the book's structure, on both sides, as a generated block.

Some pages belong together by construction, and the pair is derivable from their paths:

  quick-reference/qr-ea-X-Y-Z.md            <->  techniques/ea-X-Y-Z*.md (the fullest page)
  glossary-bridges/bridge-<term>.md         <->  glossary/<term>.md
  section-bridges/bridge-NN-to-MM-*.md      <->  the sections NN-* and MM-* (their _index.md)
  section-bridges/bridge-<a>-to-<b>.md      <->  the sections <a> and <b> (their _index.md)

Each page of a pair gets a block between the markers below, listing its counterparts with the
reason for the link. The block is generated: never edit it by hand, run this script. Content
links elsewhere on the page are untouched; a counterpart the page already links in its own
text is still listed, because the block states the structure, not the prose.

  <!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->
  ...
  <!-- kompendium:odvozene-vazby:end -->

Usage:
  scripts/derive-links.py [path ...]          write the blocks (all pages, or only these)
  scripts/derive-links.py --check [path ...]  exit 1 when a block is missing or stale
  scripts/derive-links.py --help              this text; other options are refused
"""
import collections
import pathlib
import re
import sys

sys.dont_write_bytecode = True
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
from ia_model import CONTENT, load_pages  # noqa: E402

BEGIN = "<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->"
END = "<!-- kompendium:odvozene-vazby:end -->"
BLOCK = re.compile(r"\n*" + re.escape(BEGIN) + r".*?" + re.escape(END) + r"\n*", re.S)
HEADING = "## Strukturní vazby"


def relations(pages: list) -> dict:
    """page path -> list of (counterpart path, reason) derived from paths alone."""
    by_path = {p["path"]: p for p in pages}
    out = collections.defaultdict(list)

    def pair(a: str, b: str, why_a: str, why_b: str) -> None:
        if a in by_path and b in by_path and a != b:
            if (b, why_a) not in out[a]:
                out[a].append((b, why_a))
            if (a, why_b) not in out[b]:
                out[b].append((a, why_b))

    techniques = {}
    for p in pages:
        m = re.match(r"kompendium/techniques/ea-(\d+)-(\d+)-(\d+)(?:-.+)?\.md$", p["path"])
        if m:
            code = "-".join(m.groups())
            if code not in techniques or p["words"] > by_path[techniques[code]]["words"]:
                techniques[code] = p["path"]
    sections = {}
    for p in pages:
        parts = p["path"].split("/")
        if p["is_index"] and len(parts) == 3 and parts[0] == "kompendium":
            sections[parts[1]] = p["path"]

    def section_for(token: str):
        if token.isdigit():
            hits = [s for s in sections if s.startswith(f"{int(token):02d}-")]
            return sections[sorted(hits)[0]] if len(hits) == 1 else None
        hits = [s for s in sections if s == token or s.startswith(token)]
        return sections[hits[0]] if len(hits) == 1 else None

    for p in pages:
        path = p["path"]
        m = re.match(r"kompendium/quick-reference/qr-ea-(\d+-\d+-\d+)\.md$", path)
        if m and m.group(1) in techniques:
            pair(path, techniques[m.group(1)], "plná stránka techniky, k níž je tato karta",
                 "karta v kostce: rozpoznání a první reakce na jedné stránce")
        m = re.match(r"kompendium/glossary-bridges/bridge-(.+)\.md$", path)
        if m:
            pair(path, f"glossary/{m.group(1)}.md", "heslo glosáře, které tento most propojuje s knihou",
                 "most: jak se tento pojem projevuje v kapitolách knihy")
        m = re.match(r"kompendium/section-bridges/bridge-(.+?)-to-(.+?)(?:-.*)?\.md$", path)
        if m:
            for token in m.groups():
                target = section_for(token.split("-")[0] if token[0].isdigit() else token)
                if target:
                    pair(path, target, "sekce, kterou tento most propojuje",
                         "most k navazující sekci")
    return out


def render(items: list, by_path: dict) -> str:
    lines = [BEGIN, "", HEADING, ""]
    for target, why in sorted(items, key=lambda x: (by_path[x[0]]["title"] or x[0])):
        title = by_path[target]["title"] or target
        lines.append(f"- [{title}](@/{target}) – {why}")
    lines += ["", END]
    return "\n".join(lines)


def apply(text: str, block: str) -> str:
    base = BLOCK.sub("\n", text).rstrip("\n")
    return f"{base}\n\n{block}\n" if block else base + "\n"


def main() -> int:
    args = sys.argv[1:]
    if any(a in ("-h", "--help") for a in args):
        print(__doc__.strip())
        return 0
    unknown = [a for a in args if a.startswith("-") and a != "--check"]
    if unknown:
        print(f"derive-links: unknown option {unknown[0]}; see --help", file=sys.stderr)
        return 2
    check = "--check" in args
    pages = load_pages()
    by_path = {p["path"]: p for p in pages}
    rel = relations(pages)
    only = set()
    for arg in (a for a in args if not a.startswith("-")):
        path = pathlib.Path(arg).resolve()
        files = sorted(path.rglob("*.md")) if path.is_dir() else [path]
        only |= {f.relative_to(CONTENT).as_posix() for f in files}
    changed = []
    for page in pages:
        path = page["path"]
        if only and path not in only:
            continue
        file = CONTENT / path
        text = file.read_text(encoding="utf-8")
        new = apply(text, render(rel[path], by_path) if rel.get(path) else "")
        if new != text:
            changed.append(path)
            if not check:
                file.write_text(new, encoding="utf-8")
    pairs = sum(len(v) for v in rel.values()) // 2
    verb = "would update" if check else "updated"
    print(f"derive-links: {pairs} structural pair(s); {verb} {len(changed)} page(s)")
    if check:
        for path in changed[:30]:
            print(f"  content/{path}")
    return 1 if check and changed else 0


if __name__ == "__main__":
    sys.exit(main())
