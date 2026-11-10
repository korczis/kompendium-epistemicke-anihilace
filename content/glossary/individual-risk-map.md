+++
title = "Individual risk map (mapa individuálních rizik)"
weight = 5
description = "Personalizovaný a doložený obraz rizik, kterým čelí nebo která představuje konkrétní osoba – účastník výzkumu, klíčová osoba transakce nebo chráněná osoba."

[taxonomies]
tags = ["glossary", "risk", "ethics", "investigation", "due-diligence", "compliance"]

[extra]
category = "risk"
status = "active"
author = "Tomas Korcak (korczis)"
reading_time = "4 min"
difficulty = "intermediate"
quality_score = 91
abbreviation = "IRM"
date_created = "2026-05-03"
date_updated = "2026-05-03"
importance = "high"
related_terms = ["risk-assessment", "risk-management", "risk-score", "informed-consent", "irb-review", "due-diligence", "transformative-experience"]
keywords = ["individual risk map", "personalized risk", "risk profile", "personal risk assessment", "key-person risk", "individualized risk", "risk-benefit analysis", "vulnerability assessment"]
key_takeaway = "Population-level risk statistics rarely match the actual risk faced by a specific person. An individual risk map integrates the demographic baseline with the subject's specific situation, history, and vulnerabilities to produce a defensible, decision-ready assessment that respects the person rather than aggregating them away."
see_also = ["irb-review", "informed-consent", "risk-assessment"]
image = "/images/sections/glossary.png"
image_alt = "Individual Risk Map - Prismatic Platform"
+++

## Definice

**Mapa individuálních rizik** (*individual risk map*, IRM) je strukturovaný personalizovaný posudek, který převádí agregované statistiky rizika na obraz rizik, jimž čelí nebo která představuje konkrétní subjekt. Mapa spojuje:

- **výchozí riziko** (*baseline*) – prevalenci v populaci;
- **kontextové modifikátory** – lokalitu, roli, prostředí;
- **individuální faktory** – anamnézu, komorbidity, chování, zranitelnost;
- **časovou dynamiku** – změny v čase.

Výsledkem je podklad připravený k rozhodnutí. Může mít podobu kvantitativního skóre, kvalitativního popisu, strukturované matice nebo grafu, ale jeho definičním znakem je *individualizace*: odpovídá na otázku „jaké je riziko pro *tohoto* člověka?“, ne „jaké je průměrné riziko pro lidi, jako je on?“.

## Původ a kontext pojmu

Individualizace rizika se vyvinula souběžně v několika regulovaných oblastech:

- **klinický výzkum:** etické komise ([IRB review](@/glossary/irb-review.md)) stále častěji vyžadují individualizovanou analýzu rizik a přínosů místo souhrnů za populaci, zvláště u zranitelných účastníků a u zásahů s transformativní povahou ([transformative experience](@/glossary/transformative-experience.md));
- **AML/CFT compliance:** doporučení FATF a skupiny Wolfsberg požadují hloubkovou kontrolu klienta založenou na riziku, která rozlišuje politicky exponované osoby podle individuálních rizikových faktorů (jurisdikce, funkce, zdroj majetku), ne paušálně podle kategorie;
- **due diligence při fúzích a akvizicích:** posouzení rizika klíčové osoby hodnotí konkrétního zakladatele, generálního ředitele nebo technického lídra, jehož odchod by podstatně snížil hodnotu, a spojuje osobní, finanční, právní a reputační vektory ([due diligence](@/glossary/due-diligence.md));
- **ochranné operace:** individualizované posouzení hrozby je povinné u vedoucích pracovníků, veřejně známých osob a svědků.

Příbuzný princip pro zpracování osobních údajů v ČR i EU provádí čl. 35 GDPR (posouzení vlivu na ochranu osobních údajů, DPIA).

## Jak se projevuje

Dobrou mapu individuálních rizik poznáme podle toho, že:

- uvádí výchozí populační údaj a zdroj, z něhož pochází;
- výslovně říká, které individuální faktory riziko zvyšují a které snižují, a proč;
- odlišuje doložené skutečnosti od odhadů;
- vyjadřuje nejistotu (rozpětí, úroveň jistoty), ne jen bodové číslo;
- má datum a plán příští revize.

Varovné znaky: mapa, která se opírá o jedinou vlastnost osoby (národnost, diagnózu, náboženství); mapa bez zdrojů; mapa, která se nikdy neaktualizuje; mapa sdílená mimo okruh, pro který vznikla.

## Mechanismus

Spolehlivá mapa individuálních rizik vzniká ve čtyřech fázích:

1. **Stanovení výchozího stavu** – čerpá z ověřených populačních dat (epidemiologické registry, typologie finanční kriminality, kanály zpravodajství o hrozbách).
2. **Individualizace** – upravuje výchozí stav podle doložené historie subjektu, behaviorálních ukazatelů a kontextových faktorů.
3. **Validace** – ověřuje posouzení proti známým výsledkům (kde existuje ověřená pravda) nebo proti shodě odborníků.
4. **Komunikace** – předkládá mapu v podobě, podle které může rozhodující osoba jednat: ani přehnaně přesnou (falešná jistota), ani přehnaně vágní (žádná opora pro rozhodnutí).

Mapa se má přehodnocovat v určeném intervalu (u subjektů s nízkým rizikem ročně, u vyššího rizika nebo rychle se vyvíjejících případů častěji) a okamžitě po podstatné události (rozvod, obžaloba, změna role, změna jurisdikce). Klíčový požadavek tedy zní: mapa musí být aktualizována při každé podstatné změně okolností.

## Odlišení

- **Od [risk score](@/glossary/risk-score.md):** skóre je častý výstupní formát; mapa zahrnuje i zdůvodnění a nejistotu.
- **Od profilování:** profilování zařazuje člověka do kategorie podle podobnosti s ostatními; mapa individualizuje, a proto musí brát v úvahu i faktory, které riziko snižují.
- **Od diagnózy:** klinická diagnóza popisuje stav; mapa rizik popisuje pravděpodobnosti budoucích událostí a jejich kontext.

## Význam pro Kompendium

Na platformě Prismatic, z níž kniha vzešla, je mapa individuálních rizik relevantní pro posouzení klíčových osob v due diligence (zakladatel, generální ředitel, skutečný majitel – riziko klíčové osoby pro investora), pro výzkum (riziko a přínos individualizované pro konkrétního účastníka při získávání [informovaného souhlasu](@/glossary/informed-consent.md)), pro AML/KYC (rizikový profil politicky exponované osoby) a pro ochranné operace (posouzení hrozby pro chráněnou osobu).

V knize má pojem dvojí význam. Za prvé, výzkum i klinická práce s lidmi po EA vyžadují individuální posouzení rizika: kdo prošel dlouhodobou manipulací, může být zranitelnější vůči sugesci, retraumatizaci nebo nátlaku – viz [výzkum se zranitelnými populacemi](@/kompendium/research-methodology/vulnerable-population-research.md) a [zranitelné populace](@/kompendium/06-klinicke-aplikace/vulnerabilni-populace.md). Za druhé, mapa rizik je sama nástrojem moci: posudek o člověku může být zneužit k jeho kontrole nebo [delegitimizaci](@/glossary/delegitimizace.md). Kompendium proto připomíná [riziko stigmatizace](@/kompendium/critical-perspectives/12-EA-stigma-risk.md) a [EA jako nástroj moci](@/kompendium/critical-perspectives/18-EA-as-power-tool.md): mapa má sloužit ochraně subjektu, ne jeho zařazení.

## Obrana a zotavení

**Pro subjekt mapy:** mít právo vědět, že posouzení existuje (pokud to zákon nevylučuje), znát jeho základní podklady a opravit nepravdivé údaje – práva subjektu údajů podle GDPR.

**Pro zpracovatele:** minimalizovat údaje, oddělit doklady od odhadů, uvádět faktory snižující riziko, omezit přístup, plánovat revize, a v klinickém a výzkumném kontextu konzultovat mapu se subjektem samotným. U ochranných operací pro oběti EA navazují [krizové plánování](@/kompendium/prevention-resilience/13-rapid-response-protocol.md) a [ochrana svědků](@/kompendium/emergency-protocols/40-witness-protection.md).

## Literatura

- FATF: *Guidance for a Risk-Based Approach* (Financial Action Task Force, 2014, s pozdějšími aktualizacemi).
- Nařízení (EU) 2016/679 (GDPR), čl. 35 (posouzení vlivu na ochranu osobních údajů).

## Související

**Pojmy**

- [Risk Score](@/glossary/risk-score.md) – častý výstupní formát.
- [Informed Consent](@/glossary/informed-consent.md) – proces, který závisí na porozumění individuálnímu riziku.
- [IRB Review](@/glossary/irb-review.md) – orgán, který mapu ve výzkumu vyžaduje.
- [Due Diligence](@/glossary/due-diligence.md) – postup, jehož je mapa součástí.
- [Transformative Experience](@/glossary/transformative-experience.md) – kategorie vyžadující pečlivé individuální posouzení rizika.

**Kniha**

- [Výzkum se zranitelnými populacemi](@/kompendium/research-methodology/vulnerable-population-research.md) – individuální riziko ve výzkumu EA.
- [Riziko stigmatizace](@/kompendium/critical-perspectives/12-EA-stigma-risk.md) – kdy posouzení škodí.

**Mimo knihu**

- [Risk Assessment](https://prismatic-reality-com.github.io/prismatic-promo/glossary/risk-assessment/) – nadřazená metodika.
- [Risk Management](https://prismatic-reality-com.github.io/prismatic-promo/glossary/risk-management/) – provozní uplatnění.
