+++
title = "QEVE (kvantifikovaný epistemický ověřovací engine)"
weight = 3
description = "Quantified Epistemic Verification Engine Prismatic Platform: spojuje dokazování v Lean4, axiomy NABLA a simulace Monte Carlo k formálnímu ověření přesvědčení."

[taxonomies]
tags = ["glossary", "prismatic", "nabla", "evidence", "epistemic-pipeline"]

[extra]
category = "ai-ml"
acronym = "QEVE"
related_terms = ["lean4", "nabla-infinity", "trinity-gate", "color-teams", "white-team", "confidence-threshold", "signal-plurality", "provenance-mandatory", "epistemic-pipeline", "property-based-testing"]
author = "Tomas Korcak (korczis)"
date_created = "2026-02-23"
date_modified = "2026-11-10"
keywords = ["QEVE", "Quantified", "Epistemic", "Verification", "Engine", "Lean4", "NABLA", "glossary", "ai ml", "Prismatic Platform"]
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "QEVE (kvantifikovaný epistemický ověřovací engine) – glosář"
+++

## Definice

QEVE (*Quantified Epistemic Verification Engine*, kvantifikovaný epistemický ověřovací engine)
je rámec formálního ověřování Prismatic Platform, který spojuje tři doplňující se metodiky do
jedné ověřovací pipeline: dokazování vět v Lean4 pro matematickou jistotu, vynucení [axiomů
NABLA](@/glossary/nabla-axioms.md) pro epistemickou přísnost a simulace Monte Carlo pro
testování pravděpodobnostní robustnosti. Na rozdíl od běžných postupů ověřování, které stojí
na jediné metodě, vytváří QEVE auditovatelné, formálně podložené a na robustnost otestované
závěry s kvantifikovanou důvěrou, nejistotou a metrikami stability.

Engine má v epistemické infrastruktuře platformy klíčové postavení. Zatímco [NABLA
Infinity](@/glossary/nabla-infinity.md) řídí, jak přesvědčení vznikají, a [Trinity
Gate](@/glossary/trinity-gate.md), zda se přijmou, QEVE dodává ověřovací aparát, který obojí
propojuje. Každé tvrzení, které prochází [epistemickou pipeline](@/glossary/epistemic-pipeline.md),
podstoupí ověření QEVE dřív, než může ovlivnit navazující rozhodnutí.

Většina systémů umělé inteligence vytváří skóre. QEVE vytváří závěry, které současně odpovídají
na tři otázky: **Je to logicky nutné?** (formální vrstva), **Je to epistemicky v pořádku?**
(vrstva NABLA) a **Je to robustní vůči narušení?** (vrstva Monte Carlo). Kombinace zajišťuje,
že žádný závěr nestojí na křehkých předpokladech, skrytých rozporech nebo neotestovaných
hraničních případech.

Pro Kompendium je QEVE pojmem z kontextu platformy. Kniha z něj přebírá užitečnou otázku pro
klinickou i forenzní práci: *který důkaz nese celý závěr a co by se stalo, kdyby padl?* (viz
[QEVE a detekce EA](@/kompendium/aiad-integration/qeve-ea-quality-validation.md)).

## Architektura

QEVE pracuje jako pětifázová pipeline, v níž každá fáze staví na výstupech předchozí. Fáze
nejsou nezávislé kontroly, ale postupné prohlubování přísnosti ověření.

```
Stage 1: Graph Build (NABLA Layer)
    |
    v
Stage 2: Structural Check (DAG Validity)
    |
    v
Stage 3: Logical Check (Rule Consistency)
    |
    v
Stage 4: Lean4 Formal Layer (Theorem Proving)
    |
    v
Stage 5: Monte Carlo Robustness (Stress Testing)
    |
    v
Output: VerificationResult (confidence, uncertainty, robustness, contradictions)
```

