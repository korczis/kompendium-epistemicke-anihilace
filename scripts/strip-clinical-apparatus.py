#!/usr/bin/env python3
"""Remove the fabricated clinical apparatus from technique pages.

The shared EA-4.*/EA-6.* template carried an invented clinical apparatus, byte-identical across
unrelated techniques: fabricated study effect sizes and sample sizes, a decision tree with
instrument cutoffs (PCL-5 ≥ 33, DERS > 120, DES-II > 30, session counts), neuropsychological
deviations, remission/follow-up figures, and a mis-mapped "DSM-5-TR / ICD-11 mapování" paragraph
(an ethics or attack page labelled with PTSD/CPTSD treatment codes). None of it is real per-
technique data; it is forbidden by project.content-sources-verifiable and the defensive frame.
The techniques train rewrote the scoped pages (replacing the apparatus with observer-voice
sections); this removes the same apparatus from the pages the train missed, as a block, so no
mis-mapped clinical claim ships. The quality enrichment (observer-voice replacement sections) is
a later pass; removal here keeps every page above the detail threshold (checked: 0 fall under).

Removed, from content/kompendium/techniques/ only:
  - the sections "## Evidence base", "## Algoritmický rozhodovací strom",
    "## Neuropsychologické markery", "## Outcome měření", "## Long-term follow-up"
    (heading to the next "## " heading / derived block / end);
  - the "**DSM-5-TR / ICD-11 mapování**: …" paragraph wherever it sits.

Usage:
  scripts/strip-clinical-apparatus.py [path ...]   strip it (techniques/ or the given paths)
  scripts/strip-clinical-apparatus.py --check [p]  exit 1 when any apparatus remains
  scripts/strip-clinical-apparatus.py --help       this text; other options are refused
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
TECHNIQUES = ROOT / "content" / "kompendium" / "techniques"
SECTIONS = ("Evidence base", "Algoritmický rozhodovací strom", "Neuropsychologické markery",
            "Outcome měření", "Long-term follow-up")
SECTION = re.compile(r"\n*##\s+(?:" + "|".join(re.escape(s) for s in SECTIONS) +
                     r")\b.*?(?=\n##\s|\n<!-- kompendium:odvozene-vazby:begin|\Z)", re.S)
DSM = re.compile(r"\n*\*\*DSM-5-TR / ICD-11 mapování\*\*:[^\n]*\n?", re.I)


def strip(text: str) -> str:
    new = DSM.sub("\n", SECTION.sub("\n", text))
    return (new.rstrip("\n") + "\n") if new != text else text


def main() -> int:
    args = sys.argv[1:]
    if any(a in ("-h", "--help") for a in args):
        print(__doc__.strip())
        return 0
    unknown = [a for a in args if a.startswith("-") and a != "--check"]
    if unknown:
        print(f"strip-clinical-apparatus: unknown option {unknown[0]}; see --help", file=sys.stderr)
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
    print(f"strip-clinical-apparatus: {verb} the apparatus from {len(changed)} page(s)")
    return 1 if check and changed else 0


if __name__ == "__main__":
    sys.exit(main())
