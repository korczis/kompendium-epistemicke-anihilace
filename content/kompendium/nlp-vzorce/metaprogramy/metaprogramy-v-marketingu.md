+++
title = "Metaprogramy v marketingu"
description = "Ladění reklamních a prodejních sdělení podle metaprogramů zákazníků: co se tvrdí, jak se pozná sdělení šité na obavy profilu a jaká obrana chrání úsudek spotřebitele."
weight = 23
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-metaprogramy", "nlp-vzorec", "nlp-uziti-vliv"]
categories = ["academic"]

[extra]
toc = true
risk_level = "high"
lang = "cs"
keywords = ["Metaprogramy v marketingu", "Meta-programs in marketing", "ladění sdělení podle profilu zákazníka", "Metaprogramy", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-17.23"
catalog_slug = "metaprogramy-v-marketingu"
catalog_family = "metaprogramy"
catalog_family_code = "17"
catalog_family_title = "Metaprogramy"
catalog_family_en = "Meta-programs"
catalog_part = "metaprogramy.b"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Meta-programs in marketing"
catalog_aliases = ["ladění sdělení podle profilu zákazníka"]
catalog_use = "vliv"
catalog_use_cs = "převážně vlivové"
catalog_risk = "vysoke"
catalog_risk_cs = "vysoké"
catalog_broader = "metaprogramy-pojem"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["metaprogramy-pojem"]
catalog_related = ["metaprogramy-pojem", "presupozice-v-reklame", "kotvy-v-reklame", "submodality-v-reklame", "utilizace-strategie", "k-cili-a-od-problemu", "shoda-a-rozdil", "hodnoty-pri-koupi", "shoda-predikatu", "nlp-v-prodeji", "nlp-v-reklame"]
catalog_related_declared = ["nlp-v-reklame", "hodnoty-pri-koupi", "k-cili-a-od-problemu", "presupozice-v-reklame", "kotvy-v-reklame", "nlp-v-prodeji"]
catalog_kompendium = ["kompendium/techniques/ea-9-3-3-feed-personalization-bias.md", "kompendium/techniques/ea-9-3-2-engagement-optimization-EA.md", "kompendium/techniques/ea-9-5-3-emotional-meme-engineering.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/nlp-vzorce/kotveni/kotvy-v-reklame.md", "kompendium/nlp-vzorce/presupozice/presupozice-v-reklame.md", "kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-v-reklame.md", "kompendium/nlp-vzorce/zakladni-pojmy/metaprogramy-pojem.md", "kompendium/techniques/ea-9-3-2-engagement-optimization-EA.md", "kompendium/techniques/ea-9-3-3-feed-personalization-bias.md", "kompendium/techniques/ea-9-5-3-emotional-meme-engineering.md"]
catalog_prev = "metaprogramy-v-naboru"
catalog_next = ""
catalog_position = 23
catalog_family_size = 23
catalog_sources = ["charvet-1997", "cialdini-2009", "druckman-swets-1988", "hall-bodenhamer-1997", "kahneman-2011", "mcguire-1964", "petty-cacioppo-1986", "tversky-kahneman-1981", "witkowski-2010", "van-der-linden-2023"]
catalog_sources_primary = ["charvet-1997", "hall-bodenhamer-1997"]
catalog_sources_roots = []
catalog_sources_critical = ["cialdini-2009", "druckman-swets-1988", "kahneman-2011", "mcguire-1964", "petty-cacioppo-1986", "tversky-kahneman-1981", "witkowski-2010", "van-der-linden-2023"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/metaprogramy.b.toml"
+++

# Metaprogramy v marketingu

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-17.23` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Metaprogramy](@/kompendium/nlp-vzorce/metaprogramy/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Meta-programs in marketing |
| **Jiné názvy** | ladění sdělení podle profilu zákazníka |
| **Obecnější heslo** | [Metaprogramy](@/kompendium/nlp-vzorce/zakladni-pojmy/metaprogramy-pojem.md) |
| **Užití** | převážně vlivové |
| **Riziko zneužití** | vysoké |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Metaprogramy v marketingu označují praxi, v níž se reklamní, prodejní a propagační sdělení
formulují podle kategorií metaprogramů neurolingvistického programování, aby byla pro určitou
skupinu příjemců nebo pro konkrétního zákazníka přesvědčivější. Sdělení pro příjemce, o nichž
se předpokládá, že se motivují cílem, zdůrazňuje, čeho dosáhnou; sdělení pro ty, kteří se
údajně motivují vyhýbáním, zdůrazňuje, čemu se vyhnou. Lidem s vnitřní referencí se nechává pocit,
že rozhodují sami, lidem s vnější referencí se nabízejí recenze, doporučení a počty spokojených
zákazníků. Charvetová v knize o profilu LAB uvádí ke každé kategorii jazykové vzorce, které mají
být pro příslušný pól přesvědčivé, a výslovně je vztahuje k reklamě a prodeji (Charvet 1997).
Obecný pojem kompendium vykládá na stránce
[Metaprogramy](@/kompendium/nlp-vzorce/zakladni-pojmy/metaprogramy-pojem.md). Pro kompendium je
tato praxe důležitá proto, že spojuje dvě rizika: ladění sdělení na obavy a slabiny příjemce a
jeho automatizaci v digitálním prostředí, kde se profil vytváří z chování bez vědomí člověka.

## Původ a souvislosti

Metaprogramy se od konce sedmdesátých let rozvíjely jako pomůcka pro porozumění tomu, jak lidé
třídí informace, a v devadesátých letech se z nich stal rozšířený nástroj komunikačních kurzů
pro obchod (Charvet 1997). Hall a Bodenhamer představili rozsáhlý katalog metaprogramů jako
nástroj pro porozumění lidem a pro ovlivňování v různých kontextech včetně obchodu (Hall a
Bodenhamer 1997). V marketingu se metaprogramy používají spolu s dalšími technikami NLP, které
kompendium popisuje na stránkách [NLP v
reklamě](@/kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-v-reklame.md), [presupozice v
reklamě](@/kompendium/nlp-vzorce/presupozice/presupozice-v-reklame.md) a [kotvy v reklamě a
značkách](@/kompendium/nlp-vzorce/kotveni/kotvy-v-reklame.md).

Myšlenka ladit sdělení podle vlastností příjemce není vlastní jen NLP. Výzkum přesvědčování
dlouho zkoumá, jak se účinek sdělení mění podle toho, jak je pro příjemce osobně relevantní a
jak pečlivě jej zpracovává; model pravděpodobnosti elaborace rozlišuje centrální cestu, kdy
příjemce zvažuje argumenty, a periferní cestu, kdy na něj působí podněty nesouvisející s
obsahem (Petty a Cacioppo 1986). Psychologie rozhodování ukazuje, že stejná volba popsaná jako
možný zisk nebo jako možná ztráta vede k různým rozhodnutím (Tversky a Kahneman 1981). Digitální
reklama tyto poznatky spojila s možností vytvářet profily z chování na internetu a doručovat
různým lidem různá sdělení; van der Linden popisuje cílení sdělení podle psychologického profilu
jako jednu z cest, jimiž se v digitálním prostředí šíří manipulativní obsah (van der Linden 2023).

## Struktura vzorce

Struktura má tři části. První je profilování: příjemci se zařazují podle metaprogramů, buď v
osobním rozhovoru z jejich řeči, nebo v digitálním prostředí z jejich chování, například z toho,
na jaké nabídky reagovali, jaké recenze čtou a jaká slova používají ve vyhledávání. Druhou je
ladění: sdělení se pro každou skupinu formuluje jinak, takže tentýž produkt se jedněm nabízí
jako cesta k cíli a druhým jako ochrana před hrozbou (Charvet 1997). Třetí je doručení: každá
skupina vidí jen svou verzi a nemá důvod předpokládat, že jiní vidí jinou.

Pro analýzu vlivu je podstatné, co tato struktura dělá s úsudkem příjemce. Sdělení laděné na
převažující metaprogram „sedí“, a pocit souladu může působit periferně, tedy nezávisle na síle
argumentů (Petty a Cacioppo 1986). U sdělení laděných na vyhýbání se navíc uplatňuje to, že
lidé vnímají ztráty silněji než stejně velké zisky (Kahneman 2011); kdo je zařazen jako
„motivovaný vyhýbáním“, dostává sdělení, která tuto asymetrii záměrně zesilují. Kompendium
podobný mechanismus v digitálním prostředí popisuje na stránce o [zkreslení personalizovaného
obsahu](@/kompendium/techniques/ea-9-3-3-feed-personalization-bias.md), kde systém doručuje obsah
laděný na profil a postupně zužuje, co člověk vidí. Třetí část struktury, oddělené doručení,
znemožňuje srovnání: příjemce nevidí, že jiným se tentýž produkt nabízí jinými argumenty, a
nemůže tedy rozpoznat, že sdělení bylo vybráno podle něj, a ne podle produktu.

## Detekční znaky

Ladění podle metaprogramů se pozná podle několika znaků. Sdělení se zaměřuje výrazně na
jedinou motivaci, typicky na obavu ze ztráty, a spojuje ji s okamžitým rozhodnutím: „lidé jako
vy, kteří předvídají problémy, se rozhodují ještě dnes“. Oslovení obsahuje přisouzení
vlastnosti, které zní jako lichotka a zároveň vymezuje, jak by se „takový člověk“ měl
rozhodnout. Sdělení obsahuje slova, která příjemce sám dříve použil, například ve formuláři,
v chatu nebo ve vyhledávání. Při srovnání s jinými lidmi se ukáže, že dostávají o témž produktu
odlišné argumenty. Sdělení vynechává informace, které by umožnily srovnání, například úplné
podmínky, omezení nebo ceny konkurence, a nahrazuje je důrazy laděnými na profil. Často se
kombinuje se sociálním důkazem a vzácností, které Cialdini popisuje jako principy zvyšující
ochotu vyhovět bez důkladného zvážení (Cialdini 2009). Kompendium se emočně laděnému obsahu
věnuje i na stránce o [inženýrství emočních
memů](@/kompendium/techniques/ea-9-5-3-emotional-meme-engineering.md).

## Legitimní a manipulativní užití

Legitimní užití dbá na srozumitelnost a úplnost a neladí sdělení na slabiny příjemce. Informační
stránka spotřebitelské poradny, která všem stejně uvádí, co pojistka kryje a co ne, nabízí
srovnání s jinými nabídkami a výslovně nevytváří časový tlak, umožňuje příjemci rozhodovat
centrální cestou, tedy zvážením argumentů (Petty a Cacioppo 1986). Rozumné je i to, když
komunikace nabízí tentýž obsah v různých podobách, například stručný přehled pro ty, kdo chtějí
celek, a podrobné podmínky pro ty, kdo chtějí detaily, pokud jsou obě podoby dostupné všem a
žádná nezamlčuje to, co obsahuje druhá. Takové užití respektuje různé způsoby zpracování
informací, ale nevyužívá je k obejití úsudku.

Manipulativní užití profiluje příjemce bez jeho vědomí, ladí sdělení na jeho obavy a odděluje
jej od informací, které by umožnily srovnání. Reklamní e-mail pojišťovny, který příjemci
zařazenému podle dřívějšího chování jako „opatrný“ připomíná, že jeho rodina může zůstat bez
ochrany, a spojuje to s výzvou k rozhodnutí ještě dnes, nepracuje s produktem, ale s profilem.
Riziko je nejvyšší u skupin, jejichž obavy jsou snadno vyvolatelné, například u starších lidí, u
lidí v zadlužení nebo u rodičů. Rozhodující otázky jsou: Ví příjemce, že je profilován? Dostává
úplné informace, nebo jen důrazy laděné na jeho profil? A je časový tlak odůvodněn produktem,
nebo jen strategií sdělení?

## Stav důkazů

Pro tvrzení, že ladění sdělení podle metaprogramů NLP zvyšuje jejich účinnost, neexistují
podle dostupných přehledů kvalitní kontrolované studie. Kritické přehledy výzkumu NLP konstatují,
že většina tvrzení oboru nebyla v kontrolovaných studiích potvrzena (Witkowski 2010), a
hodnocení, které posuzovalo NLP jako nástroj zvyšování výkonu, nenašlo pro jeho klíčová tvrzení
oporu (Druckman a Swets 1988). Výzkum mimo NLP však dokládá, že rámování volby jako zisku nebo
ztráty mění rozhodnutí (Tversky a Kahneman 1981), že ztráty jsou vnímány silněji než zisky
(Kahneman 2011), že osobní relevance ovlivňuje způsob zpracování sdělení (Petty a Cacioppo 1986)
a že sociální důkaz a vzácnost zvyšují ochotu vyhovět (Cialdini 2009). Účinek, který praktici
připisují metaprogramům, lze tedy vysvětlit známými mechanismy psychologie přesvědčování, aniž
by bylo nutné přijmout typologii NLP. Pro čtenáře z toho plyne dvojí závěr: metaprogramy jako
typologie zákazníků nemají oporu, ale ladění sdělení na obavy a profil příjemce účinné být může,
a proto si zaslouží obranu.

## Obrana a zotavení

Základní obranou je oddělit sdělení od produktu. Pokud reklama nebo prodejce zdůrazňuje
převážně jedinou motivaci, typicky obavu, je užitečné položit si otázku, jak by týž produkt
vypadal, kdyby byl popsán úplně a bez důrazu, a vyhledat jeho podmínky a srovnatelné nabídky
nezávisle na sdělení. Přisouzení vlastnosti v oslovení, například „lidé jako vy“, je signálem,
že sdělení pracuje s profilem, ne s věcí. Lhůty, které nemají věcný důvod, lze ignorovat.
Užitečné je také omezit podklady pro profilování, tedy sledování chování na internetu, kde to
nastavení umožňují. Výzkum psychologické imunizace ukazuje, že předchozí seznámení s oslabenou
podobou přesvědčovací techniky zvyšuje odolnost vůči ní (McGuire 1964), a van der Linden na
tomto principu staví předběžné vyvracení manipulativního obsahu (van der Linden 2023).

Kompendium se příbuzným mechanismům digitálního prostředí věnuje i na stránce o [optimalizaci
zapojení](@/kompendium/techniques/ea-9-3-2-engagement-optimization-EA.md). Na úrovni společnosti
je obranou průhlednost cílení a spotřebitelská gramotnost, která učí rozpoznat, kdy sdělení
mluví k profilu, a ne k věci. Zotavení po nevýhodném rozhodnutí, k němuž vedlo sdělení laděné na
obavy, zahrnuje hlavně oddělení studu od poučení: vědomí, že na rámování a na obavu ze ztráty
reaguje každý, a že chyba nebyla ve slabosti úsudku, ale ve sdělení, které bylo navrženo tak,
aby jej obešlo.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Literatura

- Charvet, S. R. (1997). *Words That Change Minds: Mastering the Language of Influence* (2. vyd.). Dubuque: Kendall/Hunt.
- Cialdini, R. B. (2009). *Influence: Science and Practice* (5. vyd.). Boston: Pearson.
- Druckman, D., & Swets, J. A. (Eds.) (1988). *Enhancing Human Performance: Issues, Theories, and Techniques*. Washington, DC: National Academy Press.
- Hall, L. M., & Bodenhamer, B. G. (1997). *Figuring Out People: Design Engineering with Meta-Programs*. Carmarthen: Crown House Publishing.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- Petty, R. E., & Cacioppo, J. T. (1986). *Communication and Persuasion: Central and Peripheral Routes to Attitude Change*. New York: Springer.
- Tversky, A., & Kahneman, D. (1981). The framing of decisions and the psychology of choice. *Science*, 211(4481), 453–458.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.
- van der Linden, S. (2023). *Foolproof: Why Misinformation Infects Our Minds and How to Build Immunity*. London: 4th Estate.

## Související

**Rodina a hierarchie**

- [Metaprogramy](@/kompendium/nlp-vzorce/metaprogramy/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Metaprogramy](@/kompendium/nlp-vzorce/zakladni-pojmy/metaprogramy-pojem.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Metaprogramy](@/kompendium/nlp-vzorce/zakladni-pojmy/metaprogramy-pojem.md) – příbuzné heslo (Základní pojmy NLP, Meta-programs (concept))
- [Presupozice v reklamě](@/kompendium/nlp-vzorce/presupozice/presupozice-v-reklame.md) – příbuzné heslo (Jazykové presupozice, Presuppositions in advertising)
- [Kotvy v reklamě a značkách](@/kompendium/nlp-vzorce/kotveni/kotvy-v-reklame.md) – příbuzné heslo (Kotvení, Anchors in advertising)
- [Submodality v reklamě a médiích](@/kompendium/nlp-vzorce/submodality/submodality-v-reklame.md) – příbuzné heslo (Submodality, Submodalities in advertising and media)
- [Využití strategie druhého](@/kompendium/nlp-vzorce/strategie-a-modelovani/utilizace-strategie.md) – příbuzné heslo (Strategie a modelování, Strategy utilisation)
- [K cíli a od problému](@/kompendium/nlp-vzorce/metaprogramy/k-cili-a-od-problemu.md) – příbuzné heslo (Metaprogramy, Toward and away from)
- [Shoda a rozdíl](@/kompendium/nlp-vzorce/metaprogramy/shoda-a-rozdil.md) – příbuzné heslo (Metaprogramy, Sameness and difference)
- [Hodnoty při koupi](@/kompendium/nlp-vzorce/metaprogramy/hodnoty-pri-koupi.md) – příbuzné heslo (Metaprogramy, Value buying)
- [Shoda predikátů](@/kompendium/nlp-vzorce/raport-a-kalibrace/shoda-predikatu.md) – příbuzné heslo (Raport a kalibrace, Predicate matching)
- [NLP v prodeji](@/kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-v-prodeji.md) – příbuzné heslo (Vliv a zneužití NLP, NLP in sales)
- [NLP v reklamě](@/kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-v-reklame.md) – příbuzné heslo (Vliv a zneužití NLP, NLP in advertising)

**V kompendiu**

- [EA-9.3.3 Feed Personalization Bias](@/kompendium/techniques/ea-9-3-3-feed-personalization-bias.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-9.3.2 Engagement Optimization EA](@/kompendium/techniques/ea-9-3-2-engagement-optimization-EA.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-9.5.3 Emotional Meme Engineering](@/kompendium/techniques/ea-9-5-3-emotional-meme-engineering.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Metaprogramy v náboru a řízení](@/kompendium/nlp-vzorce/metaprogramy/metaprogramy-v-naboru.md) – předchozí heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
