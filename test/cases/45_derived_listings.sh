#!/usr/bin/env bash
# Requirements `undeclared-listing` and `listing-row` of scripts/check-ia.py (rule
# project.listings-derived, ADR 0015): a section's table of its own pages is a derived listing,
# declared in data/listings.toml and rendered with load_data, never hand-written.
#
#   * undeclared-listing (inferred): a section _index.md whose literal table rows link at least
#     LISTING_MIN_MEMBERS of its own member pages and at least LISTING_MIN_SHARE of them, and that
#     no [[listing]] declares as an index page, is refused. The thresholds live in check-ia.py.
#     Boundaries: 4 of 4 (under the count) and 5 of 11 (under the share) are not charged;
#     5 of 10 and 6 of 6 are. Rows inside a generated <!-- kompendium:…:begin/end --> block
#     (scripts/catalogs.py) are derived and ignored.
#   * listing-row (declared): a page a [[listing]] names in index_pages may not hand-write a
#     table row linking a member of that listing; its loop renders them.
# The fixtures are sections of their own, so the case does not depend on the live book.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case45.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
k=content/kompendium

# section <name> <pages> <linked> [generated]: <pages> member pages, an index whose table links
# the first <linked> of them (inside a generated block when the 4th argument is set)
section() {
  local d="$k/$1" i rows=""
  mkdir -p "$d"
  for i in $(seq 1 "$2"); do printf '+++\ntitle = "%s %s"\nweight = %s\n+++\n\nText.\n' "$1" "$i" "$i" > "$d/p$i.md"; done
  # BSD seq counts down from 1 to 0, so an empty table needs its own guard
  if [ "$3" -gt 0 ]; then
    for i in $(seq 1 "$3"); do rows="$rows| [$1 $i](@/kompendium/$1/p$i.md) | Popis. |"$'\n'; done
  fi
  if [ -n "${4:-}" ]; then
    rows="<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->"$'\n'"$rows<!-- kompendium:katalog-vazby:end -->"
  fi
  printf '+++\ntitle = "%s"\nsort_by = "weight"\n+++\n\n| Stránka | Popis |\n|---|---|\n%s\n' "$1" "$rows" > "$d/_index.md"
}
section c45-four   4 4
section c45-eleven 11 5
section c45-ten    10 5
section c45-six    6 6
section c45-gen    6 6 generated
# a declared listing: its index renders the loop, and one declared index still hand-writes a row
section c45-decl   6 0
section c45-hand   6 1
printf '\n{%% set l = load_data(path="static/data/listings/c45-decl.json") %%}\n| Stránka | Popis |\n|---|---|\n{%% for t in l.items %%}| [{{ t.name }}](@/{{ t.path }}) | {{ t.summary }} |\n{%% endfor %%}\n' >> "$k/c45-decl/_index.md"
cat >> data/listings.toml <<'EOF'

[[listing]]
key = "c45-decl"
section = "kompendium/c45-decl"
index_pages = ["kompendium/c45-decl/_index.md"]

[[listing]]
key = "c45-hand"
section = "kompendium/c45-hand"
index_pages = ["kompendium/c45-hand/_index.md"]
EOF

list() { python3 scripts/check-ia.py --list "$1" 2>/dev/null | cut -f1 > "$work/$1" || true; }
has()   { grep "/$2/_index.md$" "$work/$1" >/dev/null || { echo "$1: $2 not refused"; exit 1; }; }
hasnt() { if grep "/$2/_index.md$" "$work/$1" >/dev/null; then echo "$1: $2 wrongly refused"; exit 1; fi; }

list undeclared-listing
hasnt undeclared-listing c45-four      # 4 of 4: under the minimum count
hasnt undeclared-listing c45-eleven    # 5 of 11: under the minimum share
has   undeclared-listing c45-ten       # 5 of 10: at both thresholds
has   undeclared-listing c45-six       # 6 of 6
hasnt undeclared-listing c45-gen       # rows inside a generated block are derived
hasnt undeclared-listing c45-decl      # declared: a listing, not an undeclared one
hasnt undeclared-listing c45-hand
list listing-row
has   listing-row c45-hand             # a declared index that still hand-writes a member row
hasnt listing-row c45-decl             # the loop renders its rows
echo ok
