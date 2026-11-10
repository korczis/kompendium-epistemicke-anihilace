+++
title = "Horká ruka"
description = "Víra, že krátká série úspěchů dokládá stav, který bude pokračovat: klasický výzkum, jeho pozdější revize, znaky klamu a jak oddělit dojem ze série od dat."
weight = 4
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-statisticke", "fauly-neformalni-klam", "fauly-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Horká ruka", "Hot-hand fallacy", "klam horké ruky", "víra v sérii", "Statistické a pravděpodobnostní klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-05.04"
catalog_slug = "horka-ruka"
catalog_family = "statisticke"
catalog_family_code = "05"
catalog_family_title = "Statistické a pravděpodobnostní klamy"
catalog_family_en = "Statistical and probabilistic fallacies"
catalog_part = "statisticke"
catalog_type = "informal"
catalog_type_cs = "neformální klam"
catalog_en = "Hot-hand fallacy"
catalog_aliases = ["klam horké ruky", "víra v sérii"]
catalog_use = "dvoji"
catalog_use_cs = "chyba i taktika"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = ""
catalog_narrower = []
catalog_depth = 0
catalog_ancestors = []
catalog_related = ["texasky-strelec", "klam-regrese", "magicke-mysleni", "hracsky-klam", "zakon-malych-cisel"]
catalog_related_declared = ["hracsky-klam", "zakon-malych-cisel", "texasky-strelec", "klam-regrese", "magicke-mysleni"]
catalog_kompendium = ["kompendium/techniques/ea-7-3-2-tversky-heuristics.md", "kompendium/03-zakladni-kategorie/biasy/_index.md", "kompendium/07-teoreticke-reflexe/kognitivni-vedy.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/argumentacni-fauly/statisticke/hracsky-klam.md", "kompendium/argumentacni-fauly/statisticke/zakon-malych-cisel.md"]
catalog_prev = "hracsky-klam"
catalog_next = "zkresleni-preziti"
catalog_position = 4
catalog_family_size = 16
catalog_sources = ["gilovich-1991", "gilovich-vallone-tversky-1985", "kahneman-2011", "nickerson-1998", "tversky-kahneman-1971"]
catalog_sources_primary = []
catalog_sources_roots = []
catalog_sources_critical = ["gilovich-1991", "gilovich-vallone-tversky-1985", "kahneman-2011", "nickerson-1998", "tversky-kahneman-1971"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Obrana a odpověď"]
catalog_trainer_items = 3
catalog_trainer_benign = 1
catalog_review = "agent"
catalog_data = "data/fauly/statisticke.toml"
+++

# Horká ruka

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-05.04` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) |
| **Druh** | neformální klam |
| **Anglicky** | Hot-hand fallacy |
| **Jiné názvy** | klam horké ruky, víra v sérii |
| **Užití** | chyba i taktika |
| **Riziko zneužití** | střední |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Klam horké ruky je úsudek, podle něhož krátká série úspěchů nebo neúspěchů dokládá
přechodný stav, který zvyšuje pravděpodobnost dalšího výsledku stejného druhu. Sportovec,
který dal několik košů po sobě, „má ruku“; investor, kterému vyšly tři obchody, „má
čuch“; vyšetřovatel, který uzavřel několik případů, „má formu“. Klam nespočívá v tvrzení,
že výkon lidí kolísá, ale v tom, že se dojem ze série bere jako dostatečný doklad takového
kolísání, aniž by se porovnal s tím, jak často by podobné série vznikaly, kdyby výsledky na
sobě nezávisely. Gilovich, Vallone a Tversky popsali tento jev jako chybné vnímání
náhodných posloupností a ukázali, že pozorovatelé vidí série jako důkaz závislosti i tam,
kde data žádnou závislost neukazují (Gilovich, Vallone a Tversky 1985).

Heslo je v katalogu zvláštní tím, že jeho empirický základ prošel revizí. Pro defenzivní
účely na tom nic podstatného nemění: rozhodující je rozdíl mezi dojmem ze série a změřenou
závislostí, a ten zůstává.

## Původ a souvislosti

Klasická studie analyzovala záznamy střelby profesionálního basketbalového týmu, trestné
hody jiného týmu a kontrolovaný pokus se střelci univerzitního týmu. Autoři zároveň zjistili,
že fanoušci i hráči věří, že po zásahu je další zásah pravděpodobnější. V datech však
pravděpodobnost zásahu po sérii zásahů nebyla vyšší, než by odpovídalo nezávislým pokusům
(Gilovich, Vallone a Tversky 1985). Studie se stala jedním z nejcitovanějších dokladů toho,
že intuitivní úsudek o náhodnosti je zkreslený. Gilovich ji později zařadil do širšího
výkladu o tom, jak lidé nacházejí pravidelnost v náhodných datech a jak tato iluze
přetrvává, protože si každý pamatuje nápadné série a nevšímá si jejich běžnosti (Gilovich
1991).

Teoretickým rámcem je víra v [zákon malých čísel](@/kompendium/argumentacni-fauly/statisticke/zakon-malych-cisel.md),
podle níž má i krátký úsek náhodné řady vypadat jako celý proces (Tversky a Kahneman
1971). Náhodné řady přitom obsahují delší série, než intuice očekává. Kdo takovou sérii
vidí, nevysvětluje si ji náhodou, ale příčinou: formou, sebedůvěrou, štěstím. Víra v horkou
ruku je tak zrcadlovou podobou [hráčského klamu](@/kompendium/argumentacni-fauly/statisticke/hracsky-klam.md):
jedna očekává, že se série obrátí, druhá, že bude pokračovat. Kahneman upozorňuje, že obě
víry vycházejí z téhož sklonu intuitivního myšlení hledat v datech příčinný příběh
(Kahneman 2011).

V posledním desetiletí ekonomové Joshua Miller a Adam Sanjurjo ukázali, že metoda, kterou
klasická studie porovnávala úspěšnost po sérii zásahů a po sérii minutí, obsahuje jemné
statistické zkreslení: v konečných řadách vychází podíl zásahů po sérii zásahů v průměru
nižší, než by laik čekal, i když jsou pokusy nezávislé. Po opravě tohoto zkreslení
ukázala část původních dat měřitelný efekt horké ruky. Debata o velikosti efektu
v různých sportech a činnostech pokračuje.

## Struktura argumentu

Klamavý argument má tuto stavbu. První premisa uvádí, že osoba nebo systém dosáhli v
posledních pokusech řady úspěchů. Druhá, nevyslovená premisa tvrdí, že taková řada by při
nezávislých pokusech byla nepravděpodobná. Závěr tvrdí, že osoba je ve stavu, který
zvyšuje pravděpodobnost dalšího úspěchu, a že na tomto základě je rozumné rozhodnout:
přihrát jí míč, svěřit jí případ, investovat do fondu. Vadná bývá druhá premisa. Série
určité délky jsou v delších řadách náhodných pokusů běžné, takže jejich výskyt sám o sobě
nic nedokládá. Doklad by vyžadoval srovnání: jak často se taková série objevuje u téže
osoby, u jiných osob a v řadě, o které víme, že je náhodná.

Argument má i druhou slabinu, která je důležitá i po revizi klasické studie. I když efekt
existuje, bývá malý, a rozhodnutí se v klamu opírá o představu velkého efektu. Pozorovatel
přeceňuje, o kolik série mění pravděpodobnost dalšího výsledku, protože sérii vnímá živě,
kdežto základní úspěšnost osoby zůstává v pozadí. Klasická studie ukázala právě tento
nepoměr: pozorovatelé odhadovali vliv předchozího zásahu na další zásah jako výrazný, kdežto
data takový vliv neukazovala (Gilovich, Vallone a Tversky 1985). Pro analýzu argumentu z
toho plyne, že nestačí ptát se, zda závislost existuje; je třeba se ptát i na to, zda je
dost velká, aby unesla rozhodnutí, které se na ní staví.

## Detekční znaky

Prvním znakem je jazyk stavu: „má formu“, „je v ráži“, „má šťastnou ruku“, „teď mu to jde“.
Druhým znakem je krátká řada jako jediný doklad: tři roky výnosů, čtyři vyhrané spory,
pět úspěšných předpovědí. Třetím znakem je chybějící srovnání s tím, kolik podobných
sérií vzniklo u ostatních a jak se jim vedlo potom; u investičních fondů například bývá
série jednoho fondu prezentována bez údaje, kolik fondů mělo podobnou sérii a kolik z nich
v ní nepokračovalo. Čtvrtým znakem je pozdější reinterpretace: když série skončí, vysvětlí
se to „ztrátou formy“, ne náhodou, takže přesvědčení zůstává nevyvratitelné. Takové
selektivní zapamatování a výklad dat podle očekávání odpovídá tomu, co výzkum popisuje
jako konfirmační zkreslení (Nickerson 1998). Pátým znakem je vlivové užití: prodejce
finančních produktů, kouč nebo guru předkládá vlastní nedávné úspěchy jako doklad
mimořádné schopnosti a vyzývá k rychlému rozhodnutí, „dokud to funguje“.

## Odlišení od platné argumentace

Výkon lidí skutečně kolísá: únava, zranění, zkušenost a motivace ovlivňují úspěšnost a
některé činnosti, například střelba z místa bez obránce, mohou vykazovat měřitelnou
závislost mezi po sobě jdoucími pokusy. Tvrzení o horké ruce je proto legitimní, pokud se
opírá o data z dost dlouhé řady, uvádí velikost efektu a srovnává ji s tím, co by vznikalo
náhodou. Platné je i rozhodnutí opřené o delší záznam schopností, nikoli o sérii: kdo
svěří složitý případ zkušenému vyšetřovateli kvůli jeho dlouhodobým výsledkům, nechybuje.
Klamem se úvaha stává, když série nahrazuje záznam a když se z ní vyvozuje víc, než data
unesou (Gilovich 1991). Revize klasické studie tak neruší obranné poučení, spíš ho
zpřesňuje: otázka nezní, zda horká ruka existuje, ale zda je v konkrétním případě
doložena a jak je velká.

## Stav poznání

Klasická studie ukázala silnou a rozšířenou víru v horkou ruku a absenci podpory v datech,
která autoři měli k dispozici (Gilovich, Vallone a Tversky 1985). Výzkum vnímání
náhodnosti tuto víru vysvětlil jako důsledek očekávání, že náhodné řady mají málo sérií
(Tversky a Kahneman 1971; Gilovich 1991). Pozdější statistická revize ukázala, že původní
metoda efekt podhodnocovala, a otevřela otázku jeho skutečné velikosti. Současný stav lze
shrnout tak, že víra v horkou ruku je mezi pozorovateli silnější, než by odpovídalo
efektům, které se v datech daří změřit, a že tato nadsázka je skutečným jádrem klamu.
Kahneman upozorňuje, že podobné iluze přetrvávají i u profesionálů, kteří jsou s
příslušnými daty v kontaktu každý den, protože intuice se učí z nápadných případů, ne z
četností (Kahneman 2011).

## Obrana a odpověď

Základní obranou je oddělit sérii od záznamu. Na argument „má teď formu“ je užitečné
odpovědět otázkou, jak úspěšná je osoba nebo systém v delší řadě a zda je současná série
neobvyklá ve srovnání s tím, co by vznikalo náhodou. Druhou obranou je srovnání s
populací: kolik fondů, týmů nebo jednotlivců mělo podobnou sérii a jak se jim vedlo
potom? Bez tohoto srovnání série nic nedokazuje. Třetí obranou je předem stanovit, co by
přesvědčení vyvrátilo; pokud konec série vždy vysvětlí „ztráta formy“, přesvědčení
nevyvrací nic (Nickerson 1998).

U vlivového užití je obranou zpomalení. Nabídka, která se opírá o nedávné úspěchy a
zdůrazňuje, že je třeba jednat hned, staví na tom, že dojem ze série je nejsilnější v
okamžiku, kdy série trvá. Odklad rozhodnutí a požadavek na delší, nezávisle ověřenou
historii výsledků tento tlak neutralizují. V institucích, které rozdělují úkoly, případy
nebo zdroje podle výkonu, pomáhá hodnotit výkon za delší období a s ohledem na obtížnost
úkolů, aby se krátkodobé série nepromítaly do rozhodnutí víc, než si zaslouží (Gilovich
1991).

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Literatura

- Gilovich, T. (1991). *How We Know What Isn't So: The Fallibility of Human Reason in Everyday Life*. New York: Free Press.
- Gilovich, T., Vallone, R., & Tversky, A. (1985). The hot hand in basketball: On the misperception of random sequences. *Cognitive Psychology*, 17(3), 295–314.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Nickerson, R. S. (1998). Confirmation bias: A ubiquitous phenomenon in many guises. *Review of General Psychology*, 2(2), 175–220.
- Tversky, A., & Kahneman, D. (1971). Belief in the law of small numbers. *Psychological Bulletin*, 76(2), 105–110.

## Související

**Rodina a hierarchie**

- [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel

**Příbuzná hesla**

- [Texaský střelec](@/kompendium/argumentacni-fauly/kauzalni/texasky-strelec.md) – příbuzné heslo (Kauzální klamy, Texas sharpshooter)
- [Klam regrese](@/kompendium/argumentacni-fauly/kauzalni/klam-regrese.md) – příbuzné heslo (Kauzální klamy, Regression fallacy)
- [Magické myšlení](@/kompendium/argumentacni-fauly/kauzalni/magicke-mysleni.md) – příbuzné heslo (Kauzální klamy, Magical thinking)
- [Hráčský klam](@/kompendium/argumentacni-fauly/statisticke/hracsky-klam.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Gambler's fallacy)
- [Zákon malých čísel](@/kompendium/argumentacni-fauly/statisticke/zakon-malych-cisel.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Law of small numbers)

**V kompendiu**

- [EA-7.3.2 Tversky a Kahneman: Heuristiky](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Kognitivní biasy](@/kompendium/03-zakladni-kategorie/biasy/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [7.5 Kognitivní vědy a EA — duální systém, predikční zpracování, embodied cognition](@/kompendium/07-teoreticke-reflexe/kognitivni-vedy.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Hráčský klam](@/kompendium/argumentacni-fauly/statisticke/hracsky-klam.md) – předchozí heslo rodiny
- [Zkreslení přežitím](@/kompendium/argumentacni-fauly/statisticke/zkresleni-preziti.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
