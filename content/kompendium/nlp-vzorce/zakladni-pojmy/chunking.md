+++
title = "Chunking"
description = "Pojem NLP pro přesun mezi úrovněmi obecnosti, od hodnot ke konkrétním krokům a zpět: jak pomáhá dorozumění a jak skok mezi úrovněmi zastírá, co se skutečně žádá."
weight = 29
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-zakladni-pojmy", "nlp-pojem", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Chunking", "velikost celku", "posun úrovně obecnosti", "Základní pojmy NLP", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-02.29"
catalog_slug = "chunking"
catalog_family = "zakladni-pojmy"
catalog_family_code = "02"
catalog_family_title = "Základní pojmy NLP"
catalog_family_en = "Core NLP concepts"
catalog_part = "zakladni-pojmy.c"
catalog_type = "concept"
catalog_type_cs = "pojem"
catalog_en = "Chunking"
catalog_aliases = ["velikost celku", "posun úrovně obecnosti"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = ""
catalog_narrower = ["hierarchie-idei"]
catalog_depth = 0
catalog_ancestors = []
catalog_related = ["meta-model", "umyslna-vagnost", "som-rozlozeni", "som-zmena-velikosti-ramce", "obecne-a-specificke", "hierarchie-idei", "chunking-nahoru", "chunking-dolu", "lateralni-chunking"]
catalog_related_declared = ["chunking-nahoru", "chunking-dolu", "lateralni-chunking", "hierarchie-idei", "meta-model", "umyslna-vagnost"]
catalog_kompendium = ["kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md", "kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md", "kompendium/techniques/ea-1-3-3-tematicka-diverze.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/nlp-vzorce/jazykove-vzorce/hierarchie-idei.md", "kompendium/nlp-vzorce/meta-model/meta-model.md", "kompendium/nlp-vzorce/milton-model/milton-model.md", "kompendium/nlp-vzorce/milton-model/umyslna-vagnost.md", "kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md", "kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md", "kompendium/techniques/ea-1-3-3-tematicka-diverze.md"]
catalog_prev = "ramec-pojem"
catalog_next = "casova-osa-pojem"
catalog_position = 29
catalog_family_size = 42
catalog_sources = ["bandler-grinder-1975", "bandler-grinder-1975b", "cialdini-2009", "freedman-fraser-1966", "lifton-1961", "miller-1956", "oconnor-seymour-1990", "tosey-mathison-2009", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1975", "bandler-grinder-1975b", "oconnor-seymour-1990"]
catalog_sources_roots = ["miller-1956"]
catalog_sources_critical = ["cialdini-2009", "freedman-fraser-1966", "lifton-1961", "tosey-mathison-2009", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/zakladni-pojmy.c.toml"
+++

# Chunking

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-02.29` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Základní pojmy NLP](@/kompendium/nlp-vzorce/zakladni-pojmy/_index.md) |
| **Druh** | pojem |
| **Anglicky** | Chunking |
| **Jiné názvy** | velikost celku, posun úrovně obecnosti |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Chunkingem se v neurolingvistickém programování rozumí přesouvání pozornosti mezi úrovněmi obecnosti, na kterých lze o věci mluvit. Slovo pochází z angličtiny, kde „chunk“ znamená kus nebo celek, a označuje velikost informačního celku, se kterým člověk právě pracuje. Přesun k obecnějším kategoriím, hodnotám a účelům NLP nazývá chunkingem nahoru, přesun ke konkrétním příkladům, detailům a krokům chunkingem dolů a přesun k jiným případům téže kategorie chunkingem do stran (O'Connor a Seymour 1990). O dovolené lze mluvit jako o odpočinku, o svobodě nebo o rodinném čase, tedy obecněji, nebo jako o konkrétním týdnu v konkrétním místě, tedy konkrétněji, nebo ji srovnávat s jinými způsoby, jak si odpočinout. NLP tvrdí, že schopnost vědomě volit úroveň obecnosti usnadňuje dorozumění, vyjednávání i řešení problémů. Pro kompendium je pojem důležitý proto, že nepozorovaný přesun mezi úrovněmi je jedním z nejběžnějších prostředků, jak spojit souhlas s nespornou hodnotou s požadavkem, který z ní vůbec neplyne.

## Původ a souvislosti

Pojem „chunk“ zavedl do psychologie George Miller v článku o omezené kapacitě krátkodobé paměti. Ukázal, že lidé si mohou současně podržet jen omezený počet položek, ale že tyto položky mohou být různě velké celky, a seskupování informací do větších celků proto zvyšuje, kolik informace lze zpracovat (Miller 1956). NLP tento pojem převzalo a posunulo jeho význam: nejde mu už jen o velikost paměťových celků, ale o úroveň abstrakce, na které se o věci mluví. Toto posunutí navazuje na dvě jazykové linie oboru. [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) se ptá na konkrétnost, například „kdo přesně“, „jak přesně“, a vede tedy řeč dolů ke specifickým údajům (Bandler a Grinder 1975). [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) naopak pracuje s obecnými a vágními formulacemi, do kterých si posluchač doplní vlastní obsah, a vede tedy řeč nahoru (Bandler a Grinder 1975b). Kompendium se k této vágnosti vrací na stránce o [úmyslné vágnosti](@/kompendium/nlp-vzorce/milton-model/umyslna-vagnost.md). Rozpracování úrovní do takzvané hierarchie idejí, ve které se mezi úrovněmi pohybuje tázáním po účelu nebo po příkladu, popisuje kompendium na stránce o [hierarchii idejí](@/kompendium/nlp-vzorce/jazykove-vzorce/hierarchie-idei.md).

## Struktura vzorce

V řeči se přesun mezi úrovněmi pozná podle typických formulací. Přesun nahoru se ohlašuje otázkami po účelu nebo po kategorii, například „a k čemu to je?“, „co je pro vás na tom důležité?“, „čeho je to příkladem?“, a odpověďmi, které míří k hodnotám: bezpečí, svoboda, rodina, úspěch. Přesun dolů se ohlašuje otázkami po konkrétnosti, například „co přesně?“, „kdy?“, „kolik?“, „jak to poznáte?“, a odpověďmi, které míří k údajům. Přesun do stran se ohlašuje srovnáním, analogií nebo nabídkou jiného příkladu téže kategorie. Na vyšších úrovních je shoda snazší, protože se v obecných hodnotách lidé shodnou častěji než v konkrétních řešeních; na nižších úrovních jsou rozdíly zřetelnější, ale také lépe ověřitelné. Učebnicové podání NLP tuto vlastnost výslovně spojuje s vyjednáváním: shoda se má hledat nahoře a rozdíly řešit dole (O'Connor a Seymour 1990). Totéž pozorování však vysvětluje i to, proč je vyšší úroveň vhodným úkrytem pro mluvčího, který se chce vyhnout konkrétnímu závazku: obecné výroky se těžko vyvracejí, protože netvrdí nic, co by šlo ověřit. Pro analýzu vlivu je klíčové, že přesun mezi úrovněmi nemusí být logickým krokem. Z hodnoty „chci, aby moje děti měly lepší budoucnost“ neplyne žádné konkrétní rozhodnutí; plyne z ní jen celá škála možností. Pokud mluvčí přejde od hodnoty rovnou k jednomu konkrétnímu kroku a podá ho jako její nutný důsledek, vytváří zdání logické vazby tam, kde žádná není. Souhlas získaný na vyšší úrovni se tak přenáší na úroveň nižší, kde by jinak bylo třeba ho teprve získat.

## Detekční znaky

Manipulativní práce s úrovněmi obecnosti má několik pozorovatelných podob. První je skok z nesporné hodnoty k jedinému konkrétnímu požadavku: „chcete přece bezpečí, takže podepíšete tuto smlouvu“. Znakem je, že mezi hodnotou a požadavkem chybí jakékoli srovnání alternativ. Druhou podobou je únik nahoru: na konkrétní otázku po ceně, termínu nebo odpovědnosti odpoví mluvčí obecnou deklarací hodnot, takže otázka zůstane nezodpovězena, ale posluchač má pocit, že odpověď dostal. Třetí podobou je zahlcení dolů: místo odpovědi na podstatnou otázku přijde záplava detailů, ve kterých se podstata ztratí. Kompendium tento mechanismus popisuje u [iluzorní komplexity](@/kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md) a ve spojení se žargonem u [terminologické mystifikace](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md). Čtvrtou podobou je přesun do stran, kdy se místo k projednávané věci přejde k jiné, zdánlivě příbuzné, což odpovídá [tematické diverzi](@/kompendium/techniques/ea-1-3-3-tematicka-diverze.md). Pátou podobou je postupné sestupování od malého souhlasu k většímu závazku, kdy se každý další krok prezentuje jako jen konkrétnější vyjádření toho, s čím člověk už souhlasil. Výzkum ukazuje, že malý počáteční závazek zvyšuje pravděpodobnost pozdějšího souhlasu s větším požadavkem (Freedman a Fraser 1966).

## Legitimní a manipulativní užití

Legitimní užití je otevřené a obousměrné. Moderátorka schůze, která nejdřív zjistí, že všichni chtějí bezpečnější přechod u školy, a pak se ptá, jaká konkrétní řešení přicházejí v úvahu a co by stála, používá shodu na vyšší úrovni jako výchozí bod a konkrétní varianty ponechává k posouzení. Vyjednávání a mediace běžně pracují s tím, že strany sporu, které se neshodnou na řešení, se mohou shodnout na zájmech, a od nich hledat nová řešení. Ve výuce a vědecké práci je přesun mezi úrovněmi základní dovedností: obecné tvrzení se ověřuje na konkrétních případech a z konkrétních případů se vyvozují obecná tvrzení. Manipulativní užití se od legitimního liší tím, že přesun je jednosměrný a skrytý. Souhlas na vyšší úrovni se vydává za souhlas na nižší, otázky po konkrétnosti se odbývají obecnými hodnotami, nebo se konkrétní otázka zahltí detaily. Cialdini popisuje, jak lidé, kteří se jednou k něčemu zavázali, pociťují tlak jednat v souladu s tímto závazkem, i když se okolnosti změnily (Cialdini 2009). Rozhodující otázky jsou: Plyne konkrétní požadavek z obecné hodnoty nutně, nebo je jen jednou z mnoha možností? Dostal jsem odpověď na úrovni, na které jsem se ptal? A souhlasil jsem s cílem, nebo s prostředkem?

## Stav důkazů

Millerův poznatek o seskupování informací do celků patří k základům kognitivní psychologie, i když přesná kapacita krátkodobé paměti se v pozdějším výzkumu upřesňovala (Miller 1956). NLP pojem však použilo v jiném smyslu, jako úroveň abstrakce v rozhovoru, a pro tento posunutý význam neexistuje výzkum, který by potvrzoval specifická tvrzení oboru o účinnosti „chunkingu“ ve vyjednávání, terapii nebo prodeji. Kritické přehledy výzkumu NLP konstatují, že většina tvrzení oboru nemá kvalitní empirickou oporu (Witkowski 2010). Tosey a Mathison upozorňují, že řada pojmů NLP vznikla přenesením myšlenek z jiných oborů a že jejich původní vědecký obsah se při tom často posunul (Tosey a Mathison 2009). Doložené jsou naopak mechanismy, které vysvětlují vlivové užití přesunu mezi úrovněmi, například efekt postupného závazku (Freedman a Fraser 1966) nebo tlak na konzistenci s dřívějším souhlasem (Cialdini 2009). Pro čtenáře z toho plyne, že pojem je užitečný jako popisný nástroj, ale nikoli jako doklad zvláštní dovednosti, kterou by NLP ovládalo.

## Obrana a zotavení

Základní obranou je oddělit souhlas s cílem od souhlasu s prostředkem. Pokud mluvčí přechází od hodnoty, se kterou souhlasíte, k jednomu konkrétnímu kroku, je na místě se zeptat, jaké jiné kroky k témuž cíli vedou a proč by měl být zvolen právě tento. Druhou obranou je trvat na odpovědi na úrovni, na které byla položena otázka. Na otázku po ceně je odpovědí částka, ne popis toho, jak důležitá je pro vás rodina. Na otázku po důkazu je odpovědí doklad, ne výčet hodnot, které mluvčí sdílí. Třetí obranou je všímat si postupného sestupu k větším závazkům a vracet se k tomu, s čím jste skutečně souhlasili na začátku. Zapsat si, co přesně bylo dohodnuto, pomáhá rozpoznat, kdy se rozsah dohody posunul. Lidé, kteří byli takto vedeni k závazkům, například finančním, mívají později pocit, že „nevědí, jak se to stalo“. Pomáhá jim rekonstruovat jednotlivé přesuny a rozpoznat, že souhlas s obecnou hodnotou nebyl souhlasem s tím, co z něj druhá strana vyvodila. U skupin s vlastním slovníkem, jak je popisuje Lifton, je zotavení spojeno i s návratem ke konkrétnímu, ověřitelnému jazyku místo obecných hesel (Lifton 1961).

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Cialdini, R. B. (2009). *Influence: Science and Practice* (5. vyd.). Boston: Pearson.
- Freedman, J. L., & Fraser, S. C. (1966). Compliance without pressure: The foot-in-the-door technique. *Journal of Personality and Social Psychology*, 4(2), 195–202.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. New York: W. W. Norton.
- Miller, G. A. (1956). The magical number seven, plus or minus two: Some limits on our capacity for processing information. *Psychological Review*, 63(2), 81–97.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Tosey, P., & Mathison, J. (2009). *Neuro-Linguistic Programming: A Critical Appreciation for Managers and Developers*. Basingstoke: Palgrave Macmillan.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Základní pojmy NLP](@/kompendium/nlp-vzorce/zakladni-pojmy/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Hierarchie myšlenek](@/kompendium/nlp-vzorce/jazykove-vzorce/hierarchie-idei.md) – zvláštní případ tohoto hesla

**Příbuzná hesla**

- [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) – příbuzné heslo (Meta-model, Meta Model)
- [Úmyslná vágnost](@/kompendium/nlp-vzorce/milton-model/umyslna-vagnost.md) – příbuzné heslo (Milton-model, Artful vagueness)
- [Rozložení na části](@/kompendium/nlp-vzorce/sleight-of-mouth/som-rozlozeni.md) – příbuzné heslo (Sleight of Mouth, Chunk down)
- [Změna velikosti rámce](@/kompendium/nlp-vzorce/sleight-of-mouth/som-zmena-velikosti-ramce.md) – příbuzné heslo (Sleight of Mouth, Change frame size)
- [Obecné a specifické](@/kompendium/nlp-vzorce/metaprogramy/obecne-a-specificke.md) – příbuzné heslo (Metaprogramy, General and specific)
- [Hierarchie myšlenek](@/kompendium/nlp-vzorce/jazykove-vzorce/hierarchie-idei.md) – příbuzné heslo (Jazykové vzorce, Hierarchy of ideas)
- [Chunking nahoru](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-nahoru.md) – příbuzné heslo (Jazykové vzorce, Chunking up)
- [Chunking dolů](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-dolu.md) – příbuzné heslo (Jazykové vzorce, Chunking down)
- [Laterální chunking](@/kompendium/nlp-vzorce/jazykove-vzorce/lateralni-chunking.md) – příbuzné heslo (Jazykové vzorce, Lateral chunking)

**V kompendiu**

- [EA-1.2.3 Iluzorní komplexita](@/kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-1.1.3 Terminologická mystifikace](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-1.3.3 Tematická diverze](@/kompendium/techniques/ea-1-3-3-tematicka-diverze.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Rámec](@/kompendium/nlp-vzorce/zakladni-pojmy/ramec-pojem.md) – předchozí heslo rodiny
- [Časová osa](@/kompendium/nlp-vzorce/zakladni-pojmy/casova-osa-pojem.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
