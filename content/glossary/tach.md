+++
title = "TACH"
weight = 100
description = "TACH (Total Assurance Comprehensive Hardened): testovací pilíř doktríny Prismatic Platform – každý modul se svými testy. Co vyžaduje a jakou má obdobu v Kompendiu."

[taxonomies]
tags = ["glossary", "prismatic", "doctrine", "quality", "verification"]

[extra]
category = "doctrine"
abbreviation = "TACH"
related_terms = ["doctrine", "regression-test", "clean-run", "nm-nd", "zero"]
keywords = ["TACH", "Total Assurance Comprehensive Hardened", "testování", "regresní test", "pokrytí testy", "doktrína"]
+++

## Definice

**TACH** (*Total Assurance Comprehensive Hardened*) je testovací pilíř [doktríny](@/glossary/doctrine.md) Prismatic Platform; příloha [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) jej řadí do domény *Testing*, index pojmů jej shrnuje jako „testovací rámec platformy“. Pilíř požaduje, aby každá část kódu měla **odpovídající testy** a aby se změna bez nich do systému nedostala.

Pojem patří do kontextu platformy. V mostech Kompendia k platformním pojmům (např. [Clean Run](@/kompendium/glossary-bridges/bridge-clean-run.md), [Regression Test](@/kompendium/glossary-bridges/bridge-regression-test.md), [Trinity Gate](@/kompendium/glossary-bridges/bridge-trinity-gate.md)) se TACH uvádí jako jeden z pilířů, s nimiž tyto mechanismy souvisejí.

## Původ a kontext pojmu

TACH stojí na praxi, kterou softwarové inženýrství rozvíjí od konce devadesátých let: testy se nepíší až po dokončení kódu, ale spolu s ním, a jsou považovány za jeho nedílnou součást. Kent Beck tuto praxi zformuloval jako vývoj řízený testy, v němž nejprve vzniká test popisující žádoucí chování, potom kód, který ho splní, a nakonec úprava návrhu při zachování zelených testů (Beck 2002). Pilíř od této metody nepřebírá pořadí kroků, ale její hlavní nárok: kód bez testu není hotový.

Druhou inspirací jsou testy vlastností. Koen Claessen a John Hughes ukázali, že místo jednotlivých příkladů lze popsat obecnou vlastnost funkce (například že zakódování a dekódování vrátí původní hodnotu) a nechat nástroj ověřit ji na stovkách náhodně generovaných vstupů (Claessen a Hughes 2000). TACH tento přístup vyžaduje u modulů, kde se vlastnost dá snadno formulovat – u validátorů, parserů a kodérů.

## Jak se projevuje: co pilíř vyžaduje

Podle provozní dokumentace platformy TACH zahrnuje několik úrovní testů:

- **jednotkové testy** – každý modul knihovny má mít svůj testovací soubor s ověřeními;
- **testy vlastností** (*property tests*) – u čistých, bezstavových modulů (validátory, parsery, kodéry) se ověřují obecné vlastnosti na mnoha generovaných vstupech;
- **integrační testy** – moduly, které spolupracují napříč aplikacemi, mají integrační testy;
- **end-to-end testy** – změny uživatelského rozhraní se ověřují v prohlížeči;
- **výkonnostní měření** – kód kritický pro výkon má mít benchmarky.

TACH je **blokující už při commitu**: změna nového nebo upraveného modulu bez odpovídajícího testovacího souboru je odmítnuta. S tím souvisí zásada platformy, že každá oprava chyby přichází s [regresním testem](@/glossary/regression-test.md), který dokazuje, že se chyba nevrátí.

## Mechanismus: proč takové pravidlo existuje

Kód bez testů je tvrzení bez důkazu: autor věří, že funguje, ale nikdo to neověřil a nikdo nepozná, až to přestane platit. Testy převádějí tvrzení „funguje to“ na opakovatelně ověřitelný fakt. Proto TACH úzce souvisí s pilířem [NCLB](@/glossary/nclb.md): oba trvají na tom, že důvěra má stát na ověření.

Je však třeba přesně říct, co test dokazuje. Edsger Dijkstra upozornil, že testování může prokázat přítomnost chyb, nikoli jejich nepřítomnost (Dijkstra 1972). Zelená sada testů tedy neznamená, že je kód správný, ale že obstál ve všech zkouškách, které někdo dokázal formulovat. Logika je stejná jako u Popperova pojetí vědeckého tvrzení: hypotéza, která přežila pokusy o vyvrácení, je *zatím* potvrzená, nikoli dokázaná (Popper 1959). TACH tím, že vyžaduje testy pro každou změnu, zvyšuje počet takových pokusů a zkracuje dobu, po kterou chyba může zůstat skryta.

## Odlišení

TACH se odlišuje od pilíře [ZERO](@/glossary/zero.md) tím, že ZERO zakazuje určité nebezpečné konstrukce v kódu, kdežto TACH požaduje doklad, že kód dělá, co má. Kód může být bez zakázaných vzorů a přesto chybný; může být otestovaný a přesto obsahovat konstrukci, kterou ZERO zakazuje. Pojem [Clean Run](@/glossary/clean-run.md) zase popisuje stav celého běhu – bez chyb a varování –, zatímco TACH se týká jednotlivých modulů a jejich testů.

