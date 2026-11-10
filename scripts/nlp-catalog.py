#!/usr/bin/env python3
"""The NLP pattern catalogue: derive every NLP page's structure from data, and gate it.

Rule project.nlp-catalog. The catalogue is the single source of truth:

  data/nlp/_families.toml   the families (order, immutable two-digit code, titles)
  data/nlp/<family>.toml    the family's entries ([[pattern]]: id, slug, type, names, edges,
                            links into the book, provenance, trainer items); a large family may
                            add parts data/nlp/<family>.<part>.toml, read in name order
  data/nlp/_sources.toml    the vetted bibliography; prose may cite only these works

Writers own the prose of each page (from `## Definice` on) and its `description`. This script
owns everything derivable and rewrites it on every run:

  - the front matter (title, weight, tags, [extra] nlp_* fields; `description` is kept);
  - the H1 and the identification table under it (block kompendium:nlp-hlavicka);
  - the closing block (kompendium:nlp-vazby): `## Literatura` (exactly the works the prose
    cites), `## Související` (family, broader/narrower, related both ways, the book's pages,
    previous/next, trainer); on family and section indexes also the member tables;
  - static/data/nlp-trener.json, the data of the recognition trainer;
  - static/data/nlp-katalog.json, the whole catalogue for integrations: families, every
    entry with all derived metadata (as in its front matter), its description, trainer
    items and URL, the typed edges (broader, related, kompendium, prose links) and the
    cited works.

Pages: content/kompendium/nlp-vzorce/_index.md (section), <family>/_index.md (families),
<family>/<slug>.md (entries), trener.md (the trainer surface).

--check fails (exit 1) on any of:
  catalogue   unknown or malformed field, duplicate id/slug, id not NLP-<family code>.NN,
              unknown broader/related slug, cycle in broader, unknown or NLP-internal
              `kompendium` path, fewer than two trainer items or no benign contrast item
  bijection   a catalogue entry without its page, a page in the section without an entry
  structure   missing or misordered required section, a writer-written Literatura/Související,
              fewer than MIN_WORDS words of prose, description outside 50-200 characters
  citations   a parenthetical citation that matches no vetted work (fabrication guard), a
              narrative "Surname (Year)" citation, a required section without a citation,
              fewer than MIN_SOURCES distinct works, `Stav důkazů` without a critical work
  frame       phrasing of an operational script (numbered steps, imperatives aimed at a
              target person) – the defensive rule project.content-defensive-frame
  freshness   any derived part (front matter, blocks, trainer data) differs from what this
              script would write now

Usage:
  scripts/nlp-catalog.py                    write every derived part
  scripts/nlp-catalog.py --check            the gate (CI, verify-all, pre-merge)
  scripts/nlp-catalog.py --family <slug>    write/check one family only; links to entries of
                                            families not yet written are skipped and
                                            reported, not failed (parallel writing)
  scripts/nlp-catalog.py --family <slug> --part <file stem>
                                            only the entries of one data file (e.g.
                                            milton-model.b); the family index belongs to the
                                            part <slug> (parallel writers never race)
  scripts/nlp-catalog.py --stats            counts by family, type, use and review state
"""
import collections
import importlib.util
import json
import os
import pathlib
import re
import sys
import tomllib

sys.dont_write_bytecode = True
ROOT = pathlib.Path(__file__).resolve().parent.parent
CONTENT = ROOT / "content"
DATA = ROOT / "data" / "nlp"
SECTION = "kompendium/nlp-vzorce"
SECTION_DIR = CONTENT / SECTION
TRAINER_PAGE = f"{SECTION}/trener.md"
TRAINER_JSON = ROOT / "static" / "data" / "nlp-trener.json"
CATALOGUE_JSON = ROOT / "static" / "data" / "nlp-katalog.json"

MIN_WORDS = 1150        # prose only; the IA gate counts the whole page against 1100
MIN_WORDS_INDEX = 1150  # family indexes are link targets of every entry (weak-link: 1100)
MIN_SOURCES = 4
MAX_RELATED = 8
REQUIRED = [
    "Definice",
    "Původ a souvislosti",
    "Struktura vzorce",
    "Detekční znaky",
    "Legitimní a manipulativní užití",
    "Stav důkazů",
    "Obrana a zotavení",
]
TYPES = {"pattern": "vzorec", "principle": "princip", "concept": "pojem"}
USES = {"terapie": "převážně terapeutické", "vliv": "převážně vlivové",
        "dvoji": "terapeutické i vlivové", "zadne": "výkladový pojem"}
RISKS = {"nizke": "nízké", "stredni": "střední", "vysoke": "vysoké"}
VAKNIN = {"inferred": "odvozená: obsah knihy nebyl ověřen",
          "observed": "doložená v obsahu knihy"}
REVIEW = {"agent": "text čeká na odbornou recenzi", "owner": "zrecenzováno autorem"}
PATTERN_KEYS = {"id", "slug", "type", "cs", "en", "aliases", "use", "risk", "broader",
                "related", "kompendium", "vaknin", "review", "trainer"}
TRAINER_KEYS = {"utterance", "context", "benign", "marker", "response"}

