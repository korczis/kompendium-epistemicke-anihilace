#!/usr/bin/env python3
"""Rank the `detail`-failing pages by how many words short of their threshold they are — the
writing worklist for closing the `detail` requirement (and `weak-link`, which charges the same
thin pages as link targets: the two lists are identical, so growing a page past its threshold
clears both). Thresholds come from zola.toml [extra] via check-ia (1100 words a page, 600 a
section index, 250 a quick-reference card); a page with its own template is exempt.

Reuses check-ia's own word metric so the gap matches exactly what the gate sees. Prints a
per-lane split (glossary vs the rest) and a gap-bucket summary. Read-only; run from the repo root:
    python3 scripts/detail-gap.py
"""
import importlib.util
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "scripts"))
spec = importlib.util.spec_from_file_location("check_ia", ROOT / "scripts" / "check-ia.py")
cia = importlib.util.module_from_spec(spec)
spec.loader.exec_module(cia)


def rows():
    pages = cia.load_pages(with_body=True)
    cia.analyse(pages)
    out = []
    for p in pages:
        if "detail" in cia.violations(p):
            mw = cia.min_words(p)
            kind = "generated" if p.get("generated") else ("index" if p["is_index"] else "page")
            out.append((mw - p.get("words", 0), p.get("words", 0), mw, kind, p["path"]))
    out.sort(reverse=True)
    return out


def main():
    data = rows()
    total = sum(max(0, g) for g, *_ in data)
    glossary = [r for r in data if r[4].startswith("glossary/")]
    rest = [r for r in data if not r[4].startswith("glossary/")]
    print(f"detail/weak-link: {len(data)} pages, {total} words to close "
          f"(glossary {len(glossary)}, other {len(rest)})")
    for g in ((0, 100), (101, 300), (301, 600), (601, 10 ** 9)):
        n = sum(1 for r in data if g[0] <= r[0] <= g[1])
        print(f"  gap {g[0]}-{g[1] if g[1] < 10**9 else '+'}: {n}")
    for title, group in (("glossary -> catalogue-2e", glossary),
                         ("techniques + other -> content lane", rest)):
        print(f"\n## {title} ({len(group)})")
        print(f"{'gap':>6} {'words':>6} {'thr':>5} {'kind':>9}  path")
        for g, w, mw, kind, path in group:
            print(f"{g:>6} {w:>6} {mw:>5} {kind:>9}  {path}")


if __name__ == "__main__":
    main()
