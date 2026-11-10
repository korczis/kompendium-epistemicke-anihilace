#!/usr/bin/env bash
# Verify exactly the tree that is about to be committed, with every content gate, in order.
#
# Other workers may be editing the same worktree, so the working tree proves nothing: this
# exports the index (`git archive "$(git write-tree)"`), runs the gates there and, with --fix,
# carries the derived files back (IA baseline, static/data/*.json) so the commit includes them.
#
#   scripts/verify-content.sh            check the staged tree; exit 1 on the first failing gate
#   scripts/verify-content.sh --fix      also regenerate the derived files from the staged tree,
#                                        shrink the IA baseline and stage them; and link new
#                                        terms across the whole book (link-terms), staging each
#                                        relinked page: in the working tree when it is clean
#                                        there, as an index-only blob when someone is editing it
#   scripts/verify-content.sh --help     this text
#
# Gates: migrate-content, normalize-front-matter, polish-markdown, link-terms, check-ia,
# nlp-catalog,
# build-references, build-graph, zola build, test/run.sh. The export is deleted afterwards.
set -euo pipefail

case "${1:-}" in
  -h|--help) sed -n '2,15p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
  ""|--fix) ;;
  *) echo "verify-content: unknown option $1; see --help" >&2; exit 2 ;;
esac
fix=${1:-}

root=$(git rev-parse --show-toplevel)
cd "$root"
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-verify.XXXXXX")
trap 'rm -rf "$work"' EXIT
git archive "$(git write-tree)" | tar -x -C "$work"
if [ -f static/css/app.css ]; then mkdir -p "$work/static/css"; cp static/css/app.css "$work/static/css/"; fi

step() { printf '%-28s ' "$1"; shift; if out=$("$@" 2>&1); then echo "ok"; else echo "FAIL"; printf '%s\n' "$out" | tail -15; exit 1; fi; }

cd "$work"
if [ "$fix" = --fix ]; then
  # A new glossary entry extends the dictionary, so pages anywhere may gain a link.
  python3 scripts/link-terms.py >/dev/null
  relinked=0
  while IFS= read -r -d '' f; do
    rel=${f#./}
    if [ ! -f "$root/$rel" ] || ! git -C "$root" ls-files --error-unmatch -- "$rel" >/dev/null 2>&1; then continue; fi
    staged=$(git -C "$root" rev-parse ":$rel")
    if [ "$(git hash-object "$rel")" = "$staged" ]; then continue; fi
    if git -C "$root" diff --quiet -- "$rel"; then
      cp "$rel" "$root/$rel" && git -C "$root" add -- "$rel"           # clean: worktree too
    else
      blob=$(git -C "$root" hash-object -w "$work/$rel")                # being edited: index only
      git -C "$root" update-index --cacheinfo "100644,$blob,$rel"
    fi
    relinked=$((relinked + 1))
  done < <(find content -name '*.md' -print0)
  echo "verify-content: link-terms relinked $relinked staged page(s)"
fi
step "migrate-content --check"    python3 scripts/migrate-content.py --check
step "normalize-front-matter"     python3 scripts/normalize-front-matter.py --check
step "polish-markdown"            python3 scripts/polish-markdown.py --check
step "link-terms"                 python3 scripts/link-terms.py --check
if [ "$fix" = --fix ]; then
  step "nlp-catalog"              python3 scripts/nlp-catalog.py
  step "build-references"         python3 scripts/build-references.py
  step "build-graph"              python3 scripts/build-graph.py
fi
step "check-ia"                   python3 scripts/check-ia.py
step "nlp-catalog --check"        python3 scripts/nlp-catalog.py --check
step "build-references --check"   python3 scripts/build-references.py --check
step "build-graph --check"        python3 scripts/build-graph.py --check
step "zola build"                 zola build --force -o "$work/.out"
# The cases export the index themselves and need the repository, so they run from its root.
step "test/run.sh"                bash "$root/test/run.sh"

if [ "$fix" = --fix ]; then
  python3 scripts/check-ia.py --update-baseline >/dev/null
  cp scripts/ia-baseline.json "$root/scripts/ia-baseline.json"
  cp static/data/*.json "$root/static/data/"
  if [ -d content/kompendium/nlp-vzorce ]; then
    (cd content/kompendium/nlp-vzorce && find . -name '*.md' -print0) | while IFS= read -r -d '' f; do
      cmp -s "content/kompendium/nlp-vzorce/$f" "$root/content/kompendium/nlp-vzorce/$f" \
        || cp "content/kompendium/nlp-vzorce/$f" "$root/content/kompendium/nlp-vzorce/$f"
    done
    (cd "$root" && git add content/kompendium/nlp-vzorce)
  fi
  cp content/references.md "$root/content/references.md"
  (cd "$root" && git add scripts/ia-baseline.json static/data content/references.md)
  echo "verify-content: derived files regenerated from the staged tree and staged"
fi
echo "verify-content: the staged tree passes every content gate"