HEAD_BEGIN = "<!-- kompendium:nlp-hlavicka:begin (scripts/nlp-catalog.py; neupravovat ručně) -->"
HEAD_END = "<!-- kompendium:nlp-hlavicka:end -->"
BEGIN = "<!-- kompendium:nlp-vazby:begin (scripts/nlp-catalog.py; neupravovat ručně) -->"
END = "<!-- kompendium:nlp-vazby:end -->"
HEAD_BLOCK = re.compile(re.escape(HEAD_BEGIN) + r".*?" + re.escape(HEAD_END), re.S)
BLOCK = re.compile(re.escape(BEGIN) + r".*?" + re.escape(END), re.S)
TOML_FM = re.compile(r"\A\+\+\+\n(.*?)\n\+\+\+\n", re.S)
H1 = re.compile(r"\A\s*# [^\n]*\n")
H2 = re.compile(r"^## +(.+?)\s*$", re.M)
WORD = re.compile(r"[A-Za-zÀ-ž]+")
SLUG = re.compile(r"^[a-z0-9]+(?:-[a-z0-9]+)*$")
PAREN = re.compile(r"\(([^()\n]*)\)")
YEAR = re.compile(r"\b(?:1[89]|20)\d{2}[a-z]?\b")
NARRATIVE = re.compile(r"\b[A-ZÁČĎÉĚÍŇÓŘŠŤÚŮÝŽ][a-záčďéěíňóřšťúůýž'’-]+\s+\((?:1[89]|20)\d{2}[a-z]?\)")
# NLP pages describe a pattern's structure, never its procedure: on top of the book-wide HOWTO
# lexicon (ia_model.py) they carry no numbered steps of a procedure.
STEPS = re.compile(r"^\s*(?:\d+[.)]|[-*])\s+(?:\*\*)?(?:Krok|Step)\b|\b(?:[Kk]rok|[Ss]tep)\s+\d+\s*[:.)]",
                   re.M)
sys.path.insert(0, str(ROOT / "scripts"))
from ia_model import HOWTO  # noqa: E402


def fail(errors: list, where: str, message: str) -> None:
    errors.append(f"{where}: {message}")


# --- data ------------------------------------------------------------------------------------

def load_toml(path: pathlib.Path) -> dict:
    with path.open("rb") as handle:
        return tomllib.load(handle)


def load_sources() -> dict:
    sources = load_toml(DATA / "_sources.toml")
    for key, src in sources.items():
        words = [re.escape(w) for w in src["cite"].split()]
        src["re"] = re.compile(r"(?<![\w-])" + r"\s+".join(words) + r"(?![0-9a-z])")
        src["key"] = key
    return sources


def load_catalogue(errors: list, only: str = "") -> tuple:
    meta = load_toml(DATA / "_families.toml")
    families, codes = [], set()
    for fam in meta.get("family", []):
        if not SLUG.match(fam.get("slug", "")) or not re.match(r"^\d{2}$", fam.get("code", "")):
            fail(errors, "data/nlp/_families.toml", f"malformed family {fam}")
            continue
        if fam["code"] in codes:
            fail(errors, "data/nlp/_families.toml", f"duplicate code {fam['code']}")
        codes.add(fam["code"])
        families.append(fam)
    entries, seen_id, seen_slug = [], set(), set()

    def add(entry: dict, where: str) -> None:
        if entry["id"] in seen_id:
            fail(errors, where, f"duplicate id {entry['id']}")
        if entry["slug"] in seen_slug:
            fail(errors, where, f"duplicate slug {entry['slug']}")
        seen_id.add(entry["id"])
        seen_slug.add(entry["slug"])
        families_by_slug[entry["family"]]["entries"].append(entry)
        entries.append(entry)

    families_by_slug = {f["slug"]: f for f in families}
    for fam in families:
        fam["entries"] = []
        main = DATA / f"{fam['slug']}.toml"
        parts = ([main] if main.exists() else []) + sorted(
            p for p in DATA.glob(f"{fam['slug']}.*.toml") if SLUG.match(p.stem.split(".", 1)[1]))
        if not main.exists() and not only:
            fail(errors, f"data/nlp/{fam['slug']}.toml", "missing: every family needs its entries")
        for path in parts:
            where = f"data/nlp/{path.name}"
            try:
                data = load_toml(path)
            except tomllib.TOMLDecodeError as exc:
                fail(errors, where, f"TOML: {exc}")
                continue
            for raw in data.get("pattern", []):
                entry = validate_entry(raw, fam, where, errors)
                entry["part"] = path.stem
                add(entry, where)
        if not fam["entries"] and not only:
            fail(errors, f"data/nlp/{fam['slug']}.toml", "no [[pattern]] entries")
        fam["entries"].sort(key=lambda e: e["id"])
    return families, entries



