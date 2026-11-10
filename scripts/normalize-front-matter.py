#!/usr/bin/env python3
"""Normalise page front matter so Zola and the templates see every page's metadata.

Three defects hid pages from the site's description, tag taxonomy and related-pages logic:

  - `description` written under [extra], where Zola does not read it as the page description;
  - `tags` written under [extra] instead of [taxonomies];
  - YAML front matter (---), which the rest of the book does not use.

This script moves both keys to where Zola reads them and converts YAML front matter to TOML.
Two values are inferred where the page has none that fits the architecture:

  - a page (not a section) with no tags at all gets tags from where it is: its top-level
    section, its directory and its extra.category (all as slugs);
  - extra.risk_level written in Czech ("kritická") becomes the code the templates read
    ("critical");
  - a description longer than 200 characters is shortened at the last sentence or clause
    boundary that fits (or at a word boundary with an ellipsis).

Keys that only duplicate what Zola and static/data/graph.json compute, or that no template
reads, are removed from [extra] (an [extra] table they leave empty goes with them):

  - extra.word_count, extra.reading_time (Zola's page.word_count and page.reading_time),
    extra.quality_score, extra.ref_count_at_creation (scripts/build-graph.py derives the
    metrics);
  - extra.parent (the hierarchy is the directory tree; no template reads it).

It changes nothing else: the result is parsed again and must equal the original apart from
the moved, inferred and removed keys, or the page is left untouched and reported.

Usage:
  scripts/normalize-front-matter.py [path ...]   normalise content/ (or the given files and
                                                 directories); --fix says the same explicitly
  scripts/normalize-front-matter.py --check      exit 1 when a page would change (this is the
                                                 enforcement: a removed key written again fails)
                                                 or carries a wrong controlled value
  scripts/normalize-front-matter.py --list unknown-keys
                                                 keys (or page classes) the schema has no row
                                                 for: report only; add a row to
                                                 data/front-matter.toml
  scripts/normalize-front-matter.py --doc        print the schema as a Markdown table
  scripts/normalize-front-matter.py --doc --check / --doc --fix
                                                 fail when the copy in the rule
                                                 information-architecture.v1.md is stale / write it

Every key is a row of data/front-matter.toml (where it lives, page classes, authored / derived /
forbidden, type, controlled values): --check refuses forbidden keys and wrong controlled values
(any mode exits 1 on a wrong value: only a person can choose the right one).
"""
import json
import pathlib
import re
import sys
import tomllib

ROOT = pathlib.Path(__file__).resolve().parent.parent
sys.dont_write_bytecode = True  # no __pycache__ in the checkout
sys.path.insert(0, str(ROOT / "scripts"))
from ia_model import page_class  # noqa: E402
TOML_FM = re.compile(r"\A\+\+\+\n(.*?)\n\+\+\+\n", re.S)
YAML_FM = re.compile(r"\A---\n(.*?)\n---\n", re.S)
TABLE = re.compile(r"^\[([^\]]+)\]\s*$")


def toml_value(value) -> str:
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, (int, float)):
        return str(value)
    if isinstance(value, list):
        return "[" + ", ".join(toml_value(v) for v in value) + "]"
    return json.dumps(str(value), ensure_ascii=False)


def yaml_scalar(raw: str):
    raw = raw.strip()
    if raw.startswith("[") and raw.endswith("]"):
        return [yaml_scalar(x) for x in raw[1:-1].split(",") if x.strip()]
    if len(raw) >= 2 and raw[0] == raw[-1] and raw[0] in "\"'":
        return raw[1:-1]
    if raw in ("true", "false"):
        return raw == "true"
    if re.fullmatch(r"-?\d+", raw):
        return int(raw)
    return raw


