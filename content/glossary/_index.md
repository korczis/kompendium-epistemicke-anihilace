+++
title = "Glosář"
description = "Terminologický rejstřík Kompendia: pojmy epistemické anihilace, kliniky, filozofie a manipulace i pojmy platformy (architektura, agenti, zpravodajství, bezpečnost)."
sort_by = "title"
template = "glossary/list.html"
page_template = "glossary/detail.html"

[extra]
author = "Tomas Korcak (korczis)"
difficulty = "beginner"
image = "/images/sections/glossary.png"
image_alt = "Glosář Kompendia a terminologie Prismatic Platform"
og_type = "article"
twitter_card = "summary_large_image"
academic_tier = "documentation"
content_version = "3.1.0"
last_enhanced = "2026-11-10"
related_articles = ["3nl", "aiad", "nabla"]
glossary_terms = ["glossary", "terminology", "cross-reference"]
keywords = ["glosář", "terminologie", "epistemická anihilace", "OSINT", "Elixir OTP", "kybernetická bezpečnost", "epistemický rámec", "agenti AI"]
tags = ["glossary", "terminology", "reference", "documentation"]
see_also = ["architecture", "capabilities", "agents"]
total_terms = 225
categories_count = 8
date_modified = "2026-11-10"
+++

Terminologický rejstřík Kompendia epistemické a kognitivní anihilace. Glosář vznikl jako
terminologická vrstva Prismatic Platform, z níž kniha vzešla (původně 225+ hesel v sedmi
kategoriích: architektura, doktrína, agenti, zpravodajství, bezpečnost, epistemika
a technologie); postupně do něj přibyla hesla samotné knihy – pojmy epistemické anihilace,
kliniky traumatu, filozofie poznání a manipulačních vzorců. Každé heslo obsahuje definici,
kontext a odkazy na související pojmy.

## Abstrakt

Prismatic Platform působí na průsečíku několika technických oborů: inženýrství
distribuovaných systémů, zpravodajství z otevřených zdrojů, epistemického usuzování,
orchestrace autonomních agentů a správy vnější útočné plochy. Každý obor přináší vlastní
slovník a platforma k tomu zavádí nové pojmy, které jinde nemají ustálenou definici.
Kompendium přidává další vrstvu: psychologii a psychiatrii traumatu, filozofii poznání
a jazyka, sociologii kontroly a právo. Glosář slouží jako autoritativní terminologický
rejstřík s přesnými definicemi uspořádanými do kategorií. Hesla sledují jednotnou strukturu,
takže čtenář se může z kteréhokoli vstupního bodu dopracovat k souvislému porozumění.

Glosář není statickým slovníkem. Je to živý rejstřík, který se vyvíjí spolu s knihou
i platformou: přibývají nová hesla, definice se zpřesňují a křížové odkazy udržují
sémantickou síť, která spojuje jednotlivé pojmy v celek.

## Úvod

### Proč na terminologii záleží

Rozsáhlé projekty hromadí terminologii rychleji, než ji stačí neformální dokumentace
zachytit. Bez strukturovaného glosáře získá tentýž pojem v různých částech různá jména, noví
přispěvatelé si ustálené výrazy vykládají chybně a odborné diskuse se mění ve spory
o definice místo o podstatu.

Platforma byla vůči terminologickému posunu zvlášť zranitelná ze tří důvodů. Za prvé
zasahuje do více oborů – Elixir/OTP, OSINT, kybernetická bezpečnost, epistemická logika,
formální verifikace –, z nichž každý má vlastní ustálený slovník. Za druhé zavádí nové pojmy
([NABLA Infinity](@/glossary/nabla-infinity.md), [Trinity Gate](@/glossary/trinity-gate.md),
[3NL](@/glossary/3nl.md), [Color Teams](@/glossary/color-teams.md)), které nemají vnější
definice, na něž by šlo odkázat. Za třetí její autonomní agenti, příkazy a aplikace OTP
(v době zápisu 404+ agentů, 210+ příkazů a 90 aplikací) vytvářejí kombinatorickou explozi
pojmenovaných entit, které je třeba od sebe rozlišit.

