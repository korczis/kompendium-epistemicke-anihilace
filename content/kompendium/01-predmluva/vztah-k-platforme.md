+++
title = "1.6 Vztah ke Prismatic Platformě"
description = "Strukturální propojení kompendia s Prismatic Platformou — Decision Engine, OSINT framework, NABLA Infinity, Color Teams. Bidirectional feedback loop mezi taxonomií a empirickou validací."
weight = 6
insert_anchor_links = "right"

[taxonomies]
tags = ["kompendium", "predmluva", "platforma", "decision-engine", "nabla-infinity", "color-teams", "osint", "empiricka-validace"]
categories = ["academic", "platform-integration"]

[extra]
parent = "kompendium-01-predmluva"
section_icon = "🔗"
toc = true
+++

# 1.6 Vztah ke Prismatic Platformě

Kompendium není uzavřeným textovým artefaktem oddělitelným od kontextu jeho vzniku. Je **strukturálně propojeno** s [Prismatic Platformou](/) — soustavou nástrojů a systémů, která poskytuje empirický kontext pro testování, validaci a evoluci taxonomických tvrzení. Tato kapitola popisuje toto propojení, jeho motivaci, operační implementaci a důsledky pro práci s kompendiem.

## Motivace pro platformovou integraci

Klasické psychiatrické a kognitivně-vědecké taxonomie trpí dvěma chronickými problémy:

1. **Empirická paralýza** — taxonomická tvrzení jsou zřídka systematicky testována proti datům; revize probíhají v dlouhých cyklech (DSM-IV → DSM-5 zabralo 13 let).
2. **Praktická izolace** — taxonomie zůstávají referenčními manuály bez přímé operační aplikace v reálném čase.

Kompendium **explicitně odmítá** tento klasický model a místo toho přijímá architekturu **živé taxonomie** — taxonomie, která:

- Je permanentně testována proti reálným datům
- Generuje predikce verifikovatelné platformovými nástroji
- Eviduje deviation reports automaticky
- Cykluje revizemi v týdenních až měsíčních intervalech

Tato architektura je **fundamentální inovací** ve vztahu k tradičnímu modelu vědecké taxonomie a vyžaduje odpovídající integrační infrastrukturu.

## Přehled platformových komponent

| Komponenta | Funkce vzhledem ke kompendiu |
|------------|------------------------------|
| **Decision Engine** | Empirické testování indikátorů manipulace |
| **NABLA Infinity** | Modelování epistemické struktury argumentů |
| **OSINT Framework** | Sběr dat z reálných manipulativních operací |
| **Color Teams** | Operacionalizace bezpečnostních protokolů |
| **PrismaticDD** | Due diligence aplikace taxonomie |
| **Mycelial Intelligence** | Distribuovaná detekce vzorců napříč případy |
| **Audit Log** | Materializace etického dohledu |

## Decision Engine

[Decision Engine](/hub/dd/decisions/) je centrálním empirickým nástrojem pro testování taxonomických tvrzení.

### Strukturální propojení

Decision Engine implementuje **6-stupňovou pipeline**, která přímo odpovídá analytickým krokům doporučeným kompendiem:

1. **Normalize** — normalizace vstupních dat (analogie k explicitní artikulaci epistemického profilu)
2. **Signals** — extrakce manipulačních signálů (přímá implementace EA detekčních markerů)
3. **Sources** — analýza zdrojové diverzity (princip [epistemické triangulace](/kompendium/01-predmluva/jak-pouzivat/))
4. **Anomalies** — detekce anomálií (operacionalizace fenomenologických signatur)
5. **Score** — kalkulace risk skóre (kvantifikace rizika manipulace)
6. **Hypotheses** — generování alternativních hypotéz (princip diferenciální diagnostiky)

Každý EA-kód v kompendiu má odpovídající **detekční pravidlo** v Decision Engine. Při zpracování argumentu nebo komunikačního artefaktu engine:

- Identifikuje pravděpodobně přítomné techniky
- Kalkuluje konfidenční skóre pro každou
- Loguje detekce do audit logu
- Generuje doporučení defenzivních protiopatření

### Empirická validace

Detekce z Decision Engine slouží jako **empirický feed-back** pro taxonomii:

- **False positive analýza** — pokud detekční pravidlo systematicky generuje false positives, signalizuje to potřebu rafinovat definici techniky
- **False negative analýza** — pokud techniku rozpoznají experti, ale ne engine, indikuje to mezery v operacionalizaci
- **Inter-rater reliability** — porovnání detekcí mezi experty a engine kvantifikuje kvalitu taxonomie

Tato data jsou agregována do kvartálních **Taxonomy Health Reports**, které informují revize jednotlivých EA-kódů.

### Confidence calibration

Decision Engine implementuje [calibration loop](/hub/dd/decisions/calibration), který explicitně počítá s indikátory epistemické manipulace jako negativními signály pro confidence score. Toto napojení je důsledkem [etického principu](/kompendium/01-predmluva/eticke-aspekty/) — rozhodnutí přijatá pod vlivem manipulace by neměla být kvalifikována jako vysoce konfidenční bez explicitní verifikace.

