+++
title = "Potvrzení disjunktu"
description = "Formální klam, který z potvrzení jedné možnosti v disjunkci vyvozuje vyloučení druhé: proč „nebo“ obvykle nevylučuje a kde chyba vede k přehlédnutí příčiny."
weight = 9
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-formalni", "fauly-formalni-klam", "fauly-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Potvrzení disjunktu", "Affirming a disjunct", "klam alternativy", "chybný disjunktivní sylogismus", "Formální klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-01.09"
catalog_slug = "potvrzeni-disjunktu"
catalog_family = "formalni"
catalog_family_code = "01"
catalog_family_title = "Formální klamy"
catalog_family_en = "Formal fallacies"
catalog_part = "formalni.b"
catalog_type = "formal"
catalog_type_cs = "formální klam"
catalog_en = "Affirming a disjunct"
catalog_aliases = ["klam alternativy", "chybný disjunktivní sylogismus"]
catalog_use = "dvoji"
catalog_use_cs = "chyba i taktika"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "formalni-klam"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["formalni-klam"]
catalog_related = ["popreni-predchudce", "falesne-dilema", "jedina-pricina", "iluze-volby", "presupozice-nebo"]
catalog_related_declared = ["falesne-dilema", "presupozice-nebo", "iluze-volby", "jedina-pricina", "popreni-predchudce"]
catalog_kompendium = ["kompendium/techniques/ea-1-2-1-falesne-dilema.md", "kompendium/06-klinicke-aplikace/diferencialni-diagnostika.md", "kompendium/forensic-legal/_index.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/06-klinicke-aplikace/diferencialni-diagnostika.md", "kompendium/nlp-vzorce/presupozice/presupozice-nebo.md", "kompendium/techniques/ea-1-2-1-falesne-dilema.md"]
catalog_prev = "existencni-klam"
catalog_next = "vylucujici-premisy"
catalog_position = 9
catalog_family_size = 14
catalog_sources = ["copi-cohen-mcmahon-2014", "damer-2009", "grice-1975", "kahneman-2011", "kunda-1990", "levinson-1983", "nickerson-1998", "stark-2007", "walton-2008", "eemeren-grootendorst-1992"]
catalog_sources_primary = ["copi-cohen-mcmahon-2014", "damer-2009", "walton-2008", "eemeren-grootendorst-1992"]
catalog_sources_roots = ["grice-1975", "levinson-1983"]
catalog_sources_critical = ["kahneman-2011", "kunda-1990", "nickerson-1998", "stark-2007"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Obrana a odpověď"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_review = "agent"
catalog_data = "data/fauly/formalni.b.toml"
+++

# Potvrzení disjunktu

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-01.09` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Formální klamy](@/kompendium/argumentacni-fauly/formalni/_index.md) |
| **Druh** | formální klam |
| **Anglicky** | Affirming a disjunct |
| **Jiné názvy** | klam alternativy, chybný disjunktivní sylogismus |
| **Obecnější heslo** | [Formální klam](@/kompendium/argumentacni-fauly/formalni/formalni-klam.md) |
| **Užití** | chyba i taktika |
| **Riziko zneužití** | střední |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Potvrzení disjunktu je neplatný úsudek tvaru: platí A nebo B; platí A; tedy neplatí B.
Chyba spočívá v tom, že spojka „nebo“ se v premise vykládá jako výlučná, tedy jako „buď A,
nebo B, ale ne obojí“, přestože premisa obvykle tvrdí jen to, že platí aspoň jedna z obou
možností. Pokud mohou platit obě současně, potvrzení jedné o druhé nic neříká. Učebnice
logiky rozlišují slabý, zahrnující smysl disjunkce, který odpovídá logické spojce, a silný,
vylučující smysl, ve kterém je souběh obou možností vyloučen; platné úsudky z disjunkce se
opírají o slabý smysl a vylučující smysl musí být výslovně doložen (Copi, Cohen a McMahon
2014). Platným protějškem klamu je disjunktivní sylogismus: platí A nebo B; neplatí A; tedy
platí B. Ten nevyžaduje žádný předpoklad o výlučnosti.

Klam je zrádný tím, že jeho závěr často zní rozumně. Kdo zjistí jednu příčinu potíže, cítí,
že hledání skončilo. Úsudek „je to buď hardware, nebo software; hardware je vadný; software
je tedy v pořádku“ působí jako úspora času, ale ve skutečnosti uzavírá otázku, kterou nikdo
neprověřil. Rychlé intuitivní myšlení se spokojí s vysvětlením, které je po ruce, a neúplnost
podkladů nevnímá (Kahneman 2011).

## Původ a souvislosti

Rozbor disjunktivních úsudků patří k nejstarším částem logiky. Stoická logika, spojovaná
především s Chrýsippem, uváděla mezi takzvanými nedokazatelnými úsudky i tvar „buď první,
nebo druhé; první; tedy ne druhé“. V jejím rámci byl platný, protože stoikové chápali
disjunkci jako výlučnou: tvar, který je dnes klamem, byl tehdy správným úsudkem z jiné
premisy. Moderní výroková logika zvolila jako základní
zahrnující disjunkci, a tím rozdíl mezi oběma čteními zviditelnila (Copi, Cohen a McMahon
2014). V přirozeném jazyce zůstává rozdíl nejasný. Pragmatika vysvětluje, proč posluchač
často slyší „nebo“ jako výlučné: mluvčí, který by věděl, že platí obojí, by podle
kooperativního principu řekl silnější „a“, a proto se z užití slabšího „nebo“ usuzuje, že
obojí neplatí. Takový závěr je konverzační implikatura, nikoli logický důsledek, a lze ho
zrušit, aniž by mluvčí odporoval sám sobě (Grice 1975). Lingvistická pragmatika řadí „a“ a
„nebo“ do škály výrazů, mezi nimiž slabší člen implikuje popření silnějšího (Levinson 1983).

Potvrzení disjunktu tedy vzniká na styku logiky a pragmatiky. Implikatura „ne obojí“ je
v běžném rozhovoru užitečná zkratka, kterou posluchač vyvozuje z kooperativního principu a
kterou lze zrušit (Grice 1975; Levinson 1983). Klam nastává tehdy, když se tato zkratka použije jako
pevná premisa v úsudku, na jehož závěru něco záleží: v diagnóze, ve vyšetřování nebo v
rozhodnutí o odpovědnosti. Historie stoického tvaru ukazuje, že spor se nevede o logiku
samu, ale o to, které čtení spojky premisa skutečně tvrdí.

## Struktura argumentu

Argument má tři části. Disjunktivní premisa vymezuje prostor možností, často jen dvou.
Potvrzující premisa doloží jednu z nich. Závěr druhou možnost vyřadí. Formální protipříklad
je jednoduchý: je-li pravda A i B, jsou obě premisy pravdivé a závěr „neplatí B“ nepravdivý.
Úsudek se stává platným jen přidáním další premisy „A a B neplatí současně“. Teorie
argumentace by v takovém případě hovořila o nevyslovené premise, kterou je třeba
rekonstruovat a posoudit, zda ji mluvčí může obhájit (van Eemeren a Grootendorst 1992).

Klam se často spojuje s jinou vadou, s
[falešným dilematem](@/kompendium/techniques/ea-1-2-1-falesne-dilema.md). Falešné dilema
zužuje prostor možností na dvě, ačkoli jich je víc (Damer 2009); potvrzení disjunktu pak mezi dvěma
zbylými možnostmi předstírá výlučnost. Obě vady se mohou sčítat: nejprve se svět zúží na
„buď je to tvá chyba, nebo moje“, a pak se z doložení jedné chyby vyvodí nevina druhé
strany. Jazykově blízký je vzorec, který katalog NLP popisuje jako
[presupozici se spojkou „nebo“](@/kompendium/nlp-vzorce/presupozice/presupozice-nebo.md):
nabídka dvou možností předpokládá, že jedna z nich nastane, a odvádí pozornost od toho, zda
nemohou nastat obě nebo žádná.

## Detekční znaky

Charakteristickým znakem je slovo „takže“ nebo „tím pádem“ bezprostředně po potvrzení jedné
možnosti, bez dalšího šetření druhé. Druhým znakem je, že disjunkce je formulována jako
výběr mezi příčinami, které se v daném oboru běžně vyskytují společně: psychická a tělesná
příčina potíží, lidská a technická příčina nehody, úmysl a nedbalost. Třetím znakem je
asymetrie zájmu. Mluvčí, kterému prospívá vyloučení jedné možnosti, potvrdí druhou a dál se
neptá. Kdo hájí obsluhu zařízení, rád zjistí softwarovou chybu; kdo hájí dodavatele
softwaru, rád zjistí chybu obsluhy. Výzkum motivovaného uvažování popisuje, že lidé prověřují
přísněji závěry, které si nepřejí, než závěry vítané (Kunda 1990).

Zvláštní pozornost si zaslouží klinický kontext. U pacientů se známou psychiatrickou
diagnózou se tělesné obtíže někdy připisují této diagnóze a tělesná příčina se dál
nevyšetřuje. Logicky jde právě o potvrzení disjunktu: doložená psychická složka se bere
jako vyloučení tělesné. Kniha se vztahem mezi souběžnými diagnózami zabývá v kapitole o
[diferenciální diagnostice](@/kompendium/06-klinicke-aplikace/diferencialni-diagnostika.md).
Ve vztazích kontroly se týž tvar může užívat k přenesení viny: „buď za to můžeš ty, nebo já;
ty jsi přece začala“, a z toho, že druhá osoba něco udělala, se vyvozuje, že mluvčí nenese
žádnou odpovědnost. Stark popisuje donucující kontrolu jako soustavný vzorec, který
postupně omezuje svobodu a sebeurčení druhého, nikoli jako sled oddělených incidentů
(Stark 2007); opakované jednostranné přidělování viny do takového vzorce zapadá.

## Odlišení od platné argumentace

Úsudek je platný, pokud je výlučnost obou možností doložena. Může vyplývat z definice
(číslo je sudé, nebo liché), z pravidla (smlouva skončí výpovědí, nebo dohodou, a nikoli
oběma způsoby), nebo z fyzické nemožnosti souběhu (v jednom okamžiku na jednom ze dvou
vzdálených míst). V těchto případech je závěr o vyloučení druhé možnosti oprávněný a není
důvod v něm hledat chybu. Platný je také disjunktivní sylogismus, který postupuje opačně:
nevyvozuje nic z potvrzení, ale z vyloučení jedné možnosti; učebnice logiky ho uvádějí jako
platný tvar právě proto, že se opírá jen o zahrnující smysl disjunkce (Copi, Cohen a McMahon 2014).

Neformální teorie argumentace upozorňuje, že ne každý závěr „tedy spíš ne B“ je klamný.
Pokud jedna nalezená příčina plně vysvětluje pozorovaný stav, může být rozumné snížit
pravděpodobnost druhé příčiny, i když ji to nevylučuje. Takový úsudek je však
pravděpodobnostní a otevřený revizi, nikoli deduktivní (Walton 2008). Klam tedy nespočívá v
tom, že se odhad pravděpodobnosti změní, ale v tom, že se otázka uzavře, jako by byla
rozhodnuta logikou.

## Stav poznání

Výzkum lidského usuzování dokládá obecnější sklon, na němž potvrzení disjunktu stojí: lidé
po nalezení jednoho vysvětlení přestávají hledat další a s nalezeným vysvětlením zacházejí
jako s úplným. Nickerson v přehledu výzkumu konfirmačního zkreslení popisuje, že pozornost
se soustřeďuje na jednu oblíbenou hypotézu a alternativy se zvažují méně (Nickerson 1998).
Kahneman tentýž rys rychlého myšlení shrnuje tak, že úsudek se vytváří z informací, které
jsou po ruce, a jejich neúplnost se nevnímá (Kahneman 2011). Pragmatický výklad „nebo“ jako
výlučného je dobře podložen v lingvistice (Levinson 1983). Kniha však nezná empirické
studie, které by měřily, jak často se potvrzení disjunktu jako samostatný úsudek vyskytuje
v klinických nebo soudních rozhodnutích; souvislost s přehlédnutím souběžné příčiny je proto
interpretace, nikoli změřený údaj.

## Obrana a odpověď

Nejjednodušší odpovědí je otázka, zda mohou obě možnosti platit současně. Pokud ano,
potvrzení jedné nic nerozhoduje o druhé a je potřeba ji prověřit samostatně. Pokud mluvčí
tvrdí, že současně platit nemohou, nese břemeno tuto výlučnost doložit; samotné „buď, nebo“
k tomu nestačí (van Eemeren a Grootendorst 1992). Ve vyšetřování a v klinice pomáhá
oddělit dvě otázky: zda nalezená příčina existuje a zda vysvětluje celý stav, nebo jen jeho
část.

Pro člověka, kterému se opakovaně říká, že když chyboval on, nemohl chybovat nikdo jiný, je
užitečné zaznamenávat události odděleně podle jednotlivých podílů, ne podle jediné viny.
Taková evidence pomáhá vidět sdílenou odpovědnost tam, kde ji výklad mluvčího soustavně
popírá, a zachycuje vzorec, který se v jednotlivých incidentech ztrácí (Stark 2007). V odborné komunikaci je dobrou praxí formulovat závěr
opatrně: „nalezli jsme příčinu A; příčinu B jsme dosud nevyloučili“. Taková věta drží
otevřenou otázku, kterou by potvrzení disjunktu předčasně uzavřelo.

## Literatura

- Copi, I. M., Cohen, C., & McMahon, K. (2014). *Introduction to Logic* (14. vyd.). Harlow: Pearson.
- Damer, T. E. (2009). *Attacking Faulty Reasoning: A Practical Guide to Fallacy-Free Arguments* (6. vyd.). Belmont: Wadsworth.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Kunda, Z. (1990). The case for motivated reasoning. *Psychological Bulletin*, 108(3), 480–498.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- Nickerson, R. S. (1998). Confirmation bias: A ubiquitous phenomenon in many guises. *Review of General Psychology*, 2(2), 175–220.
- Stark, E. (2007). *Coercive Control: How Men Entrap Women in Personal Life*. New York: Oxford University Press.
- Walton, D. N. (2008). *Informal Logic: A Pragmatic Approach* (2. vyd.). Cambridge: Cambridge University Press.
- van Eemeren, F. H., & Grootendorst, R. (1992). *Argumentation, Communication, and Fallacies: A Pragma-Dialectical Perspective*. Hillsdale: Lawrence Erlbaum.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Formální klamy](@/kompendium/argumentacni-fauly/formalni/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Formální klam](@/kompendium/argumentacni-fauly/formalni/formalni-klam.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Popření předchůdce](@/kompendium/argumentacni-fauly/formalni/popreni-predchudce.md) – příbuzné heslo (Formální klamy, Denying the antecedent)
- [Falešné dilema](@/kompendium/techniques/ea-1-2-1-falesne-dilema.md) – příbuzné heslo (Klamy předpokladu, False dilemma)
- [Jediná příčina](@/kompendium/argumentacni-fauly/kauzalni/jedina-pricina.md) – příbuzné heslo (Kauzální klamy, Fallacy of the single cause)
- [Iluze volby](@/kompendium/nlp-vzorce/milton-model/iluze-volby.md) – příbuzné heslo (NLP vzorce: Milton-model, Illusion of choice)
- [Presupozice spojky „nebo“](@/kompendium/nlp-vzorce/presupozice/presupozice-nebo.md) – příbuzné heslo (NLP vzorce: Jazykové presupozice, Use of „or“)

**V kompendiu**

- [EA-1.2.1 Falešné dilema](@/kompendium/techniques/ea-1-2-1-falesne-dilema.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [6.2 Diferenciální diagnostika EA vs. PTSD/cPTSD/disociativní poruchy](@/kompendium/06-klinicke-aplikace/diferencialni-diagnostika.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Forenzní a právní rozměr EA](@/kompendium/forensic-legal/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Existenční klam](@/kompendium/argumentacni-fauly/formalni/existencni-klam.md) – předchozí heslo rodiny
- [Vylučující premisy](@/kompendium/argumentacni-fauly/formalni/vylucujici-premisy.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
