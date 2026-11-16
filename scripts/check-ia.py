#!/usr/bin/env python3
"""Gate of the book's information architecture (rule project.information-architecture).

Every page is judged against the same requirements. Pages that did not meet them when the
gate was introduced are listed in scripts/ia-baseline.json; the gate fails on any violation
that is not in the baseline, so the architecture can only get better. `--update-baseline`
removes what has been fixed and refuses to add anything.

Requirements (id: what is checked):
  front-matter     the page has parseable front matter with a title
  toml             the front matter is TOML (+++), as on every other page
  description      a top-level description of 50-200 characters (not under [extra])
  tags             at least one tag under [taxonomies] (not under [extra])
  czech            the prose is Czech (more Czech than English function words)
  diacritics       Czech prose carries diacritics (at least 3 % of words)
  related          a `## Související` section (index pages exempt)
  links-out        at least 3 internal @/ links to existing pages (index pages exempt)
  not-orphan       at least one other page links here (index pages exempt)
  broken-link      no @/ link points at a page that does not exist
  detail           a page carries real substance: at least 2 x A4 of running text; the word
                   thresholds are read from zola.toml [extra] (ia_detail_words for pages,
                   ia_detail_words_index for section indexes, ia_detail_words_qr for cards),
                   the single source the templates use; a page with its own template is exempt
  hardcoded-path   content never writes the site's base path or host (src/href
                   "/kompendium-epistemicke-anihilace/…", https://korczis.github.io/…): pages are
                   @/ links, scripts are {{ <viz_script name="…" /> }}
  generated        no machine-generated text: no NLLB auto block, structural stub, placeholder
                   note or "pojem v sekci … znalostní báze Prismatic Platform" boilerplate
  howto            no phrasing of an operational script: imperatives that steer a target
                   person (lexicon HOWTO in ia_model.py), the floor of rule
                   project.content-defensive-frame
  weak-link        every internal link leads to a page that meets `detail` and `generated`;
                   the debt lives on the TARGET (a thin page that other pages link), never on
                   the linking page: a link to a thin page is better than no link, and
                   unlinking a term to pass the gate would break `term = page = link`
                   (`--debt` ranks the weak targets by how many pages link them)
  summary          a glossary entry carries a short summary (its description) and opens with a
                   `## Definice` section before the detail
  term-page        every term of the index of terms (08-prilohy/index-pojmu.md) has a page
                   of its own: a glossary entry or a technique page (keyed as term:<slug>)

  placeholder      no placeholder or filler: a placeholder note or field, "v rekonstrukci", stub
                   entries, buildout/"bude doplněno"/lorem ipsum, reserved or planned blocks,
                   generic descriptions (the NLLB block is `generated`); NEVER baselined
  bullets          no list item outside `## Literatura` and `## Související` and generated
                   blocks: every point is a paragraph (an ordered item interrupts an open
                   paragraph only at 1, as CommonMark renders it)
  citations        every prose paragraph of 20+ words carries an author-year citation — (Autor,
                   rok), (Autor rok), Autor (rok), (A a B, rok), (A a kol., rok) — or a statute
                   (zákon č. N/RRRR Sb.) or EU instrument; callouts, tables, code exempt; up to
                   three paragraphs per page that only state the book's own frame may instead
                   link one of its method pages (01-predmluva/eticke-aspekty, jak-pouzivat,
                   08-prilohy/eticky-kodex, 02-uvod/metodologicke-poznamky) and no other page.
                   A quick-reference card owes no citations of its own while it links its
                   technique page as "**Plná stránka:**" and that page exists: the parent carries
                   the apparatus, and a ten-line summary citing the same works again would
                   duplicate its parent's credibility. Keyed on that relation, so a card with no
                   link or a broken one is charged. quick-reference/_index.md is prose, not a
                   card, and is charged. The method-page exemption could not have served here:
                   119 of the 123 cards carry 4 or more uncited paragraphs, above its cap of 3
  bibliography     a page that cites an author has `## Literatura`, before `## Související`
  citation-unresolved  every cited surname is in the page's Literatura (Czech case endings and
                   female -ová forms resolve: Liftona -> Lifton, Arendtová -> Arendt)
  drug-dose        no medical dosing: a drug dose or dose range (N mg, N–M mg, mg/den, µg, IU …)
                   in prose outside code and bibliographies. A public book must not recommend
                   doses (same as the emergency protocols). NEVER baselined
  drug-name        no named medication: a curated drug class or INN (antipsychotika, benzodiazepiny,
                   SSRI, sertralin, lithium …) in prose on any content page, bibliographies and
                   references.md excluded. Owner ADR 0013/0014: the book names no drugs; the content
                   lane rewrites the drug generically. Owner, ADR 0013 doplněk 2: a drug that is the
                   documented subject of a historical case stays, so content/kompendium/historical-
                   cases/ and links to it are exempt; "endogenní opioidy" is not medication.
                   NEVER baselined
  authority-without-source  no name-dropped authority: a parenthetical citation of 2+ names with no
                   year on the line, pasted byte-identical on 3+ pages. The names may be a list of
                   surnames ("(Vondráček, Mečíř, …)") or one author surname-forename ("(Ferenczi,
                   Sándor)"); only the parenthetical group triggers, so a bare name in prose never
                   does. A real citation carries a year and resolves in Literatura; this does neither
                   and every citation gate misses it (ADR 0014). Remedy: cite the author(s) properly
                   in Literatura or remove the claim. A name the book GENUINELY DISCUSSES (used
                   lowercased in prose, e.g. Russell, Wittgenstein) is exempt — a pasted paragraph
                   about it is duplicate-passage's domain — so a 0 here means no fabricated name-drop,
                   not no cited thinker. NEVER baselined
  clinical-figure  no unsourced clinical specific: a duration range in hours, days, weeks, months
                   or sessions, a share of sessions/patients/clients, a success/relapse rate, a
                   numeric threshold on a clinical score (HRV, HR, DES, PCL, BDI, PHQ, GAD …), a
                   session count, a minimum dose ("minimum 100h", "alespoň 6 sezení") or a count
                   range of techniques/trainees/participants stands in a paragraph, list item or
                   table row that carries an author-year citation or a statute; a reader could take
                   it as an instruction (ADR 0010, 0012). Not judged yet: numeric acceptance
                   criteria in tables (κ > 0.7, ≥ 85 %, "do 30 min"), a separate wave. NEVER
                   baselined
  fabricated-citation  no pasted study: a paragraph, list item or table row that pairs an author-year
                   citation with a study statistic (RCT, meta-analysis, n=, g=/d=/r=, OR/RR/HR,
                   NNT) and stands byte-identical on 3+ content/kompendium pages. A study a page
                   actually draws on is paraphrased for that page, never re-pasted whole with an
                   identical n and effect size across unrelated techniques (the fabricated/
                   misattributed-study pattern, ADR 0012). The referent is NOT the central
                   bibliography (thematic; clinical authors are cited in prose but absent from it,
                   and a real author-year can carry a fabricated study). Remedy: keep ONE honest
                   statement of the study on the page where it belongs, with its real source in
                   that page's Literatura, or remove it — never re-paste. template-figure owns a
                   line it already charges (that gate is checked first). NEVER baselined
  legitimate-indication  no applier permission: a technique page carries no heading naming
                   legitimate indications, permitted use, legitimate context or conditions for
                   application (legitimní indikace/užití/kontext, indikace k aplikaci, podmínky
                   použití, kdy je legitimní …), nor the item that keeps the claim when the heading
                   is renamed (benefit prokazatelně převažuje riziko). It is the counterpart of the
                   applier checklist: the book's frame is recognition and defence, not sanctioned
                   application (ADR 0013). Matched by shape, so a reworded heading still fails; an
                   EXCLUSION heading ("Vylučující okolnosti") is not matched. The "kdy je … legitimní"
                   frame ("Kdy je rámec legitimní") is scoped by TECHNIQUE FAMILY — charged on EA-4.x
                   and every non-EA-6 code, EXEMPT on EA-6 care/recovery (there it separates care from
                   abuse defensively). The scope is the family, NOT whether the section cites: all the
                   EA-4 pages cite and some EA-6 do not, so "cited means keep" is wrong. Remedy:
                   replace with a contraindication / excluding-circumstances section. NEVER baselined
  chrome-trailer   no hand-pasted site chrome in content: a "## Connect & Contribute" section or a
                   "Created by […]" credit line. templates/partials/footer.html renders the author,
                   licence, wiki and repository from config.extra on every page; the pasted copies
                   came in five variants, some with broken bold and 60 linking the wrong
                   repository (2026-11-14, 294 pages). Remedy: delete it. NEVER baselined
  code-range       no hand-written range of EA codes ("EA-5.4.1 — 5.4.30", "EA-4.1.1–4.1.10") in
                   prose or tables: the set of codes is derived from the technique pages, and a range
                   typed by hand goes stale the first time a technique is added (2026-11-12: the
                   EA-5 index stated 5.3.1–5.3.30 and 5.4.1–5.4.30 for 36 and 60 pages). Link the
                   first technique or the techniques index instead. NEVER baselined
  duplicate-passage  no pasted prose: a paragraph (whitespace-normalised, 15+ words) re-pasted
                   byte-identical on 3+ content/kompendium pages, which no gate sees once it has no
                   figure. Excludes figure-bearing blocks (template-figure owns them), the "Created
                   by …" credit (chrome-trailer owns it) and cross-reference /
                   relation list lines (derived by the okolí / Související engine, never pasted).
                   ADR 0013. Remedy: rewrite per page where it pretends to be per-technique content,
                   or move a genuine shared notice to a Zola include/partial; `scripts/dup-passages.py`
                   lists each block with its pages so a block is fixed across all of them at once.
                   NEVER baselined
  duplicate-table  no pasted table row: a table data row (whitespace- and EA-code-normalised, 8+
                   words) re-pasted byte-identical on 3+ content/kompendium pages — the complement of
                   duplicate-passage, which skips tables. Exempts ONLY a metadata field (a bold-label
                   first cell AND a short second cell: a code, a level or a link); a pasted prose
                   sentence in the second cell ("| **Mechanismus** | … |") stays charged. ADR 0013.
                   Remedy: rewrite the row per page, or move a genuine shared field to a template.
                   NEVER baselined
  alias-collision  a Zola alias is a free old address: refused, on the page that carries it, an alias
                   equal to the page's own address (a no-op that redirects nothing; c5200028 gave six
                   renumbered techniques one instead of their old address, and those URLs went 404),
                   or equal to another page's address or to another page's alias (one path, two
                   things served). Trailing slashes are normalised. Remedy: the alias names the
                   address the page had before it moved, and that address is served by nothing else.
                   NEVER baselined
  duplicate-ea-code  one EA code names one technique: two technique pages (content/kompendium/
                   techniques/) whose extra.ea_code is the same are both refused. A quick-reference
                   card or other page carrying a technique's code is about that technique and is not
                   judged, nor is the extra.ea_codes list a page cites. Remedy: the page the chapter
                   catalogue table names keeps the code; a page describing the same technique is
                   merged into it (Zola alias, links repointed); a distinct technique takes the next
                   free code of its family, with its title, links and catalogue row. Pending zero at
                   the two pages of EA-5.3.27 (ego-skeletalni-redukce, autobiografi-self-fragmentace),
                   whose chapter row names neither; NEVER baselined
  listing-row    a page that data/listings.toml names in a listing's index_pages renders that
                   listing with load_data and hand-writes no table row linking one of its members
                   (rule project.listings-derived, ADR 0015). Rows inside a Tera expression or a
                   generated <!-- kompendium:…:begin/end --> block are derived. Remedy: drop the
                   row; the loop renders it. NEVER baselined
  undeclared-listing  inferred: a section _index.md whose literal table rows link at least
                   LISTING_MIN_MEMBERS of its own member pages and at least LISTING_MIN_SHARE of
                   them is a listing; unless data/listings.toml declares the section or names the
                   page in index_pages, it is refused. Remedy: declare a [[listing]] and render it.
                   NEVER baselined
  catalogue-row  no hand-written catalogue row: a content table row whose first cell is an EA technique
                   code, bold or in backticks ("| **[EA-1.2.1](…)** | … |", "| **EA-5.3.22** | … |",
                   "| [`EA-1.1.1`](…) | … |"). A technique's catalogue
                   entry is its page's front matter (code, title, description), and a chapter renders
                   its table from static/data/listings/techniques.json with load_data (ADR 0015); the row a loop
                   renders is not in the source. Not charged: a technique heading with prose under it,
                   a row whose first cell is not a technique code. Remedy: replace the table with the
                   family's load_data loop. NEVER baselined
  access-level-row  no hand-written access level: a "| **Přístupová úroveň** | … |" row in content,
                   or the same claim as prose ("Přístupová úroveň L3.", "**Přístupová úroveň
                   L3–L4**:", "Přístupová úroveň L2 (rozšířený přístup) —"), with or without a
                   leading admonition marker. Removing the row from 420 pages left 41 prose
                   occurrences in 40 files standing, 30 of them byte-identical on the
                   quick-reference cards beside those very pages. A heading and a markdown link
                   label are NOT charged: a documented classification section is its own decision,
                   and "[Přístupová úroveň oddílu](…)" is navigation, not an assertion.
                   The access level is data (extra.access_level), rendered derived in the page header
                   as a link to 1.5 Bezpečnostní klasifikace; a typed row drifts (it had 11 variants).
                   Remedy: delete the row, rely on access_level. NEVER baselined
                   section (steps or phases for performing a technique on a person); the
                   defensive frame describes recognition and defence, not execution. NEVER
                   baselined; a "z hlediska supervize" reframing is a playbook too. Also refuses
                   the 04 terminal-protocol playbook shapes (ADR 0010 amendment): the applier
                   checklist "před aplikací … protokol … ověř:", the "### Úroveň E1…4" escalation
                   ladder, the "### Vrstva N" build-order sequence and a "… criteria" heading. It
                   keys on the applier CONTENT, NOT the "## Kritický krok" heading: the same
                   heading is a book-wide "key takeaway" and a reader recognition exercise in
                   03/08 (opposite intent), so a heading match would wrongly flag ~53 pages. Do
                   not re-add the heading match.
  technique-name   a heading that opens with a code ("#### EA-5.2.29 Name") names the technique
                   that the catalogue page with that code names (its title without the code):
                   a chapter must not describe a different technique under a catalogue code
  technique-page   every EA-X.Y.Z code the page names has its own technique page; NEVER
                   baselined
  bold-term        a **bold** span that names a glossary entry (title, title without the
                   parenthesis, the alias in it, extra.aliases, slug) is a link: it charges a
                   MISSING link only, never a link to a thin page (labels, table header rows and
                   first cells, Související, Literatura, key sentences over 6 words and the
                   entry's own page exempt); `link-terms.py --bold` fixes it and every gate
                   runs it (verify-content --fix, pre-push, CI), so it is NEVER baselined
  bold-candidate   keyed bold:<slug>: a bold phrase of up to 6 words on 3+ pages that is not a
                   term, a label or a link needs its own glossary page (with a real source) or a
                   link to the book's own page; when the page exists, the phrase leaves the list
                   and bold-term enforces it. The worklist reached 0 in batch D (2026-11-14), so
                   it is NEVER baselined: a new candidate fails and no baseline entry excuses it
  template-figure  a technique page carries no numeric table row or list item that stands
                   byte-identical on 3+ technique pages. Data measured for one technique is
                   never identical to another's, so an identical figure is machine template
                   filler: effect sizes, n, NNT, instrument cut-offs, session counts, detection
                   thresholds and recovery horizons were all pasted across unrelated techniques
                   (ADR 0006). A figure a page edits for itself leaves the group and passes.
                   NEVER baselined. Not a worklist: `--list template-figure` names the pages
                   that carry an identical line (a line to delete, not a page to write). A
                   figure inside a cross-reference link does not count — only one in the row's
                   own prose.
  platform-section no "Vztah k/ke <Prismatic component>" heading (Prismatic, Decision Engine,
                   NABLA/Nabla, ∇∞): the owner decided the book does not import from the Prismatic
                   platform (ADR 0007, 2026-11-11), so these integration sections — and the two
                   pages that were only this — were stripped and must not return. NEVER baselined

NEVER baselined requirements cannot be introduced, extended or hand-written into the baseline.
Pages that already failed one when it was introduced are counted in PENDING_ZERO: the gate fails
when the count grows, and the count may only go down to 0, where the entry stays (removing it
would make the requirement an ordinary, baselinable one).

Usage:
  scripts/check-ia.py                    fail on new violations; print the summary
  scripts/check-ia.py --update-baseline  shrink the baseline to what still fails
  scripts/check-ia.py --list <rule>      list the pages that violate one requirement (with the
                                         detail after a tab; bold-candidate by page count)
  scripts/check-ia.py --debt             weak link targets ranked by inbound links (what to
                                         develop first)
  scripts/check-ia.py --introduce <rule> add the current violations of a NEW requirement to the
                                         baseline (once, when the requirement is introduced)
  scripts/check-ia.py --extend <rule>    add the current violations of an EXISTING requirement
                                         whose threshold was just raised (once per raise; the
                                         commit must say what was raised and why)
"""
import collections
import json
import pathlib
import re
import sys
import tomllib

