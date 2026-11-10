+++
title = "Bridge: Techniques → Glossary"
description = "Bridge článek propojující Techniques s Glossary (kompendium + platform)."
weight = 30

[taxonomies]
tags = ["kompendium", "section-bridge", "navigace"]
categories = ["academic", "reference"]

[extra]
related_terms = ["bridge-quick-reference-to-glossary", "bridge-techniques-to-case-studies", "bridge-techniques-to-quick-reference", "bridge-techniques-to-visualizations"]
parent = "kompendium-section-bridges"
toc = false
+++

# Bridge: Techniques → Glossary

> **Z:** Techniques → **Do:** Glossary (kompendium + platform)
> **Typ:** Inter-section bridge (sekce-na-sekci)
> **Reciprocita:** Bidirektionální navigace mezi sekcemi.

## 1. Účel bridge

Každá technika je ukotvena v **terminologii**. Glossary (jak v kompendiu, tak na platformě) drží kanonické definice. Bridge garantuje, že technika a definice se nerozcházejí — terminologická hygiena je prerekvizita pro klinickou bezpečnost.

## 2. Klíčová témata propojení

- **Technika → glossary anchor** — každá technika má kotvu v glosáři.
- **Variace techniky → variantní glossary entry.**
- **Indikace → indikační glossary.**
- **Kontraindikace → kontraindikační glossary.**
- **Riziko → rizikový glossary.**
- **[Doctrine](@/glossary/doctrine.md) NCLB → glossary jako evidenční vrstva.**
- **Glossary platform vs. kompendium glossary** — synchronizace.

## 3. Doporučená čtenářská trajektorie

Při prvním kontaktu s technikou si vždy přečtěte glossary entry pro klíčové termíny. Při praktické práci se vracejte ke glossary v případě nejistoty. Glossary platform má hlubší vrstvu (definice + evidence + cross-link).

## 4. Společné cross-linky

| Z Techniques | Do Glossary (kompendium + platform) |
|---|---|
| Technique X.1 | Glossary anchor X.1 |
| Technique X.5 indikace | Glossary indikace |
| Technique X.7 kontraindikace | Glossary kontraindikace |
| Technique X.9 riziko | Glossary riziko |

## 5. Specifické techniky / koncepty

Klíčové koncepty: **glossary anchor**, **kompendium glossary vs. platform glossary**, **glossary jako evidenční vrstva**, **terminologická hygiena**, **synchronizace glosářů**.

## 6. Související

- [Techniques](@/kompendium/techniques/_index.md)
- [Glossary bridges](@/kompendium/glossary-bridges/_index.md)
- [Glossary platform](@/glossary/_index.md)
- [Doctrine NCLB](@/kompendium/glossary-bridges/bridge-nclb/_index.md)
- [Case Studies](@/kompendium/case-studies/_index.md)
- [Quick Reference](@/kompendium/quick-reference/_index.md)
- [Klinika](@/kompendium/06-klinicke-aplikace/_index.md)
- [Visualizations: Term index](@/kompendium/visualizations/_index.md)

## 7. Meta-poznámka: glossary jako single source of truth

Pokud Quick Reference, technika a glossary nesouhlasí — **vždy platí glossary**. QR a technika se opraví. Glossary funguje jako **single source of truth** napříč kompendiem i platformou. Bridge varuje před **glossary drift** — situací, kdy se kompendium vyvíjí rychleji než glosář, a vznikají rozpory. Pre-commit hook NCLB tyto rozpory detekuje, ale finální arbitrem je člověk-editor. Praktické pravidlo: **při každém přidání techniky ověřit glossary kotvy**, při každém přidání glossary entry ověřit, že je odkazována z relevantních technik.

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Developer Portal](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architecture](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [Glossary](@/glossary/_index.md) | [Kompendium](@/kompendium/_index.md)
