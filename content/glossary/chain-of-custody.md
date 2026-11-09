+++
title = "Chain of Custody"
weight = 5
description = "Continuous, documented control of evidence from collection through presentation, ensuring authenticity, integrity, and admissibility in forensic, legal, and due-diligence proceedings"

[taxonomies]
tags = ["forensic", "legal", "compliance", "evidence", "due-diligence"]

[extra]
category = "forensic"
status = "active"
author = "Tomas Korcak (korczis)"
reading_time = "6 min"
difficulty = "intermediate"
quality_score = 92
abbreviation = "CoC"
date_created = "2026-05-03"
date_updated = "2026-05-03"
importance = "critical"
related_terms = ["evidence", "verifiable-evidence", "evidence-over-opinion", "due-diligence", "forensic-interview", "pattern-evidence", "expert-witness"]
keywords = ["chain of custody", "evidence handling", "forensic procedure", "evidence integrity", "admissibility", "spoliation", "tamper-evident", "audit trail"]
key_takeaway = "Chain of Custody is the unbroken, contemporaneously documented record proving that evidence has remained authentic and unaltered from the moment of collection to the moment of adjudication. Any unexplained gap can render otherwise probative evidence inadmissible."
see_also = ["forensic-interview", "expert-witness", "pattern-evidence"]
image = "/images/sections/glossary.png"
image_alt = "Chain of Custody - Prismatic Platform"
+++

## Definition

Chain of Custody (CoC) is the chronological, documented sequence of seizure, transfer, analysis, and disposition of physical or digital evidence. Every individual who handled the item, the date and time of each transfer, and the purpose of each handling event must be recorded. The chain must be continuous: any unaccounted-for interval creates a presumption that the evidence may have been tampered with, contaminated, or substituted.

## Manažerské shrnutí

Chain of Custody je páteří jakékoli forenzní nebo due-diligence operace. Bez nepřetržitého dokumentačního řetězce se i nejprůkaznější důkaz stává procesně nepoužitelným. V kontextu Prismatic Platform se princip aplikuje nejen na fyzické dokumenty a digitální artefakty (logy, snímky disků, exporty databází), ale také na OSINT zjištění, kde je nutné prokázat, *kdo*, *kdy* a *odkud* informaci získal a že nebyla v mezičase upravena. Selhání v CoC je nejčastější důvod, proč soudy a regulátoři odmítají jinak validní zjištění.

## Forensic/Legal Context

The doctrine emerged from common-law evidentiary requirements — most notably the *foundational authenticity* requirement under U.S. Federal Rules of Evidence 901 and analogous provisions in the Czech Code of Criminal Procedure (§ 89). Courts demand that the proponent of evidence demonstrate that the item offered is the same item that was collected and that it remains in substantially the same condition. In digital forensics, the standard is heightened: cryptographic hashes (SHA-256, BLAKE3) of seized media are computed at acquisition and re-verified before analysis to prove bit-level integrity. Common challenges include broken seals, missing signatures on transfer logs, undocumented "borrowing" of evidence by investigators, and storage in environments without access auditing.

## Practical Application

In M&A due diligence, CoC governs how data-room exports, executed agreements, and forensic accounting work papers are handled between counsel, advisors, and the eventual buyer. In OSINT investigations, CoC dictates how scraped public data is captured (timestamped HTTP responses, WARC archives, screenshots with embedded metadata) so that downstream conclusions can be defended. In incident response, CoC governs disk images, memory dumps, and log exports that may later support criminal referral. The practical minimum is a tamper-evident container, signed transfer log, hash-on-acquisition, hash-on-analysis, and a controlled-access storage location with entry/exit records.

## Related Concepts

- [Evidence](https://prismatic-reality-com.github.io/prismatic-promo/glossary/evidence/) - General category that CoC protects
- [Verifiable Evidence](https://prismatic-reality-com.github.io/prismatic-promo/glossary/verifiable-evidence/) - Output standard that CoC enables
- [Evidence Over Opinion](https://prismatic-reality-com.github.io/prismatic-promo/glossary/evidence-over-opinion/) - Doctrine requiring documented support for claims
- [Due Diligence](@/glossary/due-diligence.md) - Workflow where CoC is mandatory
- [Forensic Interview](@/glossary/forensic-interview.md) - Sister procedure for testimonial evidence
- [Expert Witness](@/glossary/expert-witness.md) - Authority who establishes CoC at trial

## References

- Federal Rules of Evidence, Rule 901 — Authenticating or Identifying Evidence (United States)
- Saferstein, R. *Criminal Investigation: Forensic Science* (12th ed., Pearson, 2018)
- ISO/IEC 27037:2012 — *Guidelines for identification, collection, acquisition and preservation of digital evidence*
- Zákon č. 141/1961 Sb., trestní řád, § 89 (důkaz)

---

*Built with precision. Optimized for AI consumption.*