sys.dont_write_bytecode = True  # no __pycache__ in the checkout
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
import listings  # noqa: E402  (scripts/listings.py: the derived listings)
from ia_model import (ROOT, EA_ONLY, academic_profile, body_lines, bold_spans,  # noqa: E402
                      is_list_lead, bold_term_index, FENCE, figure_lines,
                      TEMPLATE_FIGURE_PAGES, FIGURE,
                      detail_thresholds, ea_mentions, load_pages, load_terms,
                      placeholder_markers, slugify, technique_codes, cited_names, plain)

BASELINE = ROOT / "scripts" / "ia-baseline.json"
EXEMPT = {"content/references.md"}  # generated by scripts/build-references.py
# Count-bearing rules carry a per-page number, not just presence: `citations` the uncited-paragraph
# count, `bullets` the list-item count. Their baseline entry is stored as "rule:N" and the gate
# refuses an INCREASE on any page (so turning a list into uncited prose cannot pass as "no new
# rule"); --update-baseline only ever re-stamps the current, lower count. A legacy bare entry
# ("citations" with no ":N") is grandfathered — accepted at whatever it is now — until the next
# --update-baseline stamps its count. Other rules remain boolean (presence only).
COUNT_BEARING = frozenset({"citations", "bullets"})
_MISSING = object()  # a rule not baselined for a page, distinct from a bare (grandfathered) entry


def rule_count(page: dict, rule: str) -> int:
    """The per-page number behind a count-bearing rule."""
    return page["uncited"] if rule == "citations" else len(page["bullets"])


def base_split(entry: str) -> tuple:
    """'citations:3' -> ('citations', 3); 'detail' or a bare 'citations' -> (name, None)."""
    name, sep, num = entry.partition(":")
    if sep and name in COUNT_BEARING and num.isdigit():
        return name, int(num)
    return entry, None


def base_rules(entries: list) -> set:
    """The bare rule names a baseline entry list carries, counts stripped."""
    return {base_split(e)[0] for e in entries}


def base_count(entries: list, rule: str):
    """The baselined count for a rule on a page: an int, None (bare/grandfathered), or _MISSING."""
    for e in entries:
        name, num = base_split(e)
        if name == rule:
            return num
    return _MISSING


def stamp(path: str, name: str, now_counts: dict) -> str:
    """The baseline entry for a rule on a page: 'rule:N' for a count-bearing rule, else the name."""
    if name in COUNT_BEARING and (path, name) in now_counts:
        return f"{name}:{now_counts[(path, name)]}"
    return name
# An unfinished page or a technique without a page is never an accepted state: these
# requirements cannot be introduced into, extended in or hand-written into the baseline.
NEVER_BASELINED = {"placeholder", "technique-page", "howto", "drug-dose", "template-figure",
                   "bold-term", "bold-candidate",
                   "clinical-figure", "fabricated-citation", "legitimate-indication",
                   "code-range", "chrome-trailer",
                   "detail", "weak-link",
                   "duplicate-passage", "duplicate-table", "access-level-row", "duplicate-ea-code",
                   "catalogue-row", "alias-collision", "listing-row", "undeclared-listing",
                   "drug-name", "authority-without-source",
                   "platform-section", "relative-link", "platform-label", "platform-frontmatter",
                   "philosophy-frame"}
# When a never-baselined requirement was introduced, these pages already failed it (listed by
# `--list <rule>`); they are fixed in content, not accepted. Until then the gate fails only when
# the count grows. The number may only go down, and the entry goes when it reaches 0.
PENDING_ZERO = {"placeholder": 0, "technique-page": 0, "howto": 0, "drug-dose": 0,
                "bold-term": 0, "bold-candidate": 0,
                "code-range": 0, "chrome-trailer": 0,
                "clinical-figure": 0,
                "template-figure": 0, "platform-section": 0, "relative-link": 0,
                "platform-label": 0, "platform-frontmatter": 0, "philosophy-frame": 0,
                "fabricated-citation": 0,
                "legitimate-indication": 0,
                "detail": 199, "weak-link": 199,
                "duplicate-passage": 281,
                "duplicate-table": 249,  # measured on merged main c8394d3e after Přístupová úroveň removal; bold-label→short-value exempt
                "access-level-row": 0,  # the row is derived from extra.access_level; 0 after removal
                # the one known case: EA-5.3.27 on two pages, its kapitola-8 row naming neither
                "duplicate-ea-code": 0,
                # safety, ADR 0013/0014: both reach 0 after the content lane's waves
                "drug-name": 1, "authority-without-source": 0}  # 0 → never baselined (lands at 0 after 2e's slice)
