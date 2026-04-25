+++
title = "EA-2.1.3 Credentialing attack"
description = "Detailní per-technique článek: technika credentialing attack — útok na specifické formální kvalifikace experta s cílem podkopat základní legitimizační dokumenty (diplomy, certifikace, peer review status)."
weight = 213
insert_anchor_links = "right"

[taxonomies]
tags = ["kompendium", "techniques", "ea-2-1-3", "credentialing-attack", "delegitimizace", "expertni-diskvalifikace"]
categories = ["academic"]

[extra]
parent = "kompendium-techniques"
ea_code = "EA-2.1.3"
ea_category = "2. Scénáře delegitimizace"
ea_subcategory = "2.1 Expertní diskvalifikace"
section_icon = "🎓"
toc = true
access_level = "L2"
risk_level = "high"
parent_chapter = "/kompendium/03-zakladni-kategorie/kapitola-2/"
+++

# EA-2.1.3 Credentialing attack

| Pole | Hodnota |
|------|---------|
| **EA kód** | `EA-2.1.3` |
| **Kategorie** | 2. Scénáře epistemické delegitimizace |
| **Subkategorie** | 2.1 Expertní diskvalifikace |
| **Přístupová úroveň** | L2 (pokročilá) |
| **Riziková úroveň** | Vysoká — útok na formální základ legitimity |
| **Reverzibilita** | Střední — formální kvalifikace lze ověřit, ale poškození pověsti přetrvává |
| **Rodičovská kapitola** | [Kapitola 2 — Scénáře delegitimizace](/kompendium/03-zakladni-kategorie/kapitola-2/) |

## Definice

**Credentialing attack** je cílený útok na specifické formální kvalifikace cílového experta — diplomy, profesní certifikace, peer-reviewed publikační historii, akademické pozice. Cílem je vyvolat **dojem nelegitimity** základních dokumentů, které tradicionálně slouží jako rychlá heuristika pro hodnocení expertízy.

Útok funguje na strukturální asymetrii: ověření kvalifikace vyžaduje **práci** (kontaktovat instituci, vyhledat databáze), zatímco zpochybnění je **rétoricky levné**. Veřejnost často nedokončí ověření a zůstává s otevřeným podezřením.

## Operační modus

### Krok 1 — Identifikace nejcennější kvalifikace

Útočník identifikuje **single-point** legitimace — typicky doktorát, hlavní cert, klíčový publikační milestone, prestižní pozice.

### Krok 2 — Konstrukce zpochybnění

Zpochybnění je **strukturováno** tak, aby působilo věcně:

- "Jeho PhD je z [instituce], která má kontroverzní akreditaci"
- "Jeho hlavní paper byl v [časopis] s nízkým impact factor"
- "Jeho profesura je [adjunkt / honorary / corporate-funded] — ne 'tenured'"
- "Certifikace [X] vlastně neznamená kompetence v [Y]"

### Krok 3 — Ozvuková komora

Zpochybnění je **šířeno bez ověření** prostřednictvím sociálních sítí, blogů, opinion článků. Pře-publikování přidává **falešnou autoritu** prostřednictvím opakování.

### Krok 4 — Burden shift

Břemeno důkazu je **přenášeno na oběť**: "Kde jsou důkazy, že vaše kvalifikace **opravdu** znamená to, co tvrdíte?" Oběť je nucena vysvětlovat základy oboru.

### Krok 5 — Permanentní stigma

I po vyvrácení útok **přetrvává jako poznámka pod čarou** — "kontroverze kolem kvalifikace X" se stává součástí biografie.

## Fenomenologické znaky

Co prožívá oběť credentialing attack:

- **Absurdita** — nucenost obhajovat oficiálně vydané dokumenty
- **Kafkovský regress** — každé vysvětlení vyvolává nové podezření
- **Profesní vystavenost** — kolegové se distancují, "lepší se to vyhnout"
- **Sebepochybnost o vlastní práci** — pokud je zpochybněna kvalifikace, je zpochybněn celý život
- **Energetické vyčerpání** z administrativní obrany
- **Frustrace** z toho, že **fakta** nestačí

## Detekční markery

| Marker | Indikuje |
|--------|----------|
| Útok cílí na **formální** kvalifikace, ne obsah práce | Credentialing attack |
| Žádost o **ověření** ze strany útočníka chybí | Účelem není pravda, ale stigma |
| **Zaměnění** kontextů (např. honorary vs. tenured) | Záměrná dekontextualizace |
| **Absence specifikace**, co konkrétně by mělo být problém | Generic doubt-mongering |
| Distribuce přes **kanály**, kde kvalifikace nelze rychle ověřit | Exploitace asymetrie |
| Tvrzení o **kontroverzi instituce** bez specifikace | Guilt by association |
| Citace **anonymních zdrojů** o problému s kvalifikací | Nemůže být verifikováno |