def validate_entry(raw: dict, fam: dict, where: str, errors: list) -> dict:
    e = dict(raw)
    label = f"{where} [{e.get('slug', '?')}]"
    for key in sorted(set(e) - PATTERN_KEYS):
        fail(errors, label, f"unknown field '{key}'")
    defaults = {"aliases": [], "broader": "", "related": [], "kompendium": [],
                "vaknin": "inferred", "review": "agent", "trainer": []}
    for key, value in defaults.items():
        e.setdefault(key, value)
    for key in ("id", "slug", "type", "cs", "en", "use", "risk"):
        if not isinstance(e.get(key), str) or not e.get(key).strip():
            fail(errors, label, f"'{key}' must be a non-empty string")
            e[key] = str(e.get(key, ""))
    if not re.match(rf"^NLP-{fam['code']}\.\d{{2}}$", e["id"]):
        fail(errors, label, f"id '{e['id']}' must be NLP-{fam['code']}.NN")
    if not SLUG.match(e["slug"]):
        fail(errors, label, "slug must be lowercase ASCII words joined by '-'")
    for key, allowed in (("type", TYPES), ("use", USES), ("risk", RISKS),
                         ("vaknin", VAKNIN), ("review", REVIEW)):
        if e[key] not in allowed:
            fail(errors, label, f"{key} '{e[key]}' not in {sorted(allowed)}")
    for key in ("aliases", "related", "kompendium"):
        if not isinstance(e[key], list) or not all(isinstance(x, str) for x in e[key]):
            fail(errors, label, f"'{key}' must be a list of strings")
            e[key] = []
    if len(e["related"]) > MAX_RELATED:
        fail(errors, label, f"at most {MAX_RELATED} related entries")
    if not e["kompendium"]:
        fail(errors, label, "needs at least one 'kompendium' page of the book")
    items = e["trainer"] if isinstance(e["trainer"], list) else []
    for i, item in enumerate(items):
        for key in sorted(set(item) - TRAINER_KEYS):
            fail(errors, label, f"trainer[{i}] unknown field '{key}'")
        if not isinstance(item.get("utterance"), str) or not 20 <= len(item["utterance"]) <= 400:
            fail(errors, label, f"trainer[{i}].utterance must be 20-400 characters")
        if not isinstance(item.get("marker"), str) or len(item.get("marker", "")) < 15:
            fail(errors, label, f"trainer[{i}].marker must name the detection cue")
        if not isinstance(item.get("response"), str) or len(item.get("response", "")) < 15:
            fail(errors, label, f"trainer[{i}].response must give the defensive response")
        for key in ("utterance", "context", "marker", "response"):
            if isinstance(item.get(key), str) and (HOWTO.search(item[key]) or STEPS.search(item[key])):
                fail(errors, label, f"trainer[{i}].{key} reads as an operational script")
        if not isinstance(item.get("benign"), bool):
            fail(errors, label, f"trainer[{i}].benign must be true or false")
        item.setdefault("context", "")
    if len(items) < 2 or not any(i.get("benign") is False for i in items) \
            or not any(i.get("benign") is True for i in items):
        fail(errors, label, "trainer needs >= 2 items: one benign = false and one benign contrast")
    e["trainer"] = items
    e["family"] = fam["slug"]
    e["path"] = f"{SECTION}/{fam['slug']}/{e['slug']}.md"
    return e


def validate_edges(entries: list, errors: list, partial: bool, warnings: list) -> None:
    by_slug = {e["slug"]: e for e in entries}
    for e in entries:
        label = f"data/nlp/{e['family']}.toml [{e['slug']}]"
        missing = [s for s in [e["broader"], *e["related"]] if s and s not in by_slug]
        for s in missing:
            (warnings if partial else errors).append(f"{label}: unknown entry '{s}'")
        if e["slug"] in e["related"] or e["broader"] == e["slug"]:
            fail(errors, label, "links to itself")
        for path in e["kompendium"]:
            if path.startswith(SECTION + "/") or not path.endswith(".md"):
                fail(errors, label, f"kompendium path '{path}' must be a book page outside the section")
            elif not (CONTENT / path).exists():
                fail(errors, label, f"kompendium path '{path}' does not exist")
        seen, cur = set(), e
        while cur and cur["broader"]:
            if cur["slug"] in seen:
                fail(errors, label, "cycle in 'broader'")
                break
            seen.add(cur["slug"])
            cur = by_slug.get(cur["broader"])


# --- pages -----------------------------------------------------------------------------------

def split_page(text: str) -> tuple:
    """(front matter dict, prose) of a page; derived parts removed."""
    m = TOML_FM.match(text)
    front, body = {}, text
    if m:
        try:
            front = tomllib.loads(m.group(1))
        except tomllib.TOMLDecodeError:
            front = {}
        body = text[m.end():]
    body = HEAD_BLOCK.sub("", body)
    body = BLOCK.sub("", body)
    body = H1.sub("", body, count=1)
    return front, body.strip("\n")


def toml_value(value) -> str:
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, int):
        return str(value)
    if isinstance(value, list):
        return "[" + ", ".join(toml_value(v) for v in value) + "]"
    return json.dumps(str(value), ensure_ascii=False)


def render_front(top: list, tables: list) -> str:
    lines = ["+++"] + [f"{k} = {toml_value(v)}" for k, v in top]
    for name, pairs in tables:
        lines += ["", f"[{name}]"] + [f"{k} = {toml_value(v)}" for k, v in pairs]
    return "\n".join(lines + ["+++", ""])


def link(path: str) -> str:
    return f"@/{path}"


def cited(prose: str, sources: dict) -> list:
    return sorted({k for k, s in sources.items() if s["re"].search(prose)},
                  key=lambda k: sources[k]["entry"])


def literature(keys: list, sources: dict) -> list:
    if not keys:
        return []
    return ["## Literatura", ""] + [f"- {sources[k]['entry']}" for k in keys] + [""]


