#!/usr/bin/env python3
"""Remove the fabricated "Forensní markery" detection-threshold section from technique pages.

The shared template carried an identical "## Forensní markery" section on ~30 technique pages:
a list of unsourced, actionable detection thresholds (thermal drop >1.2 °C, self-touching
>15/min, eye contact <30 %, RMSSD <25 ms, pupil >5 mm, 0–6 h / 0–72 h / 0–14 day windows). The
numbers are invented and the whole section is a forensic playbook a reader could act on, which
the defensive frame (project.content-defensive-frame) and content-sources-verifiable forbid. It
is removed as a block, like the drug-dose paragraph; the techniques train restores any legitimate
qualitative observation in the observer's voice.

The section runs from its "## Forensní markery" heading to the next "## " heading (or the
derived-links block, or end of file). Nothing else is touched.

Usage:
  scripts/strip-forensic-markers.py [path ...]   strip it (content/kompendium/techniques or paths)
  scripts/strip-forensic-markers.py --check [p]  exit 1 when the section still exists
  scripts/strip-forensic-markers.py --help       this text; other options are refused
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
TECHNIQUES = ROOT / "content" / "kompendium" / "techniques"
SECTION = re.compile(
    r"\n*##\s+Forensní\s+markery\b.*?(?=\n##\s|\n<!-- kompendium:odvozene-vazby:begin|\Z)",
    re.S | re.I,
)


def strip(text: str) -> str:
    new = SECTION.sub("\n", text)
    return (new.rstrip("\n") + "\n") if new != text else text


def main() -> int:
    args = sys.argv[1:]
    if any(a in ("-h", "--help") for a in args):
        print(__doc__.strip())
        return 0
    unknown = [a for a in args if a.startswith("-") and a != "--check"]
    if unknown:
        print(f"strip-forensic-markers: unknown option {unknown[0]}; see --help", file=sys.stderr)
        return 2
    check = "--check" in args
    named = [pathlib.Path(a) for a in args if not a.startswith("-")]
    paths = named or sorted(TECHNIQUES.rglob("*.md"))
    changed = []
    for path in paths:
        text = path.read_text(encoding="utf-8")
        new = strip(text)
        if new != text:
            changed.append(path)
            if not check:
                path.write_text(new, encoding="utf-8")
    verb = "would strip" if check else "stripped"
    print(f"strip-forensic-markers: {verb} the section from {len(changed)} page(s)")
    return 1 if check and changed else 0


if __name__ == "__main__":
    sys.exit(main())
