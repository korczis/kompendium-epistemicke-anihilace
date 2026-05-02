+++
title = "Bridge: Quick Reference → Glossary"
description = "Bridge článek propojující Quick Reference s Glossary."
weight = 34

[taxonomies]
tags = ["kompendium", "section-bridge", "navigace"]
categories = ["academic", "reference"]

[extra]
parent = "kompendium-section-bridges"
toc = false
+++

# Bridge: Quick Reference → Glossary

> **Z:** Quick Reference → **Do:** Glossary
> **Typ:** Inter-section bridge (sekce-na-sekci)
> **Reciprocita:** Bidirektionální navigace mezi sekcemi.

## 1. Účel bridge

Quick Reference je **lookup vrstva**; Glossary je **definiční vrstva**. Bridge mapuje, kdy stačí Quick Reference (refresh) a kdy je potřeba Glossary (přesná definice, evidence, cross-link). Tato dualita zrychluje práci a zároveň drží přesnost.

## 2. Klíčová témata propojení

- **QR pojmová karta → glossary entry.**
- **QR step-by-step → glossary postup.**
- **QR kontraindikační lišta → glossary kontraindikace.**
- **QR indikační tabulka → glossary indikace.**
- **QR rizika → glossary rizika.**
- **QR variace → glossary varianty.**
- **Doctrine NCLB → QR má vždy glossary kotvu.**

## 3. Doporučená čtenářská trajektorie

Quick Reference se používá denně, glossary v případě nejistoty nebo prvního kontaktu. Pokud QR a glossary nesouhlasí — VŽDY platí glossary, QR se opraví.

## 4. Společné cross-linky

| Z Quick Reference | Do Glossary |
|---|---|
| QR card A | Glossary entry A |
| QR card B | Glossary entry B |
| QR card C | Glossary entry C |
| QR card D | Glossary entry D |

## 5. Specifické techniky / koncepty

Klíčové koncepty: **lookup vrstva vs. definiční vrstva**, **QR–glossary konzistence**, **glossary jako single source of truth**, **NCLB evidenční vrstva**.

## 6. Související

- [Quick Reference](@/kompendium/quick-reference/_index.md)
- [Glossary bridges](@/kompendium/glossary-bridges/_index.md)
- [Glossary platform](@/glossary/_index.md)
- [Doctrine NCLB](/kompendium/glossary-bridges/bridge-nclb/)
- [Techniques](@/kompendium/techniques/_index.md)
- [Case Studies](@/kompendium/case-studies/_index.md)
- [Klinika](@/kompendium/06-klinicke-aplikace/_index.md)
- [Visualizations](@/kompendium/visualizations/_index.md)

## 7. Meta-poznámka: cross-platform glossary

Glossary existuje **dvakrát**: v kompendiu (`/kompendium/glossary-bridges/`) a na platformě (`/glossary/`). Bridge zdůrazňuje, že **obě verze musí být synchronizované**. Platform glossary má hlubší vrstvu — definice + evidence + cross-link + claim validation (NCLB). Kompendium glossary bridges jsou navigační uzly. Při rozporu **platí platform glossary**. Quick Reference odkazuje na platform glossary, ne na kompendium glossary bridges. Tato hierarchie chrání před glossary drift a zajišťuje, že QR je vždy ukotvený v evidence-validated definici.

## 8. QR–glossary konzistence: praktické pravidlo

Bridge zdůrazňuje **praktické pravidlo**: při každém přidání QR card musí být ověřena synchronizace s glossary entry. Pre-commit hook NCLB toto vynucuje — QR card bez glossary anchor je rejected. Tato disciplína chrání před glossary drift a zajišťuje, že QR je vždy ukotvený v evidence-validated definici. Praktický workflow: nejprve glossary entry, pak QR card, nikdy obráceně.

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
- [Developer Portal](@/developers/_index.md) | [Architecture](@/architecture/_index.md) | [Glossary](@/glossary/_index.md) | [Kompendium](@/kompendium/_index.md)
