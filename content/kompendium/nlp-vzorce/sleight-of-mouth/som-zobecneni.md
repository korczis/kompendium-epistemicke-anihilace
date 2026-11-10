+++
title = "Zobecnění"
description = "Vzorec Sleight of Mouth, který povyšuje prvek přesvědčení do obecnější kategorie nebo hodnoty: kdy pomáhá orientaci a kdy rozpouští konkrétní stížnost v abstrakci."
weight = 7
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-sleight-of-mouth", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "high"
lang = "cs"
keywords = ["Zobecnění", "Chunk up", "chunking nahoru v Sleight of Mouth", "Sleight of Mouth", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-07.07"
catalog_slug = "som-zobecneni"
catalog_family = "sleight-of-mouth"
catalog_family_code = "07"
catalog_family_title = "Sleight of Mouth"
catalog_family_en = "Sleight of Mouth"
catalog_part = "sleight-of-mouth"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Chunk up"
catalog_aliases = ["chunking nahoru v Sleight of Mouth"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "vysoke"
catalog_risk_cs = "vysoké"
catalog_broader = "sleight-of-mouth"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["sleight-of-mouth"]
catalog_related = ["zobecnovani", "univerzalni-kvantifikator", "struktura-presvedceni-som", "som-redefinice", "som-rozlozeni", "som-protipriklad", "som-zmena-velikosti-ramce", "hierarchie-idei", "chunking-nahoru"]
catalog_related_declared = ["chunking-nahoru", "hierarchie-idei", "zobecnovani", "som-rozlozeni", "som-redefinice", "univerzalni-kvantifikator"]
catalog_kompendium = ["kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md", "kompendium/techniques/ea-1-6-1-vzorec-guru-a-adept.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/nlp-vzorce/jazykove-vzorce/chunking-nahoru.md", "kompendium/nlp-vzorce/meta-model/meta-model.md", "kompendium/nlp-vzorce/meta-model/univerzalni-kvantifikator.md", "kompendium/nlp-vzorce/sleight-of-mouth/som-model-sveta.md", "kompendium/nlp-vzorce/sleight-of-mouth/som-redefinice.md", "kompendium/nlp-vzorce/sleight-of-mouth/som-rozlozeni.md", "kompendium/nlp-vzorce/zakladni-pojmy/zobecnovani.md", "kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md", "kompendium/techniques/ea-1-6-1-vzorec-guru-a-adept.md"]
catalog_prev = "som-rozlozeni"
catalog_next = "som-protipriklad"
catalog_position = 7
catalog_family_size = 16
catalog_sources = ["bandler-grinder-1975", "bateson-1972", "dilts-1999", "hassan-1988", "herman-1992", "lifton-1961", "lilienfeld-2015", "miller-rollnick-2013", "oconnor-seymour-1990", "passmore-rowson-2019", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1975", "dilts-1999", "oconnor-seymour-1990"]
catalog_sources_roots = ["bateson-1972"]
catalog_sources_critical = ["hassan-1988", "herman-1992", "lifton-1961", "lilienfeld-2015", "miller-rollnick-2013", "passmore-rowson-2019", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/sleight-of-mouth.toml"
+++

# Zobecnění

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-07.07` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Sleight of Mouth](@/kompendium/nlp-vzorce/sleight-of-mouth/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Chunk up |
| **Jiné názvy** | chunking nahoru v Sleight of Mouth |
| **Obecnější heslo** | [Sleight of Mouth](@/kompendium/nlp-vzorce/sleight-of-mouth/sleight-of-mouth.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | vysoké |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Zobecnění, v anglické literatuře NLP „chunk up“, je vzorec souboru Sleight of Mouth, při
kterém se jeden z prvků přesvědčení povýší do obecnější kategorie. Konkrétní okolnost se
přesune na úroveň třídy, ke které patří, chování na úroveň hodnoty, které slouží, nebo
jednotlivý výrok na úroveň principu. Dilts popisuje, že na obecnější úrovni se vztah
vyjádřený přesvědčením může ukázat jako přehnaný, nebo naopak jako součást něčeho, s čím
člověk souhlasí, a podle toho se přesvědčení oslabí nebo posílí (Dilts 1999). Vzorec je
protějškem [rozložení na části](@/kompendium/nlp-vzorce/sleight-of-mouth/som-rozlozeni.md)
a konverzační podobou pohybu, který katalog obecně rozebírá jako
[chunking nahoru](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-nahoru.md). Pro
kompendium je zobecnění zvlášť významné. Patří k nejčastějším pohybům, kterými se
konkrétní a ověřitelná stížnost rozpustí v abstraktní hodnotě, o které se nedá vést spor, a
kterými se jednotlivý čin promění v soud o celé osobě.

## Původ a souvislosti

Pohyb mezi úrovněmi obecnosti má v NLP dva zdroje. Prvním je [meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md), který zobecnění
popisuje jako jeden ze tří procesů, jimiž lidé tvoří [model světa](@/kompendium/nlp-vzorce/sleight-of-mouth/som-model-sveta.md), vedle vypouštění a
zkreslování (Bandler a Grinder 1975); katalog tento proces rozebírá na stránce
[Zobecňování](@/kompendium/nlp-vzorce/zakladni-pojmy/zobecnovani.md). Meta-model se
zobecněními zabývá spíše tak, že je vrací ke konkrétní zkušenosti. Druhým zdrojem je
Batesonova práce s logickými typy, podle níž se třída a její člen nacházejí na různých
úrovních a jejich záměna vede k paradoxům a k poruchám komunikace (Bateson 1972). Učebnice
NLP z této linie vyvodily pojem hierarchie myšlenek, ve které se lze pohybovat nahoru k
obecnějším kategoriím a účelům a dolů ke konkrétním příkladům (O'Connor a Seymour 1990).
V Sleight of Mouth se pohyb nahoru uplatňuje na přesvědčení: prvek se zobecní a zkoumá se,
jak vztah vypadá na vyšší úrovni (Dilts 1999). Manipulativní podoba pohybu je mnohem starší
než NLP. Lifton popsal, že v prostředí myšlenkové reformy se jednotlivé zkušenosti člověka
soustavně podřizují nadřazené doktríně, která má vždy přednost před tím, co člověk sám
prožil (Lifton 1961).

## Struktura vzorce

Vzorec má tři části. První je konkrétní prvek přesvědčení: čin, okolnost nebo výrok.
Druhou je volba obecnější kategorie, do které se prvek zařadí. Tato volba není daná; tentýž
čin lze zařadit pod mnoho různých obecných pojmů, a právě v ní spočívá síla vzorce. Odebrání
výplaty lze zobecnit jako „finanční kontrolu“ i jako „starost o rodinný rozpočet“. Třetí
částí je přenesení vztahu na novou úroveň: místo o činu se mluví o kategorii, a to, co platí
o kategorii, se mlčky vztáhne zpět na čin (Dilts 1999). Z hlediska struktury přesvědčení
vzorec pracuje s jedním z prvků, ale tím, že ho přesune na jinou logickou úroveň, mění i
pravidla, podle kterých se spojení posuzuje.

Pro pozorovatele je rozhodující, že s rostoucí obecností klesá ověřitelnost. O tom, zda
byla výplata převedena na cizí účet, lze rozhodnout podle výpisu. O tom, zda manželka
„věří rodině“, rozhodnout nelze, protože pojem nemá pozorovatelná kritéria. Zobecnění tak
přesouvá spor z roviny, kde by posluchač mohl předložit doklad, do roviny, kde rozhoduje ten,
kdo pojem definuje. Druhou typickou podobou je zobecnění na osobu: z jednoho činu se usuzuje
na charakter („kdo nevěří rodině, nevěří ničemu“). Meta-model takové výroky zachycuje jako
univerzální kvantifikátory, tedy slova „vždy“, „nikdy“, „všichni“ a „nic“, kterými se
jednotlivost mění v zákon (Bandler a Grinder 1975); katalog je rozebírá na stránce o
[univerzálním kvantifikátoru](@/kompendium/nlp-vzorce/meta-model/univerzalni-kvantifikator.md).

## Detekční znaky

Manipulativní zobecnění se pozná podle toho, že na konkrétní stížnost přichází odpověď o
hodnotě: „nejde o peníze, jde o důvěru“, „nejde o tu poznámku, jde o to, jestli bereš
skupinu vážně“. Typické je, že nová obecná rovina je taková, se kterou posluchač nemůže
nesouhlasit, aniž by vypadal špatně, a jeho souhlas s hodnotou se pak vykládá jako souhlas
s konkrétním činem. Dalším znakem je rychlý přechod od činu k identitě: posluchač, který
upozornil na jedno chování, se dozví, co jeho upozornění říká o něm jako o člověku. Ve
skupinách se zobecnění projevuje odkazem na poslání, které má přednost před každou
jednotlivou námitkou, a v takovém rámci je jakákoli kritika automaticky útokem na poslání.
Kompendium popisuje, jak se tím tvrzení stávají nevyvratitelnými, na stránce
[Imunizace proti falsifikaci](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md),
a vztah, ve kterém autorita určuje, co znamenají obecné pojmy, na stránce
[Vzorec guru a adept](@/kompendium/techniques/ea-1-6-1-vzorec-guru-a-adept.md). Hassan
řadí ke kontrole myšlení i zatížený jazyk skupiny, ve kterém obecné pojmy dostávají
význam určený skupinou a nesouhlas se s nimi stává projevem nedostatku víry (Hassan 1988).

## Legitimní a manipulativní užití

Legitimní zobecnění slouží orientaci toho, kdo přesvědčení drží, a ke konkrétnímu se vrací.
Supervizor, který se nově jmenovaného vedoucího ptá, co pro něj znamená vést tým a jakou roli
v tom hraje jeden konflikt, mu pomáhá vidět konflikt v širší souvislosti, ale nepopírá, že
konflikt nastal. Motivační rozhovory pracují s hodnotami klienta podobně: pomáhají mu
uvidět rozpor mezi tím, na čem mu záleží, a tím, jak jedná, a nechávají na něm, co z toho
vyvodí (Miller a Rollnick 2013). V legitimním užití se obecná rovina volí tak, aby se dala
zpětně vztáhnout ke konkrétní zkušenosti, a klient může nabízenou kategorii odmítnout.
Manipulativní zobecnění slouží mluvčímu a ke konkrétnímu se nevrací. Volí obecnou rovinu,
na které konkrétní čin zmizí a na které rozhoduje mluvčí, a z obecné hodnoty pak vyvozuje
povinnost posluchače. Rozlišení usnadňují tři otázky. Lze se z obecné roviny vrátit ke
konkrétnímu činu a posoudit ho? Kdo definuje obecný pojem? A plyne ze souhlasu s hodnotou
skutečně souhlas s činem, nebo je toto spojení jen předpokládáno?

Zobecnění se často kombinuje s dalšími vzorci souboru. Po povýšení stížnosti na hodnotu
následuje [redefinice](@/kompendium/nlp-vzorce/sleight-of-mouth/som-redefinice.md), která
hodnotu pojmenuje výhodně pro mluvčího, nebo vzorec záměr, který mluvčímu přisoudí dobrý
úmysl ve službě této hodnotě. Kombinace působí jako jediný plynulý výklad, ve kterém se
konkrétní čin ztratí během několika vět; i literatura souboru
uvádí vzorce nejen jednotlivě, ale i v kombinacích (Dilts 1999).

## Stav důkazů

Rozlišení úrovní obecnosti je užitečný analytický nástroj s kořeny v teorii logických typů a
v teorii komunikace (Bateson 1972). Vzorec zobecnění v podobě Sleight of Mouth však nebyl,
pokud je kompendiu známo, samostatně testován a literatura souboru ho dokládá příklady
(Dilts 1999). Kritické přehledy výzkumu NLP nacházejí málo kvalitních studií a slabou
podporu tvrzení oboru (Witkowski 2010; Passmore a Rowson 2019). Přehledy pseudovědy v
klinické psychologii řadí k varovným znakům tvrzení formulovaná tak, aby je nebylo možné
vyvrátit, a opakované dodatečné úpravy, kterými se tvrzení chrání před kritikou
(Lilienfeld, Lynn a Lohr 2015). Manipulativní zobecnění vytváří přesně takový stav na
úrovni jednotlivého rozhovoru: spor se přesune tam, kde žádný doklad nemůže rozhodnout. Pro
legitimní užití platí opatrný závěr. Práce s hodnotami klienta je součástí přístupů s
dobrou empirickou oporou (Miller a Rollnick 2013), ale z toho neplyne, že izolovaný pohyb
na vyšší úroveň popisu má sám o sobě terapeutický účinek.

## Obrana a zotavení

Obranou je vrátit rozhovor na konkrétní úroveň a oddělit souhlas s hodnotou od souhlasu s
činem. Lze říci, že na rodině, důvěře nebo poslání záleží, a zároveň trvat na tom, že
konkrétní čin se posuzuje podle toho, co se stalo a co způsobil. Pomáhá zeptat se, jaké
pozorovatelné kritérium by obecný pojem měl, kdo ho určuje a zda platí pro obě strany stejně.
Pokud se z jednoho činu usuzuje na charakter, je užitečné pojmenovat ten přechod přímo a
odmítnout ho jako závěr, který z jedné události neplyne. U lidí, kteří dlouho žili v
prostředí, kde každá námitka byla zobecněna do zrady hodnot, se často objevuje sklon
vlastní konkrétní zkušenosti předem podřizovat obecným pojmům skupiny nebo partnera.
Zotavení zahrnuje obnovu schopnosti mluvit konkrétně o tom, co se stalo, a postupné
oddělování vlastních hodnot od jejich výkladu, který vnucovala autorita (Lifton 1961;
Herman 1992). Odborník by měl v této fázi s obecnými pojmy zacházet zdrženlivě a
opírat se o konkrétní popis zkušenosti klienta.

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bateson, G. (1972). *Steps to an Ecology of Mind*. San Francisco: Chandler.
- Dilts, R. (1999). *Sleight of Mouth: The Magic of Conversational Belief Change*. Capitola: Meta Publications.
- Hassan, S. (1988). *Combatting Cult Mind Control*. Rochester: Park Street Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. New York: W. W. Norton.
- Lilienfeld, S. O., Lynn, S. J., & Lohr, J. M. (Eds.) (2015). *Science and Pseudoscience in Clinical Psychology* (2. vyd.). New York: Guilford Press.
- Miller, W. R., & Rollnick, S. (2013). *Motivational Interviewing: Helping People Change* (3. vyd.). New York: Guilford Press.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Sleight of Mouth](@/kompendium/nlp-vzorce/sleight-of-mouth/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Sleight of Mouth](@/kompendium/nlp-vzorce/sleight-of-mouth/sleight-of-mouth.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Zobecňování](@/kompendium/nlp-vzorce/zakladni-pojmy/zobecnovani.md) – příbuzné heslo (Základní pojmy NLP, Generalisation)
- [Univerzální kvantifikátor](@/kompendium/nlp-vzorce/meta-model/univerzalni-kvantifikator.md) – příbuzné heslo (Meta-model, Universal quantifier)
- [Struktura přesvědčení v Sleight of Mouth](@/kompendium/nlp-vzorce/sleight-of-mouth/struktura-presvedceni-som.md) – příbuzné heslo (Sleight of Mouth, Belief structure in Sleight of Mouth)
- [Redefinice](@/kompendium/nlp-vzorce/sleight-of-mouth/som-redefinice.md) – příbuzné heslo (Sleight of Mouth, Redefine)
- [Rozložení na části](@/kompendium/nlp-vzorce/sleight-of-mouth/som-rozlozeni.md) – příbuzné heslo (Sleight of Mouth, Chunk down)
- [Protipříklad](@/kompendium/nlp-vzorce/sleight-of-mouth/som-protipriklad.md) – příbuzné heslo (Sleight of Mouth, Counter-example)
- [Změna velikosti rámce](@/kompendium/nlp-vzorce/sleight-of-mouth/som-zmena-velikosti-ramce.md) – příbuzné heslo (Sleight of Mouth, Change frame size)
- [Hierarchie myšlenek](@/kompendium/nlp-vzorce/jazykove-vzorce/hierarchie-idei.md) – příbuzné heslo (Jazykové vzorce, Hierarchy of ideas)
- [Chunking nahoru](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-nahoru.md) – příbuzné heslo (Jazykové vzorce, Chunking up)

**V kompendiu**

- [EA-1.3.1 Imunizace proti falsifikaci](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-1.6.1 Vzorec guru a adept](@/kompendium/techniques/ea-1-6-1-vzorec-guru-a-adept.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Rozložení na části](@/kompendium/nlp-vzorce/sleight-of-mouth/som-rozlozeni.md) – předchozí heslo rodiny
- [Protipříklad](@/kompendium/nlp-vzorce/sleight-of-mouth/som-protipriklad.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