# A hand-written catalogue row: the first cell is an EA technique code, bold or in backticks, linked
# or not ("| **[EA-1.2.1](…)** |", "| **EA-5.3.22** |", "| [`EA-1.1.1`](…) |", "| `EA-2.1.1` |").
# Derived listings (rule project.listings-derived, ADR 0015). A section index is inferred to be a
# listing when its literal table rows link at least LISTING_MIN_MEMBERS of the section's own pages
# and at least LISTING_MIN_SHARE of them. Measured 2026-11-16 (session a70e6c7e) on the book,
# rows inside generated catalogue blocks excluded: detection-signatures 33/33, section-bridges
# 28/28, 01-predmluva 6/6, 02-uvod 6/6, 08-prilohy 7/8, 05-ultramari-techniky 5/9 (55%) are
# listings; below them a clean gap: 06-klinicke-aplikace 6/17 (35%), population-health 8/30,
# 07-teoreticke-reflexe 4/60, 03-zakladni-kategorie 3/17, glossary 3/289 are picked highlights.
# The case (test/cases/45) and the rule read these two values from here.
LISTING_MIN_MEMBERS = 5
LISTING_MIN_SHARE = 0.5
GENERATED_BLOCK = re.compile(r"<!-- kompendium:[a-z-]+:begin.*?<!-- kompendium:[a-z-]+:end -->", re.S)
LISTING_LINK = re.compile(r"\]\(@/([^)#\s]+?\.md)(?:#[^)\s]*)?\)")


def listing_checks(path: str, body: str) -> tuple:
    """(hand-written rows of a declared listing on this page, (linked, members) when this section
    index is an undeclared listing, else None)."""
    decl = listings.declaration()
    literal = [ln.strip() for ln in GENERATED_BLOCK.sub("", FENCE.sub("", body)).splitlines()
               if ln.lstrip().startswith("|") and "{{" not in ln and "{%" not in ln]
    rows = []
    for listing in decl:
        if path in listing.get("index_pages", []):
            members = set(listings.members_of(listing))
            rows += [ln for ln in literal if any(t in members for t in LISTING_LINK.findall(ln))]
    undeclared = None
    if path.endswith("/_index.md"):
        section = path[:-len("/_index.md")]
        declared = any(l["section"] == section or path in l.get("index_pages", []) for l in decl)
        members = set(listings.members_of({"section": section}))
        linked = {t for ln in literal for t in LISTING_LINK.findall(ln) if t in members}
        if (not declared and members and len(linked) >= LISTING_MIN_MEMBERS
                and len(linked) >= LISTING_MIN_SHARE * len(members)):
            undeclared = (len(linked), len(members))
    return rows, undeclared


CATALOGUE_ROW = re.compile(r"^\|\s*(?:\*\*\s*\[?EA-\d+\.\d+\.\d+\]?(?:\([^)]*\))?\s*\*\*"
                           r"|\[?`EA-\d+\.\d+\.\d+`\]?(?:\([^)]*\))?)\s*\|")
BOLD_CANDIDATE_PAGES = 3  # a bold phrase on this many pages is a term and needs its own page


def violations(page: dict) -> list:
    found = []
    if not page["front_matter"] or page["front_matter_error"] or not page["title"]:
        found.append("front-matter")
    if page["front_matter"] != "toml":
        found.append("toml")
    if not 50 <= len(page["description"]) <= 200:
        found.append("description")
    if not page["tags"] and not page["is_index"]:  # Zola sections take no taxonomies
        found.append("tags")
    if page["words"] >= 50:
        if page["language"] == "en":
            found.append("czech")
        elif page["diacritics"] < 0.03:
            found.append("diacritics")
    if not page["is_index"]:
        if not page["has_related"]:
            found.append("related")
        if len(page["links"]) < 3:
            found.append("links-out")
        if page["links_in"] == 0:
            found.append("not-orphan")
    if page["broken_links"]:
        found.append("broken-link")
    # A page with its own template (mapa, stav) is an application surface, not a text.
    surface = bool(page["template"]) and not page["is_index"]
    if not surface and page["words"] < min_words(page):
        found.append("detail")
    if page["generated"]:
        found.append("generated")
    if page["hardcoded"]:
        found.append("hardcoded-path")
    if page["placeholders"]:
        found.append("placeholder")
    if page["bullets"]:
        found.append("bullets")
    if page["uncited"]:
        found.append("citations")
    if page["citations"] and not page["bibliography_ok"]:
        found.append("bibliography")
    if page["unresolved"]:
        found.append("citation-unresolved")
    if page["missing_techniques"]:
        found.append("technique-page")
    if page.get("howto"):
        found.append("howto")
    if page.get("drug_dose"):
        found.append("drug-dose")
    if page.get("drug_name"):
        found.append("drug-name")
    if page.get("pasted_authorities"):
        found.append("authority-without-source")
    if page.get("clinical_figures"):
        found.append("clinical-figure")
    if page.get("fabricated_citations"):
        found.append("fabricated-citation")
    if page.get("legitimate_indication"):
        found.append("legitimate-indication")
    if page.get("code_ranges"):
        found.append("code-range")
    if page.get("chrome_trailer"):
        found.append("chrome-trailer")
    if page.get("duplicate_passages"):
        found.append("duplicate-passage")
    if page.get("duplicate_tables"):
        found.append("duplicate-table")
    if page.get("access_level_row") or page.get("access_level_prose"):
        found.append("access-level-row")
    if page.get("duplicate_ea_code"):
        found.append("duplicate-ea-code")
    if page.get("catalogue_rows"):
        found.append("catalogue-row")
    if page.get("listing_rows"):
        found.append("listing-row")
    if page.get("undeclared_listing"):
        found.append("undeclared-listing")
    if page.get("alias_collisions"):
        found.append("alias-collision")
    if page.get("misnamed_techniques"):
        found.append("technique-name")
    if page["bold_unlinked"]:
        found.append("bold-term")
    if page.get("template_figures"):
        found.append("template-figure")
    if page.get("platform_section"):
        found.append("platform-section")
    if page.get("relative_links"):
        found.append("relative-link")
    if page.get("platform_labels"):
        found.append("platform-label")
    if page.get("platform_frontmatter"):
        found.append("platform-frontmatter")
    if page.get("philosophy_frame"):
        found.append("philosophy-frame")
    return found


def explain(page: dict) -> dict:
    """What `--list <rule>` prints after the page, for the requirements that name a detail."""
    return {
        "placeholder": ", ".join(page["placeholders"]),
        "bullets": f"{len(page['bullets'])} item(s), first: {page['bullets'][0]}"
        if page["bullets"] else "",
        "citations": f"{page['uncited']} paragraph(s) without a citation",
        "citation-unresolved": ", ".join(page["unresolved"]),
        "clinical-figure": "; ".join(page.get("clinical_figures", [])[:3]),
        "legitimate-indication": "; ".join(page.get("legitimate_indication", [])[:2]),
        "duplicate-passage": "; ".join(b[:60] for b in page.get("duplicate_passages", [])[:2]),
        "duplicate-table": "; ".join(r[:60] for r in page.get("duplicate_tables", [])[:2]),
        "access-level-row": ("hand-written Přístupová úroveň row" if page.get("access_level_row")
                             else "hand-written Přístupová úroveň L<n> in prose — delete the level"
                                  " claim, keep the rest of the sentence"
                             if page.get("access_level_prose") else ""),
        "listing-row": (f"{len(page['listing_rows'])} hand-written row(s) of a declared listing, "
                        f"first: {page['listing_rows'][0][:70]}" if page.get("listing_rows") else ""),
        "undeclared-listing": (f"its table lists {page['undeclared_listing'][0]} of its "
                               f"{page['undeclared_listing'][1]} pages; declare it in data/listings.toml"
                               if page.get("undeclared_listing") else ""),
        "catalogue-row": (f"{len(page['catalogue_rows'])} hand-written row(s), first: "
                          f"{page['catalogue_rows'][0][:70]}" if page.get("catalogue_rows") else ""),
        "alias-collision": ("; ".join(f"{a} is {why}" for a, why in page["alias_collisions"])
                            if page.get("alias_collisions") else ""),
        "duplicate-ea-code": (f"{page['duplicate_ea_code'][0]} is also the ea_code of "
                              + ", ".join(page["duplicate_ea_code"][1])
                              if page.get("duplicate_ea_code") else ""),
        "drug-name": ", ".join(page.get("drug_name", [])),
        "authority-without-source": "; ".join(f"({g})" for g in page.get("pasted_authorities", [])),
        "fabricated-citation": "; ".join(page.get("fabricated_citations", [])[:2]),
        "code-range": "; ".join(page.get("code_ranges", [])[:3]),
        "chrome-trailer": "; ".join(page.get("chrome_trailer", [])[:2]),
        "technique-page": ", ".join("EA-" + c for c in page["missing_techniques"]),
        "technique-name": "; ".join(f"EA-{c} \"{h}\" is \"{t}\" in the catalogue"
                                    for c, h, t in page.get("misnamed_techniques", [])),
        "bold-term": ", ".join(sorted({t for t, _ in page["bold_unlinked"]})),
        "platform-section": "; ".join(page.get("platform_section", [])),
        "relative-link": ", ".join(page.get("relative_links", [])),
        "platform-label": "; ".join(page.get("platform_labels", [])),
        "platform-frontmatter": ", ".join(page.get("platform_frontmatter", [])),
        "philosophy-frame": ", ".join(page.get("philosophy_frame", [])),
    }


