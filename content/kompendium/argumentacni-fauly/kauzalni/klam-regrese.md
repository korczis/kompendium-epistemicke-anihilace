+++
title = "Klam regrese"
description = "Klam, který přirozený návrat extrémních hodnot k průměru připisuje zásahu, trestu nebo odměně: proč ho dělají i odborníci, jak ho poznat a jak ho vyloučit srovnáním."
weight = 7
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-kauzalni", "fauly-neformalni-klam", "fauly-uziti-chyba"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Klam regrese", "Regression fallacy", "regresní klam", "přehlížená regrese k průměru", "Kauzální klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-04.07"
catalog_slug = "klam-regrese"
catalog_family = "kauzalni"
catalog_family_code = "04"
catalog_family_title = "Kauzální klamy"
catalog_family_en = "Causal fallacies"
catalog_part = "kauzalni"
catalog_type = "informal"
catalog_type_cs = "neformální klam"
catalog_en = "Regression fallacy"
catalog_aliases = ["regresní klam", "přehlížená regrese k průměru"]
catalog_use = "chyba"
catalog_use_cs = "převážně chyba uvažování"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "post-hoc"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["post-hoc"]
catalog_related = ["post-hoc", "hracsky-klam", "horka-ruka", "zakon-malych-cisel", "odvolani-na-anekdotu", "klam-placebo"]
catalog_related_declared = ["zakon-malych-cisel", "klam-placebo", "odvolani-na-anekdotu", "hracsky-klam"]
catalog_kompendium = ["kompendium/techniques/ea-7-3-2-tversky-heuristics.md", "kompendium/06-klinicke-aplikace/terapeuticke-pristupy.md", "kompendium/07-teoreticke-reflexe/kognitivni-vedy.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/06-klinicke-aplikace/terapeuticke-pristupy.md", "kompendium/argumentacni-fauly/kauzalni/post-hoc.md", "kompendium/techniques/ea-7-3-2-tversky-heuristics.md"]
catalog_prev = "texasky-strelec"
catalog_next = "zjednodusena-kauzalita"
catalog_position = 7
catalog_family_size = 9
catalog_sources = ["gilovich-1991", "kahneman-2011", "lilienfeld-2015", "mill-1843", "tversky-kahneman-1971", "tversky-kahneman-1974"]
catalog_sources_primary = []
catalog_sources_roots = ["mill-1843"]
catalog_sources_critical = ["gilovich-1991", "kahneman-2011", "lilienfeld-2015", "tversky-kahneman-1971", "tversky-kahneman-1974"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Varianty", "Obrana a odpověď"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_review = "agent"
catalog_data = "data/fauly/kauzalni.toml"
+++

# Klam regrese

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-04.07` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Kauzální klamy](@/kompendium/argumentacni-fauly/kauzalni/_index.md) |
| **Druh** | neformální klam |
| **Anglicky** | Regression fallacy |
| **Jiné názvy** | regresní klam, přehlížená regrese k průměru |
| **Obecnější heslo** | [Po tom, tedy kvůli tomu](@/kompendium/argumentacni-fauly/kauzalni/post-hoc.md) |
| **Užití** | převážně chyba uvažování |
| **Riziko zneužití** | střední |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Klam regrese je usuzování, které změnu po extrémním stavu připisuje zásahu, ačkoli by k ní
došlo i bez něj, protože extrémní hodnoty se při opakovaném měření obvykle vracejí k průměru.
Regrese k průměru je statistická zákonitost, která platí všude tam, kde je měřená veličina
ovlivněna zčásti stálými vlastnostmi a zčásti kolísáním. Mimořádně dobrý výkon bývá zčásti
výsledkem příznivé náhody a příště se proto zpravidla zhorší; mimořádně špatný výkon bývá
zčásti výsledkem nepříznivé náhody a příště se zpravidla zlepší. Klam vzniká tehdy, když se
mezi dvě měření vloží zásah, například léčba, trest, pochvala nebo reforma, a změna se připíše
jemu. Jde o zvláštní případ klamu [po tom, tedy kvůli
tomu](@/kompendium/argumentacni-fauly/kauzalni/post-hoc.md), u něhož je posloupnost zvlášť
zavádějící, protože zásah se nasazuje právě v okamžiku extrému, tedy tehdy, kdy je návrat
nejpravděpodobnější. Tversky a Kahneman tento klam popsali jako jeden z projevů heuristiky
reprezentativnosti: lidé nepředpokládají regresi ani v situacích, kde k ní musí dojít, a když
ji pozorují, vymýšlejí pro ni příčinná vysvětlení (Tversky a Kahneman 1974).

## Původ a souvislosti

Jev regrese popsal v osmdesátých letech devatenáctého století Francis Galton při studiu dědičnosti
tělesné výšky: děti velmi vysokých rodičů byly v průměru vysoké, ale méně než rodiče, a děti
velmi malých rodičů byly malé, ale méně než rodiče. Galton zprvu hledal biologické vysvětlení,
ale ukázalo se, že jde o obecnou statistickou vlastnost dvou nedokonale korelovaných veličin.
Psychologie úsudku pak doložila, jak hluboce je klam zakořeněn. Tversky a Kahneman uvádějí
zkušenost z výcviku letců: instruktoři pozorovali, že po pochvale za mimořádně dobré přistání
následovalo horší přistání a po kritice za mimořádně špatné přistání lepší, a vyvodili z toho,
že pochvala škodí a kritika pomáhá; ve skutečnosti pozorovali regresi (Tversky a Kahneman
1974). Kahneman později tento příklad rozvinul a ukázal, že regrese je pro intuitivní myšlení
obtížně uchopitelná právě proto, že nemá příčinu, kterou by bylo možné vyprávět (Kahneman 2011).
Gilovich popsal regresní klam jako jeden z mechanismů, kterými vznikají a udržují se nepodložená
přesvědčení, včetně pověr o „prokletí“ úspěchu ve sportu (Gilovich 1991).

## Struktura argumentu

Argument má čtyři kroky. Nejprve je pozorován extrémní stav: nejhorší výsledky, nejsilnější
bolest, nejvyšší kriminalita. Potom se zavede zásah, protože extrémní stav ho vyvolává.
Následuje druhé měření, které ukáže změnu směrem k průměru. Nakonec se změna připíše zásahu.
Chybí krok, který by zjistil, jak by se stav vyvíjel bez zásahu. Struktura je zrádná tím, že
výběr podle extrému a nasazení zásahu splývají: lidé vyhledávají léčbu, když je jim nejhůř,
manažeři zasahují, když jsou výsledky nejhorší, a politici vyhlašují opatření, když statistika
vrcholí. Každá z těchto situací vytváří podmínky, ve kterých se zlepšení dostaví s velkou
pravděpodobností samo. Opačná podoba klamu se týká úspěchu: po mimořádném výkonu přijde
průměrnější a vykládá se jako důsledek pýchy, uvolnění nebo „prokletí“ (Gilovich 1991).
Regrese se projevuje i ve vztazích: po nejhorší hádce bývá klidnější období, a pokud se mezitím
odehrálo smíření nebo omluva, snadno se jim připíše účinek, který ve skutečnosti patří
přirozenému kolísání. Zákonitost se od lidských vlastností nijak neodvozuje; je důsledkem
toho, jak se měří veličina zatížená náhodou (Kahneman 2011).

## Detekční znaky

Klam lze rozpoznat podle toho, že zásah byl nasazen v reakci na extrém, a podle toho, že chybí
srovnávací skupina se stejným výchozím extrémem, která zásah nedostala. Dalším znakem je výběr
účastníků podle jednoho měření, například podle jednoho vysokého krevního tlaku nebo jednoho
špatného testu; čím víc měření obsahuje náhodnou složku, tím silnější regrese bude. Typickým
rysem jsou svědectví: lidé, kteří vyhledali pomoc v nejhorším období, upřímně referují o
zlepšení, které skutečně nastalo. Rovněž je znakem asymetrie výkladu: zlepšení po zásahu se
připíše zásahu, zhoršení po úspěchu se připíše jiné příčině, a regrese se nezmíní v žádném z
obou případů. Varovné je i to, když zásah „funguje“ hlavně u těch, kterým bylo nejhůř; přesně
to by předpověděla regrese. V organizacích a ve školství se klam projevuje u programů, do nichž
se vybírají nejslabší jednotlivci a jejichž úspěch se měří následným zlepšením (Tversky a
Kahneman 1974).

## Odlišení od platné argumentace

Ne každé zlepšení po zásahu je regresí. Platný argument o účinku zásahu regresi předvídá a
vylučuje ji designem. Nejsilnějším prostředkem je kontrolní skupina vybraná stejným způsobem,
ideálně náhodným rozdělením lidí se stejným výchozím stavem; o účinku pak vypovídá rozdíl mezi
skupinami, nikoli změna uvnitř jedné z nich. Dalším prostředkem je opakované vstupní měření,
které snižuje vliv náhodné složky na výběr. Užitečné je také sledovat delší časovou řadu před
zásahem a po něm a ptát se, zda změna vybočuje z obvyklého kolísání. Mill formuloval obecnou
podmínku, že k závěru o příčině je třeba srovnat případy, které se liší jen přítomností
domnělé příčiny (Mill 1843). V klinické psychologii je požadavek kontrolovaného srovnání
zdůrazňován právě proto, že zlepšení po intervenci může mít více zdrojů než intervenci samotnou
(Lilienfeld, Lynn a Lohr 2015). Platné je i opačné užití: kdo upozorní, že pozorované zlepšení
může být regresí, nepopírá účinek zásahu, ale žádá data, která by ho od regrese oddělila.

## Stav poznání

Regrese k průměru je matematicky dobře popsaná a její přehlížení patří k nejlépe doloženým
chybám intuitivního úsudku. Tversky a Kahneman ukázali, že lidé nepředpovídají regresi ani
tehdy, když jsou si vědomi nedokonalé spolehlivosti měření, a že když ji pozorují, vysvětlují ji
příčinně (Tversky a Kahneman 1974). V práci o zákonu malých čísel doložili, že i výzkumníci
podceňují kolísání výsledků a přeceňují replikovatelnost (Tversky a Kahneman 1971). Kahneman
popsal regresi jako příklad situace, kdy intuitivní myšlení nahrazuje statistickou zákonitost
příběhem s příčinou (Kahneman 2011). Gilovich upozorňuje, že regresní klam přispívá k
udržování víry v neověřené léčebné postupy, protože lidé je vyhledávají v době nejhorších
potíží (Gilovich 1991). V metodologii klinických studií je regrese standardně uváděna jako
jeden z hlavních důvodů, proč nestačí sledovat změnu u léčených pacientů a proč je nutná
kontrolní skupina. Spor se nevede o existenci jevu, ale o jeho velikost v konkrétních
situacích; ta závisí na spolehlivosti měření a na tom, jak extrémně byli účastníci vybráni.

## Varianty

Klam má několik opakujících se podob. V dopravní politice se opatření, například radary nebo
přestavby křižovatek, umísťují na místa s nejvyšším počtem nehod v posledním období; následný
pokles se pak připíše opatření, i když část poklesu by nastala sama, protože mimořádně špatný
rok bývá vystřídán průměrnějším. Ve sportu a v zaměstnání se po mimořádném úspěchu mluví o
„druhé sezoně“, v níž výkon klesne, a hledá se pro to psychologické vysvětlení. V terapii a v
alternativní medicíně se zlepšení po návštěvě praktika vykládá jako účinek metody, ačkoli
klient přišel v nejhorším období. V osobních vztazích se po krizi a smíření připisuje klidnější
období smíření samotnému. Ve všech případech je společné to, že zásah a výběr podle extrému
přicházejí současně, a dojem účinku proto vzniká i tam, kde žádný účinek není (Tversky a
Kahneman 1974; Gilovich 1991).

## Obrana a odpověď

Základní otázkou je, proč byl zásah nasazen právě v tomto okamžiku. Pokud odpověď zní „protože
bylo nejhůř“, je třeba počítat s tím, že by se stav pravděpodobně zlepšil i bez zásahu. Druhou
otázkou je, jak se vyvíjeli srovnatelní lidé nebo případy, kterým se zásahu nedostalo. Třetí
otázkou je, zda výběr podle extrému nespočíval na jediném měření. U osobních zkušeností s léčbou
pomáhá uznat, že zlepšení bylo skutečné, a zároveň připomenout, že potíže mnoha druhů kolísají
a že nejhorší období bývá vystřídáno lepším (Gilovich 1991). V řízení organizací a ve školství
pomáhá vědět, že trest po špatném výkonu a pochvala po dobrém výkonu se zdají působit opačně,
než ve skutečnosti působí, a že dojem je dán regresí (Kahneman 2011). Při posuzování programů,
reforem a terapeutických nabídek je legitimní žádat srovnávací data a odmítnout svědectví jako
jediný doklad účinku (Lilienfeld, Lynn a Lohr 2015). Souvislosti s heuristikami, které klam
živí, rozebírá stránka [Tversky a Kahneman:
heuristiky](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md), a s klinickým hodnocením
léčby stránka [terapeutické přístupy](@/kompendium/06-klinicke-aplikace/terapeuticke-pristupy.md).

## Literatura

- Gilovich, T. (1991). *How We Know What Isn't So: The Fallibility of Human Reason in Everyday Life*. New York: Free Press.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Lilienfeld, S. O., Lynn, S. J., & Lohr, J. M. (Eds.) (2015). *Science and Pseudoscience in Clinical Psychology* (2. vyd.). New York: Guilford Press.
- Mill, J. S. (1843). *A System of Logic, Ratiocinative and Inductive*. London: John W. Parker.
- Tversky, A., & Kahneman, D. (1971). Belief in the law of small numbers. *Psychological Bulletin*, 76(2), 105–110.
- Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*, 185(4157), 1124–1131.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Kauzální klamy](@/kompendium/argumentacni-fauly/kauzalni/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Po tom, tedy kvůli tomu](@/kompendium/argumentacni-fauly/kauzalni/post-hoc.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Po tom, tedy kvůli tomu](@/kompendium/argumentacni-fauly/kauzalni/post-hoc.md) – příbuzné heslo (Kauzální klamy, Post hoc ergo propter hoc)
- [Hráčský klam](@/kompendium/argumentacni-fauly/statisticke/hracsky-klam.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Gambler's fallacy)
- [Horká ruka](@/kompendium/argumentacni-fauly/statisticke/horka-ruka.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Hot-hand fallacy)
- [Zákon malých čísel](@/kompendium/argumentacni-fauly/statisticke/zakon-malych-cisel.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Law of small numbers)
- [Odvolání na anekdotu](@/kompendium/argumentacni-fauly/hodnoty-a-veda/odvolani-na-anekdotu.md) – příbuzné heslo (Klamy hodnot, přírody a vědy, Anecdotal fallacy)
- [Klam placeba](@/kompendium/argumentacni-fauly/hodnoty-a-veda/klam-placebo.md) – příbuzné heslo (Klamy hodnot, přírody a vědy, Placebo fallacy)

**V kompendiu**

- [EA-7.3.2 Tversky a Kahneman: Heuristiky](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [6.3 Terapeutické přístupy — přehled](@/kompendium/06-klinicke-aplikace/terapeuticke-pristupy.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [7.5 Kognitivní vědy a EA — duální systém, predikční zpracování, embodied cognition](@/kompendium/07-teoreticke-reflexe/kognitivni-vedy.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Texaský střelec](@/kompendium/argumentacni-fauly/kauzalni/texasky-strelec.md) – předchozí heslo rodiny
- [Zjednodušená kauzalita](@/kompendium/argumentacni-fauly/kauzalni/zjednodusena-kauzalita.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
