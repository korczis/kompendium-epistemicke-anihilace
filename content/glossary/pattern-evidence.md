+++
title = "Pattern Evidence"
weight = 5
description = "Evidence consisting of observable, repeatable configurations or sequences — physical impressions, behavioral signatures, statistical regularities — that supports inference about origin, agency, or causation in forensic, OSINT, and investigative contexts"

[taxonomies]
tags = ["forensic", "investigation", "evidence", "osint", "due-diligence"]

[extra]
category = "forensic"
status = "active"
author = "Tomas Korcak (korczis)"
reading_time = "7 min"
difficulty = "intermediate"
quality_score = 91
abbreviation = "PE"
date_created = "2026-05-03"
date_updated = "2026-05-03"
importance = "critical"
related_terms = ["evidence", "verifiable-evidence", "pattern-matching", "behaviour-pattern", "anomaly-detection", "statistical-detection", "expert-witness"]
keywords = ["pattern evidence", "physical evidence", "behavioral patterns", "forensic pattern analysis", "modus operandi", "signature analysis", "statistical inference", "Daubert"]
key_takeaway = "Pattern evidence supports inference from regularity — that something repeats across cases, locations, or time in ways unlikely to be coincidence. Its evidentiary weight depends entirely on the rigor of the underlying classification scheme and the empirical base rate of the pattern in the relevant population."
see_also = ["forensic-interview", "expert-witness", "chain-of-custody"]
image = "/images/sections/glossary.png"
image_alt = "Pattern Evidence - Prismatic Platform"
+++

## Definition

Pattern evidence is any class of evidence whose probative value derives from the matching of an observed configuration against a known reference — fingerprints to suspect prints, tire tracks to vehicle treads, ballistic markings to firearms, handwriting to exemplars, behavioral sequences to a known modus operandi, or transaction patterns to a typology of money laundering. The category spans physical (impression, toolmark, biological), digital (file-system artifacts, network flows, malware signatures), and behavioral (criminal MO, fraud typologies, OSINT-derived activity profiles) sub-domains.

## Manažerské shrnutí

Pattern evidence (vzorový důkaz) je důkaz z opakování — z toho, že nějaká konfigurace, sekvence nebo signatura se objevuje napříč případy způsobem, který je nepravděpodobný náhodou. V Prismatic Platform pattern evidence pokrývá široké spektrum: od klasických fyzických stop přes digitální forenzní artefakty (file-system, síťový provoz, malware signatury) až po behaviorální vzory v OSINT (modus operandi pachatelů, typologie podvodů, transakční vzorce praní peněz). Zásadní omezení: hodnota důkazu závisí kriticky na *base rate* daného vzoru v populaci a na rigoróznosti klasifikační metodologie. Po PCAST 2016 reportu jsou některé tradiční forenzní disciplíny (bite mark, hair comparison) obecně považovány za vědecky neopodstatněné.

## Forensic/Legal Context

Pattern evidence has come under intense scrutiny since the National Academies of Sciences 2009 report *Strengthening Forensic Science in the United States* and the President's Council of Advisors on Science and Technology (PCAST) 2016 report on feature-comparison methods. Both documents found that several historically accepted pattern disciplines — bite mark analysis, microscopic hair comparison, certain firearm and toolmark identifications — lacked the empirical foundation to support categorical "match" testimony. Modern admissibility under Daubert and Federal Rule of Evidence 702 requires demonstrated error rates, validated methodology, and disclosure of foundational assumptions. The Czech Code of Criminal Procedure § 105 imposes parallel requirements on znalecký posudek (expert opinion) including pattern evidence.

## Practical Application

In OSINT-driven due diligence, pattern evidence is frequently the strongest available signal: repeated co-incorporation of shell entities at the same registered office, recurring nominee directors across unrelated companies, identical address-format anomalies in beneficial-ownership disclosures, and timing patterns in social-media activity that suggest coordinated operation. In financial-crime investigations, pattern evidence underlies AML typology matching (smurfing, layering, trade-based laundering signatures). In incident response, malware family attribution rests almost entirely on code-pattern, infrastructure-pattern, and TTP-pattern matches against threat-intelligence corpora. Each application requires a documented methodology, a defensible reference dataset, and explicit acknowledgement of base-rate limitations.

## Related Concepts

- [Evidence](https://prismatic-reality-com.github.io/prismatic-promo/glossary/evidence/) - Parent category
- [Verifiable Evidence](https://prismatic-reality-com.github.io/prismatic-promo/glossary/verifiable-evidence/) - Quality standard pattern evidence must meet
- [Pattern Matching](https://prismatic-reality-com.github.io/prismatic-promo/glossary/pattern-matching/) - Underlying technical mechanism
- [Behaviour Pattern](https://prismatic-reality-com.github.io/prismatic-promo/glossary/behaviour-pattern/) - Behavioral subset of pattern evidence
- [Anomaly Detection](https://prismatic-reality-com.github.io/prismatic-promo/glossary/anomaly-detection/) - Inverse approach (deviation from pattern)
- [Statistical Detection](https://prismatic-reality-com.github.io/prismatic-promo/glossary/statistical-detection/) - Quantitative framework for pattern evaluation
- [Expert Witness](@/glossary/expert-witness.md) - Required to introduce pattern evidence at trial

## References

- President's Council of Advisors on Science and Technology. *Forensic Science in Criminal Courts: Ensuring Scientific Validity of Feature-Comparison Methods* (PCAST, 2016)
- National Research Council. *Strengthening Forensic Science in the United States: A Path Forward* (NAS, 2009)
- Federal Rules of Evidence, Rule 702 — Testimony by Expert Witnesses (United States)
- Zákon č. 141/1961 Sb., trestní řád, § 105 (znalec)

---

*Built with precision. Optimized for AI consumption.*
