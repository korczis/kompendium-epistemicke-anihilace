+++
title = "1.5 Bezpečnostní klasifikace přístupu"
description = "Detailní specifikace čtyř přístupových úrovní L1–L4, prerekvizit, výcviku, supervizních požadavků, audit mechanismů, eskalačních procedur a incident response."
weight = 5
insert_anchor_links = "right"

[taxonomies]
tags = ["kompendium", "predmluva", "bezpecnost", "klasifikace", "pristupove-urovne", "audit", "incident-response"]
categories = ["academic", "security"]

[extra]
related_terms = ["eticke-aspekty", "jak-pouzivat", "pro-koho-je-urceno"]
parent = "kompendium-01-predmluva"
section_icon = "🔐"
toc = true
+++

# 1.5 Bezpečnostní klasifikace přístupu

Bezpečnostní klasifikace přístupu definuje **čtyřúrovňový systém** přístupových oprávnění (L1–L4), který operacionalizuje principy [graduální expozice](@/kompendium/01-predmluva/jak-pouzivat.md), [minimální nezbytné expozice](@/kompendium/01-predmluva/pro-koho-je-urceno.md) a [maximální opatrnosti](@/kompendium/01-predmluva/eticke-aspekty.md). Tato kapitola poskytuje formální specifikaci úrovní, prerekvizit, požadavků na výcvik a supervizi, audit mechanismů a procedur eskalace a incident response.

## Filosofie tier-based přístupu

Tier-based klasifikace je kompromisem mezi dvěma extrémními pozicemi:

- **Univerzální přístup** — maximalizuje academic freedom, ale ignoruje dual-use rizika
- **Kompletní zákaz** — eliminuje dual-use rizika, ale paralyzuje obrannou kapacitu

Středovou cestou je **stratifikovaný přístup**, kde každá úroveň balancuje:

1. **Užitečnost** — kolik práce uživatel skutečně může vykonat
2. **Riziko** — jaká část poznání je dostupná
3. **Odpovědnost** — jaké závazky uživatel přijímá
4. **Verifikace** — jak je prokázána způsobilost

## Přehled úrovní

| Úroveň | Název | Typický uživatel | Prerekvizity | Supervize |
|--------|-------|------------------|--------------|-----------|
| **L1** | Foundation | Postgraduální student, začínající badatel | Pregraduální vzdělání + úvodní školení | Garant studia |
| **L2** | Practitioner | Klinický psychiatr/psycholog s atestací | Atestace + 8h etického školení + NDA | Profesní supervizor |
| **L3** | Specialist | Kognitivní rehabilitátor, forenzní specialista | L2 + 1 rok praxe + 40h specializovaný kurz | Etická komise instituce |
| **L4** | Expert | Bezpečnostní analytik, vedoucí výzkumu | L3 + 3 roky praxe + 80h advanced training | Externí etický oversight + nezávislá komise |

## Specifikace jednotlivých úrovní

### L1 — Foundation

**Rozsah přístupu**:

- Sekce 01 (Předmluva) — kompletní
- Sekce 02 (Úvod) — kompletní
- Sekce 03 (Základní kategorie) — pouze úvodní kapitoly, vybrané techniky bez ofenzivních detailů
- Sekce 06 (Klinické aplikace) — defenzivní a diagnostické sekce
- Sekce 07 (Teoretické reflexe) — kompletní
- Glosář — kompletní

**Prerekvizity**:

- Pregraduální vzdělání v relevantním oboru (psychologie, psychiatrie, filozofie, kognitivní vědy, lingvistika)
- Aktivní studium PhD nebo specializačního programu
- Doporučení akademického garanta
- Absolvování úvodního orientačního kurzu (8 hodin online + 4 hodiny prezenčně)

**Požadavky na výcvik**:

- Úvodní orientační kurz (12h)
- Etický modul: dual-use, primum non nocere, [informed consent](@/glossary/informed-consent.md) (4h)
- Praktický modul: navigace kompendia, glosář, křížové odkazy (4h)
- Závěrečný test (50 otázek, minimum 80%)

**Supervize**:

- Garant studia odpovědný za schválení specifických výzkumných témat
- Periodická konzultace (minimálně 1× kvartálně)
- Povinnost reportovat všechny aplikace mimo akademický kontext

**Auditní záznamy**:

- Log přístupů ke kompendiu (timestamp, IP, čas trvání)
- Vyhledávací dotazy (pro detekci anomálního chování)
- Stažené sekce/techniky

### L2 — Practitioner

**Rozsah přístupu**:

