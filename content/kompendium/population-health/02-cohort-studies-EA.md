+++
title = "Kohortové studie epistemických útoků"
description = "Longitudinální kohortové studie expozice epistemickým útokům: návrh, měření v čase, úbytek účastníků, kauzální úskalí a bezpečnostní protokol."
weight = 20

[taxonomies]
tags = ["kompendium", "population-health", "epidemiology"]
categories = ["academic", "public-health"]

[extra]
related_terms = ["01-EA-prevalence-estimates", "03-incidence-cult-exposure", "04-disinformation-population-impact", "05-academic-EA-prevalence"]
toc = true
+++

# Kohortové studie epistemických útoků

> Kohorta sleduje tytéž lidi v čase. Jen tak lze odlišit, co expozici předchází, co ji provází
> a co po ní zůstává – a jen tak lze poctivě mluvit o průběhu, latenci a zotavení.

## Vymezení

Průřezové šetření ([odhady prevalence](@/kompendium/population-health/01-EA-prevalence-estimates.md))
zachytí stav v jednom okamžiku. Neřekne, zda nejistota v úsudku u člověka po odchodu
z [high-control group](@/glossary/high-control-group.md) existovala před vstupem, zda je
důsledkem pobytu ve skupině, nebo zda vznikla až při odchodu. Na tuto otázku odpovídá
**kohortový design**: definovaná skupina lidí je opakovaně měřena a expozice se zaznamenává
dřív, než nastane sledovaný výsledek.

U epistemických útoků má kohorta tři hlavní úkoly:

1. popsat **přirozený průběh** – jak se poškození rozvíjí, stabilizuje a ustupuje;
2. identifikovat **prediktory přechodu** od expozice k poškození a od poškození k zotavení;
3. poskytnout data pro hodnocení intervencí tam, kde randomizace není etická
   ([RCT v EA výzkumu](@/kompendium/research-methodology/RCT-EA-considerations.md)).

## Typy kohortových designů

| Design | Princip | Silná stránka | Hlavní riziko |
|---|---|---|---|
| Prospektivní populační kohorta | Obecná populace, expozice se měří průběžně | Nezkreslený výběr, sleduje i neexponované | Expozice je vzácná, je třeba velký vzorek |
| Kohorta vysoce rizikové skupiny | Např. studenti prvního ročníku, nově příchozí migranti | Vyšší výskyt událostí | Omezená zobecnitelnost |
| Kohorta po expozici | Lidé po odchodu ze skupiny nebo vztahu | Přímo sleduje zotavení | Nezná stav před expozicí |
| Historická (retrospektivní) kohorta | Rekonstrukce z dokumentace | Rychlost | Zkreslení paměti a dokumentace |
| Modul ve stávající kohortě | Přidání otázek do probíhající studie zdraví | Bohaté kovariáty, nízké náklady | Omezený prostor v dotazníku |

Pro EA je nejrealističtější kombinace: modul ve stávající obecné kohortě (pro výskyt a rizikové
faktory) a menší **kohorta po expozici** pro průběh zotavení, propojená s klinickými programy
podle [longitudinálních rekonstruktivních protokolů](@/kompendium/recovery-protocols/_index.md).

## Co se měří a kdy

- **Expozice jako proměnná v čase.** Epistemický útok není jednorázová událost. Zaznamenává se
  začátek, intenzita, typ vzorců (izolace, kontrola informací, zpochybňování vnímání –
  viz [BITE model](@/glossary/bite-model.md)) a konec.
- **Výsledky na více úrovních:** subjektivní jistota v úsudku, funkce v práci a vztazích,
  symptomy traumatu ([C-PTSD](@/glossary/c-ptsd.md)), [disociace](@/glossary/disociace.md), důvěra v instituce
  a v blízké, schopnost [testovat realitu](@/glossary/reality-testing.md).
- **Modifikátory:** sociální síť, předchozí trauma, dostupnost pomoci, životní události.
- **Frekvence měření** musí odpovídat dynamice. Zotavení je nelineární – časté jsou návraty
  a „relapsy“ do starého rámce, viz [prevence relapsu](@/kompendium/prevention-resilience/21-relapse-prevention-EA.md).
  Řídká měření je přehlédnou; husté měření (deníkové metody, viz
  [časové řady](@/kompendium/research-methodology/time-series-EA.md)) zvyšuje zátěž účastníků.

## Specifická úskalí

**Diferenciální úbytek.** Lidé pod kontrolou jiné osoby nebo skupiny často studii opouštějí,
protože jim účast někdo zakáže nebo protože ji sami začnou vnímat jako ohrožení. Úbytek pak
není náhodný – mizí právě nejvíce postižení a výsledky vypadají lépe, než jsou. Analýza musí
úbytek modelovat (vícenásobná imputace, citlivostní analýzy) a návrh mu předcházet: bezpečné
kontaktní kanály, souhlas s kontaktem přes důvěryhodnou osobu, možnost přerušit a vrátit se.

**Reverzní kauzalita.** Nejistota, osamělost nebo krize mohou být příčinou vstupu do
manipulativního vztahu, nikoli jeho důsledkem. Kohorta, která měří až po expozici, tyto dvě
cesty neodliší.

**Časově proměnlivé zkreslení.** [Sociální izolace](@/glossary/socialni-izolace.md) je zároveň důsledkem expozice i příčinou
dalšího poškození. Běžná regrese, která ji „kontroluje“, odstraní část skutečného účinku.
Řešení popisuje článek o [kauzální inferenci](@/kompendium/research-methodology/causal-inference-EA.md)
(orientované acyklické grafy, marginální strukturní modely).

