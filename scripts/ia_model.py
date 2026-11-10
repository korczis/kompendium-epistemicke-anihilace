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

# Rule project.content-no-placeholders: what a placeholder, a stub or generated filler looks
# like. Each pattern names text that only ever appears on a page that is not finished.
PLACEHOLDER = [
    ("placeholder-note", re.compile(r"\b(?:je|jako|tento|tato|toto)\s+placeholder", re.I)),
    ("placeholder-heading", re.compile(r"^#{1,6}\s.*\bplaceholder\b", re.I | re.M)),
    ("reconstruction", re.compile(r"\b(?:materiál|obsah)\w*\s+(?:je\s+)?v\s+rekonstrukci\b", re.I)),
    ("stub-entry", re.compile(r"\bstub(?:\s+(?:created|zápis\w*|entry|page))\b|structural stub"
                              r"|stub\s+zápis", re.I)),
    ("filler-block", re.compile(r"NLLB-AUTO-BLOCK|ENHANCED:[A-Z]|zero-stub-tolerance", re.I)),
    ("buildout", re.compile(r"knowledge-base buildout|součástí probíhající|bude doplněn[oa]?\b"
                            r"|obsah se připravuje|coming soon|under construction|lorem ipsum",
                            re.I)),
    ("reserved", re.compile(r"\|\s*(?:příprava|plánováno|rezervováno|tbd)\s*\|"
                            r"|^#{1,6}\s.*\(rezervovan[éáý]\)", re.I | re.M)),
    ("placeholder-field", re.compile(r"^\s*\w*placeholder\w*\s*=", re.I | re.M)),
    ("generic-description", re.compile(r"pojem v sekci \S+ znalostní báze", re.I)),
]

# Rule project.content-academic-style: sections whose items are a list by nature.
LIST_SECTIONS = re.compile(r"^(Související|Literatura|Prameny|Reference)\b", re.I)
HEADING_LINE = re.compile(r"^(#{1,6})\s+(.*?)\s*$")
BULLET = re.compile(r"^\s*(?:[-*+]|\d+[.)])\s+\S")
YEAR = r"(?:1[5-9]\d\d|20[0-4]\d)[a-z]?"
PAREN_CITE = re.compile(r"\(([^()]*?\b" + YEAR + r"\b[^()]*)\)")
NARRATIVE_CITE = re.compile(r"([A-ZÁ-Ž][\w'’-]+)(?:\s+(?:et al\.|a kol\.)|\s+(?:a|&)\s+[A-ZÁ-Ž][\w'’-]+)?"
                            r"\s+\((?:" + YEAR + r")")
LAW_CITE = re.compile(r"\b(?:č\.|zákon[a-z]*)\s*\d+/\d{4}\s*Sb\.")
SURNAME = re.compile(r"[A-ZÁ-Ž][\w'’-]+")
CITE_STOP = {"Srov", "Viz", "Např", "Cit", "Jinak", "Též", "Dále", "Podle", "In"}
MIN_PARAGRAPH_WORDS = 20

# Controlled vocabulary of glossary categories (rule project.content-academic-style): the
# glossary's facets are derived from it, so a free-form category is a broken facet. Old values
# map onto it; scripts/normalize-front-matter.py --categories applies the map.
GLOSSARY_CATEGORIES = [
    "epistemologie", "filozofie", "fenomenologie", "logika a jazyk", "psychologie a klinika",
    "trauma a zotavení", "manipulace a kontrola", "sociologie", "právo a forenzní praxe",
    "bezpečnost a zpravodajství", "metodologie", "etika", "neurověda",
    "architektura platformy", "doktrína platformy",
]
CATEGORY_MAP = {
    "epistemic": "epistemologie", "epistemologie": "epistemologie",
    "filozofie-vedy": "metodologie", "philosophy-of-science": "metodologie",
    "philosophy": "filozofie", "philosophical": "filozofie", "filozofie": "filozofie",
    "phenomenology": "fenomenologie", "fenomenologie": "fenomenologie",
    "logika": "logika a jazyk", "linguistics": "logika a jazyk", "lingvistika": "logika a jazyk",
    "mathematics": "logika a jazyk",
    "clinical": "psychologie a klinika", "klinika": "psychologie a klinika",
    "psychology": "psychologie a klinika", "psychological": "psychologie a klinika",
    "psychologie": "psychologie a klinika",
    "trauma": "trauma a zotavení",
    "manipulace": "manipulace a kontrola", "manipulation-pattern": "manipulace a kontrola",
    "sociologie": "sociologie",
    "legal": "právo a forenzní praxe", "forensic": "právo a forenzní praxe",
    "security": "bezpečnost a zpravodajství", "intelligence": "bezpečnost a zpravodajství",
    "osint": "bezpečnost a zpravodajství", "risk": "bezpečnost a zpravodajství",
    "methodology": "metodologie", "metodologie": "metodologie", "decision-theory": "metodologie",
    "ethics": "etika", "neuroscience": "neurověda", "clinical-neuroscience": "neurověda",
    "architecture": "architektura platformy", "agents": "architektura platformy",
    "ai-ml": "architektura platformy", "ai-systems": "architektura platformy",
    "core": "architektura platformy", "evolution": "architektura platformy",
    "storage": "architektura platformy", "technology": "architektura platformy",
    "doctrine": "doktrína platformy", "doktrína": "doktrína platformy",
    "quality": "doktrína platformy", "kvalita": "doktrína platformy",
    "hermeneutika": "filozofie", "forenzní": "právo a forenzní praxe",
    "právo": "právo a forenzní praxe", "psychiatrie": "psychologie a klinika",
    "klinická psychologie": "psychologie a klinika", "zotavení": "trauma a zotavení",
    "manipulace a vliv": "manipulace a kontrola", "kontrola": "manipulace a kontrola",
    "neurovědy": "neurověda", "logika": "logika a jazyk", "jazyk": "logika a jazyk",
}
MIN_PAGE_WORDS = 600

