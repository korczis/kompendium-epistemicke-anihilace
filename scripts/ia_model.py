"""The book's information architecture as data: every page, its metadata and its links.

Shared by scripts/build-graph.py (the derived graph and metrics the site renders) and
scripts/check-ia.py (the gate that enforces the architecture). Nothing here writes files.
"""
import pathlib
import re
import tomllib

ROOT = pathlib.Path(__file__).resolve().parent.parent
CONTENT = ROOT / "content"

TOML_FM = re.compile(r"\A\+\+\+\n(.*?)\n\+\+\+\n", re.S)
YAML_FM = re.compile(r"\A---\n(.*?)\n---\n", re.S)
AT_LINK = re.compile(r"\]\(@/([^)#\s]+?\.md)(#[^)\s]*)?\)")
FENCE = re.compile(r"```.*?```", re.S)
WORD = re.compile(r"[A-Za-zÀ-ž]+")
DIACRITIC = re.compile(r"[ěščřžýáíéůúťďňĚŠČŘŽÝÁÍÉŮÚŤĎŇ]")
EN_WORDS = {"the", "and", "of", "with", "is", "are", "this", "that"}
CZ_WORDS = {"je", "se", "na", "že", "jako", "nebo", "které", "který", "pro", "jsou", "není",
            "také", "ale", "jak", "při"}
GENERATED_MARKERS = re.compile(
    r"NLLB-AUTO-BLOCK|[Ss]trukturální stub|structural stub|Tato stránka je placeholder"
    r"|pojem v sekci \S+ znalostní báze Prismatic Platform|^stub\s*=\s*true", re.M
)
RELATED_HEADING = re.compile(r"^##\s+(Související|Cross-linky|Související stránky)\b", re.M | re.I)


def parse_yaml_subset(text: str) -> dict:
    """Top-level scalars and the `tags` list of the few pages with YAML front matter."""
    data, section = {}, None
    for line in text.split("\n"):
        if not line.strip() or line.lstrip().startswith("#"):
            continue
        m = re.match(r"^(\w+):\s*(.*)$", line)
        if m:
            key, value = m.groups()
            section = key if value == "" else None
            data[key] = value.strip().strip('"') if value else {}
            continue
        m = re.match(r"^\s+(\w+):\s*(.*)$", line)
        if m and section:
            data[section][m.group(1)] = m.group(2).strip().strip('"')
    return data


def url_of(rel: pathlib.PurePosixPath) -> str:
    parts = list(rel.parts)
    if parts[-1] in ("_index.md", "index.md"):
        parts = parts[:-1]
    else:
        parts[-1] = parts[-1][:-3]
    return "/" + "/".join(parts) + ("/" if parts else "")


def section_of(rel: pathlib.PurePosixPath) -> str:
    parts = rel.parts
    if parts[0] == "kompendium" and len(parts) > 2:
        return f"kompendium/{parts[1]}"
    return parts[0] if len(parts) > 1 else "root"


def language_of(words: list) -> str:
    lower = [w.lower() for w in words]
    en = sum(1 for w in lower if w in EN_WORDS)
    cz = sum(1 for w in lower if w in CZ_WORDS)
    return "en" if en > cz else "cs"


