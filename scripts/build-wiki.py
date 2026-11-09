#!/usr/bin/env python3
"""Generuje wiki na GitHubu z obsahu knihy, aby se wiki nikdy nerozešla s webem.

Použití: scripts/build-wiki.py <adresář-s-klonem-wiki>
Zapíše Home, Kapitoly, Katalog-technik, Případy, Provenience, Sestavení, Licence, _Sidebar
a _Footer a smaže stránky, které generátor dřív psal a už nepíše. Všechny odkazy do knihy
míří na publikovaný web; čísla se měří z content/ v okamžiku generování.
"""

import pathlib
import re
import subprocess
import sys
import tomllib
from collections import defaultdict

ROOT = pathlib.Path(__file__).resolve().parent.parent
CONTENT = ROOT / "content"
SITE = "https://korczis.github.io/kompendium-epistemicke-anihilace"
REPO = "https://github.com/korczis/kompendium-epistemicke-anihilace"
RAW = f"{REPO}/raw/main"
RETIRED = ["Chapters.md", "Technique-Catalogue.md", "Cases.md", "Provenance.md", "Building.md"]


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


def count(rel, pattern="*.md"):
    return sum(1 for p in (CONTENT / rel).glob(pattern) if p.name != "_index.md")


def git(*args):
    return subprocess.run(["git", "-C", str(ROOT), *args], capture_output=True, text=True).stdout.strip()


def kapitoly():
    _, _, _, subs = section("kompendium")
    numbered = [d for d in subs if d.name[0].isdigit()]
    collections = [d for d in subs if not d.name[0].isdigit()]
    lines = ["# Kapitoly", "",
             "Všechny oddíly knihy s počtem stránek. Názvy vedou na web; počty se měří z `content/` "
             "při generování wiki.", ""]
    for title, group in (("Číslované kapitoly", numbered), ("Tematické kolekce", collections)):
        lines += [f"## {title}", "", "| Oddíl | Stránek | Popis |", "|---|---:|---|"]
        for d in group:
            path, meta, pages, _ = section(d.relative_to(CONTENT).as_posix())
            lines.append(f"| [{cell(meta.get('title', d.name))}]({url(path)}) | {len(pages)} | "
                         f"{cell(meta.get('description', ''))[:220]} |")
        lines.append("")
    return "\n".join(lines)


def katalog():
    groups = defaultdict(list)
    for path in sorted((CONTENT / "kompendium" / "techniques").glob("*.md")):
        if path.name == "_index.md":
            continue
        meta = front_matter(path)
        code = (meta.get("extra", {}) or {}).get("ea_code") or ""
        match = re.match(r"ea-(\d+)", path.stem)
        family = f"EA-{match.group(1)}" if match else "Ostatní"
        groups[family].append((code, meta.get("title", path.stem), url(path)))
    total = sum(len(v) for v in groups.values())
    lines = ["# Katalog technik", "",
             f"{total} hesel taxonomie EA (`content/kompendium/techniques/`) podle rodin. Každé heslo "
             "na webu obsahuje mechanismus, detekční markery a vazby na související pojmy.", ""]

    def order(key):
        match = re.match(r"EA-(\d+)", key)
        return (0, int(match.group(1))) if match else (1, 0)

    lines += ["| Rodina | Hesel |", "|---|---:|"]
    lines += [f"| [{f}](#{f.lower()}-{len(groups[f])}) | {len(groups[f])} |" for f in sorted(groups, key=order)]
    lines.append("")
    for family in sorted(groups, key=order):
        items = groups[family]
        lines += [f"## {family} ({len(items)})", ""]
        for code, title, link in items:
            lines.append(f"- [{cell(title)}]({link})" + (f" `{code}`" if code and code not in title else ""))
        lines.append("")
    return "\n".join(lines)


def pripady():
    lines = ["# Případy", ""]
    for rel, title in (("kompendium/case-studies", "Kazuistiky (anonymizované)"),
                       ("kompendium/historical-cases", "Historické případy")):
        path, _, pages, _ = section(rel)
        lines += [f"## {title}", "", f"[Oddíl na webu]({url(path)}), {len(pages)} stránek.", ""]

        def num(p):
            m = re.match(r"(\d+)", p.stem)
            return int(m.group(1)) if m else 999

        for page in sorted(pages, key=num):
            lines.append(f"- [{cell(front_matter(page).get('title', page.stem))}]({url(page)})")
        lines.append("")
    return "\n".join(lines)


