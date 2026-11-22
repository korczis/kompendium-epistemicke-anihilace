---
schema: knowledge/v1
id: mesh-fleet-trust-owner-answer
kind: knowledge
class: fact
title: "Owner answer 2026-11-22: the fleet trust block lands in this public repository with the key hashes quoted"
description: "Before changing .ai/repo/mesh/mesh.yaml (trust.allow, rendezvous endpoints, the Tailscale provider) in this repository."
status: verified
epistemics: observed
date: 2026-11-22
tags:
  - mesh
  - owner-check
provenance:
  origin: authored
---

# Owner answer 2026-11-22: the fleet trust block lands here, hashes quoted

PR #1 (`fix/mesh-fleet-trust`, from session korczis-github-io-91) adds four owner machine keys
to `trust.allow`, six rendezvous endpoints (LAN `192.168.100.x` and tailnet `100.x`) and turns the
Tailscale provider on. Its basis is the owner decision recorded in korczis.github.io
(`.ai/repo/knowledge/curated/owner-decisions-2026-11-22.md`). The content lane declined to land a
trust grant on a citation from another repository and handed it to the landing seat. The landing
seat asked the owner directly.

- Session `5d49a595-d035-4bbe-b04a-d12695922860` (dev-31), AskUserQuestion, 2026-11-22T06:55Z.
- Question (verbatim): "Kompendium PR #1 (fix/mesh-fleet-trust, od korczis-github-io-91) přidává
  do .ai/repo/mesh/mesh.yaml 4 nové klíče strojů do trust allow-listu, 6 rendezvous adres (LAN
  192.168.100.x a tailnet 100.x) a zapíná Tailscale. Oprávňuje ho tvé rozhodnutí z 22. 11.
  zapsané v korczis.github.io. Repo je veřejné, takže ty adresy budou veřejné. PR navíc odstraňuje
  uvozovky kolem hashů klíčů: hash složený jen z číslic by YAML načetl jako číslo a klíč by tiše
  nikdy nesouhlasil. Co s ním?"
- Answer (verbatim): "Opravit uvozovky a sloučit (Recommended)". The hashes get their quotes
  back, the PR lands on green, and the addresses stay in this public repository as they are in
  korczis.github.io.

**Why the quotes matter.** In YAML an unquoted 64-character hex digest is a string only because
it contains a letter a–f. A digest made only of digits would load as an integer, and the trust
comparison would then quietly never match. Every value in `trust.allow` is quoted.

**Comments go on their own line.** Majordomus 1.1.0 keeps the quotes when a quoted key is
followed by a trailing `# comment`: the value loads as `"\"946e…\""`, fails the
`^[0-9a-f]{64}$` pattern of `majordomus.mesh-declaration/v1`, and the whole declaration is dropped
(`mesh doctor`: "declaration absent: the mesh is off"). Reported by session korczis-github-io-91
on 2026-11-22. Each key's machine label therefore sits on the line above it, as in 13e5fe76.
Check with `majordomus mesh doctor`: the declaration line must be present. The trust-root
check counts only keys that are on the trunk.