CODED_HEADING = re.compile(r"^#{2,6}\s+`?EA-(\d+\.\d+\.\d+)`?\s*[—–:.-]?\s*(.+?)\s*$")
# A section that lays out how a technique is performed: the "Operační modus/postup/sekvence"
# heading (also its "z hlediska supervize" reframing). The defensive frame forbids execution
# steps; this names the whole class so none is written, old or reframed.
HOWTO_HEADING = re.compile(r"^#{2,6}\s+(?:Operační\s+(?:modus|postup|sekvence)|Forensní\s+markery)\b", re.M | re.I)
HOWTO_APPLIER = re.compile(r"před\s+aplikac[ií]\s+\S+\s+techniky", re.I)
# A numbered step subheading ("### Krok 1 — …", "### Krok:") is the playbook shape ADR 0006
# removes; the reframe renames it to a sign ("### Znak: X" or "### X").
HOWTO_STEP = re.compile(r"^#{2,6}\s+Krok[\s:0-9]", re.M | re.I)
# "Krok N" also hides inside a differential table cell, out of a heading's reach.
HOWTO_STEP_CELL = re.compile(r"^\s*\|.*\bKrok\s*\d", re.M | re.I)
# Structural playbook shapes the step/heading checks above miss (ADR 0010 amendment, the 04
# reframe): an applier "Kritický krok" checklist, an "Úroveň E1…E4" escalation ladder, a
# "Vrstva N" build-order sequence, a "Fáze N" phase table and an "… criteria" heading. Headings
# only, judged in prose (front matter is not prose), so a slug or link bearing the word is not hit.
PLAYBOOK_SHAPE = re.compile(
    r"^#{2,6}\s+(?:Úroveň\s+E\s*\d"
    r"|Vrstva\s+(?:\d+|[A-Z])\b"
    r"|\S.*\bcriteria\b)", re.M | re.I)
# The applier checklist the 04 terminal protocols carry (under a "## Kritický krok" heading):
# "před aplikací … protokolu … ověř: 1. 2. 3.". It is keyed on this applier CONTENT, not on the
# heading — the same "Kritický krok" heading in 03/08 is a reader recognition exercise ("vyber
# techniku, projdi Detekční markery") and is book-wide, so a heading match would flag 53 pages
# outside 04. This tolerates the prose line wrap between "aplikací" and "protokol".
# Also the same checklist SHAPED rather than worded: a line that opens with "Před aplikací" and ends
# in a colon, and a numbered list
# right under it, whatever its verbs ("1. Konzultuj … 2. Potvrď … 3. Dokumentuj"). The 06 chapter
# carried that on 11 pages and the protokol/ověř wording missed it (2026-11-15, 2e).
PLAYBOOK_APPLIER = re.compile(
    r"před\s+aplikac[ií][\s\S]{0,60}?\bprotokol"
    r"|^[ \t]*před\s+aplikac[ií]\b[^\n]{0,40}:[ \t]*\n[ \t]*\n?[ \t]*1[.)]\s", re.I | re.M)
# The applier-facing PERMISSION (ADR 0013), the counterpart of the applier checklist: a heading on
# a technique page naming legitimate indications / permitted use / conditions for application grants
# permission to apply the technique; the book's frame is recognition and defence, not sanctioned
# application. Matched by SHAPE, not the one current string "### Legitimní indikace (…)", so a
# reworded heading still fails. An EXCLUSION heading ("Vylučující okolnosti", "Okolnosti, které
# vylučují expozici") must NOT match — hence the `vyluč` guard. LEGIT_PERMISSION also keys on the
# byte-identical permission item, so renaming the heading but keeping the claim does not evade.
LEGIT_INDICATION = re.compile(
    r"^#{2,6}\s+(?![^\n]*vylo?uč)[^\n]*"  # guard BOTH stems: vyluč- (vylučuje) and vylouč- (vyloučena)
    r"(?:legitimní\s+(?:indikac|užit|použit|kontext|aplikac)|indikace\s+k\s+aplikaci"
    r"|podmínky\s+(?:použití|aplikace|nasazení)"
    r"|přípustné?\s+(?:užití|použití|nasazení|indikac|aplikac))", re.M | re.I)
LEGIT_PERMISSION = re.compile(r"benefit\s+prokazateln[ěe]\s+převažuje\s+riziko", re.I)
# "Kdy je … legitimní" names the conditions under which applying the technique is legitimate —
# applier permission on a terminal protocol. The SAME heading on the EA-6 care/recovery family
# separates legitimate care from abuse with defensive criteria, so the scope is the technique
# FAMILY: charged on EA-4.x and every non-EA-6 code, exempt on EA-6 — NOT on whether the section
# cites (all 15 EA-4 pages cite; some EA-6 cite nothing, so citation is not the discriminator). A
# word between "je" and "legitimní" ("Kdy je rámec legitimní") is why the LEGIT_INDICATION form
# missed it; up to two words are allowed. LEGIT_FRAME_SENTENCE keys on the byte-identical opening
# the pages share, so renaming the heading but keeping the claim does not evade.
LEGIT_FRAME = re.compile(  # all on the heading line: [ \t] gaps, not \s (which would span newlines)
    r"^#{2,6}[ \t]+(?![^\n]*vylo?uč)[^\n]*kdy[ \t]+je[ \t]+(?:\S+[ \t]+){0,2}legitimní", re.M | re.I)
LEGIT_FRAME_SENTENCE = re.compile(
    r"Legitimní\s+rámec\s+je\s+pro\s+tyto\s+protokoly\s+úzký\s+a\s+vždy\s+vnější", re.I)
EA_RECOVERY_FAMILY = "6"  # EA-6 care/recovery: the frame heading there is defensive, not permission
# A drug dose or dose range: a number and a dose unit. A bibliography (a work's title, e.g.
# "Mediator 150 mg") is skipped by section, so only a dosing claim in prose is caught.
DRUG_DOSE = re.compile(r"\d[\d.,]*\s*(?:[–-]|až)?\s*\d*\s*(?:mg|µg|μg|mcg|IU)\b", re.I)
# A named medication or drug class on a content page (ADR 0013/0014, owner: "the book names no
# drugs or dosing"; the content lane rewrites the drug generically). A CURATED list of Czech
# psychiatric class stems and common INNs — not a regex guess — so each entry is defensible and the
# fix is a generic rewrite. A work's title in a bibliography is skipped by section, and
# content/references.md (the generated book-wide bibliography, already in EXEMPT) is excluded whole.
_DRUG_CLASSES = [
    r"antipsychotik\w*", r"neuroleptik\w*", r"antidepresiv\w*", r"benzodiazepin\w*",
    r"anxiolytik\w*", r"hypnotik\w*", r"sedativ\w*", r"antiepileptik\w*", r"antikonvulz\w*",
    r"opioid\w*", r"opiát\w*", r"stimulanci\w*", r"psychostimulanci\w*", r"nootropik\w*",
    r"thymoprofylaktik\w*",
]
_DRUG_INNS = [
    r"haloperidol\w*", r"chlorpromazin\w*", r"levomepromazin\w*", r"risperidon\w*", r"olanzapin\w*",
    r"quetiapin\w*", r"kvetiapin\w*", r"aripiprazol\w*", r"klozapin\w*", r"clozapin\w*",
    r"ziprasidon\w*", r"paliperidon\w*", r"sulpirid\w*", r"tiaprid\w*", r"sertralin\w*",
    r"citalopram\w*", r"escitalopram\w*", r"fluoxetin\w*", r"paroxetin\w*", r"fluvoxamin\w*",
    r"venlafaxin\w*", r"duloxetin\w*", r"mirtazapin\w*", r"bupropion\w*", r"trazodon\w*",
    r"agomelatin\w*", r"diazepam\w*", r"alprazolam\w*", r"klonazepam\w*", r"clonazepam\w*",
    r"lorazepam\w*", r"oxazepam\w*", r"bromazepam\w*", r"midazolam\w*", r"zolpidem\w*",
    r"zopiklon\w*", r"lithi\w*", r"valproát\w*", r"lamotrigin\w*", r"karbamazepin\w*",
    r"carbamazepin\w*", r"methylfenidát\w*", r"metylfenidát\w*", r"atomoxetin\w*", r"naltrexon\w*",
    r"naloxon\w*", r"buprenorfin\w*", r"metadon\w*", r"ketamin\w*", r"esketamin\w*",
]
# A cheap pre-filter for DRUG_NAME: every entry is a literal stem + \w*, so a page names a drug
# only if one of its lower-cased words starts with a stem (str.startswith on a tuple runs in C;
# the 65-way regex alternation tried at every word boundary was most of drug_names' 4.5 s).
_DRUG_STEMS = tuple(e[:-3] for e in _DRUG_CLASSES + _DRUG_INNS) + ("ssri", "snri", "imao", "maoi")
_WORDS = re.compile(r"\w+")


def _may_name_drug(prose: str) -> bool:
    return any(w.startswith(_DRUG_STEMS) for w in _WORDS.findall(prose.lower()))


DRUG_NAME = re.compile(
    r"\b(?:" + "|".join(_DRUG_CLASSES + _DRUG_INNS) + r")"
    r"|\bSSRI\b|\bSNRI\b|\bIMAO\b|\bMAOI\b", re.I)
# A clinical specific a reader could act on (ADR 0010). Judged per paragraph, list item and
# table row: one without an author-year citation or statute is a finding.
_UNIT = r"(?:h\b|hod\b|dn[ůíyeu]\w*|týd\w*|tydn\w*|měsíc\w*|mesic\w*|hodin\w*|sezen\w*|session\w*|weeks?|months?|days?)"
_SCORE = r"(?:HRV|HR|DES(?:-II|-T|-B)?|CDS|PCL(?:-5)?|BDI(?:-II)?|PHQ-9|GAD-7|CAPS(?:-5)?|SCL-90|IES-R|BAI|MMSE|K10)"
CLINICAL_FIGURE = re.compile(
    r"\b\d+(?:[,.]\d+)?\s*(?:[–-]|až|to)\s*\d+(?:[,.]\d+)?\s*" + _UNIT
    + r"|\b\d+(?:[,.]\d+)?\s*%\s*(?:\S+\s+){0,3}?(?:sessions?|sezení|pacient\w*|klient\w*|případ\w*"
    r"|účastník\w*|respondent\w*|populace|obětí|přeživších)"
    r"|(?:úspěšnost\w*|remis\w*|relaps\w*|recidiv\w*|zlepšení|drop-?out)\D{0,30}\d+(?:[,.]\d+)?\s*%"
    r"|\b" + _SCORE + r"\)?\s*(?:sk[óo]re\s*|score\s*)?(?:[<>≥≤]=?|nad|pod|>\s*=)\s*\d+"
    r"|\b(?:sk[óo]re|score|subscale|subškála)\s*(?:[<>≥≤]=?)\s*\d+"
    r"|\b\d+\s*(?:[–-]\s*\d+\s*)?(?:sezení|sessions)\b"
    r"|(?:minim(?:um|álně)|alespoň|nejméně|min\.)\s*\d+(?:[,.]\d+)?\s*(?:h\b|hod\w*|sezen\w*|session\w*|týd\w*|měsíc\w*|dn[ůíy]\w*)"
    r"|\b\d+\s*[–-]\s*\d+\s*(?:elementárních\s+|různých\s+)?(?:technik\w*|trainee\w*|účastník\w*|klient\w*|pacient\w*)", re.I)