def yaml_to_toml(text: str):
    """Convert the flat YAML subset these pages use (scalars, one level of maps, lists)."""
    top, tables, current, last_key = {}, {}, None, None
    for line in text.split("\n"):
        if not line.strip() or line.lstrip().startswith("#"):
            continue
        m = re.match(r"^(\w[\w-]*):\s*(.*)$", line)
        if m:
            key, value = m.groups()
            if value == "":
                current, last_key = tables.setdefault(key, {}), key
            else:
                top[key], current, last_key = yaml_scalar(value), None, key
            continue
        m = re.match(r"^\s+(\w[\w-]*):\s*(.*)$", line)
        if m and current is not None:
            current[m.group(1)] = yaml_scalar(m.group(2))
            continue
        m = re.match(r"^\s*-\s+(.*)$", line)
        if m and last_key is not None:
            target = top if current is None else current
            if current is not None and not current:
                tables[last_key] = []
                target, current = None, None
                top.setdefault(last_key, [])
                top[last_key].append(yaml_scalar(m.group(1)))
                del tables[last_key]
                continue
            (target if target is not None else top).setdefault(last_key, [])
            continue
        return None  # a construct outside the subset: leave the page alone
    if "date" in top and isinstance(top["date"], str) and re.fullmatch(r"\d{4}-\d{2}-\d{2}", top["date"]):
        date = top.pop("date")
    else:
        date = None
    lines = [f"{k} = {toml_value(v)}" for k, v in top.items()]
    if date:
        lines.insert(1 if lines else 0, f"date = {date}")
    for name, table in tables.items():
        if isinstance(table, dict):
            lines.append(f"[{name}]")
            lines.extend(f"{k} = {toml_value(v)}" for k, v in table.items())
    return "\n".join(lines)


def split_tables(fm: str):
    """Front matter as (top-level lines, [(table header, lines)])."""
    top, tables, current = [], [], None
    for line in fm.split("\n"):
        m = TABLE.match(line)
        if m:
            current = (m.group(1).strip(), [])
            tables.append(current)
        elif current is None:
            top.append(line)
        else:
            current[1].append(line)
    return top, tables


def take_key(lines: list, key: str):
    """Remove `key = …` (possibly a multi-line array) from lines; return its source text."""
    for i, line in enumerate(lines):
        if re.match(rf"^{re.escape(key)}\s*=", line):
            end = i
            if line.split("=", 1)[1].strip().startswith("[") and "]" not in line.split("=", 1)[1]:
                while end + 1 < len(lines) and "]" not in lines[end]:
                    end += 1
            taken = lines[i:end + 1]
            del lines[i:end + 1]
            return "\n".join(taken)
    return None


def slugify(text: str) -> str:
    import unicodedata
    text = unicodedata.normalize("NFKD", text).encode("ascii", "ignore").decode().lower()
    return re.sub(r"[^a-z0-9]+", "-", text).strip("-")


def infer_tags(rel: str, data: dict) -> list:
    parts = pathlib.PurePosixPath(rel).parts
    tags = [parts[0]] if len(parts) > 1 else ["kompendium"]  # a root page belongs to the book
    if len(parts) > 2:
        tags.append(slugify(parts[1]))
    category = (data.get("extra") or {}).get("category")
    if isinstance(category, str) and slugify(category):
        tags.append(slugify(category))
    return list(dict.fromkeys(t for t in tags if t))


def fit_description(text: str, limit: int = 200) -> str:
    text = " ".join(text.split())
    if len(text) <= limit:
        return text
    head = text[:limit]
    for mark in (". ", "; ", " – ", " — ", ", "):
        cut = head.rfind(mark)
        if cut >= 80:
            kept = head[:cut + (1 if mark == ". " else 0)].rstrip(" ,;–—")
            return kept if kept.endswith(".") else kept + "."
    return head[:head.rfind(" ")].rstrip(" ,;–—") + "…"


def set_scalar(lines: list, key: str, value: str) -> bool:
    for i, line in enumerate(lines):
        if re.match(rf"^{re.escape(key)}\s*=\s*\"", line) and line.rstrip().endswith('"'):
            lines[i] = f"{key} = {json.dumps(value, ensure_ascii=False)}"
            return True
    return False


# ---------------------------------------------------------------------------------------------
# The front-matter schema lives in data/front-matter.toml (its header documents the fields): one
# row per key the book's pages carry. It is the single source for what --check enforces
# (forbidden keys, controlled values), for `--list unknown-keys` (a key or page class with no
# row: report only, so a new key is added by adding a row) and for the table `--doc` prints into
# .ai/repo/rules/project/information-architecture.v1.md.
SCHEMA_FILE = ROOT / "data" / "front-matter.toml"
ROW_FIELDS = {"where", "key", "type", "classes", "kind", "derived", "inferred", "values",
              "pattern"}


