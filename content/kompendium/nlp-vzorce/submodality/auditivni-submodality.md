+++
title = "Auditivní submodality"
description = "Kvality sluchové představy a vnitřního hlasu v NLP: hlasitost, tempo, výška, směr a barva, jejich výklad, slabé doklady a zneužití vůči kritickému hlasu."
weight = 3
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-submodality", "nlp-pojem", "nlp-uziti-zadne"]
categories = ["academic"]

[extra]
toc = true
risk_level = "low"
lang = "cs"
keywords = ["Auditivní submodality", "Auditory submodalities", "kvality sluchové představy", "kvality vnitřního hlasu", "Submodality", "NLP", "neurolingvistické programování"]
schema_type = "DefinedTerm"
nlp_schema = 1
nlp_id = "NLP-10.03"
nlp_slug = "auditivni-submodality"
nlp_family = "submodality"
nlp_family_code = "10"
nlp_family_title = "Submodality"
nlp_family_en = "Submodalities"
nlp_part = "submodality"
nlp_type = "concept"
nlp_type_cs = "pojem"
nlp_en = "Auditory submodalities"
nlp_aliases = ["kvality sluchové představy", "kvality vnitřního hlasu"]
nlp_use = "zadne"
nlp_use_cs = "výkladový pojem"
nlp_risk = "nizke"
nlp_risk_cs = "nízké"
nlp_broader = "submodality-pojem"
nlp_narrower = []
nlp_depth = 1
nlp_ancestors = ["submodality-pojem"]
nlp_related = ["auditivni-system", "vnitrni-dialog", "elicitace-submodalit", "auditivni-swish", "zmena-vnitrniho-hlasu", "submodality-v-reklame", "zmena-kriticke-sebeprezentace", "sladeni-hlasu-a-tempa"]
nlp_related_declared = ["auditivni-system", "vnitrni-dialog", "zmena-vnitrniho-hlasu", "auditivni-swish", "sladeni-hlasu-a-tempa"]
nlp_kompendium = ["kompendium/techniques/ea-1-4-1-prosodicka-dominance.md", "kompendium/07-teoreticke-reflexe/kognitivni-vedy.md"]
nlp_links_prose = ["kompendium/nlp-vzorce/submodality/auditivni-swish.md", "kompendium/nlp-vzorce/submodality/zmena-vnitrniho-hlasu.md", "kompendium/nlp-vzorce/zakladni-pojmy/auditivne-digitalni-system.md", "kompendium/nlp-vzorce/zakladni-pojmy/auditivni-system.md", "kompendium/nlp-vzorce/zakladni-pojmy/vnitrni-dialog.md", "kompendium/techniques/ea-1-4-1-prosodicka-dominance.md"]
nlp_prev = "vizualni-submodality"
nlp_next = "kinesteticke-submodality"
nlp_position = 3
nlp_family_size = 20
nlp_sources = ["andreas-andreas-1987", "bandler-1985", "bandler-grinder-1979", "beck-1976", "dilts-1980", "ekman-2003", "ellis-1962", "hassan-1988", "herman-1992", "mcguire-1964", "passmore-rowson-2019", "petty-cacioppo-1986", "satir-1972", "sharpley-1984", "sharpley-1987", "watzlawick-1967", "witkowski-2010"]
nlp_sources_primary = ["andreas-andreas-1987", "bandler-1985", "bandler-grinder-1979", "dilts-1980"]
nlp_sources_roots = ["satir-1972", "watzlawick-1967"]
nlp_sources_critical = ["beck-1976", "ekman-2003", "ellis-1962", "hassan-1988", "herman-1992", "mcguire-1964", "passmore-rowson-2019", "petty-cacioppo-1986", "sharpley-1984", "sharpley-1987", "witkowski-2010"]
nlp_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
nlp_trainer_items = 2
nlp_trainer_benign = 1
nlp_vaknin = "inferred"
nlp_review = "agent"
nlp_catalogue = "data/nlp/submodality.toml"
+++

# Auditivní submodality

