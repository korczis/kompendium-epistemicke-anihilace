+++
title = "Izomorfní metafora"
description = "Metafora, jejíž postavy a děj strukturně kopírují situaci posluchače: jak se izomorfie pozná, proč přenáší závěry bez argumentu a co o ní říká výzkum."
weight = 12
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-jazykove-vzorce", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Izomorfní metafora", "Isomorphic metaphor", "izomorfismus metafory", "strukturně shodný příběh", "Jazykové vzorce", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-20.12"
catalog_slug = "izomorfni-metafora"
catalog_family = "jazykove-vzorce"
catalog_family_code = "20"
catalog_family_title = "Jazykové vzorce"
catalog_family_en = "Language patterns"
catalog_part = "jazykove-vzorce.b"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Isomorphic metaphor"
catalog_aliases = ["izomorfismus metafory", "strukturně shodný příběh"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "terapeuticka-metafora"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["terapeuticka-metafora"]
catalog_related = ["utilizace", "vnorene-smycky", "vrstveni-realit", "som-analogie", "lateralni-chunking", "terapeuticka-metafora"]
catalog_related_declared = ["terapeuticka-metafora", "vnorene-smycky", "utilizace", "som-analogie"]
catalog_kompendium = ["kompendium/techniques/ea-6-3-6-narrativni-rekonstrukce.md", "kompendium/07-teoreticke-reflexe/kognitivni-vedy.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/nlp-vzorce/jazykove-vzorce/terapeuticka-metafora.md", "kompendium/nlp-vzorce/sleight-of-mouth/som-analogie.md", "kompendium/techniques/ea-6-3-6-narrativni-rekonstrukce.md"]
catalog_prev = "terapeuticka-metafora"
catalog_next = "ale-a-a"
catalog_position = 12
catalog_family_size = 20
catalog_sources = ["bateson-1972", "bateson-1956", "dilts-1999", "gordon-1978", "grice-1975", "haley-1973", "herman-1992", "lakoff-johnson-1980", "passmore-rowson-2019", "rosen-1982", "watzlawick-1967", "witkowski-2010"]
catalog_sources_primary = ["dilts-1999", "gordon-1978"]
catalog_sources_roots = ["bateson-1972", "bateson-1956", "grice-1975", "haley-1973", "rosen-1982", "watzlawick-1967"]
catalog_sources_critical = ["herman-1992", "lakoff-johnson-1980", "passmore-rowson-2019", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/jazykove-vzorce.b.toml"
+++

# Izomorfní metafora

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-20.12` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Jazykové vzorce](@/kompendium/nlp-vzorce/jazykove-vzorce/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Isomorphic metaphor |
| **Jiné názvy** | izomorfismus metafory, strukturně shodný příběh |
| **Obecnější heslo** | [Terapeutická metafora](@/kompendium/nlp-vzorce/jazykove-vzorce/terapeuticka-metafora.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Izomorfní metafora je příběh nebo obraz, jehož vnitřní struktura odpovídá struktuře situace,
o které se ve skutečnosti mluví. Každému podstatnému prvku posluchačova problému, tedy osobám,
jejich vztahům, překážkám a dosavadním pokusům o řešení, odpovídá prvek příběhu, a průběh
příběhu sleduje průběh problému. Pojem izomorfie, převzatý z matematiky, kde označuje
zobrazení zachovávající strukturu, zavedl do NLP David Gordon jako hlavní podmínku účinné
[terapeutické metafory](@/kompendium/nlp-vzorce/jazykove-vzorce/terapeuticka-metafora.md)
(Gordon 1978). Izomorfní metafora je tedy užší pojem: označuje ne jakýkoli příběh, ale příběh
konstruovaný tak, aby se v něm posluchač mohl poznat, aniž by byl jmenován. Pro obrannou
analýzu je podstatné, že strukturní shoda umožňuje přenést závěr z příběhu na skutečnou
situaci, aniž by tento přenos kdokoli vyslovil nebo obhájil.

## Původ a souvislosti

Gordon vycházel z pozorování Ericksonovy práce, v níž příběhy o zdánlivě nesouvisejících
tématech, například o pěstování rostlin nebo o učení se chůzi, odpovídaly tomu, s čím pacient
přišel (Gordon 1978). Sbírka Ericksonových učebních příběhů ukazuje stejný princip na mnoha
příkladech, i když jejich výběr a komentáře jsou dílem editora, ne systematickým modelem
(Rosen 1982). Hlubší kořen má myšlenka v díle Gregoryho Batesona, který se zabýval tím, jak
lidé rozpoznávají vzorce napříč různými oblastmi a jak komunikace pracuje s rámci, jež
určují, zda se sdělení míní doslova, nebo obrazně (Bateson 1972). Bateson a spolupracovníci
navíc v práci o dvojné vazbě upozornili, že nejasné rozlišení mezi doslovným a metaforickým
sdělením může být zdrojem zmatení, zvláště když posluchač nesmí rámec sdělení pojmenovat
(Bateson a kol. 1956). Kognitivní lingvistika popsala metaforu jako zobrazení mezi dvěma
pojmovými oblastmi, při kterém se struktura zdrojové oblasti přenáší na cílovou (Lakoff a
Johnson 1980). Tato teorie dává Gordonovu pojmu izomorfie obecnější rámec: každá metafora
nějakou strukturu přenáší, izomorfní metafora je jen záměrně a úplně namapovaná.

## Struktura vzorce

Strukturu izomorfní metafory lze popsat jako tabulku shod. Na jedné straně stojí skutečná
situace: kdo v ní vystupuje, jaké jsou jejich vztahy, co posluchač zkoušel a proč to nepomohlo.
Na druhé straně stojí příběh se stejným počtem a uspořádáním prvků. Gordon kladl důraz na to,
aby shoda byla strukturní, nikoli povrchová: postavy nemusí mít stejné povolání ani pohlaví,
ale musí stát ve stejných vztazích (Gordon 1978). V ericksonovské tradici se navíc obvykle
předpokládá, že posluchač má souvislost příběhu se svou situací rozpoznat spíše intuitivně
než výslovně; tento předpoklad je součástí výkladu praktiků, ne ověřeným zjištěním. Rozuzlení příběhu pak obsahuje nový prvek,
který v posluchačově situaci zatím chybí: jiný způsob jednání, jiný pohled nebo zdroj, s nímž
postava problém vyřeší.

Z hlediska mechanismu je izomorfní metafora analogickým argumentem bez přiznaných premis.
V otevřené analogii se tvrdí, že dvě situace jsou podobné, a proto pro ně platí stejný závěr;
posluchač může podobnost zpochybnit. Ve skryté analogii se podobnost nevyslovuje a závěr se
nevyvozuje nahlas, takže zpochybnit není co. Tento rozdíl je jádrem obou podob užití. Stejnou
logiku popisuje ve své nepřímé podobě i vzorec
[analogie ze Sleight of Mouth](@/kompendium/nlp-vzorce/sleight-of-mouth/som-analogie.md), kde
se analogie používá k přerámování přesvědčení (Dilts 1999). Pragmatika vysvětluje, proč
posluchač na skrytou analogii vůbec reaguje: předpokládá, že vypravěč mluví relevantně, a
sám si dovozuje, proč mu právě tento příběh vypráví (Grice 1975).

## Detekční znaky

Izomorfní metaforu prozrazuje především nápadná přesnost shody. Když posluchač po vyslechnutí
příběhu zjistí, že počet postav, jejich vztahy i pořadí událostí odpovídá jeho vlastní
situaci, jde téměř jistě o záměr, ne o náhodu. Druhým znakem je volba okamžiku: příběh zazní
právě ve chvíli, kdy posluchač zvažuje rozhodnutí, vyjádřil pochybnost nebo položil otázku.
Třetím znakem je hodnotové zabarvení rozuzlení. Postava, která odpovídá posluchači, dojde k
dobrému konci jen tehdy, když udělá to, co by si vypravěč přál, a postavy odpovídající lidem,
kteří vypravěči konkurují, jsou vylíčeny nepříznivě. Čtvrtým znakem je odmítnutí výkladu:
na otázku, zda se příběh týká posluchače, vypravěč odpoví vyhýbavě nebo s úsměvem, který
naznačuje, že posluchač „to pochopil sám“. U posluchače se manipulativní izomorfní metafora
projevuje zvláštním druhem nejistoty: cítí tlak k určitému rozhodnutí, ale nedokáže říct,
kdo ho k němu vybídl, protože nikdo nic nepožadoval. Watzlawick a spolupracovníci rozlišili
obsahovou a vztahovou rovinu sdělení (Watzlawick, Beavin a Jackson 1967). Izomorfní
metafora přenáší požadavek na vztahové rovině a obsahová rovina zůstává nevinná.

Od izomorfní metafory je třeba odlišit běžné přirovnání, které lidé v rozhovoru používají
spontánně a bez záměru. Kdo řekne, že se cítí „jako v kleci“, vyjadřuje svou zkušenost a
nikomu nic nepodsouvá. Rozhodující není samotná podobnost, ale tři otázky: kdo obraz zvolil,
komu slouží závěr, který z něj plyne, a zda je možné o paralele otevřeně mluvit. Pozorovatel,
například klinik nebo vyšetřovatel posuzující zprávu o dlouhodobém vztahu, se může ptát i
na opakování. Jediný příběh s nápadnou paralelou může být nešikovný pokus o radu. Řada
příběhů, které se vracejí ke stejnému poučení a vždy zaznívají po projevu nesouhlasu, ukazuje
na vzorec. Lakoff a Johnson upozorňují, že ustálená metafora postupně přestává být vnímána
jako metafora a začne se jevit jako prostý popis skutečnosti (Lakoff a Johnson 1980); totéž
se může stát s podobenstvím, které se v rodině nebo skupině vypráví dost často.

## Legitimní a manipulativní užití

V terapii a supervizi může izomorfní metafora pomoci tam, kde přímé pojmenování vyvolává stud
nebo obranu. Klient, který by odmítl slyšet, že se ve vztahu vyčerpává, může snáze uvažovat o
postavě, která nese příliš mnoho zavazadel. Legitimní užití však vyžaduje, aby souvislost
mohla být kdykoli pojmenována a aby klient mohl paralelu odmítnout nebo opravit. Supervizor,
který řekne „napadá mě tento obraz, sedí vám?“, převádí skrytou analogii na otevřenou a dává
posluchači slovo. Ericksonovy příběhy byly vyprávěny v kontextu, kde pacient přišel pro
pomoc a terapeut za své intervence nesl profesní odpovědnost (Haley 1973). Manipulativní
užití naopak využívá izomorfii k tomu, aby závěr zůstal nevyslovený. V blízkých vztazích se
objevuje jako vyprávění o „známých“, jejichž osud přesně odpovídá tomu, co by posluchače
čekalo, kdyby odešel. V uzavřených skupinách se jako podobenství předává výklad, kterým vůdce
odpovídá na kritiku, aniž by kritiku musel připustit. Kompendium rozebírá podobně skryté
převzetí cizího výkladu u
[narativní rekonstrukce](@/kompendium/techniques/ea-6-3-6-narrativni-rekonstrukce.md), kde se
obnovuje právo člověka vyprávět svůj příběh vlastními slovy.

## Stav důkazů

Pro tvrzení, že izomorfní metafory jsou účinnější než jiné formy intervence nebo že působí
mimo vědomé zpracování, neexistují kontrolované studie. Gordonova kniha i navazující
literatura NLP opírá svá tvrzení o klinickou zkušenost a o ilustrativní příklady (Gordon
1978). Přehledy výzkumu NLP opakovaně konstatují, že obor nevytvořil soubor studií, který by
jeho specifická tvrzení podpořil, a že dostupné kontrolované studie výsledky převážně
nepotvrzují (Witkowski 2010; Passmore a Rowson 2019). Solidně doložené je naproti tomu obecné
tvrzení, že metafory ovlivňují chápání situace: kognitivní lingvistika ukazuje, jak metaforické
zobrazení zvýrazňuje některé rysy cílové oblasti a jiné skrývá (Lakoff a Johnson 1980). Pro
čtenáře kompendia z toho plyne opatrnost dvojího druhu. Neměl by věřit slibům o zvláštní
„hypnotické“ síle izomorfních příběhů, ale neměl by ani podceňovat, že dobře zvolená analogie
dokáže přenést hodnocení, které by v přímé podobě neobstálo.

## Obrana a zotavení

Nejúčinnější obranou je zviditelnit izomorfii. Posluchač si může v duchu nebo nahlas sestavit
tabulku shod: kdo v příběhu odpovídá komu a co by z příběhu plynulo pro skutečnou situaci.
Jakmile je analogie vyslovena, lze ji posoudit jako každý jiný argument: jsou situace opravdu
podobné v tom, na čem závěr stojí? Druhou obranou je zeptat se vypravěče přímo, zda o
posluchači mluví, a v případě kladné odpovědi požádat o přímé sdělení. Třetí obranou je
vymyslet alternativní konec příběhu. Když stejná výchozí situace může vést k jinému
rozuzlení, ztrácí vyprávěný konec zdání nevyhnutelnosti, které mu struktura propůjčila. Pro
lidi, kteří byli dlouhodobě vystaveni podobenstvím a příběhům s trestajícím koncem, je cenné
rozpoznat, že jejich obavy často nepocházejí ze skutečných zkušeností, ale z vyprávění, které
jim někdo vložil do paměti jako varování. Herman popisuje, jak se při zotavení z traumatu
člověk znovu stává autorem vlastního příběhu a jak k tomu potřebuje bezpečný vztah, v němž
jeho výklad není podřízen výkladu někoho jiného (Herman 1992). Totéž platí pro zotavení z
prostředí, kde se výklad předával příběhy, jejichž smysl směl znát jen vypravěč.

## Literatura

- Bateson, G. (1972). *Steps to an Ecology of Mind*. San Francisco: Chandler.
- Bateson, G., Jackson, D. D., Haley, J., & Weakland, J. (1956). Toward a theory of schizophrenia. *Behavioral Science*, 1(4), 251–264.
- Dilts, R. (1999). *Sleight of Mouth: The Magic of Conversational Belief Change*. Capitola: Meta Publications.
- Gordon, D. (1978). *Therapeutic Metaphors: Helping Others through the Looking Glass*. Cupertino: Meta Publications.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Haley, J. (1973). *Uncommon Therapy: The Psychiatric Techniques of Milton H. Erickson, M.D.* New York: W. W. Norton.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Lakoff, G., & Johnson, M. (1980). *Metaphors We Live By*. Chicago: University of Chicago Press.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Rosen, S. (Ed.) (1982). *My Voice Will Go with You: The Teaching Tales of Milton H. Erickson*. New York: W. W. Norton.
- Watzlawick, P., Beavin, J. H., & Jackson, D. D. (1967). *Pragmatics of Human Communication*. New York: W. W. Norton.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Jazykové vzorce](@/kompendium/nlp-vzorce/jazykove-vzorce/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Terapeutická metafora](@/kompendium/nlp-vzorce/jazykove-vzorce/terapeuticka-metafora.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Utilizace](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/utilizace.md) – příbuzné heslo (Ericksonovská hypnóza, Utilisation)
- [Vnořené smyčky](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/vnorene-smycky.md) – příbuzné heslo (Ericksonovská hypnóza, Nested loops)
- [Vrstvení realit](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/vrstveni-realit.md) – příbuzné heslo (Ericksonovská hypnóza, Stacking realities)
- [Analogie](@/kompendium/nlp-vzorce/sleight-of-mouth/som-analogie.md) – příbuzné heslo (Sleight of Mouth, Analogy)
- [Laterální chunking](@/kompendium/nlp-vzorce/jazykove-vzorce/lateralni-chunking.md) – příbuzné heslo (Jazykové vzorce, Lateral chunking)
- [Terapeutická metafora](@/kompendium/nlp-vzorce/jazykove-vzorce/terapeuticka-metafora.md) – příbuzné heslo (Jazykové vzorce, Therapeutic metaphor)

**V kompendiu**

- [EA-6.3.6 Narativní rekonstrukce](@/kompendium/techniques/ea-6-3-6-narrativni-rekonstrukce.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [7.5 Kognitivní vědy a EA — duální systém, predikční zpracování, embodied cognition](@/kompendium/07-teoreticke-reflexe/kognitivni-vedy.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Terapeutická metafora](@/kompendium/nlp-vzorce/jazykove-vzorce/terapeuticka-metafora.md) – předchozí heslo rodiny
- [Záměna „ale“ za „a“](@/kompendium/nlp-vzorce/jazykove-vzorce/ale-a-a.md) – další heslo rodiny

<!-- kompendium:katalog-vazby:end -->
