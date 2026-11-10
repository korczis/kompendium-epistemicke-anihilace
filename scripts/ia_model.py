"""The book's information architecture as data: every page, its metadata and its links.

Shared by scripts/build-graph.py (the derived graph and metrics the site renders) and
scripts/check-ia.py (the gate that enforces the architecture). Nothing here writes files.
"""
import functools
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
# The site's own base path or host written into content goes stale when the site moves; links
# to pages are @/ links and scripts are {{ <viz_script name="…" /> }}.
HARDCODED = re.compile(r"""(?:src|href)=["']/kompendium-epistemicke-anihilace/"""
                       r"|https?://korczis\.github\.io/kompendium-epistemicke-anihilace/")
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


def zola_slug(component: str) -> str:
    """A path component as Zola writes it with the default `slugify.paths = "on"`: ASCII,
    lower case, every run of other characters one hyphen, no hyphen at either end."""
    import unicodedata
    text = unicodedata.normalize("NFKD", component).encode("ascii", "ignore").decode().lower()
    return re.sub(r"[^a-z0-9]+", "-", text).strip("-")


def url_of(rel: pathlib.PurePosixPath) -> str:
    parts = list(rel.parts)
    if parts[-1] in ("_index.md", "index.md"):
        parts = parts[:-1]
    else:
        parts[-1] = parts[-1][:-3]
    parts = [zola_slug(p) for p in parts]  # GitHub Pages is case-sensitive: match Zola exactly
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


def load_pages(with_body: bool = False) -> list:
    """Every page of content/ as a dict; `with_body` keeps the body (front matter removed)
    and the front matter's [extra] for the text analyses of scripts/check-ia.py."""
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
            "has_definition": bool(re.search(r"^##\s+Definice\b", body, re.M)),
            "hardcoded": bool(HARDCODED.search(body)),
            "ea_category": str(extra.get("ea_category", "")) if isinstance(extra, dict) else "",
            "links": [m.group(1) for m in AT_LINK.finditer(body)],
        })
        if with_body:
            pages[-1]["body"] = body
            pages[-1]["extra"] = extra if isinstance(extra, dict) else {}
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


def detail_thresholds() -> dict:
    """The `detail` word thresholds, read from zola.toml [extra] — the single source the
    templates use too, so the gate and the site cannot drift."""
    extra = tomllib.loads((ROOT / "zola.toml").read_text(encoding="utf-8")).get("extra", {})
    keys = {"page": "ia_detail_words", "index": "ia_detail_words_index", "qr": "ia_detail_words_qr"}
    missing = [k for k in keys.values() if not isinstance(extra.get(k), int)]
    if missing:
        raise SystemExit(f"ia_model: zola.toml [extra] lacks {', '.join(missing)} (integer word counts)")
    return {name: extra[key] for name, key in keys.items()}


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


# ---------------------------------------------------------------------------------------------
# The academic standard of a page (requirements placeholder, bullets, citations, bibliography,
# citation-unresolved, technique-page, bold-term, bold-candidate of scripts/check-ia.py).
# Every page reads as one academic work: points are paragraphs, each paragraph carries an
# author-year citation resolved in the page's Literatura, every technique and term has a page.

# What only ever appears on a page that is not finished. The platform's own generated text
# (NLLB block, structural stub, placeholder note, "pojem v sekci … znalostní báze Prismatic
# Platform", stub = true) is requirement `generated`; these are the rest of the filler.
# Matched against the lower-cased prose (re.I is slow on Czech text); filler-block is
# case-sensitive and matched against the prose itself.
PLACEHOLDER = [
    ("placeholder-note", re.compile(r"\b(?:je|jako|tento|tato|toto)\s+placeholder")),
    ("placeholder-heading", re.compile(r"^#{1,6}\s.*\bplaceholder\b", re.M)),
    ("placeholder-field", re.compile(r"^\s*\w*placeholder\w*\s*=", re.M)),
    ("reconstruction", re.compile(r"\b(?:materiál|obsah)\w*\s+(?:je\s+)?v\s+rekonstrukci\b")),
    ("stub-entry", re.compile(r"\bstub\s+(?:created|zápis\w*|entry|page)\b|structural stub")),
    ("buildout", re.compile(r"knowledge-base buildout|bude doplněn[oa]?\b"
                            r"|součástí probíhající\s+(?:výstavby|tvorby|přípravy|rozšiřování)"
                            r"|obsah se připravuje|coming soon|under construction|lorem ipsum")),
    ("reserved", re.compile(r"\|\s*(?:příprava|plánováno|rezervováno|tbd)\s*\|"
                            r"|^#{1,6}\s.*\(rezervovan[éáý]\)", re.M)),
    ("generic-description", re.compile(r"pojem v sekci \S+ znalostní báze")),
]
FILLER = re.compile(r"NLLB-AUTO-BLOCK|ENHANCED:[A-Z]|zero-stub-tolerance")
# A literal every match of the pattern contains: a cheap test before the regex runs.
PLACEHOLDER_KEYS = {
    "placeholder-note": ("placeholder",), "placeholder-heading": ("placeholder",),
    "placeholder-field": ("placeholder",), "reconstruction": ("rekonstrukci",),
    "stub-entry": ("stub",), "generic-description": ("znalostní báze",),
    "buildout": ("buildout", "doplněn", "probíhající", "připravuje", "coming soon",
                 "under construction", "lorem ipsum"),
    "reserved": ("příprava", "plánováno", "rezervov", "tbd"),
}