# A study-result statistic: a trial design, sample size or effect size (ADR 0012, fabricated-
# citation). Paired with an author-year citation in the same unit and repeated byte-identical
# across pages, it marks a pasted study, not one a page actually draws on.
STUDY_STAT = re.compile(
    r"\bRCT\b|\bmeta-?anal\w*|\bn\s*=\s*\d|\b[gdr]\s*=\s*\d|\bOR\s*=\s*\d|\bRR\s*=\s*\d"
    r"|\bHR\s*=\s*\d|\bNNT\b", re.I)
# A narrative author-year that cited_names misses: "Hayes, S. C., et al. (2020)" / "van der Kolk,
# B. A., et al. (2014)" — a surname, initials with periods, optional et al./a kol., then (year).
# cited_names handles the parenthetical "(Author, year)" form; this adds the initials narrative form
# the pasted study lines use. The initials are required, so it does not match a bare "(2020)".
AUTHOR_YEAR = re.compile(
    r"[A-ZÀ-Ž][\wà-ž'’-]+(?:\s+[a-zà-ž][\wà-ž'’-]+){0,2}(?:\s+[A-ZÀ-Ž][\wà-ž'’-]+)?"
    r",?\s+(?:[A-ZÀ-Ž]\.\s*){1,3}(?:,?\s*(?:et al\.|a kol\.))?\s*\(\s*(?:1[5-9]\d\d|20[0-4]\d)\b")
# A leading list marker — "- ", "* ", "1. ", "1) ", "(1) " — stripped so the same study sentence
# numbered differently on two pages still compares byte-identical.
LIST_MARKER = re.compile(r"^(?:[-*+]\s+|\d+[.)]\s+|\(\d+\)\s+)")
FABRICATED_CITATION_PAGES = 3  # a citation+stat unit identical on this many pages is a pasted study
CHROME_TRAILER = re.compile(r"^#{1,6}\s+Connect & Contribute\b|^\*{0,2}Created by \[", re.M)
CODE_RANGE = re.compile(r"EA-\d+\.\d+\.\d+`?\]?(?:\([^)\s]*\))?\s*(?:[—–-]{1,2}|až)\s*`?(?:EA-)?\d+\.\d+\.\d+")
# A pasted, unsourced authority (ADR 0014): a parenthetical group of two or more capitalised
# surnames with NO year on the line, repeated byte-identical across pages. A one-off "(Austin,
# Searle)" in an argument is a legitimate reference; the SAME name-group pasted on many pages with
# no year is name-dropped authority, not a citation — and every citation gate misses it because
# there is no year to resolve. The year test keeps real "(Author, 2020)" out; the cross-page
# repetition keeps a single legitimate reference out. Capitals are listed explicitly: a regex range
# such as [Á-Ž] wrongly includes lowercase accented letters and matches "(činnost, čas)".
_SURNAME = r"[A-ZÁČĎÉĚÍŇÓŘŠŤÚŮÝŽ][a-zá-ž]+"
AUTHORITY_GROUP = re.compile(r"\((" + _SURNAME + r"(?:\s*(?:,|&|\ba\b)\s*" + _SURNAME + r")+)\)")
AUTHORITY_NAME = re.compile(_SURNAME)
AUTHORITY_YEAR = re.compile(r"\b(?:1[5-9]\d\d|20[0-4]\d)\b")
AUTHORITY_PAGES = 3  # a name-group with no year identical on this many pages is pasted authority
# A genuinely-lowercase word in the source (not an uppercased name lowered by us). A capitalised
# token in a parenthetical group is a real SURNAME only when its lowercase form is NOT a word the
# book actually uses in prose: a pure name-drop (Vondráček, Ferenczi, Fonagy, Appelbaum) never
# appears lowercased, while a concept pair "(Přesvědčení, Imprint)" or a genuinely-discussed thinker
# (russell, wittgenstein) does. This excludes concept-word false positives AND names the book
# actually engages, leaving only unsourced name-drops.
LOWER_WORD = re.compile(r"(?<![^\W\d_])[a-zá-žčďěňóřšťůýž]{3,}")
AUTHORITY_PROSE_MAX = 2  # a candidate surname used lowercased more than this is a real word, not a drop
BIBLIO_HEADING = re.compile(r"^#{1,3}\s+(?:Literatura|Bibliografie|Reference|Zdroje|Prameny)\b", re.I)
# A "Vztah k/ke <Prismatic component>" heading ties the book to the Prismatic platform. ADR 0007
# (owner, 2026-11-11: do not import; strip) removed every such section and the pages that were
# only this; the gate refuses any reintroduction. Headings only, so it cannot over-match prose. The
# optional number prefix catches a chapter heading like "# 1.6 Vztah ke Prismatic Platformě"
# (amendment 4), where the section number sits between the # and "Vztah".
PLATFORM_HEADING = re.compile(
    r"^#{1,6}\s+(?:[\d.]+\s+)?Vztah\s+ke?\s+.*(?:Prismatic|Decision\s+Engine|NABLA|Nabla|∇∞)", re.M)
# Platform-hub markers the book must never carry (amendment 5 / dev-31): the cross_link shortcode
# wrote "Prismatic Platform: /hub/dd/…" into page attributes on ~274 pages, and the platform's
# internal hub paths leak the private deployment. These are removed; the gate refuses their return.
PLATFORM_MARKER = re.compile(r"\{\{[^}]*\bcross_link\b|/hub/|/osint/toolbox/")
# Three more classes a name-in-prose sweep structurally cannot see (found by 2e's slice-2 and the
# @/ migration); each gate refuses exactly what was removed, so all stand at 0.
#   relative-link: a markdown link whose target is not @/ (the only form zola + the link checker
#     resolve), nor an URL / #fragment / mailto: / tel: / absolute /static path. A relative target
#     404s silently; require @/.
MD_LINK = re.compile(r"\]\(\s*([^)]+?)\s*\)")
RELATIVE_OK = re.compile(r"^(?:@/|https?://|#|mailto:|tel:|/)")
#   platform component names (whole names, NOT the hyphenated slugs of kept general articles such as
#     decision-engine-calibration, and NOT the doctrine-pillar abbreviations which are a separate
#     content cleanup). Used by the label and front-matter gates.
PLATFORM_NAME = re.compile(
    r"\b(?:Prismatic|NABLA|Nabla|Decision Engine|Decision Core|QEVE|QDP|Trinity Gate|HAWKEYE|"
    r"Supreme Commander|Color Teams|AIAD|AutoHeal|AutoEvolve|3NL)\b|∇∞")
#   platform-label: a platform name inside a markdown link LABEL [ … ](…) — target-innocent,
#     label-guilty (the "Vztah ke Decision Engine" / "…a NABLA" class).
MD_LABEL = re.compile(r"\[([^\]]+)\]\(")
#   philosophy-frame: the platform's development-philosophy, which amendment 6 reframed out of
#     content/philosophy (the book keeps its own ethics, not the platform's software philosophy).
PHILO_FRAME = re.compile(r"\b(?:Prismatic|NABLA|ceremonial\s+computing)\b", re.I)
TITLE_CODE = re.compile(r"^\s*EA-\d+\.\d+\.\d+\s*[—–:.-]?\s*")


def name_key(text: str) -> str:
    """A comparable form of a technique name: link text kept, markup, case, diacritics and
    punctuation dropped."""
    text = LINK_MARKUP.sub(r"\1", text)
    return " ".join(slugify(text).split("-"))


def catalogue_titles(pages: list) -> dict:
    """Code X.Y.Z -> the names its technique pages give it (title without the code)."""
    names = collections.defaultdict(set)
    for page in pages:
        m = TECHNIQUE_PATH.match(page["path"])
        if m and not page["is_index"]:
            names[".".join(m.groups())].add(name_key(TITLE_CODE.sub("", page["title"])))
    return names


def misnamed_headings(body: str, catalogue: dict) -> list:
    """(code, heading name, catalogue name) for each coded heading whose name is neither the
    catalogue's name nor contains it nor is contained in it."""
    found, in_code = [], False
    for line in body.split("\n"):
        if FENCE_LINE.match(line):
            in_code = not in_code
            continue
        m = None if in_code else CODED_HEADING.match(line)
        if not m or m.group(1) not in catalogue:
            continue
        heading = name_key(m.group(2))
        if not heading:
            continue
        if not any(heading == t or (t and (t in heading or heading in t))
                   for t in catalogue[m.group(1)]):
            found.append((m.group(1), m.group(2), sorted(catalogue[m.group(1)])[0]))
    return found


# Precompiled line patterns: they run per line of every page in several gates, and inline
# re.match with a string pattern paid a cache lookup each call (2026-11-12 profile, f3).
HEADING_PREFIX = re.compile(r"^#{1,6}\s")
FENCE_LINE = re.compile(r"^\s*(```|~~~)")
ITEM_PREFIX = re.compile(r"^(?:[-*+]|\d+[.)])\s")
TECHNIQUE_PATH = re.compile(r"kompendium/techniques/ea-(\d+)-(\d+)-(\d+)")
SPACE_RUN = re.compile(r"\s+")
LINK_MARKUP = re.compile(r"\[([^\]]*)\]\([^)]*\)")


_HAS_DIGIT = re.compile(r"\d")


def clinical_figures(prose: str) -> list:
    """Paragraphs, list items and table rows outside bibliographies that state a clinical
    specific without an author-year citation or statute (CLINICAL_FIGURE)."""
    out, block, in_biblio = [], [], False

    def judge(text):
        if not _HAS_DIGIT.search(text):
            return  # every CLINICAL_FIGURE alternative needs a digit; skip the costly search
        m = CLINICAL_FIGURE.search(text)
        if not m:
            return
        found, _, law = cited_names(plain(text))
        if not found and not law:
            out.append(m.group(0).strip())

    def flush():
        if block:
            judge(" ".join(block))
            block.clear()

    for line in prose.split("\n"):
        s = line.strip()
        if HEADING_PREFIX.match(s):
            flush()
            in_biblio = bool(BIBLIO_HEADING.match(s))
            continue
        if in_biblio:
            continue
        if not s:
            flush()
        elif s.startswith("|") or ITEM_PREFIX.match(s):
            flush()
            judge(s)  # a row or an item is judged on its own
        else:
            block.append(s)
    flush()
    return out