def home(stats):
    return f"""<div align="center">

<a href="{SITE}/"><img src="{RAW}/static/img/rozpad.gif" alt="Animace: síť pojmů, která se v putujícím ohnisku rozpadá a mimo něj znovu skládá." width="100%"></a>

# Kompendium epistemické a kognitivní anihilace

**Defenzivní taxonomie jevů, které systematicky rozkládají schopnost člověka poznávat.**

**[📖 Číst knihu]({SITE}/)** · **[🎨 Galerie]({SITE}/galerie/)** · **[📚 Reference]({SITE}/references/)** · **[💻 Repozitář]({REPO})**

</div>

---

## Kniha v číslech

| 📄 Stránek knihy | 🧬 Technik | 🗂️ Případů | 📘 Hesel glosáře | 📚 Citovaných pramenů |
|:-:|:-:|:-:|:-:|:-:|
| **{stats['pages']}** | **{stats['techniques']}** | **{stats['cases']}** | **{stats['glossary']}** | **{stats['refs']}** |

<sub>Změřeno z repozitáře při generování wiki (`scripts/build-wiki.py`), revize `{stats['rev']}`.</sub>

## O čem kniha je

Epistemická anihilace neznamená, že člověku někdo vnutí jednu lež. Znamená, že se postupně
rozpadnou nástroje, kterými lež od pravdy rozlišuje: důvěra ve vlastní vnímání a paměť,
schopnost vážit důkazy, význam slov, lidé, se kterými si realitu ověřuje, a nakonec i
schopnost přemýšlet o vlastním myšlení.

Kompendium tyto jevy třídí do ucelené taxonomie a u každého popisuje mechanismus na úrovni
struktury, detekční markery, klinický rámec a cestu k obraně a zotavení.

> [!IMPORTANT]
> Kniha je pro kvalifikované čtenáře: psychiatry, psychology, terapeuty, vyšetřovatele,
> filozofy a výzkumníky kognitivních věd. Není to operativní manuál, diagnostický nástroj ani
> náhrada odborné péče.

## Kde začít

| Krok | Stránka | Proč |
|:-:|---|---|
| 1 | [Předmluva]({SITE}/kompendium/01-predmluva/) | účel, pro koho je kniha, jak s ní pracovat |
| 2 | [Etické aspekty]({SITE}/kompendium/01-predmluva/eticke-aspekty/) | poznání s dvojím užitím a závazné zásady |
| 3 | [Úvod do epistemické anihilace]({SITE}/kompendium/02-uvod/) | definice, historický kontext, teorie |
| 4 | [Obsah kompendia]({SITE}/kompendium/) | celá struktura knihy |

## Průvodce na wiki

| | Stránka | Obsah |
|:-:|---|---|
| 📖 | [[Kapitoly]] | všechny oddíly s počtem stránek |
| 🧬 | [[Katalog technik\\|Katalog-technik]] | hesla EA-X.Y.Z podle rodin |
| 🗂️ | [[Případy]] | kazuistiky a historické případy |
| 🧭 | [[Provenience]] | odkud kniha pochází a jak se vyvíjela |
| 🛠️ | [[Sestavení]] | jak web sestavit a přispět |
| ⚖️ | [[Licence]] | CC BY-NC-SA 4.0 pro text, MIT pro kód |
"""


def provenience():
    return f"""# Provenience

Kniha rostla od března 2025 v několika liniích. Všechny jsou v repozitáři ve složce
[`archive/`]({REPO}/tree/main/archive) **s původní historií** (převzato pomocí
`git filter-repo`, skript `scripts/import-lineage.sh`); plná kniha je v `content/kompendium/`.

```text
2025-03  gisty a prismatic-legacy     taxonomie, rejstříky, výkladový slovník, první texty
2025-07  gist, korczis/prismatic       disoluční komora; první struktura o osmi oddílech
2025-09  Prismatic Platform, docs/     strukturovaná verze 29 souborů
2026-04  Prismatic Platform, web       plná kniha: kapitoly, katalog technik, případy, obrana
2026-11  tento repozitář               samostatné vydání, web, wiki, grafika
```

| Linie | Zdroj | Kde je teď |
|---|---|---|
| Gist „Epistemická a kognitivní anihilace: kompletní taxonomie“ | gist `918701a9…` | `archive/gists/918701a95ea28eb31f3f3b717ea56e9b/` |
| Gisty „Hypersyntaktická anihilace“, „Absolutní epistemická disoluční komora“ | gisty `70f09b48…`, `67b1c617…` | `archive/gists/` |
| prismatic-legacy | `gitlab.com/korczis/prismatic-legacy` | `archive/prismatic-legacy/` |
| korczis/prismatic | `gitlab.com/korczis/prismatic` | `archive/prismatic/` |
| Prismatic Platform, `docs/kompendium` | soukromý monorepozitář | `archive/docs-kompendium/` |
| psychonautic | `gitlab.com/korczis/psychonautic`, znalostní báze | `archive/psychonautic/` |
| Prismatic Platform, plná kniha | soukromý monorepozitář | `content/kompendium/` (zdroj webu) |

## Jak se hledalo

Před vydáním proběhlo prohledání všech dosažitelných strojů přes SSH (každý git repozitář,
každý ref, celá historie, plus soubory mimo git), GitLabu (vyhledávání ve všech projektech)
a gistů. Podrobnosti a výjimky jsou v
[`archive/README.md`]({REPO}/blob/main/archive/README.md).

## Úpravy při vydání

1. Zola 0.23 zrušila shortcodes; obsah je převeden na komponenty (`scripts/migrate-content.py`,
   idempotentní, kontrolováno v CI).
2. Odkazy na stránky platformy mimo knihu vedou na její původní veřejný web; odkazy na soukromý
   monorepozitář vedou do tohoto repozitáře.
3. Soukromé e-mailové adresy byly ze souborů odstraněny v celé historii; autorství a data commitů
   zůstala.

Repozitář je pod dohledem [Majordomus](https://majordomus.dev); rozhodnutí jsou v `.ai/repo/adrs/`.
"""