UPPER = "A-ZÁČĎÉĚÍŇÓŘŠŤÚŮÝŽÄÖÜ"
HEADING_LINE = re.compile(r"^(#{1,6})\s+(.*?)\s*#*\s*$")
LIT_HEADING = re.compile(r"^(?:\d+\.\s*)?Literatura$", re.I)          # the bibliography itself
# Sections that are a bibliography by nature ("Primární literatura", "Reference", "Prameny"):
# lists there are allowed and citations resolve against them.
LIT_LIKE = re.compile(r"^(?:\d+\.\s*)?(?:(?:\w+\s+)?literatura|reference|prameny|bibliografie"
                      r"|zdroje)$", re.I)
REL_HEADING = re.compile(r"^(?:\d+\.\s*)?(?:Související|Cross-linky)\b", re.I)
GEN_BEGIN = re.compile(r"<!--\s*\S*?(?::begin\b|\s+BEGIN\b)")
GEN_END = re.compile(r"<!--\s*\S*?(?::end\b|\s+END\b)")
TABLE_SEP = re.compile(r"^\s*\|?\s*:?-{3,}:?\s*(?:\|\s*:?-{3,}:?\s*)*\|?\s*$")
LIST_ITEM = re.compile(r"^(\s*)(?:[-*+]|(\d{1,9})[.)])(?:\s+\S|\s*$)")
RULE_LINE = re.compile(r"^\s*(?:-\s*){3,}$|^\s*(?:\*\s*){3,}$|^\s*(?:_\s*){3,}$")
INLINE_CODE = re.compile(r"`+[^`\n]*`+")
LINK_TEXT = re.compile(r"!?\[([^\]\n]*)\]\([^)\n]*\)")
ASCII_WORD = re.compile(r"[a-z]+")
LIST_START = set("-*+0123456789")
FOUR_DIGITS = re.compile(r"\d{4}")
MIN_PARAGRAPH_WORDS = 20

# An author-year citation. § numbers are not years: "§ 1724" is removed before matching.
YEAR = r"(?<![\d/§.])(?:1[5-9]\d\d|20[0-4]\d)[a-z]?(?![\d/])"
NAME = r"(?:(?:van|von|de|der|den|du|da|di|le|la|ten|ter)\s+)*[" + UPPER + r"][\w'’\-]*\w"
# Further authors may be lower case (danah boyd: "Marwick a boyd (2011)"); "a kol.", "a kolegové",
# "et al." close the list.
AUTHORS = (NAME + r"(?:(?:\s*,\s*|\s*&\s*|\s+(?:a|and|und)\s+)(?:" + NAME + r"|[a-zà-ž][\w'’\-]*\w))*"
           r"(?:,?\s+(?:a\s+kol\.|a\s+kolegové|a\s+spolupracovníci|et\s+al\.))?")
PAREN = re.compile(r"\(([^()]*)\)")
PAREN_CITE = re.compile(r"(?:^|(?<=[\s;(]))(" + AUTHORS + r"),?\s+" + YEAR)
# Autor (rok): the parenthesis holds the year and no name ("DSM-5 (APA, 2013)" is the
# parenthetical citation of APA, not a narrative one of DSM-5).
NARRATIVE_CITE = re.compile(r"(?<![\w.])(" + AUTHORS + r")\s+\([^()A-Za-zÀ-ž]*" + YEAR + r"[^()]*\)")
LAW_CITE = re.compile(
    r"\bč\.\s*\d+/\d{4}\s*Sb\."                                    # zákon č. 40/2009 Sb.
    r"|\b\d{2,4}/\d{1,4}/(?:EU|ES|EHS|EC|EEC|SZBP|SVV)\b"          # směrnice 2011/36/EU
    r"|\((?:EU|ES|EHS|EC|EEC|Euratom)\)\s*(?:č\.\s*)?\d{2,4}/\d{1,4}"  # nařízení (EU) 2016/679
    r"|\b(?:Act|Gesetz|Code)\s+(?:of\s+)?\d{4}\b")              # Serious Crime Act 2015
