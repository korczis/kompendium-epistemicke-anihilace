+++
title = "Zkreslení přežitím"
description = "Závěr vyvozený jen z případů, které prošly sítem úspěchu nebo trvání, zatímco neúspěšné zmizely z dohledu: struktura klamu, znaky, odlišení a obrana."
weight = 5
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-statisticke", "fauly-neformalni-klam", "fauly-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "high"
lang = "cs"
keywords = ["Zkreslení přežitím", "Survivorship bias", "klam přeživších", "chyba přeživšího", "Statistické a pravděpodobnostní klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-05.05"
catalog_slug = "zkresleni-preziti"
catalog_family = "statisticke"
catalog_family_code = "05"
catalog_family_title = "Statistické a pravděpodobnostní klamy"
catalog_family_en = "Statistical and probabilistic fallacies"
catalog_part = "statisticke"
catalog_type = "informal"
catalog_type_cs = "neformální klam"
catalog_en = "Survivorship bias"
catalog_aliases = ["klam přeživších", "chyba přeživšího"]
catalog_use = "dvoji"
catalog_use_cs = "chyba i taktika"
catalog_risk = "vysoke"
catalog_risk_cs = "vysoké"
catalog_broader = "zkresleny-vyber"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["zkresleny-vyber"]
catalog_related = ["ukvapene-zobecneni", "vyber-tresnicek", "zamlceni-dukazu", "zkresleny-vyber", "odvolani-na-anekdotu", "velke-seminare"]
catalog_related_declared = ["zkresleny-vyber", "vyber-tresnicek", "zamlceni-dukazu", "odvolani-na-anekdotu", "ukvapene-zobecneni", "velke-seminare"]
catalog_kompendium = ["kompendium/02-uvod/metodologicke-poznamky.md", "kompendium/03-zakladni-kategorie/biasy/_index.md", "kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/argumentacni-fauly/statisticke/zkresleny-vyber.md", "kompendium/nlp-vzorce/vliv-a-zneuziti/velke-seminare.md"]
catalog_prev = "horka-ruka"
catalog_next = "zkresleny-vyber"
catalog_position = 5
catalog_family_size = 16
catalog_sources = ["damer-2009", "gilovich-1991", "huff-1954", "kahneman-2011"]
catalog_sources_primary = ["damer-2009"]
catalog_sources_roots = []
catalog_sources_critical = ["gilovich-1991", "huff-1954", "kahneman-2011"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Obrana a odpověď"]
catalog_trainer_items = 3
catalog_trainer_benign = 1
catalog_review = "agent"
catalog_data = "data/fauly/statisticke.toml"
+++

# Zkreslení přežitím

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-05.05` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) |
| **Druh** | neformální klam |
| **Anglicky** | Survivorship bias |
| **Jiné názvy** | klam přeživších, chyba přeživšího |
| **Obecnější heslo** | [Zkreslený výběr](@/kompendium/argumentacni-fauly/statisticke/zkresleny-vyber.md) |
| **Užití** | chyba i taktika |
| **Riziko zneužití** | vysoké |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Zkreslení přežitím je chyba úsudku, při níž člověk vyvozuje obecný závěr ze souboru, který
obsahuje jen případy, jež prošly nějakým sítem, a přehlíží případy, které sítem neprošly a
proto nejsou vidět. Síto může být úspěch, trvání, viditelnost nebo ochota odpovídat. Kdo
zkoumá jen firmy, které přežily, jen absolventy, kteří uspěli, jen stavby, které stojí sto
let, nebo jen pacienty, kteří se vrátili na kontrolu, vidí soubor, jehož složení bylo
předem určeno výsledkem. Z takového souboru pak vyvozuje příčiny výsledku. Klam je zvláštní
podobou [zkresleného výběru](@/kompendium/argumentacni-fauly/statisticke/zkresleny-vyber.md):
vzorek není reprezentativní proto, že ho vytvořil proces, o jehož účinku se usuzuje.
Gilovich ukazuje, že lidé jen výjimečně myslí na data, která chybějí, a že úsudek z
neúplných dat je jedním z hlavních zdrojů mylných přesvědčení v běžném životě (Gilovich
1991).

Klam je chybou i taktikou. Spontánně vzniká proto, že neúspěšné případy jsou neviditelné.
Záměrně se uplatňuje v marketingu, v náboru do skupin a v prodeji kurzů, kde se předvádějí
ti, kterým se dařilo, a ostatní se nezmiňují.

## Původ a souvislosti

Nejčastěji vyprávěným příkladem je práce statistika Abrahama Walda za druhé světové války,
který se zabýval tím, jak posílit pancéřování bombardérů podle poškození, které vykazovala
letadla vracející se z misí. Podstatou jeho úvahy bylo, že soubor vrácených letadel
neobsahuje ta, která byla zasažena na nejzranitelnějších místech, protože se nevrátila.
Místa bez zásahů na vrácených letadlech proto mohou být právě ta, kde zásah znamenal
ztrátu. Populární podání příběh zjednodušuje a Waldova skutečná práce byla matematicky
složitější, ale jádro úvahy je přesné: chybějící data jsou součástí dat.

V literatuře o zavádějící statistice popisuje Huff obecnější problém vzorku se zabudovaným
zkreslením. Jedním z jeho příkladů je průzkum příjmů absolventů jedné univerzity, který
pracoval jen s odpověďmi těch, kdo se ozvali; ozvali se především ti, kterým se dařilo a
kteří byli k nalezení, takže průměr vypovídal víc o tom, kdo odpověděl, než o absolventech
(Huff 1954). Kahneman rozebírá podobnou chybu v hodnocení firem: knihy, které hledají
společné rysy úspěšných podniků, vybírají podniky podle výsledku a pak výsledek vysvětlují
jejich rysy, aniž by ověřily, kolik podniků se stejnými rysy neuspělo. Pozdější výsledky
vybraných firem se navíc často vrací k průměru, což ukazuje, jak velký podíl na původním
úspěchu mělo štěstí (Kahneman 2011).

## Struktura argumentu

Argument má tuto stavbu. První premisa popisuje soubor případů, které mají výsledek V:
úspěšné podnikatele, dlouho stojící stavby, vyléčené pacienty. Druhá premisa uvádí, že
tyto případy mají společný rys R: absolvovali určitý kurz, byly postaveny starou technikou,
užívali určitý přípravek. Závěr tvrdí, že R vede k V. Chybí v něm údaj, jak časté je R u
případů, které V nemají, a kolik případů s R skončilo bez V. Protože soubor byl vybrán
podle V, nelze z něj rozhodnout, zda R s V souvisí. Kdyby všichni úspěšní podnikatelé
nosili brýle, nevyplývalo by z toho nic, dokud nevíme, kolik neúspěšných podnikatelů nosí
brýle také.

Zvláštní podobou je argument z trvání: „vydrželo to staletí, tedy je to dobré“. Staré
stavby, tradiční postupy nebo dlouho fungující instituce jsou výběrem těch, které
přežily; ty, které selhaly, zmizely a nejsou k vidění. Trvání proto samo o sobě nedokládá
kvalitu, i když s ní může souviset. Učebnice neformální logiky řadí obdobné úvahy mezi
argumenty z nereprezentativních dat, protože závěr o celku se opírá o část, která byla
vybrána způsobem souvisejícím se závěrem (Damer 2009).

## Detekční znaky

Prvním znakem je soubor vybraný podle výsledku: příběhy úspěchu, svědectví spokojených
klientů, galerie absolventů, seznam firem, které „to dokázaly“. Druhým znakem je chybějící
jmenovatel. Mluvčí uvádí, kolik lidí uspělo, ale ne kolik to zkoušelo; kolik pacientů se
uzdravilo, ale ne kolik jich léčbu přerušilo. Třetím znakem je otázka, kterou nelze
zodpovědět, protože data neexistují: kde jsou ti, kdo neuspěli? Pokud na ni mluvčí
odpovídá, že „to nedělali správně“, přesouvá neúspěšné případy mimo soubor a činí tvrzení
nevyvratitelným. Čtvrtým znakem je argument z dlouhověkosti, v němž trvání nahrazuje
srovnání. Pátým znakem je prostředí, kde neúspěch odchází tiše: firmy zanikají, studenti
odcházejí, členové skupin mizí a nikdo je nepočítá.

V oblasti, které se kompendium věnuje, je klam typickým prvkem náboru do uzavřených skupin
a do nákladných programů osobního rozvoje. Předvádění vybraných úspěšných členů na
[velkých seminářích](@/kompendium/nlp-vzorce/vliv-a-zneuziti/velke-seminare.md) a zamlčování
těch, kteří odešli zklamaní nebo zadlužení, vytváří obraz, který neodpovídá skutečné
úspěšnosti. Gilovich upozorňuje, že druhotné informace, které se k nám dostávají přes
vyprávění, jsou cestou zjednodušovány a zveličovány, takže k nám dorazí hlavně nápadné případy (Gilovich
1991).

## Odlišení od platné argumentace

Ne každý závěr ze souboru úspěšných případů je klamem. Studium přeživších je legitimní,
pokud se ptá na to, co přeživší mají, a ne na to, proč přežili, nebo pokud se doplní
srovnáním s neúspěšnými případy. Lékař, který popisuje průběh nemoci u pacientů, kteří
přežili, a výslovně uvádí, že o zemřelých tento popis nic neříká, neuvažuje chybně.
Ekonom, který do souboru zahrne i zaniklé firmy, se klamu vyhnul. Platná je také úvaha,
podle níž dlouhé trvání zvyšuje pravděpodobnost kvality, pokud je známo, jaké síto na
případy působilo a že souvisí právě s kvalitou; tradiční postup, který přežil srovnání s
alternativami, má jiný doklad než postup, který přežil jen proto, že ho nikdo nezkoumal.
Klamem se úvaha stává, když soubor vybraný podle výsledku slouží jako doklad příčiny
výsledku (Kahneman 2011).

## Stav poznání

Zkreslení přežitím je dobře popsaný metodologický problém, který statistika a
epidemiologie řeší pod obecnějšími hlavičkami výběrového zkreslení a ztrát v průběhu
sledování. Psychologický výzkum ukazuje, proč je pro lidi tak obtížné ho vidět: úsudek
pracuje s tím, co je k dispozici, a chybějící případy nevyvolávají žádný signál, že
chybějí (Gilovich 1991). Kahneman tento rys shrnuje jako sklon zacházet s tím, co vidíme,
jako by to byla celá skutečnost, a uvádí ho jako jednu z příčin nadměrné sebedůvěry v
úsudcích o úspěchu a jeho příčinách (Kahneman 2011). Literatura o zavádějící statistice
dokládá, že vzorky se zabudovaným zkreslením se v médiích a reklamě objevují běžně a že
jejich výsledky se prezentují, jako by šlo o reprezentativní údaje (Huff 1954). Pro
oblast vědy je klam příbuzný problému nepublikovaných výsledků: pokud se publikují
převážně studie, které nalezly účinek, je soubor publikovaných studií výběrem
„přeživších“ a přeceňuje skutečný účinek.

## Obrana a odpověď

Základní obranou je hledat chybějící případy. Na příběh úspěchu je užitečné odpovědět
otázkou, kolik lidí nebo firem začínalo, kolik z nich skončilo a jak se jim vedlo. Druhou
obranou je srovnání: mají rys, který se úspěchu připisuje, i ti, kdo neuspěli? Bez této
informace nelze rozhodnout, zda rys s úspěchem vůbec souvisí. Třetí obranou je otázka po
sítu: jakým procesem se případy dostaly do souboru, který vidíme, a mohl tento proces
souviset s výsledkem? Kdo zná síto, zná i směr zkreslení (Huff 1954).

U prodeje kurzů, terapií a programů je obranou požadavek na úplná data: kolik účastníků
program dokončilo, kolik ho přerušilo a jaké byly výsledky u obou skupin. Organizace, které
taková data nemají nebo je odmítají poskytnout, opírají svou nabídku o vybrané případy.
Kahneman doporučuje u každého poučení z úspěchu zvážit, kolik z něj mohlo být štěstím, a
zda by se stejné rysy nenašly i u těch, kdo neuspěli (Kahneman 2011). V klinické a
poradenské praxi je klam důležitý i pro samotné odborníky: pacienti, kteří se nevracejí,
mohou být ti, kterým léčba nepomohla, a zkušenost terapeuta se tak může posouvat k
příznivějšímu obrazu, než jaký odpovídá skutečnosti. Pravidelné sledování všech
případů, nejen těch, kteří se ozvou, je proto nejlepší ochranou i pro odborníka.

## Literatura

- Damer, T. E. (2009). *Attacking Faulty Reasoning: A Practical Guide to Fallacy-Free Arguments* (6. vyd.). Belmont: Wadsworth.
- Gilovich, T. (1991). *How We Know What Isn't So: The Fallibility of Human Reason in Everyday Life*. New York: Free Press.
- Huff, D. (1954). *How to Lie with Statistics*. New York: W. W. Norton.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Zkreslený výběr](@/kompendium/argumentacni-fauly/statisticke/zkresleny-vyber.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Ukvapené zobecnění](@/kompendium/argumentacni-fauly/predpoklady-argumentu/ukvapene-zobecneni.md) – příbuzné heslo (Klamy předpokladu, Hasty generalisation)
- [Výběr třešniček](@/kompendium/argumentacni-fauly/predpoklady-argumentu/vyber-tresnicek.md) – příbuzné heslo (Klamy předpokladu, Cherry picking)
- [Zamlčení důkazů](@/kompendium/argumentacni-fauly/predpoklady-argumentu/zamlceni-dukazu.md) – příbuzné heslo (Klamy předpokladu, Suppressed evidence)
- [Zkreslený výběr](@/kompendium/argumentacni-fauly/statisticke/zkresleny-vyber.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Sampling bias)
- [Odvolání na anekdotu](@/kompendium/argumentacni-fauly/hodnoty-a-veda/odvolani-na-anekdotu.md) – příbuzné heslo (Klamy hodnot, přírody a vědy, Anecdotal fallacy)
- [Velké motivační semináře](@/kompendium/nlp-vzorce/vliv-a-zneuziti/velke-seminare.md) – příbuzné heslo (NLP vzorce: Vliv a zneužití NLP, Large-group seminars)

**V kompendiu**

- [2.4 Metodologické poznámky k taxonomii](@/kompendium/02-uvod/metodologicke-poznamky.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Kognitivní biasy](@/kompendium/03-zakladni-kategorie/biasy/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-2.1.9 Vytváření pseudokonsenzu](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Horká ruka](@/kompendium/argumentacni-fauly/statisticke/horka-ruka.md) – předchozí heslo rodiny
- [Zkreslený výběr](@/kompendium/argumentacni-fauly/statisticke/zkresleny-vyber.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