SESTAVENI = f"""# Sestavení

```sh
git clone {REPO}.git
cd kompendium-epistemicke-anihilace
npm ci
npm run build      # CSS (Tailwind + Flowbite), pak zola build → public/
npm run dev        # zola serve na http://127.0.0.1:1111
npm run check      # migrace obsahu, aktuálnost referencí, interní odkazy
npm run graphics   # obálka, social card, banner (SVG → PNG, potřebuje rsvg-convert)
```

Potřeba: Node.js 22+, [Zola](https://www.getzola.org/) ve verzi z `.zola-version`, Python 3.

| Generovaný výstup | Generátor | Kontrola v CI |
|---|---|---|
| `content/references.md` | `scripts/build-references.py` | ano (`--check`) |
| převedený obsah | `scripts/migrate-content.py` | ano (`--check`) |
| `static/img/*.svg`, `*.png` | `scripts/render-graphics.py`, `scripts/render-graphics.sh` | ne |
| `static/img/rozpad*.gif` | `scripts/render-p5-gif.cjs` (p5.js, Playwright, ImageMagick) | ne |
| tato wiki | `scripts/build-wiki.py <klon-wiki>` | ne |
| linie v `archive/` | `scripts/import-lineage.sh` | ne |

Každý push do `main` spustí CI (konvenční commity, `majordomus doctor`, sestavení s interními
odkazy jako chybou), nasadí web na GitHub Pages a ověří, že produkce servíruje daný commit.

## Jak přispět

Opravy a prameny jsou vítány jako [issues]({REPO}/issues) nebo pull requesty. Zprávy commitů
dodržují Conventional Commits (`scripts/lint-commits.sh`). Vzhled webu vychází z design systému
Flowbite Pro.
"""

LICENCE = f"""# Licence

- **Text, glosář, archiv a grafika: CC BY-NC-SA 4.0**
  ([LICENSE-CONTENT.md]({REPO}/blob/main/LICENSE-CONTENT.md)). Uveďte autora, nepoužívejte
  komerčně, odvozená díla šiřte pod stejnou licencí.
- **Kód (šablony, styly, skripty, workflow): MIT** ([LICENSE]({REPO}/blob/main/LICENSE)).
- Knihovny třetích stran si ponechávají vlastní licence ([NOTICE.md]({REPO}/blob/main/NOTICE.md)).

Rozhodnutí je zaznamenáno v
[ADR 0001]({REPO}/blob/main/.ai/repo/adrs/0001-public-release-name-and-licence.md).
"""

SIDEBAR = f"""<img src="{RAW}/static/img/mark.svg" width="40" alt="">

**[📖 Číst knihu]({SITE}/)**

- [[Domů|Home]]
- [[Kapitoly]]
- [[Katalog technik|Katalog-technik]]
- [[Případy]]
- [[Provenience]]
- [[Sestavení]]
- [[Licence]]

[🎨 Galerie]({SITE}/galerie/)
[📚 Reference]({SITE}/references/)
[💻 Repozitář]({REPO})
"""

FOOTER = f"""Kompendium epistemické a kognitivní anihilace · Tomas Korcak · text CC BY-NC-SA 4.0, kód MIT · generováno skriptem `scripts/build-wiki.py` · [web]({SITE}/)
"""


def main():
    if len(sys.argv) != 2:
        print(__doc__, file=sys.stderr)
        return 2
    out = pathlib.Path(sys.argv[1])
    out.mkdir(parents=True, exist_ok=True)
    stats = {
        "pages": sum(1 for _ in (CONTENT / "kompendium").rglob("*.md")),
        "techniques": count("kompendium/techniques"),
        "cases": count("kompendium/case-studies") + count("kompendium/historical-cases"),
        "glossary": count("glossary"),
        "refs": front_matter(CONTENT / "references.md").get("extra", {}).get("entries", 0),
        "rev": git("rev-parse", "--short", "HEAD"),
    }
    pages = {
        "Home.md": home(stats),
        "Kapitoly.md": kapitoly(),
        "Katalog-technik.md": katalog(),
        "Případy.md": pripady(),
        "Provenience.md": provenience(),
        "Sestavení.md": SESTAVENI,
        "Licence.md": LICENCE,
        "_Sidebar.md": SIDEBAR,
        "_Footer.md": FOOTER,
    }
    for name, text in pages.items():
        (out / name).write_text(text, encoding="utf-8")
        print(f"zapsáno {name}")
    for name in RETIRED:
        if (out / name).exists():
            (out / name).unlink()
            print(f"smazáno {name}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
