#!/usr/bin/env bash
# Převezme historii vybraných cest z jiného repozitáře do archive/<linie>/ tohoto repozitáře
# a sloučí ji jako samostatnou linii (merge --allow-unrelated-histories). Původní commity,
# autoři a data zůstanou; obsah souborů projde náhradami z REPLACE_TEXT (git filter-repo
# --replace-text), aby veřejná kopie neobsahovala soukromé adresy.
#
# Použití:
#   REPLACE_TEXT=<soubor mimo repozitář> scripts/import-lineage.sh <linie> <zdroj> <ref> <cesta>...
#     <linie>  název podsložky v archive/ (např. prismatic-legacy)
#     <zdroj>  URL nebo cesta ke git repozitáři
#     <ref>    větev nebo ref, jehož historie se převezme
#     <cesta>  cesta v původním repozitáři; s předponou glob: se bere jako glob (glob:*anihil*)
set -euo pipefail

lineage=${1:?linie}; source=${2:?zdroj}; ref=${3:?ref}; shift 3
[ $# -gt 0 ] || { echo "import-lineage: chybí cesty" >&2; exit 2; }
replace=${REPLACE_TEXT:?REPLACE_TEXT musí ukazovat na soubor s náhradami (mimo repozitář)}
filter_repo=$(command -v git-filter-repo || true)
[ -x /opt/homebrew/bin/git-filter-repo ] && filter_repo=/opt/homebrew/bin/git-filter-repo
[ -n "$filter_repo" ] || { echo "import-lineage: chybí git-filter-repo" >&2; exit 2; }

root=$(git rev-parse --show-toplevel)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-lineage.XXXXXX")
trap 'rm -rf "$work"' EXIT

git clone -q --no-local --single-branch --branch "$ref" "$source" "$work/src" 2>/dev/null \
  || { git clone -q --no-local "$source" "$work/src"; git -C "$work/src" checkout -q -B import "$ref"; }

args=()
for p in "$@"; do
  case $p in
    glob:*) args+=(--path-glob "${p#glob:}") ;;
    *) args+=(--path "$p") ;;
  esac
done
(cd "$work/src" && "$filter_repo" --force --quiet "${args[@]}" --to-subdirectory-filter "archive/$lineage" --replace-text "$replace")

head=$(git -C "$work/src" rev-parse HEAD)
count=$(git -C "$work/src" rev-list --count HEAD)
first=$(git -C "$work/src" log --reverse --format=%cs | sed -n 1p)  # sed čte vše: žádný SIGPIPE pod pipefail
last=$(git -C "$work/src" log -1 --format=%cs)
git -C "$root" fetch -q "$work/src" "HEAD:refs/lineage/$lineage"
git -C "$root" merge -q --allow-unrelated-histories --no-edit -m "chore(archive): převzít historii linie $lineage

Zdroj: $(basename "$source" .git), ref $ref; $count commitů ($first až $last), hlava $head.
Převzato skriptem scripts/import-lineage.sh; obsah prošel náhradami soukromých adres.

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>" "refs/lineage/$lineage"
git -C "$root" update-ref -d "refs/lineage/$lineage"
echo "import-lineage: $lineage — $count commitů ($first až $last)"
