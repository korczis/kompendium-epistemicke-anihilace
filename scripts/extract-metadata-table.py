#!/usr/bin/env python3
"""Move the technique metadata table into one partial rendered from front matter (duplicate-table).

Every technique page opens with the same six-row table (EA kód, Kategorie, Subkategorie, Riziková
úroveň, Reverzibilita, Rodičovská kapitola). The first five rows are either already in [extra]
(ea_code, ea_subcategory) or derivable (Kategorie from data/ea-categories.toml by ea_category); the
Riziková úroveň and Reverzibilita cells are the technique's own assessment and MOVE verbatim into
two per-page keys, extra.ea_risk_text and extra.ea_reversibility_text. The five rows become
`{% include "partials/technique-meta.md" %}`; the header, the separator and the Rodičovská kapitola
row (a link, not charged) stay on the page. Mechanical move, no word of content changes.

A page is moved only when its table is exactly the six recognised rows in order, EA kód equals
`<ea_code>`, Subkategorie equals extra.ea_subcategory, and ea_category is a key of
data/ea-categories.toml. Any other shape — a missing row, an EA kód or Subkategorie cell that does
not match front matter, an ea_category the data file omits — is refused and reported, never guessed.

The Kategorie cell is the ONE row the move may change. Its rendered value is the canonical
chapter-title label from data/ea-categories.toml; on the pages where the owner's canonical label
(ADR 0017) differs from the page's source cell this is a deliberate editorial relabel. Every other
row stays byte-exact: before anything is written, ia_model.expand_includes(new body, new extra)
must equal the old body — with only that one cell swapped to canonical — byte for byte on every
page; if one fails, nothing is written.

  python3 scripts/extract-metadata-table.py           apply the move
  python3 scripts/extract-metadata-table.py --check   report only; exit 1 when a move is pending
"""
import pathlib
import re
import sys
import tomllib

ROOT = pathlib.Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "scripts"))
import ia_model as m  # noqa: E402

CONTENT = ROOT / "content"
TECHNIQUES = CONTENT / "kompendium" / "techniques"
CATEGORIES = ROOT / "data" / "ea-categories.toml"
INCLUDE_LINE = '{% include "partials/technique-meta.md" %}'
LABELS = ["EA kód", "Kategorie", "Subkategorie", "Riziková úroveň", "Reverzibilita",
          "Rodičovská kapitola"]
HEADER = "| Pole | Hodnota |"
ROW = re.compile(r"^\|\s*\*\*(?P<label>[^*|]+?)\*\*\s*\|\s*(?P<value>.*?)\s*\|\s*$")


def toml_str(s: str) -> str:
    return '"' + s.replace("\\", "\\\\").replace('"', '\\"') + '"'


def front_and_body(text: str):
    mo = m.TOML_FM.match(text)
    if not mo:
        return None, None, None
    return tomllib.loads(mo.group(1)), mo.group(1), text[mo.end():]


def find_table(body_lines: list):
    """(header index, list of (label, value, line index)) for the metadata table, or None."""
    for i, line in enumerate(body_lines):
        if line.strip() == HEADER and i + 1 < len(body_lines) and set(body_lines[i + 1].strip()) <= set("|-: "):
            rows, j = [], i + 2
            while j < len(body_lines):
                rm = ROW.match(body_lines[j])
                if not rm:
                    break
                rows.append((rm.group("label").strip(), rm.group("value").strip(), j))
                j += 1
            return i, rows
    return None, None


