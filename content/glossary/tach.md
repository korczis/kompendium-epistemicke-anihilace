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

## Co pilíř vyžaduje

Podle provozní dokumentace platformy TACH zahrnuje několik úrovní testů:

- **jednotkové testy** – každý modul knihovny má mít svůj testovací soubor s ověřeními;
- **testy vlastností** (*property tests*) – u čistých, bezstavových modulů (validátory, parsery, kodéry) se ověřují obecné vlastnosti na mnoha generovaných vstupech;
- **integrační testy** – moduly, které spolupracují napříč aplikacemi, mají integrační testy;
- **end-to-end testy** – změny uživatelského rozhraní se ověřují v prohlížeči;
- **výkonnostní měření** – kód kritický pro výkon má mít benchmarky.

TACH je **blokující už při commitu**: změna nového nebo upraveného modulu bez odpovídajícího testovacího souboru je odmítnuta. S tím souvisí zásada platformy, že každá oprava chyby přichází s [regresním testem](@/glossary/regression-test.md), který dokazuje, že se chyba nevrátí.

## Proč takové pravidlo existuje

Kód bez testů je tvrzení bez důkazu: autor věří, že funguje, ale nikdo to neověřil a nikdo nepozná, až to přestane platit. Testy převádějí tvrzení „funguje to“ na opakovatelně ověřitelný fakt. Proto TACH úzce souvisí s pilířem [NCLB](@/glossary/nclb.md): oba trvají na tom, že důvěra má stát na ověření.

## Vztah ke Kompendiu

Kniha není software, ale **princip ověřitelnosti** v ní má svou podobu:

- repozitář knihy má vlastní automatické kontroly – sestavení webu odhalí každý nefunkční vnitřní odkaz, skripty informační architektury hlídají metadata, provázání a pokrytí pojmů a nástroje knihy mají testy v CI;
- metodicky kniha požaduje, aby její tvrzení byla formulována tak, aby šla přezkoumat, a aby se u každého závěru dalo říct, co by ho vyvrátilo (viz [falsifikovatelnost](@/glossary/falsifikovatelnost.md));
- u diagnostických nástrojů ([DES-II](@/glossary/des-ii.md), [IES-R](@/glossary/ies-r.md)) kniha rozlišuje, zda jsou validovány, a kde jsou meze jejich interpretace – to je obdoba otázky, zda je nástroj „otestován“.

Tyto paralely jsou interpretační: TACH sám se týká jen kódu platformy.

## Meze přenosu

Testy softwaru ověřují předem definované chování. Lidské zotavení, terapie ani výpověď oběti se nedají „otestovat“ stejným způsobem a snaha převést je na binární kritéria by je zkreslila. Kniha proto z TACH přebírá jen požadavek, aby vlastní tvrzení a nástroje byly ověřitelné, ne nárok na mechanické ověřování lidí.

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
- [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) – tabulka platformních zkratek.
