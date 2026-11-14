#!/usr/bin/env python3
"""Worklist lint: bare-surname attributions missing an inline source.

Prints every place in content/kompendium where a surname that appears in
content/references.md is used in prose as an attribution (``X ukazuje``, ``podle X``,
``X tvrdí`` …) with no author-year anywhere in the same paragraph.

This is a WORKLIST, not a gate. It is deliberately NOT wired into scripts/check-ia.py
or CI: measured precision is only ~25 % (most hits name a known position or framework —
"Kant rozlišuje:", a dedicated author page — which legitimately need no inline year), so
at ~+3-5 s per check-ia run it would cost more than it catches. Run it by hand to find the
genuine cases — an ambiguous surname with several works in references.md, cited in passing
on a page that is not about that author — and fix those by adding the author-year.

Always exits 0. Usage:

    python3 scripts/lint-bare-surname.py            # list every hit, sorted
    python3 scripts/lint-bare-surname.py --count     # just the totals
"""
import re
import sys
import pathlib

ROOT = pathlib.Path(__file__).resolve().parent.parent

# Czech 3rd-person-singular attribution verbs; "podle X" is handled separately.
VERBS = (
    r"ukazuje|ukázal|tvrdí|tvrdil|píše|psal|uvádí|uvedl|argumentuje|argumentoval|"
    r"poznamenává|poznamenal|dokazuje|dokázal|říká|řekl|upozorňuje|upozornil|"
    r"zdůrazňuje|zdůraznil|navrhuje|navrhl|popisuje|popsal|definuje|rozlišuje|"
    r"konstatuje|soudí|míní|vysvětluje|nazývá|označuje|charakterizuje|formuluje|"
    r"rozvíjí|kritizuje|odmítá|hájí|dodává|poukazuje|rozvinul|zavádí|zavedl"
)
YEAR = re.compile(r"\(?\b(1[5-9]\d{2}|20\d{2})\b")


def surnames() -> set:
    """Leading ``- Surname, I.`` tokens from the generated references page."""
    out = set()
    refs = (ROOT / "content" / "references.md").read_text(errors="replace")
    for m in re.finditer(
        r"^- ([A-ZÁČĎÉĚÍŇÓŘŠŤÚŮÝŽ][\wáčďéěíňóřšťúůýž'-]+),", refs, re.M
    ):
        if len(m.group(1)) >= 4:
            out.add(m.group(1))
    return out


def paragraphs(body: str):
    body = re.sub(r"```.*?```", "", body, flags=re.S)        # drop code fences
    body = re.sub(r"^\s*\|.*\|\s*$", "", body, flags=re.M)    # drop table rows
    for blk in re.split(r"\n\s*\n", body):
        blk = blk.strip()
        if blk and not blk.startswith(("#", "+++", "<small", "- [", "Citováno")):
            yield blk


def main() -> int:
    names = surnames()
    pattern = "|".join(sorted(map(re.escape, names), key=len, reverse=True))
    attr = re.compile(
        rf"\b(?:(?P<s1>{pattern})\s+(?:{VERBS})|podle\s+(?P<s2>{pattern})\b)"
    )

    hits = []
    for path in sorted((ROOT / "content" / "kompendium").rglob("*.md")):
        rel = path.relative_to(ROOT).as_posix()
        for para in paragraphs(path.read_text(errors="replace")):
            if YEAR.search(para):
                continue
            for m in attr.finditer(para):
                name = m.group("s1") or m.group("s2")
                i = m.start()
                snip = re.sub(r"\s+", " ", para[max(0, i - 24): i + 72]).strip()
                hits.append((rel, name, snip))

    pages = {h[0] for h in hits}
    if "--count" not in sys.argv:
        for rel, name, snip in sorted(hits):
            print(f"{rel}\t{name}\t…{snip}…")
    print(
        f"\nbare-surname worklist: {len(hits)} hit(s) across {len(pages)} page(s). "
        f"~25% are genuine (ambiguous author, cited in passing); review by hand.",
        file=sys.stderr,
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