def plan():
    cats = tomllib.loads(CATEGORIES.read_text(encoding="utf-8"))
    moves, remaining = [], []
    for path in sorted(TECHNIQUES.glob("ea-*.md")):
        rel = path.relative_to(CONTENT).as_posix()
        text = path.read_text(encoding="utf-8")
        front, fm, body = front_and_body(text)
        if front is None:
            remaining.append((rel, "no TOML front matter"))
            continue
        extra = front.get("extra") if isinstance(front.get("extra"), dict) else {}
        lines = body.split("\n")
        hi, rows = find_table(lines)
        if hi is None:
            remaining.append((rel, "no metadata table"))
            continue
        if len(rows) < len(LABELS) or [lbl for lbl, _, _ in rows[:len(LABELS)]] != LABELS:
            remaining.append((rel, f"table rows do not open with the six expected ({[l for l, _, _ in rows]})"))
            continue
        cell = {lbl: val for lbl, val, _ in rows}
        ea_code, ea_sub, ea_cat = extra.get("ea_code", ""), extra.get("ea_subcategory", ""), extra.get("ea_category", "")
        if cell["EA kód"] != f"`{ea_code}`":
            remaining.append((rel, f"EA kód cell {cell['EA kód']!r} != `{ea_code}`"))
            continue
        if cell["Subkategorie"] != str(ea_sub):
            remaining.append((rel, "Subkategorie cell != extra.ea_subcategory"))
            continue
        if ea_cat not in cats:
            remaining.append((rel, f"ea_category {ea_cat!r} not a key of data/ea-categories.toml"))
            continue
        canonical = cats[ea_cat]
        # The Kategorie cell is the only row the move may change: where the page's source cell
        # differs from the canonical chapter-title label (ADR 0017), the render deliberately
        # replaces it. The proof compares the new body against the old body with only this one cell
        # swapped to canonical, so every other row is still held byte-exact.
        kat_changed = cell["Kategorie"] != canonical
        if kat_changed:
            old_lines = list(lines)
            old_lines[rows[1][2]] = f"| **Kategorie** | {canonical} |"
            old_proof = "\n".join(old_lines)
        else:
            old_proof = body
        # The five rows EA kód..Reverzibilita are contiguous (indices hi+2 .. hi+6); Rodičovská is hi+7.
        first = rows[0][2]
        last = rows[4][2]           # Reverzibilita row
        new_lines = lines[:first] + [INCLUDE_LINE] + lines[last + 1:]
        new_extra = dict(extra)
        new_extra["ea_risk_text"] = cell["Riziková úroveň"]
        new_extra["ea_reversibility_text"] = cell["Reverzibilita"]
        moves.append({"path": path, "rel": rel, "fm": fm, "old_body": body, "old_proof": old_proof,
                      "new_body": "\n".join(new_lines), "new_extra": new_extra, "kat_changed": kat_changed})
    return moves, remaining


def splice_front_matter(fm: str, risk: str, rev: str) -> str:
    """Add ea_risk_text and ea_reversibility_text right after ea_subcategory in [extra]."""
    lines = fm.split("\n")
    out, added = [], False
    for line in lines:
        out.append(line)
        if not added and re.match(r"\s*ea_subcategory\s*=", line):
            out.append(f"ea_risk_text = {toml_str(risk)}")
            out.append(f"ea_reversibility_text = {toml_str(rev)}")
            added = True
    if not added:   # no ea_subcategory line: append under the existing [extra] is risky, so refuse
        return None
    return "\n".join(out)


def apply(moves: list):
    bad, written = [], []
    for mv in moves:
        # The old body may already carry other includes (shared passages); expand both sides so
        # the only difference under test is the metadata table becoming its include. old_proof is
        # the old body with the Kategorie cell already at canonical, so an ADR-0017 relabel is the
        # intended change and every other row must still match byte for byte.
        if (m.expand_includes(mv["new_body"], extra=mv["new_extra"])
                != m.expand_includes(mv["old_proof"], extra=mv["new_extra"])):
            bad.append(mv["rel"])
    if bad:
        sys.exit("extract-metadata-table: expansion does not reproduce "
                 f"{len(bad)} page(s), nothing written: {', '.join(sorted(bad)[:5])}")
    for mv in moves:
        new_fm = splice_front_matter(mv["fm"], mv["new_extra"]["ea_risk_text"],
                                     mv["new_extra"]["ea_reversibility_text"])
        if new_fm is None:
            sys.exit(f"extract-metadata-table: {mv['rel']} has no ea_subcategory line to anchor the new keys")
        mv["path"].write_text(f"+++\n{new_fm}\n+++\n{mv['new_body']}", encoding="utf-8")
        written.append(mv["rel"])
    return written


def main():
    check = "--check" in sys.argv
    moves, remaining = plan()
    relabel = sum(1 for mv in moves if mv["kat_changed"])
    print(f"extract-metadata-table: {len(moves)} page(s) to move into partials/technique-meta.md "
          f"({relabel} relabel the Kategorie cell to the ADR-0017 canonical); {len(remaining)} refused")
    for rel, why in remaining[:12]:
        print(f"  refused  {rel}: {why}")
    if len(remaining) > 12:
        print(f"  … and {len(remaining) - 12} more refused")
    if check:
        sys.exit(1 if moves else 0)
    if moves:
        written = apply(moves)
        print(f"extract-metadata-table: moved {len(written)} page(s); {len(written) - relabel} expand "
              f"back byte for byte, {relabel} also relabel the Kategorie cell to the ADR-0017 canonical")


if __name__ == "__main__":
    main()