U knihy platí totéž s jiným obsahem: pojmy jako [gaslighting](@/glossary/gaslighting.md),
[coercive control](@/glossary/coercive-control.md) nebo [disociace](@/glossary/disociace.md)
mají v psychologii, psychiatrii, právu i běžné řeči odlišné významy. Glosář je ukotvuje
v literatuře a odlišuje je od příbuzných pojmů. Přesná terminologie je zde i obranou:
manipulace často pracuje právě s posouváním významu slov (srov. [Motte and
Bailey](@/glossary/motte-and-bailey.md)).

### Architektura správy znalostí

Glosář je terminologickou vrstvou širšího systému správy znalostí. Na hesla odkazují
kapitoly Kompendia, technické stránky, kazuistiky i protokoly. Systém křížových odkazů
zajišťuje, že čtenář, který narazí na neznámý pojem v jakémkoli dokumentu, jej může dohledat
k jeho kanonické definici a odtud přejít k souvisejícím pojmům.

Vztah mezi glosářem a ostatními oddíly je obousměrný: kapitoly odkazují na hesla kvůli
přesným definicím, hesla odkazují na kapitoly kvůli hlubšímu kontextu. Vzniká tak
procházitelný graf znalostí místo lineární hierarchie dokumentů; jeho podobu ukazuje [mapa
knihy](@/kompendium/konceptualni-mapa/_index.md).

## Kategorie hesel

Hesla jsou uspořádána do kategorií; každá představuje samostatnou pojmovou oblast, mezi
kategoriemi však existuje mnoho křížových odkazů. Kategorie 1–7 pocházejí z platformy
(uvedené počty jsou z doby jejího zápisu), kategorie 8 sdružuje hesla Kompendia.

### 1. Architektura (22 hesel)

Pojmy popisující strukturální návrh platformy, běhové prostředí a topologii nasazení – od
virtuálního stroje BEAM a stromů supervize OTP po strukturu aplikací umbrella projektu
a vrstvu adaptérů úložiště.

**Příklady:** BEAM, OTP, Supervisor, GenServer, ETS, [3NL](@/glossary/3nl.md), [Adapter
Pattern](@/glossary/adapter-pattern.md), [Bounded Context](@/glossary/bounded-context.md),
Umbrella Application, Process Isolation, Message Passing.

Architektonické pojmy tvoří slovník potřebný k porozumění tomu, jak jsou aplikace OTP
platformy uspořádány, supervidovány a propojeny.

### 2. Doktrína (15 hesel)

Pojmy popisující provozní filozofii platformy, vynucování kvality a principy správy – od
mandátu kvality NO MERCY / NO DOUBTS po protokoly porušení, které jej vynucují.

**Příklady:** [NM/ND](@/glossary/nm-nd.md), [Clean Run](@/glossary/clean-run.md), [Zero
Warning Policy](@/glossary/zero-warning-policy.md), [Violation
Protocol](@/glossary/violation-protocol.md), [Regression Test](@/glossary/regression-test.md),
[Session Discipline](@/glossary/session-discipline.md), [Quality
Debt](@/glossary/quality-debt.md), [QDP](@/glossary/qdp.md).

Doktrinální pojmy vysvětlují, proč jsou některé vývojářské postupy vynucovány – nejen co
platforma dělá, ale podle jakých principů se staví a udržuje.

### 3. Agenti (18 hesel)

Pojmy popisující ekosystém autonomních agentů včetně jejich klasifikace, vzorců orchestrace
a standardu specifikace AIAD.

**Příklady:** [AIAD](@/glossary/aiad.md), [Agent](@/glossary/agent.md), [Agent
Tier](@/glossary/agent-tier.md), [Agent Registry](@/glossary/agent-registry.md), [Archer
Supreme](@/glossary/archer-supreme.md), [Supreme Commander](@/glossary/supreme-commander.md),
[Strategic Command](@/glossary/strategic-command.md), [Tactical
Execution](@/glossary/tactical-execution.md), [AutoEvolve](@/glossary/autoevolve.md),
[AutoHeal](@/glossary/autoheal.md).