def load_schema(path: pathlib.Path = SCHEMA_FILE) -> list:
    data = tomllib.loads(path.read_text(encoding="utf-8"))
    sets = data.get("values", {})
    rows = []
    for i, raw in enumerate(data.get("keys", [])):
        stray = set(raw) - ROW_FIELDS
        missing = {"where", "key", "type", "classes"} - set(raw)
        if stray or missing or raw["where"] not in ("top", "taxonomies", "extra"):
            raise SystemExit(f"normalize-front-matter: {path.relative_to(ROOT)} row {i + 1} "
                             f"({raw.get('key')}): bad fields {sorted(stray | missing)}")
        values = raw.get("values")
        if isinstance(values, str):
            if values not in sets:
                raise SystemExit(f"normalize-front-matter: row {raw['key']}: no value set {values}")
            values = sets[values]
        kind = raw.get("kind") or ("derived" if raw.get("derived") else "authored")
        if kind not in ("authored", "derived", "forbidden"):
            raise SystemExit(f"normalize-front-matter: row {raw['key']}: unknown kind {kind}")
        rows.append({"where": raw["where"], "key": raw["key"], "type": raw["type"],
                     "classes": raw["classes"].split(), "kind": kind,
                     "derived": raw.get("derived"), "inferred": raw.get("inferred"),
                     "values": tuple(values) if values is not None else None,
                     "pattern": raw.get("pattern")})
    return rows


SCHEMA = load_schema()
FORBIDDEN_EXTRA = tuple(r["key"] for r in SCHEMA
                        if r["kind"] == "forbidden" and r["where"] == "extra")
WHERE_ORDER = {"top": 0, "taxonomies": 1, "extra": 2}
KIND_CS = {"authored": "autorský", "derived": "odvozený", "forbidden": "zakázaný"}


def schema_row(where: str, key: str, page_class: str):
    """The schema row for a key on a page of this class, or None (an unknown key)."""
    general = None
    for r in SCHEMA:
        if r["where"] != where or not (r["key"] == key or r["key"].endswith("*")
                                       and key.startswith(r["key"][:-1])):
            continue
        if page_class in r["classes"]:
            return r
        if "*" in r["classes"] and general is None:
            general = r
    return general


def schema_findings(data: dict, page_class: str) -> tuple:
    """(wrong controlled values, unknown keys) of a parsed front matter."""
    wrong, unknown = [], []
    for where, table in (("top", data), ("taxonomies", data.get("taxonomies")),
                         ("extra", data.get("extra"))):
        if not isinstance(table, dict):
            continue
        for key, value in table.items():
            if where == "top" and key in ("taxonomies", "extra") and isinstance(value, dict):
                continue
            r = schema_row(where, key, page_class)
            if r is None:
                unknown.append(f"{where}.{key}")
                continue
            if r["values"] is not None and value not in r["values"]:
                wrong.append(f"{where}.{key} = {value!r} (allowed: {', '.join(r['values'])})")
            elif r["pattern"] and not (isinstance(value, str)
                                       and re.fullmatch(r["pattern"], value)):
                wrong.append(f"{where}.{key} = {value!r} (allowed: {r['pattern']})")
    return wrong, unknown


def schema_doc() -> str:
    """The schema as the Markdown table the rule document carries (generated, never edited)."""
    lines = ["| oddíl | klíč | třídy stránek | povaha | typ | povolené hodnoty |",
             "|---|---|---|---|---|---|"]
    for r in sorted(SCHEMA, key=lambda r: (WHERE_ORDER[r["where"]], r["key"], r["classes"])):
        kind = KIND_CS[r["kind"]]
        if r["derived"]:
            kind += f" (`{r['derived']}`)"
        if r["inferred"]:
            kind += f", chybí-li, doplní `{r['inferred']}`"
        allowed = ", ".join(f"`{v}`" for v in r["values"]) if r["values"] else (
            f"`{r['pattern']}`" if r["pattern"] else "")
        allowed = allowed.replace("|", "\\|")
        classes = "všechny" if r["classes"] == ["*"] else ", ".join(r["classes"])
        types = ", ".join(r["type"].split("|"))  # a | would split the Markdown cell
        lines.append(f"| {r['where']} | `{r['key']}` | {classes} | {kind} | {types} | "
                     f"{allowed} |")
    return "\n".join(lines) + "\n"


RULE_DOC = ROOT / ".ai" / "repo" / "rules" / "project" / "information-architecture.v1.md"
DOC_BEGIN = ("<!-- front-matter-schema:begin (scripts/normalize-front-matter.py --doc;"
             " neupravovat ručně) -->")
DOC_END = "<!-- front-matter-schema:end -->"
DOC_REGION = re.compile(r"(<!-- front-matter-schema:begin[^>]*-->\n).*?"
                        r"(<!-- front-matter-schema:end -->)", re.S)


