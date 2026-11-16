#!/usr/bin/env bash
# Refuses a staged file that still carries a merge conflict marker. `git merge` with
# merge.conflictstyle=diff3/zdiff3 writes a `|||||||` base line as well as `<<<<<<<`/`>>>>>>>`, and
# deleting only the familiar three left one in a committed note (2026-11-16). `=======` alone is
# not checked: Markdown uses it for setext headings.
set -euo pipefail
hits=$(git diff --cached --name-only --diff-filter=ACMR -z \
  | xargs -0 -r grep -HnIE '^(<{7}|\|{7}|>{7})( |$)' -- 2>/dev/null || true)
if [ -n "$hits" ]; then
  echo "check-conflict-markers: staged files carry merge conflict markers:" >&2
  printf '%s\n' "$hits" | sed 's/^/  /' >&2
  exit 1
fi
