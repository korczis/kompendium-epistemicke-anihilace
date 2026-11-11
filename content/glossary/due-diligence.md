+++
title = "Due Diligence (náležitá péče, prověrka)"
weight = 50
description = "Soustavné prověření firmy, osoby nebo aktiva před transakcí či spoluprací: OSINT, entity resolution, sankční screening a křížově ověřené hodnocení rizika."

[taxonomies]
tags = ["glossary", "due-diligence", "osint", "compliance"]

[extra]
category = "intelligence"
status = "active"
author = "Tomas Korcak (korczis)"
difficulty = "intermediate"
technical_level = "intermediate-advanced"
domain_category = "compliance-intelligence"
related_concepts = ["kyc", "aml", "sanctions-screening", "beneficial-ownership", "entity-resolution"]
implementation_status = "production"
authority_level = "L3-strategic"
difficulty_rating = 6
prerequisites = ["osint", "compliance-framework", "risk-assessment", "knowledge-graph"]
learning_path = ["compliance-framework", "kyc", "aml", "due-diligence", "sanctions-screening", "entity-resolution"]
interactive_demos = ["/labs/glossary/due-diligence"]
code_examples = false
external_resources = ["https://www.fatf-gafi.org/en/publications/Fatfrecommendations/Fatf-recommendations.html", "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=celex%3A32015L0849", "https://www.sec.gov/education/smallbusiness/exemptofferings/due-diligence"]
version_introduced = "0.7.0"
stability_level = "stable"
testing_scenarios = ["entity-search-accuracy", "sanctions-hit-detection", "cross-source-validation", "risk-score-calibration", "false-positive-rate"]
related_terms = ["kyc", "aml", "sanctions-screening", "beneficial-ownership", "entity-resolution", "osint", "compliance-framework", "risk-score", "knowledge-graph", "triple-check"]
date_modified = "2026-11-10"
+++

## Definice

**Due diligence** (česky *náležitá péče*, v praxi *prověrka*) je soustavné prošetření
a vyhodnocení firmy, osoby nebo aktiva před uzavřením transakce, partnerství, investice nebo
spolupráce. Cílem je získat na důkazech založené porozumění finančnímu zdraví, právnímu
postavení, vlastnické struktuře, provozní odolnosti, pověsti a souladu s předpisy. Dnešní
prověrka přesahuje tradiční revizi dokumentů: zahrnuje automatizovaný sběr informací
z otevřených zdrojů, sjednocování entit napříč roztříštěnými datovými sadami (viz [Entity
Resolution](@/glossary/entity-resolution.md)), analýzu vztahů v grafu, detekci časových
vzorců, screening sankčních a sledovaných seznamů a strukturované hodnocení rizik podle
příslušných regulatorních rámců.

Prověrka má několik specializovaných podob: **obchodní** (postavení na trhu, konkurence,
koncentrace zákazníků), **finanční** (ověření tržeb, posouzení závazků, analýza pracovního
kapitálu), **právní** (soudní spory, soulad s předpisy, smluvní závazky), **technickou**
(technologie, duševní vlastnictví, technický dluh) a **compliance** (KYC/AML, [sankční
screening](@/glossary/sanctions-screening.md), identifikace politicky exponovaných osob,
ověření skutečných majitelů). Moderní platformy automatizují sběr dat a křížové ověřování
a lidskému úsudku ponechávají výklad a hodnocení rizika.

**Vztah ke knize:** prověrka je jedním z prostředí, pro která byla [taxonomie EA](@/glossary/taxonomie-ea.md) původně
vytvořena: posuzovatel potřebuje rozpoznat, zda zdroje, výpovědi a dokumenty nenesou stopy
manipulace. Kniha na prověrku odkazuje v heslech [Anihilační
fenomény](@/glossary/anihilacni-fenomeny.md), [DARVO](@/glossary/darvo.md) nebo [Ego
Death](@/glossary/ego-death.md).

## Přehled

Pojem má původ v právu cenných papírů – konkrétně v oddílu 11 amerického Securities Act
z roku 1933, který zavedl „obhajobu náležitou péčí“ pro upisovatele, kteří prokázali, že
před nabídkou cenných papírů provedli přiměřené šetření. V dalších desetiletích se pojem
rozšířil daleko za cenné papíry – na fúze a akvizice, rizikový kapitál, private equity,
komerční úvěry, partnerské smlouvy, výběr dodavatelů i regulatorní soulad.

Regulatorní tlak na prověrky od počátku 21. století výrazně vzrostl:

**Boj proti praní peněz (AML):** doporučení Finančního akčního výboru (FATF), směrnice EU
proti praní peněz (AMLD4, AMLD5, AMLD6) a jejich národní provedení ukládají finančním
institucím a „povinným osobám“ provádět hloubkovou kontrolu klienta (CDD) a zesílenou
kontrolu (EDD) u klientů, skutečných majitelů a transakcí.

**Poznej svého klienta (KYC):** regulatorní rámce včetně amerického USA PATRIOT Act, směrnic
EU a místních předpisů požadují ověřovat totožnost klientů, posuzovat jejich rizikový profil
a sledovat jejich transakce kvůli podezřelé činnosti.

**Sankční soulad:** předpisy OFAC (USA), EU, OSN a národních orgánů požadují screening proti
sankčním seznamům, identifikaci politicky exponovaných osob a odhalování sankcionovaných
vlastnických struktur skrytých za složitým vrstvením společností.

**Transparentnost skutečných majitelů:** pátá směrnice AML a národní registry (v Česku
evidence skutečných majitelů podle zákona č. 37/2021 Sb.) vyžadují identifikaci a ověření
skutečných majitelů; obvyklým orientačním prahem je podíl nebo kontrola nad 25 %.

Přechod od ruční k automatizované, zpravodajsky řízené prověrce je zásadní změnou
schopností. Ruční procesy s týmy analytiků procházejícími dokumenty nahradily systémy, které
paralelně dotazují stovky zdrojů, sjednocují entity v roztříštěných datech, mapují grafy
vlastnictví, odhalují sankční shody přibližným porovnáním a vytvářejí skóre rizika – za
minuty místo týdnů.

## Srovnání s alternativami

Ceny konkurenčních služeb, které původní heslo uvádělo, kniha vynechává jako neověřené;
tabulka srovnává jen zdroje, automatizaci a model provozu.

| Platforma | Zdroje | Automatizace | Vlastní provoz |
|----------|---------|------------|-------------|
| **Refinitiv World-Check** | globální PEP a sankce, média | screening a ruční revize | ne (jen SaaS) |
| **Dow Jones Risk & Compliance** | globální sankce, negativní zprávy | screening a výstrahy | ne (jen SaaS) |
| **LexisNexis Risk Solutions** | rejstříky USA a světa, spory | poloautomatizované | ne (jen SaaS) |
| **OpenSanctions** | globální sankce a PEP | jen data, bez procesu | ano (data) |
| **Maltego** | transformace OSINT | založené na transformacích | desktopová aplikace |

## Osvědčené postupy

1. **Rozmanitost zdrojů:** u každého údaje dotazovat více nezávislých zdrojů. Zjištění
   z jediného zdroje je ze své podstaty nespolehlivé; metodika triple-check vyžaduje tři
   nezávislé potvrzující zdroje.
2. **Nejdřív sjednotit entity:** před analýzou sjednotit identity entit napříč zdroji. Tatáž
   entita se může objevovat pod různými jmény, identifikátory a přepisy; bez sjednocení je
   hodnocení roztříštěné a neúplné.
3. **Procházet řetězce vlastnictví:** sledovat vlastnictví až ke skutečným majitelům. Složité
   struktury s fiktivními společnostmi, svěřenskými fondy a nominee uspořádáními mohou být
   navrženy tak, aby zakryly sankcionované nebo rizikové vlastnictví.
4. **Časová analýza:** zkoumat nejen současný stav, ale i historické vzorce. Odstoupení
   členů orgánů krátce před vynucovacími opatřeními, změny vlastnictví v době sankčních
   rozhodnutí nebo posuny finančních vzorců mohou ukazovat na riziko, které snímek
   současného stavu nezachytí.
5. **Kalibrace přibližného porovnání:** pečlivě nastavit prahy sankčního screeningu. Příliš
   přísný práh (> 0,95) přehlédne varianty přepisu a aliasy, příliš volný (< 0,80) vytvoří
   nadměrné množství falešných shod. Výchozí hodnota platformy 0,85 vyvažuje citlivost
   a přesnost.
6. **Screening negativních zpráv:** vedle rejstříků a sankcí zahrnout strukturovaný screening
   médií. Negativní zprávy často předcházejí formálním vynucovacím opatřením a dávají včasné
   varování.
7. **Průběžné sledování:** prověrka není jednorázovým úkonem. U trvajících vztahů je třeba
   sledovat změny sankčních seznamů, rejstříků, skutečných majitelů a zpráv.