Podstatné je i odlišení pokrytí od kvality. Pilíř kontroluje, zda testovací soubor existuje a obsahuje ověření; nekontroluje, zda ověření měří to podstatné. Test, který jen potvrdí, že funkce něco vrátí, splní formální požadavek, ale nic nedokáže. Proto platforma vedle automatické kontroly počítá s lidskou revizí testů.

## Význam pro Kompendium

Kniha není software, ale **princip ověřitelnosti** v ní má svou podobu. Repozitář knihy má vlastní automatické kontroly – sestavení webu odhalí každý nefunkční vnitřní odkaz, skripty informační architektury hlídají metadata, provázání a pokrytí pojmů a nástroje knihy mají testy v CI. Metodicky kniha požaduje, aby její tvrzení byla formulována tak, aby šla přezkoumat, a aby se u každého závěru dalo říct, co by ho vyvrátilo (viz [falsifikovatelnost](@/glossary/falsifikovatelnost.md)).

Nejbližší obdobou testování je v knize posuzování diagnostických nástrojů. U [DES-II](@/glossary/des-ii.md) nebo [IES-R](@/glossary/ies-r.md) se kniha ptá, zda jsou validovány, pro jakou populaci a kde jsou meze jejich interpretace. Lee Cronbach a Paul Meehl ukázali, že validita psychologického testu není jedna vlastnost, ale síť ověřených vztahů mezi skóre a tím, co má měřit (Cronbach a Meehl 1955); DES-II má za sebou takové ověřování jako zkrácená a upravená verze původní škály [disociace](@/glossary/disociace.md) (Carlson a Putnam 1993), IES-R jako revize škály dopadu traumatické události (Weiss a Marmar 1997). Otázka „je nástroj otestován?“ tu má přesný obsah: víme, co jeho skóre znamená, a víme, kdy ho nelze použít. Podrobněji to rozvádí příloha [Diagnostické nástroje](@/kompendium/08-prilohy/diagnosticke-nastroje.md).

Interpretačně má TACH obdobu i v tématu knihy. Řada manipulačních technik spočívá v tom, že se tvrzení vyhýbá jakékoli zkoušce – [imunizace proti falsifikaci](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md) formuluje přesvědčení tak, aby žádná zkušenost nemohla svědčit proti němu. Tvrzení bez „testu“ je pak nevyvratitelné, a právě proto bezcenné jako poznání.

Obecný příklad (kompozit): psycholožka dostane k posouzení klientku, u níž dřívější vyšetření „prokázalo“ sklon k fabulaci, protože skóre v jednom dotazníku překročilo hranici. Při bližším pohledu se ukáže, že dotazník nebyl validován pro lidi po dlouhodobém psychickém týrání a že vysoké skóre v této populaci zachycuje disociativní příznaky, nikoli vymýšlení. Výsledek „testu“ byl použit mimo rozsah, pro který byl ověřen – stejně jako zelený test, který ověřuje jinou funkci, než o jaké se tvrdí, že funguje.

## Meze přenosu

Testy softwaru ověřují předem definované chování. Lidské zotavení, terapie ani výpověď oběti se nedají „otestovat“ stejným způsobem a snaha převést je na binární kritéria by je zkreslila. Kniha proto z TACH přebírá jen požadavek, aby vlastní tvrzení a nástroje byly ověřitelné, ne nárok na mechanické ověřování lidí.

Otevřenou otázkou zůstává, jak měřit kvalitu testů, nejen jejich existenci. Pokrytí řádků kódu je snadno spočitatelné, ale málo vypovídá; měření, zda testy odhalí uměle vnesenou chybu, vypovídá víc, ale je nákladné. Obdobná otázka platí pro knihu: počet odkazů a slov lze kontrolovat strojem, pravdivost a srozumitelnost textu jen čtenář.

## Literatura

- Beck, K. (2002). *Test-Driven Development: By Example*. Addison-Wesley.
- Carlson, E. B., & Putnam, F. W. (1993). An update on the Dissociative Experiences Scale. *Dissociation*, 6(1).
- Claessen, K., & Hughes, J. (2000). QuickCheck: A lightweight tool for random testing of Haskell programs. *Proceedings of ICFP 2000*. ACM.
- Cronbach, L. J., & Meehl, P. E. (1955). Construct validity in psychological tests. *Psychological Bulletin*, 52(4).
- Dijkstra, E. W. (1972). The humble programmer. *Communications of the ACM*, 15(10).
- Popper, K. R. (1959). *The Logic of Scientific Discovery*. Hutchinson.
- Weiss, D. S., & Marmar, C. R. (1997). The Impact of Event Scale–Revised. In J. P. Wilson & T. M. Keane (Eds.), *Assessing Psychological Trauma and PTSD*. Guilford Press.

## Související

**Platforma**

- [Doctrine](@/glossary/doctrine.md) – soustava pilířů.
- [Regression Test](@/glossary/regression-test.md) – test, který brání návratu chyby.
- [Clean Run](@/glossary/clean-run.md) – běh bez varování a chyb.
- [ZERO](@/glossary/zero.md) – běhová bezpečnost.
- [NCLB](@/glossary/nclb.md) – doložitelnost tvrzení.

**Kniha**

- [Falsifikovatelnost](@/glossary/falsifikovatelnost.md) – ověřitelnost tvrzení.
- [Diagnostické nástroje](@/kompendium/08-prilohy/diagnosticke-nastroje.md) – validita a meze nástrojů.
- [Imunizace proti falsifikaci (EA-1.3.1)](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md) – tvrzení, které se vyhýbá zkoušce.
- [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) – tabulka platformních zkratek.