def citation_stat_units(prose: str) -> set:
    """Text units (paragraph, list item, table row) outside bibliographies that pair an author-year
    citation with a study statistic (STUDY_STAT), returned as list-marker-stripped strings so the
    SAME study sentence on several pages compares byte-identical. `analyse` flags a unit that repeats
    on FABRICATED_CITATION_PAGES+ unrelated pages — which a genuinely drawn-on study never is: a real
    citation is paraphrased for each page, not re-pasted whole with an identical n and effect size.
    The referent is deliberately NOT the central bibliography: it is thematic (clinical authors such
    as Foa, Resick, Hayes are cited in prose but absent from it), and a real (surname, year) can
    carry a fabricated study (van der Kolk 2014 is a book there, pasted as an RCT in content)."""
    out, block, in_biblio = set(), [], False

    def judge(text):
        t = LIST_MARKER.sub("", text.strip())
        if len(t) < 20 or not STUDY_STAT.search(t):
            return
        found, _, _ = cited_names(plain(t))
        if found or AUTHOR_YEAR.search(t):
            out.add(t)

    def flush():
        if block:
            judge(" ".join(block))
            block.clear()

    for line in prose.split("\n"):
        s = line.strip()
        if HEADING_PREFIX.match(s):
            flush()
            in_biblio = bool(BIBLIO_HEADING.match(s))
            continue
        if in_biblio:
            continue
        if not s:
            flush()
        elif s.startswith("|") or LIST_MARKER.match(s):
            flush()
            judge(s)  # a row or an item is judged on its own
        else:
            block.append(s)
    flush()
    return out


def has_drug_dose(prose: str) -> bool:
    """A dose/range in prose outside bibliography sections (a work's title is not a dosing claim)."""
    in_biblio = False
    for line in prose.split("\n"):
        if HEADING_PREFIX.match(line):
            in_biblio = bool(BIBLIO_HEADING.match(line))
        if not in_biblio and DRUG_DOSE.search(line):
            return True
    return False


# A duplicate PROSE passage: a paragraph re-pasted byte-identical across pages, which no other gate
# sees once it has no figure (template-figure owns figure-bearing rows). ADR 0013. Measured over
# content/kompendium, whitespace-normalised, >= DUP_MIN_WORDS words, on DUP_PAGES+ pages. Excluded,
# because each is a different remedy: the "Created by …" chrome footer (a template partial, dev-31),
# and cross-reference / relation list items (derived by the okolí / Související engine, not pasted).
DUP_MIN_WORDS = 15
DUP_PAGES = 3
DUP_WORD = re.compile(r"\w+", re.U)
DUP_CHROME = re.compile(r"Created by|github\.com/korczis")
# A cross-reference LINE: a list item of EA codes / links, or a block that opens with a link. A
# prose paragraph with an INLINE @/ link is not excluded — it is still pasted prose.
DUP_XREF = re.compile(r"^-\s*\*?\*?\[?EA-\d|^-\s*\[|^@/kompendium|^\[[^\]]*\]\(@/")
# A page's own technique code, interpolated into an otherwise-pasted block ("Klinický kontext
# **EA-4.2.5** připouští …"), makes every copy read as unique. Normalise the code, with its bold
# markers, to a placeholder in the STORED block so the copies hash identically; the word count and
# the exclusions above still run on the original text, not the placeholder.
DUP_CODE = re.compile(r"\*{0,2}EA-\d+(?:\.\d+)*\*{0,2}")


def passage_blocks(prose: str) -> set:
    """Whitespace-normalised prose paragraphs (contiguous non-blank lines) of DUP_MIN_WORDS+ words,
    for cross-page duplicate detection. Skips headings, tables, blockquotes and `-`/`*` list items;
    skips the chrome footer, cross-reference lines and figure-bearing blocks (template-figure's
    domain). A numbered or inline-linked paragraph that is pasted prose is kept."""
    out, cur = set(), []

    def flush():
        if not cur:
            return
        nb = SPACE_RUN.sub(" ", " ".join(cur)).strip()
        cur.clear()
        if (len(DUP_WORD.findall(nb)) >= DUP_MIN_WORDS and nb[:1] not in "#|>"
                and nb[:2] not in ("- ", "* ") and "@/kompendium" not in nb[:40]
                and not DUP_CHROME.search(nb) and not DUP_XREF.search(nb) and not FIGURE.search(nb)):
            out.add(DUP_CODE.sub("EA-§", nb))

    for line in prose.split("\n"):
        if line.strip():
            cur.append(line)
        else:
            flush()
    flush()
    return out


# Owner answer 2026-11-13 (ADR 0013, doplněk 2, "Keep in history"): a drug named as the documented
# subject of a historical or regulatory case stays. The case pages are exempt by path, and a link
# to one of them is exempt by its label ("[FDA a opioidy](@/kompendium/historical-cases/…)"), since
# the label is the case's name. The body's own chemistry ("endogenní opioidy") is not medication.
DRUG_HISTORY_PREFIX = "kompendium/historical-cases/"
HISTORY_LINK = re.compile(r"\[[^\]]*\]\(@/" + re.escape(DRUG_HISTORY_PREFIX) + r"[^)]*\)")
ENDOGENOUS = re.compile(r"\bendogenn\w*\s+opioid\w*", re.I)


def drug_recognition() -> dict:
    """Pages exempt from drug-name because they name a class to recognise, never to offer (owner,
    ADR 0013 doplněk 3): path -> because, from data/drug-recognition.toml. An entry without a
    `because` or naming a missing page is a hard error: the list never grows by accident."""
    path = ROOT / "data" / "drug-recognition.toml"
    if not path.exists():
        return {}
    out = {}
    for entry in tomllib.loads(path.read_text()).get("page", []):
        page, because = entry.get("path", ""), entry.get("because", "").strip()
        if not because or entry.get("kind") not in ("emergency", "differential", "harm"):
            sys.exit(f"check-ia: data/drug-recognition.toml: {page or '?'} needs kind and because")
        if not (ROOT / page).exists():
            sys.exit(f"check-ia: data/drug-recognition.toml: {page} does not exist")
        out[page] = because
    return out


# A table DATA row ("| … |") re-pasted byte-identical across pages — the complement of
# passage_blocks, which skips tables. The "|---|" delimiter is skipped. Exempt ONLY a metadata
# field: a bold-label first cell AND a short second cell (a code, a level or a link, NOT a prose
# sentence), so a pasted sentence in "| **Mechanismus** | … |" is still caught.
TABLE_DELIM = re.compile(r"^\|[\s:|-]+\|?\s*$")
TABLE_BOLD_LABEL = re.compile(r"^\*\*[^*]+\*\*$")
TABLE_LINK_VALUE = re.compile(r"^\[[^\]]*\]\([^)]*\)$")  # a single markdown link counts as short
DUP_TABLE_MIN_WORDS = 8
# A hand-written "| **Přístupová úroveň** | … |" metadata row. The access level is data
# (extra.access_level) and is rendered derived in the page header, linked to the classification
# page; the row must not be re-typed into content, where it drifts (11 hand-written variants before
# this). The gate refuses any such row on a kompendium page.
ACCESS_LEVEL_ROW = re.compile(r"^\|\s*\*\*Přístupová úroveň\*\*\s*\|", re.M)
# The same claim written as prose rather than a table row. Removing the row from 420 pages left
# 41 of these standing, 30 of them byte-identical on the quick-reference cards beside the
# technique pages the row had just been cleared from, so a reader following a card link still met
# it. The level is shown by the header badge from extra.access_level; a sentence that re-states it
# is the same hand-written duplicate in a different shape.
#
# It matches the phrase followed by a level, however the sentence dresses it: bold or plain, with
# or without a leading admonition marker, "L3", "L3–L4" (en dash or hyphen) or "L2 (rozšířený
# přístup)", and a ".", ":" or "—" after it. It does NOT match a heading (a documented
# classification section is a different decision, not a stray claim) and does NOT match a markdown
# link label such as "[Přístupová úroveň oddílu](…)", which is navigation to that section rather
# than an assertion about the current page.
ACCESS_LEVEL_PROSE = re.compile(
    r"(?<!\])\*{0,2}Přístupová\s+úroveň\*{0,2}\s*:?\s*"           # the phrase, bold or plain
    r"\*{0,2}L\s*\d(?:\s*[–-]\s*L?\d)?"                            # L3, L3–L4, L2
    r"(?:\s*\([^)]*\))?\*{0,2}"                                    # an optional "(rozšířený přístup)"
    # Closed by "." ":" or a dash — but never by the dash INSIDE a range. Without this lookahead
    # the engine backtracks on "L3–L4": it gives up the range, then takes the en dash as the
    # terminator, and "## Přístupová úroveň: L3–L4" matched although a heading must not be charged.
    # Measured: with it, 39 files on main and the heading untouched; without it, 40 and the heading.
    r"\s*(?![–-]\s*L?\d)(?:[.:—–-]|\*\*\s*[.:—–-])",
    re.M,
)


def table_rows(prose: str) -> set:
    """Normalised table data rows of DUP_TABLE_MIN_WORDS+ words, for cross-page duplicate detection
    (passage_blocks' table complement). Skips the "|---|" delimiter; exempts a metadata field whose
    first cell is a bold label and whose second cell is a short value (code/level/link)."""
    out = set()
    for line in prose.split("\n"):
        s = line.strip()
        if not (s.startswith("|") and s.endswith("|")) or TABLE_DELIM.match(s):
            continue
        cells = [c.strip() for c in s.strip("|").split("|")]
        if (len(cells) >= 2 and TABLE_BOLD_LABEL.match(cells[0])
                and (TABLE_LINK_VALUE.match(cells[1]) or len(DUP_WORD.findall(cells[1])) <= 5)):
            continue  # a metadata field (label → short value), not pasted prose
        nb = DUP_CODE.sub("EA-§", SPACE_RUN.sub(" ", s))
        if len(DUP_WORD.findall(nb)) >= DUP_TABLE_MIN_WORDS:
            out.add(nb)
    return out


def drug_names(prose: str) -> list:
    """The distinct named drugs/classes in prose outside bibliography sections (a work's title is
    not a naming claim). content/references.md is excluded by the caller via EXEMPT, the historical
    case pages by DRUG_HISTORY_PREFIX; links to those cases and endogenous chemistry are skipped."""
    # Most pages name no drug at all. The exemptions and the bibliography cut only REMOVE text, so
    # a page with no match in its whole prose cannot have one after them: one pass decides it,
    # instead of three regex passes on every page (2026-11-15 profile: drug_names was 4.9 s of
    # check-ia's 23.6 s).
    if not _may_name_drug(prose):
        return []
    prose = ENDOGENOUS.sub("", HISTORY_LINK.sub("", prose))
    kept, in_biblio = [], False
    for line in prose.split("\n"):
        if line.startswith("#") and HEADING_PREFIX.match(line):
            in_biblio = bool(BIBLIO_HEADING.match(line))
        if not in_biblio:
            kept.append(line)
    # One search over the kept lines, not one per line: the pattern never spans a newline, so the
    # result is the same, and the per-line calls were most of check-ia's runtime (2026-11-12).
    return sorted({m.group(0).lower() for m in DRUG_NAME.finditer("\n".join(kept))})


