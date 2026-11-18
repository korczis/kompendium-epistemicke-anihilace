#!/usr/bin/env bash
# ui-components: one layout and one set of Flowbite Pro components (templates/macros/). Before
# 2026-11-17 eight templates each built their own page wrapper and grid, the select class list was
# typed 17 times, the field label 29, the card shell 40+, badges about 45 and buttons in six
# paddings; every page was aligned differently. Now templates/macros/layout.html owns the page
# wrapper and width and templates/macros/ui.html the class lists. On a copy of the committed tree:
#
#  - no template outside templates/macros/ and the shell partials types a raw Flowbite class list
#    of a form control (input, select), a field label, a card shell, a badge or a button, a page
#    wrapper (px-4 pt-6) or a page width (max-w-screen-*, max-w-2xl…7xl, max-w-prose, max-w-[Nch],
#    mx-auto with a max-w-*);
#  - every template that renders a page through base.html uses page_layout (404 and home included)
#    and the page header (partials/header.html or layout.html page_header);
#  - each kind of planted violation is refused, and the same markup inside templates/macros/ is not.
set -euo pipefail
root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case59.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"

cat > "$work/ui_check.py" <<'EOF'
"""Refuse raw Flowbite class lists and page wrappers outside templates/macros/ and the shell."""
import pathlib, re, sys

TEMPLATES = pathlib.Path(sys.argv[1])
# The admin shell around every page (navbar, sidebar, command palette, footer) and the page
# header bar are the shell: they keep their own Pro markup (the navbar search is its own input).
SHELL = {"partials/nav.html", "partials/sidebar.html", "partials/sidebar_pages.html",
         "partials/sidebar_subtree.html", "partials/paleta.html", "partials/footer.html",
         "partials/header.html", "partials/subnav.html"}
# Content components render inside the reading column, where a figure may center its canvas.
WIDTH_EXEMPT = {"components.html"}
WIDTH = re.compile(r"^(?:[\w-]+:)*max-w-(?:screen-\w+|[2-7]xl|prose|\[\d+(?:\.\d+)?ch\])$")


def has(t, *xs):
    return any(x in t for x in xs)


def kinds(t, rel):
    out = []
    if {"border-gray-300", "bg-gray-50"} <= t and has(t, "p-2.5", "p-2", "py-2.5"):
        out.append("form control (ui.html select_field / search_field / control_class)")
    if {"block", "font-medium", "text-gray-900"} <= t and has(t, "mb-1", "mb-2"):
        out.append("field label (ui.html field_label)")
    if {"rounded-lg", "bg-white", "shadow"} <= t and not has(t, "z-10", "z-50", "absolute", "fixed"):
        out.append("card shell (ui.html card / kpi)")
    if ("text-xs" in t and "font-medium" in t and has(t, "rounded-md", "rounded-full", "rounded-sm", "rounded")
            and has(t, "px-1.5", "px-2", "px-2.5") and any(re.fullmatch(r"bg-\w+-100", x) for x in t)):
        out.append("badge (ui.html badge)")
    if ({"rounded-lg", "text-sm", "font-medium"} <= t and has(t, "px-3", "px-4", "px-5")
            and has(t, "py-1.5", "py-2", "py-2.5", "py-3")
            and has(t, "bg-primary-700", "bg-red-700", "bg-yellow-700", "border-gray-300", "border-gray-200")):
        out.append("button (ui.html button)")
    if {"px-4", "pt-6"} <= t:
        out.append("page wrapper (layout.html page_layout)")
    if rel not in WIDTH_EXEMPT and (any(WIDTH.match(x) for x in t) or ("mx-auto" in t and any("max-w-" in x for x in t))):
        out.append("page width (layout.html page_layout, ui.html prose)")
    return out


found = []
for f in sorted(TEMPLATES.rglob("*.html")):
    rel = f.relative_to(TEMPLATES).as_posix()
    if rel.startswith("macros/") or rel in SHELL:
        continue
    text = f.read_text(encoding="utf-8")
    for n, line in enumerate(text.splitlines(), 1):
        # A class list is a run between quotes or Tera braces, so a list held in a variable or an
        # Alpine :class string is judged like a class attribute.
        for seg in re.split(r"[\"'`{}<>]", line):
            t = set(seg.split())
            if len(t) > 1:
                found += [f"templates/{rel}:{n}: raw {k}" for k in kinds(t, rel)]
    if re.search(r'\{%-?\s*extends\s+"base\.html"', text):
        if "<page_layout" not in text:
            found.append(f"templates/{rel}: renders a page without layout.html page_layout")
        if 'include "partials/header.html"' not in text and "<page_header" not in text:
            found.append(f"templates/{rel}: renders a page without the page header")
for line in found:
    print(line)
sys.exit(1 if found else 0)
EOF
check() { python3 "$work/ui_check.py" "$1"; }

check templates || { echo "case 59: the committed templates type raw UI class lists (above)"; exit 1; }

# Every kind of violation, planted in a partial, is refused; the same lines in macros/ are not.
plant() {
  local name=$1 html=$2
  local copy="$work/t-$name"
  rm -rf "$copy"; cp -R templates "$copy"
  printf '%s\n' "$html" > "$copy/partials/c59-$name.html"
  if check "$copy" >"$work/out" 2>&1; then echo "case 59: planted $name was not refused"; exit 1; fi
  printf '%s\n' "$html" > "$copy/macros/c59-$name.html"; rm "$copy/partials/c59-$name.html"
  check "$copy" >"$work/out" 2>&1 || { echo "case 59: $name inside macros/ was refused"; cat "$work/out"; exit 1; }
}
plant select '<select class="block w-full rounded-lg border border-gray-300 bg-gray-50 p-2.5 text-sm"></select>'
plant label '<label class="mb-2 block text-sm font-medium text-gray-900 dark:text-white">Pole</label>'
plant card '<section class="rounded-lg bg-white p-4 shadow sm:p-6 dark:bg-gray-800"></section>'
plant badge '<span class="rounded-md bg-primary-100 px-2.5 py-0.5 text-xs font-medium text-primary-800">EA</span>'
plant button '<a class="inline-flex rounded-lg bg-primary-700 px-5 py-2.5 text-sm font-medium text-white">Číst</a>'
plant variable '{%- set btn = "rounded-lg border border-gray-300 bg-white px-5 py-2.5 text-sm font-medium" -%}'
plant wrapper '<div class="grid grid-cols-1 gap-4 px-4 pt-6 xl:grid-cols-4"></div>'
plant width '<div class="mx-auto max-w-screen-xl px-4"></div>'

# A page template without the layout or without the header is refused.
copy="$work/t-page"; rm -rf "$copy"; cp -R templates "$copy"
printf '{%% extends "base.html" %%}\n{%% block content %%}<div class="space-y-4"></div>{%% endblock content %%}\n' > "$copy/c59-page.html"
if check "$copy" >"$work/out" 2>&1; then echo "case 59: a page template without page_layout was not refused"; exit 1; fi
grep -F "without layout.html page_layout" "$work/out" >/dev/null || { echo "case 59: missing finding"; cat "$work/out"; exit 1; }
grep -F "without the page header" "$work/out" >/dev/null || { echo "case 59: missing header finding"; cat "$work/out"; exit 1; }

echo "case 59: no raw UI class list or page wrapper outside templates/macros/; every page uses the layout"
