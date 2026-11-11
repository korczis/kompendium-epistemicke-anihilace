+++
title = "Ekologický klam"
description = "Usuzování z dat o skupinách, oblastech nebo státech na vlastnosti a chování jednotlivců: proč souvislost mezi celky nemusí platit uvnitř nich."
weight = 10
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-statisticke", "fauly-neformalni-klam", "fauly-uziti-chyba"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Ekologický klam", "Ecological fallacy", "ekologická chyba", "klam ekologické korelace", "Statistické a pravděpodobnostní klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-05.10"
catalog_slug = "ekologicky-klam"
catalog_family = "statisticke"
catalog_family_code = "05"
catalog_family_title = "Statistické a pravděpodobnostní klamy"
catalog_family_en = "Statistical and probabilistic fallacies"
catalog_part = "statisticke.b"
catalog_type = "informal"
catalog_type_cs = "neformální klam"
catalog_en = "Ecological fallacy"
catalog_aliases = ["ekologická chyba", "klam ekologické korelace"]
catalog_use = "chyba"
catalog_use_cs = "převážně chyba uvažování"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = ""
catalog_narrower = []
catalog_depth = 0
catalog_ancestors = []
catalog_related = ["prilis-siroke-zobecneni", "korelace-a-kauzalita", "prehlizena-spolecna-pricina", "zkresleny-vyber", "simpsonuv-paradox", "klam-skladani", "klam-deleni"]
catalog_related_declared = ["simpsonuv-paradox", "klam-deleni", "klam-skladani", "korelace-a-kauzalita", "prilis-siroke-zobecneni"]
catalog_kompendium = ["kompendium/population-health/_index.md", "kompendium/07-populacni/_index.md", "kompendium/02-uvod/metodologicke-poznamky.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/07-populacni/_index.md", "kompendium/argumentacni-fauly/jazykove-klamy/klam-deleni.md", "kompendium/argumentacni-fauly/statisticke/simpsonuv-paradox.md", "kompendium/nlp-vzorce/sleight-of-mouth/som-hierarchie-kriterii.md", "kompendium/population-health/_index.md"]
catalog_prev = "klam-obhajce"
catalog_next = "simpsonuv-paradox"
catalog_position = 10
catalog_family_size = 16
catalog_sources = ["copi-cohen-mcmahon-2014", "hamblin-1970", "robinson-1950", "simpson-1951", "tversky-kahneman-1974"]
catalog_sources_primary = ["copi-cohen-mcmahon-2014", "hamblin-1970"]
catalog_sources_roots = []
catalog_sources_critical = ["robinson-1950", "simpson-1951", "tversky-kahneman-1974"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Vztah k technikám kompendia", "Obrana a odpověď"]
catalog_review = "agent"
catalog_data = "data/fauly/statisticke.b.toml"
+++

# Ekologický klam

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-05.10` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) |
| **Druh** | neformální klam |
| **Anglicky** | Ecological fallacy |
| **Jiné názvy** | ekologická chyba, klam ekologické korelace |
| **Užití** | převážně chyba uvažování |
| **Riziko zneužití** | střední |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Ekologický klam je chybný úsudek, při kterém se ze souvislosti naměřené mezi skupinami,
oblastmi nebo jinými celky vyvozuje souvislost mezi vlastnostmi jednotlivců, kteří do těchto
celků patří. Slovo „ekologický“ tu nemá nic společného s ochranou přírody: označuje data
sebraná na úrovni prostorových nebo sociálních jednotek, jako jsou okresy, školy, státy nebo
nemocnice. Pokud v obcích s vyšším podílem určité skupiny obyvatel je vyšší i výskyt určitého
jevu, nelze bez dalších dat tvrdit, že jev postihuje právě příslušníky této skupiny. Klasický
rozbor problému podal sociolog William Robinson, který ukázal, že korelace vypočtená z
agregovaných údajů za územní celky se může od korelace mezi jednotlivci lišit nejen velikostí,
ale i znaménkem (Robinson 1950). Ekologický klam je proto zvláštním případem přenosu závěru z
jedné úrovně analýzy na jinou, příbuzným s klamem dělení, který vlastnosti celku připisuje
jeho částem (Copi, Cohen a McMahon 2014).

## Původ a souvislosti

Úvahy o tom, že co platí o celku, nemusí platit o části, mají dlouhou tradici. Aristotelés
řadil chyby skládání a dělení mezi klamy závislé na jazyce a Hamblin ve svém historickém
rozboru ukazuje, jak se tato dvojice předávala učebnicemi logiky až do moderní doby (Hamblin
1970). Empirické sociální vědy však k problému dospěly vlastní cestou. V první polovině
dvacátého století byla data o jednotlivcích drahá a vzácná, kdežto souhrnné údaje ze sčítání
lidu byly k dispozici za každý stát a okres. Výzkumníci proto korelace mezi územními celky
často používali jako náhradu korelací mezi lidmi. Robinson na údajích ze sčítání ukázal, že
podíl lidí narozených v cizině souvisel napříč státy s gramotností opačně, než jak souvisel u
jednotlivců: přistěhovalci se usazovali převážně ve státech, kde byla gramotnost domácího
obyvatelstva vysoká, takže souhrnné údaje vytvářely obraz, který o jednotlivých
přistěhovalcích neplatil (Robinson 1950). Název ekologický klam se pro tuto chybu ujal až v
pozdější metodologické literatuře. Problém úzce souvisí se
[Simpsonovým paradoxem](@/kompendium/argumentacni-fauly/statisticke/simpsonuv-paradox.md),
protože i ten popisuje, jak se vztah mezi proměnnými mění, když se data slučují nebo
rozdělují podle třetí proměnné (Simpson 1951).

## Struktura argumentu

Argument vychází z premisy o celcích: mezi jednotkami, ve kterých je [vyšší hodnota](@/kompendium/nlp-vzorce/sleight-of-mouth/som-hierarchie-kriterii.md) znaku A,
je také vyšší hodnota znaku B. Z ní se vyvozuje závěr o jednotlivcích: lidé se znakem A mají
spíše i znak B. Mezi premisou a závěrem chybí mezikrok, který by z dat o celcích nikdy
nevyplynul, totiž předpoklad, že vztah uvnitř každé jednotky je stejný jako vztah mezi
jednotkami. Ten předpoklad může selhat z několika důvodů. Lidé se do jednotek nerozmísťují
náhodně, takže složení jednotky může souviset s jejími dalšími vlastnostmi. Znak B může
záviset na prostředí jednotky, a ne na znaku A jednotlivce. A konečně tentýž souhrnný vztah
může vzniknout z mnoha různých individuálních vztahů, mezi nimiž data o celcích nerozliší
(Robinson 1950). Logicky jde o obdobu klamu dělení, kde se vlastnost, která náleží souboru
jako celku, připisuje každému jeho prvku (Copi, Cohen a McMahon 2014). Opačná chyba, kdy se z
údajů o jednotlivcích bez dalšího vyvozují závěry o celcích, se v metodologii označuje jako
klam atomistický nebo individualistický a je stejně vážná.

## Detekční znaky

Prvním znakem je zdroj dat. Pokud se výrok o lidech opírá o mapu, tabulku krajů, žebříček
škol nebo srovnání států, a nikoli o údaje o jednotlivých osobách, je přenos na jednotlivce
podezřelý. Druhým znakem je jazykový posun: v jedné větě se mluví o „okresech s vyšším
podílem“, v další už o „lidech, kteří“. Třetím znakem je použití skupinové statistiky na
konkrétního člověka, například v posudku, v personálním rozhodnutí nebo ve veřejné debatě o
určité menšině. Zde se ekologický klam setkává se stereotypizací, protože jednotlivec se
posuzuje podle podobnosti s obrazem skupiny, a nikoli podle informací o něm samém (Tversky a
Kahneman 1974). Čtvrtým znakem je chybějící zmínka o tom, jak se lidé do jednotek dostali a
zda jejich rozmístění nesouvisí se sledovaným jevem. Pátým znakem je nápadně silná korelace:
souhrnné údaje průměrují individuální rozdíly, a proto bývají korelace mezi celky často
silnější než korelace mezi lidmi, na které se pak přenášejí (Robinson 1950).

## Odlišení od platné argumentace

Analýza dat o celcích sama o sobě klamem není. Pro mnoho otázek je skupinová úroveň tou
správnou: veřejné zdravotnictví se ptá, ve kterých oblastech je třeba posílit péči, a
politika se rozhoduje o regionech, školách nebo nemocnicích jako o celcích. Platný argument
drží závěr na úrovni, na které byla data sebrána. Výrok, že obce s nižším průměrným příjmem
mají vyšší nemocnost, je výrokem o obcích a jako takový může být pravdivý a užitečný.
Klamem se stává až výrok, že chudší lidé v těchto obcích jsou nemocnější, pokud se o ně
neopírají data o jednotlivcích. Metodologie dnes nabízí postupy, jak úrovně propojit, od
víceúrovňových modelů po metody ekologické inference, které výslovně pracují s nejistotou
přenosu. Platnou argumentací je také hypotéza: souvislost mezi celky smí vést k otázce po
individuálním mechanismu, pokud se ta otázka ověří na datech o lidech. Logická literatura
připomíná, že vlastnosti celku a vlastnosti části jsou rozdílné predikáty a jejich ztotožnění
vyžaduje samostatné zdůvodnění (Copi, Cohen a McMahon 2014). Z téhož důvodu je pro
kompendium podstatné rozlišovat
[populační rovinu](@/kompendium/07-populacni/_index.md) epistemických jevů od jejich
projevů u jednotlivých lidí.

## Stav poznání

Robinsonův rozbor patří mezi nejcitovanější metodologické texty sociálních věd a jeho hlavní
závěr, že ekologickou korelaci nelze bez dalšího považovat za korelaci individuální, je
obecně přijímán (Robinson 1950). Pozdější práce ukázaly, že nejde o ojedinělou anomálii, ale
o obecnou vlastnost agregovaných dat, která souvisí s matematikou sdružování a rozvrstvení
tabulek (Simpson 1951). Debata se od té doby posunula od pouhého zákazu k otázce, za jakých
podmínek a s jakou nejistotou lze o jednotlivcích z dat o celcích něco usuzovat. Ve výzkumu
zdraví a společnosti se zároveň zdůrazňuje, že některé příčiny působí právě na úrovni
prostředí, takže ani individuální data nemusí zachytit celý obraz a obě úrovně je třeba
zkoumat společně. Výzkum úsudku ukazuje, proč je klam intuitivně přitažlivý: lidé snadno
posuzují jednotlivce podle toho, jak se podobá obrazu skupiny, a přehlížejí rozptyl uvnitř
ní (Tversky a Kahneman 1974). Problémem zůstává veřejná komunikace dat, kde mapy a žebříčky
podporují přenos závěrů na jednotlivce častěji, než data dovolují.

## Vztah k technikám kompendia

V kontextu epistemické manipulace se ekologický klam objevuje hlavně tam, kde se skupinová
data používají k zacílení podezření na jednotlivce. Statistika o kraji, čtvrti, profesi nebo
národnosti se v takovém užití nestává popisem celku, ale argumentem proti konkrétnímu
člověku, který k celku patří. Mechanismus je o to účinnější, že výchozí číslo bývá pravdivé
a zpochybnit lze jen přenos závěru, což vyžaduje metodologickou úvahu, na kterou v rychlé
debatě nebývá prostor. Druhé typické užití je obrácené: ze skutečnosti, že konkrétní člověk
neodpovídá skupinovému průměru, se vyvozuje, že skupinová data jsou falešná. Oba posuny
směšují úrovně, které Robinson pečlivě odlišil (Robinson 1950). Pro posouzení je proto
užitečné pojmenovat, o kom výrok skutečně mluví, a sledovat, zda se během argumentu tento
předmět nemění.

## Obrana a odpověď

Základní obranou je zeptat se, na jaké úrovni byla data sebrána, a trvat na tom, aby závěr
zůstal na téže úrovni. Pokud někdo z mapy okresů vyvozuje, jak se chovají lidé určitého
typu, je věcnou odpovědí upozornit, že stejný obraz mezi okresy může vzniknout i tehdy, když
se tito lidé chovají jinak, než naznačuje souhrn, a požádat o data o jednotlivcích (Robinson
1950). Druhou obranou je hledat mechanismus rozmístění: proč jsou lidé se znakem A soustředěni
právě v těchto jednotkách a nesouvisí to se znakem B jinou cestou? Třetí obranou je
symetrie, tedy stejná opatrnost v obou směrech, protože ani průměr jednotlivců nemusí
vypovídat o fungování celku. Pro rozhodování o konkrétním člověku platí, že skupinová
statistika může sloužit nanejvýš jako výchozí informace, kterou je třeba doplnit údaji o něm
samém, a nikdy jako náhrada posouzení (Tversky a Kahneman 1974). V oblasti
[populačního zdraví](@/kompendium/population-health/_index.md) je navíc důležité oddělovat
závěry o tom, kam směřovat preventivní opatření, od závěrů o tom, kdo je jednotlivě ohrožen.
Příbuzný [klam dělení](@/kompendium/argumentacni-fauly/jazykove-klamy/klam-deleni.md)
ukazuje stejnou chybu na rovině jazyka a pojmů (Copi, Cohen a McMahon 2014).

## Literatura

- Copi, I. M., Cohen, C., & McMahon, K. (2014). *Introduction to Logic* (14. vyd.). Harlow: Pearson.
- Hamblin, C. L. (1970). *Fallacies*. London: Methuen.
- Robinson, W. S. (1950). Ecological correlations and the behavior of individuals. *American Sociological Review*, 15(3), 351–357.
- Simpson, E. H. (1951). The interpretation of interaction in contingency tables. *Journal of the Royal Statistical Society, Series B*, 13(2), 238–241.
- Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*, 185(4157), 1124–1131.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel

**Příbuzná hesla**

- [Příliš široké zobecnění](@/kompendium/argumentacni-fauly/predpoklady-argumentu/prilis-siroke-zobecneni.md) – příbuzné heslo (Klamy předpokladu, Sweeping generalisation)
- [Záměna korelace a kauzality](@/kompendium/argumentacni-fauly/kauzalni/korelace-a-kauzalita.md) – příbuzné heslo (Kauzální klamy, Cum hoc ergo propter hoc)
- [Přehlížená společná příčina](@/kompendium/argumentacni-fauly/kauzalni/prehlizena-spolecna-pricina.md) – příbuzné heslo (Kauzální klamy, Ignoring a common cause)
- [Zkreslený výběr](@/kompendium/argumentacni-fauly/statisticke/zkresleny-vyber.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Sampling bias)
- [Simpsonův paradox](@/kompendium/argumentacni-fauly/statisticke/simpsonuv-paradox.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Simpson's paradox)
- [Klam skládání](@/kompendium/argumentacni-fauly/jazykove-klamy/klam-skladani.md) – příbuzné heslo (Klamy jazyka a dvojznačnosti, Fallacy of composition)
- [Klam dělení](@/kompendium/argumentacni-fauly/jazykove-klamy/klam-deleni.md) – příbuzné heslo (Klamy jazyka a dvojznačnosti, Fallacy of division)

**V kompendiu**

- [Populační zdraví a prevence](@/kompendium/population-health/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Populační rovina](@/kompendium/07-populacni/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [2.4 Metodologické poznámky k taxonomii](@/kompendium/02-uvod/metodologicke-poznamky.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Klam obhájce](@/kompendium/argumentacni-fauly/statisticke/klam-obhajce.md) – předchozí heslo rodiny
- [Simpsonův paradox](@/kompendium/argumentacni-fauly/statisticke/simpsonuv-paradox.md) – další heslo rodiny

<!-- kompendium:katalog-vazby:end -->
