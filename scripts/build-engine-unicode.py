#!/usr/bin/env python3
"""Derive the Unicode tables of the wasm engine (crates/kompendium-engine/src/tables.rs).

The contract kompendium-engine/v1 folds text with NFKD, drops combining marks (M*), lower cases
and splits words on letters and digits (L*, N*). The reference scripts/engine.py takes all of
that from Python's unicodedata and str.lower; the Rust crate has no Unicode library (serde and
serde_json only), so this script writes the same knowledge out as tables, from the same Python:

  FOLD        code point -> NFKD without marks, where that differs from the code point itself
              (a mark folds to nothing and a Hangul syllable to its jamo by rule, neither listed)
  LOWER       code point -> str.lower, where it differs (U+03A3 has its own rule, Final_Sigma)
  MARK, WORD  General_Category M* and L*|N*, as code point ranges
  CASED, CASE_IGNORABLE
              the two properties str.lower reads for Final_Sigma; unicodedata does not expose
              them, so they are probed through str.lower itself (see probe())

Canonical reordering is not needed: every code point with a nonzero combining class is a mark,
which the fold drops (asserted below).

  python3 scripts/build-engine-unicode.py          write the tables
  python3 scripts/build-engine-unicode.py --check  exit 1 when the committed tables differ
                                                   (only meaningful on the recorded Unicode
                                                   version; another one is reported, exit 0)
"""
import argparse
import pathlib
import sys
import unicodedata

ROOT = pathlib.Path(__file__).resolve().parent.parent
OUT = ROOT / "crates" / "kompendium-engine" / "src" / "tables.rs"
SIGMA = 0x3A3
HANGUL = range(0xAC00, 0xD7A4)


def code_points():
    return (cp for cp in range(0x110000) if not 0xD800 <= cp < 0xE000)


def is_mark(c):
    return unicodedata.category(c).startswith("M")


def fold(c):
    return "".join(x for x in unicodedata.normalize("NFKD", c) if not is_mark(x))


def probe(c):
    """(cased, case_ignorable) of c, as str.lower's Final_Sigma rule sees them.

    The rule: U+03A3 is final when a cased letter precedes it (case-ignorable ones skipped) and
    none follows. So, with a cased "a":
      "a" + c + "Σ" is final  iff  c is ignorable, or c is cased;
      "aΣ" + c      is final  iff  c is ignorable, or c is not cased;
      c + "Σ"       is final  iff  c is cased and not ignorable.
    The first two together give ignorability; the third gives casedness of the non-ignorable
    code points, the only ones whose casedness the rule ever reads.
    """
    final = "ς"
    a = ("a" + c + "Σ").lower()[-1] == final
    b = ("aΣ" + c).lower()[1] == final
    ignorable = a and b
    cased = (not ignorable) and (c + "Σ").lower()[-1] == final
    return cased, ignorable


def ranges(pred):
    out, start, prev = [], None, None
    for cp in code_points():
        if pred(cp):
            if start is None or cp != prev + 1:
                if start is not None:
                    out.append((start, prev))
                start = cp
            prev = cp
    if start is not None:
        out.append((start, prev))
    return out


def rust_str(s):
    return "".join(c if 0x20 <= ord(c) < 0x7F and c not in '"\\' else f"\\u{{{ord(c):x}}}"
                   for c in s)


def string_lines(text, width=100):
    """A long string as lines of a concat!(...) of literals, each line within width."""
    lines, line = [], ""
    for c in text:
        piece = rust_str(c)
        if len(line) + len(piece) > width - 7:
            lines.append(f'    "{line}",')
            line = ""
        line += piece
    if line:
        lines.append(f'    "{line}",')
    return "\n".join(lines)


def wrap(items, indent="    ", width=100):
    lines, line = [], indent
    for item in items:
        piece = item + ", "
        if len(line) + len(piece.rstrip()) > width:
            lines.append(line.rstrip())
            line = indent
        line += piece
    if line.strip():
        lines.append(line.rstrip())
    return "\n".join(lines)


def table_ranges(name, doc, rs):
    body = wrap([f"(0x{a:x}, 0x{b:x})" for a, b in rs])
    return f"/// {doc}\npub static {name}: &[(u32, u32)] = &[\n{body}\n];\n"


