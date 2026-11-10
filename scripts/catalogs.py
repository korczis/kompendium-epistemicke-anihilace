#!/usr/bin/env python3
"""The book's catalogues: one engine derives every catalogue's pages and gates them.

Rule project.content-catalogs. The declaration data/catalogs.toml lists the catalogues
(NLP patterns, fallacies of argument, …): each names its data directory, its section, its
vocabularies, its required sections and its exports. One bibliography serves them all:
data/sources.toml. Per catalogue:

  <dir>/_families.toml      the families (order, immutable two-digit code, titles)
  <dir>/<family>.toml       the family's entries ([[pattern]]: id, slug, type, names, edges,
                            links into the book, review state, trainer items); a large family
                            may add parts <dir>/<family>.<part>.toml, read in name order

Writers own the prose of each page (from `## Definice` on) and its `description`. The engine
owns everything derivable and rewrites it on every run:

  - the front matter: title, weight, tags, [extra] `catalog` and every `catalog_*` field
    (identity, family, type, use, risk, hierarchy, mirrored relations, cited works, sections,
    trainer, provenance, review, data file); `description` is kept;
  - the H1 and the identification table under it (block kompendium:katalog-hlavicka);
  - the closing block (kompendium:katalog-vazby): `## Literatura` (exactly the works the prose
    cites) and `## Související`; on family and section indexes also the member tables;
  - per catalogue its export (<slug>-katalog.json) and trainer data (<slug>-trener.json), and
    the index of all catalogues (static/data/katalogy.json) that the one trainer and the
    explorers read; the trainer page itself (kompendium/trener.md).

An entry with `canonical = "<path>"` is a term the book already has a page for (a glossary
entry, a technique): it gets no page of its own – no duplicate – and the catalogue, its
exports, the explorer and the trainer link the canonical page. Slugs are unique across all
catalogues, so `related` and `broader` may cross catalogues.

--check fails (exit 1) on any of:
  catalogue   unknown or malformed field, duplicate id/slug, id not <PREFIX>-<code>.NN,
              unknown broader/related slug, cycle in broader, unknown, catalogue-internal or
              missing `kompendium`/`canonical` path, fewer than two trainer items or no benign
              contrast item, a trainer item that reads as an operational script
  bijection   an own entry without its page, a page in a section without an entry, a page
              of its own for a canonical entry
  structure   missing or misordered required section, a writer-written Literatura/Související,
              fewer than MIN_WORDS words of prose, description outside 50-200 characters
  citations   a parenthetical citation that matches no vetted work (fabrication guard), a
              narrative "Surname (Year)" citation, a required section without a citation,
              fewer than MIN_SOURCES distinct works, the evidence section without a critical
              work, a citation of the unverified provenance source on an entry page
  frame       phrasing of an operational script (numbered steps; imperatives aimed at a
              target person – lexicon HOWTO in ia_model.py, rule project.content-defensive-frame)
  freshness   any derived part (front matter, blocks, exports, trainer) differs from what the
              engine would write now
  exclusions  a line of the declaration, the bibliography, a catalogue's data or a catalogue
              page that matches data/platform-exclusions.toml (excluded platform material or a
              refused marker; ADR 0005), or that file missing or malformed

Usage:
  scripts/catalogs.py                          write every derived part of every catalogue
  scripts/catalogs.py --check                  the gate (CI, verify-all, verify-content)
  scripts/catalogs.py --catalog <slug>         one catalogue only
  scripts/catalogs.py --family <slug>          one family only (links into families not yet
                                               written are reported, not failed)
  scripts/catalogs.py --part <file stem>       only the entries of one data file (e.g.
                                               milton-model.b); the family index belongs to
                                               the part named like the family
  scripts/catalogs.py --stats                  counts per catalogue, family, type, use, risk
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
DECLARATION = ROOT / "data" / "catalogs.toml"
SOURCES = ROOT / "data" / "sources.toml"
EXCLUSIONS = ROOT / "data" / "platform-exclusions.toml"
EXCLUSIONS_SCHEMA = "kompendium-platform-exclusions/v1"
SCHEMA = 1

MIN_WORDS = 1150        # prose only; the IA gate counts the whole page against 1100
MIN_WORDS_INDEX = 1150  # family indexes are link targets of every entry
MIN_SOURCES = 4
MAX_RELATED = 8
REVIEW = {"agent": "text čeká na odbornou recenzi", "owner": "zrecenzováno autorem"}
ENTRY_KEYS = {"id", "slug", "type", "cs", "en", "aliases", "use", "risk", "broader",
              "related", "kompendium", "canonical", "review", "trainer"}
TRAINER_KEYS = {"utterance", "context", "benign", "marker", "response"}
RISK_LEVEL = {"nizke": "low", "stredni": "moderate", "vysoke": "high"}
# Counts that change with every edit of the prose live in the exports only: the book's
# front-matter schema refuses word counts and reading times in pages.
EXPORT_ONLY = {"citations", "words", "reading_minutes"}

HEAD_BEGIN = "<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->"
HEAD_END = "<!-- kompendium:katalog-hlavicka:end -->"
BEGIN = "<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->"
END = "<!-- kompendium:katalog-vazby:end -->"
# Blocks of every generation of the engine are removed before a page is rewritten.
HEAD_BLOCK = re.compile(r"<!-- kompendium:(?:katalog|nlp)-hlavicka:begin.*?"
                        r"<!-- kompendium:(?:katalog|nlp)-hlavicka:end -->", re.S)
BLOCK = re.compile(r"<!-- kompendium:(?:katalog|nlp)-vazby:begin.*?"
                   r"<!-- kompendium:(?:katalog|nlp)-vazby:end -->", re.S)
TOML_FM = re.compile(r"\A\+\+\+\n(.*?)\n\+\+\+\n", re.S)
H1 = re.compile(r"\A\s*# [^\n]*\n")
H2 = re.compile(r"^## +(.+?)\s*$", re.M)
WORD = re.compile(r"[A-Za-zÀ-ž]+")
SLUG = re.compile(r"^[a-z0-9]+(?:-[a-z0-9]+)*$")
PAREN = re.compile(r"\(([^()\n]*)\)")
YEAR = re.compile(r"\b(?:1[6-9]|20)\d{2}[a-z]?\b")
NARRATIVE = re.compile(r"\b[A-ZÁČĎÉĚÍŇÓŘŠŤÚŮÝŽ][a-záčďéěíňóřšťúůýž'’-]+\s+\((?:1[6-9]|20)\d{2}[a-z]?\)")
# Catalogue pages describe structure, never a procedure: on top of the book-wide HOWTO lexicon
# they carry no numbered steps of a procedure.
STEPS = re.compile(r"^\s*(?:\d+[.)]|[-*])\s+(?:\*\*)?(?:Krok|Step)\b|\b(?:[Kk]rok|[Ss]tep)\s+\d+\s*[:.)]",
                   re.M)
sys.path.insert(0, str(ROOT / "scripts"))
from ia_model import HOWTO, url_of  # noqa: E402


def fail(errors: list, where: str, message: str) -> None:
    errors.append(f"{where}: {message}")


# --- platform exclusions (data/platform-exclusions.toml; ADR 0005) ---------------------------

def load_exclusions(errors: list) -> list:
    """The refusal list as (kind, class, because, compiled pattern) rules.

    A missing file, a wrong schema, a rule without `because` or `match`, or a pattern that does
    not compile is itself an error: the importer must never run without its refusal list.
    """
    where = "data/platform-exclusions.toml"
    if not EXCLUSIONS.exists():
        fail(errors, where, "missing: the catalogue engine refuses to run without its exclusions")
        return []
    raw = load_toml(EXCLUSIONS)
    if raw.get("schema") != EXCLUSIONS_SCHEMA:
        fail(errors, where, f"schema must be {EXCLUSIONS_SCHEMA!r}")
    rules = []
    for kind in ("exclude", "refuse_marker"):
        for i, rule in enumerate(raw.get(kind, [])):
            label = rule.get("class") or f"{kind}[{i}]"
            unknown = set(rule) - {"class", "because", "match"}
            if unknown:
                fail(errors, where, f"{label}: unknown field(s) {sorted(unknown)}")
            if not rule.get("because") or not rule.get("match"):
                fail(errors, where, f"{label}: needs `because` and a non-empty `match`")
                continue
            for pattern in rule["match"]:
                try:
                    rules.append((kind, label, rule["because"], re.compile(pattern, re.I)))
                except re.error as exc:
                    fail(errors, where, f"{label}: pattern {pattern!r} does not compile ({exc})")
    return rules


def check_exclusions(cats: list, errors: list) -> None:
    """Refuse excluded platform material anywhere a catalogue can carry it.

    Scanned: the declaration, the shared bibliography, every catalogue's data directory and
    every page of its section. One error per refused line.
    """
    rules = load_exclusions(errors)
    if not rules:
        return
    files = [DECLARATION, SOURCES]
    for cat in cats:
        if cat.data.exists():
            files += sorted(p for p in cat.data.rglob("*") if p.is_file())
        if cat.section_dir.exists():
            files += sorted(cat.section_dir.rglob("*.md"))
    for path in dict.fromkeys(files):
        if not path.exists() or path == EXCLUSIONS:
            continue
        rel = path.relative_to(ROOT).as_posix()
        for no, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
            for kind, label, because, pattern in rules:
                if pattern.search(line):
                    what = "excluded platform material" if kind == "exclude" else "refused marker"
                    fail(errors, f"{rel}:{no}", f"{what} ({label}): {because}")


def load_toml(path: pathlib.Path) -> dict:
    with path.open("rb") as handle:
        return tomllib.load(handle)


# --- declaration -----------------------------------------------------------------------------

class Catalog:
    """One block of data/catalogs.toml."""

    FIELDS = {"slug", "dir", "section", "title", "en", "id_prefix", "tag", "icon", "weight",
              "noun", "noun_plural", "required", "evidence", "export", "trainer_data",
              "types", "uses", "risks", "provenance"}

    def __init__(self, raw: dict, errors: list):
        for key in sorted(set(raw) - self.FIELDS):
            fail(errors, "data/catalogs.toml", f"catalogue {raw.get('slug')}: unknown field '{key}'")
        self.__dict__.update(raw)
        self.provenance = raw.get("provenance") or {}
        self.data = ROOT / self.dir
        self.section_dir = CONTENT / self.section
        self.families = []
        self.entries = []

    def family_index(self, slug: str) -> str:
        return f"{self.section}/{slug}/_index.md"

    @property
    def index(self) -> str:
        return f"{self.section}/_index.md"


def load_declaration(errors: list) -> tuple:
    decl = load_toml(DECLARATION)
    cats = [Catalog(raw, errors) for raw in decl.get("catalog", [])]
    slugs = [c.slug for c in cats]
    if len(slugs) != len(set(slugs)):
        fail(errors, "data/catalogs.toml", "duplicate catalogue slug")
    return decl, cats


def load_sources() -> dict:
    sources = load_toml(SOURCES)
    for key, src in sources.items():
        words = [re.escape(w) for w in src["cite"].split()]
        src["re"] = re.compile(r"(?<![\w-])" + r"\s+".join(words) + r"(?![0-9a-z])")
        src["key"] = key
    return sources


# --- catalogue data --------------------------------------------------------------------------

def load_catalogue(cat: Catalog, errors: list, partial: bool, seen: dict) -> None:
    meta = load_toml(cat.data / "_families.toml")
    codes = set()
    for fam in meta.get("family", []):
        where = f"{cat.dir}/_families.toml"
        if not SLUG.match(fam.get("slug", "")) or not re.match(r"^\d{2}$", fam.get("code", "")):
            fail(errors, where, f"malformed family {fam}")
            continue
        if fam["code"] in codes:
            fail(errors, where, f"duplicate code {fam['code']}")
        if fam["slug"] in seen["family"]:
            fail(errors, where, f"family slug '{fam['slug']}' is used by another catalogue")
        codes.add(fam["code"])
        seen["family"].add(fam["slug"])
        fam["catalog"] = cat
        fam["entries"] = []
        cat.families.append(fam)
    for fam in cat.families:
        main = cat.data / f"{fam['slug']}.toml"
        parts = ([main] if main.exists() else []) + sorted(
            p for p in cat.data.glob(f"{fam['slug']}.*.toml") if SLUG.match(p.stem.split(".", 1)[1]))
        if not main.exists() and not partial:
            fail(errors, f"{cat.dir}/{fam['slug']}.toml", "missing: every family needs its entries")
        for path in parts:
            where = f"{cat.dir}/{path.name}"
            try:
                data = load_toml(path)
            except tomllib.TOMLDecodeError as exc:
                fail(errors, where, f"TOML: {exc}")
                continue
            for raw in data.get("pattern", []):
                e = validate_entry(cat, raw, fam, where, errors)
                e["part"] = path.stem
                for key, label in (("id", "id"), ("slug", "slug")):
                    if e[key] in seen[key]:
                        fail(errors, where, f"duplicate {label} {e[key]}")
                    seen[key].add(e[key])
                fam["entries"].append(e)
                cat.entries.append(e)
        if not fam["entries"] and not partial:
            fail(errors, f"{cat.dir}/{fam['slug']}.toml", "no [[pattern]] entries")
        fam["entries"].sort(key=lambda x: x["id"])
    cat.entries.sort(key=lambda x: x["id"])


def validate_entry(cat: Catalog, raw: dict, fam: dict, where: str, errors: list) -> dict:
    e = dict(raw)
    label = f"{where} [{e.get('slug', '?')}]"
    allowed = ENTRY_KEYS | ({cat.provenance["field"]} if cat.provenance else set())
    for key in sorted(set(e) - allowed):
        fail(errors, label, f"unknown field '{key}'")
    defaults = {"aliases": [], "broader": "", "related": [], "kompendium": [],
                "canonical": "", "review": "agent", "trainer": []}
    if cat.provenance:
        defaults[cat.provenance["field"]] = "inferred"
    for key, value in defaults.items():
        e.setdefault(key, value)
    for key in ("id", "slug", "type", "cs", "en", "use", "risk"):
        if not isinstance(e.get(key), str) or not e.get(key).strip():
            fail(errors, label, f"'{key}' must be a non-empty string")
            e[key] = str(e.get(key, ""))
    if not re.match(rf"^{cat.id_prefix}-{fam['code']}\.\d{{2}}$", e["id"]):
        fail(errors, label, f"id '{e['id']}' must be {cat.id_prefix}-{fam['code']}.NN")
    if not SLUG.match(e["slug"]):
        fail(errors, label, "slug must be lowercase ASCII words joined by '-'")
    vocab = [("type", cat.types), ("use", cat.uses), ("risk", cat.risks), ("review", REVIEW)]
    if cat.provenance:
        vocab.append((cat.provenance["field"], {"inferred": 1, "observed": 1}))
    for key, allowed_values in vocab:
        if e[key] not in allowed_values:
            fail(errors, label, f"{key} '{e[key]}' not in {sorted(allowed_values)}")
    for key in ("aliases", "related", "kompendium"):
        if not isinstance(e[key], list) or not all(isinstance(x, str) for x in e[key]):
            fail(errors, label, f"'{key}' must be a list of strings")
            e[key] = []
    if len(e["related"]) > MAX_RELATED:
        fail(errors, label, f"at most {MAX_RELATED} related entries")
    if not e["kompendium"] and not e["canonical"]:
        fail(errors, label, "needs at least one 'kompendium' page of the book (or a 'canonical')")
    items = e["trainer"] if isinstance(e["trainer"], list) else []
    for i, item in enumerate(items):
        for key in sorted(set(item) - TRAINER_KEYS):
            fail(errors, label, f"trainer[{i}] unknown field '{key}'")
        if not isinstance(item.get("utterance"), str) or not 20 <= len(item["utterance"]) <= 400:
            fail(errors, label, f"trainer[{i}].utterance must be 20-400 characters")
        for key in ("marker", "response"):
            if not isinstance(item.get(key), str) or len(item.get(key, "")) < 15:
                fail(errors, label, f"trainer[{i}].{key} must be at least 15 characters")
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
    e["fam"] = fam
    e["catalog"] = cat
    e["own"] = not e["canonical"]
    e["path"] = e["canonical"] or f"{cat.section}/{fam['slug']}/{e['slug']}.md"
    return e


def validate_edges(cats: list, by_slug: dict, errors: list, partial: bool, warnings: list) -> None:
    sections = [c.section + "/" for c in cats]
    for cat in cats:
        for e in cat.entries:
            label = f"{cat.dir}/{e['part']}.toml [{e['slug']}]"
            for s in [e["broader"], *e["related"]]:
                if s and s not in by_slug:
                    (warnings if partial else errors).append(f"{label}: unknown entry '{s}'")
            if e["slug"] in e["related"] or e["broader"] == e["slug"]:
                fail(errors, label, "links to itself")
            for path in e["kompendium"] + ([e["canonical"]] if e["canonical"] else []):
                if any(path.startswith(s) for s in sections) or not path.endswith(".md"):
                    fail(errors, label, f"path '{path}' must be a book page outside every catalogue")
                elif not (CONTENT / path).exists():
                    fail(errors, label, f"path '{path}' does not exist")
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


def words(text: str) -> int:
    return len(WORD.findall(re.sub(r"\]\([^)]*\)|https?://\S+", "", text)))


def sections_of(prose: str) -> list:
    heads = list(H2.finditer(prose))
    out = []
    for i, m in enumerate(heads):
        end = heads[i + 1].start() if i + 1 < len(heads) else len(prose)
        out.append((m.group(1).strip(), prose[m.end():end]))
    return out


def ancestors(ctx: dict, e: dict) -> list:
    out, cur = [], e
    while cur and cur["broader"] and cur["broader"] in ctx["by_slug"] and len(out) < 20:
        out.append(cur["broader"])
        cur = ctx["by_slug"][cur["broader"]]
    return out


def entry_meta(ctx: dict, e: dict, prose: str, keys: list) -> dict:
    """Every derivable fact about an entry, for the front matter and the exports."""
    cat, fam, sources = e["catalog"], e["fam"], ctx["sources"]
    siblings = fam["entries"]
    i = siblings.index(e)
    by_group = {g: [k for k in keys if sources[k]["group"] == g]
                for g in ("primary", "roots", "critical")}
    n_words = words(prose)
    links = sorted(set(re.findall(r"\]\(@/([^)#\s]+\.md)", prose)))
    anc = ancestors(ctx, e)
    fields = [
        ("schema", SCHEMA), ("id", e["id"]), ("slug", e["slug"]), ("family", e["family"]),
        ("family_code", fam["code"]), ("family_title", fam["title"]), ("family_en", fam["en"]),
        ("part", e["part"]), ("type", e["type"]), ("type_cs", cat.types[e["type"]]),
        ("en", e["en"]), ("aliases", e["aliases"]), ("use", e["use"]),
        ("use_cs", cat.uses[e["use"]]), ("risk", e["risk"]), ("risk_cs", cat.risks[e["risk"]]),
        ("broader", e["broader"]),
        ("narrower", [n["slug"] for n in ctx["narrower"].get(e["slug"], [])]),
        ("depth", len(anc)), ("ancestors", anc),
        ("related", [r["slug"] for r in ctx["related"].get(e["slug"], [])]),
        ("related_declared", e["related"]), ("kompendium", e["kompendium"]),
        ("canonical", e["canonical"]), ("links_prose", links),
        ("prev", siblings[i - 1]["slug"] if i > 0 else ""),
        ("next", siblings[i + 1]["slug"] if i + 1 < len(siblings) else ""),
        ("position", i + 1), ("family_size", len(siblings)),
        ("sources", keys), ("sources_primary", by_group["primary"]),
        ("sources_roots", by_group["roots"]), ("sources_critical", by_group["critical"]),
        ("citations", sum(len(s["re"].findall(prose)) for s in sources.values())),
        ("words", n_words), ("reading_minutes", max(1, round(n_words / 200))),
        ("sections", [h for h, _ in sections_of(prose)]),
        ("trainer_items", len(e["trainer"])),
        ("trainer_benign", sum(1 for x in e["trainer"] if x["benign"])),
    ]
    if cat.provenance:
        fields.append(("provenance", e[cat.provenance["field"]]))
    fields += [("review", e["review"]), ("data", f"{cat.dir}/{e['part']}.toml")]
    keywords = [e["cs"], e["en"], *e["aliases"], fam["title"], cat.title]
    return {"fields": fields, "keywords": list(dict.fromkeys(keywords))}


def trainer_link(ctx: dict, why: str) -> str:
    return f"- [Trenér rozpoznávání]({link(ctx['trainer_page'])}) – {why}"


def entry_page(ctx: dict, e: dict, prose: str, description: str) -> str:
    cat, fam, by_slug, sources = e["catalog"], e["fam"], ctx["by_slug"], ctx["sources"]
    keys = cited(prose, sources)
    tags = [cat.tag, f"{cat.tag}-{e['family']}", f"{cat.tag}-{slug_of(cat.types[e['type']])}",
            f"{cat.tag}-uziti-{e['use']}"]
    meta = entry_meta(ctx, e, prose, keys)
    front = render_front(
        [("title", e["cs"]), ("description", description), ("weight", int(e["id"][-2:])),
         ("insert_anchor_links", "right")],
        [("taxonomies", [("tags", tags), ("categories", ["academic"])]),
         ("extra", [("toc", True), ("risk_level", RISK_LEVEL[e["risk"]]), ("lang", "cs"),
                    ("keywords", meta["keywords"]), ("schema_type", "DefinedTerm"),
                    ("catalog", cat.slug)]
          + [(f"catalog_{k}", v) for k, v in meta["fields"] if k not in EXPORT_ONLY])])
    broader = by_slug.get(e["broader"])
    rows = [("Identifikátor", f"`{e['id']}`"),
            ("Katalog", f"[{cat.title}]({link(cat.index)})"),
            ("Rodina", f"[{fam['title']}]({link(cat.family_index(e['family']))})"),
            ("Druh", cat.types[e["type"]]), ("Anglicky", e["en"])]
    if e["aliases"]:
        rows.append(("Jiné názvy", ", ".join(e["aliases"])))
    if broader:
        rows.append(("Obecnější heslo", f"[{broader['cs']}]({link(broader['path'])})"))
    rows += [("Užití", cat.uses[e["use"]]), ("Riziko zneužití", cat.risks[e["risk"]])]
    if cat.provenance:
        rows.append((cat.provenance["label"], cat.provenance[e[cat.provenance["field"]]]))
    rows.append(("Stav textu", REVIEW[e["review"]]))
    head = [HEAD_BEGIN, "", "| Pole | Hodnota |", "|------|---------|"]
    head += [f"| **{k}** | {v} |" for k, v in rows] + ["", HEAD_END]

    lines = [BEGIN, ""] + literature(keys, sources) + ["## Související", ""]
    lines += ["**Rodina a hierarchie**", "",
              f"- [{fam['title']}]({link(cat.family_index(e['family']))}) – rodina, do níž "
              "heslo patří, s přehledem všech jejích hesel"]
    if broader:
        lines.append(f"- [{broader['cs']}]({link(broader['path'])}) – obecnější heslo, "
                     "jehož je toto heslo zvláštním případem")
    for n in ctx["narrower"].get(e["slug"], []):
        lines.append(f"- [{n['cs']}]({link(n['path'])}) – zvláštní případ tohoto hesla")
    related = ctx["related"].get(e["slug"], [])
    if related:
        lines += ["", "**Příbuzná hesla**", ""]
        for r in related:
            where = r["fam"]["title"] if r["catalog"] is cat else f"{r['catalog'].title}: {r['fam']['title']}"
            lines.append(f"- [{r['cs']}]({link(r['path'])}) – příbuzné heslo ({where}, {r['en']})")
    lines += ["", "**V kompendiu**", ""]
    for path in e["kompendium"]:
        lines.append(f"- [{ctx['titles'][path]}]({link(path)}) – stránka knihy, na které se "
                     "toto heslo projevuje nebo s ní souvisí")
    siblings = fam["entries"]
    i = siblings.index(e)
    lines += ["", "**V katalogu**", ""]
    if i > 0:
        p = siblings[i - 1]
        lines.append(f"- [{p['cs']}]({link(p['path'])}) – předchozí heslo rodiny")
    if i + 1 < len(siblings):
        n = siblings[i + 1]
        lines.append(f"- [{n['cs']}]({link(n['path'])}) – další heslo rodiny")
    lines.append(trainer_link(ctx, "procvičení rozpoznání tohoto hesla na příkladech výroků"))
    lines += ["", END]
    return (front + "\n" + f"# {e['cs']}\n\n" + "\n".join(head) + "\n\n" + prose.strip()
            + "\n\n" + "\n".join(lines) + "\n")


def slug_of(text: str) -> str:
    import unicodedata
    text = unicodedata.normalize("NFKD", text).encode("ascii", "ignore").decode().lower()
    return re.sub(r"[^a-z0-9]+", "-", text).strip("-")


def family_page(ctx: dict, cat: Catalog, fam: dict, prose: str, description: str) -> str:
    sources = ctx["sources"]
    keys = cited(prose, sources)
    front = render_front(
        [("title", fam["title"]), ("description", description),
         ("weight", int(fam["code"])), ("sort_by", "weight"),
         ("template", "kompendium/section.html"), ("page_template", "kompendium/page.html"),
         ("insert_anchor_links", "right")],
        [("extra", [("tags", [cat.tag, f"{cat.tag}-{fam['slug']}"]), ("categories", ["academic"]),
                    ("toc", True), ("lang", "cs"),
                    ("keywords", [fam["title"], fam["en"], cat.title]),
                    ("schema_type", "DefinedTermSet"), ("catalog", cat.slug),
                    ("catalog_schema", SCHEMA), ("catalog_export", cat.export.split("static/", 1)[1]),
                    ("catalog_family", fam["slug"]), ("catalog_code", fam["code"]),
                    ("catalog_en", fam["en"]), ("catalog_size", len(fam["entries"])),
                    ("catalog_members", [x["slug"] for x in fam["entries"]]),
                    ("catalog_types", sorted({x["type"] for x in fam["entries"]})),
                    ("catalog_sources", keys)])])
    lines = [BEGIN, "", f"## Hesla rodiny", "",
             "| Kód | Heslo | Anglicky | Druh | Užití | Riziko |",
             "|-----|-------|----------|------|-------|--------|"]
    for e in fam["entries"]:
        lines.append(f"| `{e['id']}` | [{e['cs']}]({link(e['path'])}) | {e['en']} | "
                     f"{cat.types[e['type']]} | {cat.uses[e['use']]} | {cat.risks[e['risk']]} |")
    lines += [""] + family_diagram(fam) + literature(keys, sources) + ["## Související", ""]
    lines.append(f"- [{cat.title}]({link(cat.index)}) – celý katalog a jeho rodiny")
    order = [f["slug"] for f in cat.families]
    i = order.index(fam["slug"])
    for j, why in ((i - 1, "předchozí rodina katalogu"), (i + 1, "další rodina katalogu")):
        if 0 <= j < len(order) and cat.families[j]["entries"]:
            other = cat.families[j]
            lines.append(f"- [{other['title']}]({link(cat.family_index(other['slug']))}) – {why}")
    lines.append(trainer_link(ctx, "procvičení rozpoznání hesel této rodiny"))
    lines += ["", END]
    return (front + "\n" + f"# {fam['title']}\n\n" + prose.strip() + "\n\n"
            + "\n".join(lines) + "\n")


def mermaid_label(text: str) -> str:
    return text.replace('"', "'").replace("[", "(").replace("]", ")")


def family_diagram(fam: dict) -> list:
    """A derived Mermaid map of the family: the family, its entries, and `broader` inside it.
    Every node links its page (rule project.site-derived-surfaces: clickable nodes)."""
    entries = fam["entries"]
    if not entries:
        return []
    ids = {e["slug"]: f"n{i}" for i, e in enumerate(entries, 1)}
    lines = ["## Mapa rodiny", "",
             "Mapu odvozuje engine katalogů z vazeb „obecnější heslo“; uzel otevře heslo.", "",
             "```mermaid", "flowchart LR",
             f'  F["{mermaid_label(fam["title"])}"]',
             f'  click F "{link(fam["catalog"].family_index(fam["slug"]))}"']
    for e in entries:
        lines.append(f'  {ids[e["slug"]]}["{mermaid_label(e["cs"])}"]')
    for e in entries:
        parent = ids.get(e["broader"])
        lines.append(f"  {parent or 'F'} --> {ids[e['slug']]}")
    for e in entries:
        lines.append(f'  click {ids[e["slug"]]} "{link(e["path"])}"')
    return lines + ["```", ""]


def section_page(ctx: dict, cat: Catalog, prose: str, description: str, title: str) -> str:
    sources = ctx["sources"]
    keys = cited(prose, sources)
    front = render_front(
        [("title", title), ("description", description), ("weight", cat.weight),
         ("sort_by", "weight"), ("template", "kompendium/section.html"),
         ("page_template", "kompendium/page.html"), ("insert_anchor_links", "right")],
        [("extra", [("tags", [cat.tag, "kompendium"]), ("categories", ["academic", "reference"]),
                    ("section_icon", cat.icon), ("toc", True), ("lang", "cs"),
                    ("schema_type", "DefinedTermSet"), ("catalog", cat.slug),
                    ("catalog_schema", SCHEMA), ("catalog_export", cat.export.split("static/", 1)[1]),
                    ("catalog_size", len(cat.entries)), ("catalog_sources", keys)])])
    by_type = collections.Counter(cat.types[e["type"]] for e in cat.entries)
    own = sum(1 for e in cat.entries if e["own"])
    lines = [BEGIN, "", "## Rodiny katalogu", "",
             "| Kód | Rodina | Anglicky | Hesel |", "|-----|--------|----------|-------|"]
    for fam in cat.families:
        if fam["entries"]:
            lines.append(f"| `{cat.id_prefix}-{fam['code']}` | [{fam['title']}]"
                         f"({link(cat.family_index(fam['slug']))}) | {fam['en']} | {len(fam['entries'])} |")
    lines += ["", f"Katalog má {len(cat.entries)} hesel: "
              + ", ".join(f"{n} × {t}" for t, n in sorted(by_type.items())) + "."
              + (f" {len(cat.entries) - own} z nich má v knize jinou kanonickou stránku a "
                 "katalog na ni odkazuje." if own < len(cat.entries) else "")
              + " Čísla odvozuje scripts/catalogs.py z katalogu při každém sestavení.", ""]
    lines += literature(keys, sources) + ["## Související", ""]
    lines.append(trainer_link(ctx, "interaktivní procvičení rozpoznání hesel všech katalogů"))
    for other in ctx["catalogs"]:
        if other is not cat:
            lines.append(f"- [{other.title}]({link(other.index)}) – další katalog knihy, "
                         "propojený s tímto vazbami mezi hesly")
    lines.append(f"- [Kompendium]({link('kompendium/_index.md')}) – celá kniha, do níž "
                 "katalog patří")
    lines += ["", END]
    return (front + "\n" + f"# {title}\n\n" + prose.strip() + "\n\n" + "\n".join(lines) + "\n")


def trainer_page(ctx: dict, prose: str, description: str, title: str) -> str:
    front = render_front(
        [("title", title), ("description", description), ("weight", 999),
         ("template", "kompendium/katalog-trener.html")],
        [("taxonomies", [("tags", ["kompendium", "trener"] + [c.tag for c in ctx["catalogs"]]),
                         ("categories", ["academic"])]),
         ("extra", [("toc", False), ("catalogs", [c.slug for c in ctx["catalogs"]]),
                    ("catalog_index", ctx["index_json"].split("static/", 1)[1])])])
    lines = [BEGIN, "", "## Související", ""]
    for cat in ctx["catalogs"]:
        lines.append(f"- [{cat.title}]({link(cat.index)}) – katalog, z něhož trenér bere hesla "
                     "i příklady")
        for fam in cat.families:
            if fam["entries"]:
                lines.append(f"- [{fam['title']}]({link(cat.family_index(fam['slug']))}) – "
                             f"rodina katalogu {cat.title}, {len(fam['entries'])} hesel")
    lines += ["", END]
    return (front + "\n" + f"# {title}\n\n" + prose.strip() + "\n\n" + "\n".join(lines) + "\n")


def url(e: dict) -> str:
    return url_of(pathlib.PurePosixPath(e["path"])).lstrip("/")


def catalogue_data(ctx: dict, cat: Catalog) -> str:
    sources = ctx["sources"]
    entries, edges, used = [], [], set()
    for e in cat.entries:
        prose = ctx["prose"].get(e["path"], "") if e["own"] else ""
        keys = cited(prose, sources)
        used |= set(keys)
        meta = entry_meta(ctx, e, prose, keys)
        record = dict(meta["fields"])
        record.update({"cs": e["cs"], "description": ctx["desc"].get(e["path"], ""),
                       "keywords": meta["keywords"], "path": "content/" + e["path"],
                       "url": url(e), "own": e["own"], "trainer": e["trainer"]})
        entries.append(record)
        if e["broader"]:
            edges.append({"from": e["slug"], "to": e["broader"], "type": "broader"})
        for r in e["related"]:
            edges.append({"from": e["slug"], "to": r, "type": "related"})
        for k in e["kompendium"]:
            edges.append({"from": e["slug"], "to": k, "type": "kompendium"})
        if e["canonical"]:
            edges.append({"from": e["slug"], "to": e["canonical"], "type": "canonical"})
        for target in record["links_prose"]:
            edges.append({"from": e["slug"], "to": target, "type": "prose"})
    families = [{"slug": f["slug"], "code": f["code"], "title": f["title"], "en": f["en"],
                 "url": f"{cat.section}/{f['slug']}/", "members": [x["slug"] for x in f["entries"]]}
                for f in cat.families]
    works = {k: {"cite": sources[k]["cite"], "entry": sources[k]["entry"],
                 "group": sources[k]["group"]} for k in sorted(used)}
    data = {"schema": SCHEMA, "catalog": cat.slug, "title": cat.title, "en": cat.en,
            "id_prefix": cat.id_prefix, "url": cat.section + "/",
            "source": f"{cat.dir} (scripts/catalogs.py)",
            "note": "Derived, never edited by hand; the front matter of every page carries the "
                    "same fields under [extra] catalog_*.",
            "vocab": {"types": cat.types, "uses": cat.uses, "risks": cat.risks},
            "families": families, "entries": entries, "edges": edges, "sources": works}
    return json.dumps(data, ensure_ascii=False, indent=1, sort_keys=True) + "\n"


def trainer_data(ctx: dict, cat: Catalog) -> str:
    patterns, items = [], []
    for e in cat.entries:
        patterns.append({"id": e["id"], "slug": e["slug"], "cs": e["cs"], "en": e["en"],
                         "aliases": e["aliases"], "family": e["family"], "type": e["type"],
                         "catalog": cat.slug, "url": url(e)})
        for n, item in enumerate(e["trainer"], 1):
            items.append({"id": f"{e['id']}-{n}", "pattern": e["id"], "utterance": item["utterance"],
                          "context": item["context"], "benign": item["benign"],
                          "marker": item["marker"], "response": item["response"]})
    families = [{"slug": f["slug"], "code": f["code"], "title": f["title"]} for f in cat.families]
    data = {"schema": SCHEMA, "catalog": cat.slug, "title": cat.title,
            "source": f"{cat.dir} (scripts/catalogs.py)",
            "note": "Derived, never edited by hand.",
            "families": families, "patterns": patterns, "items": items}
    return json.dumps(data, ensure_ascii=False, indent=1, sort_keys=True) + "\n"


def index_data(ctx: dict) -> str:
    cats = [{"slug": c.slug, "title": c.title, "en": c.en, "id_prefix": c.id_prefix,
             "url": c.section + "/", "export": c.export.split("static/", 1)[1],
             "trainer_data": c.trainer_data.split("static/", 1)[1], "entries": len(c.entries),
             "families": len(c.families),
             "items": sum(len(e["trainer"]) for e in c.entries)} for c in ctx["catalogs"]]
    data = {"schema": SCHEMA, "source": "data/catalogs.toml (scripts/catalogs.py)",
            "trainer": url_of(pathlib.PurePosixPath(ctx["trainer_page"])).lstrip("/"),
            "note": "Derived, never edited by hand: the index the trainer and explorers read.",
            "catalogs": cats}
    return json.dumps(data, ensure_ascii=False, indent=1, sort_keys=True) + "\n"


# --- content checks --------------------------------------------------------------------------

def check_citations(prose: str, sources: dict, where: str, errors: list) -> None:
    for m in PAREN.finditer(prose):
        for segment in m.group(1).split(";"):
            if YEAR.search(segment) and not any(s["re"].search(segment) for s in sources.values()):
                fail(errors, where, f"citation '({segment.strip()})' matches no work in "
                     "data/sources.toml")
    for m in NARRATIVE.finditer(prose):
        fail(errors, where, f"narrative citation '{m.group(0)}': write (Autor Rok) as in "
             "data/sources.toml cite")


def check_prose(ctx: dict, cat, prose: str, description: str, where: str, errors: list,
                entry=None) -> None:
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
    if entry is None or cat is None:
        return
    prov = cat.provenance
    if prov and entry[prov["field"]] != "observed" and sources[prov["source"]]["re"].search(prose):
        fail(errors, where, f"cites {sources[prov['source']]['cite']} although the mapping is only "
             "inferred; keep provenance out of the prose (it is in the identification table)")
    present = [h for h in heads if h in cat.required]
    if present != [h for h in cat.required if h in present] or set(present) != set(cat.required):
        missing = [h for h in cat.required if h not in present]
        fail(errors, where, f"required sections in order {cat.required}; missing {missing}"
             if missing else "required sections out of order")
    for head, text in sections_of(prose):
        if head in cat.required and not any(s["re"].search(text) for s in sources.values()):
            fail(errors, where, f"section '{head}' cites no work")
        if head == cat.evidence and not any(
                s["re"].search(text) for s in sources.values() if s["group"] == "critical"):
            fail(errors, where, f"section '{cat.evidence}' cites no critical work")


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


def build_context(errors: list, warnings: list, partial: bool) -> dict:
    decl, cats = load_declaration(errors)
    seen = {"id": set(), "slug": set(), "family": set()}
    for cat in cats:
        load_catalogue(cat, errors, partial, seen)
    entries = [e for c in cats for e in c.entries]
    by_slug = {e["slug"]: e for e in entries}
    validate_edges(cats, by_slug, errors, partial, warnings)
    related, narrower = collections.defaultdict(set), collections.defaultdict(list)
    for e in entries:
        for r in e["related"]:
            if r in by_slug:
                related[e["slug"]].add(r)
                related[r].add(e["slug"])
        if e["broader"] in by_slug:
            narrower[e["broader"]].append(e)
    titles = {p: page_title(p) for e in entries for p in e["kompendium"] if (CONTENT / p).exists()}
    return {
        "catalogs": cats, "by_slug": by_slug,
        "related": {k: sorted((by_slug[s] for s in v), key=lambda x: x["id"])
                    for k, v in related.items()},
        "narrower": {k: sorted(v, key=lambda x: x["id"]) for k, v in narrower.items()},
        "titles": titles, "sources": load_sources(),
        "trainer_page": decl["trainer"], "index_json": decl["index"],
        "prose": {}, "desc": {},
    }


def main() -> int:
    args = sys.argv[1:]
    if any(a in ("-h", "--help") for a in args):
        print(__doc__.strip())
        return 0
    known = {"--check", "--catalog", "--family", "--part", "--stats"}
    unknown = [a for a in args if a.startswith("-") and a not in known]
    if unknown:
        print(f"catalogs: unknown option {unknown[0]}; see --help", file=sys.stderr)
        return 2

    def value(flag: str) -> str:
        return args[args.index(flag) + 1] if flag in args else ""

    check = "--check" in args
    only_cat, only_fam, part = value("--catalog"), value("--family"), value("--part")
    if part and not only_fam:
        only_fam = part.split(".", 1)[0]
    partial = bool(only_fam or only_cat)
    errors, warnings = [], []
    ctx = build_context(errors, warnings, partial)
    cats = ctx["catalogs"]
    if only_fam:
        owner = [c for c in cats if any(f["slug"] == only_fam for f in c.families)]
        if not owner:
            print(f"catalogs: unknown family '{only_fam}'", file=sys.stderr)
            return 2
        only_cat = owner[0].slug
    if only_cat and only_cat not in {c.slug for c in cats}:
        print(f"catalogs: unknown catalogue '{only_cat}'", file=sys.stderr)
        return 2
    if "--stats" in args:
        for cat in cats:
            print(f"{cat.slug} ({cat.title}): {len(cat.entries)} entries, "
                  f"{sum(1 for e in cat.entries if not e['own'])} canonical")
            for fam in cat.families:
                print(f"  {cat.id_prefix}-{fam['code']} {fam['slug']}: {len(fam['entries'])}")
            for field in ("type", "use", "risk", "review"):
                print(f"  {field}", dict(collections.Counter(e[field] for e in cat.entries)))
        return 0
    polish = load_polish()
    planned = {}
    check_exclusions(cats, errors)

    for cat in cats:
        if only_cat and cat.slug != only_cat:
            continue
        for fam in cat.families:
            if only_fam and fam["slug"] != only_fam:
                continue
            idx = cat.family_index(fam["slug"])
            file = CONTENT / idx
            if part and part != fam["slug"]:
                pass
            elif not file.exists():
                fail(errors, f"content/{idx}", "family index missing")
            else:
                front, prose = split_page(file.read_text(encoding="utf-8"))
                desc = str(front.get("description", ""))
                check_prose(ctx, cat, prose, desc, f"content/{idx}", errors)
                planned[idx] = family_page(ctx, cat, fam, prose, desc)
            for e in fam["entries"]:
                if part and e["part"] != part:
                    continue
                own_file = CONTENT / f"{cat.section}/{fam['slug']}/{e['slug']}.md"
                if not e["own"]:
                    if own_file.exists():
                        fail(errors, f"content/{own_file.relative_to(CONTENT).as_posix()}",
                             f"{e['id']} is canonical at {e['canonical']}: no page of its own")
                    continue
                if not own_file.exists():
                    fail(errors, f"content/{e['path']}", f"page of {e['id']} missing")
                    continue
                front, prose = split_page(own_file.read_text(encoding="utf-8"))
                desc = str(front.get("description", ""))
                check_prose(ctx, cat, prose, desc, f"content/{e['path']}", errors, entry=e)
                ctx["prose"][e["path"]], ctx["desc"][e["path"]] = prose, desc
                planned[e["path"]] = entry_page(ctx, e, prose, desc)
        known = {e["path"] for e in cat.entries if e["own"]} | {
            cat.family_index(f["slug"]) for f in cat.families} | {cat.index}
        for file in sorted(cat.section_dir.rglob("*.md")) if cat.section_dir.exists() else []:
            rel = file.relative_to(CONTENT).as_posix()
            if only_fam and not rel.startswith(f"{cat.section}/{only_fam}/"):
                continue
            if rel not in known:
                (warnings if partial else errors).append(
                    f"content/{rel}: page without a catalogue entry (bijection)")
        if not only_fam:
            file = CONTENT / cat.index
            if not file.exists():
                fail(errors, f"content/{cat.index}", "missing")
            else:
                front, prose = split_page(file.read_text(encoding="utf-8"))
                check_prose(ctx, None, prose, str(front.get("description", "")),
                            f"content/{cat.index}", errors)
                planned[cat.index] = section_page(ctx, cat, prose, str(front.get("description", "")),
                                                  str(front.get("title", cat.title)))
    if not partial:
        rel = ctx["trainer_page"]
        file = CONTENT / rel
        if not file.exists():
            fail(errors, f"content/{rel}", "missing")
        else:
            front, prose = split_page(file.read_text(encoding="utf-8"))
            planned[rel] = trainer_page(ctx, prose, str(front.get("description", "")),
                                        str(front.get("title", "")))

    stale = []
    for rel, text in sorted(planned.items()):
        text = polish(text)
        file = CONTENT / rel
        if file.read_text(encoding="utf-8") != text:
            stale.append(f"content/{rel}")
            if not check:
                write_atomic(file, text)
    if not partial:
        outputs = [(ROOT / c.export, catalogue_data(ctx, c)) for c in cats]
        outputs += [(ROOT / c.trainer_data, trainer_data(ctx, c)) for c in cats]
        outputs.append((ROOT / ctx["index_json"], index_data(ctx)))
        for target, data in outputs:
            current = target.read_text(encoding="utf-8") if target.exists() else ""
            if current != data:
                stale.append(target.relative_to(ROOT).as_posix())
                if not check:
                    write_atomic(target, data)

    for w in warnings:
        print(f"catalogs: warning: {w}")
    if check:
        errors += [f"{p}: derived parts are stale; run scripts/catalogs.py" for p in stale]
    total = sum(len(c.entries) for c in cats if not only_cat or c.slug == only_cat)
    scope = (f"family {only_fam}" if only_fam else f"catalogue {only_cat}" if only_cat
             else f"{len(cats)} catalogue(s)")
    verb = "stale" if check else "updated"
    print(f"catalogs: {total} entries in {scope}; {len(stale)} file(s) {verb}; "
          f"{len(errors)} error(s)")
    for err in errors[:200]:
        print(f"  {err}")
    if len(errors) > 200:
        print(f"  … and {len(errors) - 200} more")
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