<!-- kompendium:nlp-hlavicka:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-10.03` |
| **Rodina** | [Submodality](@/kompendium/nlp-vzorce/submodality/_index.md) |
| **Druh** | pojem |
| **Anglicky** | Auditory submodalities |
| **Jiné názvy** | kvality sluchové představy, kvality vnitřního hlasu |
| **Obecnější vzorec** | [Submodality](@/kompendium/nlp-vzorce/zakladni-pojmy/submodality-pojem.md) |
| **Užití** | výkladový pojem |
| **Riziko zneužití** | nízké |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:nlp-hlavicka:end -->

## Definice

Auditivní submodality jsou v neurolingvistickém programování vlastnosti sluchové představy:
hlasitost, výška, tempo, rytmus, barva a tón, směr a vzdálenost zdroje, to, zda zvuk zní
uvnitř hlavy, nebo zvenčí, a čí hlas to je. Týkají se jak vybavených zvuků, například hudby
nebo hlasu blízkého člověka, tak vnitřní řeči, kterou NLP označuje jako
[vnitřní dialog](@/kompendium/nlp-vzorce/zakladni-pojmy/vnitrni-dialog.md). Výkladová teze
oboru tvrdí, že citový dopad vnitřního hlasu nezávisí jen na tom, co říká, ale také na tom, jak
to říká: kritika pronesená hlasitě, zblízka a ostrým tónem prožívá člověk jinak než tatáž
slova pronesená tiše a zdálky (Bandler 1985). Pojem navazuje na
[auditivní reprezentační systém](@/kompendium/nlp-vzorce/zakladni-pojmy/auditivni-system.md) a
spolu se zrakovými a tělesnými kvalitami tvoří katalog, ze kterého vycházejí techniky práce se
submodalitami. Pro kompendium je pojem důležitý tím, že vnitřní hlas často nese svědomí,
varování a hodnocení, a slovník, který z něj dělá zvukový parametr, lze obrátit proti právě
těmto funkcím.

## Původ a souvislosti

Sluchové kvality patří k modelu reprezentačních systémů od jeho počátků, kdy Bandler a
Grinder upozorňovali na to, že lidé zkušenost popisují i slovy slyšení a že [vnitřní řeč](@/kompendium/nlp-vzorce/zakladni-pojmy/auditivne-digitalni-system.md) je
samostatný kanál zpracování (Bandler a Grinder 1979). Rané systematizace pak sluchové
reprezentace začlenily do popisu strategií, tedy pořadí vnitřních kroků, jimiž člověk dospívá
k rozhodnutí (Dilts a kol. 1980). Zvláštní pozornost vnitřnímu hlasu věnoval Bandler v
polovině osmdesátých let; jeho výklad zdůrazňoval, že lidé často trpí ne obsahem svých
myšlenek, ale tónem, kterým si je říkají (Bandler 1985). Na tuto linii navázali Andreasovi,
kteří sluchové kvality zahrnuli do souboru pokročilých intervencí (Andreas a Andreas 1987).
Kořeny myšlenky, že na tónu a tempu záleží, jsou starší než NLP. Rodinná terapie zdůrazňovala,
že tón a způsob komunikace nesou sdělení o vztahu, které může obsahu odporovat (Satir 1972), a
teorie komunikace rozlišovala obsahovou a vztahovou rovinu sdělení (Watzlawick, Beavin a
Jackson 1967). NLP tyto poznatky přeneslo z vnější komunikace dovnitř, na vztah člověka k
vlastnímu hlasu.

## Struktura vzorce

Strukturálně pojem rozlišuje tři skupiny kvalit. První jsou fyzikální vlastnosti zvuku:
hlasitost, výška, tempo a rytmus. Druhou jsou prostorové vlastnosti: odkud zvuk přichází,
jak je daleko, zda zní z jedné strany, nebo obklopuje. Třetí jsou vlastnosti hlasu jako
osoby: čí hlas to je, jaký má tón a jaký postoj k posluchači vyjadřuje. Výkladová vrstva
přiřazuje kvalitám význam. Hlas, který je hlasitý, blízký a ostrý, nese podle NLP větší
autoritu a citový náboj; hlas tichý, vzdálený nebo komický jej ztrácí (Bandler 1985). Na této
tezi stavějí techniky, které katalog popisuje samostatně, například
[změna vnitřního hlasu](@/kompendium/nlp-vzorce/submodality/zmena-vnitrniho-hlasu.md) a
[auditivní swish](@/kompendium/nlp-vzorce/submodality/auditivni-swish.md).

Zvláštní místo mají v katalogu kvality, které neoznačují zvuk, ale vztah: komu hlas patří a z
jaké pozice mluví. V praktické literatuře NLP se často uvádí, že vnitřní kritik zní hlasem
rodiče, učitele nebo jiné autority z minulosti a že člověk tento hlas slyší, jako by k němu
stále mluvila tatáž osoba. Tato poznámka je klinicky srozumitelná a odpovídá tomu, co
popisují i jiné školy: vnitřní hodnocení se utváří ve vztazích a nese jejich stopu. Z
hlediska kompendia je důležité, že stejně tak se může utvořit i nově. Kdo má k člověku
dlouhodobý a citově silný přístup, může se stát hlasem, který v něm hodnotí, a to i tehdy,
když s ním už není ve styku.

Pro pozorovatele je podstatné, že vnitřní hlas má v psychickém životě různé funkce. Může
nést nepřiměřenou sebekritiku, která člověka trápí a kterou má smysl zmírnit. Může však nést
i oprávněné varování, morální úsudek nebo hlas blízkého člověka, jehož pohled je cenný.
Slovník auditivních submodalit tyto funkce nerozlišuje: hlas je v něm jen soubor kvalit, které
lze měnit. To je zdrojem jeho dvojí povahy. Zmírnění tónu krutého vnitřního kritika může být
úlevou; ztlumení hlasu, který varuje před podvodem, je ztrátou ochrany. Kompendium popisuje
vnější podobu téhož mechanismu, ovládání posluchače intonací a tempem, jako
[prozodickou dominanci](@/kompendium/techniques/ea-1-4-1-prosodicka-dominance.md).

## Detekční znaky

Práce s auditivními submodalitami se v rozhovoru pozná podle otázek na to, jak vnitřní hlas
zní, odkud přichází a čí je, a podle návrhů ho ztlumit, zpomalit, vzdálit, změnit jeho tón nebo
ho nahradit jiným hlasem. Varovné znaky se týkají toho, který hlas se má měnit a kdo o tom
rozhoduje. Prvním je, že se oslabuje hlas, který nese varování nebo pochybnost, typicky před
finančním závazkem, rozhodnutím zůstat ve skupině nebo přerušením kontaktu s blízkými.
Druhým je, že se oslabený hlas má nahradit hlasem mluvčího: člověk má „slyšet“ vůdce, kouče
nebo prodejce tam, kde dosud slyšel vlastní úsudek. Třetím je zlehčování: varování se popisuje
jako „skřípavý hlásek“ nebo „starý záznam“, aby ztratilo vážnost bez věcné odpovědi. Čtvrtým je
opakování: stejná nahrávka hlasu autority se pouští znovu a znovu, na setkáních i v
nahrávkách k poslechu doma. Literatura o kultech popisuje podobné nahrazování vnitřního hlasu
doktrínou jako součást kontroly myšlení (Hassan 1988).

## Legitimní a manipulativní užití

Legitimní užití pojmu se týká především vztahu člověka k vlastní krutosti vůči sobě.
Klientka, která sama popisuje, že její sebekritika zní „hodně nahlas a hodně zblízka“, podává
informaci o tom, jak sebekritiku prožívá, a terapeut může s tímto popisem pracovat. Ověřené
přístupy k sebekritice, například kognitivní terapie, se zaměřují na obsah a funkci
automatických myšlenek a na jejich ověřování (Beck 1976); racionálně emoční terapie zase na
iracionální požadavky, které vnitřní řeč nese (Ellis 1962). Popis tónu a hlasitosti může tuto
práci doplnit, pokud cíl určuje klient a pokud se neztrácí ze zřetele obsah.

Manipulativní užití obrací pozornost od obsahu k formě právě tam, kde obsah je nepohodlný pro
mluvčího. Varovný hlas se popíše jako zvuková kvalita, a tím se zbaví nároku na odpověď. Místo
otázky, zda je varování oprávněné, se nabízí technika, jak ho ztlumit. Účinnost tohoto tahu
nespočívá v doložené síle submodalit, ale v obecnějším mechanismu: kdo přestane věnovat
pozornost argumentům a soustředí se na periferní podněty, jako je tón a autorita mluvčího,
mění postoj méně promyšleně a méně trvale (Petty a Cacioppo 1986). V uzavřených skupinách tak
slovník auditivních kvalit poskytuje jazyk, kterým lze vnitřní kritiku umlčet, aniž by se
pojmenovalo, co se umlčuje.

## Stav důkazů

Specificky zaměřený kontrolovaný výzkum auditivních submodalit je velmi vzácný. Přehledy
výzkumu NLP konstatují, že klíčová tvrzení oboru nemají v kontrolovaných studiích oporu a že
pozitivní nálezy pocházejí většinou z prací nízké metodologické kvality (Witkowski 2010).
Rané přehledy výzkumu reprezentačních systémů a predikátů nenašly podporu pro tvrzení, na
kterých celý model smyslových kanálů stojí (Sharpley 1984), a pozdější shrnutí dospělo k
otázce, zda jde o nepodpořenou, nebo nevyvratitelnou teorii (Sharpley 1987). Je třeba
rozlišit tato zjištění od obecné zkušenosti, že tón a tempo hlasu ovlivňují, jak sdělení
působí; ta je dobře doložena ve výzkumu komunikace i emocí (Ekman 2003). Z toho však neplyne,
že změna představované hlasitosti nebo směru vnitřního hlasu spolehlivě mění citovou reakci,
jak tvrdí NLP. Kritický přehled pro koučink doporučuje u technik postavených na takových
tvrzeních opatrnost (Passmore a Rowson 2019).

## Obrana a zotavení

Základní obranou je ptát se, co vnitřní hlas říká, dříve než se řeší, jak zní. Pokud někdo
navrhuje ztlumit hlas, který varuje, je rozumné varování nejprve vyslovit nahlas a posoudit
jeho důvody, nejlépe s někým mimo situaci. Druhou obranou je hlídat nahrazování: když se má
místo vlastního úsudku „slyšet“ hlas autority, ztrácí člověk vnitřní korektiv a stává se
závislým na vnějším vedení. Třetí obranou je omezit opakovaný poslech nahrávek a projevů,
které mají vnitřní hlas přeladit; odstup od nich obnovuje prostor pro vlastní uvažování.
Inokulační přístup k přesvědčování ukazuje, že předem pojmenovaný tah ztrácí část své síly
(McGuire 1964).

U lidí, kteří vyšli z prostředí, kde byl jejich vnitřní hlas soustavně nahrazován hlasem
vůdce, se zotavení často projevuje návratem vlastní vnitřní řeči, někdy zprvu nejisté a tiché.
Klinik by měl tento návrat podporovat a nespěchat s dalšími „úpravami“ hlasu. Je také třeba
rozlišovat vnitřní řeč od sluchových halucinací, které vyžadují psychiatrické posouzení, a
nevykládat je jazykem submodalit. Herman zdůrazňuje, že obnova autonomie zahrnuje i obnovu
práva na vlastní úsudek a vlastní slova (Herman 1992).

<!-- kompendium:nlp-vazby:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

## Literatura

- Andreas, S., & Andreas, C. (1987). *Change Your Mind—and Keep the Change: Advanced NLP Submodalities Interventions*. Moab: Real People Press.
- Bandler, R. (1985). *Using Your Brain—for a Change*. Moab: Real People Press.
- Bandler, R., & Grinder, J. (1979). *Frogs into Princes: Neuro Linguistic Programming*. Moab: Real People Press.
- Beck, A. T. (1976). *Cognitive Therapy and the Emotional Disorders*. New York: International Universities Press.
- Dilts, R., Grinder, J., Bandler, R., & DeLozier, J. (1980). *Neuro-Linguistic Programming: Volume I. The Study of the Structure of Subjective Experience*. Cupertino: Meta Publications.
- Ekman, P. (2003). *Emotions Revealed: Recognizing Faces and Feelings to Improve Communication and Emotional Life*. New York: Times Books.
- Ellis, A. (1962). *Reason and Emotion in Psychotherapy*. New York: Lyle Stuart.
- Hassan, S. (1988). *Combatting Cult Mind Control*. Rochester: Park Street Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Petty, R. E., & Cacioppo, J. T. (1986). *Communication and Persuasion: Central and Peripheral Routes to Attitude Change*. New York: Springer.
- Satir, V. (1972). *Peoplemaking*. Palo Alto: Science and Behavior Books.
- Sharpley, C. F. (1984). Predicate matching in NLP: A review of research on the preferred representational system. *Journal of Counseling Psychology*, 31(2), 238–248.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Watzlawick, P., Beavin, J. H., & Jackson, D. D. (1967). *Pragmatics of Human Communication*. New York: W. W. Norton.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

**Rodina a hierarchie**

- [Submodality](@/kompendium/nlp-vzorce/submodality/_index.md) – rodina, do níž vzorec patří, s přehledem všech jejích vzorců
- [Submodality](@/kompendium/nlp-vzorce/zakladni-pojmy/submodality-pojem.md) – obecnější vzorec, jehož je tento vzorec zvláštním případem

**Příbuzné vzorce**

- [Auditivní reprezentační systém](@/kompendium/nlp-vzorce/zakladni-pojmy/auditivni-system.md) – příbuzný vzorec (Základní pojmy NLP, Auditory representational system)
- [Vnitřní dialog](@/kompendium/nlp-vzorce/zakladni-pojmy/vnitrni-dialog.md) – příbuzný vzorec (Základní pojmy NLP, Internal dialogue)
- [Elicitace submodalit](@/kompendium/nlp-vzorce/submodality/elicitace-submodalit.md) – příbuzný vzorec (Submodality, Eliciting submodalities)
- [Auditivní swish](@/kompendium/nlp-vzorce/submodality/auditivni-swish.md) – příbuzný vzorec (Submodality, Auditory swish)
- [Změna vnitřního hlasu](@/kompendium/nlp-vzorce/submodality/zmena-vnitrniho-hlasu.md) – příbuzný vzorec (Submodality, Changing the inner voice)
- [Submodality v reklamě a médiích](@/kompendium/nlp-vzorce/submodality/submodality-v-reklame.md) – příbuzný vzorec (Submodality, Submodalities in advertising and media)
- [Vzorec vnitřního kritika](@/kompendium/nlp-vzorce/submodality/zmena-kriticke-sebeprezentace.md) – příbuzný vzorec (Submodality, Inner critic pattern)
- [Sladění hlasu a tempa](@/kompendium/nlp-vzorce/raport-a-kalibrace/sladeni-hlasu-a-tempa.md) – příbuzný vzorec (Raport a kalibrace, Voice and tempo matching)

**V kompendiu**

- [EA-1.4.1 Prosodická dominance](@/kompendium/techniques/ea-1-4-1-prosodicka-dominance.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [7.5 Kognitivní vědy a EA — duální systém, predikční zpracování, embodied cognition](@/kompendium/07-teoreticke-reflexe/kognitivni-vedy.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí

**V katalogu**

- [Vizuální submodality](@/kompendium/nlp-vzorce/submodality/vizualni-submodality.md) – předchozí vzorec rodiny
- [Kinestetické submodality](@/kompendium/nlp-vzorce/submodality/kinesteticke-submodality.md) – další vzorec rodiny
- [Trenér rozpoznávání NLP vzorců](@/kompendium/nlp-vzorce/trener.md) – procvičení rozpoznání tohoto vzorce na příkladech výroků

<!-- kompendium:nlp-vazby:end -->