- Vše z L1
- Sekce 03 — kompletní
- Sekce 06 — kompletní (včetně terapeutických protokolů)
- Sekce 04 (Terminální protokoly) — vybrané kapitoly s defenzivním zaměřením
- Případové studie kompletně

**Prerekvizity**:

- Atestace v psychiatrii, klinické psychologii nebo souvisejícím oboru
- Minimálně 5 let klinické praxe
- Aktivní profesní supervize
- Schválení etickou komisí instituce
- Podpis právně závazné dohody o důvěrnosti (NDA)

**Požadavky na výcvik**:

- Specializovaný kurz „Epistemická psychopatologie v klinické praxi“ (16 hodin)
- Etický modul advanced (8 hodin)
- Diferenciální diagnostický modul (8 hodin)
- Roční rekvalifikační seminář (8 hodin)

**Supervize**:

- Profesní supervizor s L3 nebo L4 oprávněním
- Měsíční supervizní setkání (minimálně 60 minut)
- Roční etický audit klinické praxe

**Auditní záznamy**:

- Vše z L1
- Anonymizované záznamy o aplikaci taxonomie v klinické praxi
- Roční zpráva pro etickou komisi

### L3 — Specialist

**Rozsah přístupu**:

- Vše z L2
- Sekce 04 — kompletní
- Sekce 05 (Ultramární techniky) — selektivní přístup k vybraným kapitolám
- Detailní operační protokoly pro epistemickou rekonstrukci

**Prerekvizity**:

- L2 oprávnění minimálně 1 rok
- Specializace v oblasti komplexního traumatu, forenzní psychiatrie nebo kognitivní rehabilitace
- Doložená praxe s minimálně 10 anonymizovanými case studies
- Schválení nezávislou etickou komisí (mimo zaměstnaneckou instituci)
- Rozšířený NDA + audit consent

**Požadavky na výcvik**:

- Specializovaný kurz „Pokročilá taxonomie a intervenční strategie“ (40 hodin)
- Hands-on praktikum pod supervizí L4 specialisty (40 hodin)
- Etický modul expert (16 hodin)
- Pololetní rekvalifikace (16 hodin)

**Supervize**:

- Etická komise instituce
- Externí supervizor s L4 oprávněním (minimálně 1× kvartálně)
- Případový panel pro komplexní intervence

**Auditní záznamy**:

- Vše z L2
- Detailní záznamy o aplikaci pokročilých technik (i defenzivních)
- Kvartální zpráva pro etickou komisi
- Případová dokumentace pro nezávislé peer review

### L4 — Expert

**Rozsah přístupu**:

- Kompletní kompendium bez výjimky
- Vývojové verze a draft kapitoly
- Přístup k zdrojovým datům výzkumu
- Možnost navrhovat revize taxonomie

**Prerekvizity**:

- L3 oprávnění minimálně 3 roky
- Mezinárodní reputace v oblasti epistemické psychopatologie nebo bezpečnostní analytiky
- Habilitace nebo ekvivalent
- Schválení mezinárodní etickou komisí
- Doložení absence konfliktu zájmů

**Požadavky na výcvik**:

- Master training program (80+ hodin)
- Advanced ethical leadership (40 hodin)
- Ongoing professional development (32 hodin ročně)

**Supervize**:

- Mezinárodní etický oversight board
- Peer review nezávislými L4 experty
- Roční audit nezávislou komisí

**Auditní záznamy**:

- Vše z L3
- Kompletní transparence všech aktivit s kompendiem
- Roční etický self-assessment
- Veřejně přístupný (anonymizovaný) audit záznam

## Procedura žádosti o přístup

1. **Iniciační žádost** — formální žádost s přiloženými kvalifikacemi
2. **Kvalifikační verifikace** — ověření profesní kvalifikace, afiliace, praxe
3. **Etické posouzení** — etická komise hodnotí žádost
4. **Školení** — povinné absolvování kurzu odpovídajícího úrovni
5. **Závěrečné posouzení** — test + ústní pohovor s etickou komisí
6. **Smluvní rámec** — podpis NDA, audit consent, ethical commitment
7. **Aktivace přístupu** — provisioning na platformě s logováním

Celá procedura typicky trvá:

- L1: 1–2 měsíce
- L2: 3–4 měsíce
- L3: 6–9 měsíců
- L4: 12–18 měsíců

## Eskalační procedura

Postup mezi úrovněmi vyžaduje:

| Z–na | Minimální doba | Klíčový požadavek |
|------|----------------|-------------------|
| L1 → L2 | 12 měsíců + atestace | Doložená praxe + supervize |
| L2 → L3 | 12 měsíců | Specializace + 10 case studies |
| L3 → L4 | 36 měsíců | Mezinárodní reputace + habilitace |