PARAGRAPH_SIGN = re.compile(r"§+\s*\d+(?:\s*(?:[–-]|,|a|až)\s*\d+)*")
NAME_RE = re.compile(NAME)
NOT_AUTHOR = {"Srov", "Viz", "Např", "Cit", "In", "Též", "Dále", "Podle", "Pozn"}
# Czech case endings of a surname: Lifton, Liftona, Liftonovi, Liftonem, Liftonův, Liftonové…
CASE_ENDINGS = ("ovych", "ovymi", "ovym", "ovou", "ovi", "ove", "ova", "ovy", "ovu", "ovo",
                "eho", "iho", "ymi", "ho", "ym", "im",
                "uv", "em", "ou", "a", "e", "u", "y", "i", "o")
# Starts with the literal so that the regex engine can skip to it; the character before is
# checked by hand (not part of a word, a path or a longer code).
EA_MENTION = re.compile(r"EA[-\u2011](\d{1,2})\.(\d{1,2})\.(\d{1,3})(?![\d])")


def fold(text: str) -> str:
    import unicodedata
    return unicodedata.normalize("NFKD", text).encode("ascii", "ignore").decode().lower()


def stem(word: str) -> str:
    """A folded surname without its Czech case ending (and mobile e: Havel/Havla)."""
    for ending in CASE_ENDINGS:
        if word.endswith(ending) and len(word) - len(ending) >= 3:
            word = word[:-len(ending)]
            break
    if len(word) >= 4 and word[-2] == "e" and word[-1] in "lkcr":
        word = word[:-2] + word[-1]
    return word


def forms(word: str) -> set:
    """A folded surname and its stems, so that Lifton, Liftona, Liftonovi and Arendt,
    Arendtová, Arendtové meet in one form."""
    once = stem(word)
    return {word, once, stem(once)}


def resolved(name: str, literature: set) -> bool:
    """Whether every part of a cited name (van der Kolk, Merleau-Ponty, O'Neil) is in the
    folded forms of the page's Literatura; particles and initials do not count."""
    parts = [fold(p) for p in re.split(r"[\s\-'’]+", name) if p]
    parts = [p for p in parts if len(p) >= 3 and p not in ("van", "von", "der", "den", "ten", "ter")]
    return all(forms(p) & literature for p in parts) if parts else True


def body_lines(body: str):
    """Yield (offset, line, kind, section) for each line of a page body.

    kind: fence, generated, heading, blank, table-header, table-sep, table, html, quote, rule,
    text; section is the title of the current `##` heading. Generated blocks run between
    `<!-- …:begin -->` / `<!-- … BEGIN -->` and the matching end comment."""
    lines = body.split("\n")
    offset, fenced, generated, section = 0, False, False, ""
    for i, line in enumerate(lines):
        start, offset = offset, offset + len(line) + 1
        stripped = line.strip()
        if stripped.startswith("```") or stripped.startswith("~~~"):
            fenced = not fenced
            yield start, line, "fence", section
            continue
        if fenced:
            yield start, line, "fence", section
            continue
        if generated or ("<!--" in line and GEN_BEGIN.search(line)):
            generated = not GEN_END.search(line)
            yield start, line, "generated", section
            continue
        m = HEADING_LINE.match(line)
        if m:
            if len(m.group(1)) <= 2:
                section = re.sub(r"\*+", "", m.group(2)).strip()
            yield start, line, "heading", section
            continue
        if not stripped:
            kind = "blank"
        elif stripped.startswith("|"):
            if TABLE_SEP.match(stripped):
                kind = "table-sep"
            elif i + 1 < len(lines) and TABLE_SEP.match(lines[i + 1].strip()):
                kind = "table-header"
            else:
                kind = "table"
        elif stripped.startswith(">"):
            kind = "quote"
        elif stripped.startswith(("<", "{{", "{%")):
            kind = "html"
        elif RULE_LINE.match(line):
            kind = "rule"
        else:
            kind = "text"
        yield start, line, kind, section


@functools.lru_cache(maxsize=None)
def listed_section(section: str) -> bool:
    """Související and Literatura are lists by nature."""
    return bool(REL_HEADING.match(section) or LIT_LIKE.match(section))


@functools.lru_cache(maxsize=None)
def bibliography_section(section: str) -> bool:
    return bool(LIT_LIKE.match(section))