**Měření, které mění měřené.** Opakované otázky o manipulaci mohou fungovat jako
psychoedukace: účastníci začnou svou situaci pojmenovávat jinak. To je eticky žádoucí, ale
metodologicky to znamená, že kohorta není „pasivní pozorovatel“.

## Etika a bezpečnost účastníků

Kohorta v této oblasti je etickým závazkem na roky. Minimální prvky:

- [informovaný souhlas](@/kompendium/research-methodology/informed-consent-EA-research.md)
  jako proces, ne jednorázový podpis – s možností odvolání a omezení rozsahu dat;
- protokol pro situace akutního rizika (sebepoškození, násilí, ohrožení dětí), který určí,
  kdo a jak jedná; viz [akutní suicidální riziko](@/kompendium/emergency-protocols/2-suicide-risk-EA.md)
  a [povinné oznámení](@/kompendium/emergency-protocols/9-mandatory-reporting-EA.md);
- [datová bezpečnost](@/kompendium/research-methodology/data-security-EA-research.md) –
  data o kontrolujícím vztahu jsou pro účastníka nebezpečná, pokud se dostanou do nesprávných
  rukou;
- schválení etickou komisí ([IRB review](@/glossary/irb-review.md)) a nezávislý dohled nad
  bezpečností.

## Interpretace výsledků

Kohortová data dávají relativní riziko a časový průběh, ne individuální prognózu. Zjištění,
že lidé s malou sociální sítí se zotavují pomaleji, neopravňuje k závěru, že konkrétní člověk
se zotavovat nebude. Obecné kritérium pro posun od asociace ke kauzálnímu výkladu nabízejí
úvahy Austina Bradforda Hilla (1965): časová posloupnost, síla a konzistence asociace,
gradient dávka–odpověď, biologická či psychologická věrohodnost. U EA bývá nejsilnějším
argumentem časová posloupnost a gradient – proto je kohorta tak cenná.

## Důsledky pro prevenci a zdravotní systém

- Poznání **kritických oken** (např. prvních měsíců po odchodu ze skupiny) umožní zaměřit
  podporu tam, kde je riziko relapsu nebo krize nejvyšší; viz
  [akutní stabilizační protokol](@/kompendium/recovery-protocols/acute-stabilization-protocol.md).
- Prediktory pomalého zotavení slouží k **stratifikaci péče** (stepped care), nikoli k označování
  lidí.
- Data o průběhu informují **realistická očekávání** pacientů i plátců: zotavení se počítá
  v měsících až letech, ne v sezeních.

## Modelová situace

Výzkumný tým přidá do probíhající kohorty vysokoškolských studentů krátký modul o zkušenosti
s uzavřenými skupinami a s kontrolujícími vztahy. Po třech vlnách zjistí, že z účastníků, kteří
zkušenost uvedli, se k další vlně vrací výrazně méně lidí. Místo zveřejnění „dobrých výsledků
zotavení“ tým analyzuje úbytek jako samostatné zjištění, upraví kontaktní postup (souhlas
s kontaktem přes zvolenou důvěryhodnou osobu) a v publikaci uvede, že odhad zotavení je
pravděpodobně optimistický.

## Kontrolní otázky pro praxi

- Je expozice zaznamenána dřív než výsledek, nebo jen zpětně?
- Kdo z kohorty vypadává a lze úbytek považovat za náhodný?
- Je proměnná, kterou analýza „kontroluje“, zároveň důsledkem expozice?
- Má studie bezpečnostní protokol pro účastníky v akutním ohrožení?
- Je definice „zotavení“ stanovena předem a je přijatelná pro účastníky?

## Limitace a otevřené otázky

- Kohorty jsou drahé a trvají dlouho; financování krátkých grantových cyklů jim nepřeje
  ([financování výzkumu](@/kompendium/population-health/29-research-funding-EA.md)).
- Stav před expozicí je u většiny lidí neznámý; kohorta po expozici ho jen odhaduje.
- Jak definovat „zotavení“? Návrat k předchozímu stavu, nebo nová integrace zkušenosti
  ([posttraumatický růst](@/kompendium/recovery-protocols/longterm-post-traumatic-growth.md))?

## Související

**Sesterské stránky**

- [Odhady prevalence](@/kompendium/population-health/01-EA-prevalence-estimates.md) – průřezový protějšek kohorty.
- [Incidence expozice kultům](@/kompendium/population-health/03-incidence-cult-exposure.md) – výpočet nových případů z kohortových dat.
- [Populační komorbidity](@/kompendium/population-health/09-comorbidity-population.md) – co kohorta odhalí o časovém sledu poruch.

**Metodologie**

- [Longitudinální studie EA procesů](@/kompendium/research-methodology/longitudinal-study-EA.md) – technické detaily opakovaného měření.
- [Kauzální inference v EA výzkumu](@/kompendium/research-methodology/causal-inference-EA.md) – zkreslení proměnlivá v čase.
- [Pre-registrace](@/kompendium/research-methodology/pre-registration-EA-research.md) – ochrana před dodatečným laděním analýz.

**Zotavení a ochrana účastníků**

- [Dlouhodobá prevence relapsu](@/kompendium/recovery-protocols/longterm-relapse-prevention.md) – co sledovat v pozdních vlnách.
- [Trajektorie zotavení](@/kompendium/educational-scenarios/26-recovery-trajectory.md) – výukový scénář nelineárního průběhu.
- [Informovaný souhlas](@/glossary/informed-consent.md) – pojem v glosáři.