def page_title(path: str) -> str:
    text = (CONTENT / path).read_text(encoding="utf-8")
    m = TOML_FM.match(text)
    if m:
        try:
            title = tomllib.loads(m.group(1)).get("title")
            if title:
                return str(title)
        except tomllib.TOMLDecodeError:
            pass
    return path


def family_index(slug: str) -> str:
    return f"{SECTION}/{slug}/_index.md"


def entry_page(ctx: dict, e: dict, prose: str, description: str) -> str:
    fam = ctx["families"][e["family"]]
    by_slug = ctx["by_slug"]
    sources = ctx["sources"]
    keys = cited(prose, sources)
    tags = ["nlp", f"nlp-{e['family']}", f"nlp-{TYPES[e['type']]}", f"nlp-uziti-{e['use']}"]
    meta = entry_meta(ctx, e, prose, keys)
    front = render_front(
        [("title", e["cs"]), ("description", description), ("weight", int(e["id"][-2:])),
         ("insert_anchor_links", "right")],
        [("taxonomies", [("tags", tags), ("categories", ["academic"])]),
         ("extra", [("toc", True),
                    ("risk_level", RISK_LEVEL[e["risk"]]), ("lang", "cs"),
                    ("keywords", meta["keywords"]), ("schema_type", "DefinedTerm")]
          + [(f"nlp_{k}", v) for k, v in meta["fields"] if k not in EXPORT_ONLY])])
    broader = by_slug.get(e["broader"])
    rows = [
        ("Identifikátor", f"`{e['id']}`"),
        ("Rodina", f"[{fam['title']}]({link(family_index(e['family']))})"),
        ("Druh", TYPES[e["type"]]),
        ("Anglicky", e["en"]),
    ]
    if e["aliases"]:
        rows.append(("Jiné názvy", ", ".join(e["aliases"])))
    if broader:
        rows.append(("Obecnější vzorec", f"[{broader['cs']}]({link(broader['path'])})"))
    rows += [
        ("Užití", USES[e["use"]]),
        ("Riziko zneužití", RISKS[e["risk"]]),
        ("Vazba na Vaknin 2008", VAKNIN[e["vaknin"]]),
        ("Stav textu", REVIEW[e["review"]]),
    ]
    head = [HEAD_BEGIN, "", "| Pole | Hodnota |", "|------|---------|"]
    head += [f"| **{k}** | {v} |" for k, v in rows] + ["", HEAD_END]

    lines = [BEGIN, ""] + literature(keys, sources) + ["## Související", ""]
    lines += ["**Rodina a hierarchie**", "",
              f"- [{fam['title']}]({link(family_index(e['family']))}) – rodina, do níž "
              "vzorec patří, s přehledem všech jejích vzorců"]
    if broader:
        lines.append(f"- [{broader['cs']}]({link(broader['path'])}) – obecnější vzorec, "
                     "jehož je tento vzorec zvláštním případem")
    for n in ctx["narrower"].get(e["slug"], []):
        lines.append(f"- [{n['cs']}]({link(n['path'])}) – zvláštní případ tohoto vzorce")
    related = ctx["related"].get(e["slug"], [])
    if related:
        lines += ["", "**Příbuzné vzorce**", ""]
        for r in related:
            other = ctx["families"][r["family"]]["title"]
            lines.append(f"- [{r['cs']}]({link(r['path'])}) – příbuzný vzorec ({other}, "
                         f"{r['en']})")
    lines += ["", "**V kompendiu**", ""]
    for path in e["kompendium"]:
        lines.append(f"- [{ctx['titles'][path]}]({link(path)}) – stránka knihy, na které se "
                     "tento vzorec projevuje nebo s ní souvisí")
    siblings = ctx["families"][e["family"]]["entries"]
    i = siblings.index(e)
    lines += ["", "**V katalogu**", ""]
    if i > 0:
        p = siblings[i - 1]
        lines.append(f"- [{p['cs']}]({link(p['path'])}) – předchozí vzorec rodiny")
    if i + 1 < len(siblings):
        n = siblings[i + 1]
        lines.append(f"- [{n['cs']}]({link(n['path'])}) – další vzorec rodiny")
    lines.append(f"- [Trenér rozpoznávání NLP vzorců]({link(TRAINER_PAGE)}) – procvičení "
                 "rozpoznání tohoto vzorce na příkladech výroků")
    lines += ["", END]
    return (front + "\n" + f"# {e['cs']}\n\n" + "\n".join(head) + "\n\n" + prose.strip()
            + "\n\n" + "\n".join(lines) + "\n")


RISK_LEVEL = {"nizke": "low", "stredni": "moderate", "vysoke": "high"}
# Counts that change with every edit of the prose live in the export only: the front-matter
# schema of the book refuses word counts and reading times in pages (content-gates).
EXPORT_ONLY = {"citations", "words", "reading_minutes"}
SCHEMA = 1


