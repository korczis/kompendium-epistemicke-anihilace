#!/usr/bin/env python3
"""One-shot migration of the Kompendium content out of the Prismatic Platform monorepo.

The book was written for the platform's Zola 0.21 promo site. This script makes it build on
its own with Zola 0.23 and GitHub Pages under a base path:

1. shortcodes become Tera 2 components (Zola 0.23 removed shortcodes);
2. platform-only template syntax (`import`, `fb::` macros) is removed;
3. links to pages not bundled here point at the original public site, so no reference is lost;
4. root-absolute links and script paths gain the Pages base path or become `@/` links.

It is idempotent: a second run changes nothing. Usage: scripts/migrate-content.py [--check]
"""

import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
CONTENT = ROOT / "content"
BASE_PATH = "/kompendium-epistemicke-anihilace"
ORIGIN = "https://prismatic-reality-com.github.io/prismatic-promo"

CROSS_LINK = re.compile(r"\{\{\s*cross_link\((?P<args>[^)]*)\)\s*\}\}")
CHART_INLINE = re.compile(r"\{\{\s*chart_inline\((?P<args>.*?)\)\s*\}\}", re.S)
CALLOUT_OPEN = re.compile(r"\{%\s*callout\((?P<args>[^)]*)\)\s*%\}")
CALLOUT_END = re.compile(r"\{%\s*end\s*%\}")
IMPORT = re.compile(r"^\{%-?\s*import\s+[^%]*%\}\s*\n", re.M)
FB_MACRO = re.compile(r"^\{\{\s*fb::[a-z0-9_]+\([^}]*\)\s*\}\}\s*\n", re.M)
ARG = re.compile(r'(\w+)\s*=\s*"((?:[^"\\]|\\.)*)"')
AT_LINK = re.compile(r"\]\(@/(?P<path>[^)#\s]+?)(?P<anchor>#[^)\s]*)?\)")
ROOT_LINK = re.compile(r"\]\((?P<path>/(?!/)[^)#\s]*)(?P<anchor>#[^)\s]*)?\)")
SCRIPT_SRC = re.compile(r'src="/js/')
# Chart.js and three.js are self-hosted and loaded by the base template (no CDN).
# Personal e-mail addresses do not belong in the public copy; every mailto link becomes Issues.
MAILTO = re.compile(r"\[[^\]]*\]\(mailto:[^)\s]+\)")
CDN_SCRIPT = re.compile(r'^<script src="https://cdn\.jsdelivr\.net/npm/[^"]+"></script>\s*\n', re.M)
REPO = "https://github.com/korczis/kompendium-epistemicke-anihilace"
# The monorepo the book came from is private; its links would be dead for public readers.
REPLACEMENTS = [
    ("https://github.com/korczis/prismatic-platform/blob/main/LICENSE", f"{REPO}/blob/main/LICENSE-CONTENT.md"),
    ("https://gitlab.com/korczis/prismatic-platform/-/issues", f"{REPO}/issues"),
    ("[GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform)",
     f"[GitHub]({REPO}) | [Wiki]({REPO}/wiki)"),
    ("https://github.com/korczis/prismatic-platform", REPO),
    ("[github.com/korczis/prismatic-platform](", "[github.com/korczis/kompendium-epistemicke-anihilace]("),
    ("[GitHub: korczis/prismatic-platform](", "[GitHub: korczis/kompendium-epistemicke-anihilace]("),
    ("[GitHub: prismatic-platform](", "[GitHub: kompendium-epistemicke-anihilace]("),
    ("[korczis/prismatic-platform](", "[korczis/kompendium-epistemicke-anihilace]("),
    ("https://gitlab.com/korczis/prismatic-platform", REPO),
    ("Open Source under", "Licence:"),
]


def component(name, args, body=False):
    attrs = " ".join(f'{key}="{value}"' for key, value in ARG.findall(args))
    return f"{{% <{name} {attrs}> %}}" if body else f"{{{{ <{name} {attrs} /> }}}}"


def bundled(rel):
    """The content file a site path or @/ path names, if it is part of this repository."""
    rel = rel.strip("/")
    if rel.endswith(".md"):
        return (CONTENT / rel).is_file()
    return (CONTENT / f"{rel}.md").is_file() or (CONTENT / rel / "_index.md").is_file()


def at_path(rel):
    rel = rel.strip("/")
    if not rel:
        return "_index.md"
    if rel.endswith(".md"):
        return rel
    return f"{rel}.md" if (CONTENT / f"{rel}.md").is_file() else f"{rel}/_index.md"


def origin_url(rel):
    rel = rel.strip("/")
    rel = re.sub(r"(/?_index)?\.md$", "", rel)
    return f"{ORIGIN}/{rel}/" if rel else f"{ORIGIN}/"


def fix_at_link(match):
    path, anchor = match["path"], match["anchor"] or ""
    if bundled(path):
        return match.group(0)
    return f"]({origin_url(path)}{anchor})"


def fix_root_link(match):
    path, anchor = match["path"], match["anchor"] or ""
    if path.startswith(BASE_PATH):
        return match.group(0)
    if bundled(path):
        return f"](@/{at_path(path)}{anchor})"
    if re.search(r"\.[a-z0-9]{2,5}$", path):
        return f"]({BASE_PATH}{path}{anchor})"
    return f"]({origin_url(path)}{anchor})"


def migrate(text):
    text = CROSS_LINK.sub(lambda m: component("cross_link", m["args"]), text)
    text = CHART_INLINE.sub(lambda m: component("chart_inline", m["args"]), text)
    if CALLOUT_OPEN.search(text):
        text = CALLOUT_OPEN.sub(lambda m: component("callout", m["args"], body=True), text)
        text = CALLOUT_END.sub("{% </callout> %}", text)
    text = IMPORT.sub("", text)
    text = FB_MACRO.sub("", text)
    text = AT_LINK.sub(fix_at_link, text)
    text = ROOT_LINK.sub(fix_root_link, text)
    text = SCRIPT_SRC.sub(f'src="{BASE_PATH}/js/', text)
    text = CDN_SCRIPT.sub("", text)
    for old, new in REPLACEMENTS:
        text = text.replace(old, new)
    text = MAILTO.sub(f"[GitHub Issues]({REPO}/issues)", text)
    return text


def main():
    check = "--check" in sys.argv
    changed = []
    for path in sorted(CONTENT.rglob("*.md")):
        before = path.read_text(encoding="utf-8")
        after = migrate(before)
        if after != before:
            changed.append(path.relative_to(ROOT))
            if not check:
                path.write_text(after, encoding="utf-8")
    verb = "would change" if check else "changed"
    print(f"{verb} {len(changed)} file(s)")
    return 1 if check and changed else 0


if __name__ == "__main__":
    sys.exit(main())