def plain(text: str) -> str:
    """Prose without inline code, link targets and § numbers."""
    if "`" in text:
        text = INLINE_CODE.sub(" ", text)
    if "](" in text:
        text = LINK_TEXT.sub(r"\1", text)
    return PARAGRAPH_SIGN.sub(" ", text) if "§" in text else text


def cited_names(text: str) -> tuple:
    """(author citations found, the surnames they name, whether a statute is cited)."""
    found, names = 0, []
    if not FOUR_DIGITS.search(text):
        return 0, [], False  # every accepted form names a year
    for m in PAREN.finditer(text):
        for part in m.group(1).split(";"):
            if LAW_CITE.search(part):
                continue  # a statute, not an author
            for c in PAREN_CITE.finditer(part):
                found += 1
                names.extend(n for n in NAME_RE.findall(c.group(1)) if n not in NOT_AUTHOR)
    for c in NARRATIVE_CITE.finditer(text):
        if LAW_CITE.search(c.group(0)):
            continue
        found += 1
        names.extend(n for n in NAME_RE.findall(c.group(1)) if n not in NOT_AUTHOR)
    return found, names, bool(LAW_CITE.search(text))


def academic_profile(body: str, lines: list = None) -> dict:
    """List items, paragraphs, citations and the bibliography of a page body.

    A line is a list item when it starts with -, *, + or a number and a . or ), as CommonMark
    renders it: an ordered item interrupts an open paragraph only when its number is 1, so
    "2011) …" or "44. …" continuing a wrapped sentence is prose, not a list."""
    bullets, uncited, citations, names, statutes = [], 0, 0, [], 0
    lit_words, headings = set(), []
    paragraph, state, indent = [], "none", 0  # state: none, paragraph, list

    def flush():
        nonlocal uncited, citations, statutes
        if paragraph:
            text = plain(" ".join(paragraph))
            found, cited, law = cited_names(text)
            citations += found
            statutes += law
            names.extend(cited)
            if not found and not law and len(WORD.findall(text)) >= MIN_PARAGRAPH_WORDS:
                uncited += 1
            paragraph.clear()

    for _, line, kind, section in lines if lines is not None else body_lines(body):
        if kind == "heading" and len(HEADING_LINE.match(line).group(1)) == 2:
            headings.append(section)
        if bibliography_section(section) and kind not in ("fence", "generated", "heading"):
            lit_words.update(ASCII_WORD.findall(fold(plain(line))))
        if kind == "blank":
            flush()
            state = "list-gap" if state in ("list", "list-gap") else "none"
            continue
        if kind != "text" or listed_section(section):
            flush()
            if kind == "quote" and not listed_section(section):
                quoted = re.sub(r"^\s*(?:>\s?)+", "", line)
                if LIST_ITEM.match(quoted) and LIST_ITEM.match(quoted).group(2) in (None, "1"):
                    bullets.append(line.strip()[:60])
            state = "none"
            continue
        m = LIST_ITEM.match(line) if line.lstrip()[:1] in LIST_START else None
        if m and (state != "paragraph" or m.group(2) in (None, "1")):
            flush()
            bullets.append(line.strip()[:60])
            state, indent = "list", len(m.group(1))
            continue
        if state == "list" or (state == "list-gap" and len(line) - len(line.lstrip()) > indent):
            state = "list"  # a continuation of the list item, not a paragraph
            continue
        state = "paragraph"
        paragraph.append(line.strip())
    flush()
    lit = [i for i, h in enumerate(headings) if LIT_HEADING.match(h)]
    rel = [i for i, h in enumerate(headings) if REL_HEADING.match(h)]
    unresolved = []
    if names:
        prefixes = {fold(n)[:3] for n in names}
        prefixes |= {fold(part)[:3] for n in names for part in re.split(r"[\s\-'’]+", n)}
        literature = set().union(set(), *(forms(w) for w in lit_words if w[:3] in prefixes))
        unresolved = sorted({n for n in names if not resolved(n, literature)})
    return {
        "bullets": bullets,
        "uncited": uncited,
        "citations": citations,
        "bibliography_ok": bool(lit) and (not rel or lit[0] < rel[0]),
        "unresolved": unresolved,
    }


NLLB_BLOCK = re.compile(r"<!-- ENHANCED:NLLB-AUTO-BLOCK BEGIN -->.*?"
                        r"(?:<!-- ENHANCED:NLLB-AUTO-BLOCK END -->|\Z)", re.S)