def doc_command(args: list) -> int:
    """--doc prints the table; --doc --check fails when the rule document's copy is stale;
    --doc --fix writes it there."""
    table = schema_doc()
    if "--check" not in args and "--fix" not in args:
        print(table, end="")
        return 0
    text = RULE_DOC.read_text(encoding="utf-8")
    m = DOC_REGION.search(text)
    if not m:
        print(f"normalize-front-matter: {RULE_DOC.relative_to(ROOT)} has no {DOC_BEGIN} region")
        return 1
    fresh = text[:m.start()] + m.group(1) + table + m.group(2) + text[m.end():]
    if fresh == text:
        print("normalize-front-matter: the schema table is up to date")
        return 0
    if "--check" in args:
        print(f"normalize-front-matter: the schema table in {RULE_DOC.relative_to(ROOT)} is stale;"
              " run scripts/normalize-front-matter.py --doc --fix")
        return 1
    RULE_DOC.write_text(fresh, encoding="utf-8")
    print("normalize-front-matter: schema table written")
    return 0


# Controlled values of extra.risk_level: the codes the templates read. A Czech spelling of a
# code is mapped to the code, so a page and the hero card cannot disagree.
RISK_ALIASES = {"kritická": "critical", "kriticka": "critical", "kritické": "critical"}


def normalise_toml(fm: str, is_section: bool, rel: str = "") -> str:
    data = tomllib.loads(fm)
    extra = data.get("extra") or {}
    top, tables = split_tables(fm)
    tables_by_name = {name: lines for name, lines in tables}
    if not data.get("description") and isinstance(extra, dict) and extra.get("description"):
        moved = take_key(tables_by_name["extra"], "description")
        if moved:
            top.append(moved)
    taxonomies = data.get("taxonomies") or {}
    # Zola sections (_index.md) take no taxonomies; their extra.tags stay where they are.
    if (not is_section and not taxonomies.get("tags") and isinstance(extra, dict)
            and isinstance(extra.get("tags"), list)):
        moved = take_key(tables_by_name["extra"], "tags")
        if moved:
            if "taxonomies" in tables_by_name:
                tables_by_name["taxonomies"].append(moved)
            else:
                tables.insert(0, ("taxonomies", [moved]))
    description = data.get("description") or (extra.get("description") if isinstance(extra, dict) else None)
    if isinstance(description, str) and len(" ".join(description.split())) > 200:
        set_scalar(top, "description", fit_description(description))
    taxonomies = data.get("taxonomies") or {}
    has_tags = taxonomies.get("tags") or (isinstance(extra, dict) and isinstance(extra.get("tags"), list))
    if rel and not is_section and not has_tags:
        line = f"tags = {toml_value(infer_tags(rel, data))}"
        if "taxonomies" in tables_by_name:
            table = tables_by_name["taxonomies"]
            take_key(table, "tags")  # an empty `tags = []` is replaced, never duplicated
            table.append(line)
        else:
            tables.insert(0, ("taxonomies", [line]))
    risk = (extra.get("risk_level") if isinstance(extra, dict) else None)
    if isinstance(risk, str) and risk.strip().lower() in RISK_ALIASES and "extra" in tables_by_name:
        set_scalar(tables_by_name["extra"], "risk_level", RISK_ALIASES[risk.strip().lower()])
    if isinstance(extra, dict) and "extra" in tables_by_name:
        removed = [take_key(tables_by_name["extra"], key)
                   for key in FORBIDDEN_EXTRA if key in extra]
        if any(removed) and not any(l.strip() for l in tables_by_name["extra"]):
            tables[:] = [(n, l) for n, l in tables if n != "extra"]
    while top and not top[-1].strip():
        top.pop()
    out = list(top)
    for name, lines in tables:
        while lines and not lines[-1].strip():
            lines.pop()
        while lines and not lines[0].strip():
            lines.pop(0)
        out.extend(["", f"[{name}]"])
        out.extend(lines)
    return "\n".join(out)