Hesla popisují nejvýraznější schopnost platformy: hierarchický systém autonomních agentů od
taktických specialistů L1 po velitele nejvyššího oprávnění L5, řízený jednotným standardem
specifikace.

### 4. Zpravodajství (16 hesel)

Pojmy z oblasti OSINT a prověrek: metodiky sběru dat, typy zdrojů, analytické techniky
a vzorce slučování zpravodajství.

**Příklady:** [OSINT](@/glossary/osint.md), [EASM](@/glossary/easm.md),
[HAWKEYE](@/glossary/hawkeye.md), [Intelligence Fusion](@/glossary/intelligence-fusion.md),
[Entity Resolution](@/glossary/entity-resolution.md), [Sanctions
Screening](@/glossary/sanctions-screening.md), [Risk Score](@/glossary/risk-score.md),
[Due Diligence](@/glossary/due-diligence.md), [Shodan](@/glossary/shodan.md),
[Censys](@/glossary/censys.md), [GreyNoise](@/glossary/greynoise.md).

Zpravodajské pojmy propojují tradiční metodiku OSINT s automatizovanou implementací
platformy.

### 5. Bezpečnost (14 hesel)

Pojmy popisující bezpečnostní architekturu: adversariálně-obranný rámec Color Teams, řízení
přístupu podle rolí, analýzu útočné plochy a pojmy epistemické bezpečnosti. Bezpečnost zde
přesahuje tradiční bezpečnost aplikací o epistemický rozměr – ochranu integrity vědění
a přesvědčení.

**Příklady:** [Color Teams](@/glossary/color-teams.md), [Red Team](@/glossary/red-team.md),
[Blue Team](@/glossary/blue-team.md), [Purple Team](@/glossary/purple-team.md), [Gray
Team](@/glossary/gray-team.md), [White Team](@/glossary/white-team.md), [Black
Team](@/glossary/black-team.md), [Compliance Framework](@/glossary/compliance-framework.md),
[Epistemic Security](@/glossary/epistemic-security.md).

Zvláštní pozornost si zaslouží barevné týmy. Red Team a Blue Team jsou zavedené bezpečnostní
pojmy; platforma model rozšiřuje na šest týmů se specifickými epistemickými funkcemi, které
jdou nad rámec tradičního penetračního testování a obrany.

### 6. Epistemika platformy (18 hesel)

Pojmy epistemického rámce platformy: utváření přesvědčení, ověřování vědění, formální
verifikace a systém axiomů NABLA Infinity. Tato kategorie obsahuje nejvíce nových pojmů –
specifických pro přístup platformy k výpočetní epistemologii.

**Příklady:** [NABLA Infinity](@/glossary/nabla-infinity.md), [NABLA
Axioms](@/glossary/nabla-axioms.md), [Trinity Gate](@/glossary/trinity-gate.md), [Epistemic
Pipeline](@/glossary/epistemic-pipeline.md), [Signal Plurality](@/glossary/signal-plurality.md),
[QEVE](@/glossary/qeve.md), [Addiction Recovery](@/glossary/addiction-recovery.md), [Decision
Engine](@/glossary/decision-engine.md), [Decision Core](@/glossary/decision-core.md).

Tyto pojmy ukazují, čím se platforma liší od běžných softwarových systémů: nezpracovává jen
data, ale utváří o datech přesvědčení a ta před jednáním podrobuje formálnímu ověření.

### 7. Technologie (24 hesel)

Pojmy popisující konkrétní technologie, knihovny, nástroje a vnější služby technologického
zásobníku platformy – od programovacích jazyků a frameworků po databáze, vyhledávače
a infrastrukturu nasazení (Elixir, Phoenix, LiveView, Ecto, PostgreSQL, Meilisearch, KuzuDB,
Redis, Docker, Lean4, Ollama, Hex, Mix, Credo, Dialyzer). Většina z nich nemá v glosáři knihy
vlastní heslo; zmiňují se v kontextu hesel platformy.