8. **Auditní stopa:** vést neměnnou stopu každého dotazu, odpovědi zdroje, rozhodnutí
   o shodě a hodnocení rizika. Regulátoři vyžadují doložitelný průběh prověrky (srov. [Chain
   of custody](@/glossary/chain-of-custody.md)).

## Časté chyby

1. **Screening jen podle jména:** porovnávat jen hlavní jméno bez aliasů, přepisů, dřívějších
   jmen a spojených entit. Tak se přehlédnou shody, které používají jiný pravopis nebo jinou
   podobu jména.
2. **Přehlížení vlastnických struktur:** prověřit jen přímou protistranu bez řetězců
   vlastnictví. Sankcionované osoby často působí přes vrstvy fiktivních společností
   a nominee uspořádání.
3. **Zastaralá data:** spoléhat na data z mezipaměti nebo zřídka aktualizovaná. Sankční
   seznamy, rejstříky i evidence skutečných majitelů se mění průběžně.
4. **Falešná jistota z automatizace:** brát výsledky automatického screeningu jako konečné bez
   lidské revize. Automatizace vyniká ve sběru dat a porovnávání vzorů, ale nenahradí lidský
   úsudek při výkladu a hodnocení rizika.
5. **Slepota k jurisdikcím:** uplatňovat jednu metodiku všude bez ohledu na místní předpisy,
   dostupné zdroje a zvyklosti pojmenování.
6. **Strnulé prahy:** používat pevné prahy bez kontextu. Skóre podobnosti 0,87 může být
   jasnou shodou u krátkého jména („Li Wei“), ale falešnou shodou u dlouhého názvu firmy
   s běžnými slovy.
7. **Chybějící negativní indikátory:** soustředit se jen na to, co bylo nalezeno, a ne na to,
   co chybí. Absence očekávaných záznamů v rejstřících, finančních výkazů nebo webové
   přítomnosti může být významnější než kterékoli jednotlivé zjištění.
8. **Nedostatečná dokumentace:** neprovést záznam metodiky, dotázaných zdrojů, zjištění
   a rozhodnutí. Neúplná dokumentace podkopává regulatorní hodnotu celého procesu.

## Případy užití

### Prověrka před investicí

Fondy rizikového kapitálu a private equity prověřují cílové firmy před investicí. Proces
dotazuje české rejstříky na finanční zdraví, obchodní rejstřík na strukturu společnosti,
evidenci skutečných majitelů, sankční seznamy kvůli souladu a globální zdroje OSINT kvůli
pověsti.

### Soulad KYC/AML

Finanční instituce a povinné osoby provádějí hloubkovou a zesílenou kontrolu klienta, jak ji
vyžadují předpisy AML. Automatizovaný proces výrazně zkracuje čas přijetí klienta
a zachovává regulatorní soulad.

### Hodnocení rizika dodavatelů

Organizace posuzují bezpečnostní stav a soulad dodavatelů. Šetření spojuje bezpečnostní hodnocení s prověrkou entity.

### Prověrka při fúzích a akvizicích

Fúze a akvizice vyžadují komplexní prošetření cílové firmy po finanční, právní, technické
i compliance stránce. Sběr z více zdrojů a sjednocování entit zkracuje fázi sběru dat
z týdnů na hodiny.

### Sledování sankčního souladu

Organizace podléhající sankčním předpisům průběžně prověřují protistrany, skutečné majitele
a účastníky transakcí proti sankčním seznamům EU, OFAC a OSN. Engine přibližného porovnání
zvládá varianty jmen, přepisy a aliasy.

## Související pojmy

Bez vlastního hesla v glosáři knihy: *KYC*, *AML*, *Beneficial Ownership* (skuteční majitelé),
*Triple Check* (křížové ověření třemi zdroji), *Knowledge Graph*, *Security Rating*, *Audit
Trail* a *Confidence Scoring*.

## Související

- [Sanctions Screening](@/glossary/sanctions-screening.md) – automatický screening sankčních
  seznamů.
- [Entity Resolution](@/glossary/entity-resolution.md) – sjednocování identit napříč zdroji.
- [Risk Score](@/glossary/risk-score.md) – kvantifikované hodnocení rizika.
- [Compliance Framework](@/glossary/compliance-framework.md) – regulatorní rámce souladu.
- [OSINT](@/glossary/osint.md) – zpravodajství z otevřených zdrojů.
- [Chain of custody](@/glossary/chain-of-custody.md) – dokumentace, která dává prověrce
  důkazní váhu.