def placeholder_markers(body: str, extra: dict) -> list:
    # Code samples may quote the markers they forbid; the NLLB block is requirement `generated`.
    prose = NLLB_BLOCK.sub("", FENCE.sub("", body))
    lower = prose.lower()
    found = [name for name, pattern in PLACEHOLDER
             if any(k in lower for k in PLACEHOLDER_KEYS[name]) and pattern.search(lower)]
    if ("NLLB" in prose or "ENHANCED:" in prose or "zero-stub" in prose) and FILLER.search(prose):
        found.append("filler-block")
    if extra.get("stub") or extra.get("placeholder"):
        found.append("stub-flag")
    return sorted(set(found))


def ea_mentions(body: str) -> list:
    prose = FENCE.sub("", body)
    return sorted({".".join(m.groups()) for m in EA_MENTION.finditer(prose)
                   if m.start() == 0 or not (prose[m.start() - 1].isalnum()
                                             or prose[m.start() - 1] in "_/-")})


def technique_codes(pages: list) -> set:
    """Codes X.Y.Z that have a technique page (file name ea-X-Y-Z… or extra.ea_code)."""
    codes = set()
    for page in pages:
        m = re.match(r"kompendium/techniques/ea-(\d+)-(\d+)-(\d+)", page["path"])
        if m:
            codes.add(".".join(m.groups()))
        extra = page.get("extra") or {}
        for code in [extra.get("ea_code", "")] + list(extra.get("ea_codes") or []):
            m = EA_MENTION.search(str(code))
            if m:
                codes.add(".".join(m.groups()))
    return codes


# Bold text. A **bold** span is either interactive (a link to the term's page) or a label;
# bold that names a term and leads nowhere is a dead end for the reader.
BOLD = re.compile(r"(?<![*\\])\*\*(?=\S)(.+?)(?<=\S)\*\*(?!\*)")
MAX_BOLD_WORDS = 6  # a longer bold span is a key sentence, not a term
RUN_IN = re.compile(r"^\s*(?:>\s*)*(?:(?:[-*+]|\d{1,9}[.)])\s+)?$")
EA_ONLY = re.compile(r"^ea-\d+-\d+(?:-\d+)?(?:-|$)")


def bold_spans(body: str, lines: list = None):
    """Yield (start, end, text, linked) for every bold span of a page body that is not a label.

    Structurally exempt (never a term use, so never yielded): headings, code, generated blocks,
    the Související and Literatura sections, a table's header row and the first cell of each
    row, a label (bold followed by ":" or ending in ":") and a key sentence (more than
    MAX_BOLD_WORDS words). `linked` is true for **[X](…)**, [**X**](…) and bold that holds a
    link; `text` is the span's text without link markup."""
    for offset, line, kind, section in lines if lines is not None else body_lines(body):
        if "**" not in line or kind not in ("text", "quote", "table") or listed_section(section):
            continue
        shield = [(m.start(), m.end()) for m in INLINE_CODE.finditer(line)]
        first_cell_end = line.find("|", line.find("|") + 1) if kind == "table" else -1
        for m in BOLD.finditer(line):
            if any(a <= m.start() < b for a, b in shield):
                continue
            if kind == "table" and m.start() < first_cell_end:
                continue
            inner = m.group(1).strip("*").strip()
            text = LINK_TEXT.sub(r"\1", inner).strip()
            if not text or text.endswith(":") or line[m.end():].lstrip().startswith(":"):
                continue  # a label
            if text.endswith(".") and RUN_IN.match(line[:m.start()]):
                continue  # a run-in heading: "**Pro instituce.** Text …"
            if len(text.split()) > MAX_BOLD_WORDS:
                continue
            linked = "](" in inner or (line[:m.start()].endswith("[")
                                       and line[m.end():].startswith("]("))
            yield offset + m.start(), offset + m.end(), text, linked


def bold_term_index(pages: list) -> dict:
    """slug -> glossary page for every name a glossary entry answers to: its title, the title
    without the parenthesised part, the parenthesised part (the alias: "Pseudověda
    (pseudoscience)"), extra.aliases and the file slug. A slug two entries claim is dropped."""
    claims = {}
    for page in pages:
        path = page["path"]
        if not path.startswith("glossary/") or page["is_index"]:
            continue
        title = page["title"].strip()
        names = {title, re.sub(r"\s*\([^)]*\)", "", title), pathlib.PurePosixPath(path).stem}
        names.update(re.findall(r"\(([^)]*)\)", title))
        aliases = (page.get("extra") or {}).get("aliases")
        if isinstance(aliases, list):
            names.update(str(a) for a in aliases)
        for name in names:
            key = slugify(name)
            if len(key) >= 2:
                claims.setdefault(key, set()).add(path)
    return {key: next(iter(paths)) for key, paths in claims.items() if len(paths) == 1}
