---
id: project.ui-uses-flowbite-pro
version: 1
kind: rule
title: Every user interface is built on Flowbite Pro
description: The site's templates use the owner's licensed Flowbite Pro shell, blocks and components on Tailwind.
statement: Build every page template of this site on the owner's licensed Flowbite Pro, starting from the matching Pro template or block, and review every template change for Pro fidelity.
status: active
class: blocking
depends_on: []
tags: [ui, flowbite, design-system]
---

# Rationale

The owner holds a Flowbite Pro licence and requires it for every project. One design system
across products keeps them consistent and saves reinventing components the licence already pays
for.

# Required behaviour

- Sources: `~/dev/poppyhead/assets/vendor/flowbite/` (admin shell, Publisher blocks) and the
  owner's adaptation in `~/dev/poppyhead/lib/poppyhead_web/components/layouts/flowbite.html.heex`;
  the Claude Code skill `flowbite-pro` condenses them.
- `templates/` keeps the Pro admin shell: fixed navbar, `aside#sidebar[aria-label="Sidebar"]`
  drawer toggled by `data-drawer-target`/`data-drawer-toggle`, page header with breadcrumb,
  cards on `gray-50`/`gray-900`. Reading pages use the Publisher `format` typography.
- Flowbite JS is self-hosted (`static/js/vendor/flowbite.min.js`, copied from npm by
  `scripts/vendor.mjs`); no other UI kit.
- Pro source files are never published verbatim; this is a public repository.

# Failure behaviour

A UI change that does not follow Flowbite Pro is a review finding of class `code-smell`
(category architecture) and is reworked before it lands.

# Verification

`node ~/.claude/skills/flowbite-pro/verify.mjs .` exits 0; a reviewer compares the change with
the Pro template it starts from.
