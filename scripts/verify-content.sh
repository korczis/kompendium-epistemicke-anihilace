#!/usr/bin/env bash
# Verify exactly the tree that is about to be committed, with every content gate, in order.
#
# Other workers may be editing the same worktree, so the working tree proves nothing: this
# exports the index (`git archive "$(git write-tree)"`), runs the gates there and, with --fix,
# carries the derived files back (IA baseline, static/data/*.json) so the commit includes them.
#
#   scripts/verify-content.sh            check the staged tree; exit 1 on the first failing gate
#   scripts/verify-content.sh --fix      also regenerate the derived files from the staged tree,
#                                        shrink the IA baseline and stage them
#   scripts/verify-content.sh --help     this text
#
# Gates: migrate-content, normalize-front-matter, polish-markdown, link-terms, check-ia,
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
step "migrate-content --check"    python3 scripts/migrate-content.py --check
step "normalize-front-matter"     python3 scripts/normalize-front-matter.py --check
step "polish-markdown"            python3 scripts/polish-markdown.py --check
step "link-terms"                 python3 scripts/link-terms.py --check
if [ "$fix" = --fix ]; then
  step "build-references"         python3 scripts/build-references.py
  step "build-graph"              python3 scripts/build-graph.py
fi
step "check-ia"                   python3 scripts/check-ia.py
step "build-references --check"   python3 scripts/build-references.py --check
step "build-graph --check"        python3 scripts/build-graph.py --check
step "zola build"                 zola build --force -o "$work/.out"
step "test/run.sh"                bash test/run.sh

if [ "$fix" = --fix ]; then
  python3 scripts/check-ia.py --update-baseline >/dev/null
  cp scripts/ia-baseline.json "$root/scripts/ia-baseline.json"
  cp static/data/*.json "$root/static/data/"
  cp content/references.md "$root/content/references.md"
  (cd "$root" && git add scripts/ia-baseline.json static/data content/references.md)
  echo "verify-content: derived files regenerated from the staged tree and staged"
fi
echo "verify-content: the staged tree passes every content gate"