def load_pages() -> list:
    pages = []
    for path in sorted(CONTENT.rglob("*.md")):
        rel = pathlib.PurePosixPath(path.relative_to(CONTENT).as_posix())
        text = path.read_text(encoding="utf-8")
        front, body, fm_kind, fm_error = {}, text, None, None
        m = TOML_FM.match(text)
        if m:
            fm_kind, body = "toml", text[m.end():]
            try:
                front = tomllib.loads(m.group(1))
            except tomllib.TOMLDecodeError as exc:
                fm_error = str(exc)
        else:
            m = YAML_FM.match(text)
            if m:
                fm_kind, body = "yaml", text[m.end():]
                front = parse_yaml_subset(m.group(1))
        prose = FENCE.sub("", body)
        words = WORD.findall(re.sub(r"\]\([^)]*\)|https?://\S+", "", prose))
        dia = sum(1 for w in words if DIACRITIC.search(w))
        taxonomies = front.get("taxonomies") or {}
        tags = taxonomies.get("tags", []) if isinstance(taxonomies, dict) else []
        extra = front.get("extra") or {}
        pages.append({
            "path": rel.as_posix(),
            "url": url_of(rel),
            "section": section_of(rel),
            "is_index": rel.name == "_index.md",
            "title": str(front.get("title", "")),
            "description": str(front.get("description", "")),
            "tags": [str(t) for t in tags] if isinstance(tags, list) else [],
            "parent": str(extra.get("parent", "")) if isinstance(extra, dict) else "",
            "front_matter": fm_kind,
            "front_matter_error": fm_error,
            "words": len(words),
            "diacritics": round(dia / len(words), 3) if words else 0.0,
            "language": language_of(words),
            "has_related": bool(RELATED_HEADING.search(body)),
            "generated": bool(GENERATED_MARKERS.search(text)),
            "template": str(front.get("template", "")),
            "links": [m.group(1) for m in AT_LINK.finditer(body)],
        })
    known = {p["path"] for p in pages}
    for page in pages:
        page["broken_links"] = sorted({t for t in page["links"] if t not in known})
        page["links"] = sorted({t for t in page["links"] if t in known and t != page["path"]})
    incoming = {p["path"]: 0 for p in pages}
    for page in pages:
        for target in page["links"]:
            incoming[target] += 1
    for page in pages:
        page["links_in"] = incoming[page["path"]]
    return pages


TERM_INDEX = CONTENT / "kompendium" / "08-prilohy" / "index-pojmu.md"
TERM_ROW = re.compile(
    r"^\|\s*\*\*(?:\[)?([^*\]]+?)(?:\]\(@/([^)#\s]+\.md)[^)]*\))?\*\*\s*\|\s*([^|]*)\|\s*([^|]*)\|", re.M
)
EA_CODE = re.compile(r"EA-(\d+)\.(\d+)\.(\d+)")


def slugify(text: str) -> str:
    import unicodedata
    text = unicodedata.normalize("NFKD", text).encode("ascii", "ignore").decode().lower()
    return re.sub(r"[^a-z0-9]+", "-", text).strip("-")


def load_terms(pages: list) -> list:
    """The book's terms (rows of the index of terms) and the page each one has, if any.

    A term has its own page when a glossary entry carries its name (file slug or title, in
    Czech or in the English equivalent), when the term cell links such a page, when its
    location column links a glossary,
    philosophy or technique page, or when its location names an EA code that has a technique page.
    """
    if not TERM_INDEX.exists():
        return []
    glossary = {}
    techniques = {}
    for page in pages:
        path = page["path"]
        if path.startswith("glossary/") and not page["is_index"]:
            stem = pathlib.PurePosixPath(path).stem
            glossary.setdefault(stem, path)
            if page["title"]:
                glossary.setdefault(slugify(page["title"]), path)
        m = re.match(r"kompendium/techniques/ea-(\d+)-(\d+)-(\d+)", path)
        if m:
            techniques["EA-" + ".".join(m.groups())] = path
    terms = []
    known = {p["path"] for p in pages}
    for cs, cell_link, en, location in TERM_ROW.findall(TERM_INDEX.read_text(encoding="utf-8")):
        cs, en = cs.strip(), re.sub(r"\[[=≈~]\]", "", en).strip()
        # The term cell itself may link the term's page: that is the most direct evidence.
        page = cell_link if cell_link in known and cell_link.startswith(
            ("glossary/", "philosophy/", "kompendium/techniques/")) else None
        for key in (slugify(cs), slugify(re.sub(r"\(.*?\)", "", cs)), slugify(en),
                    slugify(re.sub(r"\(.*?\)", "", en))):
            if page is None and key and key in glossary:
                page = glossary[key]
                break
        if page is None:
            m = re.search(r"\(@/((?:glossary|philosophy|kompendium/techniques)/[^)#\s]+\.md)", location)
            if m:
                page = m.group(1)
        if page is None:
            m = EA_CODE.search(location)
            if m and m.group(0) in techniques:
                page = techniques[m.group(0)]
        terms.append({"term": cs, "en": en, "slug": slugify(cs), "page": page})
    return terms