# Every technique of the taxonomy has its own page (rule project.content-academic-style): a
# code EA-X.Y.Z named anywhere must be the `ea_code` or the file-name prefix of a page.
EA_CODE = re.compile(r"\bEA[-\u2011 ](\d{1,2})[.\-](\d{1,2})[.\-](\d{1,3})\b")
EA_FILE = re.compile(r"^ea-(\d+)-(\d+)-(\d+)")


# Rule project.content-linked-and-built (term links): the first mention of every glossary term
# in a page's prose is a link to its entry. Shared by check-ia.py (requirement `term-links`)
# and link-terms.py (which inserts the links).
MIN_TERM_LENGTH = 5
# Glossary titles that are also ordinary words with another meaning in running text (a software
# agent vs. an agent of an act; differentiation of self vs. differential diagnosis): never
# auto-linked, linked by hand where the glossary sense is meant.
AMBIGUOUS_TERMS = {"agent", "diferenciace", "fenomén"}
SKIP_SECTIONS = re.compile(r"^(Související|Literatura|Prameny|Reference)\b", re.I)
PROTECTED_SPAN = re.compile(r"`[^`]*`|\[[^\]]*\]\([^)]*\)|<[^>]+>|https?://\S+|\{\{.*?\}\}|\{%.*?%\}")


def term_forms(title: str) -> list:
    """Surface forms of a glossary title: the title, and both halves of `A (B)`."""
    forms = {title.strip()}
    m = re.match(r"^(.*?)\s*\((.*?)\)\s*$", title)
    if m:
        forms.update({m.group(1).strip(), m.group(2).strip()})
    return sorted((f for f in forms if len(f) >= MIN_TERM_LENGTH and not EA_CODE.match(f)
                   and f.lower() not in AMBIGUOUS_TERMS),
                  key=len, reverse=True)


def glossary_terms(pages: list) -> dict:
    """{"pattern": one regex of every form, longest first; "target": folded form -> path}."""
    target = {}
    for p in pages:
        if p["path"].startswith("glossary/") and not p["is_index"] and p["title"]:
            for form in term_forms(p["title"]):
                target.setdefault(form.lower(), p["path"])
    forms = sorted(target, key=len, reverse=True)
    pattern = re.compile(r"(?<![\w@/-])(" + "|".join(re.escape(f) for f in forms)
                         + r")(?![\w-])", re.I) if forms else None
    return {"pattern": pattern, "target": target}


def prose_segments(body: str):
    """Yield (start, end) of lines whose prose may carry a term link."""
    offset, fenced, section = 0, False, ""
    for line in body.splitlines(keepends=True):
        start, offset = offset, offset + len(line)
        stripped = line.strip()
        if stripped.startswith("```") or stripped.startswith("~~~"):
            fenced = not fenced
            continue
        if fenced:
            continue
        m = HEADING_LINE.match(line)
        if m:
            if len(m.group(1)) == 2:
                section = m.group(2)
            continue
        if SKIP_SECTIONS.match(section) or not stripped or stripped.startswith("|") \
                or stripped.startswith("<") or stripped.startswith("{"):
            continue
        yield start, offset


def unlinked_terms(body: str, own_path: str, linked: set, terms: dict) -> list:
    """[(text, target, offset, length)]: the first unlinked mention of each term in document
    order, for terms the page does not link anywhere yet."""
    if terms["pattern"] is None:
        return []
    found, seen = [], set(linked) | {own_path}
    for start, end in prose_segments(body):
        line = body[start:end]
        shielded = [(m.start(), m.end()) for m in PROTECTED_SPAN.finditer(line)]
        for m in terms["pattern"].finditer(line):
            path = terms["target"].get(m.group(1).lower())
            if not path or path in seen or any(x <= m.start() < y for x, y in shielded):
                continue
            seen.add(path)
            found.append((m.group(1), path, start + m.start(), m.end() - m.start()))
    return found


def fold(text: str) -> str:
    import unicodedata
    return unicodedata.normalize("NFKD", text).encode("ascii", "ignore").decode().lower()


