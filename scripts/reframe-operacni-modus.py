#!/usr/bin/env python3
"""Reframe the technique pages' operational "Operační modus" sections as recognition.

A stopgap for ADR 0006 ("retitle and reframe now"): until the techniques train rewrites each
page's section into "## Struktura vzorce" in the observer's voice, this removes the playbook
*shape* mechanically — the heading and the numbered steps — without a prose rewrite, so the
how-to framing is off production fast. The quality rewrite replaces it afterwards.

On technique pages (content/kompendium/techniques/) only, it changes:
  - "## Operační modus" (and "## Operační modus (z hlediska supervize)") -> the recognition
    heading "## Jak technika působí — rozpoznání";
  - "### Krok N — X" / "### Krok N: X" / "### Krok N" -> "### X" (the sign, de-numbered); a step
    with no label becomes "### Projev N".
It never touches prose paragraphs, other sections, or non-technique pages (recovery and
classification steps are legitimate). It satisfies the `howto` gate (scripts/check-ia.py).

Usage:
  scripts/reframe-operacni-modus.py                 reframe every technique page that needs it
  scripts/reframe-operacni-modus.py <path ...>      only these pages (e.g. one stalled batch)
  scripts/reframe-operacni-modus.py --check [path]  exit 1 when a page still has the playbook shape
  scripts/reframe-operacni-modus.py --help          this text; other options are refused
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
TECHNIQUES = ROOT / "content" / "kompendium" / "techniques"
RECOGNITION_HEADING = "## Jak technika působí — rozpoznání"
HEADING = re.compile(r"^#{2}\s+Operační\s+(?:modus|postup|sekvence)\b[^\n]*$", re.M | re.I)
STEP = re.compile(r"^(#{3,4})\s+Krok\s*\d+\s*(?:[—–:.-]\s*)?(.*)$", re.M | re.I)


def reframe(text: str) -> str:
    text = HEADING.sub(RECOGNITION_HEADING, text)
    n = [0]

    def step(m):
        n[0] += 1
        label = m.group(2).strip()
        return f"{m.group(1)} {label}" if label else f"{m.group(1)} Projev {n[0]}"

    return STEP.sub(step, text)


def main() -> int:
    args = sys.argv[1:]
    if any(a in ("-h", "--help") for a in args):
        print(__doc__.strip())
        return 0
    unknown = [a for a in args if a.startswith("-") and a != "--check"]
    if unknown:
        print(f"reframe-operacni-modus: unknown option {unknown[0]}; see --help", file=sys.stderr)
        return 2
    check = "--check" in args
    named = [pathlib.Path(a) for a in args if not a.startswith("-")]
    paths = named or sorted(TECHNIQUES.rglob("*.md"))
    changed = []
    for path in paths:
        text = path.read_text(encoding="utf-8")
        new = reframe(text)
        if new != text:
            changed.append(path)
            if not check:
                path.write_text(new, encoding="utf-8")
    verb = "would reframe" if check else "reframed"
    print(f"reframe-operacni-modus: {verb} {len(changed)} page(s)")
    if check:
        for path in changed[:40]:
            print(f"  {path}")
    return 1 if check and changed else 0


if __name__ == "__main__":
    sys.exit(main())
