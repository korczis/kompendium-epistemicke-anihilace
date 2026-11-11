+++
title = "Zanedbání základní míry"
description = "Úsudek o pravděpodobnosti, který se opírá jen o názorný důkaz a přehlíží, jak častý je jev v populaci: struktura klamu, znaky, odlišení a obrana."
weight = 1
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-statisticke", "fauly-neformalni-klam", "fauly-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "high"
lang = "cs"
keywords = ["Zanedbání základní míry", "Base-rate neglect", "klam základní míry", "přehlížení apriorní pravděpodobnosti", "Statistické a pravděpodobnostní klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-05.01"
catalog_slug = "zanedbani-zakladni-miry"
catalog_family = "statisticke"
catalog_family_code = "05"
catalog_family_title = "Statistické a pravděpodobnostní klamy"
catalog_family_en = "Statistical and probabilistic fallacies"
catalog_part = "statisticke"
catalog_type = "informal"
catalog_type_cs = "neformální klam"
catalog_en = "Base-rate neglect"
catalog_aliases = ["klam základní míry", "přehlížení apriorní pravděpodobnosti"]
catalog_use = "dvoji"
catalog_use_cs = "chyba i taktika"
catalog_risk = "vysoke"
catalog_risk_cs = "vysoké"
catalog_broader = ""
catalog_narrower = []
catalog_depth = 0
catalog_ancestors = []
catalog_related = ["potvrzeni-dusledku", "nedovolena-konverze", "klam-konjunkce", "klam-zalobce", "klam-obhajce", "zavadejici-zivost", "relativni-a-absolutni-riziko", "odvolani-na-anekdotu", "bayesovske-pojeti-klamu"]
catalog_related_declared = ["klam-zalobce", "klam-konjunkce", "relativni-a-absolutni-riziko", "zavadejici-zivost", "bayesovske-pojeti-klamu", "odvolani-na-anekdotu"]
catalog_kompendium = ["kompendium/techniques/ea-7-3-2-tversky-heuristics.md", "kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md", "kompendium/07-teoreticke-reflexe/kognitivni-vedy.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/argumentacni-fauly/statisticke/klam-zalobce.md", "kompendium/techniques/ea-7-3-2-tversky-heuristics.md"]
catalog_prev = ""
catalog_next = "klam-konjunkce"
catalog_position = 1
catalog_family_size = 16
catalog_sources = ["gigerenzer-2002", "hahn-oaksford-2007", "kahneman-2011", "stanovich-west-2000", "thompson-schumann-1987", "tversky-kahneman-1974"]
catalog_sources_primary = []
catalog_sources_roots = []
catalog_sources_critical = ["gigerenzer-2002", "hahn-oaksford-2007", "kahneman-2011", "stanovich-west-2000", "thompson-schumann-1987", "tversky-kahneman-1974"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Obrana a odpověď"]
catalog_review = "agent"
catalog_data = "data/fauly/statisticke.toml"
+++

# Zanedbání základní míry

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-05.01` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) |
| **Druh** | neformální klam |
| **Anglicky** | Base-rate neglect |
| **Jiné názvy** | klam základní míry, přehlížení apriorní pravděpodobnosti |
| **Užití** | chyba i taktika |
| **Riziko zneužití** | vysoké |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Zanedbání základní míry je chyba pravděpodobnostního úsudku, při níž člověk hodnotí, jak
pravděpodobná je určitá hypotéza, jen podle toho, jak dobře k ní sedí konkrétní důkaz, a
přehlíží, jak častá je hypotéza sama. Základní míra je podíl případů, v nichž jev nastává v
dané populaci ještě předtím, než se cokoli zjistí o jednotlivci: kolik lidí trpí určitou
nemocí, kolik transakcí je podvodných, kolik zaměstnanců patří do určitého oddělení. Tversky
a Kahneman popsali tento jev jako necitlivost k apriorní pravděpodobnosti výsledků a ukázali,
že jakmile mají lidé k dispozici popis jednotlivce, opírají úsudek o jeho podobnost se
stereotypem a údaj o četnostech téměř nepoužijí (Tversky a Kahneman 1974). Klam je tím
závažnější, čím vzácnější je hledaný jev: u vzácné nemoci, vzácného trestného činu nebo
vzácného rizika může i velmi přesný test vést k závěru, který je častěji mylný než správný.

V argumentaci se klam objevuje dvojím způsobem. Jako chyba vzniká spontánně, protože názorný důkaz
je živější než abstraktní podíl (Kahneman 2011). Jako taktika se objevuje tam, kde mluvčí předkládá
přesnost testu, svědectví nebo profilu a mlčí o tom, jak často se hledaný jev vůbec vyskytuje,
protože by tato informace jeho závěr oslabila.

## Původ a souvislosti

Normativní měřítko, proti němuž se klam posuzuje, je Bayesova věta: pravděpodobnost hypotézy
po zjištění důkazu závisí na její pravděpodobnosti předem a na tom, o kolik je důkaz
pravděpodobnější, když hypotéza platí, než když neplatí. Psychologický výzkum v sedmdesátých
letech ukázal, že intuitivní úsudek tuto strukturu soustavně nerespektuje. V jednom z
pokusů, které Tversky a Kahneman shrnuli, dostávali účastníci krátké popisy osob náhodně
vybraných ze skupiny inženýrů a právníků se známým poměrem obou profesí. Odhad, zda jde o
inženýra, se řídil hlavně tím, jak popis odpovídal představě inženýra, a poměr ve skupině ho
skoro neovlivnil. Když popis chyběl, lidé poměr použili správně; když byl popis bezcenný,
poměr přesto přestali brát v úvahu (Tversky a Kahneman 1974). Autoři jev vysvětlili
heuristikou reprezentativnosti, kterou kniha podrobněji rozebírá u [heuristik úsudku za
nejistoty](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md).

Kahneman později shrnul poučení z této linie výzkumu do dvou zásad: ukotvit odhad
pravděpodobnosti na věrohodné základní míře a zpochybňovat diagnostickou hodnotu důkazu,
protože živý popis působí přesvědčivěji, než jak mnoho skutečně vypovídá (Kahneman 2011).
Gigerenzer přenesl otázku do medicíny a práva a upozornil, že potíž často nevzniká v hlavě
posluchače, ale ve způsobu, jak jsou čísla podána. Údaje ve formě podmíněných procent mátli
lékaře i laiky, kdežto stejné údaje převedené na přirozené četnosti vedly k podstatně
lepšímu úsudku (Gigerenzer 2002).

## Struktura argumentu

Klamavý argument má typicky tuto stavbu. První premisa uvádí, že důkaz D se u nositelů
vlastnosti H vyskytuje velmi často: test je citlivý, popis sedí, profil odpovídá. Druhá
premisa konstatuje, že u zkoumaného jednotlivce byl D zjištěn. Závěr tvrdí, že jednotlivec
má H s vysokou pravděpodobností. Chybí v něm dvě veličiny: jak často se D vyskytuje u těch,
kdo H nemají, a jak častá je H v populaci, z níž jednotlivec pochází. Bez nich závěr
nevyplývá. Pokud je H vzácná, pak i malý podíl falešně pozitivních nálezů mezi velkým
počtem lidí bez H může převážit nad skutečně pozitivními nálezy mezi malým počtem lidí s H
(Gigerenzer 2002).

Představme si pro ilustraci, že porucha postihuje jednoho člověka z tisíce, test ji
zachytí téměř vždy a u zdravých se mýlí jen v malém zlomku případů. Mezi tisícem
vyšetřených je jeden nemocný s pozitivním výsledkem a k němu několik zdravých s výsledkem
falešně pozitivním. Pozitivní výsledek tedy zvyšuje pravděpodobnost poruchy mnohonásobně,
ale ta i tak zůstává menšinová. Gigerenzer ukazuje, že právě takové převedení na počty lidí
odstraňuje většinu zmatku, protože základní míra je v něm obsažena přímo (Gigerenzer 2002).
Logicky jde o příbuzný jev ke [klamu žalobce](@/kompendium/argumentacni-fauly/statisticke/klam-zalobce.md),
který zaměňuje pravděpodobnost důkazu za předpokladu neviny s pravděpodobností neviny za
předpokladu důkazu; obě chyby mají společný kořen v přehlédnutí apriorní pravděpodobnosti
(Thompson a Schumann 1987).

## Detekční znaky

Prvním znakem je, že argument uvádí přesnost, citlivost nebo shodu, ale žádný údaj o tom,
jak častý je hledaný jev v populaci, z níž případ pochází. Druhým znakem je přechod od
popisu k jistotě: „sedí to na něj“, „test byl pozitivní“, „profil odpovídá“ se mění v
„takže to je on“ nebo „takže to máte“. Třetím znakem je živý, konkrétní popis jednotlivce
stojící proti suchému statistickému údaji, který se v rozhovoru odsune jako nepodstatný
nebo „jen obecný“. Kahneman upozorňuje, že názorná informace o jednotlivém případu vytlačuje
ze soudu informaci o kategorii, i když je ta druhá pro správný odhad důležitější
(Kahneman 2011). Čtvrtým znakem je plošné testování: kde se vyšetřuje celá populace nebo
velká skupina bez předchozího podezření, je základní míra nízká a riziko klamu nejvyšší.
Ve forenzním a zpravodajském prostředí se klam projevuje i tak, že se k profilu hledá
osoba v rozsáhlé databázi a shoda se pak podává, jako by šlo o osobu, která byla podezřelá
z jiných důvodů.

## Odlišení od platné argumentace

Ne každý úsudek, který se opírá o konkrétní důkaz, zanedbává základní míru. Úvaha je
platná, pokud apriorní pravděpodobnost výslovně nebo implicitně zahrnuje, například když
lékař interpretuje výsledek testu u pacienta s typickými příznaky, u něhož je
pravděpodobnost nemoci předem vysoká, nebo když vyšetřovatel posuzuje shodu u osoby, kterou s
činem spojují i jiné, nezávislé stopy. Platný je také úsudek, v němž je důkaz tak silný, že
by převážil i velmi nízkou základní míru; i tehdy však musí být síla důkazu doložena, ne
jen tvrzena. Hahn a Oaksford ukazují, že bayesovský rámec umožňuje rozlišit silné a slabé
případy téže argumentační formy podle apriorní pravděpodobnosti a diagnostické síly důkazu,
takže označení „zanedbání základní míry“ nepatří na každý úsudek z jednotlivého případu
(Hahn a Oaksford 2007). Spornou situací je, kdy se má použít která základní míra: populace
celé země, populace pacientů dané ambulance nebo populace lidí s určitým příznakem. Volba
referenční třídy je věcná otázka a rozumní lidé se v ní mohou lišit; klamem se stává teprve
tehdy, když se základní míra nebere v úvahu vůbec.

## Stav poznání

Zanedbání základní míry patří k nejlépe doloženým jevům výzkumu úsudku za nejistoty
(Tversky a Kahneman 1974; Kahneman 2011). Výzkum zároveň ukázal, že míra chyby silně
závisí na podání úlohy. Když jsou údaje formulovány jako přirozené četnosti, lidé je
používají výrazně lépe, a to včetně lékařů (Gigerenzer 2002). Kahneman navíc upozorňuje, že
základní míra, která má v příběhu příčinnou roli, se do úsudku dostává snáz než údaj čistě
statistický (Kahneman 2011). Stanovich a West ukázali, že u úloh z výzkumu heuristik
se lidé soustavně liší a že normativní odpovědi souvisejí s kognitivními schopnostmi a se
sklonem k rozvažujícímu myšlení; spor o to, nakolik je odchylka od normy chybou a nakolik
jiným porozuměním úloze, tím podle nich nelze jednoduše uzavřít (Stanovich a West 2000).
Z tohoto stavu poznání plyne pro praxi dvojí závěr. Klam je reálný a má vážné důsledky v
medicíně a soudnictví. Zároveň je do značné míry odstranitelný, pokud se čísla podávají
srozumitelně a pokud se otázka po základní míře stane rutinní součástí posuzování.

## Obrana a odpověď

Nejúčinnější odpovědí je doplnit chybějící veličinu. Kdo slyší, že test, svědectví nebo
profil „sedí“, může se zeptat, jak častý je hledaný jev ve skupině, z níž případ pochází, a
jak často by stejný důkaz vznikl u někoho, kdo jev nemá. Druhou odpovědí je převést
procenta na počty lidí: kolik z tisíce vyšetřených by mělo pozitivní výsledek a kolik z nich
by skutečně bylo nemocných. Tento převod nevyžaduje vzorce a podle Gigerenzera dělá
bayesovský úsudek přístupným i lidem bez statistického vzdělání (Gigerenzer 2002). Třetí
odpovědí je odlišit, zda byl jednotlivec vybrán kvůli důkazu, nebo kvůli jiným důvodům:
kdo byl nalezen hledáním v databázi, má jinou apriorní pravděpodobnost než ten, na koho
ukázaly nezávislé stopy.

V institucích je obranou standardizace. Klinická pracoviště, laboratoře a znalecké ústavy
mohou uvádět u výsledků prediktivní hodnotu pro danou populaci, ne jen citlivost a
specifičnost, a v soudním řízení lze trvat na tom, aby statistický údaj zazněl ve své
podmíněné podobě. Kahneman doporučuje jako osobní návyk začínat úsudek od základní míry a
teprve potom ji upravovat podle konkrétního důkazu, a to střídmě (Kahneman 2011). Pro
čtenáře kompendia je důležité i to, že klam bývá součástí širších vzorců, v nichž se
člověku nebo skupině připisuje nebezpečnost na základě jediného „sedícího“ znaku. Otázka po
základní míře je proto i ochranou proti stigmatizaci, protože vrací do úsudku všechny ty,
na které znak sedí také, a přitom hledanou vlastnost nemají.

## Literatura

- Gigerenzer, G. (2002). *Calculated Risks: How to Know When Numbers Deceive You*. New York: Simon & Schuster.
- Hahn, U., & Oaksford, M. (2007). The rationality of informal argumentation: A Bayesian approach to reasoning fallacies. *Psychological Review*, 114(3), 704–732.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Stanovich, K. E., & West, R. F. (2000). Individual differences in reasoning: Implications for the rationality debate? *Behavioral and Brain Sciences*, 23(5), 645–665.
- Thompson, W. C., & Schumann, E. L. (1987). Interpretation of statistical evidence in criminal trials: The prosecutor's fallacy and the defense attorney's fallacy. *Law and Human Behavior*, 11(3), 167–187.
- Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*, 185(4157), 1124–1131.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel

**Příbuzná hesla**

- [Potvrzení důsledku](@/kompendium/argumentacni-fauly/formalni/potvrzeni-dusledku.md) – příbuzné heslo (Formální klamy, Affirming the consequent)
- [Nedovolená konverze](@/kompendium/argumentacni-fauly/formalni/nedovolena-konverze.md) – příbuzné heslo (Formální klamy, Illicit conversion)
- [Klam konjunkce](@/kompendium/argumentacni-fauly/statisticke/klam-konjunkce.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Conjunction fallacy)
- [Klam žalobce](@/kompendium/argumentacni-fauly/statisticke/klam-zalobce.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Prosecutor's fallacy)
- [Klam obhájce](@/kompendium/argumentacni-fauly/statisticke/klam-obhajce.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Defence attorney's fallacy)
- [Zavádějící živost](@/kompendium/argumentacni-fauly/statisticke/zavadejici-zivost.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Misleading vividness)
- [Záměna relativního a absolutního rizika](@/kompendium/argumentacni-fauly/statisticke/relativni-a-absolutni-riziko.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Relative versus absolute risk)
- [Odvolání na anekdotu](@/kompendium/argumentacni-fauly/hodnoty-a-veda/odvolani-na-anekdotu.md) – příbuzné heslo (Klamy hodnot, přírody a vědy, Anecdotal fallacy)
- [Bayesovské pojetí klamů](@/kompendium/argumentacni-fauly/teorie-argumentace/bayesovske-pojeti-klamu.md) – příbuzné heslo (Principy kritické diskuse a teorie argumentace, Bayesian account of fallacies)

**V kompendiu**

- [EA-7.3.2 Tversky a Kahneman: Heuristiky](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [6.1 Diagnostické indikátory a markery EA](@/kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [7.5 Kognitivní vědy a EA — duální systém, predikční zpracování, embodied cognition](@/kompendium/07-teoreticke-reflexe/kognitivni-vedy.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Klam konjunkce](@/kompendium/argumentacni-fauly/statisticke/klam-konjunkce.md) – další heslo rodiny

<!-- kompendium:katalog-vazby:end -->
