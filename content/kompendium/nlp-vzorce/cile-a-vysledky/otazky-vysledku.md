+++
title = "Otázky výsledku"
description = "Otázky, kterými se v NLP vyjasňuje žádaný stav: otevřené ujasnění zakázky, nebo předprodejní rozhovor, který zesiluje touhu a sbírá závazky."
weight = 9
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-cile-a-vysledky", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Otázky výsledku", "Outcome questions", "otázky na žádaný stav", "otázky k cíli", "Cíle a výsledky", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-19.09"
catalog_slug = "otazky-vysledku"
catalog_family = "cile-a-vysledky"
catalog_family_code = "19"
catalog_family_title = "Cíle a výsledky"
catalog_family_en = "Outcomes"
catalog_part = "cile-a-vysledky"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Outcome questions"
catalog_aliases = ["otázky na žádaný stav", "otázky k cíli"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "dobre-formulovany-vysledek"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["dobre-formulovany-vysledek"]
catalog_related = ["meta-model", "otazky-s-presupozici", "ramec-vysledku", "kartezske-otazky", "dobre-formulovany-vysledek", "nlp-v-prodeji", "budouci-prehravani-v-prodeji"]
catalog_related_declared = ["otazky-s-presupozici", "meta-model", "budouci-prehravani-v-prodeji", "nlp-v-prodeji", "ramec-vysledku"]
catalog_kompendium = ["kompendium/techniques/ea-2-2-10-future-blackmail-implantace.md", "kompendium/forensic-legal/1-forensic-interview-protocol.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/forensic-legal/1-forensic-interview-protocol.md", "kompendium/nlp-vzorce/cile-a-vysledky/dobre-formulovany-vysledek.md", "kompendium/nlp-vzorce/kriticke-hodnoceni/stav-dukazu-nlp.md", "kompendium/nlp-vzorce/meta-model/meta-model.md", "kompendium/nlp-vzorce/presupozice/otazky-s-presupozici.md", "kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-v-prodeji.md", "kompendium/techniques/ea-2-2-10-future-blackmail-implantace.md"]
catalog_prev = "dukazni-procedura"
catalog_next = "od-problemu-k-vysledku"
catalog_position = 9
catalog_family_size = 10
catalog_sources = ["bandler-grinder-1975", "cialdini-2009", "freedman-fraser-1966", "haley-1973", "herman-1992", "loftus-palmer-1974", "mcguire-1964", "miller-rollnick-2013", "oconnor-seymour-1990", "passmore-rowson-2019", "rogers-1951", "sharpley-1987", "watzlawick-1974", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1975", "oconnor-seymour-1990"]
catalog_sources_roots = ["haley-1973", "watzlawick-1974"]
catalog_sources_critical = ["cialdini-2009", "freedman-fraser-1966", "herman-1992", "loftus-palmer-1974", "mcguire-1964", "miller-rollnick-2013", "passmore-rowson-2019", "rogers-1951", "sharpley-1987", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/cile-a-vysledky.toml"
+++

# Otázky výsledku

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-19.09` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Cíle a výsledky](@/kompendium/nlp-vzorce/cile-a-vysledky/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Outcome questions |
| **Jiné názvy** | otázky na žádaný stav, otázky k cíli |
| **Obecnější heslo** | [Dobře formulovaný výsledek](@/kompendium/nlp-vzorce/cile-a-vysledky/dobre-formulovany-vysledek.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Otázky výsledku jsou v NLP souhrnným označením pro otázky, jimiž se v rozhovoru vyjasňuje
žádaný stav a jimiž se prakticky uplatňují podmínky [dobře formulovaného
výsledku](@/kompendium/nlp-vzorce/cile-a-vysledky/dobre-formulovany-vysledek.md). Ptají se, co
člověk chce, podle čeho pozná, že toho dosáhl, kdy a kde to chce, co mu brání, co k tomu
potřebuje a co by dosažení cíle znamenalo pro něj a pro druhé (O'Connor a Seymour 1990). Na
rozdíl od otázek meta-modelu, které zpřesňují popis zkušenosti, směřují otázky výsledku do
budoucnosti a k tomu, co by mělo nastat. Katalog je nepopisuje jako soubor formulací, ale jako
typ rozhovoru: rozhovor, v němž jedna strana klade otázky a druhá postupně vytváří obraz
žádaného stavu. Pro kompendium je tento typ rozhovoru důležitý tím, že vytváří závazky. Kdo
na otázky odpoví, vysloví přání, vytvoří si živou představu jeho splnění a často i přizná,
co mu k němu chybí. Všechny tři prvky mohou sloužit jemu, nebo tomu, kdo otázky klade.

## Původ a souvislosti

Otázky výsledku vyrostly ze dvou kořenů. Prvním je meta-model, soubor otázek, které Bandler a
Grinder odvodili z práce úspěšných terapeutů a jimiž se neúplný popis zkušenosti doplňuje o
vypuštěné, zkreslené a zobecněné části (Bandler a Grinder 1975). Otázky výsledku přenášejí
tento požadavek úplnosti z popisu problému na popis cíle; katalog meta-model popisuje na
stránce [meta-modelu](@/kompendium/nlp-vzorce/meta-model/meta-model.md). Druhým kořenem je
orientace na budoucnost, kterou NLP připisuje Ericksonovi; Haley popsal, jak Erickson
zaměřoval terapii na to, jak bude život klienta vypadat, až potíž pomine, a ne na rozbor
její minulosti (Haley 1973). Krátká terapie z Palo Alta, s níž měl Erickson úzké vztahy,
přidala důraz na konkrétní a malý cíl jako podmínku úspěšné změny (Watzlawick, Weakland a
Fisch 1974). Otázky výsledku se odtud rozšířily do koučinku, manažerského vzdělávání a
prodeje; v posledně jmenovaném se z nich stal postup, jímž prodejce zjišťuje potřeby
zákazníka a zesiluje je dřív, než představí produkt. Katalog tento posun popisuje u [NLP v
prodeji](@/kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-v-prodeji.md).

## Struktura vzorce

Strukturálně jde o řetězec otázek, který má tři účinky. Prvním je zpřesnění: neurčité přání
se mění v popis konkrétního stavu. Druhým je aktivace: otázky na to, jak by bylo, kdyby cíl
byl splněn, vyvolávají živou představu a s ní i emoce, které k ní patří. Třetím je
zavázání: člověk, který cíl nahlas a podrobně popsal, má sklon jednat v souladu s tím, co
řekl (Cialdini 2009). Každý z účinků je v terapii užitečný a každý lze využít jinak.

Struktura otázek obsahuje také presupozice. Otázka na to, jak se člověk bude cítit, až cíle
dosáhne, mlčky předpokládá, že ho dosáhne; otázka na to, co mu brání mít cíl hned, mlčky
předpokládá, že překážka je dočasná a odstranitelná. Katalog tento jazykový mechanismus popisuje u [otázek s
presupozicí](@/kompendium/nlp-vzorce/presupozice/otazky-s-presupozici.md). Loftusová a
Palmerová ukázali, že i drobná změna slovesa v otázce mění to, co si lidé vybavují a jak
událost hodnotí (Loftus a Palmer 1974). U otázek na budoucnost to znamená, že formulace
otázky spoluvytváří obraz cíle, který člověk pokládá za vlastní. Rozhoduje proto, zda
otázky nechávají prostor pro odpověď „nevím“ nebo „to už nechci“, a zda se řetězec
otázek zastaví, když odpovědi začnou směřovat jinam, než tazatel čekal.

## Detekční znaky

Manipulativní užití se rozpoznává podle několika znaků. Prvním je pořadí: otázky na žádaný
stav, jeho emoční význam a cenu, kterou má současný stav, přicházejí dřív než jakákoli věcná
informace o nabídce, nákladech a rizicích. Druhým je zesilování: řetězec otázek se nevrací k
realitě, ale opakovaně se ptá na další a další význam splnění, pro člověka samého i pro jeho
blízké, až je emoční náboj vysoký. Třetím je zpětné použití: odpovědi
se později vracejí jako argumenty („sám jste řekl, že to je pro vás to nejdůležitější“).
Čtvrtým je sběr důvěrných informací, které mohou později sloužit jako páka; kompendium tuto
strukturu v mentorském kontextu popisuje jako [implantaci budoucího
vydírání](@/kompendium/techniques/ea-2-2-10-future-blackmail-implantace.md). Pátým znakem je,
že tazatel nepřijímá odpověď, že člověk neví nebo že cíl nemá, a pokračuje, dokud cíl
nevznikne. Freedman a Fraser ukázali, že souhlas s malou žádostí zvyšuje pravděpodobnost
souhlasu s větší (Freedman a Fraser 1966); řetězec drobných „ano“ na otázky o cíli může mít
podobný účinek.

## Legitimní a manipulativní užití

Legitimní užití slouží zakázce a nechává odpověď otevřenou. Terapeut, který se na první
konzultaci ptá, co by si klientka od spolupráce přála a podle čeho by poznala, že pomáhá, a
výslovně připouští odpověď „zatím nevím“, vytváří kritérium, podle něhož lze později poznat, že
spolupráce nepomáhá. Motivační rozhovory pracují s otevřenými otázkami, které mají
klientovi pomoci vyslovit jeho vlastní důvody ke změně, a výslovně odmítají tlačit ho
směrem, který si nevybral (Miller a Rollnick 2013). Na opačném konci stojí přístup, který
otázky na cíl klientovi neklade vůbec a nechává směr rozhovoru zcela na něm; Rogers v tom
viděl podmínku toho, aby klient našel vlastní cestu (Rogers 1951). Otázky výsledku jsou ve
srovnání s tímto přístupem direktivní a jejich legitimita závisí na tom, zda direktivnost
slouží klientovi. Manipulativní užití slouží tazateli. Rozpoznává se podle otázek: kdo z
odpovědí vytěží? Následuje po rozhovoru o cíli nabídka, na níž má tazatel zájem? A smí
dotazovaný odpovědět, že cíl nemá nebo že ho nechce sdílet? Kontrastem k sugestivnímu
kladení otázek je nesugestivní styl, který kompendium popisuje u [forenzního
rozhovoru](@/kompendium/forensic-legal/1-forensic-interview-protocol.md).

## Stav důkazů

Pro otázky výsledku jako samostatnou intervenci NLP katalogu nejsou známy kontrolované studie.
Obecný poznatek, že otevřené otázky zaměřené na změnu mohou podpořit motivaci, má oporu ve
výzkumu motivačních rozhovorů, ale tento výzkum se týká jiného přístupu s vlastním
teoretickým rámcem a vlastními důkazy (Miller a Rollnick 2013). [Výzkum NLP](@/kompendium/nlp-vzorce/kriticke-hodnoceni/stav-dukazu-nlp.md) jako celku
podporu pro jeho klíčová tvrzení nenašel; přehledy z osmdesátých let upozorňovaly na
nepodpůrná data i na obtížnou testovatelnost konceptů (Sharpley 1987) a pozdější rozbor
databáze výzkumů dospěl k podobnému závěru (Witkowski 2010). Kritický přehled pro koučink
konstatuje, že nástroje NLP se v koučovací praxi rozšířily bez odpovídajícího ověření
(Passmore a Rowson 2019). Je třeba dodat, že vlivové účinky, na nichž stojí manipulativní
užití, tedy závazek, postupné stupňování souhlasu a vliv formulace otázky, jsou naopak dobře
doloženy v sociální a kognitivní psychologii (Cialdini 2009; Loftus a Palmer 1974). Riziko
zneužití je proto lépe doloženo než terapeutický přínos.

## Obrana a zotavení

Základní obranou je všímat si pořadí rozhovoru. Kdo je dotazován na svá přání, obavy a
představy o budoucnosti dřív, než dostal jakoukoli věcnou informaci o nabídce, má dobrý
důvod rozhovor zpomalit a požádat o fakta: cenu, rizika, podmínky odstoupení. Druhou obranou
je nesdílet víc, než je nutné. Otázky na cíl nejsou povinné a odpověď „to si nechám pro sebe“
nebo „zatím nevím“ je legitimní. Třetí obranou je oddělit vlastní cíl od toho, co se na něj
v rozhovoru navěsí: přání klidného stáří nebo zdraví rodiny je skutečné, ale z něj neplyne,
že je správné podepsat právě předloženou smlouvu. Výzkum odolnosti vůči přesvědčování
naznačuje, že předem poznaná struktura tlaku se snáze odmítá (McGuire 1964). Kdo zjistí, že
jeho odpovědi z takového rozhovoru se staly podkladem pro nátlak, může je výslovně odvolat:
cíl vyslovený za jiných okolností nezavazuje k ničemu, co z něj vyvodil druhý. U lidí,
jejichž důvěrné odpovědi byly později využity jako páka, se zotavení opírá o pojmenování
tohoto zneužití a o obnovu důvěry, že vlastní přání smějí sdílet jen ve vztazích, které si
sami zvolí (Herman 1992).

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Cialdini, R. B. (2009). *Influence: Science and Practice* (5. vyd.). Boston: Pearson.
- Freedman, J. L., & Fraser, S. C. (1966). Compliance without pressure: The foot-in-the-door technique. *Journal of Personality and Social Psychology*, 4(2), 195–202.
- Haley, J. (1973). *Uncommon Therapy: The Psychiatric Techniques of Milton H. Erickson, M.D.* New York: W. W. Norton.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Loftus, E. F., & Palmer, J. C. (1974). Reconstruction of automobile destruction: An example of the interaction between language and memory. *Journal of Verbal Learning and Verbal Behavior*, 13(5), 585–589.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- Miller, W. R., & Rollnick, S. (2013). *Motivational Interviewing: Helping People Change* (3. vyd.). New York: Guilford Press.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Rogers, C. R. (1951). *Client-Centered Therapy*. Boston: Houghton Mifflin.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Watzlawick, P., Weakland, J. H., & Fisch, R. (1974). *Change: Principles of Problem Formation and Problem Resolution*. New York: W. W. Norton.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

**Rodina a hierarchie**

- [Cíle a výsledky](@/kompendium/nlp-vzorce/cile-a-vysledky/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Dobře formulovaný výsledek](@/kompendium/nlp-vzorce/cile-a-vysledky/dobre-formulovany-vysledek.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) – příbuzné heslo (Meta-model, Meta Model)
- [Otázky s presupozicí](@/kompendium/nlp-vzorce/presupozice/otazky-s-presupozici.md) – příbuzné heslo (Jazykové presupozice, Loaded questions)
- [Rámec výsledku](@/kompendium/nlp-vzorce/reframing/ramec-vysledku.md) – příbuzné heslo (Reframing a rámce, Outcome frame)
- [Kartézské otázky](@/kompendium/nlp-vzorce/presvedceni/kartezske-otazky.md) – příbuzné heslo (Přesvědčení, Cartesian questions)
- [Dobře formulovaný výsledek](@/kompendium/nlp-vzorce/cile-a-vysledky/dobre-formulovany-vysledek.md) – příbuzné heslo (Cíle a výsledky, Well-formed outcome)
- [NLP v prodeji](@/kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-v-prodeji.md) – příbuzné heslo (Vliv a zneužití NLP, NLP in sales)
- [Budoucí přehrávání v prodeji](@/kompendium/nlp-vzorce/vliv-a-zneuziti/budouci-prehravani-v-prodeji.md) – příbuzné heslo (Vliv a zneužití NLP, Future pacing in sales)

**V kompendiu**

- [EA-2.2.10 Implantace budoucího vydírání](@/kompendium/techniques/ea-2-2-10-future-blackmail-implantace.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Forenzní rozhovor](@/kompendium/forensic-legal/1-forensic-interview-protocol.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Důkazní procedura](@/kompendium/nlp-vzorce/cile-a-vysledky/dukazni-procedura.md) – předchozí heslo rodiny
- [Od problému k výsledku](@/kompendium/nlp-vzorce/cile-a-vysledky/od-problemu-k-vysledku.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
