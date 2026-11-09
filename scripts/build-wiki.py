#!/usr/bin/env python3
"""Generates the GitHub wiki from the book's content, so the wiki never drifts from the site.

Usage: scripts/build-wiki.py <wiki-checkout-dir>
Writes Home, Chapters, Technique-Catalogue, Cases, Provenance, Building, Licence, _Sidebar and
_Footer. Every link to the book points at the published site.
"""

import pathlib
import re
import sys
import tomllib
from collections import defaultdict

ROOT = pathlib.Path(__file__).resolve().parent.parent
CONTENT = ROOT / "content"
SITE = "https://korczis.github.io/kompendium-epistemicke-anihilace"
REPO = "https://github.com/korczis/kompendium-epistemicke-anihilace"


def front_matter(path):
    text = path.read_text(encoding="utf-8")
    match = re.match(r"\+\+\+\n(.*?)\n\+\+\+", text, re.S)
    if not match:
        return {}
    try:
        return tomllib.loads(match.group(1))
    except tomllib.TOMLDecodeError:
        return {}


def url(path):
    rel = path.relative_to(CONTENT).as_posix()
    rel = re.sub(r"(^|/)_index\.md$", r"\1", rel)
    rel = re.sub(r"\.md$", "/", rel)
    return f"{SITE}/{rel}"


def section(rel):
    path = CONTENT / rel / "_index.md"
    meta = front_matter(path)
    pages = sorted(p for p in (CONTENT / rel).glob("*.md") if p.name != "_index.md")
    subs = sorted(d for d in (CONTENT / rel).iterdir() if d.is_dir() and (d / "_index.md").exists())
    return path, meta, pages, subs


def cell(text):
    return str(text or "").replace("|", "\\|").replace("\n", " ").strip()


def chapters():
    _, root_meta, _, subs = section("kompendium")
    numbered = [d for d in subs if d.name[0].isdigit()]
    collections = [d for d in subs if not d.name[0].isdigit()]
    lines = ["# Chapters", "",
             "Every section of the book with its page count. Titles link to the published site; the "
             "counts are measured from `content/` when the wiki is generated.", ""]
    for title, group in (("Numbered chapters", numbered), ("Thematic collections", collections)):
        lines += [f"## {title}", "", "| Section | Pages | Description |", "|---|---:|---|"]
        for d in group:
            path, meta, pages, _ = section(d.relative_to(CONTENT).as_posix())
            lines.append(f"| [{cell(meta.get('title', d.name))}]({url(path)}) | {len(pages)} | "
                         f"{cell(meta.get('description', ''))[:220]} |")
        lines.append("")
    return "\n".join(lines)


def techniques():
    groups = defaultdict(list)
    for path in sorted((CONTENT / "kompendium" / "techniques").glob("*.md")):
        if path.name == "_index.md":
            continue
        meta = front_matter(path)
        code = (meta.get("extra", {}) or {}).get("ea_code") or ""
        match = re.match(r"ea-(\d+)", path.stem)
        family = f"EA-{match.group(1)}" if match else "Other"
        groups[family].append((code, meta.get("title", path.stem), url(path)))
    total = sum(len(v) for v in groups.values())
    lines = ["# Technique catalogue", "",
             f"{total} entries of the EA taxonomy (`content/kompendium/techniques/`), grouped by family. "
             "Each entry on the site carries its mechanism, detection markers and cross-links.", ""]

    def order(key):
        match = re.match(r"EA-(\d+)", key)
        return (0, int(match.group(1))) if match else (1, 0)

    for family in sorted(groups, key=order):
        items = groups[family]
        lines += [f"## {family} ({len(items)})", ""]
        for code, title, link in items:
            lines.append(f"- [{cell(title)}]({link})" + (f" `{code}`" if code and code not in title else ""))
        lines.append("")
    return "\n".join(lines)


