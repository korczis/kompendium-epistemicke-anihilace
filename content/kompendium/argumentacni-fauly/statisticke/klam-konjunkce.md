+++
title = "Klam konjunkce"
description = "Úsudek, podle něhož je souběh dvou událostí pravděpodobnější než jedna z nich: proč podrobný příběh přesvědčuje víc, jak ho poznat a jak na něj odpovědět."
weight = 2
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-statisticke", "fauly-neformalni-klam", "fauly-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Klam konjunkce", "Conjunction fallacy", "konjunkční klam", "problém Lindy", "Statistické a pravděpodobnostní klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-05.02"
catalog_slug = "klam-konjunkce"
catalog_family = "statisticke"
catalog_family_code = "05"
catalog_family_title = "Statistické a pravděpodobnostní klamy"
catalog_family_en = "Statistical and probabilistic fallacies"
catalog_part = "statisticke"
catalog_type = "informal"
catalog_type_cs = "neformální klam"
catalog_en = "Conjunction fallacy"
catalog_aliases = ["konjunkční klam", "problém Lindy"]
catalog_use = "dvoji"
catalog_use_cs = "chyba i taktika"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = ""
catalog_narrower = []
catalog_depth = 0
catalog_ancestors = []
catalog_related = ["kluzky-svah", "zanedbani-zakladni-miry", "zakon-malych-cisel", "klam-zalobce", "zavadejici-zivost"]
catalog_related_declared = ["zanedbani-zakladni-miry", "zakon-malych-cisel", "kluzky-svah", "zavadejici-zivost", "klam-zalobce"]
catalog_kompendium = ["kompendium/techniques/ea-7-3-2-tversky-heuristics.md", "kompendium/techniques/ea-7-3-1-kahneman-system12.md", "kompendium/07-teoreticke-reflexe/politicka-ea.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/argumentacni-fauly/predpoklady-argumentu/dokaz-tvrzenim.md", "kompendium/argumentacni-fauly/statisticke/zanedbani-zakladni-miry.md", "kompendium/techniques/ea-7-3-1-kahneman-system12.md"]
catalog_prev = "zanedbani-zakladni-miry"
catalog_next = "hracsky-klam"
catalog_position = 2
catalog_family_size = 16
catalog_sources = ["grice-1975", "hahn-oaksford-2007", "kahneman-2011", "stanovich-west-2000", "tversky-kahneman-1974", "tversky-kahneman-1983"]
catalog_sources_primary = []
catalog_sources_roots = ["grice-1975"]
catalog_sources_critical = ["hahn-oaksford-2007", "kahneman-2011", "stanovich-west-2000", "tversky-kahneman-1974", "tversky-kahneman-1983"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Obrana a odpověď"]
catalog_trainer_items = 3
catalog_trainer_benign = 1
catalog_review = "agent"
catalog_data = "data/fauly/statisticke.toml"
+++

# Klam konjunkce

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-05.02` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) |
| **Druh** | neformální klam |
| **Anglicky** | Conjunction fallacy |
| **Jiné názvy** | konjunkční klam, problém Lindy |
| **Užití** | chyba i taktika |
| **Riziko zneužití** | střední |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Klam konjunkce je chyba pravděpodobnostního úsudku, při níž člověk považuje souběh dvou nebo
více událostí za pravděpodobnější než některou z těchto událostí samotnou. Pravidlo, které
klam porušuje, je jedno z nejjednodušších v teorii pravděpodobnosti: pravděpodobnost, že
nastane A i B, nemůže být větší než pravděpodobnost, že nastane A. Každý případ, v němž platí
obojí, je zároveň případem, v němž platí A. Tversky a Kahneman nazvali toto pravidlo
pravidlem extenze a ukázali, že intuitivní úsudek ho porušuje soustavně, jakmile přidaná
podmínka udělá popis věrohodnějším, ucelenějším nebo lépe odpovídajícím představě o tom, jak
věci obvykle chodí (Tversky a Kahneman 1983).

V argumentaci se klam objevuje všude tam, kde se pravděpodobnost posuzuje podle kvality
příběhu. Podrobný scénář s motivem, prostředkem a návazností kroků působí přesvědčivěji než
[holé tvrzení](@/kompendium/argumentacni-fauly/predpoklady-argumentu/dokaz-tvrzenim.md), a přitom je každým přidaným detailem méně pravděpodobný. Klam je proto
zvláštním nebezpečím pro vyšetřování, předpovědi, krizové plánování i veřejné spory o to,
co se „doopravdy stalo“.

## Původ a souvislosti

Klasickým pokusem je úloha, v níž účastníci četli krátký popis mladé ženy, která studovala
filozofii, angažovala se v otázkách sociální spravedlnosti a účastnila se demonstrací.
Měli seřadit podle pravděpodobnosti několik tvrzení o jejím současném životě. Velká část
účastníků označila tvrzení, že je bankovní úřednicí a aktivní feministkou, za
pravděpodobnější než tvrzení, že je bankovní úřednicí. Chyba se objevila i u lidí se
statistickým vzděláním a přetrvávala v různých obměnách úlohy (Tversky a Kahneman 1983).
Autoři ji vysvětlili heuristikou reprezentativnosti, kterou popsali už dříve: úsudek o
pravděpodobnosti se nahrazuje úsudkem o podobnosti a popis, který lépe sedí na prototyp,
se jeví jako pravděpodobnější (Tversky a Kahneman 1974).

Tatáž studie ukázala, že klam není jen laboratorní kuriozitou. Objevil se i u odborníků,
kteří odhadovali pravděpodobnost politických scénářů: scénář s uvedenou příčinou a
návazným důsledkem dostával vyšší odhad než samotný důsledek (Tversky a Kahneman 1983).
Kahneman později zdůraznil, že tento rys intuitivního myšlení má širší dosah: rychlý,
asociativní systém úsudku hodnotí soudržnost příběhu, nikoli jeho pravděpodobnost, a
soudržnost s každým věrohodným detailem roste (Kahneman 2011). Kniha tento rozdíl
podrobněji rozebírá v pasáži o [dvou systémech myšlení](@/kompendium/techniques/ea-7-3-1-kahneman-system12.md).

## Struktura argumentu

Klamavý argument má dvě podoby. V první, srovnávací podobě se tvrdí, že scénář A a B je
pravděpodobnější než samotné A, obvykle proto, že B dodává A vysvětlení. Úvaha „je
nepravděpodobné, že by to byla náhoda; spíš to někdo naplánoval a zakryl“ srovnává jedno
holé tvrzení s podrobnějším příběhem, který ho obsahuje, a podrobnějšímu příběhu dává
přednost. Ve druhé, řetězové podobě se tvrdí, že sled kroků A, potom B, potom C je
pravděpodobný, protože každý z kroků sám o sobě je věrohodný. Pravděpodobnost celého
řetězu je přitom při nezávislosti kroků součinem jejich pravděpodobností a s každým
článkem klesá, i když každý článek působí přijatelně.

Řetězová podoba je strukturálně příbuzná argumentu kluzkého svahu, který také skládá řadu
dílčích přechodů v jeden závěr. Hahn a Oaksford ukazují, že takové argumenty nejsou samy o
sobě vadné a že jejich síla závisí na tom, jak pravděpodobné jsou jednotlivé přechody;
vadnými se stávají tehdy, když se věrohodnost každého článku zaměňuje za věrohodnost celku
(Hahn a Oaksford 2007). Konjunkce je také častou součástí [zanedbání základní míry](@/kompendium/argumentacni-fauly/statisticke/zanedbani-zakladni-miry.md):
popis, který je pro hypotézu typický, vytlačí z úsudku jak četnost hypotézy, tak cenu
každé přidané podmínky.

## Detekční znaky

Prvním znakem je bohatost detailu, která roste spolu s jistotou mluvčího. Kdo k holé
události přidává motivy, aktéry a návaznosti a současně tvrdí, že je to „čím dál
pravděpodobnější“, zaměňuje soudržnost za pravděpodobnost. Druhým znakem je srovnání, v němž
je jedna možnost zvláštním případem druhé: „spíš to udělal úmyslně a zakryl to, než že by
se to stalo“. Třetím znakem je řetěz kroků podaný jako jediný celek, přičemž se diskutuje
jen věrohodnost jednotlivých článků, nikdy celku. Čtvrtým znakem je, že přidaný detail
neslouží k vysvětlení dat, ale k doplnění příběhu: nic nového nedokládá, jen dodává
scénáři obraz. V komunikačním prostředí, kde se šíří spiklenecké výklady, se klam objevuje
v podobě vyprávění, které každou mezeru zaplní dalším krokem, takže výsledný celek působí
uceleně právě proto, že je složitý; kniha souvislost s politickou propagandou rozebírá v
kapitole o politické epistemické anihilaci. Kahneman upozorňuje, že scénáře, které
nabízejí příčinu, jsou pro intuitivní úsudek zvlášť přitažlivé, protože uspokojují potřebu
porozumět (Kahneman 2011).

## Odlišení od platné argumentace

Klamem není každá úvaha, v níž podrobnější hypotéza vítězí. Pokud přidaný detail vysvětluje
pozorovaná data lépe, může být podrobnější hypotéza po zvážení důkazů lépe podložená než
jednodušší alternativa, se kterou se srovnává; srovnání se však pak netýká A proti A a B,
ale dvou různých vysvětlení téhož pozorování. Také je legitimní říci, že scénář A a B
stojí za pozornost kvůli svým důsledkům, i když je méně pravděpodobný než samotné A:
krizové plánování se zabývá i málo pravděpodobnými, ale závažnými řetězy událostí.
Rozhodující je, aby se závažnost nezaměňovala za pravděpodobnost.

Odlišení komplikuje i řeč. Kritici upozornili, že v běžném rozhovoru se slovo
„pravděpodobný“ nepoužívá vždy v matematickém smyslu a že nabídka dvou možností, z nichž
jedna je obecnější, může posluchače vést k výkladu, že obecnější možnost vylučuje tu
podrobnější. Takový výklad by odpovídal konverzačním maximám, podle nichž mluvčí neříká
méně, než je pro účel rozhovoru třeba (Grice 1975). Tato námitka vysvětluje část chyb v
laboratoři, ale nevysvětluje klam v situacích, kde jde o skutečné rozhodnutí a kde je
srovnávaná dvojice jasná.

## Stav poznání

Klam konjunkce je dobře doložený a opakovaně replikovaný jev (Tversky a Kahneman 1983;
Kahneman 2011). Výzkum ukázal, že jeho četnost závisí na podání úlohy. Když se otázka
formuluje v četnostech, například kolik ze sta lidí odpovídajících popisu má danou
vlastnost, chyb ubývá, protože vztah množin se stává viditelným (Tversky a Kahneman 1983).
Debata o tom, zda jde o chybu, nebo o jiné porozumění úloze, vedla k obecnější diskusi o
tom, jaké normy racionality je rozumné na lidský úsudek uplatňovat. Stanovich a West do ní
vnesli data o individuálních rozdílech: odpovědi, které se řídí normativním modelem, nejsou
náhodné, ale souvisejí s kognitivními schopnostmi a myšlenkovým stylem, což podle nich
oslabuje výklad, že odchylka od normy je jen artefaktem úlohy (Stanovich a West 2000). Pro
praxi plyne, že klam je reálný, že jeho síla roste s názorností příběhu a že ho lze oslabit
převedením úvahy na počty a množiny.

## Obrana a odpověď

První odpovědí na klam je rozložit příběh. Kdo slyší podrobný scénář, může ho rozepsat na
jednotlivá tvrzení a u každého se ptát, čím je doloženo. Ukáže se tím, které části jsou
podloženy daty a které slouží jen k doplnění obrazu. Druhou odpovědí je připomenout
pravidlo extenze v jeho prosté podobě: všechny případy, kdy se stalo A i B, jsou zároveň
případy, kdy se stalo A, takže podrobnější varianta nemůže být pravděpodobnější. Tato
připomínka nemusí znít jako výtka; stačí ji použít jako otázku, kterou si klade každý
posuzovatel. Třetí odpovědí je převést úvahu na četnosti: ze sta situací, v nichž se stalo
A, v kolika se stalo i B? Takové převedení podle výzkumu klam oslabuje (Tversky a Kahneman
1983).

Ve vyšetřování a analýze je užitečné vést si oddělené hodnocení věrohodnosti a
pravděpodobnosti. Věrohodný příběh pomáhá hledat stopy, ale nemá rozhodovat o tom, která
hypotéza je lépe podložená. Kahneman doporučuje u předpovědí a plánů vědomě hledat
jednodušší a obecnější výsledek, který je v podrobném scénáři obsažen, a teprve od něj
odvozovat pravděpodobnost dalších kroků (Kahneman 2011). V rozhovoru, kde podrobnost
příběhu slouží jako náhražka důkazů, pomáhá klidně oddělit, co je doloženo, od toho, co
je dovyprávěno, a ponechat dovyprávěné části otevřené jako hypotézy, nikoli jako závěry.

## Literatura

- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Hahn, U., & Oaksford, M. (2007). The rationality of informal argumentation: A Bayesian approach to reasoning fallacies. *Psychological Review*, 114(3), 704–732.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Stanovich, K. E., & West, R. F. (2000). Individual differences in reasoning: Implications for the rationality debate? *Behavioral and Brain Sciences*, 23(5), 645–665.
- Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*, 185(4157), 1124–1131.
- Tversky, A., & Kahneman, D. (1983). Extensional versus intuitive reasoning: The conjunction fallacy in probability judgment. *Psychological Review*, 90(4), 293–315.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel

**Příbuzná hesla**

- [Kluzký svah](@/kompendium/argumentacni-fauly/predpoklady-argumentu/kluzky-svah.md) – příbuzné heslo (Klamy předpokladu, Slippery slope)
- [Zanedbání základní míry](@/kompendium/argumentacni-fauly/statisticke/zanedbani-zakladni-miry.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Base-rate neglect)
- [Zákon malých čísel](@/kompendium/argumentacni-fauly/statisticke/zakon-malych-cisel.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Law of small numbers)
- [Klam žalobce](@/kompendium/argumentacni-fauly/statisticke/klam-zalobce.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Prosecutor's fallacy)
- [Zavádějící živost](@/kompendium/argumentacni-fauly/statisticke/zavadejici-zivost.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Misleading vividness)

**V kompendiu**

- [EA-7.3.2 Tversky a Kahneman: Heuristiky](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-7.3.1 Kahneman: Systém 1 a 2](@/kompendium/techniques/ea-7-3-1-kahneman-system12.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [7.8 Politická a ideologická EA — totalitní systémy, propaganda, populismus](@/kompendium/07-teoreticke-reflexe/politicka-ea.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Zanedbání základní míry](@/kompendium/argumentacni-fauly/statisticke/zanedbani-zakladni-miry.md) – předchozí heslo rodiny
- [Hráčský klam](@/kompendium/argumentacni-fauly/statisticke/hracsky-klam.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
