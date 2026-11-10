#!/usr/bin/env bash
# The academic gate refuses what rules project.content-no-placeholders and
# project.content-academic-style forbid, on a copy of the committed tree.
# majordomus-skill: kompendium-page-expansion
#
#  - the model page content/glossary/charisma.md passes every requirement;
#  - a seeded page with a placeholder note, list items, an uncited paragraph, a citation
#    missing from its Literatura, a free-form glossary category and an EA code without a page
#    fails with each of those requirements named;
#  - placeholder and technique-page violations cannot enter the baseline, by --adopt or by
#    hand-editing scripts/ia-baseline.json.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case02.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "$(git -C "$root" write-tree)" | tar -x -C "$work"
cd "$work"

python3 scripts/check-ia.py --page content/glossary/charisma.md >/dev/null

cat > content/glossary/zz-case-02.md <<'PAGE'
+++
title = "Seeded"
description = "Zasazená stránka testu brány akademického stylu, která porušuje každý požadavek."

[taxonomies]
tags = ["glossary"]

[extra]
category = "architecture"
+++

> **Pozn.**: Tato stránka je placeholder vytvořený pro vyřešení broken refs.

Tento odstavec má přes dvacet slov, ale nenese žádnou citaci, takže ho brána musí odmítnout
jako necitovaný odstavec v textu, který se tváří jako odborný výklad pojmu.

Tento odstavec cituje autora, který v literatuře chybí (Neexistující, 1999), a proto ho brána
musí odmítnout jako nevyřešenou citaci, protože čtenář zdroj nedohledá.

Technika EA-9.9.99 nemá vlastní stránku, a proto ji brána musí odmítnout jako chybějící
stránku techniky, protože každá technika knihy má mít vlastní heslo (Weber, 1922).

- odrážka místo odstavce

## Literatura

- Weber, M. (1922). *Wirtschaft und Gesellschaft*. J. C. B. Mohr.

## Související

- [Charisma](@/glossary/charisma.md) – vzor.
PAGE

python3 scripts/check-ia.py --page content/glossary/zz-case-02.md >"$work/page.out" 2>&1 && {
  echo "check-ia passed the seeded page"; cat "$work/page.out"; exit 1; }
for rule in placeholder thin bullets citations citation-unresolved category technique-page; do
  grep -q "$rule" "$work/page.out" || { echo "missing requirement: $rule"; cat "$work/page.out"; exit 1; }
done
if python3 scripts/check-ia.py >/dev/null 2>&1; then echo "the gate passed a tree with the seeded page"; exit 1; fi

# Neither --adopt nor a hand-edited baseline can excuse a placeholder or a missing technique.
for rule in placeholder technique-page; do
  if python3 scripts/check-ia.py --adopt "$rule" >/dev/null 2>&1; then echo "--adopt $rule accepted"; exit 1; fi
done
python3 - <<'PY'
# Baseline = every current violation of every page (as if all were accepted), then the
# seeded page's placeholder and technique-page added by hand: only those two may remain.
import importlib.util, json, pathlib, sys
spec = importlib.util.spec_from_file_location("check_ia", "scripts/check-ia.py")
mod = importlib.util.module_from_spec(spec); sys.modules["check_ia"] = mod; spec.loader.exec_module(mod)
b = mod.current()
pathlib.Path("scripts/ia-baseline.json").write_text(json.dumps(b))
PY
python3 scripts/check-ia.py >"$work/gate.out" 2>&1 && { echo "hand-edited baseline excused a placeholder"; exit 1; }
grep -q "zz-case-02.md: .*placeholder" "$work/gate.out"
grep -q "zz-case-02.md: .*technique-page" "$work/gate.out"

python3 scripts/normalize-categories.py --check >/dev/null 2>&1 && { echo "normalize-categories missed 'architecture'"; exit 1; }
echo "case 02: academic gate behaves"
