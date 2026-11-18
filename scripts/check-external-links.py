#!/usr/bin/env python3
"""Checks the distinct external links of a built site; fails only on links that are gone.

Zola refuses a broken internal link at build time, but an external page can disappear without
any commit here: on 2026-11-17, 32 links of the book pointed at two pages that answered 404
(the platform-era copy of chapter 1 and a promotional site). This script is the scheduled
check (.github/workflows/external-links.yml) for that drift.

It reads every `href="http(s)://…"` of the built HTML, leaves out the site's own `base_url`
(internal pages, checked by zola), drops the fragment, and requests each distinct URL once,
with bounded concurrency and a timeout. HEAD first; a URL that does not answer 2xx/3xx to HEAD
is asked again with GET, so a verdict never rests on a server that mishandles HEAD.

Verdicts:
  404, 410                      gone: reported and the run fails
  403, 429, other statuses,     reported only: bot walls, rate limits and slow hosts are not
  timeouts, network errors      evidence that a page is gone

Usage:
  python3 scripts/check-external-links.py <site-dir> [--jobs N] [--timeout S]
  python3 scripts/check-external-links.py <site-dir> --list     # the distinct URLs, no network
"""

import argparse
import concurrent.futures
import html
import os
import pathlib
import re
import socket
import sys
import tomllib
import urllib.error
import urllib.request

GONE = {404, 410}
HREF = re.compile(r"""href\s*=\s*["'](https?://[^"'\s<>]+)["']""", re.IGNORECASE)
USER_AGENT = "Mozilla/5.0 (compatible; kompendium-link-check/1.0)"
MAX_SOURCES = 3


def base_url(root):
    with open(root / "zola.toml", "rb") as fh:
        return tomllib.load(fh)["base_url"].rstrip("/")


def collect(site, own):
    """Distinct external URL -> the built pages that link it (sorted, as site paths)."""
    urls = {}
    for page in sorted(site.rglob("*.html")):
        text = page.read_text(encoding="utf-8", errors="replace")
        rel = str(page.relative_to(site))
        for match in HREF.finditer(text):
            url = html.unescape(match.group(1)).split("#", 1)[0]
            if not url or url.rstrip("/") == own or url.startswith(own + "/"):
                continue
            urls.setdefault(url, [])
            if rel not in urls[url]:
                urls[url].append(rel)
    return urls


def request(url, method, timeout):
    req = urllib.request.Request(url, method=method, headers={"User-Agent": USER_AGENT})
    try:
        with urllib.request.urlopen(req, timeout=timeout) as resp:
            return resp.status, ""
    except urllib.error.HTTPError as err:
        return err.code, ""
    except (urllib.error.URLError, socket.timeout, TimeoutError, ConnectionError, OSError) as err:
        reason = getattr(err, "reason", err)
        return None, type(reason).__name__ + ": " + str(reason)[:120]


def check(url, timeout):
    status, error = request(url, "HEAD", timeout)
    if status is not None and 200 <= status < 400:
        return url, status, ""
    get_status, get_error = request(url, "GET", timeout)
    if get_status is not None or status is None:
        return url, get_status, get_error
    return url, status, error


def main():
    parser = argparse.ArgumentParser(description=__doc__.split("\n", 1)[0])
    parser.add_argument("site", type=pathlib.Path, help="directory of the built site")
    parser.add_argument("--jobs", type=int, default=8, help="concurrent requests (default 8)")
    parser.add_argument("--timeout", type=float, default=15.0, help="seconds per request")
    parser.add_argument("--list", action="store_true", help="print the distinct URLs and stop")
    args = parser.parse_args()

    root = pathlib.Path(__file__).resolve().parent.parent
    if not args.site.is_dir():
        print(f"check-external-links: {args.site} is not a directory", file=sys.stderr)
        return 2
    urls = collect(args.site, base_url(root))
    if args.list:
        for url in sorted(urls):
            print(url)
        return 0
    if not urls:
        print("check-external-links: no external link found; is this a built site?", file=sys.stderr)
        return 2

    gone, reported = [], []
    jobs = max(1, args.jobs)
    with concurrent.futures.ThreadPoolExecutor(max_workers=jobs) as pool:
        futures = [pool.submit(check, url, args.timeout) for url in sorted(urls)]
        for future in concurrent.futures.as_completed(futures):
            url, status, error = future.result()
            if status in GONE:
                gone.append((url, status, error))
            elif status is None or not 200 <= status < 400:
                reported.append((url, status, error))

    def line(url, status, error):
        sources = urls[url]
        where = ", ".join(sources[:MAX_SOURCES])
        if len(sources) > MAX_SOURCES:
            where += f" (+{len(sources) - MAX_SOURCES})"
        parts = [str(status) if status is not None else "---", url, error, "<-", where]
        return " ".join(part for part in parts if part)

    out = [f"external links: {len(urls)} distinct, {len(gone)} gone (404/410), "
           f"{len(reported)} reported only (403, 429, other, timeout)"]
    if gone:
        out.append("\ngone (fails the run):")
        out += [line(*item) for item in sorted(gone)]
    if reported:
        out.append("\nreported only:")
        out += [line(*item) for item in sorted(reported)]
    text = "\n".join(out)
    print(text)
    summary = os.environ.get("GITHUB_STEP_SUMMARY")
    if summary:
        with open(summary, "a", encoding="utf-8") as fh:
            fh.write("## External links\n\n```\n" + text + "\n```\n")
    return 1 if gone else 0


if __name__ == "__main__":
    sys.exit(main())