def academic_profile(body: str) -> dict:
    """Paragraphs, list items and citations of a page body (rule content-academic-style)."""
    lines = FENCE.sub("", re.sub(r"<!--.*?-->", "", body, flags=re.S)).split("\n")
    section, blocks, block, loose = "", [], [], 0
    bib_lines = []

    def flush():
        if block:
            blocks.append(" ".join(block))
            block.clear()

    for line in lines:
        m = HEADING_LINE.match(line)
        if m:
            flush()
            if len(m.group(1)) == 2:
                section = m.group(2)
            continue
        listed = bool(LIST_SECTIONS.match(section))
        if listed:
            if re.match(r"^(Literatura|Prameny|Reference)", section, re.I):
                bib_lines.append(line)
            flush()
            continue
        stripped = line.strip()
        if not stripped or stripped.startswith("|") or stripped.startswith("<") \
                or stripped.startswith("{{") or stripped.startswith("{%") \
                or re.match(r"^(-{3,}|\*{3,})$", stripped):
            flush()
            continue
        if BULLET.match(line):
            flush()
            loose += 1
            continue
        block.append(re.sub(r"^>\s?", "", stripped))
    flush()

    bibliography = "\n".join(bib_lines)
    bib_entries = sum(1 for l in bib_lines if BULLET.match(l) and re.search(r"\b" + YEAR + r"\b", l))
    bib_folded = fold(bibliography)
    uncited, unresolved = 0, set()
    for text in blocks:
        prose = re.sub(r"\]\([^)]*\)", "]", text)
        if len(WORD.findall(prose)) < MIN_PARAGRAPH_WORDS:
            continue
        cites = []
        for m in PAREN_CITE.finditer(prose):
            for part in m.group(1).split(";"):
                if LAW_CITE.search(part) or re.search(r"\bSb\.", part):
                    cites.append(None)  # a statute, not an author
                    continue
                if re.search(r"\b" + YEAR + r"\b", part):
                    names = [n for n in SURNAME.findall(part.split(",")[0]) if n not in CITE_STOP]
                    cites.append(names[0] if names else None)
        for m in NARRATIVE_CITE.finditer(prose):
            cites.append(m.group(1))
        has_law = bool(LAW_CITE.search(prose))
        if not cites and not has_law:
            uncited += 1
            continue
        for name in cites:
            if name and fold(name) not in bib_folded:
                unresolved.add(name)
    return {
        "loose_bullets": loose,
        "uncited_paragraphs": uncited,
        "bibliography_entries": bib_entries,
        "unresolved_citations": sorted(unresolved),
    }


def placeholder_markers(text: str, front: dict) -> list:
    prose = FENCE.sub("", text)  # code samples may quote the markers they forbid
    found = [name for name, pattern in PLACEHOLDER if pattern.search(prose)]
    extra = front.get("extra") or {}
    if isinstance(extra, dict) and extra.get("stub"):
        found.append("stub-flag")
    return sorted(set(found))


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
            "weight": front.get("weight", 0) if isinstance(front.get("weight", 0), int) else 0,
            "sort_by": str(front.get("sort_by", "")),
            "category": str(extra.get("category", "")) if isinstance(extra, dict) else "",
            "ea_code": str(extra.get("ea_code", "")) if isinstance(extra, dict) else "",
            "related_terms": [str(t) for t in extra.get("related_terms", [])]
            if isinstance(extra, dict) and isinstance(extra.get("related_terms"), list) else [],
            "front_matter": fm_kind,
            "front_matter_error": fm_error,
            "words": len(words),
            "diacritics": round(dia / len(words), 3) if words else 0.0,
            "language": language_of(words),
            "has_related": bool(RELATED_HEADING.search(body)),
            "links": [m.group(1) for m in AT_LINK.finditer(body)],
            "placeholders": placeholder_markers(text, front),
            "body": body,
            "ea_mentions": sorted({".".join(m.groups()) for m in EA_CODE.finditer(prose)}),
            **academic_profile(body),
        })
    known = {p["path"] for p in pages}
    for page in pages:
        page["broken_links"] = sorted({t for t in page["links"] if t not in known})
        page["links"] = sorted({t for t in page["links"] if t in known and t != page["path"]})
    with_page = set()
    for page in pages:
        m = EA_FILE.match(page["path"].rsplit("/", 1)[-1])
        if page["path"].startswith("kompendium/techniques/") and m:
            with_page.add(".".join(m.groups()))
        code = EA_CODE.search(page["ea_code"])
        if code:
            with_page.add(".".join(code.groups()))
    for page in pages:
        page["missing_techniques"] = [c for c in page["ea_mentions"] if c not in with_page]
    # Every term a page names in extra.related_terms has a page of its own (by file stem).
    stems = {p["path"].rsplit("/", 1)[-1][:-3] for p in pages if not p["is_index"]}
    for page in pages:
        page["missing_terms"] = [t for t in page["related_terms"] if t not in stems]
    terms = glossary_terms(pages)
    for page in pages:
        page["unlinked_terms"] = [f[:2] for f in unlinked_terms(
            page["body"], page["path"], set(page["links"]), terms)]
        del page["body"]
    incoming = {p["path"]: 0 for p in pages}
    for page in pages:
        for target in page["links"]:
            incoming[target] += 1
    for page in pages:
        page["links_in"] = incoming[page["path"]]
    return pages
