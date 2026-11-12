#!/usr/bin/env bash
# .githooks/pre-push reads the pushed refs from stdin and gates the sha(s) going to
# refs/heads/main, not HEAD — so `git push origin <stale-sha>:main` while HEAD is clean is still
# refused. Runs the hook in a throwaway git repo with a stubbed majordomus (the finish contract is
# out of scope here), so it never touches the checkout.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case21.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"
git init -q -b main
git add -A
git -c user.email=t@example.com -c user.name=test commit -qm clean >/dev/null
clean=$(git rev-parse HEAD)

# a commit with stale derived data, then move HEAD back so HEAD is CLEAN but the stale sha exists
printf '{"schema":"kompendium-graph/v1","nodes":[],"edges":[],"families":{},"categories":{}}\n' \
  > static/data/graph.json
git add -A
git -c user.email=t@example.com -c user.name=test commit -qm stale >/dev/null
stale=$(git rev-parse HEAD)
git reset --hard "$clean" >/dev/null

# stub majordomus so the hook's `finish --check` passes; this case is about the derived gate
mkdir -p "$work/bin"
printf '#!/usr/bin/env bash\nexit 0\n' > "$work/bin/majordomus"
chmod +x "$work/bin/majordomus"
export PATH="$work/bin:$PATH"
zero=0000000000000000000000000000000000000000

# 1) push the STALE sha to main by refspec while HEAD is clean → hook must refuse
#    (this is the defect: a HEAD-only check would have passed, since HEAD is clean)
if printf '%s %s refs/heads/main %s\n' "$stale" "$stale" "$zero" | bash .githooks/pre-push >/dev/null 2>&1; then
  echo "a stale sha pushed to main by refspec (HEAD clean) was wrongly accepted"; exit 1
fi

# 2) the same stale sha pushed to a FEATURE branch is NOT gated (only main reaches the deploy);
#    this exits fast without running the ~40s gate, so the clean-pass path is covered by case 20
if ! printf '%s %s refs/heads/feature/x %s\n' "$stale" "$stale" "$zero" | bash .githooks/pre-push >/dev/null 2>&1; then
  echo "a push to a feature branch was gated — only refs/heads/main should be"; exit 1
fi

echo "ok: stale sha to main refused by refspec (HEAD clean), feature-branch push not gated"
