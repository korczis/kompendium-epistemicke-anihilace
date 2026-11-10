#!/usr/bin/env python3
"""Merge a duplicate page into the page that carries its content, keeping its address.

The platform created short-code stubs ("techniques/ea-1-1-1.md") next to the full pages
("techniques/ea-1-1-1-selektivni-expozice.md") so that links would resolve. This merges one:

  1. the full page gains a Zola alias for the stub's URL, so the old address redirects;
  2. every `@/stub.md` link in content/ is pointed at the full page (anchors kept);
  3. the stub is deleted (git keeps its history).

Usage:
  scripts/merge-duplicate.py <stub.md> <full.md> [<stub.md> <full.md> ...]
  scripts/merge-duplicate.py --help
Paths are relative to content/ or to the repository root. Refuses when either page is missing,
when they are the same page, or when the full page's front matter is not TOML.
"""
import json
import pathlib
import re
import sys
import tomllib

ROOT = pathlib.Path(__file__).resolve().parent.parent
CONTENT = ROOT / "content"
TOML_FM = re.compile(r"\A\+\+\+\n(.*?)\n\+\+\+\n", re.S)


def rel(arg: str) -> str:
    path = pathlib.Path(arg)
    if path.parts and path.parts[0] == "content":
        path = pathlib.Path(*path.parts[1:])
    return path.as_posix()


def url_of(path: str) -> str:
    parts = path.split("/")
    parts = parts[:-1] if parts[-1] in ("_index.md", "index.md") else parts[:-1] + [parts[-1][:-3]]
    return "/" + "/".join(parts) + "/"


def add_alias(full: pathlib.Path, alias: str) -> None:
    text = full.read_text(encoding="utf-8")
    m = TOML_FM.match(text)
    if not m:
        sys.exit(f"merge-duplicate: {full} has no TOML front matter")
    front = tomllib.loads(m.group(1))
    aliases = list(front.get("aliases", []))
    if alias in aliases:
        return
    aliases.append(alias)
    lines = m.group(1).split("\n")
    line = f"aliases = {json.dumps(aliases, ensure_ascii=False)}"
    for i, existing in enumerate(lines):
        if re.match(r"^aliases\s*=", existing):
            lines[i] = line
            break
    else:
        first_table = next((i for i, l in enumerate(lines) if l.startswith("[")), len(lines))
        while first_table > 0 and not lines[first_table - 1].strip():
            first_table -= 1
        lines.insert(first_table, line)
    full.write_text(f"+++\n" + "\n".join(lines) + "\n+++\n" + text[m.end():], encoding="utf-8")


def main() -> int:
    args = sys.argv[1:]
    if not args or any(a in ("-h", "--help") for a in args):
        print(__doc__.strip())
        return 0
    if any(a.startswith("-") for a in args) or len(args) % 2:
        print("merge-duplicate: give pairs of <stub.md> <full.md>; see --help", file=sys.stderr)
        return 2
    pairs = [(rel(args[i]), rel(args[i + 1])) for i in range(0, len(args), 2)]
    for stub, full in pairs:
        if stub == full or not (CONTENT / stub).is_file() or not (CONTENT / full).is_file():
            print(f"merge-duplicate: refused {stub} -> {full}", file=sys.stderr)
            return 2
    retargeted = 0
    for stub, full in pairs:
        add_alias(CONTENT / full, url_of(stub))
        pattern = re.compile(r"\]\(@/" + re.escape(stub) + r"(#[^)\s]*)?\)")
        for page in CONTENT.rglob("*.md"):
            if page == CONTENT / stub:
                continue
            text = page.read_text(encoding="utf-8")
            new = pattern.sub(lambda m: f"](@/{full}{m.group(1) or ''})", text)
            if new != text:
                page.write_text(new, encoding="utf-8")
                retargeted += 1
        (CONTENT / stub).unlink()
        print(f"merge-duplicate: {stub} -> {full} (alias {url_of(stub)})")
    print(f"merge-duplicate: {len(pairs)} merged, links retargeted on {retargeted} page(s)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
