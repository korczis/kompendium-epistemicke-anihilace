+++
title = "Kalibrace souhlasu a nesouhlasu"
description = "Kalibrace souhlasu a nesouhlasu v NLP: učení se neverbálním znakům „ano“ a „ne“ u jednoho člověka, limity tohoto čtení a riziko popírání výslovného odmítnutí."
weight = 8
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-raport-a-kalibrace", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "high"
lang = "cs"
keywords = ["Kalibrace souhlasu a nesouhlasu", "Yes/no calibration", "kalibrace ano/ne", "neverbální ano a ne", "Raport a kalibrace", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-18.08"
catalog_slug = "kalibrace-ano-ne"
catalog_family = "raport-a-kalibrace"
catalog_family_code = "18"
catalog_family_title = "Raport a kalibrace"
catalog_family_en = "Rapport and calibration"
catalog_part = "raport-a-kalibrace"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Yes/no calibration"
catalog_aliases = ["kalibrace ano/ne", "neverbální ano a ne"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "vysoke"
catalog_risk_cs = "vysoké"
catalog_broader = "kalibrace"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["kalibrace"]
catalog_related = ["ocni-pristupove-signaly", "kalibrace", "smyslova-ostrost", "kongruence", "pripojene-otazky", "ideomotoricka-signalizace", "testovani-kotvy", "detekce-lzi-v-nlp", "cteni-reci-tela", "vyzkum-ocnich-signalu"]
catalog_related_declared = ["smyslova-ostrost", "detekce-lzi-v-nlp", "cteni-reci-tela", "ocni-pristupove-signaly", "vyzkum-ocnich-signalu", "kongruence"]
catalog_kompendium = ["kompendium/techniques/ea-6-1-4-observational-assessment.md", "kompendium/techniques/ea-7-3-1-kahneman-system12.md", "kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md", "kompendium/nlp-vzorce/kriticke-hodnoceni/vyzkum-ocnich-signalu.md", "kompendium/nlp-vzorce/zakladni-pojmy/kalibrace.md", "kompendium/nlp-vzorce/zakladni-pojmy/smyslova-ostrost.md", "kompendium/techniques/ea-6-1-4-observational-assessment.md", "kompendium/techniques/ea-7-3-1-kahneman-system12.md"]
catalog_prev = "zpetne-shrnuti"
catalog_next = "vedeni-v-raportu"
catalog_position = 8
catalog_family_size = 16
catalog_sources = ["bandler-grinder-1979", "ekman-2003", "erickson-rossi-rossi-1976", "herman-1992", "kahneman-2011", "lifton-1961", "oconnor-seymour-1990", "rogers-1951", "stark-2007", "vrij-2008", "wiseman-2012", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1979", "oconnor-seymour-1990"]
catalog_sources_roots = ["erickson-rossi-rossi-1976"]
catalog_sources_critical = ["ekman-2003", "herman-1992", "kahneman-2011", "lifton-1961", "rogers-1951", "stark-2007", "vrij-2008", "wiseman-2012", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/raport-a-kalibrace.toml"
+++

# Kalibrace souhlasu a nesouhlasu

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-18.08` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Raport a kalibrace](@/kompendium/nlp-vzorce/raport-a-kalibrace/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Yes/no calibration |
| **Jiné názvy** | kalibrace ano/ne, neverbální ano a ne |
| **Obecnější heslo** | [Kalibrace](@/kompendium/nlp-vzorce/zakladni-pojmy/kalibrace.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | vysoké |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Kalibrace souhlasu a nesouhlasu je vzorec neurolingvistického programování, při němž si
pozorovatel vytváří obraz toho, jak konkrétní člověk neverbálně vypadá, když souhlasí, a jak
vypadá, když nesouhlasí. Sleduje přitom drobné změny, které NLP označuje jako minimální
signály: barvu a napětí pokožky, drobné pohyby hlavy, změny dechu, rtů, očí a postoje
(Bandler a Grinder 1979). Vzorec je zvláštním případem obecného pojmu
[kalibrace](@/kompendium/nlp-vzorce/zakladni-pojmy/kalibrace.md), podle kterého se neverbální
projevy nedají číst podle univerzálního slovníku, ale je třeba se je naučit u každého
člověka zvlášť. Podle NLP má pozorovatel po takové kalibraci rozpoznat neverbální „ano“ a
„ne“ i tam, kde je člověk nevysloví, nebo kde slova a tělo nesouhlasí. Pro kompendium je
vzorec jedním z nejcitlivějších v celé rodině, protože se dotýká otázky, kdo má poslední
slovo o tom, co člověk chce: on sám, nebo ten, kdo ho „přečetl“.

## Původ a souvislosti

Kalibrace patří k nejstarším dovednostem, které NLP vyučovalo. Bandler a Grinder ji odvodili
z pozorování terapeutů, kteří podle nich reagovali na jemné změny v chování klienta dřív,
než klient cokoli řekl, a v seminářích kladli důraz na zpřesnění smyslového vnímání, které
nazývali [smyslovou ostrostí](@/kompendium/nlp-vzorce/zakladni-pojmy/smyslova-ostrost.md)
(Bandler a Grinder 1979). V hypnotické práci Ericksona sloužilo sledování drobných reakcí
pacienta, například kývání hlavou nebo pohybů prstů, jako způsob komunikace v transu, kdy
pacient odpovídal neverbálně na otázky terapeuta (Erickson, Rossi a Rossi 1976). V pozdějších
učebnicích NLP se kalibrace souhlasu a nesouhlasu stala běžným cvičením a zároveň základem
tvrzení, že vyškolený praktik pozná, co si druhý „opravdu“ myslí (O'Connor a Seymour 1990).

Mimo NLP je čtení neverbálních projevů předmětem rozsáhlého výzkumu. Ekman popsal
základní emoční výrazy obličeje a jejich krátké, neúplné podoby a zdůraznil, že výraz emoce
neprozrazuje její příčinu ani záměr člověka (Ekman 2003). Výzkum detekce lži ukázal, že
neexistuje žádný neverbální znak, který by spolehlivě odlišoval pravdu od lži, a že lidé
včetně profesionálů rozpoznávají klamání jen o málo lépe než náhodně (Vrij 2008). Tyto
poznatky jsou pro hodnocení vzorce zásadní, protože ukazují, kde končí to, co lze z těla
přečíst.

## Struktura vzorce

Strukturálně má vzorec dvě fáze. V první fázi pozorovatel sleduje člověka v situacích, kdy
zná jeho odpověď, například když odpovídá na otázky, jejichž odpověď je zřejmá, nebo když
mluví o něčem, co má a nemá rád, a zapamatuje si, jak se v těchto situacích liší jeho
neverbální projevy. Ve druhé fázi tyto rozdíly používá jako klíč, podle kterého vykládá
reakce v situacích, kde odpověď nezná nebo kde mu odpověď nestačí. Celek je tedy pokusem o
vytvoření osobního slovníku neverbálních reakcí, nikoli univerzálního, a v tom se NLP
odlišuje od populárních příruček řeči těla (Bandler a Grinder 1979).

Pozorovatel by měl rozlišit tři různé nároky, které se ve vzorci skrývají. Prvním je skromný
nárok, že pozornost k neverbálním projevům druhého pomáhá všimnout si, kdy je třeba se
doptat. Druhým je silnější nárok, že lze spolehlivě rozpoznat souhlas a nesouhlas, které
člověk nevyslovil. Třetím je nejsilnější nárok, že neverbální „ano“ nebo „ne“ je
pravdivější než vyslovené slovo. První nárok je rozumný. Druhý je nejistý, protože stejné
neverbální projevy mají mnoho příčin, například únavu, bolest, rozpaky nebo kulturní
zvyklosti. Třetí nárok je epistemicky i eticky problematický, protože staví výklad
pozorovatele nad výpověď člověka o sobě samém.

## Detekční znaky

Manipulativní podoba vzorce se pozná podle toho, že mluvčí vykládá vaše neverbální projevy
jako souhlas nebo nesouhlas a jeho výklad má přednost před tím, co jste řekli. Typickými
znaky jsou výroky, které nárokují přístup k vašemu skutečnému přání: „vidím na tobě, že to
chceš“, „tvoje tělo říká něco jiného“, „poznám, že lžeš“. Dalším znakem je selektivita:
výklad těla se uplatní jen tam, kde podporuje cíl mluvčího, a když tělo „říká ne“, mluvčí to
přejde. V prodeji se vzorec projevuje tím, že prodejce reaguje na drobné projevy váhání
okamžitým přeformulováním nabídky, a v jednání tím, že se váhání vykládá jako „skrytý
souhlas“, který stačí jen vyslovit.

Nejzávažnější podobu vzorec má ve vztazích, kde se čtení těla použije k popření výslovného
odmítnutí, zvláště v oblasti intimity. Výrok, že „ústa říkají ne, ale tělo říká ano“, je
signálem, který by měl být v kompendiu vždy chápán jako varovný, protože ruší platnost
souhlasu. Nadřazení cizího výkladu vlastní zkušenosti člověka je strukturně příbuzné tomu,
co Lifton u systémů myšlenkové reformy popsal jako nadřazení doktríny osobě (Lifton 1961).
U člověka, vůči němuž se vzorec dlouhodobě používá, se objevuje nejistota, zda
vůbec ví, co chce, a sklon hledat odpověď u druhého. Tento stav kompendium popisuje mezi
[diagnostickými indikátory](@/kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md)
epistemického poškození.

## Legitimní a manipulativní užití

Legitimní užití vzorce je pozornost, která vede k otázce. Klinik, který si všimne, že se
pacient při určité zmínce zarazil, a zeptá se, zda je s tím něco v nepořádku, používá
pozorování jako podnět k dialogu, ne jako náhradu odpovědi. Podobně učitel, vedoucí týmu
nebo mediátor může vnímat drobné projevy nesouhlasu a vyslovit je jako otázku. Takové užití
odpovídá pojetí empatického porozumění, v němž terapeut ověřuje, zda správně chápe prožívání
klienta, a klient má poslední slovo (Rogers 1951). Kompendium systematické pozorování v
klinickém kontextu popisuje u [pozorovacího hodnocení](@/kompendium/techniques/ea-6-1-4-observational-assessment.md),
kde se pozorované chování vždy vykládá spolu s výpovědí člověka a s dalšími zdroji.

Manipulativní užití nahrazuje otázku výkladem. Mluvčí nečeká na odpověď, ale prohlásí, že ji
zná, a výslovné slovo druhého prohlásí za méně pravdivé než svůj výklad. Kahneman ukazuje,
jak snadno vzniká pocit jistoty z rychlého intuitivního úsudku, který se ale nemusí opírat
o spolehlivé vodítko (Kahneman 2011); kompendium tento rámec rozebírá v kapitole o
[systému 1 a 2](@/kompendium/techniques/ea-7-3-1-kahneman-system12.md). Pozorovatel, který
věří, že „přečetl“ druhého, je zvlášť náchylný k tomu, aby vlastní jistotu zaměnil za
pravdivost.

## Stav důkazů

Pro tvrzení, že lidé mají individuální neverbální projevy, které se mohou lišit podle
emočního stavu, existuje obecná podpora ve výzkumu emocí a výrazu (Ekman 2003). Pro tvrzení,
že vyškolený pozorovatel dokáže z těchto projevů spolehlivě rozpoznat nevyslovený souhlas,
nesouhlas nebo lež, podpora chybí. Výzkum detekce lži opakovaně ukazuje, že přesnost
posuzování z neverbálních projevů je nízká a že výcvik ji zlepšuje jen omezeně (Vrij 2008).
Konkrétní tvrzení NLP o čtení pravdomluvnosti z pohybů očí bylo experimentálně testováno a
nepotvrdilo se (Wiseman a kol. 2012); katalog výsledek popisuje v hesle
[výzkum očních přístupových signálů](@/kompendium/nlp-vzorce/kriticke-hodnoceni/vyzkum-ocnich-signalu.md).
Obecná hodnocení NLP nenašla doklady pro jeho specifické modely (Witkowski 2010). Pro
kalibraci souhlasu a nesouhlasu zvlášť nám nejsou známy kontrolované studie, které by její
přesnost doložily. Čtenář by měl proto brát kalibraci jako způsob, jak si všimnout, že je
třeba se zeptat, a ne jako metodu, jak se otázce vyhnout.

## Obrana a zotavení

Základní obranou je princip, že vyslovené slovo má přednost před jakýmkoli výkladem těla.
Pokud někdo tvrdí, že ví lépe než vy, co chcete nebo cítíte, je legitimní odpovědět, že
o vašem přání rozhodujete vy a že platí to, co jste řekli. Druhou obranou je všímat si
selektivity: výklad, který se uplatní jen tehdy, když vyhovuje mluvčímu, není čtením, ale
nátlakem. Třetí obranou ve vztazích je brát opakované popírání výslovného odmítnutí jako
vážný varovný znak, který odpovídá vzorcům kontrolujícího chování, jak je popisuje
literatura o donucující kontrole (Stark 2007).

Zotavení u lidí, jejichž výslovné „ne“ bylo dlouhodobě přepisováno výkladem jejich těla,
vyžaduje obnovu důvěry ve vlastní vnímání a ve vlastní hlas. Pomáhá vyslovovat přání a
odmítnutí nahlas a zažívat, že jsou respektována, a to v bezpečném vztahu, například v
terapii. Herman zdůrazňuje, že zotavení z traumatu stojí na obnově autonomie a na tom, že
člověk znovu získá kontrolu nad svým tělem a rozhodováním (Herman 1992). Odborníci, kteří
pracují s pozorováním neverbálních projevů, by měli vždy pojmenovat, co vidí, jako hypotézu
a nechat klientovi poslední slovo.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Literatura

- Bandler, R., & Grinder, J. (1979). *Frogs into Princes: Neuro Linguistic Programming*. Moab: Real People Press.
- Ekman, P. (2003). *Emotions Revealed: Recognizing Faces and Feelings to Improve Communication and Emotional Life*. New York: Times Books.
- Erickson, M. H., Rossi, E. L., & Rossi, S. I. (1976). *Hypnotic Realities: The Induction of Clinical Hypnosis and Forms of Indirect Suggestion*. New York: Irvington.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. New York: W. W. Norton.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Rogers, C. R. (1951). *Client-Centered Therapy*. Boston: Houghton Mifflin.
- Stark, E. (2007). *Coercive Control: How Men Entrap Women in Personal Life*. New York: Oxford University Press.
- Vrij, A. (2008). *Detecting Lies and Deceit: Pitfalls and Opportunities* (2. vyd.). Chichester: Wiley.
- Wiseman, R., Watt, C., ten Brinke, L., Porter, S., Couper, S.-L., & Rankin, C. (2012). The eyes don't have it: Lie detection and neuro-linguistic programming. *PLoS ONE*, 7(7), e40259.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

**Rodina a hierarchie**

- [Raport a kalibrace](@/kompendium/nlp-vzorce/raport-a-kalibrace/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Kalibrace](@/kompendium/nlp-vzorce/zakladni-pojmy/kalibrace.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Oční přístupové signály](@/kompendium/nlp-vzorce/zakladni-pojmy/ocni-pristupove-signaly.md) – příbuzné heslo (Základní pojmy NLP, Eye accessing cues)
- [Kalibrace](@/kompendium/nlp-vzorce/zakladni-pojmy/kalibrace.md) – příbuzné heslo (Základní pojmy NLP, Calibration)
- [Smyslová ostrost](@/kompendium/nlp-vzorce/zakladni-pojmy/smyslova-ostrost.md) – příbuzné heslo (Základní pojmy NLP, Sensory acuity)
- [Kongruence](@/kompendium/nlp-vzorce/zakladni-pojmy/kongruence.md) – příbuzné heslo (Základní pojmy NLP, Congruence)
- [Připojené otázky](@/kompendium/nlp-vzorce/milton-model/pripojene-otazky.md) – příbuzné heslo (Milton-model, Tag questions)
- [Ideomotorická signalizace](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/ideomotoricka-signalizace.md) – příbuzné heslo (Ericksonovská hypnóza, Ideomotor signalling)
- [Testování kotvy](@/kompendium/nlp-vzorce/kotveni/testovani-kotvy.md) – příbuzné heslo (Kotvení, Testing an anchor)
- [Detekce lži v NLP](@/kompendium/nlp-vzorce/raport-a-kalibrace/detekce-lzi-v-nlp.md) – příbuzné heslo (Raport a kalibrace, Lie detection claims in NLP)
- [Čtení řeči těla v NLP](@/kompendium/nlp-vzorce/raport-a-kalibrace/cteni-reci-tela.md) – příbuzné heslo (Raport a kalibrace, Body-language reading in NLP)
- [Výzkum očních přístupových signálů](@/kompendium/nlp-vzorce/kriticke-hodnoceni/vyzkum-ocnich-signalu.md) – příbuzné heslo (Kritické hodnocení NLP, Research on eye accessing cues)

**V kompendiu**

- [EA-6.1.4 Observational assessment](@/kompendium/techniques/ea-6-1-4-observational-assessment.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-7.3.1 Kahneman: Systém 1 a 2](@/kompendium/techniques/ea-7-3-1-kahneman-system12.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [6.1 Diagnostické indikátory a markery EA](@/kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Zpětné shrnutí](@/kompendium/nlp-vzorce/raport-a-kalibrace/zpetne-shrnuti.md) – předchozí heslo rodiny
- [Vedení v raportu](@/kompendium/nlp-vzorce/raport-a-kalibrace/vedeni-v-raportu.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
