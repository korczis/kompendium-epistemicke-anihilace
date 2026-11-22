#!/usr/bin/env bash
# The push-gate refuses a stale front-matter schema table, on a copy of the committed tree.
#
# The schema table in .ai/repo/rules/project/information-architecture.v1.md is generated from
# data/front-matter.toml by `normalize-front-matter.py --doc`. On 2026-11-22 a new [extra] key
# reached front-matter.toml without regenerating that table; check-derived-currency.sh did not run
# `--doc --check`, so the pre-push gate was green while CI's case 01 was red. This case proves:
#   - `--doc --check` passes on the committed tree (the table is current);
#   - adding an [extra] schema key without regenerating makes `--doc --check` fail (stale detected);
#   - `--doc --fix` regenerates the table and `--doc --check` passes again;
#   - check-derived-currency.sh runs `--doc --check`, so a stale table now refuses the push.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case73.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"

# 1. the committed tree's schema table is current.
python3 scripts/normalize-front-matter.py --doc --check >/dev/null \
  || { echo "--doc --check failed on the committed tree (its table should be current)"; exit 1; }

# 2. add an [extra] schema key without regenerating the table → stale.
python3 - <<'PY'
import pathlib
p = pathlib.Path("data/front-matter.toml")
lines = p.read_text(encoding="utf-8").splitlines(keepends=True)
row = '  { where = "extra", key = "zz_case73_probe", type = "str", classes = "technique" },\n'
for i, line in enumerate(lines):
    if 'key = "related_terms"' in line:          # a stable anchor inside the schema array
        lines.insert(i + 1, row)
        break
else:
    raise SystemExit("case 73: could not find the related_terms schema row to anchor the probe")
p.write_text("".join(lines), encoding="utf-8")
PY
if python3 scripts/normalize-front-matter.py --doc --check >/dev/null 2>&1; then
  echo "--doc --check passed with an unregenerated schema key (stale table not detected)"; exit 1
fi

# 3. regenerate the table → current again.
python3 scripts/normalize-front-matter.py --doc --fix >/dev/null
python3 scripts/normalize-front-matter.py --doc --check >/dev/null \
  || { echo "--doc --check still fails after --doc --fix"; exit 1; }
grep -q "zz_case73_probe" .ai/repo/rules/project/information-architecture.v1.md \
  || { echo "--doc --fix did not write the new key into the schema table"; exit 1; }

# 4. the push-gate runs --doc --check, so the stale table above would refuse the push.
grep -Eq 'normalize-front-matter\.py --doc --check' scripts/check-derived-currency.sh \
  || { echo "check-derived-currency.sh does not run normalize-front-matter --doc --check"; exit 1; }

echo "schema-doc currency: --doc --check passes on the committed tree, fails on an unregenerated [extra] key, passes again after --doc --fix, and check-derived-currency.sh runs it so a stale schema table refuses the push"
