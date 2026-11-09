---
schema: adr/v1
id: adr-0001
kind: adr
title: "Public release name and licence"
status: accepted
date: 2026-11-09
tags:
  - release
  - licence
provenance:
  origin: authored
---

# 1. Public release name and licence

## Context

The Kompendium had no repository of its own. Its source lived inside the private monorepo
`gitlab.com/korczis/prismatic-platform` (`apps/prismatic_web/priv/content/kompendium/`, 1587
files), its rendered pages in `github.com/prismatic-reality-com/prismatic-promo`, and older
versions in `gitlab.com/korczis/prismatic-legacy` and three secret gists. The owner asked for it
to be recovered as a public GitHub project with GitHub Pages, a wiki and graphics.

## Decision

Owner answers (AskUserQuestion, session `5d49a595-d035-4bbe-b04a-d12695922860`,
2026-11-09T21:33Z), recorded verbatim:

- Q: "What should the public GitHub repo (and the GitHub Pages URL) be called?"
  A: "korczis/kompendium-epistemicke-anihilace (Recommended)"
- Q: "Licence for the public book (text + graphics)? Your code repos use MIT, but that licence
  is meant for code, not for a book."
  A: "CC BY-NC-SA 4.0 (Recommended)"

So: repository `korczis/kompendium-epistemicke-anihilace`, Pages at
`https://korczis.github.io/kompendium-epistemicke-anihilace/`. The text and graphics are licensed
under CC BY-NC-SA 4.0, and the code (templates, scripts, workflows) under MIT.

## Alternatives rejected

- `korczis/kompendium` and `korczis/epistemic-annihilation`, both offered as repository names.
- CC BY-SA 4.0, CC BY 4.0 and all rights reserved, offered as licences.

## Consequences

- `LICENSE` (MIT, code) and `LICENSE-CONTENT.md` (CC BY-NC-SA 4.0, `content/`, `archive/`,
  `static/img/`) sit at the root, and the README states which path falls under which.
- History of the book was extracted from `prismatic-platform` with `git filter-repo`, so the
  commits before this decision keep their original authorship and dates.
