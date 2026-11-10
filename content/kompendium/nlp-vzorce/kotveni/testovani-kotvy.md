+++
title = "Testování kotvy"
description = "Ověřování, zda kotva vyvolá zamýšlený stav: proč je pozorování reakce náchylné ke zkreslení očekáváním a jak se z testu stává zkouška vlivu na druhém."
weight = 14
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-kotveni", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Testování kotvy", "Testing an anchor", "ověření kotvy", "spuštění kotvy na zkoušku", "Kotvení", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-09.14"
catalog_slug = "testovani-kotvy"
catalog_family = "kotveni"
catalog_family_code = "09"
catalog_family_title = "Kotvení"
catalog_family_en = "Anchoring"
catalog_part = "kotveni.b"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Testing an anchor"
catalog_aliases = ["ověření kotvy", "spuštění kotvy na zkoušku"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "kotveni"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["kotveni"]
catalog_related = ["kalibrace", "smyslova-ostrost", "ekologicka-kontrola", "kotveni", "kolaps-kotev", "posuvna-kotva", "budouci-prehravani", "kalibrace-ano-ne", "falzifikovatelnost-nlp"]
catalog_related_declared = ["kalibrace", "smyslova-ostrost", "kotveni", "ekologicka-kontrola", "kalibrace-ano-ne", "falzifikovatelnost-nlp"]
catalog_kompendium = ["kompendium/03-zakladni-kategorie/biasy/_index.md", "kompendium/02-uvod/metodologicke-poznamky.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/nlp-vzorce/ericksonovska-hypnoza/preruseni-vzorce.md", "kompendium/nlp-vzorce/raport-a-kalibrace/kalibrace-ano-ne.md", "kompendium/nlp-vzorce/zakladni-pojmy/kalibrace.md", "kompendium/nlp-vzorce/zakladni-pojmy/smyslova-ostrost.md", "kompendium/nlp-vzorce/zakladni-pojmy/tote-model.md", "kompendium/techniques/ea-2-5-3-self-doubt-cultivation.md"]
catalog_prev = "prenos-zdroje"
catalog_next = "kotveni-ve-skupine"
catalog_position = 14
catalog_family_size = 19
catalog_sources = ["bandler-grinder-1979", "cialdini-2009", "gilovich-1991", "heap-1988", "herman-1992", "kirsch-lynn-1995", "miller-galanter-pribram-1960", "oconnor-seymour-1990", "rogers-1951", "sharpley-1987", "wiseman-2012"]
catalog_sources_primary = ["bandler-grinder-1979", "oconnor-seymour-1990"]
catalog_sources_roots = ["miller-galanter-pribram-1960"]
catalog_sources_critical = ["cialdini-2009", "gilovich-1991", "heap-1988", "herman-1992", "kirsch-lynn-1995", "rogers-1951", "sharpley-1987", "wiseman-2012"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/kotveni.b.toml"
+++

# Testování kotvy

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-09.14` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Kotvení](@/kompendium/nlp-vzorce/kotveni/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Testing an anchor |
| **Jiné názvy** | ověření kotvy, spuštění kotvy na zkoušku |
| **Obecnější heslo** | [Kotvení](@/kompendium/nlp-vzorce/kotveni/kotveni.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Testováním kotvy se v NLP rozumí ověření, zda podnět, který byl spojen s určitým stavem,
tento stav při opakování skutečně vyvolá. Praktik podle výcvikové literatury přeruší
dosavadní stav člověka, například odvedením pozornosti k neutrálnímu tématu, a pak kotvu
zopakuje, přičemž sleduje změny ve výrazu tváře, dechu, barvě kůže, držení těla a hlase.
Pokud se objeví reakce podobná té, která provázela původní prožitek, považuje se kotva za
„funkční“ (Bandler a Grinder 1979). Testování je tedy v NLP úzce spojeno s
[kalibrací](@/kompendium/nlp-vzorce/zakladni-pojmy/kalibrace.md) a se
[smyslovou ostrostí](@/kompendium/nlp-vzorce/zakladni-pojmy/smyslova-ostrost.md), tedy
s dovedností rozpoznávat jemné neverbální změny u druhého člověka. Z obranného hlediska je
vzorec důležitý ze dvou důvodů. Za prvé ukazuje, jak NLP rozumí důkazu: jako bezprostřednímu
pozorování reakce v jedné situaci. Za druhé se mimo terapii mění v test, zda je druhý
člověk ovlivnitelný, a v ospravedlnění dalšího působení.

## Původ a souvislosti

Důraz na pozorování reakce místo na výpověď je v NLP od počátku. Zakladatelé zdůrazňovali,
že praktik má věřit tomu, co vidí a slyší, a ne tomu, co klient říká o svém prožitku, a
že dobrá práce stojí na zpětné vazbě v reálném čase (Bandler a Grinder 1979). Tato
orientace má kořeny v kybernetickém pojetí jednání jako smyčky testování a úpravy, které
NLP převzalo z modelu TOTE (Miller, Galanter a Pribram 1960); viz
[model TOTE](@/kompendium/nlp-vzorce/zakladni-pojmy/tote-model.md). Výcvikové učebnice
pak testování popisují jako běžnou součást práce s kotvami a zdůrazňují, že kotvu je třeba
ověřit, než se na ni naváže další postup (O'Connor a Seymour 1990). V tomto rámci má
testování zjevnou praktickou logiku: když se reakce neobjeví, praktik změní přístup. Logika
však má i druhou stránku. Ověřování spočívá v tom, že stejný člověk, který kotvu nastavil a
který očekává určitý výsledek, sám posuzuje, zda výsledek nastal. Z hlediska metodologie
výzkumu je to uspořádání, v němž je zkreslení očekáváním téměř nevyhnutelné.

## Struktura vzorce

Strukturálně má testování kotvy tři části: [přerušení stavu](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/preruseni-vzorce.md), opakování podnětu a
interpretaci pozorované změny. Každá z nich nese vlastní zdroj chyby. Přerušení stavu je
samo o sobě změnou situace, po níž se člověk přirozeně vrací do výchozí nálady, a návrat
může být mylně připsán kotvě. Opakování podnětu probíhá v kontextu, v němž obě strany vědí,
že se něco „má stát“, a zdvořilost, ochota spolupracovat i sugestibilita mohou reakci
vyvolat nezávisle na jakémkoli naučeném spojení. Výzkum hypnózy ukazuje, že očekávání a
motivace spolupracovat vysvětlují velkou část reakcí, které se v sugestivním kontextu
připisují zvláštním mechanismům (Kirsch a Lynn 1995). Interpretace pozorované změny je
nejslabším místem. Výraz tváře, dech a držení těla se mění neustále a z mnoha příčin, a
pozorovatel, který hledá potvrzení, ho najde. Gilovich popisuje, jak lidé přeceňují
potvrzující případy a přehlížejí nepotvrzující, zvláště když výsledky nejsou jednoznačné a
když mají na určitém výsledku zájem (Gilovich 1991). Test, který nemá kontrolní podmínku,
slepého pozorovatele ani předem stanovené kritérium, nemůže odlišit účinek kotvy od
očekávání, náhody a vzájemného přizpůsobení obou stran.

## Detekční znaky

V rozhovoru se testování kotvy pozná podle charakteristické změny tématu, po níž se znovu
objeví gesto, dotyk, slovo nebo tón, které se dříve objevily ve chvíli silného prožitku.
Praktik přitom nápadně pozorně sleduje tvář a tělo druhého a po jeho reakci často následuje
komentář, že „to funguje“. Mimo terapeutický rámec, například v kurzech prodejní nebo
vlivové komunikace a v komunitě takzvaného umění svádění, se testování objevuje jako
zkouška: člověk, na kterém se kotva zkouší, o tom neví, a jeho úsměv nebo uvolnění se
vykládá jako potvrzení, že je přístupný dalšímu vlivu. Varovným znakem je i rétorika
neodvratnosti: pozorovaná reakce se předkládá jako důkaz, že se proti vlivu nemá cenu
bránit. Takový výklad převádí běžnou lidskou reakci v důkaz moci druhé osoby a oslabuje
důvěru člověka v to, že jeho jednání vychází z jeho vlastní vůle. Kalibrace souhlasu a
nesouhlasu, která se v NLP popisuje jako samostatný vzorec, s testováním kotev úzce souvisí
([kalibrace souhlasu a nesouhlasu](@/kompendium/nlp-vzorce/raport-a-kalibrace/kalibrace-ano-ne.md)).

Pro pozorovatele je užitečné všímat si také toho, co se děje po „úspěšném“ testu. Pokud na
pozorovanou reakci navazuje žádost, nabídka nebo výzva k závazku, je zřejmé, že test
sloužil k načasování požadavku, ne k porozumění druhému. Cialdini popisuje, jak se ochota
vyhovět zvyšuje, když požadavek přichází ve chvíli příjemné nálady a sympatie k žadateli,
a jak se lidé následně cítí zavázáni k jednání, které by za jiných okolností odmítli
(Cialdini 2009). Test kotvy v manipulativním užití tak plní funkci, kterou v prodejní praxi
má hledání „správného okamžiku“: zjišťuje, kdy je druhý nejméně ostražitý.

## Legitimní a manipulativní užití

Legitimní podoba testování je v terapii pozorování, které slouží jako hypotéza. Terapeut si
všímá, jak klient reaguje, ale považuje své pozorování za podnět k otázce, ne za důkaz, a
rozhodující je výpověď klienta o vlastním prožitku. Takový přístup odpovídá obecné zásadě
klinické práce, podle níž je klient autoritou na svou zkušenost (Rogers 1951). Ve výzkumu by
legitimní test vyžadoval předem stanovené kritérium, srovnání s kontrolní podmínkou a
posuzovatele, který nezná podmínku, v níž byl člověk testován. Manipulativní užití je
naopak skryté a jednostranné. Testování slouží k posouzení, zda je druhý člověk vhodný k
dalšímu působení, a pozorovaná reakce se mu případně předloží jako důkaz, že je ovlivněný.
Tím se z neurčitého pozorování stává nástroj tlaku. Rozhodující otázkou je, kdo má poslední
slovo o tom, co člověk prožívá: on sám, nebo pozorovatel, který z jeho tváře „čte“.

## Stav důkazů

Testování kotvy nebylo jako samostatný postup předmětem kontrolovaného výzkumu, a tvrzení,
že pozorovaná reakce dokládá naučené spojení, proto nemá empirickou oporu. Obecněji platí,
že přehledy výzkumu NLP nenašly podporu pro tvrzení oboru o tom, co lze z neverbálních
znaků vyčíst, a upozornily, že teorie formulovaná tak, aby ji každý výsledek potvrzoval, je
v podstatě netestovatelná (Sharpley 1987). Heap ve svém průběžném hodnocení dospěl k závěru,
že výzkum nepodpořil tvrzení, podle nichž lze z očních pohybů a z volby slov spolehlivě
určit, jak člověk vnitřně zpracovává zkušenost (Heap 1988). Pozdější studie, která ověřovala tvrzení NLP o rozpoznávání
lži z pohybů očí, nenašla žádný vztah (Wiseman a kol. 2012). Testování kotvy tak
ilustruje obecný metodologický problém NLP: postup, který se v praxi vydává za ověření,
neobsahuje prvky, které by umožnily odlišit účinek od očekávání. Přitom by bylo snadné
takový test navrhnout, a skutečnost, že v literatuře oboru chybí, je sama o sobě
informací.

## Obrana a zotavení

Obranou je především zachovat si autoritu nad vlastním prožitkem. Pokud někdo tvrdí, že
reakce, úsměv nebo uvolnění dokazují jeho vliv, je legitimní odpovědět, že lidská reakce má
mnoho příčin a že jedno pozorování nic nedokazuje. Kdo zjistí, že na něm byla kotva
zkoušena bez jeho vědomí, nemusí vstupovat do debaty o tom, zda „fungovala“; podstatné je,
že nebyl požádán o souhlas, a to je samo o sobě důvod vztah nebo situaci přehodnotit. Pro
odborníky, kteří s NLP pracují, plyne z této stránky profesní nárok: považovat pozorování
za hypotézu, ověřovat ji otázkou a nepředkládat klientovi výklad jeho reakcí jako hotový
fakt. Pro výzkumníky je výzvou navrhnout test se slepým posuzovatelem a s kontrolní
podmínkou. Lidé, u nichž opakované „čtení“ jejich reakcí druhou osobou vedlo ke ztrátě
důvěry ve vlastní vnímání, potřebují v zotavení především obnovu práva na vlastní popis
prožitku. Kompendium se tímto rozkladem důvěry v sebe sama zabývá u techniky
[pěstování sebepochybnosti](@/kompendium/techniques/ea-2-5-3-self-doubt-cultivation.md).
Herman zdůrazňuje, že po zkušenosti, v níž druhá osoba ovládala a vykládala prožívání
člověka, se autonomie obnovuje ve vztazích, které člověku vracejí kontrolu a právo
rozhodovat o sobě (Herman 1992).

## Literatura

- Bandler, R., & Grinder, J. (1979). *Frogs into Princes: Neuro Linguistic Programming*. Moab: Real People Press.
- Cialdini, R. B. (2009). *Influence: Science and Practice* (5. vyd.). Boston: Pearson.
- Gilovich, T. (1991). *How We Know What Isn't So: The Fallibility of Human Reason in Everyday Life*. New York: Free Press.
- Heap, M. (1988). Neurolinguistic programming: An interim verdict. In M. Heap (Ed.), *Hypnosis: Current Clinical, Experimental and Forensic Practices* (pp. 268–280). London: Croom Helm.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Kirsch, I., & Lynn, S. J. (1995). The altered state of hypnosis: Changes in the theoretical landscape. *American Psychologist*, 50(10), 846–858.
- Miller, G. A., Galanter, E., & Pribram, K. H. (1960). *Plans and the Structure of Behavior*. New York: Holt, Rinehart and Winston.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Rogers, C. R. (1951). *Client-Centered Therapy*. Boston: Houghton Mifflin.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Wiseman, R., Watt, C., ten Brinke, L., Porter, S., Couper, S.-L., & Rankin, C. (2012). The eyes don't have it: Lie detection and neuro-linguistic programming. *PLoS ONE*, 7(7), e40259.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Kotvení](@/kompendium/nlp-vzorce/kotveni/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Kotvení](@/kompendium/nlp-vzorce/kotveni/kotveni.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Kalibrace](@/kompendium/nlp-vzorce/zakladni-pojmy/kalibrace.md) – příbuzné heslo (Základní pojmy NLP, Calibration)
- [Smyslová ostrost](@/kompendium/nlp-vzorce/zakladni-pojmy/smyslova-ostrost.md) – příbuzné heslo (Základní pojmy NLP, Sensory acuity)
- [Ekologická kontrola](@/kompendium/nlp-vzorce/zakladni-pojmy/ekologicka-kontrola.md) – příbuzné heslo (Základní pojmy NLP, Ecology check)
- [Kotvení](@/kompendium/nlp-vzorce/kotveni/kotveni.md) – příbuzné heslo (Kotvení, Anchoring)
- [Kolaps kotev](@/kompendium/nlp-vzorce/kotveni/kolaps-kotev.md) – příbuzné heslo (Kotvení, Collapsing anchors)
- [Posuvná kotva](@/kompendium/nlp-vzorce/kotveni/posuvna-kotva.md) – příbuzné heslo (Kotvení, Sliding anchor)
- [Budoucí přehrávání](@/kompendium/nlp-vzorce/casova-osa/budouci-prehravani.md) – příbuzné heslo (Časová osa, Future pacing)
- [Kalibrace souhlasu a nesouhlasu](@/kompendium/nlp-vzorce/raport-a-kalibrace/kalibrace-ano-ne.md) – příbuzné heslo (Raport a kalibrace, Yes/no calibration)
- [Falzifikovatelnost NLP](@/kompendium/nlp-vzorce/kriticke-hodnoceni/falzifikovatelnost-nlp.md) – příbuzné heslo (Kritické hodnocení NLP, Falsifiability of NLP)

**V kompendiu**

- [Kognitivní biasy](@/kompendium/03-zakladni-kategorie/biasy/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [2.4 Metodologické poznámky k taxonomii](@/kompendium/02-uvod/metodologicke-poznamky.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Přenos zdroje](@/kompendium/nlp-vzorce/kotveni/prenos-zdroje.md) – předchozí heslo rodiny
- [Kotvení ve skupině](@/kompendium/nlp-vzorce/kotveni/kotveni-ve-skupine.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
