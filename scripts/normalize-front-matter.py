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
  - a description longer than 200 characters is shortened at the last sentence or clause
    boundary that fits (or at a word boundary with an ellipsis).

It changes nothing else: the result is parsed again and must equal the original apart from
the moved and inferred keys, or the page is left untouched and reported.

Usage:
  scripts/normalize-front-matter.py [path ...]   normalise content/ (or the given files and
                                                 directories)
  scripts/normalize-front-matter.py --check      exit 1 when a page would change
"""
import json
import pathlib
import re
import sys
import tomllib

ROOT = pathlib.Path(__file__).resolve().parent.parent
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
    tax = data.get("taxonomies") or {}
    if not is_section and not tax.get("tags") and isinstance(extra.get("tags"), list):
        data.setdefault("taxonomies", {})["tags"] = extra.pop("tags")
    elif rel and not is_section and not tax.get("tags"):
        data.setdefault("taxonomies", {})["tags"] = infer_tags(rel, before)
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
    if any(a in ("-h", "--help") for a in sys.argv[1:]):
        print(__doc__.strip())
        return 0
    unknown = [a for a in sys.argv[1:] if a.startswith("-") and a != "--check"]
    if unknown:
        print(f"normalize-front-matter: unknown option {unknown[0]}; see --help", file=sys.stderr)
        return 2
    args = [a for a in sys.argv[1:] if a != "--check"]
    check = "--check" in sys.argv[1:]
    paths = []
    for arg in args:
        path = pathlib.Path(arg)
        paths.extend(sorted(path.rglob("*.md")) if path.is_dir() else [path])
    paths = paths or sorted((ROOT / "content").rglob("*.md"))
    changed, refused = [], []
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
        if new != text:
            changed.append(path)
            if not check:
                path.write_text(new, encoding="utf-8")
    verb = "would change" if check else "normalised"
    print(f"normalize-front-matter: {verb} {len(changed)} page(s); left {len(refused)} alone")
    for path, problem in refused[:30]:
        print(f"  left alone {path}: {problem}")
    return 1 if check and changed else 0


if __name__ == "__main__":
    sys.exit(main())
