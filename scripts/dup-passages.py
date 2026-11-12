#!/usr/bin/env python3
"""The writing worklist for the `duplicate-passage` requirement: every prose paragraph re-pasted
byte-identical (whitespace-normalised) on 3+ content/kompendium pages, each listed with the pages
that carry it, most widespread first — so a writer fixes a block across all its pages at once.

Reuses check-ia's own passage_blocks, so the worklist matches exactly what the gate charges.
Read-only; run from the repo root:  python3 scripts/dup-passages.py [--full]
--full prints the whole normalised block and the complete page list; the default is a summary.
"""
import collections
import importlib.util
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "scripts"))
import ia_model as m  # noqa: E402
spec = importlib.util.spec_from_file_location("check_ia", ROOT / "scripts" / "check-ia.py")
cia = importlib.util.module_from_spec(spec)
spec.loader.exec_module(cia)


def groups():
    passages = collections.defaultdict(set)
    for p in m.load_pages(with_body=True):
        if not p["path"].startswith("kompendium/"):
            continue
        for b in cia.passage_blocks(m.FENCE.sub("", p["body"])):
            passages[b].add(p["path"])
    return {b: sorted(ps) for b, ps in passages.items() if len(ps) >= cia.DUP_PAGES}


def main():
    full = "--full" in sys.argv
    g = groups()
    pages = {p for ps in g.values() for p in ps}
    print(f"duplicate-passage: {len(g)} blocks on {len(pages)} pages "
          f"({sum(len(ps) for ps in g.values())} instances)")
    for b, ps in sorted(g.items(), key=lambda kv: (-len(kv[1]), kv[0])):
        secs = collections.Counter(p.split("/")[1] for p in ps)
        head = b if full else (b[:100] + ("…" if len(b) > 100 else ""))
        print(f"\n{len(ps):>3} pages [{', '.join(f'{s}:{n}' for s, n in secs.most_common())}]  {head}")
        if full:
            for p in ps:
                print(f"       {p}")


if __name__ == "__main__":
    main()