### 8. Pojmy Kompendia

Hesla samotné knihy: fenomény, které narušují schopnost člověka poznávat a udržet si souvislý
obraz skutečnosti, a pojmy potřebné k jejich rozpoznání, prevenci a léčbě. Píší se podle
jednotného schématu (definice, původ pojmu, projevy, mechanismus, odlišení, význam pro
Kompendium, obrana a zotavení, literatura, související).

**Ústřední pojmy:** [Epistemická anihilace](@/glossary/epistemicka-anihilace.md), [Kognitivní
anihilace](@/glossary/kognitivni-anihilace.md), [Metakognitivní
destrukce](@/glossary/metakognitivni-destrukce.md), [Taxonomie EA](@/glossary/taxonomie-ea.md),
[Kompendium EA](@/glossary/kompendium-ea.md), [Anihilační
fenomény](@/glossary/anihilacni-fenomeny.md), [Anankastický
režim](@/glossary/anankasticky-rezim.md).

**Manipulační vzorce:** [Gaslighting](@/glossary/gaslighting.md), [DARVO](@/glossary/darvo.md),
[Coercive Control](@/glossary/coercive-control.md), [BITE model](@/glossary/bite-model.md),
[Double bind](@/glossary/double-bind.md), [Delegitimizace](@/glossary/delegitimizace.md),
[Love Bombing](@/glossary/love-bombing.md), [Firehose of
Falsehood](@/glossary/firehose-of-falsehood.md).

**Klinika a trauma:** [Betrayal trauma](@/glossary/betrayal-trauma.md),
[C-PTSD](@/glossary/c-ptsd.md), [Komplexní trauma](@/glossary/complex-trauma.md),
[Disociace](@/glossary/disociace.md), [Ego death](@/glossary/ego-death.md), [Default mode
network](@/glossary/default-mode-network.md).

**Filozofie a epistemologie:** [Komunikativní
racionalita](@/glossary/communicative-rationality.md), [Différance](@/glossary/differance.md),
[Embodied cognition](@/glossary/embodied-cognition.md), [Epistemická
injustice](@/glossary/epistemicka-injustice.md), [Fenomenologie](@/glossary/fenomenologie.md),
[Hermeneutika](@/glossary/hermeneutika.md).

**Informační prostředí:** [Epistemic bubble](@/glossary/epistemic-bubble.md),
[Deepfake](@/glossary/deepfake.md), [Deplatforming](@/glossary/deplatforming.md), [Epistemic
security](@/glossary/epistemic-security.md), [Dual-use poznání](@/glossary/dual-use-poznani.md).

**Právo a forenzní praxe:** [Chain of custody](@/glossary/chain-of-custody.md), [Forensic
Interview](@/glossary/forensic-interview.md), [Expert Witness](@/glossary/expert-witness.md),
[Pattern Evidence](@/glossary/pattern-evidence.md), [Undue
Influence](@/glossary/undue-influence.md).

## Architektonické pojmy – rozšířený přehled

