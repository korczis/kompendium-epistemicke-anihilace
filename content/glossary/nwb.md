+++
title = "NWB"
weight = 100
description = "NWB (No Way Back): pilíř doktríny Prismatic Platform, který žádá trvalá řešení bez dočasných obezliček a vrstev zpětné kompatibility. Obsah, smysl a meze přenosu."

[taxonomies]
tags = ["glossary", "prismatic", "doctrine", "architecture"]

[extra]
category = "doctrine"
abbreviation = "NWB"
related_terms = ["doctrine", "nm-nd", "quality-debt", "regression-test", "zero-warning-policy"]
keywords = ["NWB", "No Way Back", "trvalé řešení", "architektura", "zpětná kompatibilita", "doktrína"]
+++

## Definice

**NWB** (*No Way Back*, „cesta zpět neexistuje“) je pilíř [doktríny](@/glossary/doctrine.md) Prismatic Platform, který příloha [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) řadí do domény *Permanence*. Index pojmů jej shrnuje jako doktrínu „permanentní řešení“. Pilíř žádá, aby každá změna v systému byla **trvalým zlepšením**, nikoli dočasnou záplatou, a aby se systém nevracel ke starším, překonaným řešením.

Pojem patří do kontextu platformy. V Kompendiu se často objevuje ve spojení **NMND/NWB/NCLB** v poznámkách o tom, že stránka nevznikla jako zástupný text a že je samostatně použitelná.

## Co pilíř vyžaduje

Podle provozní dokumentace platformy NWB zahrnuje:

- **trvalou architekturu** – žádné dočasné obezličky (*hacks*);
- **žádné scénáře návratu** – řešení se navrhují tak, aby se k předchozímu stavu nemuselo a nedalo vracet;
- **postupné zlepšování** – každá změna systém trvale posouvá dopředu;
- **žádné vrstvy zpětné kompatibility** (*compatibility shims*) – čistý rozchod se starým rozhraním je preferován před jeho udržováním vedle nového;
- ověřování souladu při architektonické revizi.

Pilíř se vynucuje revizí architektury a v CI, nikoli blokací jednotlivých commitů. Spolu s [Doktrínou NM/ND](@/glossary/nm-nd.md) tvoří jádro zásady, že se nedokončená nebo provizorní práce nepřijímá.

## Proč takové pravidlo existuje

Dočasná řešení mají sklon stát se trvalými: zůstávají v systému, obrůstají závislostmi a vytvářejí [technický dluh](@/glossary/quality-debt.md). Vrstvy zpětné kompatibility zdvojují cesty, kterými systém může jít, a tím i místa, kde může selhat. NWB tento sklon obrací: požaduje, aby se problém řešil u kořene a jednou provždy.

## Vztah ke Kompendiu

Kniha NWB přebírá jako **redakční zásadu**: stránka má být úplná a samostatně použitelná, ne zástupný text, který „se doplní později“. Proto pravidla repozitáře knihy požadují odstranění poznámek typu „v rekonstrukci“, jakmile je stránka hotová.

Obsahově je však vztah NWB ke knize **napjatý** a je třeba ho výslovně ohraničit. Kompendium popisuje jevy, kde „cesta zpět neexistuje“ je naopak **varovný znak**: skupiny s vysokou mírou kontroly vštěpují členům přesvědčení, že odchod je nemožný nebo katastrofický, a techniky popsané v [kapitole 4](@/kompendium/04-terminalni-protokoly/_index.md) se pokoušejí o změny, které mají být nevratné. Proti tomu kniha klade důraz na **reverzibilitu**: [klasifikační schéma](@/kompendium/08-prilohy/klasifikace.md) třídí techniky podle toho, zda jsou jejich následky vratné, a [protokoly zotavení](@/kompendium/recovery-protocols/_index.md) vycházejí z předpokladu, že návrat k vlastnímu poznání je možný.

## Meze přenosu

NWB je pravidlo pro návrh softwaru. Na lidi, jejich rozhodnutí a jejich zotavení se nepřenáší: v práci s lidmi je možnost změnit názor, vrátit se a začít znovu hodnotou, nikoli chybou. Kniha proto NWB používá jen jako nárok na vlastní úplnost, ne jako model lidské změny.

## Související

**Platforma**

- [Doctrine](@/glossary/doctrine.md) – soustava pilířů.
- [Doktrína NM/ND](@/glossary/nm-nd.md) – nulová tolerance k nedokončené práci.
- [Quality Debt](@/glossary/quality-debt.md) – dluh, kterému NWB předchází.
- [Regression Test](@/glossary/regression-test.md) – pojistka, že se oprava nevrátí.

**Kniha**

- [Klasifikační schéma](@/kompendium/08-prilohy/klasifikace.md) – osa reverzibility.
- [Longitudinální rekonstruktivní protokoly](@/kompendium/recovery-protocols/_index.md) – zotavení jako návrat.
- [Doktrinální rámec](@/kompendium/02-doktrinalni-ramec/_index.md) – jak kniha přebírá platformní zásady.
- [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) – tabulka platformních zkratek.
