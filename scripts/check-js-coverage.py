#!/usr/bin/env python3
"""JS function coverage of the interactive-surfaces gate is a ratchet: no script loses coverage.

test/e2e/surfaces.cjs with COVERAGE_OUT=<file> writes the V8 coverage of every script under
static/js (vendor/ and *.min.js excluded), merged over every page of the run
(test/e2e/js-coverage.cjs). This gate compares it, file by file, with the committed baseline
test/js-coverage-baseline.json:

  - every script under static/js must be loaded by the surfaces run (some code of it ran); a
    script no scenario loads is untested, new or not;
  - a script whose source is the one the baseline measured (same SHA-256) may not cover fewer
    functions than the baseline records. V8 lists the inner functions of a function only once
    it has run, so a newly covered function can raise the count of functions as well; the
    covered count is the number that can only fall by losing a test;
  - a script whose source changed may not have a lower share of covered functions (pct) than
    the baseline records;
  - a script the baseline does not know yet only has to be loaded; --update records it.

--update rewrites the baseline from the measurement, and refuses (exit 1, the baseline left as
it was) while any finding above stands, so the baseline only moves up. Scripts that no longer
exist are dropped from it; the check names them as stale without failing.

Usage:
  scripts/check-js-coverage.py COVERAGE.json [--baseline FILE] [--root DIR]
  scripts/check-js-coverage.py COVERAGE.json --update [--baseline FILE] [--root DIR]

  --baseline  the baseline (default test/js-coverage-baseline.json under --root)
  --root      the tree whose static/js is judged (default the repository)

Exit: 0 pass (or baseline written), 1 findings (or update refused), 2 usage or unreadable input.
"""
import hashlib
import json
import math
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
SCHEMA = "kompendium-js-coverage-baseline/v1"


def usage(msg: str) -> int:
    print(f"check-js-coverage: {msg}; see --help", file=sys.stderr)
    return 2


def scripts(root: pathlib.Path) -> dict:
    """static/<rel> -> SHA-256 of every script the gate judges."""
    js = root / "static" / "js"
    out = {}
    for path in sorted(js.rglob("*.js")):
        rel = path.relative_to(js).as_posix()
        if rel.startswith("vendor/") or rel.endswith(".min.js"):
            continue
        out["static/js/" + rel] = hashlib.sha256(path.read_bytes()).hexdigest()
    return out


def pct(covered: int, total: int) -> float:
    """Share of covered functions, floored to 0.1 so a recorded value is never above the
    measurement it came from."""
    return 100.0 if not total else math.floor(1000 * covered / total) / 10


def judge(cov: dict, base: dict, disk: dict):
    findings, notes = [], []
    for rel, sha in disk.items():
        row = cov.get(rel)
        if not row or not row.get("coveredBytes"):
            findings.append(f"{rel}: not loaded by the surfaces run (no code of it ran); "
                            "give it a scenario in test/e2e/surfaces.cjs")
            continue
        fn, hit = row["functions"], row["coveredFunctions"]
        b = base.get(rel)
        if b is None:
            notes.append(f"{rel}: new, {hit}/{fn} functions; record it with --update")
        elif b["sha256"] == sha:
            if hit < b["covered"]:
                findings.append(f"{rel}: covers {hit} functions, the baseline {b['covered']} "
                                "(source unchanged)")
        elif pct(hit, fn) < b["pct"]:
            findings.append(f"{rel}: function coverage {pct(hit, fn)} % ({hit}/{fn}) is below "
                            f"the baseline {b['pct']} % (source changed)")
    for rel in sorted(set(base) - set(disk)):
        notes.append(f"{rel}: in the baseline but no longer under static/js; --update drops it")
    return findings, notes


def main() -> int:
    args = sys.argv[1:]
    if any(a in ("-h", "--help") for a in args):
        print(__doc__.strip())
        return 0
    update = False
    root = ROOT
    baseline = None
    positional = []
    i = 0
    while i < len(args):
        a = args[i]
        if a == "--update":
            update = True
        elif a in ("--baseline", "--root"):
            if i + 1 >= len(args):
                return usage(f"{a} needs a value")
            i += 1
            if a == "--root":
                root = pathlib.Path(args[i]).resolve()
            else:
                baseline = pathlib.Path(args[i])
        elif a.startswith("-"):
            return usage(f"unknown argument {a}")
        else:
            positional.append(a)
        i += 1
    if len(positional) != 1:
        return usage("give exactly one coverage file (COVERAGE_OUT of test/e2e/surfaces.cjs)")
    baseline = baseline or root / "test" / "js-coverage-baseline.json"
    try:
        cov = json.loads(pathlib.Path(positional[0]).read_text(encoding="utf-8"))["files"]
    except (OSError, ValueError, KeyError) as exc:
        return usage(f"cannot read coverage {positional[0]}: {exc}")
    base = {}
    if baseline.exists():
        try:
            data = json.loads(baseline.read_text(encoding="utf-8"))
            if data.get("schema") != SCHEMA:
                return usage(f"{baseline}: schema is not {SCHEMA}")
            base = data["files"]
        except (OSError, ValueError, KeyError) as exc:
            return usage(f"cannot read baseline {baseline}: {exc}")
    elif not update:
        return usage(f"no baseline {baseline}; create it with --update")
    disk = scripts(root)
    findings, notes = judge(cov, base, disk)
    for n in notes:
        print("note " + n)
    for f in findings:
        print("FAIL " + f)
    if findings:
        verb = "--update refused, baseline unchanged" if update else "coverage fell"
        print(f"check-js-coverage: {len(findings)} finding(s); {verb}", file=sys.stderr)
        return 1
    rows = {rel: {"sha256": sha, "functions": cov[rel]["functions"],
                  "covered": cov[rel]["coveredFunctions"],
                  "pct": pct(cov[rel]["coveredFunctions"], cov[rel]["functions"])}
            for rel, sha in disk.items()}
    fn = sum(r["functions"] for r in rows.values())
    hit = sum(r["covered"] for r in rows.values())
    if update:
        out = {"schema": SCHEMA,
               "about": "Per-file V8 function coverage of test/e2e/surfaces.cjs; written only by "
                        "scripts/check-js-coverage.py --update, which never lowers a file.",
               "total": {"files": len(rows), "functions": fn, "covered": hit, "pct": pct(hit, fn)},
               "files": rows}
        baseline.write_text(json.dumps(out, indent=1, sort_keys=False) + "\n", encoding="utf-8")
        print(f"check-js-coverage: baseline written ({len(rows)} files, {hit}/{fn} functions, "
              f"{pct(hit, fn)} %) -> {baseline}")
        return 0
    print(f"check-js-coverage: {len(rows)} files hold their baseline ({hit}/{fn} functions, "
          f"{pct(hit, fn)} %)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
