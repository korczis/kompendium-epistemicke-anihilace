#!/usr/bin/env python3
"""Derive the README's "Co v knize najdete" table and its scope line from the built data.

The table sits between the markers `<!-- kompendium:readme-oddily:begin -->` and
`<!-- kompendium:readme-oddily:end -->` in README.md; nobody edits it by hand. What is fixed
here is only which entries the table shows, in which order and with which icon (ROWS). Every
title, description, link and count comes from the book:

  title, link    the target's front matter (`title`) and its URL under zola.toml `base_url`
  Obsah          the first sentence of the target's `description`; an entry spanning several
                 sections names the others by their titles; the chapters entry names the
                 number of numbered chapters and the first and last chapter's title
  Stránek        pages under the entry's sections in static/data/graph.json
  scope line     static/data/metrics.json (pages, words, links) and content/references.md
                 (`extra.entries`)

An entry whose target does not exist (a section still on a branch) is left out, so the table
grows when the section lands. Deterministic: `--check` fails CI when the README is stale.

Usage:
  scripts/build-readme.py           rewrite the block in README.md
  scripts/build-readme.py --check   exit 1 when the block is stale
"""
import json
import pathlib
import re
import sys
import tomllib

ROOT = pathlib.Path(__file__).resolve().parent.parent
README = ROOT / "README.md"
CONTENT = ROOT / "content"
BEGIN = "<!-- kompendium:readme-oddily:begin -->"
END = "<!-- kompendium:readme-oddily:end -->"
NUMBERED = re.compile(r"^kompendium/\d\d-")

# (icon, label, target content path, sections counted: list of graph section ids, or a regex)
ROWS = [
    ("📖", "Kapitoly", "kompendium/_index.md", NUMBERED),
    ("🧬", "Katalog technik", "kompendium/techniques/_index.md", ["kompendium/techniques"]),
    ("🗂️", "Případy", "kompendium/historical-cases/_index.md",
     ["kompendium/historical-cases", "kompendium/case-studies"]),
    ("🛡️", "Obrana", "kompendium/self-defense-guides/_index.md",
     ["kompendium/self-defense-guides", "kompendium/organizational-defense",
      "kompendium/prevention-resilience", "kompendium/recovery-protocols",
      "kompendium/emergency-protocols"]),
    ("🗣️", "NLP vzorce", "kompendium/nlp-vzorce/_index.md", ["kompendium/nlp-vzorce"]),
    ("🔤", "Glosář", "glossary/_index.md", ["glossary"]),
    ("📊", "Vizualizace", "kompendium/visualizations/_index.md", None),
    ("🕸️", "Mapa knihy", "mapa.md", None),
    ("🔥", "Případy × techniky", "matice.md", None),
    ("📈", "Stav knihy", "stav.md", None),
    ("🎨", "Galerie", "galerie.md", None),
    ("📚", "Reference", "references.md", None),
]


def front_matter(path):
    text = path.read_text(encoding="utf-8")
    m = re.match(r"\+\+\+\n(.*?)\n\+\+\+", text, re.S)
    return tomllib.loads(m.group(1)) if m else {}


def first_sentence(text):
    text = " ".join(text.split())
    m = re.match(r"(.+?[.!?])(\s|$)", text)
    sentence = m.group(1) if m else text
    return sentence.rstrip(".").replace("|", "\\|")


def url_of(base, rel):
    if rel.endswith("_index.md"):
        return base + rel[: -len("_index.md")]
    return base + rel[: -len(".md")] + "/"


def num(n):
    return f"{n:,}".replace(",", "\u00a0")


def plural(n):
    return "stránka" if n == 1 else "stránky" if 2 <= n <= 4 else "stránek"


def section_title(rel):
    path = CONTENT / rel / "_index.md"
    return front_matter(path).get("title", rel) if path.exists() else rel


def render():
    config = tomllib.loads((ROOT / "zola.toml").read_text(encoding="utf-8"))
    base = config["base_url"].rstrip("/") + "/"
    graph = json.loads((ROOT / "static/data/graph.json").read_text(encoding="utf-8"))
    metrics = json.loads((ROOT / "static/data/metrics.json").read_text(encoding="utf-8"))
    sections = {}
    for node in graph["nodes"]:
        sections[node["section"]] = sections.get(node["section"], 0) + 1

    lines = [BEGIN,
             "<!-- Odvozuje scripts/build-readme.py z obsahu a static/data/; needitovat ručně. -->",
             "",
             "| | Oddíl | Obsah | Stránek |",
             "|:-:|---|---|--:|"]
    for icon, label, target, counted in ROWS:
        path = CONTENT / target
        if not path.exists():
            continue
        fm = front_matter(path)
        desc = first_sentence(fm.get("description", ""))
        count = ""
        if isinstance(counted, re.Pattern):
            ids = sorted(s for s in sections if counted.match(s))
            count = num(sum(sections[s] for s in ids))
            titles = [section_title(s) for s in ids]
            desc = (f"{len(ids)} číslovaných kapitol od „{titles[0]}“ po „{titles[-1]}“"
                    if titles else desc)
        elif counted:
            present = [s for s in counted if s in sections]
            count = num(sum(sections[s] for s in present))
            others = [section_title(s) for s in present[1:]]
            if others:
                desc = f"{desc}; dále {', '.join(others)}"
        lines.append(f"| {icon} | [**{label}**]({url_of(base, target)}) | {desc} | {count} |")
    refs = front_matter(CONTENT / "references.md").get("extra", {}).get("entries")
    scope = (f"Celkem {num(metrics['pages'])} {plural(metrics['pages'])}, přibližně "
             f"{num(round(metrics['words'] / 1000))} tisíc slov, {num(metrics['links'])} "
             "vnitřních odkazů")
    if refs:
        scope += f" a {num(refs)} citovaných pramenů"
    lines += ["", scope + ". Úvodní stránka webu a [Stav knihy]"
              f"({base}stav/) je počítají při každém sestavení.", END]
    return "\n".join(lines)


def main():
    args = sys.argv[1:]
    if any(a in ("-h", "--help") for a in args):
        print(__doc__.strip())
        return 0
    unknown = [a for a in args if a != "--check"]
    if unknown:
        # An unknown option must never fall through to write mode.
        print(f"build-readme: unknown argument {unknown[0]}; see --help", file=sys.stderr)
        return 2
    check = "--check" in args
    text = README.read_text(encoding="utf-8")
    if BEGIN not in text or END not in text:
        sys.exit(f"build-readme: README.md has no {BEGIN} … {END} block")
    head, rest = text.split(BEGIN, 1)
    _, tail = rest.split(END, 1)
    new = head + render() + tail
    if new == text:
        print("build-readme: up to date")
        return 0
    if check:
        sys.exit("build-readme: README.md is stale; run scripts/build-readme.py")
    README.write_text(new, encoding="utf-8")
    print("build-readme: README.md rewritten")
    return 0


if __name__ == "__main__":
    sys.exit(main())