def cases():
    lines = ["# Cases", ""]
    for rel, title in (("kompendium/case-studies", "Case studies (anonymised)"),
                       ("kompendium/historical-cases", "Historical cases")):
        path, meta, pages, _ = section(rel)
        lines += [f"## {title}", "", f"[Section on the site]({url(path)}), {len(pages)} pages.", ""]
        def num(p):
            m = re.match(r"(\d+)", p.stem)
            return int(m.group(1)) if m else 999
        for page in sorted(pages, key=num):
            lines.append(f"- [{cell(front_matter(page).get('title', page.stem))}]({url(page)})")
        lines.append("")
    return "\n".join(lines)


def home(n_pages, n_techniques, n_glossary, n_refs):
    return f"""# Kompendium epistemické a kognitivní anihilace

![Banner]({REPO}/raw/main/static/img/banner.png)

A Czech-language book by Tomas Korcak: a **defensive taxonomy** of the phenomena that
systematically erode a person's ability to know, weigh information and keep a coherent picture
of reality. For every phenomenon it gives the mechanism at the level of structure, detection
markers, the clinical frame, and the way to defence and recovery.

**Read the book: <{SITE}/>**

| | |
|---|---|
| Book pages | {n_pages} |
| Technique entries (EA taxonomy) | {n_techniques} |
| Glossary entries | {n_glossary} |
| Cited references | {n_refs} |

Counts are measured from the repository when this wiki is generated
(`scripts/build-wiki.py`).

## Start here

1. [Předmluva (preface)]({SITE}/kompendium/01-predmluva/): purpose, audience, ethics, how to use the book.
2. [Etické aspekty]({SITE}/kompendium/01-predmluva/eticke-aspekty/): dual-use knowledge and the binding guidelines.
3. [Obsah kompendia]({SITE}/kompendium/): the full table of contents.

## Wiki pages

- [[Chapters]]: every section with page counts.
- [[Technique Catalogue|Technique-Catalogue]]: all EA-X.Y.Z entries by family.
- [[Cases]]: anonymised case studies and historical cases.
- [[Provenance]]: where the book came from and how it was recovered.
- [[Building]]: build, check and contribute.
- [[Licence]]: CC BY-NC-SA 4.0 for the text, MIT for the code.

## Who it is for

Qualified readers: psychiatrists, psychologists, therapists, investigators, philosophers and
researchers in the cognitive sciences. It is not an operational manual, a diagnostic instrument
or a substitute for professional care.
"""


PROVENANCE = f"""# Provenance

The Kompendium had no repository of its own until 2026-11-09. It was found in these places
and recovered into [`korczis/kompendium-epistemicke-anihilace`]({REPO}):

| Source | What it held | Where it is now |
|---|---|---|
| Prismatic Platform monorepo (private), `apps/prismatic_web/priv/content/kompendium/` | the full book, 2026 | `content/kompendium/`, with its commit history |
| Prismatic Platform, `docs/kompendium/` | the first structured version, 2025 | `archive/docs-kompendium/` |
| Prismatic Platform glossary and philosophy | the entries the book links to | `content/glossary/`, `content/philosophy/` |
| `prismatic-legacy` (private), `unsorted/kompendium`, `blog/content/kompendium`, `blog/content/anihilace` | early texts, indexes, dictionaries, 2025 | `archive/legacy-2025/` |
| Three secret gists, including "Epistemická a kognitivní anihilace: kompletní taxonomie" | contents, indexes, dictionary, 2025 | `archive/gists/` |
| [prismatic-promo]({ 'https://prismatic-reality-com.github.io/prismatic-promo/kompendium/' }) | the platform-era rendered site | still online; links to platform pages outside the book point there |

## How it was recovered

1. `git filter-repo` extracted every commit that touched the book from the monorepo, so the
   history from 2025-09-30 keeps its original authorship and dates.
2. One migration commit made the book stand alone on Zola 0.23: shortcodes became Tera
   components, links outside the book point at the platform's public site, links to the private
   monorepo point at this repository, and e-mail addresses became links to Issues
   (`scripts/migrate-content.py`, idempotent, checked in CI).
3. Before publication the imported history was rewritten once with
   `git filter-repo --replace-text` to remove e-mail addresses from file contents.

The repository is supervised by [Majordomus](https://majordomus.dev); decisions are recorded in
`.ai/repo/adrs/`.
"""