## NABLA Infinity (∇∞)

[NABLA Infinity](/glossary/nabla-infinity/) je **epistemický engine** modelující strukturu argumentů na úrovni axiomů, inferencí a meta-inferencí.

### Vztah k taxonomii

NABLA Infinity formalizuje to, co kompendium popisuje narativně:

- **Axiomatická vrstva** — explicitní reprezentace epistemických předpokladů
- **Inferenční pravidla** — formální zachycení argumentačních kroků
- **Meta-inference** — reprezentace argumentů o argumentech (úroveň, na které operuje epistemická anihilace)

Mnoho technik kompendia **nelze adekvátně popsat** bez meta-inferenčního aparátu. Příklad: technika [imunizace proti falsifikaci (EA-1.3.1)](/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci/) operuje na meta-úrovni — modifikuje pravidla, podle kterých se hodnotí evidence, nikoli evidenci samotnou. NABLA Infinity poskytuje formalismus pro exaktní zachycení tohoto rozdílu.

### Empirická aplikace

NABLA Infinity zpracovává:

- Argumenty z politických debat
- Vědecké publikace v kontroverzních oborech
- Marketingové a propagandistické artefakty
- Soudní spisy (s respektováním právních omezení)

Výstupem je strukturovaný popis argumentu, který kompendium využívá k **operacionalizaci diferenciální diagnostiky** mezi legitimní intelektuální výměnou a manipulativní operací.

## OSINT Framework

[OSINT framework](/osint/) Prismatic Platformy poskytuje **128+ self-registering adapterů** pro sběr veřejně dostupných dat z různých zdrojů.

### Role ve vztahu ke kompendiu

OSINT framework slouží třem účelům:

1. **Data pro testování taxonomie** — reálné případy manipulativních operací
2. **Detekce probíhajících operací** — real-time monitoring suspectní aktivity
3. **Forenzní analýza** — rekonstrukce historie manipulativních kampaní

Specificky relevantní OSINT moduly:

- **Czech OSINT** (47 adaptérů) — sběr dat z českého informačního prostoru pro místní case studies
- **Global OSINT** — mezinárodní kontext, srovnávací analýza
- **Sanctions intelligence** — detekce aktérů spojených s vlivovými operacemi
- **Czech legal** — soudní rozhodnutí relevantní pro forenzní psychiatrii

### Přínos pro taxonomii

OSINT data umožňují **kalibraci taxonomických tvrzení** proti empirické realitě. Každý scénář v kompendiu (např. [Scénář F](/kompendium/03-zakladni-kategorie/scenar-f/), [G](/kompendium/03-zakladni-kategorie/scenar-g/), [H](/kompendium/03-zakladni-kategorie/scenar-h/)) je validován proti databázi reálných operací. Pokud taxonomický popis systematicky neodpovídá empirickým případům, je revidován.

## Color Teams

[Color Teams](/glossary/color-teams/) jsou operační skupiny implementující systematické bezpečnostní protokoly:

| Team | Funkce | Vztah ke kompendiu |
|------|--------|---------------------|
| **Red Team** | Adversariální testování | Aplikuje techniky kompendia v kontrolovaném prostředí |
| **Blue Team** | Defenzivní operace | Detekuje a neutralizuje útoky podle kompendia |
| **Purple Team** | Integrace Red+Blue | Iterativní zlepšování detekce |
| **Yellow Team** | Vývoj nástrojů | Implementuje detekční pravidla |
| **Green Team** | Compliance + audit | Validuje etické dodržování |

### Operacionalizace defensivních protokolů

Color Teams **operacionalizují** preventivní a intervenční strategie z kompendia. Každá strategie (např. "epistemická triangulace") má konkrétní implementaci v podobě:

- Operačního playbook pro Blue Team
- Detekčních pravidel pro Yellow Team
- Auditních kontrol pro Green Team

Tato operacionalizace převádí abstraktní doporučení kompendia do **executable security operations**.

### Bidirectional feedback

Color Teams reportují **každý detekovaný incident** zpět ke kompendiu skrze formalizovaný proces:

1. Incident detection → strukturovaný report
2. Triáž → klasifikace podle EA-kódů
3. Pattern analysis → identifikace nových subtypů nebo variant
4. Taxonomy revision → návrh aktualizace
5. Peer review → schválení revizí

Tento cyklus zajišťuje, že taxonomie **nezaostává za empirickou realitou**.

## PrismaticDD (Due Diligence)

[PrismaticDD](/hub/dd/) aplikuje taxonomii v kontextu **due diligence operací** — typicky v M&A transakcích, regulatorní compliance a forenzní investigaci.

### Aplikační doména

DD aplikace taxonomie zahrnuje:

- Detekci manipulativní rétoriky v korporátních prezentacích
- Identifikaci "narrative inconsistencies" mezi různými zdroji
- Verifikaci tvrzení proti veřejně dostupným důkazům
- Forenzní analýzu komunikačních vzorců

