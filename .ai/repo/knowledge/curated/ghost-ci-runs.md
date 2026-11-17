---
schema: knowledge/v1
id: ghost-ci-runs
kind: knowledge
class: lesson
title: "Two CI runs queued since 2026-11-11 with no jobs cannot be cancelled; the owner's answers of 2026-11-17"
description: "Before cancelling, re-running or counting queued CI runs of this repository, or before deleting feature/content-placeholders."
status: verified
epistemics: observed
date: 2026-11-17
tags:
  - ci
  - owner-check
provenance:
  origin: authored
---

# Two CI runs queued since 2026-11-11 with no jobs cannot be cancelled; the owner's answers of 2026-11-17

## What was observed

Two runs of the `CI` workflow have stood at `queued` with zero jobs since 2026-11-11 (read with
`gh run view <id> --json status,createdAt,headBranch` on 2026-11-17):

| run | created | branch |
|---|---|---|
| 43098560399 | 2026-11-11T20:52:26Z | docs/adr-0010-klinicke-podrobnosti |
| 43097592907 | 2026-11-11T20:42:06Z | feature/vymyslena-klinika |

Both the cancel and the force-cancel API calls answer HTTP 409 with the message "Cannot cancel a
workflow run that has not been queued yet". A run that holds no jobs cannot be cancelled, so the
runs stay as they are. They hold no runner. They do, however, inflate any count of queued runs,
so count jobs rather than runs when measuring runner contention.

## The owner's answers (session 5d49a595, 2026-11-17, asked by dev-31)

- Q: "Mám zrušit ghost CI runy 43098560399 a 43097592907?" (Should I cancel ghost CI runs
  43098560399 and 43097592907?) A: "Zrušit oba" (Cancel both). Both cancels were attempted and
  refused with the 409 above; there is nothing further to do on these runs.
- Q: "feature/content-placeholders (ee11f597, 7 commits not on main)?" A: "Nechat být" (Leave
  it). The branch is kept at `ee11f597` and is not to be deleted or landed without a new owner
  answer.
