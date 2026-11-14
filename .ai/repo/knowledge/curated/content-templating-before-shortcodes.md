---
schema: knowledge/v1
id: content-templating-before-shortcodes
kind: knowledge
class: lesson
title: "A Zola shortcode cannot be called from a page here; content is templated first"
description: "When a shared block should come from one source instead of being pasted on many pages, or when a shortcode call in content fails with Unknown function."
status: verified
epistemics: observed
date: 2026-11-14
tags:
  - content
  - zola
  - templates
provenance:
  origin: authored
---

# A Zola shortcode cannot be called from a page here; content is templated first

This site renders page content through Tera before Zola's own shortcode pass. `zola.toml`
declares `skip_content_templating` for three glossary pages whose code examples contain literal
`{{ }}`, which is the visible sign of it. The consequence is not documented anywhere else and
costs an hour to rediscover: **a shortcode call written in a page fails.** Tera reaches
`{{ nazev_shortcodu() }}` first, finds no function of that name registered, and the build stops:

```
ERROR Failed to render page content of '…/content/kompendium/techniques/ea-4-4-2-role-fragmentation.md'
ERROR Reason: error: Unknown function `bezpecnostni_ramec`
  --> __tera_one_off:35:4
```

`__tera_one_off` in that message is the content-templating pass. Proved on 2026-11-14 with a
`templates/shortcodes/probe_x.html` containing nothing but `<p>PROBE-RENDERED</p>`: the call fails
on an ordinary page the same way, so the shortcode file is never the problem.

**The same property is the remedy.** Because content is templated, a page can read a data file
itself, which gives one source without a shortcode:

```
{% set ramec = load_data(path="data/bezpecnostni-ramec.toml") %}| Pojistka | Co znamená její nepřítomnost |
|---|---|
{% for p in ramec.pojistka %}| **{{ p.label }}** | {{ p.absence }} |
{% endfor %}
```

The markdown pass runs after templating, so `@/…` links inside the data resolve normally and the
heading after `{% endfor %}` is still a heading. `data/bezpecnostni-ramec.toml` and the 40 pages of
`## Bezpečnostní rámec` are the worked example.

What follows for later work:

- A genuinely shared block belongs in `data/*.toml` read by the page, or — when its position is
  fixed for every page — in a `templates/partials/` include called from the page template. Not in a
  shortcode.
- A page that must show literal `{{ }}` goes on the `skip_content_templating` list, and then it
  cannot read data either.
- `scripts/check-ia.py` reads the Markdown source, so a table moved into data stops being a table
  for every content gate. That is the point, but it also means the text is no longer checked by
  those gates: the data file is the place to review it.
- The search index is unaffected either way. `zola.toml` sets `include_content = false` and the
  index declares only `title, description, url, code, kind, aliases, in, file, tags`, so body prose —
  table or not — was never searchable.