Architektura zajišťuje, že formální důkazy se nikdy neuplatňují na strukturně vadné grafy
přesvědčení a simulace Monte Carlo se nikdy nespouštějí nad logicky nekonzistentními sadami
pravidel. Každá fáze je zároveň validátorem i filtrem a brání šíření principu „smetí dovnitř,
smetí ven“.

## Fáze pipeline

### Fáze 1: Sestavení grafu (vrstva NABLA)

Pipeline začíná sestavením grafu přesvědčení z dostupných důkazních signálů. Tato fáze přímo
vynucuje sedm axiomů [NABLA Infinity](@/glossary/nabla-infinity.md):

- **sestavit graf přesvědčení** ze všech dostupných důkazů a propojit signály s hypotézami
  váženými hranami;
- **spočítat pluralitu signálů** – ověřit, že každý uzel přesvědčení má nejméně dva nezávislé
  podpůrné signály (tvrdé vynucení; viz [Signal Plurality](@/glossary/signal-plurality.md));
- **uplatnit časový rozpad** na časová razítka důkazů a snížit váhu zastaralých signálů podle
  nastavitelných funkcí rozpadu;
- **identifikovat rozpory** mezi signály a výslovně je zachovat ve struktuře grafu, místo aby
  se předčasně řešily;
- **ověřit řetězce provenience** – každý signál musí jít dohledat k identifikovatelnému,
  auditovatelnému zdroji.

Výstupem je vážený graf přesvědčení s časovým rozpadem, s poznámkami o rozporech a s metadaty
provenience u každého uzlu a hrany.

### Fáze 2: Strukturní kontrola

Strukturní kontrola ověřuje topologickou integritu grafu přesvědčení pomocí [teorie
grafů](@/glossary/graph-theory.md):

- **platnost DAG**: potvrdit, že síť přesvědčení tvoří platný orientovaný acyklický graf bez
  kruhových závislostí mezi přesvědčeními;
- **detekce cyklů závislostí**: najít a označit vzorce kruhového uvažování, kdy přesvědčení
  A podporuje přesvědčení B, které podporuje přesvědčení A (srov. [kruhová
  argumentace](@/glossary/cirkularni-argumentace.md));
- **detekce osiřelých signálů**: najít důkazní signály, které nejsou spojeny s žádnou
  hypotézou, což ukazuje na možné mezery v analýze;
- **analýza propojenosti**: ověřit, že graf je dostatečně propojený a že kritické závěry
  nevisí na jediném vláknu důkazů.

Selhání strukturní kontroly spouští okamžité zastavení. Žádná logická správnost nemůže
vyvážit strukturně rozbitý graf přesvědčení.

### Fáze 3: Logická kontrola

Logická kontrola uplatňuje na strukturně platný graf přesvědčení vyhodnocení podle pravidel:

- **konzistence enginu pravidel**: ověřit, že všechna inferenční pravidla použitá v grafu jsou
  vnitřně konzistentní a z týchž premis nevytvářejí protichůdné závěry;
- **detekce konfliktních pravidel**: najít případy, kdy dvě nebo více pravidel vedou
  k opačným závěrům, a označit je k výslovnému ošetření rozporu;
- **detekce prosakování předpokladů**: najít případy, kdy předpoklady z jedné oblasti
  prosákly do jiné bez řádného zdůvodnění nebo provenience;
- **soulad s axiomy**: potvrdit, že inferenční řetězec v žádném kroku neporušuje žádný ze sedmi
  axiomů NABLA.

### Fáze 4: Formální vrstva Lean4