def analyse(pages: list) -> dict:
    """Attach the text analyses to each page, among them `template_figures`; return the
    bold-candidate worklist {"bold:<slug>": (pages, phrase)}."""
    terms = bold_term_index(pages)
    codes = technique_codes(pages)
    catalogue = catalogue_titles(pages)
    recognition = drug_recognition()
    phrases = collections.defaultdict(set)
    shown = {}
    figures = collections.defaultdict(set)
    fabricated = collections.defaultdict(set)
    passages = collections.defaultdict(set)
    tables = collections.defaultdict(set)
    authorities = collections.defaultdict(set)
    lower_freq = collections.Counter()
    for page in pages:
        body = page.pop("body")
        # catalogue-row (ADR 0015): a literal table row whose first cell is a bold EA code; the row a
        # load_data loop renders is not literal, its source line carries the Tera expression
        page["catalogue_rows"] = [ln.strip() for ln in FENCE.sub("", body).splitlines()
                                  if CATALOGUE_ROW.match(ln) and "{{" not in ln]
        page["listing_rows"], page["undeclared_listing"] = listing_checks(page["path"], body)
        lines = list(body_lines(body))
        page.update(academic_profile(body, lines))
        page["placeholders"] = placeholder_markers(body, page["extra"])
        page["missing_techniques"] = [c for c in ea_mentions(body) if c not in codes]
        page["misnamed_techniques"] = [] if page["path"].startswith("kompendium/techniques/") \
            else misnamed_headings(body, catalogue)
        prose = FENCE.sub("", body)
        technique = page["path"].startswith("kompendium/techniques/")
        page["howto"] = bool(HOWTO_HEADING.search(prose) or HOWTO_APPLIER.search(prose)
                             or (page["path"].startswith("kompendium/")
                                 and (PLAYBOOK_SHAPE.search(prose) or PLAYBOOK_APPLIER.search(prose)))
                             or (technique and (HOWTO_STEP.search(prose) or HOWTO_STEP_CELL.search(prose))))
        # EA-4.x and every non-EA-6 family gets the "kdy je … legitimní" frame + its byte-identical
        # opening sentence; EA-6 care/recovery is exempt. Family from the technique code (equals the
        # front-matter ea_code family), not a path list.
        fam = re.match(r"kompendium/techniques/ea-(\d+)-", page["path"])
        non_recovery = bool(fam) and fam.group(1) != EA_RECOVERY_FAMILY
        page["legitimate_indication"] = (
            sorted({m.group(0).strip() for m in LEGIT_INDICATION.finditer(prose)}
                   | {m.group(0) for m in LEGIT_PERMISSION.finditer(prose)}
                   | ({m.group(0).strip() for m in LEGIT_FRAME.finditer(prose)} if non_recovery else set())
                   | ({m.group(0) for m in LEGIT_FRAME_SENTENCE.finditer(prose)} if non_recovery else set()))
            if technique else [])
        page["drug_dose"] = has_drug_dose(prose)
        key = f"content/{page['path']}"
        names = ([] if key in EXEMPT or page["path"].startswith(DRUG_HISTORY_PREFIX)
                 else drug_names(prose))
        if key in recognition:
            # a recognition page passes while it names a drug; once it names none the entry is
            # stale and is charged, so the exemption is removed with its reason
            names = [] if names else ["stale entry in data/drug-recognition.toml"]
        page["drug_name"] = names
        page["access_level_prose"] = (page["path"].startswith("kompendium/")
                                      and bool(ACCESS_LEVEL_PROSE.search(prose)))
        page["access_level_row"] = (page["path"].startswith("kompendium/")
                                    and bool(ACCESS_LEVEL_ROW.search(prose)))
        lower_freq.update(LOWER_WORD.findall(prose))
        for line in prose.split("\n"):
            if AUTHORITY_YEAR.search(line):
                continue
            for m in AUTHORITY_GROUP.finditer(line):
                authorities[m.group(1)].add(page["path"])
        page["clinical_figures"] = clinical_figures(prose) if page["path"].startswith("kompendium/") else []
        page["code_ranges"] = [m.group(0) for m in CODE_RANGE.finditer(prose)]
        page["chrome_trailer"] = [m.group(0).strip("*# ") for m in CHROME_TRAILER.finditer(body)]
        page["platform_section"] = (
            [m.group(0).strip() for m in PLATFORM_HEADING.finditer(prose)]
            + sorted({m.group(0) for m in PLATFORM_MARKER.finditer(body)}))
        page["relative_links"] = sorted({t for m in MD_LINK.finditer(body)
                                         for t in [m.group(1)] if not RELATIVE_OK.match(t)})
        page["platform_labels"] = sorted({m.group(1).strip() for m in MD_LABEL.finditer(body)
                                          if PLATFORM_NAME.search(m.group(1))})
        fm = " ".join([page.get("title") or "", page.get("description") or "",
                       " ".join(page.get("tags") or []), repr(page.get("extra") or {})])
        page["platform_frontmatter"] = sorted(set(PLATFORM_NAME.findall(fm)))
        page["philosophy_frame"] = (sorted(set(m.group(0) for m in PHILO_FRAME.finditer(prose)))
                                    if page["path"].startswith("philosophy/") else [])
        for line in figure_lines(prose) if technique else ():
            figures[line].add(page["path"])
        if page["path"].startswith("kompendium/"):
            for unit in citation_stat_units(prose):
                fabricated[unit].add(page["path"])
            for blk in passage_blocks(prose):
                passages[blk].add(page["path"])
            for row in table_rows(prose):
                tables[row].add(page["path"])
        page["bold_unlinked"] = []
        for start, _, text, linked in bold_spans(body, lines):
            if linked:
                continue
            key = slugify(text)
            target = terms.get(key)
            if target:
                if target != page["path"]:
                    page["bold_unlinked"].append((text, target))
            elif (re.search(r"[^\W\d_]", text) and not EA_ONLY.match(key)
                  and not is_list_lead(body, start)):
                phrases[key].add(page["path"])
                shown.setdefault(key, text)
    shared = {line: paths for line, paths in figures.items()
              if len(paths) >= TEMPLATE_FIGURE_PAGES}
    # Keep a group only when every member is a pure name-drop (never used lowercased in prose) and
    # the group is pasted on AUTHORITY_PAGES+ pages. The frequency filter drops concept-word pairs
    # and genuinely-discussed thinkers; the page threshold drops a one-off legitimate reference.
    def all_namedrops(group: str) -> bool:
        return all(lower_freq[n.lower()] <= AUTHORITY_PROSE_MAX
                   for n in AUTHORITY_NAME.findall(group))
    auth_shared = {g: paths for g, paths in authorities.items()
                   if len(paths) >= AUTHORITY_PAGES and all_namedrops(g)}
    for page in pages:
        page["template_figures"] = sorted(line for line, paths in shared.items()
                                          if page["path"] in paths)
        page["pasted_authorities"] = sorted(g for g, paths in auth_shared.items()
                                            if page["path"] in paths)
    # fabricated-citation owns only what template-figure does not already charge, so one pasted line
    # is not double-charged with two remedies (the template-figure lines, list-marker-stripped to
    # match the normalised units, are excluded).
    tf_lines = {LIST_MARKER.sub("", line) for line in shared}
    fab_shared = {u: paths for u, paths in fabricated.items()
                  if len(paths) >= FABRICATED_CITATION_PAGES and u not in tf_lines}
    for page in pages:
        page["fabricated_citations"] = sorted(u for u, paths in fab_shared.items()
                                              if page["path"] in paths)
    # duplicate-passage: a prose paragraph re-pasted byte-identical on DUP_PAGES+ pages.
    dup_shared = {b: paths for b, paths in passages.items() if len(paths) >= DUP_PAGES}
    for page in pages:
        page["duplicate_passages"] = sorted(b for b, paths in dup_shared.items()
                                            if page["path"] in paths)
    # alias-collision: an alias is a free old address, not the page's own nor another page's.
    def as_path(a: str) -> str:
        return "/" + a.strip().strip("/") + "/"
    served = {as_path(page["url"]): page["path"] for page in pages}
    claimed = collections.defaultdict(set)
    for page in pages:
        for a in page.get("url_aliases", []):
            claimed[as_path(a)].add(page["path"])
    for page in pages:
        hits = []
        for a in page.get("url_aliases", []):
            at = as_path(a)
            if served.get(at) == page["path"]:
                hits.append((a, "the page's own address"))
            elif at in served:
                hits.append((a, f"the address of {served[at]}"))
            elif len(claimed[at]) > 1:
                hits.append((a, "also an alias of " + ", ".join(sorted(claimed[at] - {page["path"]}))))
        page["alias_collisions"] = hits
    # duplicate-ea-code: one EA code, one technique page. Only the technique pages' own
    # extra.ea_code counts; a card or page citing the code is about the technique, not another one.
    by_code = collections.defaultdict(set)
    for page in pages:
        if page["path"].startswith("kompendium/techniques/") and not page["is_index"]:
            code = str((page.get("extra") or {}).get("ea_code") or "").strip()
            if code:
                by_code[code].add(page["path"])
    for page in pages:
        code = str((page.get("extra") or {}).get("ea_code") or "").strip()
        others = sorted(by_code.get(code, set()) - {page["path"]})
        page["duplicate_ea_code"] = ((code, others) if others and page["path"] in by_code.get(code, set())
                                     else None)
    # duplicate-table: a table data row re-pasted byte-identical on DUP_PAGES+ pages (tables are
    # outside passage_blocks' reach). Same threshold and normalisation as the prose gate.
    tab_shared = {r: paths for r, paths in tables.items() if len(paths) >= DUP_PAGES}
    for page in pages:
        page["duplicate_tables"] = sorted(r for r, paths in tab_shared.items()
                                          if page["path"] in paths)
    # Only bold candidates become worklist entries: they are pages the book still owes. A shared
    # figure is not a page to write but a line to delete, and `--list template-figure` names the
    # pages that carry it.
    return {f"bold:{k}": (len(v), shown[k]) for k, v in phrases.items()
            if len(v) >= BOLD_CANDIDATE_PAGES}


THRESHOLDS = detail_thresholds()  # zola.toml [extra]: ia_detail_words, _index, _qr


def min_words(page: dict) -> int:
    if page["path"].startswith("kompendium/quick-reference/"):
        return THRESHOLDS["qr"]
    return THRESHOLDS["index"] if page["is_index"] else THRESHOLDS["page"]


def weak(page: dict) -> bool:
    surface = bool(page["template"]) and not page["is_index"]
    return (not surface and page["words"] < min_words(page)) or page["generated"]


