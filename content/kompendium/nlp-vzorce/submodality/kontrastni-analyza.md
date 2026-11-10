+++
title = "Kontrastní analýza"
description = "Srovnání kvalit dvou představ, kterým NLP hledá rozdíl mezi jistotou a pochybností či zájmem a nezájmem: struktura, znaky, zneužití vůči pochybnosti a doklady."
weight = 6
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-submodality", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Kontrastní analýza", "Contrastive analysis", "porovnání submodalit", "Submodality", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-10.06"
catalog_slug = "kontrastni-analyza"
catalog_family = "submodality"
catalog_family_code = "10"
catalog_family_title = "Submodality"
catalog_family_en = "Submodalities"
catalog_part = "submodality"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Contrastive analysis"
catalog_aliases = ["porovnání submodalit"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "elicitace-submodalit"
catalog_narrower = []
catalog_depth = 2
catalog_ancestors = ["elicitace-submodalit", "submodality-pojem"]
catalog_related = ["kontrastni-ramec", "elicitace-submodalit", "kriticke-submodality", "mapovani-napric", "od-libosti-k-nechuti", "zmena-presvedceni-submodalitami", "presvedcovaci-strategie"]
catalog_related_declared = ["kriticke-submodality", "mapovani-napric", "zmena-presvedceni-submodalitami", "od-libosti-k-nechuti", "presvedcovaci-strategie"]
catalog_kompendium = ["kompendium/techniques/ea-2-5-3-self-doubt-cultivation.md", "kompendium/07-teoreticke-reflexe/kognitivni-vedy.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/nlp-vzorce/submodality/elicitace-submodalit.md", "kompendium/nlp-vzorce/submodality/kriticke-submodality.md", "kompendium/nlp-vzorce/submodality/mapovani-napric.md", "kompendium/techniques/ea-2-5-3-self-doubt-cultivation.md"]
catalog_prev = "kriticke-submodality"
catalog_next = "mapovani-napric"
catalog_position = 6
catalog_family_size = 20
catalog_sources = ["andreas-andreas-1987", "bandler-1985", "bateson-1972", "beck-1976", "dilts-1990", "dilts-1980", "druckman-swets-1988", "hassan-1988", "herman-1992", "lifton-1961", "loftus-palmer-1974", "mcguire-1964", "passmore-rowson-2019", "petty-cacioppo-1986", "witkowski-2010"]
catalog_sources_primary = ["andreas-andreas-1987", "bandler-1985", "dilts-1990", "dilts-1980"]
catalog_sources_roots = ["bateson-1972"]
catalog_sources_critical = ["beck-1976", "druckman-swets-1988", "hassan-1988", "herman-1992", "lifton-1961", "loftus-palmer-1974", "mcguire-1964", "passmore-rowson-2019", "petty-cacioppo-1986", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/submodality.toml"
+++

# Kontrastní analýza

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-10.06` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Submodality](@/kompendium/nlp-vzorce/submodality/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Contrastive analysis |
| **Jiné názvy** | porovnání submodalit |
| **Obecnější heslo** | [Elicitace submodalit](@/kompendium/nlp-vzorce/submodality/elicitace-submodalit.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Kontrastní analýza je v neurolingvistickém programování srovnání kvalit dvou vnitřních
představ, které se liší v tom, jak je člověk prožívá. Obvykle se srovnává zážitek, který má
určitou vlastnost, se zážitkem, který ji postrádá: přesvědčení, jímž si je člověk jistý, s
přesvědčením, o kterém pochybuje; věc, kterou má rád, s věcí, ke které je lhostejný; situace,
ve které se cítí motivovaný, se situací, ve které ne. Cílem srovnání je najít kvality, ve
kterých se obě představy liší, a mezi nimi ty, které podle NLP nesou rozdíl v prožitku (Andreas
a Andreas 1987). Kontrastní analýza je tedy zvláštním případem
[elicitace submodalit](@/kompendium/nlp-vzorce/submodality/elicitace-submodalit.md): nezjišťuje
podobu jedné představy, ale rozdíl mezi dvěma. Výsledek slouží jako podklad pro techniky, které
mají kvality jedné představy přenést na druhou, zejména pro
[mapování napříč](@/kompendium/nlp-vzorce/submodality/mapovani-napric.md). Pro kompendium je
vzorec důležitý tím, že jeho výsledkem je „mapa rozdílu“ mezi jistotou a pochybností, kterou
lze použít k oslabení pochybnosti, o jejímž oprávnění nikdo neuvažoval.

## Původ a souvislosti

Srovnávání dvou podobných, ale odlišně prožívaných zážitků patří k metodě modelování, kterou
NLP od počátku uplatňovalo: rozdíl mezi tím, kdo dovednost má, a tím, kdo ji nemá, se hledá ve
struktuře jejich vnitřních reprezentací (Dilts a kol. 1980). V práci se submodalitami tento
postup přenesl Bandler z porovnávání lidí na porovnávání zážitků téhož člověka, například
zážitků, které jsou mu příjemné a nepříjemné (Bandler 1985). Andreasovi kontrastní analýzu
zařadili do souboru pokročilých intervencí jako základní nástroj pro nalezení kvalit, které
odlišují různé typy prožitků, mimo jiné porozumění od nejasnosti a jistotu od pochybnosti
(Andreas a Andreas 1987). Pozdější literatura o přesvědčeních NLP rozpracovala práci se
strukturou přesvědčení do vlastních modelů (Dilts 1990). Myšlenka srovnání má i obecnější
kořen. Bateson definoval informaci jako rozdíl, který má účinek, a NLP tuto formulaci rádo
citovalo jako zdůvodnění, proč hledat právě rozdíly (Bateson 1972). Mimo NLP je srovnávací
metoda běžná v experimentální psychologii, kde se podmínky liší v jedné proměnné; kontrastní
analýza ale postrádá kontrolu, která z takového srovnání činí doklad.

## Struktura vzorce

Strukturálně má vzorec čtyři prvky. Prvním je volba dvojice: dva zážitky, které se podle
tazatele nebo dotazovaného liší v určité vlastnosti, ale jsou jinak co nejpodobnější. Druhým
je paralelní popis: obě představy se popisují stejnými kategoriemi kvalit, zrakových,
sluchových i tělesných. Třetím je seznam rozdílů: zaznamenají se kvality, ve kterých se
popisy liší, například že jisté přesvědčení je viděno zblízka a barevně, kdežto pochybnost
zdálky a šedě. Čtvrtým je výběr: z rozdílů se vyberou ty, které tazatel na základě reakcí
dotazovaného pokládá za nosné, tedy za
[kritické submodality](@/kompendium/nlp-vzorce/submodality/kriticke-submodality.md) (Andreas a
Andreas 1987).

Pozorovatel by měl vidět, kde se ve struktuře rozhoduje. Rozhodující je první prvek, volba
dvojice. Kdo vybere, co se bude srovnávat, rozhoduje i o tom, který prožitek bude vzorem a
který odchylkou. Když se srovnává jistota a pochybnost, je v rámci implicitně dáno, že jistota
je žádoucí stav a pochybnost nedostatek, který lze napravit. Otázka, zda je pochybnost
oprávněná, se v kontrastní analýze neklade, protože analyzuje formu prožitku, ne jeho důvody.
Druhým rozhodujícím místem je výběr kritických kvalit, ve kterém hraje roli interpretace
tazatele. Výsledná mapa rozdílu je tak v různé míře společným dílem obou stran, i když se
předkládá jako objektivní popis vnitřního světa dotazovaného.

## Detekční znaky

Kontrastní analýza se v rozhovoru pozná podle toho, že mluvčí požádá o vybavení dvou zážitků a
pak se na oba ptá stejnými otázkami, často střídavě. Typicky zazní výzva vybavit si něco, čím si
je člověk naprosto jistý, a pak něco, o čem pochybuje, nebo věc, kterou miluje, a věc, ke které
je lhostejný. Mluvčí si rozdíly zapisuje a nakonec je shrne: „Jistota je u vás blízko a vlevo,
pochybnost daleko a vpravo.“ Varovné znaky se týkají volby dvojice a cíle. Prvním je, že
srovnávaná pochybnost se týká skupiny, vůdce, produktu nebo rozhodnutí, na kterém má mluvčí
zájem. Druhým je, že výsledek srovnání se rovnou spojuje s návrhem pochybnost „předělat“ na
podobu jistoty. Třetím je, že kontrastní analýza probíhá na hromadném semináři nebo v
programu, který vyžaduje závazek. Čtvrtým je, že o důvodech pochybnosti se vůbec nemluví.
Kompendium popisuje soustavné oslabování vlastního úsudku jako
[pěstování sebepochybnosti](@/kompendium/techniques/ea-2-5-3-self-doubt-cultivation.md);
kontrastní analýza zneužitá vůči oprávněné pochybnosti je jeho zrcadlovým protějškem, protože
neoslabuje jistotu, ale pochybnost, a tím oslabuje kritický úsudek (Hassan 1988).

## Legitimní a manipulativní užití

Legitimní užití má podobu zkoumání, ve kterém dvojici volí sám člověk a ve kterém výsledek
slouží jeho cílům. Klient, který chce pochopit, proč se v některých situacích cítí motivovaný a
v jiných ne, může z porovnání obou situací získat zajímavý popis, i když jeho mechanistický
výklad je nejistý. Podobnou logiku má i výzkum, který porovnává popisy jistých a nejistých
vzpomínek, ovšem s kontrolou, souhlasem a bez zásahu do přesvědčení účastníků. Klinicky
užitečný protějšek kontrastní analýzy nabízí kognitivní terapie, která porovnává situace, v
nichž se objevují a neobjevují automatické myšlenky, a zkoumá jejich obsah a důkazy (Beck
1976). Rozdíl je v tom, že kognitivní terapie se ptá na důvody, kdežto kontrastní analýza na
formu.

Manipulativní užití staví právě na této nepřítomnosti důvodů. Pokud se člověk vyzve, aby
porovnal svou jistotu a svou pochybnost o skupině, a výsledek se použije k tomu, aby pochybnost
„dostala“ podobu jistoty, mění se jeho postoj, aniž by se kdokoli zabýval tím, proč
pochyboval. Výsledkem není přesvědčení argumenty, ale přeladění formy. Výzkum přesvědčování
ukazuje, že změna postoje dosažená bez zpracování argumentů bývá méně stabilní a více závislá
na trvalém působení zdroje (Petty a Cacioppo 1986). V uzavřených skupinách to znamená, že
přeladěná pochybnost se vrací a vyžaduje další „práci“, což prohlubuje závislost na vedení.
Lifton popsal kulturu, ve které je pochybnost chápána jako chyba jednotlivce a nikdy jako
informace o systému (Lifton 1961).

## Stav důkazů

Kontrastní analýza jako samostatná technika nebyla v kontrolovaném výzkumu systematicky
zkoumána. Neexistují studie, které by ukázaly, že srovnání submodalit dvou zážitků spolehlivě
odhaluje kvality odpovědné za rozdíl v prožitku a že tento výsledek je stabilní při opakování
nebo u jiného tazatele. Přehledy výzkumu NLP konstatují, že kontrolované studie tvrzení oboru
převážně nepodporují (Witkowski 2010), a hodnocení amerických expertů nenašlo dostatečné
doklady pro teorii NLP ani pro jeho účinky (Druckman a Swets 1988). Z obecné psychologie navíc
plyne, že introspektivní popisy jsou ovlivnitelné otázkami a očekáváním tazatele (Loftus a
Palmer 1974), takže rozdíly zjištěné kontrastní analýzou mohou být zčásti artefaktem rozhovoru.
Kritický přehled pro koučink doporučuje opatrnost u technik, jejichž mechanismus nebyl ověřen
(Passmore a Rowson 2019). Poctivé shrnutí tedy zní: srovnání dvou zážitků může přinést
zajímavý popis, ale není ověřenou metodou pro odhalení mechanismu jistoty, motivace nebo
přitažlivosti.

## Obrana a zotavení

Základní obranou je všímat si, kdo vybírá srovnávanou dvojici a co je v ní implicitně
označeno za vadu. Pokud se má porovnávat jistota s pochybností o něčem, na čem má druhá strana
zájem, je rozumné odmítnout a místo toho pochybnost vyslovit a probrat její důvody. Druhou
obranou je trvat na otázce „proč“: forma prožitku nic neříká o tom, zda je pochybnost
oprávněná, a jakákoli změna formy, která neodpovídá na důvody, je změnou bez poznání. Třetí
obranou je vědět, že pochybnost je v epistemickém smyslu cenná: chrání před chybou a její
oslabení bez důvodu je ztrátou ochrany. Inokulační přístup ukazuje, že kdo zná tah předem,
odolává mu lépe (McGuire 1964).

U lidí, jejichž pochybnosti byly v nátlakovém prostředí soustavně přelaďovány, se po odchodu
často objevuje zahlcení vrácenými pochybnostmi a nejistota, zda jim smějí věřit. Zotavení
zahrnuje obnovu práva pochybovat a postupné učení se pochybnosti ověřovat, ne potlačovat.
Herman zdůrazňuje, že obnova autonomie po zkušenosti kontroly zahrnuje i obnovu vlastního
úsudku (Herman 1992). Klinik by měl s takovým klientem pracovat s obsahem pochybností a
jejich ověřováním a vyhnout se technikám, které by opět měnily jejich formu bez ohledu na
důvody.

## Literatura

- Andreas, S., & Andreas, C. (1987). *Change Your Mind—and Keep the Change: Advanced NLP Submodalities Interventions*. Moab: Real People Press.
- Bandler, R. (1985). *Using Your Brain—for a Change*. Moab: Real People Press.
- Bateson, G. (1972). *Steps to an Ecology of Mind*. San Francisco: Chandler.
- Beck, A. T. (1976). *Cognitive Therapy and the Emotional Disorders*. New York: International Universities Press.
- Dilts, R. (1990). *Changing Belief Systems with NLP*. Cupertino: Meta Publications.
- Dilts, R., Grinder, J., Bandler, R., & DeLozier, J. (1980). *Neuro-Linguistic Programming: Volume I. The Study of the Structure of Subjective Experience*. Cupertino: Meta Publications.
- Druckman, D., & Swets, J. A. (Eds.) (1988). *Enhancing Human Performance: Issues, Theories, and Techniques*. Washington, DC: National Academy Press.
- Hassan, S. (1988). *Combatting Cult Mind Control*. Rochester: Park Street Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. New York: W. W. Norton.
- Loftus, E. F., & Palmer, J. C. (1974). Reconstruction of automobile destruction: An example of the interaction between language and memory. *Journal of Verbal Learning and Verbal Behavior*, 13(5), 585–589.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Petty, R. E., & Cacioppo, J. T. (1986). *Communication and Persuasion: Central and Peripheral Routes to Attitude Change*. New York: Springer.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Submodality](@/kompendium/nlp-vzorce/submodality/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Elicitace submodalit](@/kompendium/nlp-vzorce/submodality/elicitace-submodalit.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Kontrastní rámec](@/kompendium/nlp-vzorce/reframing/kontrastni-ramec.md) – příbuzné heslo (Reframing a rámce, Contrast frame)
- [Elicitace submodalit](@/kompendium/nlp-vzorce/submodality/elicitace-submodalit.md) – příbuzné heslo (Submodality, Eliciting submodalities)
- [Kritické submodality](@/kompendium/nlp-vzorce/submodality/kriticke-submodality.md) – příbuzné heslo (Submodality, Critical (driver) submodalities)
- [Mapování napříč](@/kompendium/nlp-vzorce/submodality/mapovani-napric.md) – příbuzné heslo (Submodality, Mapping across)
- [Od libosti k nechuti](@/kompendium/nlp-vzorce/submodality/od-libosti-k-nechuti.md) – příbuzné heslo (Submodality, Like-to-dislike pattern)
- [Změna přesvědčení přes submodality](@/kompendium/nlp-vzorce/submodality/zmena-presvedceni-submodalitami.md) – příbuzné heslo (Submodality, Belief change through submodalities)
- [Strategie přesvědčení o pravdivosti](@/kompendium/nlp-vzorce/strategie-a-modelovani/presvedcovaci-strategie.md) – příbuzné heslo (Strategie a modelování, Convincer strategy)

**V kompendiu**

- [EA-2.5.3 Pěstování sebepochybnosti](@/kompendium/techniques/ea-2-5-3-self-doubt-cultivation.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [7.5 Kognitivní vědy a EA — duální systém, predikční zpracování, embodied cognition](@/kompendium/07-teoreticke-reflexe/kognitivni-vedy.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Kritické submodality](@/kompendium/nlp-vzorce/submodality/kriticke-submodality.md) – předchozí heslo rodiny
- [Mapování napříč](@/kompendium/nlp-vzorce/submodality/mapovani-napric.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
