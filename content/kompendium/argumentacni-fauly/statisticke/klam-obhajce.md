+++
title = "Klam obhájce"
description = "Chybný výklad statistického důkazu, podle něhož stopa, kterou sdílí mnoho lidí, nemá žádnou váhu: proč zúžení okruhu není bezvýznamné a jak klam odhalit."
weight = 9
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-statisticke", "fauly-neformalni-klam", "fauly-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "high"
lang = "cs"
keywords = ["Klam obhájce", "Defence attorney's fallacy", "klam obhajoby", "Statistické a pravděpodobnostní klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-05.09"
catalog_slug = "klam-obhajce"
catalog_family = "statisticke"
catalog_family_code = "05"
catalog_family_title = "Statistické a pravděpodobnostní klamy"
catalog_family_en = "Statistical and probabilistic fallacies"
catalog_part = "statisticke.b"
catalog_type = "informal"
catalog_type_cs = "neformální klam"
catalog_en = "Defence attorney's fallacy"
catalog_aliases = ["klam obhajoby"]
catalog_use = "dvoji"
catalog_use_cs = "chyba i taktika"
catalog_risk = "vysoke"
catalog_risk_cs = "vysoké"
catalog_broader = ""
catalog_narrower = []
catalog_depth = 0
catalog_ancestors = []
catalog_related = ["irelevantni-zaver", "zanedbani-zakladni-miry", "klam-zalobce", "relativni-a-absolutni-riziko", "bayesovske-pojeti-klamu"]
catalog_related_declared = ["klam-zalobce", "zanedbani-zakladni-miry", "relativni-a-absolutni-riziko", "bayesovske-pojeti-klamu", "irelevantni-zaver"]
catalog_kompendium = ["kompendium/forensic-legal/_index.md", "kompendium/forensic-legal/1-forensic-interview-protocol.md", "kompendium/techniques/ea-7-3-2-tversky-heuristics.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/argumentacni-fauly/statisticke/klam-zalobce.md", "kompendium/argumentacni-fauly/statisticke/zanedbani-zakladni-miry.md", "kompendium/forensic-legal/_index.md", "kompendium/techniques/ea-7-3-2-tversky-heuristics.md"]
catalog_prev = "klam-zalobce"
catalog_next = "ekologicky-klam"
catalog_position = 9
catalog_family_size = 16
catalog_sources = ["gigerenzer-2002", "hahn-oaksford-2007", "thompson-schumann-1987", "tversky-kahneman-1974", "walton-2008"]
catalog_sources_primary = ["walton-2008"]
catalog_sources_roots = []
catalog_sources_critical = ["gigerenzer-2002", "hahn-oaksford-2007", "thompson-schumann-1987", "tversky-kahneman-1974"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Varianty", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Obrana a odpověď"]
catalog_review = "agent"
catalog_data = "data/fauly/statisticke.b.toml"
+++

# Klam obhájce

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-05.09` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) |
| **Druh** | neformální klam |
| **Anglicky** | Defence attorney's fallacy |
| **Jiné názvy** | klam obhajoby |
| **Užití** | chyba i taktika |
| **Riziko zneužití** | vysoké |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Klam obhájce je chybný výklad statistického důkazu, při kterém se z toho, že určitý znak sdílí
mnoho lidí, vyvozuje, že shoda obviněného s tímto znakem nemá pro rozhodnutí žádnou váhu.
Typicky jde o krevní skupinu, typ vlákna, část genetického profilu nebo jinou stopu, která
okruh možných pachatelů zužuje, ale neurčuje jednoho člověka. Argument vypočítá, kolik lidí
v populaci by stopě odpovídalo, a z velkého čísla vyvodí, že důkaz je irelevantní. Název
zavedli spolu s protějškem, klamem žalobce, William Thompson a Edward Schumann, kteří oba
chybné výklady popsali na důkazech o četnosti znaku v populaci (Thompson a Schumann 1987).
Zatímco [klam žalobce](@/kompendium/argumentacni-fauly/statisticke/klam-zalobce.md) důkaz
přeceňuje tím, že pravděpodobnost shody u nevinného zaměňuje s pravděpodobností neviny,
klam obhájce ho podceňuje tím, že nízkou výpovědní sílu jediné stopy zaměňuje s nulovou.
Oba omyly vycházejí z téhož nepochopení: důkaz se neposuzuje podle toho, jak mění
pravděpodobnost hypotézy ve spojení s ostatním, co je známo.

## Původ a souvislosti

Otázka, jak mají soudy zacházet s čísly, provází forenzní vědy od doby, kdy laboratoře
začaly vykazovat četnosti znaků v populaci. Thompson a Schumann zkoumali, jak takové údaje
chápou lidé v roli porotců, a ukázali, že se mezi nimi objevují oba chybné výklady a že
argumenty postavené na nich mohou být pro část účastníků přesvědčivé (Thompson a Schumann
1987). Klam obhájce proto nebyl zaveden jako učebnicová kuriozita, ale jako popis skutečného
rizika v soudním rozhodování. Gerd Gigerenzer rozebírá v knize o porozumění rizikům argument
obhajoby z procesu s O. J. Simpsonem: obhajoba zdůrazňovala, že jen nepatrná část mužů, kteří
své partnerky týrají, je později zabije. Údaj sám sporný nebyl. Sporná byla otázka, na kterou
odpovídal, protože soud neřešil, kolik týraných žen bude zavražděno, ale jak často je v
případech, kdy byla týraná žena zavražděna, pachatelem právě ten, kdo ji týral (Gigerenzer
2002). Případ ukazuje, že klam obhájce nemusí pracovat jen s laboratorní stopou. Stačí
správné číslo, které odpovídá na jinou podmíněnou otázku, než jakou rozhodování klade.
Širší rámec poskytuje výzkum úsudku za nejistoty, podle něhož lidé při hodnocení
pravděpodobnosti často přehlížejí výchozí četnosti a strukturu situace (Tversky a Kahneman
1974). V kompendiu tato problematika patří k
[forenznímu a právnímu rozměru](@/kompendium/forensic-legal/_index.md) epistemické
manipulace, kde se o váze důkazů rozhoduje s vážnými důsledky pro konkrétní lidi.

## Struktura argumentu

Argument má obvykle tři kroky úvahy. Nejprve se uvede, jak častý je znak v populaci. Potom se z této
četnosti spočítá nebo naznačí, kolik lidí by mu v dané oblasti odpovídalo. Nakonec se z velkého
počtu vyvodí, že obviněný je jen jedním z mnoha a že shoda proto o jeho vině nic neříká (Thompson a
Schumann 1987). Vadný je třetí krok. Z toho, že důkaz sám nestačí k usvědčení, neplyne, že nemá
žádnou váhu. Zúžení okruhu z celé populace na její malou část je informace, která pravděpodobnost
hypotézy mění, a její skutečný význam se ukáže až ve spojení s ostatními důkazy: s přítomností na
místě, s motivem, s časovou osou nebo s dalšími stopami. Klam tedy mlčky zachází s důkazem, jako by
byl jediný, a jeho izolovanou slabost vydává za bezvýznamnost.

V bayesovském pohledu je síla důkazu dána tím, o kolik je pravděpodobnější pozorovat shodu,
je-li obviněný pachatelem, než je-li jím někdo jiný. Takový poměr může být velký i u znaku,
který sdílí tisíce lidí, protože se násobí s tím, co o věci svědčí odjinud. Hahnová a
Oaksford ukázali, že řada klasických klamů se dá chápat jako argumenty, jejichž síla závisí
na pravděpodobnostech, a ne jako formálně vadné tvary (Hahn a Oaksford 2007). Klam obhájce do
tohoto rámce zapadá přesně: chyba nespočívá v tom, že se o slabosti jedné stopy mluví, ale
v tom, že se slabost jedné stopy přenáší na celek.

## Varianty

Klam obhájce se vyskytuje ve dvou hlavních podobách. V první, laboratorní, se týká stopy s
udanou četností v populaci a pracuje s počtem lidí, kteří by jí odpovídali. Ve druhé,
kontextové, se týká správného statistického údaje, který odpovídá na jinou podmíněnou
otázku, než jakou si klade rozhodování, jako v Gigerenzerově rozboru argumentu o týraných
ženách (Gigerenzer 2002). Mimo soudní síň má klam obdobu všude, kde se rozhoduje z řetězce
nepřímých indicií: v interním vyšetřování, v klinické diagnostice nebo v hodnocení
zpravodajských informací. Ve všech těchto oblastech se může jednotlivá indicie odmítnout
jako „příliš běžná“, a protože tentýž argument lze opakovat u každé další, celek se tím
rozpustí, aniž by byl kdy posouzen jako celek. Struktura je pokaždé stejná: slabost části se
vydává za bezvýznamnost části a bezvýznamnost částí za bezvýznamnost celku.

## Detekční znaky

Prvním znakem je výpočet počtu lidí, kteří by důkazu odpovídali, bez jakékoli zmínky o tom,
kolik z nich má s případem další vazbu. Druhým znakem je formulace „neznamená vůbec nic“
nebo „je bezcenné“ použitá na důkaz, který je jen nedostatečný. Třetím znakem je izolace
stopy: argument se vrací k jedinému důkazu a vyhýbá se otázce, jak se skládá s ostatními.
Čtvrtým znakem je posunutá podmíněná otázka, jako v případě, kdy se místo pravděpodobnosti,
že pachatelem je známá osoba, došlo-li k činu, uvádí pravděpodobnost, že k činu vůbec
dojde (Gigerenzer 2002). Pátým znakem je asymetrie: tentýž mluvčí, který u nepříznivé stopy
zdůrazňuje velký počet shodujících se lidí, u příznivé stopy podobnou úvahu neprovádí.
Thompson a Schumann upozorňují, že chybné výklady se objevují i bez zlého úmyslu, prostě
proto, že podmíněné pravděpodobnosti jsou pro lidi obtížné (Thompson a Schumann 1987).
Detekce tedy neznamená obvinění z manipulace, ale signál, že je třeba otázku přeformulovat.

## Odlišení od platné argumentace

Obhajoba má nejen právo, ale i povinnost upozornit, že určitý důkaz sám nestačí. Platná
námitka říká, že stopa okruh zužuje jen omezeně, že je třeba posoudit, zda ji podporují
nezávislé důkazy, a že laboratorní četnost může být nejistá kvůli volbě referenční populace
nebo kvůli možnosti chyby při zpracování vzorku. Takové námitky jsou věcné, protože se týkají
síly důkazu, ne jeho existence. Klam nastává teprve tehdy, když se z omezené síly udělá síla
nulová a důkaz se navrhuje z úvahy vyřadit. Z hlediska teorie argumentace jde o porušení
relevance: argument odpovídá na otázku, zda důkaz sám prokazuje vinu, ačkoli rozhodování
klade otázku, zda důkaz k prokázání viny přispívá (Walton 2008). Pro odlišení pomáhá
jednoduchý test. Pokud by se tatáž úvaha dala použít na každý jednotlivý důkaz v řetězci,
a ve výsledku by tak nemohl obstát žádný řetězec nepřímých důkazů, jde o klam a ne o
legitimní kritiku jedné stopy.

## Stav poznání

Klam obhájce je dobře popsán v literatuře o interpretaci statistických důkazů. Původní
experimenty ukázaly, že oba chybné výklady četnostních údajů se mezi laiky objevují a že
argumentace stran je může posílit (Thompson a Schumann 1987). Gigerenzer ukazuje, že
porozumění podmíněným pravděpodobnostem se výrazně zlepší, když se tytéž údaje podají jako
přirozené četnosti, tedy jako počty lidí v konkrétní představitelné skupině, a že takový
přepis odhaluje, na kterou podmíněnou otázku číslo odpovídá (Gigerenzer 2002). Výzkum
heuristik doložil obecnější sklon přehlížet výchozí četnosti a soustředit se na
nápadnou shodu nebo nápadnou nepravděpodobnost (Tversky a Kahneman 1974). Bayesovský přístup
k neformálním klamům dává normativní měřítko, podle něhož lze posoudit, kdy je námitka proti
síle důkazu oprávněná a kdy přestřelí (Hahn a Oaksford 2007). Otevřené zůstává, jak účinně
různé způsoby prezentace v soudní síni chrání rozhodovatele před oběma omyly současně, a
literatura upozorňuje, že ochrana před jedním z nich nesmí vést k náchylnosti k druhému.

## Obrana a odpověď

Odpověď na klam obhájce nespočívá v tom, že se důkaz nadhodnotí, ale v tom, že se otázka
vrátí do správného tvaru. Užitečné je přepsat četnost do počtu lidí a hned se ptát, kolik z
nich splňuje i další okolnosti, které jsou v případu prokázány. Tento přepis do přirozených
četností činí strukturu argumentu viditelnou pro laiky i odborníky (Gigerenzer 2002). Dále je
vhodné výslovně oddělit dvě otázky: zda důkaz sám stačí a zda k hodnocení přispívá. Na první
lze často odpovědět záporně a na druhou kladně, a obě odpovědi patří do rozhodnutí. Znalec by
měl uvádět, z jaké referenční populace četnost vychází a jak nejistá je, protože právě zde
může ležet legitimní jádro námitky. Pro rozhodovatele je ochranou postupovat symetricky a
podobnou úvahu použít na příznivé i nepříznivé stopy. Rozlišení obou klamů, jak je zavedli
Thompson a Schumann, dává soudu pojmy, jimiž lze každý z omylů pojmenovat dřív, než ovlivní
rozhodnutí (Thompson a Schumann 1987). Vztah k ostatním zkreslením úsudku popisuje heslo o
[heuristikách Tverského a Kahnemana](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md)
a obecnější rámec nabízí
[zanedbání základní míry](@/kompendium/argumentacni-fauly/statisticke/zanedbani-zakladni-miry.md).

## Literatura

- Gigerenzer, G. (2002). *Calculated Risks: How to Know When Numbers Deceive You*. New York: Simon & Schuster.
- Hahn, U., & Oaksford, M. (2007). The rationality of informal argumentation: A Bayesian approach to reasoning fallacies. *Psychological Review*, 114(3), 704–732.
- Thompson, W. C., & Schumann, E. L. (1987). Interpretation of statistical evidence in criminal trials: The prosecutor's fallacy and the defense attorney's fallacy. *Law and Human Behavior*, 11(3), 167–187.
- Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*, 185(4157), 1124–1131.
- Walton, D. N. (2008). *Informal Logic: A Pragmatic Approach* (2. vyd.). Cambridge: Cambridge University Press.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel

**Příbuzná hesla**

- [Irelevantní závěr](@/kompendium/argumentacni-fauly/relevance/irelevantni-zaver.md) – příbuzné heslo (Klamy relevance, Ignoratio elenchi)
- [Zanedbání základní míry](@/kompendium/argumentacni-fauly/statisticke/zanedbani-zakladni-miry.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Base-rate neglect)
- [Klam žalobce](@/kompendium/argumentacni-fauly/statisticke/klam-zalobce.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Prosecutor's fallacy)
- [Záměna relativního a absolutního rizika](@/kompendium/argumentacni-fauly/statisticke/relativni-a-absolutni-riziko.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Relative versus absolute risk)
- [Bayesovské pojetí klamů](@/kompendium/argumentacni-fauly/teorie-argumentace/bayesovske-pojeti-klamu.md) – příbuzné heslo (Principy kritické diskuse a teorie argumentace, Bayesian account of fallacies)

**V kompendiu**

- [Forenzní a právní rozměr EA](@/kompendium/forensic-legal/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Forenzní rozhovor](@/kompendium/forensic-legal/1-forensic-interview-protocol.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-7.3.2 Tversky a Kahneman: Heuristiky](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Klam žalobce](@/kompendium/argumentacni-fauly/statisticke/klam-zalobce.md) – předchozí heslo rodiny
- [Ekologický klam](@/kompendium/argumentacni-fauly/statisticke/ekologicky-klam.md) – další heslo rodiny

<!-- kompendium:katalog-vazby:end -->