def render():
    for cp in code_points():
        c = chr(cp)
        assert not unicodedata.combining(c) or is_mark(c), f"U+{cp:04X}: ccc>0 but not M*"
    folds, lowers, lower_multi = [], [], []
    cased, ignorable = set(), set()
    for cp in code_points():
        c = chr(cp)
        default = "" if is_mark(c) else c
        if cp not in HANGUL:
            f = fold(c)
            if f != default:
                folds.append((cp, f))
        else:
            assert fold(c) == unicodedata.normalize("NFKD", c)
        low = c.lower()
        if low != c and cp != SIGMA:
            (lowers if len(low) == 1 else lower_multi).append((cp, low))
        is_cased, is_ignorable = probe(c)
        if is_cased:
            cased.add(cp)
        if is_ignorable:
            ignorable.add(cp)
    data = "".join(f for _, f in folds)
    offsets, at = [0], 0
    for _, f in folds:
        at += len(f.encode("utf-8"))  # byte offsets: the Rust side slices FOLD_DATA
        offsets.append(at)
    assert at < 65536
    parts = [
        "// Generated by scripts/build-engine-unicode.py from Python's unicodedata "
        f"{unicodedata.unidata_version}.\n// Do not edit; regenerate with "
        "`python3 scripts/build-engine-unicode.py`.\n",
        f'pub const UNICODE_VERSION: &str = "{unicodedata.unidata_version}";\n',
        table_ranges("MARK", "General_Category M*: dropped by the fold.",
                     ranges(lambda cp: is_mark(chr(cp)))),
        table_ranges("WORD", "General_Category L* or N*: the characters of a word.",
                     ranges(lambda cp: unicodedata.category(chr(cp))[0] in "LN")),
        table_ranges("CASED", "Cased, as str.lower's Final_Sigma reads it.",
                     ranges(lambda cp: cp in cased)),
        table_ranges("CASE_IGNORABLE", "Case_Ignorable, as str.lower's Final_Sigma reads it.",
                     ranges(lambda cp: cp in ignorable)),
        "/// Code points whose fold (NFKD without marks) is not the code point itself, ascending.\n"
        "pub static FOLD_KEYS: &[u32] = &[\n" + wrap(f"0x{cp:x}" for cp, _ in folds) + "\n];\n",
        "/// FOLD_DATA[FOLD_OFFSETS[i]..FOLD_OFFSETS[i + 1]] (bytes) is the fold of FOLD_KEYS[i].\n"
        "pub static FOLD_OFFSETS: &[u16] = &[\n" + wrap(str(o) for o in offsets) + "\n];\n",
        "pub static FOLD_DATA: &str = concat!(\n" + string_lines(data) + "\n);\n",
        "/// Single code point lower case mappings (str.lower), ascending; U+03A3 excluded.\n"
        "pub static LOWER: &[(u32, u32)] = &[\n"
        + wrap(f"(0x{cp:x}, 0x{ord(low):x})" for cp, low in lowers) + "\n];\n",
        "/// Lower case mappings to more than one code point.\n"
        "pub static LOWER_MULTI: &[(u32, &str)] = &[\n"
        + wrap(f'(0x{cp:x}, "{rust_str(low)}")' for cp, low in lower_multi) + "\n];\n",
    ]
    return "\n".join(parts)


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("--check", action="store_true", help="fail when the tables are stale")
    args = ap.parse_args()
    if args.check:
        committed = OUT.read_text(encoding="utf-8") if OUT.exists() else ""
        recorded = next((ln.split('"')[1] for ln in committed.splitlines()
                         if ln.startswith("pub const UNICODE_VERSION")), None)
        if recorded and recorded != unicodedata.unidata_version:
            print(f"build-engine-unicode: tables are Unicode {recorded}, this Python has "
                  f"{unicodedata.unidata_version}; not compared")
            return 0
        if committed != render():
            print(f"build-engine-unicode: {OUT.relative_to(ROOT)} is stale; "
                  "run python3 scripts/build-engine-unicode.py")
            return 1
        print("build-engine-unicode: tables are current")
        return 0
    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text(render(), encoding="utf-8")
    print(f"build-engine-unicode: wrote {OUT.relative_to(ROOT)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
