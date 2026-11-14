#!/usr/bin/env python3
"""Worklist lint: bare-surname attributions missing an inline source.

Prints every place in content/kompendium where a surname that appears in
content/references.md is used in prose as an attribution (``X ukazuje``, ``podle X``,
``X tvrdí`` …) AND that author is cited nowhere else on the same page — no author-year
in any paragraph and no entry in the page's own Literatura.

The unit is the page, not the paragraph: a second, year-less mention of an author the page
already cites is ordinary academic practice, not a defect (2e). So a bare "Husserl" on a
page that cites ``Husserl (1900)`` above it does not count.

This is a WORKLIST, not a gate. It is deliberately NOT wired into scripts/check-ia.py
or CI: measured precision is only ~25 % (most hits name a known position or framework —
"Kant rozlišuje:", a dedicated author page — which legitimately need no inline year), so
at ~+3-5 s per check-ia run it would cost more than it catches. Run it by hand to find the
genuine cases — an ambiguous surname with several works in references.md, cited in passing
on a page that is not about that author — and fix those by adding the author-year.

Fixing a hit means adding the work to that page's own ``## Literatura``. That is a DERIVED-DATA
change: ``content/references.md`` is the book-wide bibliography generated from every page's
Literatura, so a one-line addition makes it stale and CI's "References page is current" step
fails. Regenerate it in the same commit — ``python3 scripts/build-references.py`` (or let
``scripts/verify-content.sh --fix`` do it) — and commit the updated ``content/references.md``.

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


def cited_on_page(body: str, name: str) -> bool:
    """Is this author cited anywhere on the page — a year beside the surname, or a
    Literatura/Citováno entry naming it? Then a bare second mention is not a defect."""
    n = re.escape(name)
    near_year = re.compile(
        rf"{n}[^\n]{{0,60}}?\b(?:1[5-9]\d\d|20\d\d)|\b(?:1[5-9]\d\d|20\d\d)[^\n]{{0,30}}?{n}"
    )
    if near_year.search(body):
        return True
    # Literatura / references block entries (and the generated "Citováno" back-links)
    return bool(re.search(rf"^(?:-|\*|\d+\.)\s*{n}\b", body, re.M))


def main() -> int:
    names = surnames()
    pattern = "|".join(sorted(map(re.escape, names), key=len, reverse=True))
    attr = re.compile(
        rf"\b(?:(?P<s1>{pattern})\s+(?:{VERBS})|podle\s+(?P<s2>{pattern})\b)"
    )

    hits = []
    for path in sorted((ROOT / "content" / "kompendium").rglob("*.md")):
        rel = path.relative_to(ROOT).as_posix()
        body = path.read_text(errors="replace")
        for para in paragraphs(body):
            if YEAR.search(para):
                continue
            for m in attr.finditer(para):
                name = m.group("s1") or m.group("s2")
                if cited_on_page(body, name):   # page cites this author elsewhere: not bare
                    continue
                i = m.start()
                snip = re.sub(r"\s+", " ", para[max(0, i - 24): i + 72]).strip()
                hits.append((rel, name, snip))

    pages = {h[0] for h in hits}
    if "--count" not in sys.argv:
        for rel, name, snip in sorted(hits):
            print(f"{rel}\t{name}\t…{snip}…")
    print(
        f"\nbare-surname worklist: {len(hits)} hit(s) across {len(pages)} page(s) where the "
        f"page cites the author nowhere. Review by hand — a refutation in quotes can still slip in.",
        file=sys.stderr,
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