def entry_meta(ctx: dict, e: dict, prose: str, keys: list) -> dict:
    """Every derivable fact about an entry, for the front matter and the catalogue export.
    Nothing here is written by hand: it all follows from the catalogue, the bibliography and
    the page's prose, so it is rewritten on every run and checked by --check."""
    fam = ctx["families"][e["family"]]
    sources = ctx["sources"]
    siblings = fam["entries"]
    i = siblings.index(e)
    depth, cur = 0, e
    while cur and cur["broader"] and cur["broader"] in ctx["by_slug"] and depth < 20:
        depth += 1
        cur = ctx["by_slug"][cur["broader"]]
    by_group = {g: [k for k in keys if sources[k]["group"] == g]
                for g in ("primary", "roots", "critical")}
    citations = sum(len(s["re"].findall(prose)) for s in sources.values())
    n_words = words(prose)
    links = sorted(set(re.findall(r"\]\(@/([^)#\s]+\.md)", prose)))
    keywords = [e["cs"], e["en"], *e["aliases"], fam["title"], "NLP",
                "neurolingvistické programování"]
    fields = [
        ("schema", SCHEMA), ("id", e["id"]), ("slug", e["slug"]), ("family", e["family"]),
        ("family_code", fam["code"]), ("family_title", fam["title"]), ("family_en", fam["en"]),
        ("part", e["part"]), ("type", e["type"]), ("type_cs", TYPES[e["type"]]),
        ("en", e["en"]), ("aliases", e["aliases"]), ("use", e["use"]), ("use_cs", USES[e["use"]]),
        ("risk", e["risk"]), ("risk_cs", RISKS[e["risk"]]), ("broader", e["broader"]),
        ("narrower", [n["slug"] for n in ctx["narrower"].get(e["slug"], [])]),
        ("depth", depth), ("ancestors", ancestors(ctx, e)),
        ("related", [r["slug"] for r in ctx["related"].get(e["slug"], [])]),
        ("related_declared", e["related"]), ("kompendium", e["kompendium"]),
        ("links_prose", links), ("prev", siblings[i - 1]["slug"] if i > 0 else ""),
        ("next", siblings[i + 1]["slug"] if i + 1 < len(siblings) else ""),
        ("position", i + 1), ("family_size", len(siblings)),
        ("sources", keys), ("sources_primary", by_group["primary"]),
        ("sources_roots", by_group["roots"]), ("sources_critical", by_group["critical"]),
        ("citations", citations), ("words", n_words),
        ("reading_minutes", max(1, round(n_words / 200))),
        ("sections", [h for h, _ in sections_of(prose)]),
        ("trainer_items", len(e["trainer"])),
        ("trainer_benign", sum(1 for x in e["trainer"] if x["benign"])),
        ("vaknin", e["vaknin"]), ("review", e["review"]),
        ("catalogue", f"data/nlp/{e['part']}.toml"),
    ]
    return {"fields": fields, "keywords": list(dict.fromkeys(keywords))}


def ancestors(ctx: dict, e: dict) -> list:
    out, cur = [], e
    while cur and cur["broader"] and cur["broader"] in ctx["by_slug"] and len(out) < 20:
        out.append(cur["broader"])
        cur = ctx["by_slug"][cur["broader"]]
    return out


def family_page(ctx: dict, fam: dict, prose: str, description: str) -> str:
    sources = ctx["sources"]
    keys = cited(prose, sources)
    front = render_front(
        [("title", fam["title"]), ("description", description),
         ("weight", int(fam["code"])), ("sort_by", "weight"),
         ("template", "kompendium/section.html"), ("page_template", "kompendium/page.html"),
         ("insert_anchor_links", "right")],
        [("extra", [("tags", ["nlp", f"nlp-{fam['slug']}"]), ("categories", ["academic"]),
                    ("toc", True), ("lang", "cs"),
                    ("keywords", [fam["title"], fam["en"], "NLP"]),
                    ("schema_type", "DefinedTermSet"), ("nlp_schema", SCHEMA),
                    ("nlp_family", fam["slug"]), ("nlp_code", fam["code"]),
                    ("nlp_en", fam["en"]), ("nlp_size", len(fam["entries"])),
                    ("nlp_members", [x["slug"] for x in fam["entries"]]),
                    ("nlp_types", sorted({x["type"] for x in fam["entries"]})),
                    ("nlp_sources", keys)])])
    lines = [BEGIN, "", "## Vzorce rodiny", "",
             "| Kód | Vzorec | Anglicky | Druh | Užití | Riziko |",
             "|-----|--------|----------|------|-------|--------|"]
    for e in fam["entries"]:
        lines.append(f"| `{e['id']}` | [{e['cs']}]({link(e['path'])}) | {e['en']} | "
                     f"{TYPES[e['type']]} | {USES[e['use']]} | {RISKS[e['risk']]} |")
    lines += [""] + literature(keys, sources) + ["## Související", ""]
    lines.append(f"- [NLP vzorce]({link(SECTION + '/_index.md')}) – celý katalog a jeho "
                 "rodiny")
    order = ctx["family_order"]
    i = order.index(fam["slug"])
    for j, why in ((i - 1, "předchozí rodina katalogu"), (i + 1, "další rodina katalogu")):
        if 0 <= j < len(order) and ctx["families"][order[j]]["entries"]:
            other = ctx["families"][order[j]]
            lines.append(f"- [{other['title']}]({link(family_index(other['slug']))}) – {why}")
    lines.append(f"- [Trenér rozpoznávání NLP vzorců]({link(TRAINER_PAGE)}) – procvičení "
                 "rozpoznání vzorců této rodiny")
    lines += ["", END]
    return (front + "\n" + f"# {fam['title']}\n\n" + prose.strip() + "\n\n"
            + "\n".join(lines) + "\n")


