#!/usr/bin/env python3
"""Remove machine-generated and hand-copied boilerplate blocks from content pages.

Two kinds are removed:

  - the platform's "NLLB auto block" (below);
  - the hand-copied page footer: a `## Connect…` or `## Kontakt a příspěvky` section ("Connect & Contribute") with the
    author line, licence link and repository/wiki/LinkedIn/contact links, or a lone
    "**Created by [Tomáš Korcak (korczis)](…)** | … [GHL](…)" line. The site footer
    (templates) already carries author and licence; a copy on every page goes stale.

The platform appended a block between `<!-- ENHANCED:NLLB-AUTO-BLOCK BEGIN -->` and
`<!-- ENHANCED:NLLB-AUTO-BLOCK END -->` to many pages: a boilerplate summary and a
"concept network" (a Mermaid graph and a link list) built from front-matter related_terms that
were picked alphabetically, not by meaning. The site now derives each page's real
neighbourhood, backlinks and related pages from the link graph (rule
project.site-derived-surfaces), so the block only adds wrong relations.

Usage:
  scripts/strip-generated-blocks.py [path ...]          strip the blocks (content/ or the paths)
  scripts/strip-generated-blocks.py --check [path ...]  exit 1 when a page still has one
  scripts/strip-generated-blocks.py --help              this text; other options are refused
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent / "content"
BLOCK = re.compile(
    r"\n*(?:---\n+)?<!-- ENHANCED:NLLB-AUTO-BLOCK BEGIN -->.*?<!-- ENHANCED:NLLB-AUTO-BLOCK END -->\n*",
    re.S,
)


# "## Connect & Contribute", "## Connect" or the Czech "## Kontakt a příspěvky" up to the next
# section heading, the derived-links block or the end of file.
CONNECT = re.compile(r"\n+(?:---\n+)?##\s+(?:Connect\b|Kontakt a příspěvky)[^\n]*\n.*?"
                     r"(?=\n## |\n<!-- kompendium:odvozene-vazby:begin|\Z)", re.S)
# A lone author/licence line, optionally after a horizontal rule.
CREATED = re.compile(r"\n+(?:---\n+)?\*\*Created by \[[^\n]*\n?")


def strip(text: str) -> str:
    new = BLOCK.sub("\n\n", text)
    new = CONNECT.sub("\n", new)
    new = CREATED.sub("\n", new)
    return new.rstrip("\n") + "\n" if new != text else text


def main() -> int:
    args = sys.argv[1:]
    if any(a in ("-h", "--help") for a in args):
        print(__doc__.strip())
        return 0
    unknown = [a for a in args if a.startswith("-") and a != "--check"]
    if unknown:
        print(f"strip-generated-blocks: unknown option {unknown[0]}; see --help", file=sys.stderr)
        return 2
    check = "--check" in args
    paths = []
    for arg in (a for a in args if not a.startswith("-")):
        path = pathlib.Path(arg)
        paths.extend(sorted(path.rglob("*.md")) if path.is_dir() else [path])
    changed = []
    for path in paths or sorted(ROOT.rglob("*.md")):
        text = path.read_text(encoding="utf-8")
        new = strip(text)
        if new != text:
            changed.append(path)
            if not check:
                path.write_text(new, encoding="utf-8")
    verb = "would strip" if check else "stripped"
    print(f"strip-generated-blocks: {verb} {len(changed)} page(s)")
    if check:
        for path in changed[:40]:
            print(f"  {path}")
    return 1 if check and changed else 0


if __name__ == "__main__":
    sys.exit(main())
