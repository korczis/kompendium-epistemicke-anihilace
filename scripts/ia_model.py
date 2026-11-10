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