def section_page(ctx: dict, prose: str, description: str, title: str) -> str:
    sources = ctx["sources"]
    keys = cited(prose, sources)
    front = render_front(
        [("title", title), ("description", description), ("weight", 105),
         ("sort_by", "weight"), ("template", "kompendium/section.html"),
         ("page_template", "kompendium/page.html"), ("insert_anchor_links", "right")],
        [("extra", [("tags", ["nlp", "kompendium"]), ("categories", ["academic", "reference"]),
                    ("section_icon", "🗣️"), ("toc", True),
                    ("nlp_sources", keys)])])
    entries = ctx["entries"]
    by_type = collections.Counter(TYPES[e["type"]] for e in entries)
    lines = [BEGIN, "", "## Rodiny katalogu", "",
             "| Kód | Rodina | Anglicky | Hesel |", "|-----|--------|----------|-------|"]
    for slug in ctx["family_order"]:
        fam = ctx["families"][slug]
        if fam["entries"]:
            lines.append(f"| `NLP-{fam['code']}` | [{fam['title']}]"
                         f"({link(family_index(slug))}) | {fam['en']} | {len(fam['entries'])} |")
    lines += ["", f"Katalog má {len(entries)} hesel: "
              + ", ".join(f"{n} × {t}" for t, n in sorted(by_type.items())) + "."
              + " Čísla odvozuje scripts/nlp-catalog.py z katalogu při každém sestavení.", ""]
    lines += literature(keys, sources) + ["## Související", ""]
    lines.append(f"- [Trenér rozpoznávání NLP vzorců]({link(TRAINER_PAGE)}) – interaktivní "
                 "procvičení rozpoznání vzorců na příkladech výroků")
    lines.append(f"- [Kompendium]({link('kompendium/_index.md')}) – celá kniha, do níž "
                 "katalog patří")
    lines += ["", END]
    return (front + "\n" + f"# {title}\n\n" + prose.strip() + "\n\n" + "\n".join(lines) + "\n")


def trainer_page(ctx: dict, prose: str, description: str, title: str) -> str:
    front = render_front(
        [("title", title), ("description", description), ("weight", 999),
         ("template", "kompendium/nlp-trener.html")],
        [("taxonomies", [("tags", ["nlp", "nlp-trener"]), ("categories", ["academic"])]),
         ("extra", [("toc", False)])])
    lines = [BEGIN, "", "## Související", "",
             f"- [NLP vzorce]({link(SECTION + '/_index.md')}) – katalog, z něhož trenér "
             "bere vzorce i příklady"]
    for slug in ctx["family_order"]:
        fam = ctx["families"][slug]
        if fam["entries"]:
            lines.append(f"- [{fam['title']}]({link(family_index(slug))}) – rodina, "
                         f"{len(fam['entries'])} hesel")
    lines += ["", END]
    return (front + "\n" + f"# {title}\n\n" + prose.strip() + "\n\n" + "\n".join(lines) + "\n")


def catalogue_data(ctx: dict, prose_of: dict, desc_of: dict) -> str:
    sources = ctx["sources"]
    entries, edges, used = [], [], set()
    for e in ctx["entries"]:
        prose = prose_of.get(e["path"], "")
        keys = cited(prose, sources)
        used |= set(keys)
        meta = entry_meta(ctx, e, prose, keys)
        record = dict(meta["fields"])
        record.update({"cs": e["cs"], "description": desc_of.get(e["path"], ""),
                       "keywords": meta["keywords"], "path": "content/" + e["path"],
                       "url": e["path"][:-3] + "/", "trainer": e["trainer"]})
        entries.append(record)
        if e["broader"]:
            edges.append({"from": e["slug"], "to": e["broader"], "type": "broader"})
        for r in e["related"]:
            edges.append({"from": e["slug"], "to": r, "type": "related"})
        for k in e["kompendium"]:
            edges.append({"from": e["slug"], "to": k, "type": "kompendium"})
        for link in record["links_prose"]:
            edges.append({"from": e["slug"], "to": link, "type": "prose"})
    families = [{"slug": s, "code": ctx["families"][s]["code"],
                 "title": ctx["families"][s]["title"], "en": ctx["families"][s]["en"],
                 "url": f"{SECTION}/{s}/",
                 "members": [x["slug"] for x in ctx["families"][s]["entries"]]}
                for s in ctx["family_order"]]
    works = {k: {"cite": sources[k]["cite"], "entry": sources[k]["entry"],
                 "group": sources[k]["group"]} for k in sorted(used)}
    data = {"schema": SCHEMA, "source": "data/nlp (scripts/nlp-catalog.py)",
            "note": "Derived, never edited by hand; the front matter of every page carries the "
                    "same fields under [extra] nlp_*.",
            "families": families, "entries": entries, "edges": edges, "sources": works}
    return json.dumps(data, ensure_ascii=False, indent=1, sort_keys=True) + "\n"