def expected(before: dict, is_section: bool, rel: str = "") -> dict:
    data = json.loads(json.dumps(before, default=str))
    extra = data.get("extra") or {}
    if not data.get("description") and extra.get("description"):
        data["description"] = extra.pop("description")
    if isinstance(data.get("description"), str) and len(" ".join(data["description"].split())) > 200:
        data["description"] = fit_description(data["description"])
    risk = extra.get("risk_level")
    if isinstance(risk, str) and risk.strip().lower() in RISK_ALIASES:
        extra["risk_level"] = RISK_ALIASES[risk.strip().lower()]
    tax = data.get("taxonomies") or {}
    if not is_section and not tax.get("tags") and isinstance(extra.get("tags"), list):
        data.setdefault("taxonomies", {})["tags"] = extra.pop("tags")
    elif rel and not is_section and not tax.get("tags"):
        data.setdefault("taxonomies", {})["tags"] = infer_tags(rel, before)
    removed = [extra.pop(key) for key in FORBIDDEN_EXTRA if key in extra]
    if removed and "extra" in data and not data["extra"]:
        del data["extra"]
    if "extra" in data and not data["extra"] and "extra" not in before:
        del data["extra"]
    return data


def normalise(text: str, is_section: bool = False, rel: str = ""):
    m = TOML_FM.match(text)
    if m:
        fm = m.group(1)
        before = tomllib.loads(fm)
        rest = text[m.end():]
    else:
        m = YAML_FM.match(text)
        if not m:
            return text, None
        fm = yaml_to_toml(m.group(1))
        if fm is None:
            return text, "YAML outside the supported subset"
        before = tomllib.loads(fm)
        rest = text[m.end():]
    new_fm = normalise_toml(fm, is_section, rel)
    after = tomllib.loads(new_fm)
    if json.loads(json.dumps(after, default=str)) != expected(before, is_section, rel):
        return text, "result differs from the original beyond the moved keys"
    return f"+++\n{new_fm}\n+++\n{rest}", None


def main() -> int:
    argv = sys.argv[1:]
    if any(a in ("-h", "--help") for a in argv):
        print(__doc__.strip())
        return 0
    known = ("--check", "--fix", "--doc", "--list")
    unknown = [a for a in argv if a.startswith("-") and a not in known]
    if unknown:
        print(f"normalize-front-matter: unknown option {unknown[0]}; see --help", file=sys.stderr)
        return 2
    if "--doc" in argv:
        return doc_command(argv)
    listing = None
    if "--list" in argv:
        i = argv.index("--list")
        listing = argv[i + 1] if i + 1 < len(argv) else ""
        if listing != "unknown-keys":
            print("normalize-front-matter: --list takes unknown-keys", file=sys.stderr)
            return 2
        argv = argv[:i] + argv[i + 2:]
    args = [a for a in argv if a not in ("--check", "--fix")]
    check = "--check" in argv or listing is not None
    paths = []
    for arg in args:
        path = pathlib.Path(arg)
        paths.extend(sorted(path.rglob("*.md")) if path.is_dir() else [path])
    paths = paths or sorted((ROOT / "content").rglob("*.md"))
    changed, refused, invalid, unknown_keys = [], [], [], []
    for path in paths:
        text = path.read_text(encoding="utf-8")
        try:
            try:
                rel = path.resolve().relative_to(ROOT / "content").as_posix()
            except ValueError:
                rel = ""
            new, problem = normalise(text, path.name == "_index.md", rel)
        except tomllib.TOMLDecodeError as exc:
            new, problem = text, f"front matter does not parse: {exc}"
        if problem:
            refused.append((path, problem))
            continue
        m = TOML_FM.match(new)
        if m:  # the schema judges the normalised front matter (an alias fixed is not wrong)
            cls = page_class(rel or path.name)
            wrong, extra_keys = schema_findings(tomllib.loads(m.group(1)), cls)
            invalid.extend((path, w) for w in wrong)
            unknown_keys.extend((path, k, cls) for k in extra_keys)
        if new != text:
            changed.append(path)
            if not check:
                path.write_text(new, encoding="utf-8")
    if listing == "unknown-keys":
        for path, key, cls in unknown_keys:
            print(f"{path}\t{key}\t{cls}")
        return 0
    verb = "would change" if check else "normalised"
    print(f"normalize-front-matter: {verb} {len(changed)} page(s); left {len(refused)} alone; "
          f"{len(invalid)} wrong controlled value(s); {len(unknown_keys)} key(s) outside the "
          "schema (--list unknown-keys)")
    for path, problem in refused[:30]:
        print(f"  left alone {path}: {problem}")
    for path, problem in invalid[:30]:
        print(f"  wrong value {path}: {problem}")
    return 1 if (check and changed) or invalid else 0


if __name__ == "__main__":
    sys.exit(main())
