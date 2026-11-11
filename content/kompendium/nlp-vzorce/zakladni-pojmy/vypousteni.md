+++
title = "Vypouštění"
description = "Vypouštění jako jeden ze tří procesů, jimiž podle NLP vzniká model světa: jak výběr chrání před zahlcením a jak se z něj stává skrývání."
weight = 33
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-zakladni-pojmy", "nlp-pojem", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Vypouštění", "Deletion", "delece", "výběrová pozornost", "Základní pojmy NLP", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-02.33"
catalog_slug = "vypousteni"
catalog_family = "zakladni-pojmy"
catalog_family_code = "02"
catalog_family_title = "Základní pojmy NLP"
catalog_family_en = "Core NLP concepts"
catalog_part = "zakladni-pojmy.d"
catalog_type = "concept"
catalog_type_cs = "pojem"
catalog_en = "Deletion"
catalog_aliases = ["delece", "výběrová pozornost"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = ""
catalog_narrower = []
catalog_depth = 0
catalog_ancestors = []
catalog_related = ["zkreslovani", "zobecnovani", "hluboka-a-povrchova-struktura", "meta-model", "nespecifikovane-sloveso", "nespecifikovany-referencni-index", "prosta-delece", "srovnavaci-delece"]
catalog_related_declared = ["zkreslovani", "zobecnovani", "hluboka-a-povrchova-struktura", "prosta-delece", "srovnavaci-delece", "meta-model"]
catalog_kompendium = ["kompendium/techniques/ea-1-1-1-selektivni-expozice.md", "kompendium/techniques/ea-2-3-2-context-collapse.md", "kompendium/techniques/ea-2-3-3-quote-mining.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/argumentacni-fauly/jazykove-klamy/vytrzeni-z-kontextu.md", "kompendium/nlp-vzorce/meta-model/prosta-delece.md", "kompendium/nlp-vzorce/meta-model/srovnavaci-delece.md", "kompendium/nlp-vzorce/zakladni-pojmy/hluboka-a-povrchova-struktura.md", "kompendium/nlp-vzorce/zakladni-pojmy/zkreslovani.md", "kompendium/nlp-vzorce/zakladni-pojmy/zobecnovani.md"]
catalog_prev = "kotva-pojem"
catalog_next = "zkreslovani"
catalog_position = 33
catalog_family_size = 45
catalog_sources = ["bandler-grinder-1975", "bateson-1972", "beck-1976", "chomsky-1965", "cialdini-2009", "gilovich-1991", "herman-1992", "loftus-palmer-1974", "miller-1956", "oconnor-seymour-1990", "sharpley-1987", "tosey-mathison-2009", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1975", "oconnor-seymour-1990"]
catalog_sources_roots = ["bateson-1972", "chomsky-1965", "miller-1956"]
catalog_sources_critical = ["beck-1976", "cialdini-2009", "gilovich-1991", "herman-1992", "loftus-palmer-1974", "sharpley-1987", "tosey-mathison-2009", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Vztah k technikám kompendia", "Stav důkazů", "Obrana a zotavení"]
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/zakladni-pojmy.d.toml"
+++

# Vypouštění

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-02.33` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Základní pojmy NLP](@/kompendium/nlp-vzorce/zakladni-pojmy/_index.md) |
| **Druh** | pojem |
| **Anglicky** | Deletion |
| **Jiné názvy** | delece, výběrová pozornost |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Vypouštění (delece) je v neurolingvistickém programování název pro proces, jímž člověk ze
své zkušenosti i z jejího jazykového popisu vybírá jen část a zbytek nechává stranou. Bandler
a Grinder ho uvádějí jako první ze tří univerzálních procesů modelování, vedle
[zkreslování](@/kompendium/nlp-vzorce/zakladni-pojmy/zkreslovani.md) a
[zobecňování](@/kompendium/nlp-vzorce/zakladni-pojmy/zobecnovani.md): týmiž procesy, které
člověku umožňují orientovat se ve světě, si podle nich člověk také ochuzuje svůj model a
zužuje možnosti volby (Bandler a Grinder 1975). Vypouštění samo o sobě není chyba ani
technika. Je to nutná vlastnost každého vnímání a každé řeči, protože nikdo nemůže zachytit
ani vyslovit všechno. Pojem se stává zajímavým tam, kde se ptáme, co přesně bylo vypuštěno,
kdo o vypuštění rozhodl a komu chybějící část slouží. Pro kompendium je vypouštění klíčové
proto, že stojí na začátku řady manipulativních technik, které pracují s neúplností: s
výběrem faktů, s vytržením z kontextu a s výpovědí, v níž chybí ten, kdo jedná.

## Původ a souvislosti

Pojem vznikl v první knize zakladatelů NLP, která spojila pozorování terapeutické práce
Fritze Perlse a Virginie Satirové s transformační gramatikou. Bandler a Grinder z ní
převzali myšlenku, že věta, kterou člověk vysloví, je odvozena z úplnější výchozí
reprezentace a že při tomto odvození se části obsahu ztrácejí (Bandler a Grinder 1975).
Lingvistický rámec jim poskytl Chomsky, který rozlišil hloubkovou a povrchovou strukturu
věty a popsal transformace mezi nimi, mezi nimi i takové, které prvky vynechávají
(Chomsky 1965). NLP z tohoto technického pojmu udělalo psychologický: vypuštění v řeči
odpovídá vypuštění ve zkušenosti a odhalením jazykové mezery lze podle zakladatelů zpřístupnit
i to, co člověk ve svém prožívání přehlíží. Podrobněji tento vztah rozebírá stránka o
[hluboké a povrchové struktuře](@/kompendium/nlp-vzorce/zakladni-pojmy/hluboka-a-povrchova-struktura.md).

Nezávisle na NLP popsala kognitivní psychologie, proč výběr nastává. Miller ukázal, že
kapacita krátkodobého zpracování informací je omezená a že člověk tuto mez obchází
seskupováním a vynecháváním (Miller 1956). Bateson zase upozorňoval, že organismus pracuje s
rozdíly, které zachytí, a ostatní rozdíly pro něj neexistují (Bateson 1972). Pozdější
učebnice NLP s těmito pracemi zacházejí jako s oporou pro tvrzení, že vědomí zpracovává jen
malou část dostupných podnětů (O'Connor a Seymour 1990). Tyto souvislosti dávají pojmu
rozumný základ. Neprokazují však, že techniky NLP, které z něj vycházejí, mají specifický
terapeutický účinek.

## Struktura vzorce

V jazykové rovině se vypouštění projevuje jako výpověď, ve které chybí údaj potřebný k
úplnému porozumění. NLP v meta-modelu rozlišuje několik typů. Prosté vypuštění vynechává
předmět nebo okolnost („Bojím se“, aniž zazní čeho). Srovnávací vypuštění srovnává bez
uvedení měřítka („Je to lepší“, aniž zazní než co). Nespecifikovaný referenční index nechává
nejasné, kdo jedná („Říká se, že…“), a nespecifikované sloveso zamlžuje, jak se něco stalo
(Bandler a Grinder 1975). Souvisejícím případem je nominalizace, v níž se proces převede na
podstatné jméno a jednající osoba z věty zmizí. Jednotlivé typy podrobně popisují stránky
[prostého vypuštění](@/kompendium/nlp-vzorce/meta-model/prosta-delece.md) a
[srovnávacího vypuštění](@/kompendium/nlp-vzorce/meta-model/srovnavaci-delece.md).

V rovině vnímání a paměti má vypouštění podobu selektivní pozornosti: člověk si všimne
toho, co odpovídá jeho očekávání, a ostatní přejde. Gilovich shrnuje, jak lidé hodnotí
nejednoznačné údaje ve prospěch toho, co si už myslí, a jak snadno přehlížejí doklady, které
by jejich přesvědčení zpochybnily (Gilovich 1991). Beck popisuje u depresivního myšlení
selektivní abstrakci, tedy vytržení jednoho detailu z kontextu a přehlédnutí ostatních
(Beck 1976). Strukturálně je důležité rozlišit vypouštění, které provádí člověk sám ve vlastním
modelu, od vypouštění, které provádí mluvčí ve výpovědi určené druhým. První je předmětem
terapie, druhé může být nástrojem vlivu.

## Detekční znaky

Manipulativní vypouštění se pozná podle toho, že chybějící část není náhodná, ale
systematicky chrání mluvčího nebo jeho závěr. Typickým znakem je opakované vynechávání
původce rozhodnutí („bylo rozhodnuto“, „ukázalo se“, „všichni vědí“) ve chvílích, kdy by
jmenování původce otevřelo otázku odpovědnosti. Dalším znakem je srovnání bez měřítka,
které zní jako fakt, ale nedá se ověřit („výrazně lepší výsledky“). Třetím je citace nebo
záznam, ze kterého zmizela věta, která by vyzněla opačně, což kompendium jinde popisuje jako
těžbu citátů. Čtvrtým je odmítání doptávat se: mluvčí chybějící údaje nedoplní a označí je za
nepodstatné nebo za projev nedůvěry. Na straně posluchače se manipulativní vypouštění
projevuje tím, že si mezery doplňuje vlastními domněnkami a později zjistí, že jeho
představa neodpovídala ničemu, co bylo skutečně řečeno. Na tento mechanismus doplňování
upozorňuje i výzkum paměti, podle něhož formulace otázky ovlivňuje, co si svědek později
vybaví (Loftus a Palmer 1974).

## Legitimní a manipulativní užití

Legitimní vypouštění je ohlášené, přiměřené účelu a vratné. Shrnutí jednání, které upozorní,
že jde o výběr, a odkáže na úplný zápis, chrání příjemce před zahlcením a nic před ním
neskrývá. V terapeutickém rozhovoru má práce s vypuštěním opačný směr: terapeut se ptá na
chybějící údaje, aby klient svůj popis rozšířil a objevil možnosti, které v něm chyběly
(Bandler a Grinder 1975). Takové užití se podobá kognitivní terapii, která klienta vede k
tomu, aby k vytrženému detailu připojil zbytek situace (Beck 1976). Manipulativní vypouštění
je naopak skryté a jednosměrné. Mluvčí rozhoduje, co posluchač uvidí, a zároveň mu bere
možnost zeptat se na zbytek. V informačním prostředí se tak vytváří obraz, který je z
jednotlivých pravdivých údajů složen do nepravdivého celku, jak to kompendium popisuje u
selektivní expozice a kolapsu kontextu. Rozhodující otázka tedy nezní, zda něco bylo
vypuštěno, protože vypuštěno je vždy něco, ale zda je vypuštění přiznané a zda má posluchač
přístup k celku.

## Vztah k technikám kompendia

V kompendiu se vypouštění objevuje jako základní stavební prvek technik, které pracují s
neúplným obrazem. Selektivní expozice předkládá jen ty informace, které vedou k žádanému
závěru, a ostatní nechává stranou. Kolaps kontextu odstraňuje okolnosti, za nichž výrok nebo
čin vznikl, takže se jeho význam změní. [Těžba citátů](@/kompendium/argumentacni-fauly/jazykove-klamy/vytrzeni-z-kontextu.md) vybírá z textu jednotlivé věty tak, aby
vyzněly opačně, než autor zamýšlel. Ve všech třech případech jsou jednotlivé předložené údaje
pravdivé a nepravdivý je až celek. Proto jsou tyto techniky tak odolné vůči prostému ověření
faktů: kdo kontroluje jen to, co bylo řečeno, nezjistí nic, a teprve otázka po tom, co
řečeno nebylo, odhalí strukturu. Cialdini upozorňuje, že lidé při rozhodování ve spěchu a pod tlakem spoléhají na
myšlenkové zkratky (Cialdini 2009), a taková zkratka obvykle nezahrnuje otázku po
informacích, které nikdo nenabídl.

## Stav důkazů

Že lidé vnímají, pamatují si a mluví výběrově, je v psychologii dobře doložené a nesporné
(Miller 1956; Gilovich 1991). Sporné je až tvrzení NLP, že jazykové vypuštění věrně odráží
vypuštění ve zkušenosti a že jeho odhalením lze dosáhnout terapeutické změny. Pro toto
tvrzení nejsou k dispozici kontrolované studie, které by jeho specifický účinek prokázaly.
Přehledy výzkumu NLP konstatují obecně slabou empirickou základnu oboru a nedostatek
kvalitních studií jeho technik (Sharpley 1987; Witkowski 2010). Tosey a Mathison oceňují
jazykovou citlivost, kterou rozlišování typů vypuštění přináší, ale připomínají, že
přesvědčivost modelu nenahrazuje jeho ověření (Tosey a Mathison 2009). Lingvistický základ
pojmu je navíc dobově podmíněný: rozlišení hloubkové a povrchové struktury pochází ze
standardní teorie generativní gramatiky (Chomsky 1965), od níž lingvistika později v mnoha
ohledech ustoupila. Pojem tedy funguje jako užitečný popisný nástroj, ne jako ověřená teorie
změny.

## Obrana a zotavení

Nejúčinnější obranou je vrátit do rozhovoru chybějící údaje jednoduchými otázkami: kdo to
rozhodl, ve srovnání s čím, odkud to víte, kde je to zapsáno. Takové otázky nejsou útokem,
ale běžným požadavkem na úplnost. Pokud na ně mluvčí opakovaně odpovídá tím, že údaje
nejsou podstatné, je to informace sama o sobě. Druhou obranou je vyžádat si úplný zdroj,
tedy celý zápis, celou nahrávku nebo celou citaci, a porovnat ji s tím, co bylo předloženo.
Třetí obranou je vědomě rozlišovat, co bylo skutečně řečeno, od toho, co si člověk domyslel,
protože právě domyšlené části se nejsnáze stávají „vzpomínkou“ (Loftus a Palmer 1974). V
klinické práci s lidmi, kteří dlouho žili v prostředí řízeného výběru informací, se
obnova opírá o postupné rozšiřování zdrojů a o návrat k vlastnímu ověřování, nikoli o
nahrazení jednoho výběru jiným. Herman popisuje zotavení jako postupný návrat k bezpečí, k
vlastní autonomii a ke spojení s ostatními lidmi, a to platí i pro obnovu důvěry ve vlastní
úsudek (Herman 1992). Praktik, který s meta-modelem pracuje, by měl
otázky na vypuštění klást i sám sobě: co ve svém výkladu klienta vynechává a čí zájem tím
chrání.

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bateson, G. (1972). *Steps to an Ecology of Mind*. San Francisco: Chandler.
- Beck, A. T. (1976). *Cognitive Therapy and the Emotional Disorders*. New York: International Universities Press.
- Chomsky, N. (1965). *Aspects of the Theory of Syntax*. Cambridge, MA: MIT Press.
- Cialdini, R. B. (2009). *Influence: Science and Practice* (5. vyd.). Boston: Pearson.
- Gilovich, T. (1991). *How We Know What Isn't So: The Fallibility of Human Reason in Everyday Life*. New York: Free Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Loftus, E. F., & Palmer, J. C. (1974). Reconstruction of automobile destruction: An example of the interaction between language and memory. *Journal of Verbal Learning and Verbal Behavior*, 13(5), 585–589.
- Miller, G. A. (1956). The magical number seven, plus or minus two: Some limits on our capacity for processing information. *Psychological Review*, 63(2), 81–97.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Tosey, P., & Mathison, J. (2009). *Neuro-Linguistic Programming: A Critical Appreciation for Managers and Developers*. Basingstoke: Palgrave Macmillan.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Základní pojmy NLP](@/kompendium/nlp-vzorce/zakladni-pojmy/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel

**Příbuzná hesla**

- [Zkreslování](@/kompendium/nlp-vzorce/zakladni-pojmy/zkreslovani.md) – příbuzné heslo (Základní pojmy NLP, Distortion)
- [Zobecňování](@/kompendium/nlp-vzorce/zakladni-pojmy/zobecnovani.md) – příbuzné heslo (Základní pojmy NLP, Generalisation)
- [Hluboká a povrchová struktura](@/kompendium/nlp-vzorce/zakladni-pojmy/hluboka-a-povrchova-struktura.md) – příbuzné heslo (Základní pojmy NLP, Deep and surface structure)
- [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) – příbuzné heslo (Meta-model, Meta Model)
- [Nespecifikované sloveso](@/kompendium/nlp-vzorce/meta-model/nespecifikovane-sloveso.md) – příbuzné heslo (Meta-model, Unspecified verb)
- [Nespecifikovaný referenční index](@/kompendium/nlp-vzorce/meta-model/nespecifikovany-referencni-index.md) – příbuzné heslo (Meta-model, Unspecified referential index)
- [Prosté vypuštění](@/kompendium/nlp-vzorce/meta-model/prosta-delece.md) – příbuzné heslo (Meta-model, Simple deletion)
- [Srovnávací vypuštění](@/kompendium/nlp-vzorce/meta-model/srovnavaci-delece.md) – příbuzné heslo (Meta-model, Comparative deletion)

**V kompendiu**

- [EA-1.1.1 Selektivní expozice](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-2.3.2 Kolaps kontextu (context collapse)](@/kompendium/techniques/ea-2-3-2-context-collapse.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-2.3.3 Těžba citátů (quote mining)](@/kompendium/techniques/ea-2-3-3-quote-mining.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Kotva](@/kompendium/nlp-vzorce/zakladni-pojmy/kotva-pojem.md) – předchozí heslo rodiny
- [Zkreslování](@/kompendium/nlp-vzorce/zakladni-pojmy/zkreslovani.md) – další heslo rodiny

<!-- kompendium:katalog-vazby:end -->
