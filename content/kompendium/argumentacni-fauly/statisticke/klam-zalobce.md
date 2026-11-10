+++
title = "Klam žalobce"
description = "Záměna pravděpodobnosti důkazu za předpokladu neviny s pravděpodobností neviny za předpokladu důkazu: struktura klamu, soudní případy, znaky a obrana."
weight = 8
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-statisticke", "fauly-neformalni-klam", "fauly-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "high"
lang = "cs"
keywords = ["Klam žalobce", "Prosecutor's fallacy", "záměna podmíněných pravděpodobností", "obrácená podmíněná pravděpodobnost", "Statistické a pravděpodobnostní klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-05.08"
catalog_slug = "klam-zalobce"
catalog_family = "statisticke"
catalog_family_code = "05"
catalog_family_title = "Statistické a pravděpodobnostní klamy"
catalog_family_en = "Statistical and probabilistic fallacies"
catalog_part = "statisticke"
catalog_type = "informal"
catalog_type_cs = "neformální klam"
catalog_en = "Prosecutor's fallacy"
catalog_aliases = ["záměna podmíněných pravděpodobností", "obrácená podmíněná pravděpodobnost"]
catalog_use = "dvoji"
catalog_use_cs = "chyba i taktika"
catalog_risk = "vysoke"
catalog_risk_cs = "vysoké"
catalog_broader = ""
catalog_narrower = []
catalog_depth = 0
catalog_ancestors = []
catalog_related = ["potvrzeni-dusledku", "zanedbani-zakladni-miry", "klam-konjunkce", "klam-obhajce", "hledani-jinde", "relativni-a-absolutni-riziko"]
catalog_related_declared = ["klam-obhajce", "zanedbani-zakladni-miry", "klam-konjunkce", "relativni-a-absolutni-riziko", "hledani-jinde"]
catalog_kompendium = ["kompendium/forensic-legal/_index.md", "kompendium/techniques/ea-7-3-2-tversky-heuristics.md", "kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/argumentacni-fauly/statisticke/klam-konjunkce.md", "kompendium/argumentacni-fauly/statisticke/zanedbani-zakladni-miry.md", "kompendium/forensic-legal/_index.md"]
catalog_prev = "zakon-malych-cisel"
catalog_next = "klam-obhajce"
catalog_position = 8
catalog_family_size = 16
catalog_sources = ["gigerenzer-2002", "hahn-oaksford-2007", "kahneman-2011", "thompson-schumann-1987", "tversky-kahneman-1974"]
catalog_sources_primary = []
catalog_sources_roots = []
catalog_sources_critical = ["gigerenzer-2002", "hahn-oaksford-2007", "kahneman-2011", "thompson-schumann-1987", "tversky-kahneman-1974"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Obrana a odpověď"]
catalog_trainer_items = 3
catalog_trainer_benign = 1
catalog_review = "agent"
catalog_data = "data/fauly/statisticke.toml"
+++

# Klam žalobce

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-05.08` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) |
| **Druh** | neformální klam |
| **Anglicky** | Prosecutor's fallacy |
| **Jiné názvy** | záměna podmíněných pravděpodobností, obrácená podmíněná pravděpodobnost |
| **Užití** | chyba i taktika |
| **Riziko zneužití** | vysoké |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Klam žalobce je chyba v interpretaci statistického důkazu, při níž se zaměňují dvě různé
podmíněné pravděpodobnosti: pravděpodobnost, že by se důkaz objevil, kdyby byl obviněný
nevinný, a pravděpodobnost, že je obviněný nevinný, když se důkaz objevil. Pokud se
biologický profil nachází u velmi malého podílu populace, je velmi nepravděpodobné, že by
ho náhodný nevinný člověk sdílel. Z toho však nevyplývá, že pravděpodobnost neviny
obviněného je stejně malá. Ta závisí také na tom, kolik lidí mohlo čin spáchat, a na tom,
co dalšího obviněného s činem spojuje. Thompson a Schumann tento omyl pojmenovali a
experimentálně ukázali, že se ho dopouští část lidí, kteří posuzují statistické důkazy v
modelových trestních věcech (Thompson a Schumann 1987).

Název neznamená, že klam používají jen žalobci. Dopouštějí se ho znalci, soudci, novináři
i vyšetřovatelé, a jeho logická podoba se objevuje i mimo soudní síň: v medicíně, v
bezpečnostním prověřování a všude, kde se z nízké pravděpodobnosti důkazu za určité
hypotézy vyvozuje nízká pravděpodobnost hypotézy samotné.

## Původ a souvislosti

Logické jádro klamu je známé z teorie pravděpodobnosti jako záměna podmíněné
pravděpodobnosti za obrácenou. Bayesova věta ukazuje, že k přechodu od pravděpodobnosti
důkazu za předpokladu hypotézy k pravděpodobnosti hypotézy za předpokladu důkazu je
potřeba ještě apriorní pravděpodobnost hypotézy; klam žalobce je proto blízce příbuzný
[zanedbání základní míry](@/kompendium/argumentacni-fauly/statisticke/zanedbani-zakladni-miry.md),
které Tversky a Kahneman doložili jako obecný rys intuitivního úsudku (Tversky a Kahneman
1974). Thompson a Schumann popsali dvojici protilehlých chyb. Klam žalobce přeceňuje sílu
statistické shody tím, že ji převádí přímo na pravděpodobnost viny. Klam obhájce ji naopak
podceňuje tím, že z velkého počtu lidí se stejným profilem vyvozuje, že shoda je
bezvýznamná. Obě chyby vedou ke špatnému vážení důkazu, jen opačným směrem (Thompson a
Schumann 1987).

Gigerenzer rozšířil úvahu o praktické doporučení: soudní znalci a soudy mají podávat
statistické údaje v přirozených četnostech, například kolik lidí v dané populaci by sdílelo
profil, protože v takové podobě se záměna podmíněných pravděpodobností stává viditelnou a
porotci i soudci ji snáze odhalí (Gigerenzer 2002). Z dějin soudnictví je známý americký
případ, v němž kalifornský nejvyšší soud v roce 1968 zrušil odsouzení opřené o
pravděpodobnostní výpočet, který násobil odhadované četnosti několika znaků, jako by na
sobě nezávisely, a výsledek podával jako pravděpodobnost, že obžalovaní jsou nevinní.
V Anglii se klam stal předmětem rozsáhlé kritiky v souvislosti s odsouzením matky za smrt
jejích dvou dětí, které bylo později zrušeno; znalecké tvrzení o mimořádně malé
pravděpodobnosti dvou náhlých úmrtí v jedné rodině bylo jen jednou z vad řízení, ale
odborná statistická společnost na ně veřejně upozornila jako na chybnou argumentaci.

## Struktura argumentu

Argument má tuto stavbu. První premisa uvádí, že kdyby byl obviněný nevinný, byla by shoda
nebo událost velmi nepravděpodobná. Druhá premisa konstatuje, že shoda nebo událost
nastala. Závěr tvrdí, že pravděpodobnost neviny je stejně malá jako pravděpodobnost shody
za předpokladu neviny. Mezi premisami a závěrem chybějí dvě veličiny. První je apriorní
pravděpodobnost viny, tedy kolik lidí mohlo čin spáchat. Pokud profil sdílí jeden člověk z
milionu a v úvahu připadá několik milionů lidí, je mezi nimi několik dalších nositelů
profilu a shoda sama nestačí. Druhou chybějící veličinou je pravděpodobnost téže události
za alternativní hypotézy. U případů úmrtí dětí je třeba porovnat, jak vzácné je dvojí
přirozené úmrtí, s tím, jak vzácná je dvojí vražda; obě alternativy jsou vzácné a o
pravděpodobnosti viny rozhoduje jejich poměr, ne vzácnost jedné z nich. Thompson a
Schumann ukazují, že právě vynechání těchto veličin dělá z korektního údaje o četnosti
znaku nekorektní závěr o vině (Thompson a Schumann 1987).

Častým doprovodným krokem je chybné násobení pravděpodobností dílčích událostí, které se
považují za nezávislé, ačkoli nezávislé nejsou. Sdílené genetické nebo prostředí podmíněné
rizikové faktory mohou zvyšovat pravděpodobnost druhé události, pokud nastala první.
Takový výpočet je zároveň příbuzný [klamu konjunkce](@/kompendium/argumentacni-fauly/statisticke/klam-konjunkce.md)
v tom, že pracuje se souběhem událostí, jen opačným směrem: místo přeceňování souběhu ho
podceňuje tím, že přehlíží jeho vnitřní souvislost.

## Detekční znaky

Prvním znakem je věta, která převádí četnost znaku přímo na pravděpodobnost viny: „jen jeden
z milionu by měl tento profil, takže je jen jedna šance z milionu, že je nevinný“. Druhým
znakem je chybějící úvaha o velikosti populace, z níž mohl pachatel pocházet. Třetím
znakem je, že se vzácnost události posuzuje jen za jedné hypotézy; alternativní
vysvětlení se nezmiňuje nebo se odbývá jako nepravděpodobné, aniž by se jeho
pravděpodobnost srovnala. Čtvrtým znakem je násobení pravděpodobností bez zdůvodnění
nezávislosti. Pátým znakem je situace, kdy byl obviněný nalezen právě díky hledání shody
v rozsáhlé databázi; pak je apriorní pravděpodobnost viny nízká a shoda váží méně, než se
zdá. Thompson a Schumann upozorňují, že klam se může objevit i ve formulacích, které
nezní jako výpočet, například v tvrzení, že shoda „téměř jistě“ ukazuje na obviněného
(Thompson a Schumann 1987).

## Odlišení od platné argumentace

Statistická shoda může být silným důkazem a její správné použití klamem není. Platná
úvaha uvádí, jak vzácný je profil, a ponechává posouzení viny na celkovém zvážení důkazů,
včetně těch, které obviněného s činem spojují nezávisle na shodě. Platné je také tvrzení,
že shoda zvyšuje pravděpodobnost viny mnohonásobně, protože tím se vyjadřuje síla důkazu,
nikoli výsledná pravděpodobnost. Bayesovský přístup k argumentaci ukazuje, že síla důkazu
se dá oddělit od výchozí pravděpodobnosti a že právě toto oddělení umožňuje rozlišit
oprávněné a neoprávněné užití téže formy úvahy (Hahn a Oaksford 2007). Klamem se úvaha
stává, když se síla důkazu vydává za výslednou pravděpodobnost. Odlišit je třeba i
klam obhájce: tvrzení, že shoda je bezvýznamná, protože profil sdílí mnoho lidí, je
opačnou chybou, nikoli správnou obranou, pokud jsou k dispozici další důkazy, které okruh
podezřelých zužují (Thompson a Schumann 1987).

## Stav poznání

Klam žalobce je dobře popsaný v psychologii soudního rozhodování i ve statistice. Pokusy s
modelovými porotci ukázaly, že část lidí se dopouští záměny podmíněných pravděpodobností
spontánně a že způsob podání důkazu ovlivňuje, jakou váhu mu přisoudí (Thompson a Schumann
1987). Gigerenzer shrnul výzkum, podle něhož podání v přirozených četnostech výrazně
zlepšuje porozumění statistickým důkazům u laiků i odborníků, a doporučil ho jako standard
pro soudní praxi (Gigerenzer 2002). Obecný psychologický mechanismus, totiž sklon
nahrazovat úsudek o pravděpodobnosti úsudkem o tom, jak dobře důkaz sedí na hypotézu, je
jedním z nejlépe doložených zjištění výzkumu heuristik (Tversky a Kahneman 1974; Kahneman
2011). Soudní případy, v nichž klam přispěl k chybnému rozhodnutí, vedly v některých
právních řádech k diskusi o tom, jak mají znalci statistické údaje formulovat a jak je
mají soudy vysvětlovat porotám.

## Obrana a odpověď

Základní obranou je trvat na tom, aby statistický údaj zazněl ve své podmíněné podobě: „u
náhodného člověka, který s činem nesouvisí, by se shoda objevila s takovou a takovou
pravděpodobností“. Tato formulace je přesná a nepřevádí se sama na pravděpodobnost viny.
Druhou obranou je otázka po populaci: kolik lidí mohlo čin spáchat a kolik z nich by
profil sdílelo? Převod na přirozené četnosti ukáže, kolik dalších nositelů profilu lze
očekávat, a tím zviditelní, co ještě musí ostatní důkazy vysvětlit (Gigerenzer 2002).
Třetí obranou je požadovat srovnání hypotéz: jak pravděpodobná je událost za předpokladu
viny a jak za předpokladu neviny? O síle důkazu rozhoduje tento poměr. Čtvrtou obranou je
zpochybnit nezávislost u každého násobení pravděpodobností.

V institucionální rovině patří k obraně školení soudců, státních zástupců, advokátů a
znalců v interpretaci statistických důkazů, standardní formulace znaleckých posudků a
možnost přizvat nezávislého statistika. Kniha souvislosti s dokazováním a znaleckou prací
rozebírá v části o [forenzním a právním rozměru](@/kompendium/forensic-legal/_index.md).
Pro obhajobu i obžalobu platí stejné pravidlo: správné vážení důkazu chrání před odsouzením
nevinného i před zproštěním viníka, a klam žalobce i klam obhájce jsou dvěma stranami
téhož selhání (Thompson a Schumann 1987).

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Literatura

- Gigerenzer, G. (2002). *Calculated Risks: How to Know When Numbers Deceive You*. New York: Simon & Schuster.
- Hahn, U., & Oaksford, M. (2007). The rationality of informal argumentation: A Bayesian approach to reasoning fallacies. *Psychological Review*, 114(3), 704–732.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Thompson, W. C., & Schumann, E. L. (1987). Interpretation of statistical evidence in criminal trials: The prosecutor's fallacy and the defense attorney's fallacy. *Law and Human Behavior*, 11(3), 167–187.
- Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*, 185(4157), 1124–1131.

## Související

**Rodina a hierarchie**

- [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel

**Příbuzná hesla**

- [Potvrzení důsledku](@/kompendium/argumentacni-fauly/formalni/potvrzeni-dusledku.md) – příbuzné heslo (Formální klamy, Affirming the consequent)
- [Zanedbání základní míry](@/kompendium/argumentacni-fauly/statisticke/zanedbani-zakladni-miry.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Base-rate neglect)
- [Klam konjunkce](@/kompendium/argumentacni-fauly/statisticke/klam-konjunkce.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Conjunction fallacy)
- [Klam obhájce](@/kompendium/argumentacni-fauly/statisticke/klam-obhajce.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Defence attorney's fallacy)
- [Klam hledání jinde](@/kompendium/argumentacni-fauly/statisticke/hledani-jinde.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Look-elsewhere effect)
- [Záměna relativního a absolutního rizika](@/kompendium/argumentacni-fauly/statisticke/relativni-a-absolutni-riziko.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Relative versus absolute risk)

**V kompendiu**

- [Forenzní a právní rozměr EA](@/kompendium/forensic-legal/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-7.3.2 Tversky a Kahneman: Heuristiky](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [6.1 Diagnostické indikátory a markery EA](@/kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Zákon malých čísel](@/kompendium/argumentacni-fauly/statisticke/zakon-malych-cisel.md) – předchozí heslo rodiny
- [Klam obhájce](@/kompendium/argumentacni-fauly/statisticke/klam-obhajce.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
