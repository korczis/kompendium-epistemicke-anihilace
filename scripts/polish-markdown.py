#!/usr/bin/env python3
"""Typographic and structural polish of every Markdown page under content/.

Idempotent and conservative: it only touches prose, never front matter, fenced or indented
code, inline code, HTML tags, Tera expressions, link targets or table rows.

  - one blank line at most between blocks, none at the end of the file, a final newline;
  - no trailing whitespace (two-space hard breaks are kept);
  - a blank line before a heading and before a list that follows a paragraph;
  - three dots become an ellipsis, a spaced double hyphen a dash (en on Czech pages, em on
    English ones);
  - straight double quotes become typographic quotes: Czech „…“ on Czech pages,
    English “…” on pages whose prose is mostly English.

Usage:
  scripts/polish-markdown.py [path ...]          rewrite content/ (or the given files and
                                                directories) in place, print a summary
  scripts/polish-markdown.py --check [path ...]  exit 1 when a page would change (CI)
  scripts/polish-markdown.py --help             this text; any other option is refused
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent / "content"

FRONT_MATTER = re.compile(r"\A(\+\+\+\n.*?\n\+\+\+\n|---\n.*?\n---\n)", re.S)
FENCE = re.compile(r"^\s*(```|~~~)")
LIST_ITEM = re.compile(r"^\s*([-*+]|\d+[.)])\s")
# Only these may interrupt a paragraph in CommonMark, so a blank line before them changes the
# source and never the rendering; "2026. …" inside a paragraph stays a paragraph.
LIST_START = re.compile(r"^([-*+]|1[.)])\s")
HEADING = re.compile(r"^#{1,6}\s")
# Spans that must never be rewritten: inline code, HTML tags and comments, Tera blocks,
# link and image targets, autolinks, and bare URLs.
PROTECTED = re.compile(
    r"`+[^`]*`+"
    r"|<!--.*?-->"
    r"|<[^>\n]+>"
    r"|\{\{.*?\}\}|\{%.*?%\}|\{#.*?#\}"
    r"|\]\([^)\n]*\)"
    r"|https?://\S+"
)
QUOTED = re.compile(r'(?<![\w"=])"(?=\S)([^"\n]*?\S)"(?![\w"])')
ENGLISH = re.compile(r"\b(the|and|of|with|is|are|this|that|for)\b", re.I)
CZECH = re.compile(r"[ěščřžýáíéůúťďň]|\b(je|se|na|že|jako|nebo|které|podle)\b", re.I)


def is_english(body: str) -> bool:
    return len(ENGLISH.findall(body)) > 2 * len(CZECH.findall(body))


def polish_inline(line: str, quotes: tuple) -> str:
    """Rewrite the prose of one line, leaving protected spans as they are."""
    if line.lstrip().startswith("|") or line.startswith("    ") or line.startswith("\t"):
        return line
    out, last = [], 0
    for m in PROTECTED.finditer(line):
        out.append(polish_prose(line[last:m.start()], quotes))
        out.append(m.group(0))
        last = m.end()
    out.append(polish_prose(line[last:], quotes))
    return "".join(out)


def polish_prose(text: str, quotes: tuple) -> str:
    if not text:
        return text
    text = re.sub(r"(?<!\.)\.\.\.(?!\.)", "…", text)
    text = text.replace(" -- ", f" {quotes[2]} ")
    if text.count('"') >= 2:
        text = QUOTED.sub(lambda m: f"{quotes[0]}{m.group(1)}{quotes[1]}", text)
    return text


def polish(text: str) -> str:
    text = text.replace("\r\n", "\n").replace("\r", "\n")
    m = FRONT_MATTER.match(text)
    head, body = (m.group(0), text[m.end():]) if m else ("", text)
    # (opening quote, closing quote, dash between words)
    quotes = ("“", "”", "—") if is_english(body) else ("„", "“", "–")

    lines, out, in_code = body.split("\n"), [], False
    for line in lines:
        if FENCE.match(line):
            in_code = not in_code
            out.append(line.rstrip())
            continue
        if in_code:
            out.append(line)
            continue
        # Keep a deliberate Markdown hard break (exactly two trailing spaces).
        stripped = line.rstrip()
        if line.endswith("  ") and not line.endswith("   ") and stripped:
            stripped += "  "
        line = polish_inline(stripped, quotes)
        prev = out[-1] if out else ""
        needs_gap = prev.strip() and not FENCE.match(prev) and (
            (HEADING.match(line) and not HEADING.match(prev))
            or (
                LIST_START.match(line)
                and not LIST_ITEM.match(prev)
                and not prev.startswith((" ", "\t", ">", "|", "<", "{"))
                and not HEADING.match(prev)
            )
        )
        if needs_gap and not prev_in_code(out):
            out.append("")
        if line == "" and prev == "" and out:
            continue
        out.append(line)

    body = "\n".join(out).strip("\n")
    if head and body:
        body = "\n" + body if not head.endswith("\n\n") else body
    return head + body + "\n"


def prev_in_code(out: list) -> bool:
    return sum(1 for line in out if FENCE.match(line)) % 2 == 1


def main() -> int:
    args = sys.argv[1:]
    if any(a in ("-h", "--help") for a in args):
        print(__doc__.strip())
        return 0
    unknown = [a for a in args if a != "--check" and a.startswith("-")]
    if unknown:
        # An unknown option must never fall through to rewrite mode (it once polished 836
        # pages under agents that were still editing them).
        print(f"polish-markdown: unknown option {unknown[0]}; see --help", file=sys.stderr)
        return 2
    check = "--check" in args
    targets = [pathlib.Path(a) for a in args if not a.startswith("-")]
    paths = []
    for target in targets:
        paths.extend(sorted(target.rglob("*.md")) if target.is_dir() else [target])
    changed = []
    for path in paths or sorted(ROOT.rglob("*.md")):
        original = path.read_text(encoding="utf-8")
        polished = polish(original)
        if polished == original:
            continue
        changed.append(path)
        if not check:
            path.write_text(polished, encoding="utf-8")
    verb = "would change" if check else "polished"
    print(f"polish-markdown: {verb} {len(changed)} page(s)")
    if check:
        for path in changed[:50]:
            print(f"  {path}")
    return 1 if check and changed else 0


if __name__ == "__main__":
    sys.exit(main())