Tato doména poskytuje kompendiu **velmi specifické empirické výzvy** — pravděpodobnost a sázky manipulace jsou vyšší než v běžných sociálních interakcích, takže taxonomie je testována v adversariálním prostředí.

## Mycelial Intelligence

Mycelial Intelligence je **distribuovaný systém detekce vzorců** napříč případy a doménami. Funguje jako "imunitní systém" platformy:

- Identifikuje vzorce, které se opakují napříč zdánlivě nesouvisejícími případy
- Detekuje koordinované operace skrze cross-reference
- Navrhuje nové taxonomické kategorie pro recurrentní vzorce, které stávající kódy nepokrývají

Pro kompendium tato vrstva poskytuje **automatickou detekci** mezer v současné taxonomii.

## Audit Log

Každá interakce s kompendiem skrze platformu je logována. Audit log slouží:

- Bezpečnostnímu monitoringu (analýza anomálního chování)
- Etickému dohledu (compliance s [bezpečnostní klasifikací](/kompendium/01-predmluva/bezpecnostni-klasifikace/))
- Vědecké dokumentaci (historie využití taxonomie)
- Forenzní rekonstrukci (v případě incidentu)

## Bidirectional Feedback Loop

Centrální charakteristika integrace je **bidirectional feedback loop**:

```
Kompendium → Decision Engine: detekční pravidla
Decision Engine → Kompendium: empirická validace
Kompendium → Color Teams: defenzivní protokoly
Color Teams → Kompendium: incident reports
Kompendium → OSINT: vyhledávací heuristiky
OSINT → Kompendium: případové studie
Kompendium → NABLA: argumentační vzorce
NABLA → Kompendium: formalizace technik
```

Tento cyklus znamená, že **kompendium se učí** z empirické zkušenosti platformy a platforma **se zlepšuje** z theoretické práce kompendia. Žádná z těchto komponent není autonomní — vzájemná závislost je explicitním záměrem.

## Důsledky pro uživatele

Platformová integrace má pro uživatele kompendia konkrétní důsledky:

1. **Vyšší aktuálnost** — taxonomie je periodicky aktualizována na základě reálných dat (každý kvartál minor revize, každý rok major revize)
2. **Operační uplatnitelnost** — abstraktní popisy jsou doplněny konkrétními detekčními nástroji
3. **Verifikovatelnost** — taxonomická tvrzení mohou být přímo testována uživatelem
4. **Komunitní přispívání** — uživatelé s odpovídajícím oprávněním mohou přispívat k evoluci taxonomie

## Etické důsledky

Platformová integrace také vytváří specifické **etické závazky**:

- **Audit consent** — uživatel souhlasí s logováním pro účely etického dohledu
- **Sdílení anonymizovaných dat** — výzkumníci jsou povinni přispívat k empirické bázi (anonymizovaně)
- **Zodpovědnost za detekční pravidla** — uživatelé navrhující pravidla nesou zodpovědnost za jejich kvalitu
- **Transparentnost ofenzivního výzkumu** — Red Team aktivity musí být transparentně reportovány

## Limitace integrace

Platformová integrace **není** všespasitelnou. Specifické limitace:

1. **Závislost na infrastruktuře** — výpadek platformy paralyzuje validační cyklus
2. **Riziko cargo-kult empirismu** — kvantifikované metriky neznamenají automaticky validní taxonomii
3. **Cultural bias** — platforma je primárně testována v českém a anglo-saském kontextu
4. **Time lag** — empirická validace má inherent latenci

Tyto limitace jsou explicitně reportovány v každém Taxonomy Health Report.

## Související

- [Účel kompendia](/kompendium/01-predmluva/ucel-kompendia/)
- [Pro koho je určeno](/kompendium/01-predmluva/pro-koho-je-urceno/)
- [Etické aspekty a upozornění](/kompendium/01-predmluva/eticke-aspekty/)
- [Jak používat toto kompendium](/kompendium/01-predmluva/jak-pouzivat/)
- [Bezpečnostní klasifikace přístupu](/kompendium/01-predmluva/bezpecnostni-klasifikace/)
- [Definice epistemické a kognitivní anihilace](/kompendium/02-uvod/definice/)
- [Sekce 06: Klinické aplikace](/kompendium/06-klinicke-aplikace/)
- [Sekce 07: Teoretické reflexe](/kompendium/07-teoreticke-reflexe/)
- [Decision Engine](/hub/dd/decisions/)
- [Calibration Dashboard](/hub/dd/decisions/calibration/)
- [PrismaticDD](/hub/dd/)
- [OSINT Framework](/osint/)
- [Glossary: NABLA Infinity](/glossary/nabla-infinity/)
- [Glossary: Color Teams](/glossary/color-teams/)
- [Philosophy: Epistemic Integrity](/philosophy/epistemic-integrity/)
- [Philosophy: Boundary Ethics](/philosophy/boundary-ethics/)

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [Glossary](/glossary/) | [Philosophy](/philosophy/) | [Developer Portal](/developers/)
