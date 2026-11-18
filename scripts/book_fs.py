"""book_fs.py — the leaf filesystem / slug / front-matter primitives shared by the book's scripts.

A single source for the handful of things every generator and checker had copied. dev-31's DRY
audit (2026-11-17) measured the duplication: front_matter ×9, TOML_FM ×5, the slug ×6 (and
ia_model.zola_slug == ia_model.slugify in one file), the EA-code path regex ×10, plus url_of,
plural and reads of the static/data JSON. The owner's order is no duplication: extend one generic
mechanism instead of copying it.

This module imports nothing from the project on purpose — it must stay a *leaf* (ia_model imports
listings, so ia_model cannot be the home). ia_model re-exports these names, so every existing
`from ia_model import front_matter, zola_slug, …` keeps working unchanged; new code imports here.

Every derived output stays byte-identical after a call site moves onto these functions; that is the
acceptance test (scripts/check-derived-currency.sh --check, all green).
"""
import json
import pathlib
import re
import unicodedata

try:
    import tomllib
except ModuleNotFoundError:  # pragma: no cover - Python < 3.11
    import tomli as tomllib

ROOT = pathlib.Path(__file__).resolve().parent.parent
CONTENT = ROOT / "content"
DATA = ROOT / "static" / "data"

# Front matter. TOML (+++) is the book's form; YAML (---) is accepted where a caller still reads it.
TOML_FM = re.compile(r"\A\+\+\+\n(.*?)\n\+\+\+\n", re.S)
YAML_FM = re.compile(r"\A---\n(.*?)\n---\n", re.S)

# EA codes. EA_CODE is the dotted form as it appears in prose ("EA-5.1.9"); TECHNIQUE_PATH is the
# hyphenated form in a technique page's path ("kompendium/techniques/ea-5-1-9-…").
EA_CODE = re.compile(r"EA-(\d+)\.(\d+)\.(\d+)")
TECHNIQUE_PATH = re.compile(r"kompendium/techniques/ea-(\d+)-(\d+)-(\d+)")


def front_matter(path) -> tuple:
    """(front_matter dict, body) of a content file. A caller wanting only the dict takes ``[0]``.

    ``path`` is a str relative to content/ or a pathlib.Path. With no TOML header the dict is empty
    and the body is the whole text — the behaviour every per-script copy had.
    """
    p = path if isinstance(path, pathlib.Path) else CONTENT / path
    text = p.read_text(encoding="utf-8")
    m = TOML_FM.match(text)
    return (tomllib.loads(m.group(1)) if m else {}), (text[m.end():] if m else text)


def zola_slug(component: str) -> str:
    """A path component as Zola writes it with the default ``slugify.paths = "on"``: ASCII, lower
    case, every run of other characters one hyphen, no hyphen at either end. Pages are served at
    these paths, and GitHub Pages is case-sensitive, so this must match Zola exactly."""
    text = unicodedata.normalize("NFKD", component).encode("ascii", "ignore").decode().lower()
    return re.sub(r"[^a-z0-9]+", "-", text).strip("-")


def url_of(rel: pathlib.PurePosixPath) -> str:
    """The URL Zola serves a content path at ("a/B/index.md" -> "/a/b/")."""
    parts = list(rel.parts)
    if parts[-1] in ("_index.md", "index.md"):
        parts = parts[:-1]
    else:
        parts[-1] = parts[-1][:-3]
    parts = [zola_slug(p) for p in parts]
    return "/" + "/".join(parts) + ("/" if parts else "")


def technique_code(path) -> tuple | None:
    """(family, group, item) ints of a technique page's EA code from its path, or None when the
    path is not a technique page."""
    m = TECHNIQUE_PATH.search(str(path))
    return (int(m.group(1)), int(m.group(2)), int(m.group(3))) if m else None


def read_data(name: str):
    """A parsed static/data JSON, e.g. read_data("graph.json") or read_data("listings/x.json")."""
    return json.loads((DATA / name).read_text(encoding="utf-8"))


def plural(n: int, forms) -> str:
    """Czech count form: forms[0] for 1, forms[1] for 2–4, forms[2] otherwise."""
    return forms[0] if n == 1 else forms[1] if 2 <= n <= 4 else forms[2]