# A quick-reference card summarises one technique page and links it as "**Plná stránka:**". The
# apparatus belongs to that page: it carries the citations, the bibliography and the
# citation-unresolved check. Asking the card to cite the same works again would duplicate its
# parent's credibility in a ten-line summary — the borrowed credibility this book spent a wave
# removing from 75 other pages.
#
# So the exemption is keyed on the RELATION, not on the directory, and it cannot outlive its
# reason: a card is cleared only while it links a technique page that exists. Drop the link, or
# break it, and the card is charged again. Three consequences of that choice, each deliberate:
#   * quick-reference/_index.md is NOT a card and is not cleared. It is prose (13 uncited
#     paragraphs, where a card has 3 to 5), and it owes citations like any other prose page.
#   * the five cards that do carry a ## Literatura keep it and are cleared too; a bibliography a
#     writer chose to add is not a reason to charge the page.
#   * the method-page exemption (OWN_FRAME, capped at 3) could not have done this job: 119 of the
#     123 cards carry 4 or more uncited paragraphs, so adding a method link to every card would
#     have left 119 charged. Measured before this rule was written.
CARD_PARENT = re.compile(r"\*\*Plná stránka:\*\*\s*\[[^\]]*\]\(@/(kompendium/techniques/[^)#]+\.md)")


# This takes two passes and the order is forced. The decision needs each page's `body`, which
# analyse() empties; the number it adjusts is `uncited`, which analyse() COMPUTES and which a
# freshly loaded page does not carry at all. Zeroing it before analyse() therefore created a key
# that analyse() then overwrote — the exemption fired on all 123 cards and changed nothing, which
# is why the identification and the clearing are separate functions with analyse() between them.
def card_parents_resolve(pages: list) -> set:
    """The quick-reference cards that link a technique page which exists. Reads the bodies."""
    known = {p["path"] for p in pages}
    found = set()
    for page in pages:
        path = page["path"]
        if not path.startswith("kompendium/quick-reference/") or page["is_index"]:
            continue
        m = CARD_PARENT.search(page.get("body") or "")
        if m and m.group(1) in known:
            found.add(path)
    return found


def clear_card_citations(pages: list, exempt: set) -> None:
    """Zero `uncited` on those cards. Needs the counts, so it runs after analyse()."""
    for page in pages:
        if page["path"] in exempt:
            page["uncited"] = 0


def current(details: dict = None, counts: dict = None) -> dict:
    result = {}
    pages = load_pages(with_body=True)
    cards = card_parents_resolve(pages)   # while the bodies are still there
    candidates = analyse(pages)
    clear_card_citations(pages, cards)    # once analyse() has produced the counts
    weak_pages = {p["path"] for p in pages if weak(p)}
    for page in pages:
        key = f"content/{page['path']}"
        if key in EXEMPT:
            continue
        found = violations(page)
        if page["path"] in weak_pages and page["links_in"]:
            found.append("weak-link")
        if (page["path"].startswith("glossary/") and not page["is_index"]
                and not page["has_definition"]):
            found.append("summary")
        if found:
            result[key] = found
            for rule in found:
                if rule in COUNT_BEARING and counts is not None:
                    counts[(key, rule)] = rule_count(page, rule)
            if details is not None:
                notes = explain(page)
                for rule in found:
                    if notes.get(rule):
                        details[(key, rule)] = notes[rule]
    for term in load_terms(pages):
        if term["page"] is None:
            result[f"term:{term['slug']}"] = ["term-page"]
    for key, (count, phrase) in candidates.items():
        result.setdefault(key, []).append("bold-candidate")
        if details is not None:
            details[(key, "bold-candidate")] = f"{count} pages\t{phrase}"
    return result


def write_baseline(baseline: dict) -> None:
    # Canonical order, pages AND each page's rules: the rule list used to keep whatever order the
    # writing run found it in, so two runs over one tree wrote different files and every lane paid
    # a merge conflict on this file at every merge (2026-11-15, four times on one branch).
    kept = {p: sorted(r) for p, r in baseline.items() if r}
    BASELINE.write_text(json.dumps(kept, ensure_ascii=False, indent=1, sort_keys=True) + "\n",
                        encoding="utf-8")


def list_rows(now: dict, details: dict, rule: str) -> list:
    """(path, note) rows for one requirement, in that requirement's display order.

    The single producer shared by ``--list <rule>`` and ``--list-all``, so the two can never
    drift: ``--list X`` equals ``--list-all | awk -F'\t' '$1=="X"' | cut -f2-`` for every rule."""
    rows = [(path, details.get((path, rule))) for path, rules in now.items() if rule in rules]
    if rule == "bold-candidate":  # the worklist, most widespread phrase first
        rows.sort(key=lambda r: (-int(r[1].split()[0]), r[0]))
    else:
        rows.sort()
    return rows


def main() -> int:
    args = sys.argv[1:]
    if "--debt" in args:
        pages = load_pages()
        thin = [p for p in pages if weak(p) and p["links_in"]
                and f"content/{p['path']}" not in EXEMPT]
        for page in sorted(thin, key=lambda p: (-p["links_in"], p["path"])):
            print(f"{page['links_in']}\tcontent/{page['path']}")
        return 0
    details = {}
    now_counts = {}
    now = current(details, now_counts)
    if "--list" in args:
        rule = args[args.index("--list") + 1]
        for path, note in list_rows(now, details, rule):
            print(f"{path}\t{note}" if note else path)
        return 0
    if "--list-all" in args:
        # Every finding once as rule<TAB>page<TAB>detail, sorted, baselined rules included.
        # A listing, not a verdict, so always exit 0. By construction (same producer, `rule\t`
        # prefix only) `--list X` == `--list-all | awk -F'\t' '$1=="X"' | cut -f2-` for every rule,
        # which lets a test harness compute every rule's pages from one check-ia run.
        for rule in sorted({r for rules in now.values() for r in rules}):
            for path, note in list_rows(now, details, rule):
                print(f"{rule}\t{path}\t{note}" if note else f"{rule}\t{path}")
        return 0
    baseline = json.loads(BASELINE.read_text(encoding="utf-8")) if BASELINE.exists() else {}
    for entries in baseline.values():  # a hand-edited baseline cannot excuse these
        entries[:] = [e for e in entries if base_split(e)[0] not in NEVER_BASELINED]
    counts = collections.Counter(r for rules in now.values() for r in rules)
    fresh = {}
    for p, rules in now.items():
        base_entries = baseline.get(p, [])
        bnames = base_rules(base_entries)
        page_fresh = []
        for r in rules:
            if r in PENDING_ZERO:
                continue
            if r in COUNT_BEARING:
                bc = base_count(base_entries, r)
                cur = now_counts.get((p, r), 0)
                if bc is _MISSING:
                    page_fresh.append(r)                     # a newly failing page
                elif isinstance(bc, int) and cur > bc:
                    page_fresh.append(f"{r} ({bc}->{cur})")  # the count grew on a baselined page
            elif r not in bnames:
                page_fresh.append(r)
        if page_fresh:
            fresh[p] = page_fresh
    pending = {r: sorted(p for p, rules in now.items() if r in rules) for r in PENDING_ZERO}
    grown = {r: paths for r, paths in pending.items() if len(paths) > PENDING_ZERO[r]}

    for flag in ("--introduce", "--extend"):
        if flag in args and args[args.index(flag) + 1] in NEVER_BASELINED:
            print(f"check-ia: '{args[args.index(flag) + 1]}' is never accepted into the baseline; "
                  "fix the pages")
            return 1

    if "--introduce" in args:
        rule = args[args.index("--introduce") + 1]
        if any(rule in base_rules(rules) for rules in baseline.values()):
            print(f"check-ia: '{rule}' is already in the baseline; it can only shrink now")
            return 1
        added = 0
        for path, rules in now.items():
            if rule in rules:
                baseline.setdefault(path, []).append(stamp(path, rule, now_counts))
                added += 1
        write_baseline(baseline)
        print(f"check-ia: introduced '{rule}' with {added} violation(s) in the baseline")
        return 0

    if "--extend" in args:
        rule = args[args.index("--extend") + 1]
        if not any(rule in base_rules(rules) for rules in baseline.values()):
            print(f"check-ia: '{rule}' is not in the baseline; use --introduce for a new rule")
            return 1
        added = 0
        for path, rules in now.items():
            if rule in rules and rule not in base_rules(baseline.get(path, [])):
                baseline.setdefault(path, []).append(stamp(path, rule, now_counts))
                added += 1
        write_baseline(baseline)
        print(f"check-ia: extended '{rule}' by {added} violation(s) after a raised threshold")
        return 0

    if "--update-baseline" in args:
        if (fresh or grown) and BASELINE.exists():
            print(f"check-ia: refusing to grow the baseline: {len(fresh)} page(s) have new "
                  "violations; fix them first")
            return 1
        if BASELINE.exists():
            shrunk = {p: [stamp(p, n, now_counts) for n in base_rules(entries) if n in now.get(p, [])]
                      for p, entries in baseline.items()}
            shrunk = {p: r for p, r in shrunk.items() if r}
        else:
            shrunk = {p: [stamp(p, r, now_counts) for r in rules] for p, rules in now.items()}
        write_baseline(shrunk)
        before = sum(len(r) for r in baseline.values())
        after = sum(len(r) for r in shrunk.values())
        print(f"check-ia: baseline {before} -> {after} violation(s)")
        return 0

    total = sum(counts.values())
    print(f"check-ia: {total} violation(s) on {len(now)} page(s); "
          + ", ".join(f"{r} {n}" for r, n in counts.most_common()))
    fixed = sum(len(r) for r in baseline.values()) - sum(
        len([e for e in rules if base_split(e)[0] in now.get(p, [])]) for p, rules in baseline.items())
    if fixed:
        print(f"check-ia: {fixed} baseline violation(s) fixed; run --update-baseline to lock them in")
    for rule, paths in pending.items():
        if paths:
            print(f"check-ia: {rule} is never baselined and must reach 0: {len(paths)} page(s) "
                  f"(at most {PENDING_ZERO[rule]}): {', '.join(paths)}")
        if len(paths) < PENDING_ZERO[rule]:
            print(f"check-ia: lower PENDING_ZERO['{rule}'] to {len(paths)} in scripts/check-ia.py")
    if fresh or grown:
        new = sum(len(r) for r in fresh.values()) + sum(
            len(p) - PENDING_ZERO[r] for r, p in grown.items())
        print(f"check-ia: FAIL — {new} new violation(s):")
        for path, rules in sorted(fresh.items())[:60]:
            print(f"  {path}: {', '.join(rules)}")
        for rule, paths in grown.items():
            print(f"  {rule} grew to {len(paths)} page(s): {', '.join(paths)}")
        return 1
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except BrokenPipeError:  # the reader (head, grep -q) closed the pipe: not an error
        sys.stdout = open(__import__("os").devnull, "w")
        sys.exit(0)