Formální vrstva používá dokazování vět v
[Lean4](https://prismatic-reality-com.github.io/prismatic-promo/glossary/lean4/) ke stanovení
matematické jistoty klíčových tvrzení:

- **generování věty**: převést kritickou hypotézu a podpůrný řetězec důkazů na tvrzení věty
  v Lean4;
- **hledání důkazu**: pokusit se větu dokázat automatizovanými i interaktivními prostředky
  Lean4;
- **detekce vyvrácení**: nelze-li větu dokázat, pokusit se sestrojit protipříklad, který ji
  vyvrací;
- **audit předpokladů**: ověřit, že důkaz nezávisí na skrytých předpokladech, které v grafu
  důkazů nejsou.

Formální vrstva rozlišuje závěry **nutné** (při daných důkazech musí platit) a pouze **možné**
(mohou platit, ale důkazy je nevynucují). Pro rozhodnutí s vysokými sázkami je toto rozlišení
zásadní, protože možnost nestačí.

### Fáze 5: Robustnost Monte Carlo

Poslední fáze zatěžuje závěr narušením a kvantifikuje jeho stabilitu:

- **narušení vah**: náhodně měnit váhy důkazů o ±20 % v 10 000 simulačních bězích a testovat
  citlivost na předpoklady o síle důkazů;
- **odebírání signálů**: systematicky odebírat jednotlivé signály a jejich kombinace a zjistit,
  které důkazy jsou nosné a které nadbytečné;
- **simulace selhání**: vkládat simulovaná selhání do různých míst řetězce důkazů a testovat
  odolnost závěru;
- **analýza rozdělení**: agregovat výsledky všech 10 000 scénářů do rozdělení robustnosti, které
  ukazuje, jaké procento narušení zachová původní závěr.

Skóre robustnosti je procento scénářů Monte Carlo, v nichž závěr narušení přežil. Skóre 72 %
znamená, že 7 200 z 10 000 scénářů narušení zachovalo původní závěr. Skóre pod 50 % ukazuje na
křehký závěr, podle něhož se bez dalších důkazů nemá jednat.

## Případ užití: due diligence

Konkrétní příklad ukazuje hodnotu QEVE v aplikaci `prismatic_dd` ([due
diligence](@/glossary/due-diligence.md)).

**Scénář**: firma X kupuje firmu Y. Platforma musí posoudit rizikový profil cíle.

**Shromážděné signály z [OSINT](@/glossary/osint.md)**:

- zásahy v sankčních databázích spojující dceřinou společnost firmy Y s označeným subjektem
  (viz [Sanctions Screening](@/glossary/sanctions-screening.md));
- změny vlastnické struktury za posledních 18 měsíců (3 restrukturalizace);
- probíhající soudní spor v zahraniční jurisdikci;
- obnova certifikace souladu zpožděná o 6 měsíců;
- smíšená mediální pověst: pozitivní oborové zpravodajství, ale negativní místní tisk.

**Ověřovací pipeline QEVE**:

1. **Sestavení grafu**: sestaví graf přesvědčení s 5 primárními důkazními signály, zkontroluje
   pluralitu (všechny hypotézy mají 2 a více podpůrných signálů), uplatní časový rozpad (změny
   vlastnictví jsou 14 měsíců staré a podle toho oslabené) a zachová rozpor mezi pozitivním
   a negativním mediálním obrazem.
2. **Strukturní kontrola**: DAG je platný, žádné kruhové uvažování, ale označí jeden osiřelý
   signál (zpoždění certifikace není spojeno s žádnou rizikovou hypotézou – vyžaduje přezkum
   analytikem).
3. **Logická kontrola**: pravidla jsou konzistentní, ale odhalí možné prosakování předpokladu:
   sankční vazba se týká dceřiné společnosti, ne mateřského subjektu. Inferenční řetězec
   předpokládá, že riziko dceřiné společnosti se přenáší nahoru, bez výslovného zdůvodnění.
4. **Formální vrstva Lean4**: vygeneruje větu „Firma Y představuje zvýšené akviziční riziko.“
   Důkaz uspěje s výhradou, že přenos rizika z dceřiné na mateřskou společnost je předpokládán,
   ne dokázán. Tento předpoklad je ve výstupu označen.
5. **Robustnost Monte Carlo**: 10 000 běhů s narušením. Závěr přežije v 72 % scénářů. Samotné
   odebrání sankčního signálu sníží přežití na 41 %, takže jde o nosný důkaz.

**Výstup QEVE**:

- důvěra: 0,87;
- nejistota: 0,12;
- skóre robustnosti: 72 % narušení zachová závěr;
- rozpory: 1 slabý (rozpolcená mediální pověst);
- kritická závislost: sankční vazba je nosná (její odebrání sníží robustnost pod 50 %);
- označený předpoklad: přenos rizika z dceřiné na mateřskou společnost postrádá formální
  zdůvodnění.

Výstup analytikovi neříká jen, **jaká** je míra rizika, ale **proč** je taková, **co by** závěr
**zbořilo** a **jak stabilní** je závěr pod tlakem. Žádné skóre z černé skříňky. Úplná
auditovatelnost. Příklad je ilustrační, ne záznam skutečného případu.

## Datový model

QEVE pracuje se třemi základními datovými strukturami, které procházejí pipeline.

### Evidence (důkaz)

Každý důkaz vstupující do systému je reprezentován jako strukturovaný signál:

| Pole | Typ | Popis |
|-------|------|-------------|
| `signal_type` | atom | klasifikace důkazu (např. `:sanctions_hit`, `:ownership_change`, `:lawsuit`) |
| `weight` | float | síla signálu (0,0 až 1,0), podléhá časovému rozpadu |
| `source_id` | string | jedinečný identifikátor původního zdroje |
| `independence_group` | string | seskupení pro ověření nezávislosti zdrojů (signály z téže skupiny nejsou nezávislé) |
| `timestamp` | datetime | kdy byl důkaz shromážděn (pro výpočet časového rozpadu) |
| `provenance` | map | úplný řetězec úschovy od surových dat po zpracovaný signál |
| `raw_data_hash` | string | kryptografický otisk původních dat pro ověření integrity |

### Hypothesis (hypotéza)

Každé hodnocené tvrzení nebo závěr:

| Pole | Typ | Popis |
|-------|------|-------------|
| `statement` | string | hodnocené tvrzení v přirozeném jazyce |
| `premises` | list | důkazní signály podporující hypotézu |
| `rule_id` | string | inferenční pravidlo, jímž byla hypotéza z premis odvozena |
| `risk_level` | atom | posouzená míra rizika (`:low`, `:medium`, `:high`, `:critical`) |
| `threshold` | float | minimální důvěra potřebná k přijetí hypotézy |

### VerificationResult (výsledek ověření)

Výstup úplného běhu pipeline QEVE:

| Pole | Typ | Popis |
|-------|------|-------------|
| `structural_pass` | boolean | zda prošla fáze 2 (strukturní kontrola) |
| `logical_pass` | boolean | zda prošla fáze 3 (logická kontrola) |
| `formal_pass` | boolean | zda prošla fáze 4 (formální vrstva Lean4) |
| `monte_carlo_distribution` | list | úplné rozdělení výsledků 10 000 simulačních běhů |
| `confidence` | float | konečné skóre důvěry (0,0 až 1,0) |
| `uncertainty` | float | kvantifikovaná nejistota (0,0 až 1,0) |
| `robustness_score` | float | procento scénářů narušení, které zachovají závěr |
| `contradictions` | list | všechny zjištěné rozpory s klasifikací závažnosti |

## Skórování důvěry

Konečné skóre důvěry není prostý průměr. Počítá se multiplikativním vzorcem, který zajišťuje,
že kterákoli jednotlivá slabá dimenze stáhne celkový výsledek dolů:

```
final_confidence = belief_strength x robustness_score x (1 - contradiction_index)
```

Kde:

- **belief_strength** je vážený součet podpůrných důkazů po časovém rozpadu, normalizovaný na
  [0, 1];
- **robustness_score** je míra přežití v Monte Carlo (procento scénářů narušení, které závěr
  zachovají);
- **contradiction_index** je míra nevyřešených rozporů v grafu přesvědčení, od 0 (žádné rozpory)
  po 1 (zcela rozporné).

Multiplikativní struktura je záměrná. Závěr se silnými důkazy (0,95), ale slabou robustností
(0,40) a středními rozpory (0,15) dá konečnou důvěru 0,95 × 0,40 × 0,85 = 0,323, což správně
vyjadřuje závěr, kterému se navzdory silným povrchním důkazům nemá věřit. Aditivní skórování by
tuto křehkost zakrylo.

## Výkonové charakteristiky

QEVE je navržen tak, aby vyvažoval přísnost ověření s praktickými výkonovými omezeními.
Vícefázová architektura enginu umožňuje včasné odhalení selhání a brání drahým operacím nad
zásadně vadnými vstupy.

**Časové profily** se mezi fázemi pipeline výrazně liší. Sestavení grafu (fáze 1) obvykle
skončí za 50–200 ms u sad důkazů pod 1 000 signálů. Strukturní kontroly (fáze 2) jsou
operace O(V + E) nad grafem přesvědčení a škálují lineárně se složitostí. Nejproměnlivější
výkon má formální vrstva Lean4 (fáze 4) – od milisekund u jednoduchých vět po minuty u složitých
důkazů vyžadujících rozsáhlé hledání.

**Simulace Monte Carlo** (fáze 5) je triviálně paralelizovatelná a škáluje s dostupným výpočetním
výkonem. Standardní konfigurace spouští 10 000 simulací na 4–8 jádrech CPU a u typických případů
skončí za 2–5 sekund. Paralelizace znamená, že další jádra přinášejí téměř lineární zrychlení,
dokud se omezujícím faktorem nestane propustnost paměti.

**Spotřeba paměti** roste s velikostí sady důkazů a složitostí grafu přesvědčení. Typické běhy
spotřebují 256 MB až 2 GB pracovní paměti, přičemž většinu alokace tvoří formální vrstva Lean4
kvůli správě stavu hledání důkazu.

**Optimalizace cache** uchovávají mezivýsledky mezi běhy pipeline. Strukturní kontroly se
cachují podle otisku grafu přesvědčení, důkazy Lean4 podle signatury věty a rozdělení Monte Carlo
podle otisku důkazů. Zásahy cache mohou u opakovaných vyhodnocení s drobnými změnami důkazů
zkrátit celkový čas pipeline o 60–90 %. (Čísla uvádí dokumentace platformy v době zápisu.)

## Integrační vzory

QEVE se zapojuje do širší platformy několika jasně definovanými vzory, které zajišťují
konzistenci a spolehlivost napříč aplikacemi.

**Synchronní ověřování** se používá u rozhodnutí v reálném čase, kde cena čekání převyšuje
riziko pokračování bez ověření. Platforma poskytuje ochranu jističem (*circuit breaker*):
překročí-li latence QEVE 30 sekund, pipeline přejde do zjednodušeného režimu, který vynechá
simulaci Monte Carlo, ale zachová strukturní a logické kontroly.

**Asynchronní dávkové zpracování** obsluhuje rozsáhlé ověřovací úlohy, kde záleží víc na
propustnosti než na latenci jednotlivých požadavků. Aplikace `prismatic_qeve_batch` řadí
požadavky na ověření do fronty a zpracovává je nastavitelnými skupinami pracovníků. Výsledky se
ukládají do grafové databáze a spouštějí upozornění navazujícím spotřebitelům.

**Směrování podle důvěry** používá skóre důvěry QEVE k určení cesty zpracování. Závěry
s vysokou důvěrou (≥ 0,90) proudí přímo do automatizovaných rozhodovacích systémů. Závěry se
střední důvěrou (0,60–0,89) vyžadují lidský přezkum. Závěry s nízkou důvěrou (≤ 0,59) spouštějí
sběr dalších důkazů před novým vyhodnocením.

**Časové monitorování** sleduje výkon QEVE v čase a odhaluje vzorce zhoršování. Platforma vede
klouzavé statistiky latence pipeline, míry úspěšnosti a rozdělení skóre důvěry. Výrazné
odchylky spouštějí výstrahy a automatický přechod na záložní ověřovací metody.

## Klíčové odlišnosti

QEVE se od běžných postupů ověřování umělé inteligence odlišuje v několika zásadních ohledech:

**Auditovatelnost místo neprůhlednosti.** Většina systémů umělé inteligence vytváří skóre
důvěry bez vysvětlení, jak vzniklo. QEVE vytváří úplnou auditní stopu: které důkazy závěr
podpořily, která pravidla byla použita, které formální důkazy uspěly nebo selhaly a které
scénáře narušení závěr zbořily.

**Robustnost místo bodových odhadů.** Jediné číslo důvěry bez pochopení jeho stability nic
neříká. Vrstva Monte Carlo kvantifikuje, jak citlivý je závěr na změny podkladových důkazů,
a odhaluje nosné signály a křehké předpoklady.

**Formální nutnost místo statistické pravděpodobnosti.** Formální vrstva Lean4 rozlišuje
závěry **nutné** (logicky vynucené důkazy) a jen **pravděpodobné** (statisticky
pravděpodobné, ale logicky nevyžadované). U rozhodnutí s vysokými sázkami toto rozlišení
určuje, zda se lze na závěr spolehnout.

**Zachování rozporu místo jeho řešení.** QEVE se rozpory nepokouší řešit. Zachovává je,
kvantifikuje jejich dopad a hlásí je rozhodující osobě. Předčasné řešení rozporů je jedním
z nejčastějších selhání automatizovaných systémů uvažování.

**Skládatelnost s epistemickou pipeline.** QEVE není samostatný nástroj. Jeho výstupy vstupují
přímo do ověření [Trinity Gate](@/glossary/trinity-gate.md) a jeho vstupy řídí axiomy [NABLA
Infinity](@/glossary/nabla-infinity.md). Toto propojení zajišťuje, že ověření není dodatečný
krok, ale strukturní součást infrastruktury uvažování platformy.

## Související

**Pojmy platformy v tomto glosáři**

- [NABLA Infinity](@/glossary/nabla-infinity.md) – epistemický rámec, který řídí sestavení grafu.
- [Axiomy NABLA](@/glossary/nabla-axioms.md) – sedm axiomů vynucovaných ve fázi 1.
- [Trinity Gate](@/glossary/trinity-gate.md) – ověřovací brána, která výstupy QEVE přijímá.
- [White Team](@/glossary/white-team.md) – konstruktivní ověřovací tým, který metody QEVE
  hojně používá.
- [Signal Plurality](@/glossary/signal-plurality.md) – axiom vynucovaný při sestavení grafu.
- [Epistemic Pipeline](@/glossary/epistemic-pipeline.md) – šestnáctiúrovňová pipeline, v níž
  QEVE působí.
- [Color Teams](@/glossary/color-teams.md) – bezpečnostní týmy, jejichž výstupy QEVE ověřuje.

**Hesla a přehledy platformy mimo tuto knihu**

- [Lean4](https://prismatic-reality-com.github.io/prismatic-promo/glossary/lean4/),
  [Confidence Threshold](https://prismatic-reality-com.github.io/prismatic-promo/glossary/confidence-threshold/),
  [Provenance Mandatory](https://prismatic-reality-com.github.io/prismatic-promo/glossary/provenance-mandatory/),
  [Property-Based Testing](https://prismatic-reality-com.github.io/prismatic-promo/glossary/property-based-testing/) –
  dokazovač vět, rozhodovací prahy, dohledatelnost a doplňkové testování.
- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/),
  [Technologie](https://prismatic-reality-com.github.io/prismatic-promo/technologies/) –
  přehledy platformy.

**Kniha**

- [QEVE a detekce EA](@/kompendium/aiad-integration/qeve-ea-quality-validation.md) – ověřování
  kvality signálů epistemického útoku.
- [EA × Due Diligence: Evidence Quality Tiering](@/kompendium/cross-domain/15-ea-dd-evidence-quality-assessment.md) –
  stupňování kvality důkazů v DD.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: qeve](@/kompendium/glossary-bridges/bridge-qeve.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
