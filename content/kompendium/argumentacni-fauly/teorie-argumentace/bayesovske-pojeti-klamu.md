+++
title = "Bayesovské pojetí klamů"
description = "Přístup, který sílu argumentu měří tím, jak by měl změnit přesvědčení: vysvětluje, proč je týž typ argumentu jednou rozumný a jindy klamný."
weight = 17
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-teorie-argumentace", "fauly-pojem-a-princip", "fauly-uziti-zadne"]
categories = ["academic"]

[extra]
toc = true
risk_level = "low"
lang = "cs"
keywords = ["Bayesovské pojetí klamů", "Bayesian account of fallacies", "pravděpodobnostní pojetí klamů", "bayesovská teorie argumentace", "Principy kritické diskuse a teorie argumentace", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-09.17"
catalog_slug = "bayesovske-pojeti-klamu"
catalog_family = "teorie-argumentace"
catalog_family_code = "09"
catalog_family_title = "Principy kritické diskuse a teorie argumentace"
catalog_family_en = "Rules of critical discussion and argumentation theory"
catalog_part = "teorie-argumentace.b"
catalog_type = "concept"
catalog_type_cs = "pojem a princip"
catalog_en = "Bayesian account of fallacies"
catalog_aliases = ["pravděpodobnostní pojetí klamů", "bayesovská teorie argumentace"]
catalog_use = "zadne"
catalog_use_cs = "výkladový pojem"
catalog_risk = "nizke"
catalog_risk_cs = "nízké"
catalog_broader = ""
catalog_narrower = []
catalog_depth = 0
catalog_ancestors = []
catalog_related = ["klam-klamu", "odvolani-na-autoritu", "odvolani-na-nevedomost", "kruhovy-argument", "argument-z-neuveritelnosti", "kluzky-svah", "zanedbani-zakladni-miry", "klam-obhajce", "argument-z-mlceni", "argumentacni-schemata", "argumentacni-teorie-uvazovani"]
catalog_related_declared = ["odvolani-na-nevedomost", "kluzky-svah", "kruhovy-argument", "odvolani-na-autoritu", "zanedbani-zakladni-miry", "argumentacni-schemata"]
catalog_kompendium = ["kompendium/07-teoreticke-reflexe/kognitivni-vedy.md", "kompendium/techniques/ea-7-3-2-tversky-heuristics.md", "kompendium/07-teoreticke-reflexe/computational-epistemology.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/07-teoreticke-reflexe/kognitivni-vedy.md", "kompendium/argumentacni-fauly/formalni/klam-klamu.md", "kompendium/argumentacni-fauly/relevance/odvolani-na-nevedomost.md", "kompendium/argumentacni-fauly/statisticke/klam-zalobce.md", "kompendium/argumentacni-fauly/statisticke/zanedbani-zakladni-miry.md"]
catalog_prev = "dialektika-a-eristika"
catalog_next = "motivovane-uvazovani"
catalog_position = 17
catalog_family_size = 20
catalog_sources = ["gigerenzer-2002", "hahn-oaksford-2007", "hamblin-1970", "stanovich-west-2000", "thompson-schumann-1987", "tversky-kahneman-1974", "walton-2008", "walton-reed-macagno-2008"]
catalog_sources_primary = ["hamblin-1970", "walton-2008", "walton-reed-macagno-2008"]
catalog_sources_roots = []
catalog_sources_critical = ["gigerenzer-2002", "hahn-oaksford-2007", "stanovich-west-2000", "thompson-schumann-1987", "tversky-kahneman-1974"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Vztah k technikám kompendia", "Stav poznání", "Obrana a odpověď"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_review = "agent"
catalog_data = "data/fauly/teorie-argumentace.b.toml"
+++

# Bayesovské pojetí klamů

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-09.17` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Principy kritické diskuse a teorie argumentace](@/kompendium/argumentacni-fauly/teorie-argumentace/_index.md) |
| **Druh** | pojem a princip |
| **Anglicky** | Bayesian account of fallacies |
| **Jiné názvy** | pravděpodobnostní pojetí klamů, bayesovská teorie argumentace |
| **Užití** | výkladový pojem |
| **Riziko zneužití** | nízké |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Bayesovské pojetí klamů je přístup k neformální argumentaci, podle kterého se síla argumentu
posuzuje tím, nakolik by měl rozumného posluchače přimět změnit míru přesvědčení o závěru. Jako
měřítko slouží Bayesova věta z teorie pravděpodobnosti: výsledné přesvědčení závisí na výchozí
pravděpodobnosti závěru a na tom, o kolik pravděpodobnější je předložený doklad v případě, že
závěr platí, než v případě, že neplatí. Klasické klamy jsou v tomto pojetí typy argumentů, jejichž
konkrétní podoby mohou být silné i slabé podle obsahu, a ne argumenty, které jsou chybné vždy
(Hahn a Oaksford 2007). Argument z nevědomosti, kluzký svah nebo kruhový argument proto podle
tohoto přístupu nejsou klamné samy o sobě. Klamnými se stávají tehdy, když se předkládají s
větší silou, než jakou jim dává pravděpodobnost dokladů. Pro tento katalog je pojem důležitý
tím, že dává obecné měřítko pro rozlišení mezi rozumnou a klamnou podobou téhož argumentu a
vysvětluje, proč seznamy klamů, které jen pojmenovávají tvar, odsuzují i rozumné úvahy.

## Původ a souvislosti

Přístup vychází z pravděpodobnostního obratu v psychologii uvažování, který koncem dvacátého
století prosazovali Mike Oaksford a Nick Chater. Ten tvrdí, že mnohé údajné chyby lidí v
logických úlohách přestanou být chybami, pokud se lidské uvažování chápe jako uvažování o
nejistotě, a ne jako deduktivní logika. Ulrike Hahn a Mike Oaksford přenesli tento obrat na
neformální argumentaci a v souborné studii ukázali, že tři klasické klamy, argument z
nevědomosti, kruhový argument a kluzký svah, lze vyložit jako argumenty, jejichž síla se mění
s obsahem podle pravidel pravděpodobnosti (Hahn a Oaksford 2007). Přístup navazuje na
Hamblinovu kritiku standardního výkladu klamů, podle níž učebnice nedokážou vysvětlit, proč
jsou některé podoby klamů rozumné (Hamblin 1970), a liší se od dialektických teorií tím, že
klam nehledá v porušení pravidel rozhovoru, ale v nepoměru mezi silou dokladů a silou závěru.
S dialektickými teoriemi se přitom nevylučuje: dialektická pravidla určují, kdo co má doložit,
pravděpodobnost určuje, jak silné je to, co bylo doloženo (Walton 2008).

## Struktura argumentu

Bayesovský rozbor má jednoduchou kostru. Na začátku je výchozí přesvědčení o závěru, které
odpovídá tomu, co o věci víme bez nového argumentu. Argument přináší doklad a otázkou je, jak
pravděpodobný by byl tento doklad, kdyby závěr platil, a jak pravděpodobný, kdyby neplatil.
Poměr těchto dvou pravděpodobností určuje, o kolik se má přesvědčení posunout. U argumentu z
nevědomosti, například „nikdo nenašel doklad škodlivosti, proto je látka bezpečná“, závisí síla
na tom, jak citlivé bylo hledání: pokud by škodu s vysokou pravděpodobností zachytilo, je
absence nálezu silným dokladem, pokud by ji nezachytilo, téměř žádným (Hahn a Oaksford 2007).
U kluzkého svahu závisí síla na podmíněných pravděpodobnostech jednotlivých přechodů; pokud
je každý z nich nízký, je nízká i pravděpodobnost celého řetězce. U kruhového argumentu
rozhoduje, zda závěr skutečně jen opakuje premisu, nebo zda premisa nese nezávislou informaci,
kterou je možné ověřit odjinud. Ve všech případech se stejný tvar argumentu může pohybovat od
velmi silného po bezcenný.

## Detekční znaky

Z bayesovského pohledu se klamná podoba argumentu pozná podle nepoměru mezi silou závěru a
diagnostickou hodnotou dokladu. Typickými znaky jsou: doklad, který by byl stejně
pravděpodobný bez ohledu na pravdivost závěru, ale předkládá se jako rozhodující; mlčení o
výchozí pravděpodobnosti, takže i vzácný jev se po jednom znaku prohlásí za jistý; absence
nálezu po slabém nebo krátkém hledání, která se vydává za důkaz nepřítomnosti; řetěz
pravděpodobných kroků, jejichž součin se nevyčísluje a jehož konec se podává jako jistý. Druhý
z těchto znaků odpovídá dobře popsanému sklonu přehlížet základní míry (Tversky a Kahneman
1974), kterému se věnuje heslo
[zanedbání základní míry](@/kompendium/argumentacni-fauly/statisticke/zanedbani-zakladni-miry.md).
V soudním prostředí má stejnou strukturu záměna pravděpodobnosti shody stop za pravděpodobnost
viny, kterou výzkum statistických důkazů v trestních věcech pojmenoval jako [klam žalobce](@/kompendium/argumentacni-fauly/statisticke/klam-zalobce.md)
(Thompson a Schumann 1987). Na první pohled přesvědčivý argument z nevědomosti tak může mít
diagnostickou hodnotu blízkou nule, ačkoli zní jako vědecké zjištění, jak ukazuje heslo
[odvolání na nevědomost](@/kompendium/argumentacni-fauly/relevance/odvolani-na-nevedomost.md).

## Odlišení od platné argumentace

Bayesovský přístup je zároveň obranou rozumných argumentů, které tradiční seznamy klamů
neprávem odsuzují. Absence nálezu po rozsáhlém a citlivém hledání je dobrým důvodem změnit
přesvědčení; tak se běžně uvažuje v medicíně, v bezpečnosti léků i v technické diagnostice.
Kluzký svah s vysokými a doložitelnými pravděpodobnostmi přechodů je legitimním varováním,
například v právu, kde precedens skutečně ovlivňuje další rozhodování. Argument z odborného
názoru je silný, pokud je odborník v daném oboru skutečně spolehlivým zdrojem
(Walton, Reed a Macagno 2008). Rozdíl mezi rozumnou a klamnou podobou tedy neleží ve
tvaru, ale v obsahu: v tom, jak pravděpodobné jsou doklady a jak dobře rozlišují mezi platností
a neplatností závěru. Proto obvinění z klamu, které se opírá jen o tvar argumentu, samo může být
klamné; katalog tento jev popisuje jako
[klam klamu](@/kompendium/argumentacni-fauly/formalni/klam-klamu.md).

## Vztah k technikám kompendia

Pro kompendium má bayesovský přístup význam i v klinickém a forenzním kontextu. Mnohé
manipulativní techniky pracují s tím, že posunou výchozí přesvědčení oběti, například opakovaným
tvrzením, že její vnímání je nespolehlivé, a pak každý nejednoznačný doklad vykládají jako
potvrzení. Bayesovský pohled ukazuje, kde je chyba: nejednoznačný doklad, který by byl stejně
pravděpodobný v obou případech, by přesvědčení neměl posouvat vůbec, a přesto se mu připisuje
rozhodující váha. V bayesovském rámci totiž o síle dokladu rozhoduje poměr jeho pravděpodobnosti za
platnosti hypotézy a za její neplatnosti (Hahn a Oaksford 2007). Kapitola
[kognitivní vědy a EA](@/kompendium/07-teoreticke-reflexe/kognitivni-vedy.md)
probírá pravděpodobnostní modely mysli, ze kterých tento pohled vychází.

## Stav poznání

Bayesovské pojetí klamů má solidní empirickou oporu v tom smyslu, že lidé při posuzování
argumentů reagují na proměnné, které teorie předpovídá. V experimentech Hahnové a Oaksforda
hodnotili účastníci argument z nevědomosti jako silnější, když bylo k dispozici více
negativních dokladů a když byl závěr předem pravděpodobnější, a rozlišovali mezi pozitivními a
negativními doklady podobně, jak to plyne z modelu (Hahn a Oaksford 2007). Zároveň je dobře
doloženo, že lidé při intuitivním odhadu pravděpodobnosti systematicky chybují, zejména
přehlížejí základní míry a nechávají se vést reprezentativností (Tversky a Kahneman 1974).
Tyto chyby se zmenšují, když se informace podávají jako přirozené četnosti místo procent a
podmíněných pravděpodobností (Gigerenzer 2002). Individuální rozdíly ukazují, že schopnost
uvažovat podle normativních pravidel souvisí s kognitivními schopnostmi a se sklonem k
reflexivnímu myšlení (Stanovich a West 2000). Kritici přístupu namítají, že pravděpodobnosti
potřebné k výpočtu bývají v reálných sporech neznámé, a že model proto dává spíš rámec otázek
než číselné hodnocení. Tato výhrada je oprávněná, ale nezpochybňuje hlavní přínos: ukazuje,
na co se ptát.

## Obrana a odpověď

Bayesovský přístup dává obraně tři otázky, které lze položit bez jakéhokoli počítání. První
otázka se týká výchozí pravděpodobnosti: jak častý je tento jev obecně, ještě než přihlédneme k
předloženému dokladu? Druhá otázka se týká diagnostické hodnoty: jak pravděpodobný by byl
tento doklad, kdyby závěr neplatil? Pokud stejně, doklad nic nerozlišuje. Třetí otázka se týká
citlivosti hledání: kdyby závěr neplatil, našli bychom to? (Hahn a Oaksford 2007). Tyto otázky
fungují proti přehnaným závěrům ze znaků, z anekdot i z absence nálezu a zároveň brání tomu,
aby byl rozumný argument odmítnut jen kvůli svému tvaru. Při sdělování rizik pomáhá převádět
procenta na přirozené četnosti, protože tak se nepoměr mezi dokladem a závěrem ukáže i laikovi
(Gigerenzer 2002). V institucích, kde se o lidech rozhoduje na základě znaků, například v
posuzování rizika nebo v diagnostice, je užitečné vyžadovat, aby závěr výslovně uváděl základní
míru a sílu dokladu. Tím se nejistota stává viditelnou a nedá se snadno zakrýt sebejistou
formulací.

## Literatura

- Gigerenzer, G. (2002). *Calculated Risks: How to Know When Numbers Deceive You*. New York: Simon & Schuster.
- Hahn, U., & Oaksford, M. (2007). The rationality of informal argumentation: A Bayesian approach to reasoning fallacies. *Psychological Review*, 114(3), 704–732.
- Hamblin, C. L. (1970). *Fallacies*. London: Methuen.
- Stanovich, K. E., & West, R. F. (2000). Individual differences in reasoning: Implications for the rationality debate? *Behavioral and Brain Sciences*, 23(5), 645–665.
- Thompson, W. C., & Schumann, E. L. (1987). Interpretation of statistical evidence in criminal trials: The prosecutor's fallacy and the defense attorney's fallacy. *Law and Human Behavior*, 11(3), 167–187.
- Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*, 185(4157), 1124–1131.
- Walton, D. N. (2008). *Informal Logic: A Pragmatic Approach* (2. vyd.). Cambridge: Cambridge University Press.
- Walton, D., Reed, C., & Macagno, F. (2008). *Argumentation Schemes*. Cambridge: Cambridge University Press.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Principy kritické diskuse a teorie argumentace](@/kompendium/argumentacni-fauly/teorie-argumentace/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel

**Příbuzná hesla**

- [Klam klamu](@/kompendium/argumentacni-fauly/formalni/klam-klamu.md) – příbuzné heslo (Formální klamy, Argument from fallacy)
- [Odvolání na nepatřičnou autoritu](@/kompendium/argumentacni-fauly/relevance/odvolani-na-autoritu.md) – příbuzné heslo (Klamy relevance, Appeal to authority)
- [Odvolání na nevědomost](@/kompendium/argumentacni-fauly/relevance/odvolani-na-nevedomost.md) – příbuzné heslo (Klamy relevance, Appeal to ignorance)
- [Kruhový argument](@/glossary/cirkularni-argumentace.md) – příbuzné heslo (Klamy předpokladu, Begging the question)
- [Argument z neuvěřitelnosti](@/kompendium/argumentacni-fauly/predpoklady-argumentu/argument-z-neuveritelnosti.md) – příbuzné heslo (Klamy předpokladu, Argument from incredulity)
- [Kluzký svah](@/kompendium/argumentacni-fauly/predpoklady-argumentu/kluzky-svah.md) – příbuzné heslo (Klamy předpokladu, Slippery slope)
- [Zanedbání základní míry](@/kompendium/argumentacni-fauly/statisticke/zanedbani-zakladni-miry.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Base-rate neglect)
- [Klam obhájce](@/kompendium/argumentacni-fauly/statisticke/klam-obhajce.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Defence attorney's fallacy)
- [Argument z mlčení](@/kompendium/argumentacni-fauly/dialekticke-taktiky/argument-z-mlceni.md) – příbuzné heslo (Rétorické a dialogické taktiky, Argument from silence)
- [Argumentační schémata a kritické otázky](@/kompendium/argumentacni-fauly/teorie-argumentace/argumentacni-schemata.md) – příbuzné heslo (Principy kritické diskuse a teorie argumentace, Argumentation schemes)
- [Argumentační teorie uvažování](@/kompendium/argumentacni-fauly/teorie-argumentace/argumentacni-teorie-uvazovani.md) – příbuzné heslo (Principy kritické diskuse a teorie argumentace, Argumentative theory of reasoning)

**V kompendiu**

- [7.5 Kognitivní vědy a EA — duální systém, predikční zpracování, embodied cognition](@/kompendium/07-teoreticke-reflexe/kognitivni-vedy.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-7.3.2 Tversky a Kahneman: Heuristiky](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [7.6 Computational epistemology a NABLA](@/kompendium/07-teoreticke-reflexe/computational-epistemology.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Dialektika a eristika](@/kompendium/argumentacni-fauly/teorie-argumentace/dialektika-a-eristika.md) – předchozí heslo rodiny
- [Motivované uvažování](@/kompendium/argumentacni-fauly/teorie-argumentace/motivovane-uvazovani.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
