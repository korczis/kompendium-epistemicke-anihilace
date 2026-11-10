+++
title = "2.7 Vztah ke Decision Engine a Color Teams"
description = "Operacionalizace EA-taxonomie přes Prismatic Decision Engine — confidence calibration, hypotheses, falsifikační kritéria, Color Teams jako adversariální testování."
weight = 7
insert_anchor_links = "right"

[taxonomies]
tags = ["kompendium", "uvod", "decision-engine", "color-teams", "due-diligence", "platform"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["metodologicke-poznamky", "teoreticke-zaklady", "vztah-k-nabla", "historicky-kontext"]
parent = "kompendium-02-uvod"
section_icon = "⚖️"
toc = true
+++

# 2.7 Vztah ke Decision Engine a Color Teams

Tato kapitola dokumentuje **operační most** mezi taxonomií epistemické anihilace a [Decision Engine](@/glossary/decision-core.md) Prismatic Platform. Zatímco kapitola [2.6 Vztah ke NABLA Infinity](@/kompendium/02-uvod/vztah-k-nabla.md) tematizuje **epistemickou infrastrukturu** (jak se formují přesvědčení), tato kapitola tematizuje **rozhodovací vrstvu** (jak se z přesvědčení stávají konsekventní akce). [Decision Engine](@/glossary/decision-engine.md) je vrstvou, kde [taxonomie EA](@/glossary/taxonomie-ea.md) získává **přímou operační relevanci** v due-diligence procesech, intelligence assessmentech a strategickém rozhodování.

## Decision Engine: architektura a doktrína

Decision Engine je 10-stage deterministická pipeline operující nad NABLA-konformními přesvědčenými. Pipeline transformuje **strukturovaný vstup** (text, aktéři, evidence) na **rozhodnutelný výstup** (verdikt, doporučení, dossier nejistoty). Stages:

1. **Normalize** — kanonizace vstupu, strip metadata
2. **Signals** — extrakce signálů
3. **Sources** — atribuce zdrojů (NABLA Axiom 7)
4. **Anomalies** — identifikace anomálií, deviací z baseline
5. **Actors** — modeling aktérů, jejich incentiv a behavioral profilů
6. **Score** — kvantitativní confidence scoring
7. **Uncertainty** — explicitní decomposition epistemické a aleatorické nejistoty
8. **Hypotheses** — formace multiple paralelních hypotéz s falsifikačními kritérii
9. **Recommend** — doporučení akce s podmíněnými variantami
10. **Explain** — generování vysvětlitelné reasoning trace

Každý stage je **auditovatelný** — výstup obsahuje plnou traceability nazpět ke vstupním signálům. Tato traceabilita je strukturní obrana proti **[EA-1.3.3](@/kompendium/techniques/ea-1-3-3-tematicka-diverze.md) Tematické diverzi**: rozhodnutí musí být dohledatelné na konkrétní evidenci, nikoli „vyplynou z celkového dojmu“.

## Confidence Calibration jako defenzivní mechanismus

**Confidence calibration** je strukturní obrana proti dvěma kategoriím útoků:

### Obrana proti false certainty
Decision Engine vynucuje **explicitní confidence skóre** na každém klíčovém výstupu. Score je dekomponováno na:

- **Epistemická nejistota** — neurčitost vyplývající z **omezené evidence** (lze redukovat sběrem dat)
- **Aleatorická nejistota** — neurčitost vyplývající z **inherentní stochasticity** procesu (nelze redukovat dalším sběrem)

Toto rozlišení je strukturně klíčové: subjekty zranitelné vůči manipulaci typicky **kompresují obě nejistoty** do jednoho skóre, což otvírá prostor pro útoky exploitující mezeru. Decision Engine udržuje obě explicitně oddělené.

### Obrana proti analysis paralysis
Confidence score je **monotónní akumulační funkce** evidence. Pokud evidence dosáhne kalibrované thresholdové hodnoty (typicky 0.95 pro kritická rozhodnutí), systém přechází z exploration phase do execution phase. Tento mechanismus předchází **[EA-1.3.1](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md) Imunizaci proti falsifikaci** v opačném směru: subjekt nemůže donekonečna odkládat rozhodnutí požadováním „ještě více evidence“.

### Brier Score a kalibrační loop
Decision Engine kontinuálně monitoruje **Brier score** — kvadratickou odchylku predikované konfidence od realizovaného výsledku. Brier score umožňuje detekci **systematických miscalibrations** — situací, kdy systém je systematicky příliš sebejistý nebo příliš nejistý. Tento feedback loop neutralizuje **[EA-1.3.2](@/kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md) Strategickou reinterpretaci** — konfidenční tvrzení nelze zpětně reinterpretovat, jsou kontinuálně testována proti realitě.

## Hypotheses + Falsifikační kritéria

Stage 8 (Hypotheses) je **strukturní obrana proti EA-1.3.1 Imunizaci proti falsifikaci**. Mechanismus:

- Pro každé klíčové rozhodnutí systém **generuje multiple paralelní hypotézy** (minimálně tři: dominantní, kompetitivní, null-hypotéza)
- Pro každou hypotézu jsou **explicitně formulována falsifikační kritéria** — observabilní události, jež by hypotézu vyvrátily
- Sběr evidence je **prospektivně testován** proti falsifikačním kritériím — nikoli retrospektivně přizpůsobován dominantní hypotéze

Tento mechanismus operacionalizuje **Popperovský princip**: vědecká (a tudíž epistemicky robustní) hypotéza musí specifikovat podmínky **vlastního vyvrácení**. Subjekty zranitelné vůči EA-1.3.1 dramaticky této operaci selhávají — jejich přesvědčení nemá specifikované podmínky, za nichž by je opustily.

## Source Diversity Enforcement

Stage 3 (Sources) implementuje strukturní obranu proti **[EA-1.1.1](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md) Selektivní expozici**:

- **Source plurality requirement** — minimum 2 nezávislé zdroje (NABLA Axiom 1)
- **Independence verification** — explicitní test, zda zdroje sdílejí společný origin (NABLA Axiom 6)
- **Diversity scoring** — kvantitativní metrika diverzity (typologie, geografická distribuce, methodologie)

Source diversity je **kritický mechanismus** v due-diligence kontextech. Manipulativní aktéři často exploitují **iluzorní pluralitu** — desítky článků reflektujících jediný source. Decision Engine eksplicitně tuto iluzi prokopává: deset článků sdílejících press release počítá jako **jeden** signál, nikoli deset.

## Audit Log a Provenance Chain

Audit log je strukturální obrana proti **EA-1.3.3 Tematické diverzi**. Každé rozhodnutí má **plnou provenance chain** — neporušený řetěz odkazů na evidenci, inferenční pravidla a raw data, jež k němu vedly.

Provenance chain umožňuje:

- **Audit** — externí reviewer může každé rozhodnutí vystopovat zpět ke zdrojovým datům
- **Debugging** — když je rozhodnutí špatné, provenance identifikuje, který krok selhal
- **Accountability** — provenance establishes, kdo (či který agent) produkoval každou komponentu reasoning chain
- **Resistance to retroactive manipulation** — historie rozhodnutí je strukturně chráněna proti zpětné úpravě

## Color Teams: adversariální testování v provozu

[Color Teams](@/glossary/color-teams.md) operují jako **strukturální adversariální vrstva** Prismatic Platform. Šest týmů (Gray, Red, Blue, Purple, White, Black) testuje robustnost Decision Engine vůči taxonomicky popsaným útokům **kontinuálně**, v isolovaném sandbox prostředí, výhradně na syntetických datech.

### Mapování Color Teams na EA-taxonomii

| Tým | Operační role | Vztah k taxonomii |
|-----|----------------|--------------------|
| **[Gray Team](@/glossary/gray-team.md)** | Boundary exploration | Identifikuje **mezery** v specifikaci, kde mohou útoky proklouznout |
| **[Red Team](@/glossary/red-team.md)** | Adversarial simulation | Implementuje konkrétní EA-techniky proti systému |
| **[Blue Team](@/glossary/blue-team.md)** | Epistemic defense | Udržuje obrany, syntetizuje signály pod NABLA constraints |
| **[Purple Team](@/glossary/purple-team.md)** | Synthesis & closure | Mapuje Red findings na Blue defenses, certifikuje closure |
| **[White Team](@/glossary/white-team.md)** | Constructive verification | Formálně verifikuje (Lean4) defenzivní invariantní vlastnosti |
| **[Black Team](@/glossary/black-team.md)** | Theoretical threat modeling | Modeluje teoretické worst-case útoky, včetně dosud nepozorovaných |

### Red Team útočné primitives

Red Team operuje s pěti definovanými útočnými primitives, jež strukturně korespondují s kategoriemi EA-taxonomie:

| Red primitive | EA kategorie | Mechanismus |
|----------------|----------------|-------------|
| **Truth Distortion** | EA-1.x.x (informační) | Vstup falešných tvrzení s vysokou plauzibilitou |
| **Confidence Manipulation** | EA-1.3.x (inferenční) | Atak na confidence calibration |
| **Signal Poisoning** | EA-1.1.x (akviziční) | Kontaminace zdrojových signálů |
| **Drift Induction** | Long-term EA | Sub-threshold akumulace, jež se eventuálně manifestuje jako shift |
| **Salience Hijacking** | EA-1.4.x, 1.3.3 | Manipulace s tím, **co** subjekt považuje za důležité |

Red Team scenario taxonomie obsahuje **329 entries** organizovaných podle attack primitive, target subsystem a complexity level. Každý scénář obsahuje preconditions, execution steps, expected indicators a detection signatures.

### 4-condition Closure

Purple Team vyžaduje **čtyři současné podmínky** pro deklaraci closure security findingu — předchází false closure (zdánlivě vyřešený útok, jenž se reaktivuje v jiné formě):

1. **Red Team confirmation** — útok již nereaguje
2. **Blue Team confirmation** — defense je aktivní
3. **White Team confirmation** — formální vlastnosti drží
4. **Purple Team confirmation** — žádné regression indikátory

## Due Diligence operační kontext

V kontextu **due-diligence** procesů (M&A, dodavatelské vetting, beneficial ownership analyse) Decision Engine operacionalizuje EA-taxonomii jako následující defenzivní stack:

1. **Vstupní evidence** musí splňovat NABLA Axiom 1 (minimum 2 zdroje) a Axiom 6 (independence check) — obrana proti EA-1.1.1
2. **Kontradikce** mezi zdroji jsou **preservovány** a propagovány do finálního dossier — obrana proti cherry picking
3. **Časové stamps** jsou mandatorní s decay function — obrana proti zneužití zastaralých dat
4. **Provenance chain** je auditovatelná — obrana proti EA-1.3.3
5. **Confidence score** je explicitní s decomposition — obrana proti false certainty
6. **Multiple hypotézy** s falsifikačními kritérii — obrana proti EA-1.3.1
7. **Color Teams** kontinuálně testují robustnost — adversariální feedback loop

Tato sedmivrstvá architektura představuje **strukturní operační doktrínu** Prismatic platform pro vysoce kritická rozhodnutí.

## Reálné případy použití

### Case 1: Beneficial Ownership Analysis
Subjekt due-diligence analýzy systematicky maskuje vlastnickou strukturu skrze nominee shareholders, offshore vrstvy a komplexní sub-entitní vztahy ([EA-1.2.3](@/kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md) Iluzorní komplexita). Decision Engine reaguje:

- Source diversity check identifikuje, že „nezávislé“ zdroje (corporate registries, news, sanctions lists) sdílí společné chybějící informace
- Pattern Detection (L5) identifikuje strukturní podpis komplexitního maskingu
- Multiple hypotézy se generují (legitimní komplexnost vs. úmyslné maskování)
- Falsifikační kritéria specifikují, jaké další signály by hypotézu maskingu vyvrátily

### Case 2: Sanctions Evasion Detection
Adresát se snaží evadovat sankce skrze rebranding, intermediate entities a falešnou substituci kontrolního subjektu (EA-1.3.2 Strategická reinterpretace v doméně identity). Decision Engine reaguje:

- Provenance tracking identifikuje rebranding events s timestamps
- Time decay penalizuje evidenci pre-rebranding
- Contradiction Preservation udržuje obě verze identity v grafu
- Confidence calibration explicitně reflektuje vysokou epistemickou nejistotu

### Case 3: Information Operations Detection
Mediální landscape obsahuje koordinovanou disinformační kampaň využívající techniky EA-1.1.1 (selektivní expozice) + [EA-1.2.2](@/kompendium/techniques/ea-1-2-2-falesna-ekvivalence.md) (falešná ekvivalence) + EA-1.4.x (emocionální modulace). Decision Engine reaguje:

- Source independence verification odhaluje koordinovaný origin
- Pattern Detection identifikuje signature koordinované kampaně
- Confidence scoring penalizuje signály s nízkou independence
- Color Teams Red kontinuálně testují strukturní odolnost

## Limitace a hranice operacionalizace

Operacionalizace EA-taxonomie přes Decision Engine má strukturní limitace:

- **Nepokrývá in-person manipulaci** — fyzicky-prostorové techniky (EA-1.5.x) jsou mediovány až po průchodu strukturní vrstvou
- **Závisí na kvalitě vstupních dat** — pokud jsou primary signals systematicky kontaminovány, žádná downstream defense nemůže garantovat correctness
- **Performance trade-offs** — striktní enforcement axiomů má computation cost; latency-critical aplikace vyžadují pečlivou kalibraci
- **Není automaticky robustní vůči novým třídám útoků** — vyžaduje kontinuální update na základě taxonomických nálezů a Color Teams findings
- **Vyžaduje strukturně formátovaná data** — non-textuální signály vyžadují předcházející preprocessing layer

## Reflexivní vztah

Vztah taxonomie a Decision Engine je **dvojsměrný**:

1. **Taxonomie informuje Engine** — Nově identifikované útoky vedou k posílení relevantních pipeline stages a Color Teams scenarios
2. **Engine testuje taxonomii** — Color Teams provoz odhaluje **operacionalizovatelnost** taxonomicky popsaných útoků; útok, jenž nelze konkrétně simulovat, je signál nedostatečné operační specifikace v taxonomii

Tato reflexivní symbióza je jádrem **evolučního charakteru** integrovaného systému: jak taxonomie, tak Decision Engine se kontinuálně vyvíjejí na základě vzájemných nálezů.

## Související

- [2.1 Definice](@/kompendium/02-uvod/definice.md)
- [2.2 Historický kontext](@/kompendium/02-uvod/historicky-kontext.md)
- [2.3 Teoretické základy](@/kompendium/02-uvod/teoreticke-zaklady.md)
- [2.4 Metodologické poznámky](@/kompendium/02-uvod/metodologicke-poznamky.md)
- [2.5 Filosofický rámec](@/kompendium/02-uvod/filosoficky-ramec.md)
- [2.6 Vztah ke NABLA Infinity](@/kompendium/02-uvod/vztah-k-nabla.md)
- [Glosář: Decision Core](@/glossary/decision-core.md)
- [Glosář: Color Teams](@/glossary/color-teams.md)
- [Glosář: NABLA Infinity](@/glossary/nabla-infinity.md)
- [Glosář: Epistemic Pipeline](@/glossary/epistemic-pipeline.md)
- [Glosář: 3NL](@/glossary/3nl.md)
- [Glosář: Epistemická anihilace](@/glossary/epistemicka-anihilace.md)
- [Glosář: Kognitivní anihilace](@/glossary/kognitivni-anihilace.md)
- [Glosář: Anankastický režim](@/glossary/anankasticky-rezim.md)
- {{ <cross_link path="/hub/dd/decisions/" text="Decision Engine LiveView" /> }}
- [Sekce 03 — Základní kategorie](@/kompendium/03-zakladni-kategorie/_index.md)

## Kritický krok

**Než přejdeš ke konkrétním kategoriím**, formuluj si vlastní pracovní
[definici epistemické anihilace](@/glossary/epistemicka-anihilace.md) a zapiš si ji
mimo tuto stránku (papír / zápisník / poznámka). Tato definice se bude
v průběhu četby měnit — to je žádoucí. Ale výchozí zápis je nepostradatelný
referenční bod pro detekci vlastního posunu pochopení.

> **Mandatorní akce**: bez vlastní výchozí definice četba dalších sekcí
> riskuje, že se ti vlastní pochopení rozplyne v autorské formulaci.
