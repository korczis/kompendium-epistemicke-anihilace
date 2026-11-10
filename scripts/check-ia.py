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
                   08-prilohy/eticky-kodex, 02-uvod/metodologicke-poznamky) and no other page
  bibliography     a page that cites an author has `## Literatura`, before `## Související`
  citation-unresolved  every cited surname is in the page's Literatura (Czech case endings and
                   female -ová forms resolve: Liftona -> Lifton, Arendtová -> Arendt)
  drug-dose        no medical dosing: a drug dose or dose range (N mg, N–M mg, mg/den, µg, IU …)
                   in prose outside code and bibliographies. A public book must not recommend
                   doses (same as the emergency protocols). NEVER baselined
  howto            no operational playbook: a page carries no "Operační modus/postup/sekvence"
                   section (steps or phases for performing a technique on a person); the
                   defensive frame describes recognition and defence, not execution. NEVER
                   baselined; a "z hlediska supervize" reframing is a playbook too
  technique-name   a heading that opens with a code ("#### EA-5.2.29 Name") names the technique
                   that the catalogue page with that code names (its title without the code):
                   a chapter must not describe a different technique under a catalogue code
  technique-page   every EA-X.Y.Z code the page names has its own technique page; NEVER
                   baselined
  bold-term        a **bold** span that names a glossary entry (title, title without the
                   parenthesis, the alias in it, extra.aliases, slug) is a link: it charges a
                   MISSING link only, never a link to a thin page (labels, table header rows and
                   first cells, Související, Literatura, key sentences over 6 words and the
                   entry's own page exempt); `link-terms.py --bold` fixes it
  bold-candidate   a worklist keyed bold:<slug>: a bold phrase of up to 6 words on 3+ pages that
                   is not a term, a label or a link needs its own glossary page; when the page
                   exists, the phrase leaves the list and bold-term enforces it
  template-figure  a technique page carries no numeric table row or list item that stands
                   byte-identical on 3+ technique pages. Data measured for one technique is
                   never identical to another's, so an identical figure is machine template
                   filler: effect sizes, n, NNT, instrument cut-offs, session counts, detection
                   thresholds and recovery horizons were all pasted across unrelated techniques
                   (ADR 0006). A figure a page edits for itself leaves the group and passes.
                   NEVER baselined; the worklist is keyed figure:<n>

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

sys.dont_write_bytecode = True  # no __pycache__ in the checkout
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
from ia_model import (ROOT, EA_ONLY, academic_profile, body_lines, bold_spans,  # noqa: E402
                      bold_term_index, FENCE, figure_lines, TEMPLATE_FIGURE_PAGES,
                      detail_thresholds, ea_mentions, load_pages, load_terms,
                      placeholder_markers, slugify, technique_codes)

BASELINE = ROOT / "scripts" / "ia-baseline.json"
EXEMPT = {"content/references.md"}  # generated by scripts/build-references.py
# An unfinished page or a technique without a page is never an accepted state: these
# requirements cannot be introduced into, extended in or hand-written into the baseline.
NEVER_BASELINED = {"placeholder", "technique-page", "howto", "drug-dose", "template-figure"}
# When a never-baselined requirement was introduced, these pages already failed it (listed by
# `--list <rule>`); they are fixed in content, not accepted. Until then the gate fails only when
# the count grows. The number may only go down, and the entry goes when it reaches 0.
PENDING_ZERO = {"placeholder": 0, "technique-page": 5, "howto": 0, "drug-dose": 0,
                "template-figure": 163}  # at 0 a rule stays: never baselined
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
    if page.get("misnamed_techniques"):
        found.append("technique-name")
    if page["bold_unlinked"]:
        found.append("bold-term")
    if page.get("template_figures"):
        found.append("template-figure")
    return found


def explain(page: dict) -> dict:
    """What `--list <rule>` prints after the page, for the requirements that name a detail."""
    return {
        "placeholder": ", ".join(page["placeholders"]),
        "bullets": f"{len(page['bullets'])} item(s), first: {page['bullets'][0]}"
        if page["bullets"] else "",
        "citations": f"{page['uncited']} paragraph(s) without a citation",
        "citation-unresolved": ", ".join(page["unresolved"]),
        "technique-page": ", ".join("EA-" + c for c in page["missing_techniques"]),
        "technique-name": "; ".join(f"EA-{c} \"{h}\" is \"{t}\" in the catalogue"
                                    for c, h, t in page.get("misnamed_techniques", [])),
        "bold-term": ", ".join(sorted({t for t, _ in page["bold_unlinked"]})),
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
# A drug dose or dose range: a number and a dose unit. A bibliography (a work's title, e.g.
# "Mediator 150 mg") is skipped by section, so only a dosing claim in prose is caught.
DRUG_DOSE = re.compile(r"\d[\d.,]*\s*(?:[–-]|až)?\s*\d*\s*(?:mg|µg|μg|mcg|IU)\b", re.I)
BIBLIO_HEADING = re.compile(r"^#{1,3}\s+(?:Literatura|Bibliografie|Reference|Zdroje|Prameny)\b", re.I)
TITLE_CODE = re.compile(r"^\s*EA-\d+\.\d+\.\d+\s*[—–:.-]?\s*")


def name_key(text: str) -> str:
    """A comparable form of a technique name: link text kept, markup, case, diacritics and
    punctuation dropped."""
    text = re.sub(r"\[([^\]]*)\]\([^)]*\)", r"\1", text)
    return " ".join(slugify(text).split("-"))


def catalogue_titles(pages: list) -> dict:
    """Code X.Y.Z -> the names its technique pages give it (title without the code)."""
    names = collections.defaultdict(set)
    for page in pages:
        m = re.match(r"kompendium/techniques/ea-(\d+)-(\d+)-(\d+)", page["path"])
        if m and not page["is_index"]:
            names[".".join(m.groups())].add(name_key(TITLE_CODE.sub("", page["title"])))
    return names


def misnamed_headings(body: str, catalogue: dict) -> list:
    """(code, heading name, catalogue name) for each coded heading whose name is neither the
    catalogue's name nor contains it nor is contained in it."""
    found, in_code = [], False
    for line in body.split("\n"):
        if re.match(r"^\s*(```|~~~)", line):
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


def has_drug_dose(prose: str) -> bool:
    """A dose/range in prose outside bibliography sections (a work's title is not a dosing claim)."""
    in_biblio = False
    for line in prose.split("\n"):
        if re.match(r"^#{1,6}\s", line):
            in_biblio = bool(BIBLIO_HEADING.match(line))
        if not in_biblio and DRUG_DOSE.search(line):
            return True
    return False


def analyse(pages: list) -> dict:
    """Attach the text analyses to each page, among them `template_figures`; return the
    bold-candidate worklist {"bold:<slug>": (pages, phrase)}."""
    terms = bold_term_index(pages)
    codes = technique_codes(pages)
    catalogue = catalogue_titles(pages)
    phrases = collections.defaultdict(set)
    shown = {}
    figures = collections.defaultdict(set)
    for page in pages:
        body = page.pop("body")
        lines = list(body_lines(body))
        page.update(academic_profile(body, lines))
        page["placeholders"] = placeholder_markers(body, page["extra"])
        page["missing_techniques"] = [c for c in ea_mentions(body) if c not in codes]
        page["misnamed_techniques"] = [] if page["path"].startswith("kompendium/techniques/") \
            else misnamed_headings(body, catalogue)
        prose = FENCE.sub("", body)
        technique = page["path"].startswith("kompendium/techniques/")
        page["howto"] = bool(HOWTO_HEADING.search(prose) or HOWTO_APPLIER.search(prose)
                             or (technique and HOWTO_STEP.search(prose)))
        page["drug_dose"] = has_drug_dose(prose)
        for line in figure_lines(prose) if technique else ():
            figures[line].add(page["path"])
        page["bold_unlinked"] = []
        for _, _, text, linked in bold_spans(body, lines):
            if linked:
                continue
            key = slugify(text)
            target = terms.get(key)
            if target:
                if target != page["path"]:
                    page["bold_unlinked"].append((text, target))
            elif re.search(r"[^\W\d_]", text) and not EA_ONLY.match(key):
                phrases[key].add(page["path"])
                shown.setdefault(key, text)
    shared = {line: paths for line, paths in figures.items()
              if len(paths) >= TEMPLATE_FIGURE_PAGES}
    for page in pages:
        page["template_figures"] = sorted(line for line, paths in shared.items()
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


def current(details: dict = None) -> dict:
    result = {}
    pages = load_pages(with_body=True)
    candidates = analyse(pages)
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
    kept = {p: r for p, r in baseline.items() if r}
    BASELINE.write_text(json.dumps(kept, ensure_ascii=False, indent=1, sort_keys=True) + "\n",
                        encoding="utf-8")


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
    now = current(details)
    if "--list" in args:
        rule = args[args.index("--list") + 1]
        rows = [(path, details.get((path, rule))) for path, rules in now.items() if rule in rules]
        if rule == "bold-candidate":  # the worklist, most widespread phrase first
            rows.sort(key=lambda r: (-int(r[1].split()[0]), r[0]))
        else:
            rows.sort()
        for path, note in rows:
            print(f"{path}\t{note}" if note else path)
        return 0
    baseline = json.loads(BASELINE.read_text(encoding="utf-8")) if BASELINE.exists() else {}
    for rules in baseline.values():  # a hand-edited baseline cannot excuse these
        rules[:] = [r for r in rules if r not in NEVER_BASELINED]
    counts = collections.Counter(r for rules in now.values() for r in rules)
    fresh = {p: [r for r in rules if r not in baseline.get(p, []) and r not in PENDING_ZERO]
             for p, rules in now.items()}
    fresh = {p: r for p, r in fresh.items() if r}
    pending = {r: sorted(p for p, rules in now.items() if r in rules) for r in PENDING_ZERO}
    grown = {r: paths for r, paths in pending.items() if len(paths) > PENDING_ZERO[r]}

    for flag in ("--introduce", "--extend"):
        if flag in args and args[args.index(flag) + 1] in NEVER_BASELINED:
            print(f"check-ia: '{args[args.index(flag) + 1]}' is never accepted into the baseline; "
                  "fix the pages")
            return 1

    if "--introduce" in args:
        rule = args[args.index("--introduce") + 1]
        if any(rule in rules for rules in baseline.values()):
            print(f"check-ia: '{rule}' is already in the baseline; it can only shrink now")
            return 1
        added = 0
        for path, rules in now.items():
            if rule in rules:
                baseline.setdefault(path, []).append(rule)
                added += 1
        write_baseline(baseline)
        print(f"check-ia: introduced '{rule}' with {added} violation(s) in the baseline")
        return 0

    if "--extend" in args:
        rule = args[args.index("--extend") + 1]
        if not any(rule in rules for rules in baseline.values()):
            print(f"check-ia: '{rule}' is not in the baseline; use --introduce for a new rule")
            return 1
        added = 0
        for path, rules in now.items():
            if rule in rules and rule not in baseline.get(path, []):
                baseline.setdefault(path, []).append(rule)
                added += 1
        write_baseline(baseline)
        print(f"check-ia: extended '{rule}' by {added} violation(s) after a raised threshold")
        return 0

    if "--update-baseline" in args:
        if (fresh or grown) and BASELINE.exists():
            print(f"check-ia: refusing to grow the baseline: {len(fresh)} page(s) have new "
                  "violations; fix them first")
            return 1
        shrunk = {p: [r for r in rules if r in now.get(p, [])] for p, rules in baseline.items()}
        shrunk = {p: r for p, r in shrunk.items() if r} if BASELINE.exists() else now
        write_baseline(shrunk)
        before = sum(len(r) for r in baseline.values())
        after = sum(len(r) for r in shrunk.values())
        print(f"check-ia: baseline {before} -> {after} violation(s)")
        return 0

    total = sum(counts.values())
    print(f"check-ia: {total} violation(s) on {len(now)} page(s); "
          + ", ".join(f"{r} {n}" for r, n in counts.most_common()))
    fixed = sum(len(r) for r in baseline.values()) - sum(
        len([x for x in rules if x in now.get(p, [])]) for p, rules in baseline.items())
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
