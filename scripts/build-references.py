#!/usr/bin/env python3
"""Generates content/references.md: every bibliography entry the book cites, deduplicated.

An entry is a list item that starts with an author in "Surname, I." form followed by a year,
as the book's literature sections write them. Each entry links back to the pages citing it.
Usage: scripts/build-references.py [--check]   (--check exits 1 when the page is stale)
"""

import pathlib
import re
import sys
import unicodedata

ROOT = pathlib.Path(__file__).resolve().parent.parent
CONTENT = ROOT / "content"
OUT = CONTENT / "references.md"

ENTRY = re.compile(
    r"^\s*(?:[-*]|\d+\.)\s+(?P<entry>\**[A-ZÁČĎÉĚÍŇÓŘŠŤÚŮÝŽÀ-Ý][\w'’-]+,\s+[A-Z][\w.]*\.?.*?\(\d{4}[a-z]?(?:/\d{4})?\).*)$",
    re.M,
)


def key(entry):
    plain = re.sub(r"[*_`]", "", entry)
    plain = re.sub(r"\s+—.*$", "", plain)
    plain = unicodedata.normalize("NFKD", plain).encode("ascii", "ignore").decode().lower()
    return re.sub(r"[^a-z0-9]+", " ", plain).strip()[:140]


def page_ref(path):
    rel = path.relative_to(CONTENT).as_posix()
    return f"@/{rel}"


def title_of(path):
    match = re.search(r'^title\s*=\s*"(.*)"\s*$', path.read_text(encoding="utf-8"), re.M)
    return match.group(1).replace("\\\"", "\"") if match else path.stem


def collect():
    entries = {}
    for path in sorted(CONTENT.rglob("*.md")):
        if path == OUT:
            continue
        text = path.read_text(encoding="utf-8")
        for match in ENTRY.finditer(text):
            entry = match["entry"].strip()
            k = key(entry)
            if len(k) < 12:
                continue
            item = entries.setdefault(k, {"entry": entry, "pages": []})
            if len(entry) > len(item["entry"]):
                item["entry"] = entry
            if path not in item["pages"]:
                item["pages"].append(path)
    return sorted(entries.values(), key=lambda item: key(item["entry"]))


def render(entries):
    lines = [
        "+++",
        'title = "Reference"',
        'description = "Literatura citovaná v kompendiu: každá položka jednou, s odkazy na stránky, které ji citují."',
        "weight = 900",
        "[extra]",
        "toc = false",
        f"entries = {len(entries)}",
        "+++",
        "",
        "Seznam generuje `scripts/build-references.py` ze seznamů literatury v jednotlivých "
        "stránkách kompendia a glosáře; ručně se needituje.",
        "",
        f"**{len(entries)} položek**, seřazených podle autora.",
        "",
    ]
    letter = None
    for item in entries:
        first = key(item["entry"])[:1].upper()
        if first != letter:
            letter = first
            lines += ["", f"## {letter}", ""]
        pages = item["pages"]
        cited = ", ".join(f"[{title_of(p)}]({page_ref(p)})" for p in pages[:3])
        more = f" a {len(pages) - 3} dalších" if len(pages) > 3 else ""
        lines.append(f"- {item['entry']}  \n  <small>Citováno: {cited}{more}</small>")
    lines += [
        "",
        "## Prameny této edice",
        "",
        "- Plná kniha: monorepozitář Prismatic Platform, `apps/prismatic_web/priv/content/kompendium/`, "
        "převzato i s historií (`git filter-repo`).",
        "- Starší linie od března 2025 (gisty, prismatic-legacy, korczis/prismatic, `docs/kompendium`, "
        "psychonautic): složka "
        "[`archive/`](https://github.com/korczis/kompendium-epistemicke-anihilace/tree/main/archive), "
        "každá s vlastní historií.",
        "- Web z doby platformy: "
        "[prismatic-reality-com.github.io/prismatic-promo/kompendium](https://prismatic-reality-com.github.io/prismatic-promo/kompendium/).",
        "",
    ]
    return "\n".join(lines)


def main():
    text = render(collect())
    if "--check" in sys.argv:
        current = OUT.read_text(encoding="utf-8") if OUT.exists() else ""
        if current != text:
            print("content/references.md is stale: run scripts/build-references.py", file=sys.stderr)
            return 1
        return 0
    OUT.write_text(text, encoding="utf-8")
    print(f"wrote {OUT.relative_to(ROOT)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