**Akcelerovaná eskalace** je možná pouze ve výjimečných případech (např. nábor zahraničního experta) a vyžaduje schválení mezinárodní etickou komisí.

## Audit mechanismy

### Aktivní audit

- **Log všech přístupů** s timestamp, IP, identifikací uživatele, dotazem
- **Anomalous behavior detection** — ML model identifikující neobvyklé vzorce přístupu
- **Periodická revize** logů etickou komisí (minimálně 1× kvartálně)
- **Cross-reference** s deklarovanými výzkumnými projekty

### Pasivní audit

- **Roční self-assessment** — uživatel reportuje vlastní využití
- **Peer review** — nezávislé hodnocení etické integrity práce
- **Institucionální audit** — zaměstnavatelská organizace audituje use cases

### Public audit (pouze L4)

- **Anonymizované veřejné záznamy** o aktivitách s kompendiem
- **Public commitment** k etickým principům
- **Transparentní reporting** o navrhovaných revizích taxonomie

## Incident response

### Klasifikace incidentů

| Stupeň | Typ | Reakce |
|--------|-----|--------|
| **I** | Drobné porušení (např. opožděné reportování) | Varování + dodatečné školení |
| **II** | Závažné porušení (např. neoprávněné sdílení) | Suspenze přístupu + audit + remediace |
| **III** | Kritické porušení (např. úmyslné zneužití) | Trvalé odejmutí + notifikace profesní komory + právní kroky |
| **IV** | Katastrofické porušení (např. systematický útok) | Aktivace incident response týmu + soudní stíhání |

### Incident response procedura

1. **Detekce** — automatická nebo nahlášená
2. **Triáž** — klasifikace stupně závažnosti
3. **Containment** — izolace uživatele, suspenze přístupu
4. **Investigation** — etická komise + případně právní oddělení
5. **Remediation** — náprava škod, případně forenzní práce s oběťmi
6. **Lessons learned** — institucionální učení, aktualizace procedur
7. **Disclosure** — informování dotčených stran v souladu s legislativou

### Whistleblowing

Uživatelé jsou nejen oprávněni, ale **povinni** hlásit podezření na zneužití. Whistleblowing kanál:

- **Anonymní** — chráněná identita whistleblowera
- **Mimoinstitucionální** — nezávislý etický board
- **Právně chráněný** — ochrana před retaliací podle relevantní legislativy
- **Strukturovaný** — formální procedurální rámec pro investigaci

## Sankce za porušení

Detailní sankční rámec odpovídá kategorizaci v [Etických aspektech](@/kompendium/01-predmluva/eticke-aspekty.md#sankcni-ramec). Specifické bezpečnostní sankce zahrnují:

- Suspenzní karanténu uživatele (default 30 dní)
- Trvalé odejmutí přístupu pro celou afilijovanou instituci
- Zápis do mezinárodního registru porušení
- Veřejné odsouzení etické komise

## Související

- [Účel kompendia](@/kompendium/01-predmluva/ucel-kompendia.md)
- [Pro koho je určeno](@/kompendium/01-predmluva/pro-koho-je-urceno.md)
- [Etické aspekty a upozornění](@/kompendium/01-predmluva/eticke-aspekty.md)
- [Jak používat toto kompendium](@/kompendium/01-predmluva/jak-pouzivat.md)
- [Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md)
- [Sekce 04: Terminální protokoly](@/kompendium/04-terminalni-protokoly/_index.md)
- [Sekce 05: Ultramární techniky](@/kompendium/05-ultramari-techniky/_index.md)
- [Glossary: Color Teams](@/glossary/color-teams.md)
- [Philosophy: Boundary Ethics](@/philosophy/boundary-ethics.md)
- {{ <cross_link path="/hub/dd/decisions/" text="Decision Engine" /> }}

## ⚡ Kritický krok

**Předtím než pokročíš do dalších sekcí**, ověř si etický kontext: zkontroluj
souhlas se svou supervizí (akademická / klinická / forenzní), porozuměl jsi
[etickým aspektům](@/kompendium/01-predmluva/eticke-aspekty.md), a víš, **kdy
materiál nečíst** (vyhořelý stav, akutní krize, neexistující supervizní rámec).

> **Mandatorní akce**: vrať se na tuto stránku až poté, co tyto tři body
> projdeš. Bez nich kompendium operuje mimo svůj zamýšlený etický rámec.

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [Glossary](@/glossary/_index.md) | [Philosophy](@/philosophy/_index.md) | [Developer Portal](https://prismatic-reality-com.github.io/prismatic-promo/developers/)