def trainer_data(ctx: dict) -> str:
    patterns, items = [], []
    for e in ctx["entries"]:
        patterns.append({
            "id": e["id"], "slug": e["slug"], "cs": e["cs"], "en": e["en"],
            "aliases": e["aliases"], "family": e["family"], "type": e["type"],
            "url": e["path"][:-3] + "/",
        })
        for n, item in enumerate(e["trainer"], 1):
            items.append({
                "id": f"{e['id']}-{n}", "pattern": e["id"], "utterance": item["utterance"],
                "context": item["context"], "benign": item["benign"], "marker": item["marker"],
                "response": item["response"],
            })
    families = [{"slug": s, "code": ctx["families"][s]["code"],
                 "title": ctx["families"][s]["title"]} for s in ctx["family_order"]]
    data = {"schema": 1, "source": "data/nlp (scripts/nlp-catalog.py)",
            "note": "Derived, never edited by hand. Temporary home: to be folded into "
                    "scripts/build-graph.py once the trainer is merged (one data generator).",
            "families": families, "patterns": patterns, "items": items}
    return json.dumps(data, ensure_ascii=False, indent=1, sort_keys=True) + "\n"


# --- content checks --------------------------------------------------------------------------

def sections_of(prose: str) -> list:
    heads = list(H2.finditer(prose))
    out = []
    for i, m in enumerate(heads):
        end = heads[i + 1].start() if i + 1 < len(heads) else len(prose)
        out.append((m.group(1).strip(), prose[m.end():end]))
    return out


def check_citations(prose: str, sources: dict, where: str, errors: list) -> None:
    for m in PAREN.finditer(prose):
        for segment in m.group(1).split(";"):
            if YEAR.search(segment) and not any(s["re"].search(segment) for s in sources.values()):
                fail(errors, where, f"citation '({segment.strip()})' matches no work in "
                     "data/nlp/_sources.toml")
    for m in NARRATIVE.finditer(prose):
        fail(errors, where, f"narrative citation '{m.group(0)}': write (Autor Rok) as in "
             "_sources.toml cite")


def words(text: str) -> int:
    return len(WORD.findall(re.sub(r"\]\([^)]*\)|https?://\S+", "", text)))


def check_prose(prose: str, description: str, ctx: dict, where: str, errors: list,
                entry: bool, vaknin_observed: bool = False) -> None:
    sources = ctx["sources"]
    if not 50 <= len(description) <= 200:
        fail(errors, where, f"description must be 50-200 characters (has {len(description)})")
    heads = [h for h, _ in sections_of(prose)]
    for banned in ("Literatura", "Související"):
        if banned in heads:
            fail(errors, where, f"'## {banned}' is derived; do not write it")
    minimum = MIN_WORDS if entry else MIN_WORDS_INDEX
    if words(prose) < minimum:
        fail(errors, where, f"{words(prose)} words of prose; at least {minimum}")
    check_citations(prose, sources, where, errors)
    keys = cited(prose, sources)
    if len(keys) < (MIN_SOURCES if entry else 3):
        fail(errors, where, f"cites {len(keys)} distinct works; at least "
             f"{MIN_SOURCES if entry else 3}")
    for regex in (HOWTO, STEPS):
        for m in regex.finditer(prose):
            fail(errors, where, f"operational-script phrasing '{m.group(0).strip()}' "
                 "(project.content-defensive-frame)")
    if not entry:
        return
    if vaknin_observed is False and sources["vaknin-2008"]["re"].search(prose):
        fail(errors, where, "cites Vaknin 2008 although the mapping is only inferred; keep "
             "provenance out of the prose (it is in the identification table)")
    present = [h for h in heads if h in REQUIRED]
    if present != [h for h in REQUIRED if h in present] or set(present) != set(REQUIRED):
        missing = [h for h in REQUIRED if h not in present]
        fail(errors, where, f"required sections in order {REQUIRED}; missing {missing}"
             if missing else "required sections out of order")
    for head, text in sections_of(prose):
        if head in REQUIRED and not any(s["re"].search(text) for s in sources.values()):
            fail(errors, where, f"section '{head}' cites no work")
        if head == "Stav důkazů" and not any(
                s["re"].search(text) for s in sources.values() if s["group"] == "critical"):
            fail(errors, where, "section 'Stav důkazů' cites no critical work")


# --- driver ----------------------------------------------------------------------------------

def load_polish():
    spec = importlib.util.spec_from_file_location("polish", ROOT / "scripts" / "polish-markdown.py")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module.polish