Architektonické pojmy definují strukturní slovník platformy. Nejzákladnějším pojmem je
**BEAM** (Bogdan/Björn's Erlang Abstract Machine), virtuální stroj, na němž běží veškerý kód
Elixiru. BEAM poskytuje preemptivní plánování, sběr odpadu pro každý proces zvlášť a záruky
měkkého reálného času, na nichž stojí každé další architektonické rozhodnutí.

Na BEAM stojí **OTP** (Open Telecom Platform), knihovna, která poskytuje stromy supervize,
obecná chování serverů a primitiva distribuovaných systémů. OTP není volitelná
infrastruktura – je určujícím architektonickým vzorem. Každá stavová součást platformy žije
v supervidovaném stromu procesů.

Rámec **3NL** (Three Nested Levels) uspořádává tyto součásti do tří úrovní abstrakce:
úroveň 1 (provozní soulad), úroveň 2 (strategická koordinace) a úroveň 3 (systémová
emergence) – podrobnosti a jiný výklad úrovní uvádí heslo [3NL](@/glossary/3nl.md). Vrstvení
zajišťuje, že implementační podrobnosti nepronikají přes hranice a každá úroveň pracuje jen
s odpovídajícími abstrakcemi.

Klíčová primitiva OTP v glosáři: **GenServer** (obecné chování pro stavové procesy),
**Supervisor** (proces, který sleduje a restartuje podřízené procesy), **Dynamic Supervisor**
(pro procesy vytvářené za běhu), **ETS** (Erlang Term Storage pro operace klíč–hodnota
v paměti) a **Registry** (registrace a vyhledávání jmen procesů).

## Doktrinální pojmy – rozšířený přehled

Doktrinální slovník platformy se soustředí kolem **[NO MERCY, NO DOUBTS](@/glossary/no-mercy-no-doubts.md) (NM/ND)**, filozofie
vynucování kvality, jíž se řídí veškerý vývoj. NO MERCY požaduje nulovou toleranci
k neúplným implementacím, netestovanému kódu a porušením kvality. NO DOUBTS požaduje úplné
prošetření před akcí a ověření všech výsledků na základě důkazů.

NM/ND doplňují provozní pojmy jako **Clean Run** (kompilace s nulou varování, všechny testy
úspěšné, všechny brány kvality splněny), **Zero Warning Policy** (vynucení při kompilaci,
které bere varování jako chyby) a **Violation Protocol** (eskalační žebříček L1–L4 při
porušení doktríny).

**Quality Debt (QDP)** označuje nahromaděná porušení kvality, sledovaná a odstraňovaná
automatickým prohledáváním; platforma udržuje nulové QDP průběžným vynucováním. **Regression
Test** popisuje povinný postup, podle něhož musí každá oprava chyby obsahovat test, který by
původní chybu zachytil.

## Pojmy agentů – rozšířený přehled

Standard **AIAD** řídí všechny agenty platformy. Každý agent je zařazen do úrovně **Agent
Tier** od L1 (taktický specialista) po L5 (nejvyšší oprávnění). **Agent Registry** slouží
jako centrální katalog s mezipamětí ETS pro vyhledání v O(1) za běhu.

Na vrcholu hierarchie stojí **Archer Supreme**, agent L5 pro strategickou analýzu, který
koordinuje operace napříč doménami. Pod ním řídí agenti **Supreme Commander** strategii na
úrovni domén, zatímco agenti **Strategic Command** a **Tactical Execution** zvládají stále
užší operace.

**AutoEvolve** a **AutoHeal** popisují mechanismy sebezlepšování platformy. AutoEvolve hledá
příležitosti k optimalizaci a autonomně je aplikuje; AutoHeal odhaluje regrese kvality
a opravuje je bez lidského zásahu.

## Zpravodajské pojmy – rozšířený přehled

**OSINT** (zpravodajství z otevřených zdrojů) je sběr a analýza veřejně dostupných
informací. Platforma jej automatizuje stovkami adaptérů datových zdrojů a výsledky spojuje
**slučováním zpravodajství** (*Intelligence Fusion*) – syntézou signálů z více nezávislých
zdrojů do jednotných analytických výstupů.

**EASM** je bezpečnostní disciplína, kterou implementuje aplikace Prismatic Perimeter.
Objevuje, katalogizuje a sleduje aktiva organizace dostupná z internetu a přiřazuje jim
**skóre rizika** podle pozorovaných zranitelností a slabin konfigurace.

**Entity Resolution** řeší, zda záznamy z různých zdrojů patří téže skutečné entitě.
**Sanctions Screening** porovnává sjednocené entity se sankčními seznamy. Dohromady tvoří
proces prověrky (due diligence).

Z vnějších zpravodajských služeb glosář uvádí **Shodan** (vyhledávání zařízení připojených
k internetu), **Censys** (celointernetové skenování a transparentnost certifikátů)
a **GreyNoise** (analýza internetového „šumu na pozadí“).

## Bezpečnostní pojmy – rozšířený přehled

Rámec **Color Teams** uspořádává bezpečnostní operace do šesti specializovaných týmů:

| Tým | Funkce | Heslo |
|------|----------|----------------|
| **Gray** | průzkum hranic, hledání okrajových případů | [Gray Team](@/glossary/gray-team.md) |
| **Red** | adversariální simulace, epistemické útoky | [Red Team](@/glossary/red-team.md) |
| **Blue** | obranný postoj, slučování signálů | [Blue Team](@/glossary/blue-team.md) |
| **Purple** | syntéza Red–Blue, analýza uzavření | [Purple Team](@/glossary/purple-team.md) |
| **White** | konstruktivní ověřování, formální důkazy | [White Team](@/glossary/white-team.md) |
| **Black** | teoretické modelování hrozeb (maximální izolace) | [Black Team](@/glossary/black-team.md) |

**RBAC** (řízení přístupu podle rolí) řídí přístup k API a dashboardům. **Attack Surface**
(útočná plocha) označuje souhrn zvenčí dosažitelných koncových bodů, služeb a aktiv, na něž
by protivník mohl mířit.

## Technologické pojmy – rozšířený přehled

Technologický slovník pokrývá pět vrstev. Na úrovni jazyků: **Elixir** (funkcionální
programovací jazyk), **Erlang** (jazyk běhového prostředí) a **Lean4** (dokazovač vět
používaný k formální verifikaci v procesu QEVE).

Na úrovni frameworků: **Phoenix** (webový framework), **LiveView** (serverem vykreslované UI
v reálném čase), **Ecto** (databázová vrstva a generátor dotazů) a **Broadway** (knihovna pro
souběžné zpracování dat).

Na úrovni nástrojů: **Mix** (nástroj sestavení), **Hex** (správce balíčků), **Credo**
(statická analýza), **Dialyzer** (kontrola typů) a **ExUnit** (testovací framework).

Na úrovni infrastruktury: **PostgreSQL** (hlavní relační databáze), **Redis** (distribuovaná
mezipaměť), **Meilisearch** (fulltextové vyhledávání), **KuzuDB** (vestavěná grafová
databáze), **Docker** (kontejnerizace) a **Fly.io** (platforma nasazení).

Na úrovni AI: **Ollama** (lokální server inference), který platforma používá ke generování
a analýze kódu (v době zápisu s udávanou odezvou pod 3 sekundy).

## Systém křížových odkazů

Každé heslo končí oddílem se souvisejícími pojmy (v hesle platformy „See Also“, v heslech
knihy „Související“ se 6–12 vybranými odkazy podle druhu). Křížové odkazy tvoří procházitelný
graf, který čtenáři umožňuje zkoumat pojmová sousedství místo izolovaných hesel.

Topologie odkazů sleduje tři vzorce:

**Hierarchické odkazy** vedou k nadřazeným pojmům – například GenServer odkazuje na OTP a OTP
na BEAM; [C-PTSD](@/glossary/c-ptsd.md) odkazuje na [Komplexní
trauma](@/glossary/complex-trauma.md). Čtenář po nich může jít vzhůru k širším pojmům nebo
dolů ke konkrétním projevům.

**Laterální odkazy** spojují pojmy na stejné úrovni abstrakce – například [Red
Team](@/glossary/red-team.md) odkazuje na [Blue Team](@/glossary/blue-team.md) a [Purple
Team](@/glossary/purple-team.md), [DARVO](@/glossary/darvo.md) na
[Gaslighting](@/glossary/gaslighting.md). Pomáhají pochopit, jak se rovnocenné pojmy
doplňují.

**Odkazy napříč obory** spojují pojmy přes hranice kategorií – například [NABLA
Infinity](@/glossary/nabla-infinity.md) (epistemika) odkazuje na [Trinity
Gate](@/glossary/trinity-gate.md), ale i na [Color Teams](@/glossary/color-teams.md)
(bezpečnost) a [3NL](@/glossary/3nl.md) (architektura); [Epistemic
bubble](@/glossary/epistemic-bubble.md) (informační prostředí) odkazuje na [Selektivní
expozici](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md) (technika EA). Tyto odkazy
ukazují integrativní povahu celku.

### Příklad sítě křížových odkazů

Z hesla **EASM** může čtenář přejít takto:

```
EASM (intelligence)
  --> Attack Surface (security) --> Color Teams (security) --> Red Team (security)
  --> Security Rating (security) --> Risk Score (intelligence)
  --> NIS2 (security) --> RBAC (security)
  --> HAWKEYE (intelligence) --> OSINT (intelligence)
```
Síť zasahuje tři kategorie (zpravodajství, bezpečnost, architektura) a spojuje jediné
výchozí heslo s osmi souvisejícími pojmy, z nichž každý má vlastní odkazy, které graf dále
rozšiřují.

## Struktura hesla

### Původní struktura hesel platformy

Hesla platformy sledovala jednotnou třídílnou strukturu (definice, kontext, viz též), aby si
čtenář vytvořil předvídatelná očekávání:

```markdown
+++
title = "Term Name"
weight = 10
[extra]
description = "One-sentence summary of the term"
category = "category_name"
abbreviation = "ABBR"
related_terms = ["term-a", "term-b", "term-c"]
+++

## Definition

A precise, implementation-grounded definition of the term. Typically
two to four sentences. States what the thing IS, not what it does
or why it matters. Uses present tense and active voice.

## Context

How this term manifests within the Prismatic Platform specifically.
References concrete applications, modules, routes, or configurations.
Provides the bridge between abstract definition and practical usage.

## See Also

- Related Term A - Brief relationship note
- Related Term B - Brief relationship note
- Related Term C - Brief relationship note
```
Oddíl **Definition** odpovídá na otázku „co to je?“, pokud možno oborově neutrálně. Oddíl
**Context** odpovídá na otázku „jak to platforma používá?“ s konkrétními odkazy na
implementaci. Oddíl **See Also** odpovídá na otázku „co číst dál?“.

### Struktura hesel Kompendia

Hesla knihy jsou psána česky a podle podrobnějšího schématu: **Definice** · **Původ
a kontext pojmu** (obor, tradice, kdo pojem zavedl – jen tam, kde je to jisté) · **Jak se
projevuje** (pozorovatelné znaky) · **Mechanismus** (strukturálně, nikdy jako návod) ·
**Odlišení** (od podobných pojmů a klinických stavů) · **Význam pro Kompendium** (které
techniky, případy a protokoly pojem vysvětluje) · **Obrana a zotavení** · **Literatura**
(jen jistě existující díla) · **Související**. Hesla platformy jsou přeložena a doplněna
o větu, jak pojem souvisí s knihou.

### Pole metadat

Každé heslo nese strukturovaná metadata v hlavičce TOML:

| Pole | Účel | Příklad |
|-------|---------|---------|
| `title` | zobrazovaný název | `"NABLA Infinity"` |
| `weight` | pořadí v glosáři | `31` |
| `description` | shrnutí pro výpisy a vyhledávače (50–200 znaků, česky) | `"Epistemický rámec se 7 axiomy…"` |
| `[taxonomies] tags` | štítky pro výpisy a související stránky | `["glossary", "epistemic"]` |
| `category` | slug kategorie | `"epistemic"` |
| `abbreviation` | zkratka, je-li | `"NABLA"` |
| `related_terms` | slugy souvisejících hesel | `["trinity-gate", "three-nl"]` |

## Přidávání nových hesel

Glosář roste s knihou i platformou. Nové heslo se přidává, když:

1. **vznikne nový pojem**, který neodpovídá žádnému stávajícímu heslu (například když
   přibyl ověřovací proces QEVE, potřeboval vlastní heslo, protože žádný pojem nepokrýval
   spojení Lean4, NABLA a ověření Monte Carlo);
2. **stávající pojem se objevuje ve třech a více dokumentech** bez definice v glosáři; tento
   práh ukazuje, že pojem je dost používaný na formální definici;
3. **pojem je víceznačný napříč obory** – když totéž slovo znamená v různých kontextech něco
   jiného (např. „agent“ v OTP a „agent“ v AIAD, „disociace“ v klinice a v běžné řeči),
   samostatná hesla oba významy rozliší.

### Postup přidání

Nové heslo vznikne jako soubor Markdown `content/glossary/<slug>.md` s hlavičkou TOML podle
výše uvedených polí a podle schématu hesel Kompendia. Poté:

1. ověřit, že křížové odkazy vedou na existující stránky (sestavení webu nefunkční odkaz
   ohlásí jako chybu);
2. doplnit zpětné odkazy z alespoň jedné související stránky;
3. sestavit web a ověřit vykreslení.

### Kritéria kvality hesla

Dobře napsané heslo splňuje tato kritéria:

- **Přesnost:** definice je dost konkrétní, aby heslo odlišila od všech ostatních.
- **Ukotvenost:** heslo platformy odkazuje na konkrétní artefakty (moduly, trasy,
  konfigurace); heslo knihy na doložitelnou literaturu a na kapitoly Kompendia.
- **Procházitelnost:** křížové odkazy vytvářejí užitečné cesty k souvisejícím pojmům, ne jen
  k povrchně podobným.
- **Obranný rámec:** heslo knihy popisuje mechanismus tak, aby jej šlo rozpoznat, a vždy
  spolu s odlišením, obranou a zotavením (viz [Dual-use
  poznání](@/glossary/dual-use-poznani.md)).

## Závěr

Glosář je strukturovaným znalostním artefaktem, který slouží několika skupinám čtenářů
současně. Nováčkům nabízí vstupní bod do pojmové krajiny – stačí začít u kteréhokoli hesla
a postupovat po odkazech, dokud příslušná oblast není srozumitelná. Odborníkům (klinikům,
vyšetřovatelům, právníkům, výzkumníkům) dává sdílený slovník, který odstraňuje
nejednoznačnost. Přispěvatelům platformy poskytoval společný jazyk pro architektonické
diskuse, revize kódu a dokumentaci.

Jak se kniha i platforma vyvíjejí, glosář se vyvíjí s nimi, aby mezera mezi tím, co text
popisuje, a tím, co čtenář potřebuje vědět, zůstala co nejmenší.

## Odkazy

### Související oddíly

- [Kompendium](@/kompendium/_index.md) – hlavní text knihy, který hesla glosáře používá.
- [Taxonomie EA](@/glossary/taxonomie-ea.md) – klasifikace technik, na niž hesla odkazují.
- [Konceptuální mapa](@/kompendium/konceptualni-mapa/_index.md) – grafický přehled vztahů
  mezi pojmy.
- [Rejstřík pojmů](@/kompendium/08-prilohy/index-pojmu.md) – abecední rejstřík v přílohách.

### Vnější odkazy

- [Dokumentace Elixiru](https://hexdocs.pm/elixir/) – kanonické definice pojmů Elixir/OTP.
- [Příručky Phoenix Framework](https://hexdocs.pm/phoenix/) – terminologie LiveView, PubSub,
  Channel.
- [OWASP](https://owasp.org/www-community/) – základ bezpečnostní terminologie.
- [OSINT Framework](https://osintframework.com/) – terminologie sběru zpravodajství.

## Související

**Ústřední hesla knihy**

- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) – ústřední pojem Kompendia.
- [Kompendium EA](@/glossary/kompendium-ea.md) – kniha jako celek a její publikum.
- [Gaslighting](@/glossary/gaslighting.md) – nejčastěji odkazovaný manipulační vzorec.
- [Betrayal trauma](@/glossary/betrayal-trauma.md) – klíčový klinický rámec.

**Ústřední hesla platformy**

- [NABLA Infinity](@/glossary/nabla-infinity.md) – epistemický rámec platformy.
- [AIAD](@/glossary/aiad.md) – standard agentů.
- [Color Teams](@/glossary/color-teams.md) – bezpečnostní architektura.

**Navigace**

- [Kompendium](@/kompendium/_index.md) – vstup do knihy.
- [Rejstřík pojmů](@/kompendium/08-prilohy/index-pojmu.md) – abecední rejstřík.