## Rizikové kontexty

| Kontext | Manifestace |
|---------|-------------|
| **Public intelligence** | Expert kritizující politickou stranu, jejíž stoupenci zaútočí na credentials |
| **Whistleblowing** | Bývalá organizace zpochybní kvalifikaci po veřejné kritice |
| **Cross-border kontroverze** | Útoky na zahraniční diplomy (apel na xenofobii) |
| **Multioborový expert** | "PhD je z X, ne z Y, ve kterém teď mluví" |
| **Industry expert** | "Není akademik, je z firmy" / "Je akademik, neví, jak to funguje v praxi" |
| **Žensky/menšinově obsazené role** | Implicitní/explicitní zpochybnění typu "diversity hire" |

## Neutralizační strategie

### Individuální

1. **Veřejně dostupný portfolio** — webová stránka s přímými odkazy na ověřitelné zdroje (registry, DOI, akademický profil).
2. **Preemptivní disclosure** — ve sporných tématech předem disclose své kvalifikace s plným kontextem.
3. **Aliance s autoritativními body** — profesní organizace, alma mater, peer experti — kteří mohou autentizovat.
4. **Refuse the burden shift** — odpovídej: "Tato kvalifikace je veřejně registrovaná v [registr]. Pokud máte konkrétní důkaz problému, předložte ho."
5. **Legal documentation** — pro extrémní případy (defamation) připrav právní dokumentaci.

### Institucionální

| Strategie | Implementace |
|-----------|--------------|
| **Public registries** | Profesní organizace udržují **veřejné** registry kvalifikací |
| **Defamation policy** | Akademické instituce mají **policy** na obranu zaměstnanců proti falešným útokům |
| **Verification-by-default** | Žurnalistické standardy: každé tvrzení o kvalifikaci ověřeno před publikací |
| **Counter-misinfo** | Profesní organizace mají **rapid response** pro kvalifikační dezinformace |

## Vztah k jiným technikám

### Často se kombinuje s

- **[EA-2.1.1 Expertní disinflace](/kompendium/techniques/ea-2-1-1-expertni-disinflation/)** — credential attack jako součást širší disinflace.
- **[EA-2.1.2 Pseudo-peer mob](/kompendium/techniques/ea-2-1-2-pseudo-peer-mob/)** — koordinovaný útok zaměřený na credentials.
- **[EA-2.3.7 Deepfake personální](/kompendium/techniques/ea-2-3-7-deepfake-personalni/)** — falešné dokumenty jako "důkaz".

### Eskaluje do

- **[EA-2.1.7 Institucionální vyloučení](/kompendium/techniques/ea-2-1-7-institucionalni-vyloucenni/)** — credential attack vede k formální kontrole.
- **[EA-2.4.6 Peer review capture](/kompendium/techniques/ea-2-4-6-peer-review-capture/)** — útoky na publikační historii.

## Vztah k Prismatic platformě

- **OSINT framework credential verification** — pipelines mají dedicated adaptery pro ověření akademických a profesních kvalifikací (ORCID, ARES, registry profesních komor).
- **Decision Engine** — penalizuje rozhodnutí, kde kritika zdroje cílí na credentials bez doložené evidence problému.
- **NABLA Infinity provenance** — institucionální afilace expertů jsou auditovatelné napříč časem.

## Související

- **Rodičovská kapitola**: [Kapitola 2 — Scénáře delegitimizace](/kompendium/03-zakladni-kategorie/kapitola-2/)
- **Sourozenecké techniky** (subkategorie 2.1):
  - [EA-2.1.1 Expertní disinflace](/kompendium/techniques/ea-2-1-1-expertni-disinflation/)
  - [EA-2.1.2 Pseudo-peer mob](/kompendium/techniques/ea-2-1-2-pseudo-peer-mob/)
  - [EA-2.1.10 Credentials rekonfigurace](/kompendium/techniques/ea-2-1-10-credentials-rekonfigurace/)
- **Glossary**:
  - [Delegitimizace](/glossary/delegitimizace/)
  - [Taxonomie EA](/glossary/taxonomie-ea/)
  - [Epistemická anihilace](/glossary/epistemicka-anihilace/)
- **Související platformové koncepty**:
  - [Decision Engine](/hub/dd/decisions/)
  - [NABLA Infinity](/glossary/nabla-infinity/)
- **Filozofie**:
  - [Epistemic Integrity](/philosophy/epistemic-integrity/)

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis:**) | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [Glossary](/glossary/) | [Philosophy](/philosophy/) | [Developer Portal](/developers/)