def write_atomic(path: pathlib.Path, text: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    tmp = path.with_name(f".tmp.{path.name}")
    tmp.write_text(text, encoding="utf-8")
    os.replace(tmp, path)


def build_context(errors: list, warnings: list, only: str) -> dict:
    families, entries = load_catalogue(errors, only)
    validate_edges(entries, errors, bool(only), warnings)
    by_slug = {e["slug"]: e for e in entries}
    related = collections.defaultdict(set)
    narrower = collections.defaultdict(list)
    for e in entries:
        for r in e["related"]:
            if r in by_slug:
                related[e["slug"]].add(r)
                related[r].add(e["slug"])
        if e["broader"] in by_slug:
            narrower[e["broader"]].append(e)
    titles = {}
    for e in entries:
        for path in e["kompendium"]:
            if (CONTENT / path).exists():
                titles[path] = page_title(path)
    return {
        "families": {f["slug"]: f for f in families},
        "family_order": [f["slug"] for f in families],
        "entries": sorted(entries, key=lambda e: e["id"]),
        "by_slug": by_slug,
        "related": {k: sorted((by_slug[s] for s in v), key=lambda x: x["id"])
                    for k, v in related.items()},
        "narrower": {k: sorted(v, key=lambda x: x["id"]) for k, v in narrower.items()},
        "titles": titles,
        "sources": load_sources(),
    }


def main() -> int:
    args = sys.argv[1:]
    if any(a in ("-h", "--help") for a in args):
        print(__doc__.strip())
        return 0
    known = {"--check", "--family", "--part", "--stats"}
    unknown = [a for a in args if a.startswith("-") and a not in known]
    if unknown:
        print(f"nlp-catalog: unknown option {unknown[0]}; see --help", file=sys.stderr)
        return 2
    check = "--check" in args
    only = args[args.index("--family") + 1] if "--family" in args else ""
    part = args[args.index("--part") + 1] if "--part" in args else ""
    if part and not only:
        only = part.split(".", 1)[0]
    errors, warnings = [], []
    ctx = build_context(errors, warnings, only)
    if only and only not in ctx["families"]:
        print(f"nlp-catalog: unknown family '{only}'", file=sys.stderr)
        return 2
    if "--stats" in args:
        for slug in ctx["family_order"]:
            fam = ctx["families"][slug]
            print(f"NLP-{fam['code']} {slug}: {len(fam['entries'])}")
        for field in ("type", "use", "risk", "review", "vaknin"):
            print(field, dict(collections.Counter(e[field] for e in ctx["entries"])))
        print("total", len(ctx["entries"]))
        return 0
    polish = load_polish()
    planned = {}  # path relative to content -> new text
    prose_of, desc_of = {}, {}

    for slug in ctx["family_order"]:
        if only and slug != only:
            continue
        fam = ctx["families"][slug]
        idx = family_index(slug)
        file = CONTENT / idx
        if part and part != slug:
            pass
        elif not file.exists():
            fail(errors, f"content/{idx}", "family index missing")
        else:
            front, prose = split_page(file.read_text(encoding="utf-8"))
            desc = str(front.get("description", ""))
            check_prose(prose, desc, ctx, f"content/{idx}", errors, entry=False)
            planned[idx] = family_page(ctx, fam, prose, desc)
        for e in fam["entries"]:
            if part and e["part"] != part:
                continue
            file = CONTENT / e["path"]
            if not file.exists():
                fail(errors, f"content/{e['path']}", f"page of {e['id']} missing")
                continue
            front, prose = split_page(file.read_text(encoding="utf-8"))
            desc = str(front.get("description", ""))
            check_prose(prose, desc, ctx, f"content/{e['path']}", errors, entry=True,
                        vaknin_observed=e["vaknin"] == "observed")
            prose_of[e["path"]], desc_of[e["path"]] = prose, desc
            planned[e["path"]] = entry_page(ctx, e, prose, desc)

    known_pages = {e["path"] for e in ctx["entries"]} | {
        family_index(s) for s in ctx["family_order"]} | {f"{SECTION}/_index.md", TRAINER_PAGE}
    for file in sorted(SECTION_DIR.rglob("*.md")) if SECTION_DIR.exists() else []:
        rel = file.relative_to(CONTENT).as_posix()
        if only and not rel.startswith(f"{SECTION}/{only}/"):
            continue
        if rel not in known_pages:
            (warnings if only else errors).append(
                f"content/{rel}: page without a catalogue entry (bijection)")

    if not only:
        for rel, builder in ((f"{SECTION}/_index.md", section_page), (TRAINER_PAGE, trainer_page)):
            file = CONTENT / rel
            if not file.exists():
                fail(errors, f"content/{rel}", "missing")
                continue
            front, prose = split_page(file.read_text(encoding="utf-8"))
            desc = str(front.get("description", ""))
            title = str(front.get("title", ""))
            if rel.endswith("_index.md"):
                check_prose(prose, desc, ctx, f"content/{rel}", errors, entry=False)
            planned[rel] = builder(ctx, prose, desc, title)

    stale = []
    for rel, text in sorted(planned.items()):
        text = polish(text)
        file = CONTENT / rel
        if file.read_text(encoding="utf-8") != text:
            stale.append(f"content/{rel}")
            if not check:
                write_atomic(file, text)
    if not only:
        for target, data in ((TRAINER_JSON, trainer_data(ctx)),
                             (CATALOGUE_JSON, catalogue_data(ctx, prose_of, desc_of))):
            current = target.read_text(encoding="utf-8") if target.exists() else ""
            if current != data:
                stale.append(target.relative_to(ROOT).as_posix())
                if not check:
                    write_atomic(target, data)

    for w in warnings:
        print(f"nlp-catalog: warning: {w}")
    if check:
        errors += [f"{p}: derived parts are stale; run scripts/nlp-catalog.py" for p in stale]
    scope = f"family {only}" if only else f"{len(ctx['family_order'])} families"
    verb = "stale" if check else "updated"
    print(f"nlp-catalog: {len(ctx['entries'])} entries in {scope}; {len(stale)} file(s) {verb}; "
          f"{len(errors)} error(s)")
    for err in errors[:200]:
        print(f"  {err}")
    if len(errors) > 200:
        print(f"  … and {len(errors) - 200} more")
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
