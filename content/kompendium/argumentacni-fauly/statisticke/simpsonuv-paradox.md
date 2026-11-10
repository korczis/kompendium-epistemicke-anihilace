+++
title = "Simpsonův paradox"
description = "Statistický jev, kdy se vztah platný v každé podskupině po sloučení dat oslabí, zmizí nebo obrátí: jak vzniká, proč klame a kdy rozhodují souhrny."
weight = 11
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-statisticke", "fauly-pojem-a-princip", "fauly-uziti-zadne"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Simpsonův paradox", "Simpson's paradox", "Yuleův–Simpsonův paradox", "zvrat při agregaci", "Statistické a pravděpodobnostní klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-05.11"
catalog_slug = "simpsonuv-paradox"
catalog_family = "statisticke"
catalog_family_code = "05"
catalog_family_title = "Statistické a pravděpodobnostní klamy"
catalog_family_en = "Statistical and probabilistic fallacies"
catalog_part = "statisticke.b"
catalog_type = "concept"
catalog_type_cs = "pojem a princip"
catalog_en = "Simpson's paradox"
catalog_aliases = ["Yuleův–Simpsonův paradox", "zvrat při agregaci"]
catalog_use = "zadne"
catalog_use_cs = "výkladový pojem"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = ""
catalog_narrower = []
catalog_depth = 0
catalog_ancestors = []
catalog_related = ["vyber-tresnicek", "korelace-a-kauzalita", "prehlizena-spolecna-pricina", "zkresleny-vyber", "ekologicky-klam", "klam-skladani"]
catalog_related_declared = ["ekologicky-klam", "prehlizena-spolecna-pricina", "korelace-a-kauzalita", "zkresleny-vyber", "vyber-tresnicek"]
catalog_kompendium = ["kompendium/02-uvod/metodologicke-poznamky.md", "kompendium/population-health/_index.md", "kompendium/critical-perspectives/_index.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/02-uvod/metodologicke-poznamky.md", "kompendium/argumentacni-fauly/predpoklady-argumentu/vyber-tresnicek.md", "kompendium/argumentacni-fauly/statisticke/ekologicky-klam.md", "kompendium/critical-perspectives/_index.md"]
catalog_prev = "ekologicky-klam"
catalog_next = "zavadejici-zivost"
catalog_position = 11
catalog_family_size = 16
catalog_sources = ["kahneman-2011", "mill-1843", "robinson-1950", "simpson-1951"]
catalog_sources_primary = []
catalog_sources_roots = ["mill-1843"]
catalog_sources_critical = ["kahneman-2011", "robinson-1950", "simpson-1951"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Varianty", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Obrana a odpověď"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_review = "agent"
catalog_data = "data/fauly/statisticke.b.toml"
+++

# Simpsonův paradox

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-05.11` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) |
| **Druh** | pojem a princip |
| **Anglicky** | Simpson's paradox |
| **Jiné názvy** | Yuleův–Simpsonův paradox, zvrat při agregaci |
| **Užití** | výkladový pojem |
| **Riziko zneužití** | střední |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Simpsonův paradox je statistický jev, při kterém má vztah mezi dvěma proměnnými v každé z
podskupin jiný směr nebo sílu než tentýž vztah v datech sloučených dohromady. Léčba může být
úspěšnější u mladších i u starších pacientů, a přesto v souhrnu vypadat hůř než léčba
srovnávaná, pokud ji dostávali převážně pacienti s horší prognózou. Nejde o chybu výpočtu:
obě čísla, souhrnné i rozvrstvené, jsou aritmeticky správná. Paradox vzniká proto, že třetí
proměnná souvisí jak s tím, do které skupiny jednotka spadá, tak s výsledkem, a sloučením
dat se její vliv přičte sledovanému vztahu. Jev je pojmenován po statistikovi Edwardu
Simpsonovi, který rozebral, jak se souvislost v kontingenčních tabulkách mění při slučování
podle třetího znaku, a upozornil, že o správném výkladu nerozhodují samotná čísla, ale význam
proměnných (Simpson 1951). V katalogu je veden jako pojem, protože sám o sobě není klamem.
Klamem je až úsudek, který z jedné úrovně dat vyvozuje závěr, jenž patří na jinou.

## Původ a souvislosti

Na to, že sloučení heterogenních skupin může vytvořit zdánlivou nebo zakrýt skutečnou
souvislost, upozorňovali statistikové už na přelomu devatenáctého a dvacátého století, mezi
nimi Karl Pearson a George Udny Yule. Simpson problém zformuloval přesně pro tabulky se třemi
dvojhodnotovými znaky a ukázal, že tatáž čísla lze podle obsahu proměnných rozumně číst
různě, takže žádné mechanické pravidlo neřekne, zda je správné se dívat na souhrn, nebo na
podskupiny (Simpson 1951). Jméno paradoxu se ujalo až později. Souvisí s ním i Robinsonův
rozbor rozdílu mezi korelací územních celků a korelací jednotlivců, protože oba jevy plynou z
toho, jak se vztahy chovají při změně úrovně agregace (Robinson 1950). Ještě starší kořen má
v logice indukce. John Stuart Mill požadoval, aby srovnávané případy byly shodné ve všech
okolnostech kromě jedné, jejíž vliv zkoumáme, a Simpsonův paradox je přesně tím, co se stane,
když tato podmínka neplatí a srovnávané skupiny se liší v okolnosti, která výsledek ovlivňuje
(Mill 1843). Často připomínaným případem je analýza přijímacího řízení na kalifornské
univerzitě v Berkeley ze sedmdesátých let, kde souhrnná čísla naznačovala znevýhodnění žen,
kdežto rozbor po jednotlivých oborech ho nepotvrdil, protože ženy se častěji hlásily na obory
s nízkou úspěšností přijetí.

## Struktura argumentu

Úsudek, který paradox zneužívá nebo mu podléhá, má jednoduchou kostru. Uvede se souhrnné
srovnání dvou skupin a z něho se vyvodí závěr o účinku, kvalitě nebo spravedlnosti. Chybí
otázka, zda se skupiny neliší ve složení podle znaku, který sám ovlivňuje výsledek. Opačný
tvar je stejně možný: argument vybere podskupiny, v nichž vychází žádoucí směr, a souhrn,
který by vycházel jinak, nezmíní. V obou případech se volba úrovně, na které se data čtou,
nevydává za rozhodnutí, ale za samozřejmost. Simpson výslovně ukázal, že tatáž tabulka může
v jednom věcném kontextu vyžadovat čtení po podskupinách a v jiném čtení souhrnu (Simpson
1951). Rozhodnutí tedy patří do argumentu a musí se zdůvodnit. Moderní kauzální analýza,
spojovaná zejména se jménem Judey Pearla, formuluje kritérium tak, že se rozvrstvuje podle
proměnné, která působí na přidělení i na výsledek, ale nikoli podle proměnné, která je sama
důsledkem sledované příčiny.

## Varianty

Paradox se objevuje v několika podobách, které je užitečné rozlišovat. V nejčastější podobě
se směr vztahu po sloučení dat obrátí: v každé podskupině je jedna možnost lepší, v souhrnu
horší. V mírnější podobě vztah po sloučení jen zmizí nebo se objeví tam, kde v podskupinách
není, což byl případ, na kterém Simpson problém předvedl (Simpson 1951). Třetí podoba se
týká změn v čase: celkový průměr se může zlepšovat, i když se zhoršuje v každé skupině, pokud
se mezitím změnilo zastoupení skupin v populaci. Ukazatel celé země tak může růst jen proto,
že přibylo lidí ve skupině s vyššími hodnotami, a přitom v žádné skupině ke zlepšení
nedošlo. Čtvrtá podoba je spojitá: u měřených veličin se může sklon vztahu uvnitř skupin
lišit od sklonu mezi skupinami, což je přesně situace, kterou Robinson popsal u korelací
územních celků (Robinson 1950). Všechny podoby spojuje tatáž struktura, totiž třetí znak,
který souvisí se složením i s výsledkem.

## Detekční znaky

Prvním znakem je srovnání skupin, které se mohou lišit ve složení, aniž by se o tom mluvilo:
nemocnice s různě těžkými pacienty, školy s různými žáky, firmy z různých odvětví. Druhým
znakem je chybějící rozvrstvení u otázky, kde se zjevný třetí faktor nabízí, například
závažnost onemocnění, věk, obor nebo období. Třetím znakem je opačná situace, kdy se ukazují
jen vybrané podskupiny a celkový obraz chybí, což je obdoba
[výběru třešniček](@/kompendium/argumentacni-fauly/predpoklady-argumentu/vyber-tresnicek.md).
Čtvrtým znakem je silný kauzální příběh postavený na jediném souhrnném čísle. Kahneman
popisuje, že intuitivní myšlení dává přednost kauzálním vysvětlením před statistickou
strukturou a že příběh o příčině přesvědčí snáz než úvaha o složení vzorku (Kahneman 2011).
Pátým znakem je nesoulad mezi tím, co tvrdí souhrn, a tím, co by čtenář očekával z dílčích
údajů, pokud jsou k dispozici. Robinsonův rozbor dodává, že souhrnná data o celcích bývají
pro takové zvraty zvlášť náchylná (Robinson 1950).

## Odlišení od platné argumentace

Platná argumentace se od chybné neliší tím, že by vždy dávala přednost podskupinám. Rozvrstvení
podle nesprávné proměnné může vztah zkreslit stejně jako souhrn. Rozhodující je, zda mluvčí
svou volbu úrovně zdůvodní věcnou úvahou o tom, jak data vznikla a jak spolu proměnné
kauzálně souvisejí. Pokud pacienti dostávali léčbu podle závažnosti stavu a závažnost
ovlivňuje výsledek, je správné porovnávat uvnitř vrstev závažnosti. Pokud by však rozvrstvovací
proměnná byla až důsledkem léčby, například délka pobytu v nemocnici, rozvrstvení by vliv
léčby zakrylo. Mill tuto potíž předjímal, když zdůrazňoval, že metoda rozdílu je spolehlivá
jen tehdy, je-li zajištěna shoda ve všech ostatních relevantních okolnostech (Mill 1843).
Proto jsou náhodně přidělené zásahy v experimentu tak cenné: náhoda rozmístí třetí faktory
rovnoměrně a paradox nemá z čeho vzniknout. Platný argument tedy výslovně říká, proč čte data
právě na této úrovni, a je ochoten ukázat i úroveň druhou. Z metodologického hlediska jde o
téma, které kompendium rozebírá v
[metodologických poznámkách](@/kompendium/02-uvod/metodologicke-poznamky.md) k vlastní
taxonomii.

## Stav poznání

Matematická podstata paradoxu je dávno objasněna a v literatuře o kontingenčních tabulkách
patří k základním poznatkům (Simpson 1951). Stejně dobře je doloženo, že vztahy změřené na
různých úrovních agregace se mohou zásadně lišit (Robinson 1950). Otevřené otázky se dnes
netýkají toho, zda paradox existuje, ale jak v konkrétní situaci rozhodnout, která úroveň
odpovídá položené otázce. Na to statistika sama nestačí a potřebuje kauzální předpoklady,
které je třeba vyslovit a obhájit. Výzkum úsudku ukazuje, že lidé spontánně čtou souhrnná
čísla jako přímý doklad o příčině a že tento sklon je silný i u vzdělaných posluchačů
(Kahneman 2011). Pro praxi z toho plyne, že paradox není jen školní kuriozitou: objevuje se v
hodnocení nemocnic a škol, v analýzách diskriminace i v klinických srovnáních, a jeho
přehlédnutí může vést k rozhodnutí opačnému, než jaké by data správně čtená podporovala.

## Obrana a odpověď

Obranou je klást otázku po složení skupin vždy, když se z jejich srovnání vyvozuje příčina
nebo vina. Užitečné je ptát se, podle čeho se jednotky do skupin dostaly, zda se skupiny
liší v něčem, co samo ovlivňuje výsledek, a zda jsou k dispozici údaje rozdělené podle tohoto
znaku. Pokud někdo předkládá jen souhrn, je legitimní požádat o rozvrstvení. Pokud předkládá
jen vybrané podskupiny, je legitimní požádat o souhrn a o zdůvodnění výběru. V obou
případech jde o to, aby volba úrovně přestala být skrytá a stala se součástí argumentu,
kterou lze posoudit (Simpson 1951). Pomáhá také rozlišit dvě otázky, které se často
směšují: co se stalo v datech a co by se stalo při zásahu. První zodpoví souhrn, druhou jen
srovnání, ve kterém jsou ostatní okolnosti vyrovnány (Mill 1843). U veřejných tvrzení, která
pracují s žebříčky, je rozumné hledat informaci o tom, zda byla upravena podle rozdílného
složení hodnocených jednotek. Kritické úvahy o mezích vlastního rámce knihy, shromážděné v
[kritických perspektivách](@/kompendium/critical-perspectives/_index.md), ukazují, že tutéž
opatrnost je třeba uplatnit i na data, která podporují tezi, s níž čtenář souhlasí. Příbuzný
[ekologický klam](@/kompendium/argumentacni-fauly/statisticke/ekologicky-klam.md) popisuje
přenos závěru z celků na jednotlivce (Robinson 1950).

## Literatura

- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Mill, J. S. (1843). *A System of Logic, Ratiocinative and Inductive*. London: John W. Parker.
- Robinson, W. S. (1950). Ecological correlations and the behavior of individuals. *American Sociological Review*, 15(3), 351–357.
- Simpson, E. H. (1951). The interpretation of interaction in contingency tables. *Journal of the Royal Statistical Society, Series B*, 13(2), 238–241.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel

**Příbuzná hesla**

- [Výběr třešniček](@/kompendium/argumentacni-fauly/predpoklady-argumentu/vyber-tresnicek.md) – příbuzné heslo (Klamy předpokladu, Cherry picking)
- [Záměna korelace a kauzality](@/kompendium/argumentacni-fauly/kauzalni/korelace-a-kauzalita.md) – příbuzné heslo (Kauzální klamy, Cum hoc ergo propter hoc)
- [Přehlížená společná příčina](@/kompendium/argumentacni-fauly/kauzalni/prehlizena-spolecna-pricina.md) – příbuzné heslo (Kauzální klamy, Ignoring a common cause)
- [Zkreslený výběr](@/kompendium/argumentacni-fauly/statisticke/zkresleny-vyber.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Sampling bias)
- [Ekologický klam](@/kompendium/argumentacni-fauly/statisticke/ekologicky-klam.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Ecological fallacy)
- [Klam skládání](@/kompendium/argumentacni-fauly/jazykove-klamy/klam-skladani.md) – příbuzné heslo (Klamy jazyka a dvojznačnosti, Fallacy of composition)

**V kompendiu**

- [2.4 Metodologické poznámky k taxonomii](@/kompendium/02-uvod/metodologicke-poznamky.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Populační zdraví a prevence](@/kompendium/population-health/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Kritické perspektivy – meze rámce epistemické anihilace](@/kompendium/critical-perspectives/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Ekologický klam](@/kompendium/argumentacni-fauly/statisticke/ekologicky-klam.md) – předchozí heslo rodiny
- [Zavádějící živost](@/kompendium/argumentacni-fauly/statisticke/zavadejici-zivost.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
