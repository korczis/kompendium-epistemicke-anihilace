#!/usr/bin/env bash
# Requirement `typed-count` of scripts/check-ia.py, on a copy of the committed tree.
#
# A page that loads one of the book's derived data files has the member count of that set
# available in the very file it is writing in. Typing the number instead is then a choice, and
# the number goes stale the moment a member is added — which is how section 05 came to claim
# 150 techniques over 187, and kapitola-8 and kapitola-9 to claim 30 over 37 and 60. So the
# requirement refuses a literal numeral in that position rather than comparing it: the derived
# form exists, and a correct hand-typed number is a defect waiting to happen, not a pass.
#
# Both halves of the judgement are read out of the book, nothing is listed by hand:
#
#   * WHAT A SET'S MEMBERS ARE CALLED comes from the derived expressions the book already
#     carries. A page binds a source with
#     `{% set l = load_data(path="static/data/listings/<key>.json") %}` and writes
#     `{{ l.count }} signatur`; that sentence is what says the members of <key> are called
#     "signatur" in Czech, a word no schema and no file name contains. A source with no
#     derived form anywhere teaches no noun and is never charged — there would be nothing to
#     demand in place of the numeral.
#   * WHICH PAGE MAY NOT TYPE ONE is the set of pages that bind such a source. The scope is
#     deliberately not "a section index or a chapter" (the shape the class was first described
#     by): the binding is what proves the derived form is reachable from that file, and it is
#     read from the file rather than inferred from its name. Measured on feature/derived-
#     listings at f8ca8d70 the two scopes differ by one page — kapitola-1 of section 03, which
#     is neither an index nor a kapitola of a listing-bearing directory, yet renders
#     "Taxonomie {{ n }} technik" from the listing and then says "Třináct technik" three
#     paragraphs later, where the derived number is 20.
#
# Excluded, with the reason each exclusion exists:
#
#   * AN ORDINAL MAKES IT A SUBSET. "Prvních deset technik je níže shrnuto jednou větou" is
#     true of a chapter of thirty and says nothing about its size (kapitola-7, measured).
#   * FRONT MATTER CANNOT BE DERIVED AT ALL. Zola does not template front matter, so a
#     `description` that names a count has no derived form to offer; charging it would demand
#     something impossible. detection-signatures carries exactly that case and its number is
#     correct.
#   * A NOUN THE SOURCE NEVER USES is not that source's member kind. techniques.json teaches
#     "technik"; a page binding it and writing "7 kapitol" is counting something else.
#
# An empty vocabulary is an instrument failure, not a clean result: with no derived expression
# in the tree the requirement can charge nothing, and the fixtures below are what keeps that
# from reading as a pass — c51-typed must be charged in every run.
set -euo pipefail

root=$(cd "$(dirname "$0")/../.." && pwd)
work=$(mktemp -d "${TMPDIR:-/tmp}/kea-case51.XXXXXX")
trap 'rm -rf "$work"' EXIT
git -C "$root" archive "${KEA_TEST_TREE:-$(git -C "$root" write-tree)}" | tar -x -C "$work"
cd "$work"

d=content/kompendium/c51
mkdir -p "$d" static/data/listings
cat > static/data/listings/c51.json <<'EOF'
{"schema": "kompendium-listing/v1", "key": "c51", "count": 7,
 "items": ["p1", "p2", "p3", "p4", "p5", "p6", "p7"],
 "group_order": ["a"], "groups": {"a": ["p1", "p2", "p3", "p4", "p5", "p6", "p7"]},
 "entries": {}, "group_names": {}, "group_notes": {}}
EOF
bind='{% set l = load_data(path="static/data/listings/c51.json") %}'
page() {
  printf '+++\ntitle = "%s"\ndescription = "%s"\n+++\n\n' "$2" "${3:-Fixture 51.}" > "$1/$2.md"
  cat >> "$1/$2.md"
}
listed() { python3 scripts/check-ia.py --list typed-count > "$work/list" 2>/dev/null || true; }
has()   { grep -q "/$1.md" "$work/list" || { echo "$1 not charged"; exit 1; }; }
hasnt() { if grep -q "/$1.md" "$work/list"; then echo "$1 wrongly charged"; exit 1; fi; }

# The index teaches the vocabulary: it binds the source and renders the count from it, which is
# what says the members of c51 are called "pilířů". It types no numeral, so it owes nothing.
page "$d" _index <<EOF
${bind}Sekce obsahuje **{{ l.count }} pilířů** obrany a každý pilíř má vlastní stránku; počet se
bere z výpisu, takže se nemůže rozejít s tím, co v sekci skutečně je.
EOF

# the defect: the derived form is bound in this very file and the number is typed anyway
page "$d" c51-typed <<EOF
${bind}Sekce obsahuje 7 pilířů obrany a každý pilíř má vlastní stránku; číslo je napsané rukou,
takže přidáním osmého pilíře se stane nepravdivým, aniž by si toho kdokoli všiml.
EOF

# an ordinal: a subset of the set, not its size
page "$d" c51-subset <<EOF
${bind}Prvních pět pilířů je níže shrnuto jednou větou; zbývající jsou uvedeny v tabulce, protože
jejich výklad patří na vlastní stránky.
EOF

# no binding: no derived form is reachable from this file, so there is nothing to demand
page "$d" c51-nobind <<'EOF'
Sekce obsahuje 7 pilířů obrany a každý pilíř má vlastní stránku; tato stránka žádný odvozený
výpis nenačítá, takže číslo nemá čím nahradit.
EOF

# a noun the bound source never uses for its members: this page counts something else
page "$d" c51-othernoun <<EOF
${bind}Sekce obsahuje 7 kapitol doprovodného textu; kapitoly nejsou členy výpisu c51 a jejich
počet z něj tedy nelze odvodit.
EOF

# front matter is not templated by Zola, so a count in `description` has no derived form
page "$d" c51-frontmatter "Popis zmiňuje 7 pilířů obrany, protože front matter se nešablonuje." <<EOF
${bind}Sekce obsahuje **{{ l.count }} pilířů** obrany; v těle stránky je počet odvozený a jen
popis v hlavičce ho má napsaný, protože Zola front matter nešablonuje.
EOF

listed
has   c51-typed        # binds the source and types the number anyway
hasnt c51-subset       # "prvních pět" is a subset, not the size of the set
hasnt c51-nobind       # no derived form is reachable from this file
hasnt c51-othernoun    # "kapitol" is not what this source calls its members
hasnt c51-frontmatter  # front matter has no derived form to offer
hasnt _index           # renders the count from the source

echo "typed-count: a page that binds a derived listing may not type that listing's member count; an ordinal subset, a page with no binding, a noun the listing never uses, and front matter are not charged"
