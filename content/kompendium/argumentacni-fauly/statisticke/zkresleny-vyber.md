+++
title = "Zkreslený výběr"
description = "Závěr o celé populaci vyvozený ze vzorku, jehož složení určil způsob výběru: samovýběr, dostupnost, klinické síto. Struktura klamu, znaky, odlišení a obrana."
weight = 6
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-statisticke", "fauly-neformalni-klam", "fauly-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "high"
lang = "cs"
keywords = ["Zkreslený výběr", "Sampling bias", "nereprezentativní vzorek", "výběrové zkreslení", "Statistické a pravděpodobnostní klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-05.06"
catalog_slug = "zkresleny-vyber"
catalog_family = "statisticke"
catalog_family_code = "05"
catalog_family_title = "Statistické a pravděpodobnostní klamy"
catalog_family_en = "Statistical and probabilistic fallacies"
catalog_part = "statisticke"
catalog_type = "informal"
catalog_type_cs = "neformální klam"
catalog_en = "Sampling bias"
catalog_aliases = ["nereprezentativní vzorek", "výběrové zkreslení"]
catalog_use = "dvoji"
catalog_use_cs = "chyba i taktika"
catalog_risk = "vysoke"
catalog_risk_cs = "vysoké"
catalog_broader = ""
catalog_narrower = ["zkresleni-preziti"]
catalog_depth = 0
catalog_ancestors = []
catalog_related = ["ad-populum", "ukvapene-zobecneni", "vyber-tresnicek", "zamlceni-dukazu", "korelace-a-kauzalita", "prehlizena-spolecna-pricina", "zkresleni-preziti", "zakon-malych-cisel", "ekologicky-klam", "simpsonuv-paradox", "hledani-jinde"]
catalog_related_declared = ["zkresleni-preziti", "ukvapene-zobecneni", "vyber-tresnicek", "ekologicky-klam", "zakon-malych-cisel", "ad-populum"]
catalog_kompendium = ["kompendium/02-uvod/metodologicke-poznamky.md", "kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md", "kompendium/07-teoreticke-reflexe/politicka-ea.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/argumentacni-fauly/statisticke/zakon-malych-cisel.md", "kompendium/argumentacni-fauly/statisticke/zkresleni-preziti.md", "kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md"]
catalog_prev = "zkresleni-preziti"
catalog_next = "zakon-malych-cisel"
catalog_position = 6
catalog_family_size = 16
catalog_sources = ["damer-2009", "gilovich-1991", "govier-2010", "huff-1954", "kahneman-2011", "robinson-1950"]
catalog_sources_primary = ["damer-2009", "govier-2010"]
catalog_sources_roots = []
catalog_sources_critical = ["gilovich-1991", "huff-1954", "kahneman-2011", "robinson-1950"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Obrana a odpověď"]
catalog_review = "agent"
catalog_data = "data/fauly/statisticke.toml"
+++

# Zkreslený výběr

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-05.06` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) |
| **Druh** | neformální klam |
| **Anglicky** | Sampling bias |
| **Jiné názvy** | nereprezentativní vzorek, výběrové zkreslení |
| **Užití** | chyba i taktika |
| **Riziko zneužití** | vysoké |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Zkreslený výběr je chyba induktivního úsudku, při níž se závěr o populaci vyvozuje ze
vzorku, který populaci nezastupuje, protože způsob jeho získání soustavně zvýhodnil některé
případy a znevýhodnil jiné. Nejde o to, že vzorek je malý; i obrovský vzorek může být
zkreslený, pokud byl vybrán z nesprávné populace nebo pokud se do něj případy dostávaly
podle vlastnosti, která souvisí se zkoumanou otázkou. Učebnice neformální logiky vymezují
požadavek reprezentativnosti jako jednu ze dvou základních podmínek dobrého induktivního
zobecnění, vedle dostatečné velikosti vzorku (Govier 2010). Porušení prvního požadavku je
zkresleným výběrem, porušení druhého souvisí s [vírou v zákon malých čísel](@/kompendium/argumentacni-fauly/statisticke/zakon-malych-cisel.md).

Klam se objevuje jako chyba tam, kde je reprezentativní vzorek obtížné získat, a jako
taktika tam, kde mluvčí vědomě vybírá vzorek, který mu dá žádaný výsledek (Huff 1954). Ankety mezi
příznivci, průzkumy na vlastním webu nebo svědectví vybraných klientů jsou běžnými
podobami taktického užití.

## Původ a souvislosti

Problém reprezentativnosti je starý jako statistika veřejného mínění. Nejznámějším
historickým příkladem je předvolební anketa amerického časopisu Literary Digest v roce
1936, která pracovala s velmi rozsáhlým vzorkem a přesto chybně předpověděla vítěze
prezidentských voleb. Vzorek byl sestaven ze seznamů, které zvýhodňovaly zámožnější
voliče, a odpovídal na něj jen ten, kdo chtěl. Menší, ale lépe sestavené průzkumy tehdy
výsledek odhadly správně. Případ se stal učebnicovým dokladem toho, že velikost vzorku
nenahradí jeho reprezentativnost (Huff 1954).

Huff ve své knize o zavádějící statistice věnoval vzorku se zabudovaným zkreslením úvodní
kapitolu a ukázal, jak běžně se v novinách a reklamě objevují údaje, za nimiž stojí
soubor, který nemohl populaci zastupovat (Huff 1954). Damer řadí do stejné skupiny klamů
argumenty z nereprezentativních dat, kde je vzorek vybrán způsobem, který souvisí se
závěrem (Damer 2009). V medicíně je klasickým problémem výběr přes specializovaná
pracoviště: soubor pacientů kliniky obsahuje lidi, kteří se na ni dostali kvůli
potížím, a souvislosti, které se v něm objeví, nemusí platit v populaci. Statistik Joseph
Berkson popsal, jak takové síto může vytvořit zdánlivou souvislost mezi dvěma nemocemi,
které spolu v populaci nesouvisejí.

## Struktura argumentu

Argument má tuto stavbu. První premisa uvádí, že ve vzorku S má podíl p případů vlastnost V. Závěr
tvrdí, že přibližně podíl p případů v populaci P má vlastnost V. Úsudek je oprávněný jen tehdy, když
S zastupuje P, tedy když se každý člen P mohl do S dostat způsobem, který nesouvisí s V (Govier
2010). Zkreslení vzniká několika mechanismy. Při samovýběru se do vzorku dostávají ti, kdo chtějí
odpovědět, a jejich ochota souvisí s jejich názorem. Při výběru podle dostupnosti se zkoumají ti,
kdo jsou po ruce: studenti, uživatelé jedné služby, čtenáři jednoho média. Při výběru podle sítka se
zkoumají ti, kdo prošli určitou institucí, a jejich složení určila tato instituce. Při ztrátě v
průběhu se vzorek zmenšuje nenáhodně, protože odcházejí právě ti, jejichž výsledek je jiný.

Zvláštní podobou je [zkreslení přežitím](@/kompendium/argumentacni-fauly/statisticke/zkresleni-preziti.md),
kde sítem je samotný výsledek, o jehož příčinách se usuzuje. Jinou příbuznou chybou je
přenos závěru mezi úrovněmi: soubor může zastupovat populaci skupin, ale ne jednotlivců, a
úsudek z jedné úrovně na druhou je pak samostatným klamem, který Robinson popsal jako
problém ekologických korelací (Robinson 1950).

## Detekční znaky

Prvním znakem je chybějící popis toho, jak byl vzorek získán; mluvčí uvádí výsledek a
velikost vzorku, ale ne způsob výběru. Druhým znakem je samovýběr: anketa na webu, výzva k
hlasování, dobrovolné svědectví. Třetím znakem je populace, která se liší od té, o níž se
mluví: průzkum mezi členy sdružení se vydává za názor veřejnosti, zkušenost pacientů jedné
kliniky za obraz nemoci, data uživatelů jedné aplikace za chování všech. Čtvrtým znakem je
důraz na velikost vzorku jako náhradu reprezentativnosti: „odpovědělo nám přes deset tisíc
lidí“ (Huff 1954). Pátým znakem je, že výsledek přesně odpovídá zájmu toho, kdo vzorek sestavil.

Ve vlivových operacích je zkreslený výběr nástrojem vytváření zdání většiny. Organizované
hlasování v online anketách, citování jen souhlasných ohlasů nebo prezentace vybraných
odborníků jako „odborné obce“ vytvářejí dojem shody, který neodpovídá skutečnému rozložení
názorů; kniha tento vzorec popisuje jako [vytváření pseudokonsenzu](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md).
Kahneman upozorňuje, že intuitivní úsudek pracuje s tím, co má před sebou, a nepočítá s
tím, co v souboru chybí, takže zkreslený vzorek působí stejně přesvědčivě jako
reprezentativní (Kahneman 2011).

## Odlišení od platné argumentace

Úsudek z nenáhodného vzorku není klamem, pokud se závěr omezí na populaci, kterou vzorek
zastupuje, nebo pokud jsou známy a zohledněny mechanismy, které jeho složení ovlivnily.
Výzkumník, který zkoumá studenty a závěr výslovně vztáhne na studenty, nechybuje. Klinik,
který popisuje pacienty své ambulance a neříká nic o populaci, také ne. Platné je i
zobecnění z nenáhodného vzorku tam, kde je dobrý důvod předpokládat, že výběrový mechanismus
se zkoumanou vlastností nesouvisí; tento předpoklad však musí být vysloven a podložen.
Govier zdůrazňuje, že hodnocení induktivního argumentu vyžaduje posoudit nejen počet
případů, ale i to, zda vzorek zastupuje populaci v rysech, které by mohly výsledek
ovlivnit (Govier 2010). Odlišení od jiných klamů je důležité i obráceně: kdo vybírá z dat jen
příznivé výsledky, dopouští se spíš výběru třešniček, kdežto zkreslený výběr vzniká už při
získávání dat.

## Stav poznání

Výběrové zkreslení je jedním z nejlépe popsaných zdrojů chyb v empirickém výzkumu a
statistika, epidemiologie a výzkum veřejného mínění pro ně vyvinuly propracované nástroje:
náhodný výběr, vážení, sledování ztrát a analýzy citlivosti. Psychologický výzkum přidává
pohled na to, proč lidé zkreslení v běžném životě nevidí. Gilovich ukazuje, že lidé
posuzují souvislosti podle případů, které jim přicházejí do cesty, a že tyto případy jsou
často vybrány procesy, o kterých nevědí, například tím, s kým se stýkají nebo co se dozvídají
z druhé ruky (Gilovich 1991). Kahneman k tomu dodává, že intuitivní úsudek je necitlivý ke
kvalitě a úplnosti dat a že soudržný příběh z neúplných údajů vytváří stejnou jistotu jako
příběh z úplných (Kahneman 2011). Literatura o zavádějící statistice dokládá, že vzorky se
zabudovaným zkreslením jsou v mediálním prostoru běžné a že se jejich výsledky šíří bez
údaje o způsobu výběru (Huff 1954).

## Obrana a odpověď

Základní obranou je otázka po způsobu výběru: kdo se mohl do vzorku dostat a kdo ne? Pokud
odpověď zní, že se do něj dostali ti, kdo chtěli, kdo byli po ruce nebo kdo prošli určitou
institucí, je třeba zvážit, zda tento mechanismus nesouvisí se zkoumanou otázkou. Druhou
obranou je otázka po populaci: na koho se závěr vztahuje a je to tatáž skupina, ze které
vzorek pochází? Třetí obranou je nepřeceňovat velikost vzorku; velký zkreslený vzorek dává
přesný odhad nesprávné veličiny (Huff 1954).

U průzkumů a anket je užitečné rozlišovat šetření s náhodným výběrem, kde lze odhadnout
chybu, od anket se samovýběrem, kde odhad chyby nemá smysl. U klinických a výzkumných
tvrzení pomáhá zjistit, zda existuje srovnávací skupina vybraná stejným způsobem a zda byly
sledovány i případy, které ze studie vypadly (Govier 2010). Ve veřejném sporu, kde se
výsledek zkresleného vzorku používá jako doklad vůle většiny, je možné věcně popsat, jak
vzorek vznikl, a tím přenést debatu od čísla k otázce, co číslo vůbec měří. Taková odpověď
nevyžaduje vlastní data; stačí ukázat, že předložená data na položenou otázku neodpovídají.

Pro odborníky, kteří sami data sbírají, platí tatáž obrana obráceně. Kdo předem popíše, jak bude
vzorek získán, kdo do něj nemohl vstoupit a jaké zkreslení z toho může plynout, chrání čtenáře i
sebe před tím, aby se dílčí výsledek později vydával za obraz celku. Takový popis omezení není
slabinou studie, ale podmínkou toho, aby se její závěry daly správně použít: jen z něj může čtenář
posoudit, zda vzorek zastupuje populaci v rysech, které by mohly výsledek ovlivnit (Govier 2010).

## Literatura

- Damer, T. E. (2009). *Attacking Faulty Reasoning: A Practical Guide to Fallacy-Free Arguments* (6. vyd.). Belmont: Wadsworth.
- Gilovich, T. (1991). *How We Know What Isn't So: The Fallibility of Human Reason in Everyday Life*. New York: Free Press.
- Govier, T. (2010). *A Practical Study of Argument* (7. vyd.). Belmont: Wadsworth.
- Huff, D. (1954). *How to Lie with Statistics*. New York: W. W. Norton.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Robinson, W. S. (1950). Ecological correlations and the behavior of individuals. *American Sociological Review*, 15(3), 351–357.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Zkreslení přežitím](@/kompendium/argumentacni-fauly/statisticke/zkresleni-preziti.md) – zvláštní případ tohoto hesla

**Příbuzná hesla**

- [Odvolání na většinu](@/kompendium/argumentacni-fauly/relevance/ad-populum.md) – příbuzné heslo (Klamy relevance, Appeal to popularity)
- [Ukvapené zobecnění](@/kompendium/argumentacni-fauly/predpoklady-argumentu/ukvapene-zobecneni.md) – příbuzné heslo (Klamy předpokladu, Hasty generalisation)
- [Výběr třešniček](@/kompendium/argumentacni-fauly/predpoklady-argumentu/vyber-tresnicek.md) – příbuzné heslo (Klamy předpokladu, Cherry picking)
- [Zamlčení důkazů](@/kompendium/argumentacni-fauly/predpoklady-argumentu/zamlceni-dukazu.md) – příbuzné heslo (Klamy předpokladu, Suppressed evidence)
- [Záměna korelace a kauzality](@/kompendium/argumentacni-fauly/kauzalni/korelace-a-kauzalita.md) – příbuzné heslo (Kauzální klamy, Cum hoc ergo propter hoc)
- [Přehlížená společná příčina](@/kompendium/argumentacni-fauly/kauzalni/prehlizena-spolecna-pricina.md) – příbuzné heslo (Kauzální klamy, Ignoring a common cause)
- [Zkreslení přežitím](@/kompendium/argumentacni-fauly/statisticke/zkresleni-preziti.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Survivorship bias)
- [Zákon malých čísel](@/kompendium/argumentacni-fauly/statisticke/zakon-malych-cisel.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Law of small numbers)
- [Ekologický klam](@/kompendium/argumentacni-fauly/statisticke/ekologicky-klam.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Ecological fallacy)
- [Simpsonův paradox](@/kompendium/argumentacni-fauly/statisticke/simpsonuv-paradox.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Simpson's paradox)
- [Klam hledání jinde](@/kompendium/argumentacni-fauly/statisticke/hledani-jinde.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Look-elsewhere effect)

**V kompendiu**

- [2.4 Metodologické poznámky k taxonomii](@/kompendium/02-uvod/metodologicke-poznamky.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-2.1.9 Vytváření pseudokonsenzu](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [7.8 Politická a ideologická EA — totalitní systémy, propaganda, populismus](@/kompendium/07-teoreticke-reflexe/politicka-ea.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Zkreslení přežitím](@/kompendium/argumentacni-fauly/statisticke/zkresleni-preziti.md) – předchozí heslo rodiny
- [Zákon malých čísel](@/kompendium/argumentacni-fauly/statisticke/zakon-malych-cisel.md) – další heslo rodiny

<!-- kompendium:katalog-vazby:end -->