BUILDING = f"""# Building

```sh
git clone {REPO}.git
cd kompendium-epistemicke-anihilace
npm ci
npm run build      # Tailwind + Flowbite CSS, then zola build -> public/
npm run dev        # zola serve on http://127.0.0.1:1111
npm run check      # migration idempotent, references current, internal links resolve
npm run graphics   # re-render static/img (needs rsvg-convert)
```

Requires Node.js 22+, [Zola](https://www.getzola.org/) at the version in `.zola-version`, and
Python 3.

| Generated file | Generator | Checked in CI |
|---|---|---|
| `content/references.md` | `scripts/build-references.py` | yes (`--check`) |
| migrated content | `scripts/migrate-content.py` | yes (`--check`) |
| `static/img/*` | `scripts/render-graphics.py`, `scripts/render-graphics.sh` | no |
| this wiki | `scripts/build-wiki.py <wiki-checkout>` | no |

Every push to `main` runs CI (conventional commits, `majordomus doctor`, build with internal
links as errors), deploys to GitHub Pages and verifies that production serves the commit.

## Contributing

Corrections and sources are welcome as [issues]({REPO}/issues) or pull requests. Commit
subjects follow Conventional Commits (`scripts/lint-commits.sh`). The site's UI follows the
owner's Flowbite Pro design system.
"""

LICENCE = f"""# Licence

- Text, glossary, archive and graphics: **CC BY-NC-SA 4.0**
  ([LICENSE-CONTENT.md]({REPO}/blob/main/LICENSE-CONTENT.md)). Attribute the author, do not use
  commercially, share adaptations under the same licence.
- Code (templates, styles, scripts, workflows): **MIT** ([LICENSE]({REPO}/blob/main/LICENSE)).
- Third-party browser libraries keep their own licences ([NOTICE.md]({REPO}/blob/main/NOTICE.md)).

The decision is recorded in
[ADR 0001]({REPO}/blob/main/.ai/repo/adrs/0001-public-release-name-and-licence.md).
"""

SIDEBAR = f"""**[Read the book]({SITE}/)**

- [[Home]]
- [[Chapters]]
- [[Technique Catalogue|Technique-Catalogue]]
- [[Cases]]
- [[Provenance]]
- [[Building]]
- [[Licence]]

[References]({SITE}/references/) · [Repository]({REPO})
"""

FOOTER = f"""Kompendium epistemické a kognitivní anihilace · Tomas Korcak · text CC BY-NC-SA 4.0, code MIT · generated by `scripts/build-wiki.py` · [site]({SITE}/)
"""


def main():
    if len(sys.argv) != 2:
        print(__doc__, file=sys.stderr)
        return 2
    out = pathlib.Path(sys.argv[1])
    out.mkdir(parents=True, exist_ok=True)
    n_pages = sum(1 for _ in (CONTENT / "kompendium").rglob("*.md"))
    n_techniques = sum(1 for p in (CONTENT / "kompendium" / "techniques").glob("*.md") if p.name != "_index.md")
    n_glossary = sum(1 for p in (CONTENT / "glossary").glob("*.md") if p.name != "_index.md")
    refs = front_matter(CONTENT / "references.md").get("extra", {}).get("entries", 0)
    pages = {
        "Home.md": home(n_pages, n_techniques, n_glossary, refs),
        "Chapters.md": chapters(),
        "Technique-Catalogue.md": techniques(),
        "Cases.md": cases(),
        "Provenance.md": PROVENANCE,
        "Building.md": BUILDING,
        "Licence.md": LICENCE,
        "_Sidebar.md": SIDEBAR,
        "_Footer.md": FOOTER,
    }
    for name, text in pages.items():
        (out / name).write_text(text, encoding="utf-8")
        print(f"wrote {name}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
