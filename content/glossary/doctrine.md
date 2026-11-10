+++
title = "Doctrine"
weight = 100
description = "Doktrína Prismatic Platform: soustava pojmenovaných pilířů (NMND, NWB, NCLB, TACH, ZERO, SEAL…), které řídí vývoj platformy. Struktura, vynucování a vztah ke Kompendiu."

[taxonomies]
tags = ["glossary", "prismatic", "doctrine", "quality", "architecture"]

[extra]
category = "doctrine"
related_terms = ["nm-nd", "nclb", "nwb", "tach", "zero", "seal", "aiad"]
keywords = ["doctrine", "doktrína", "pilíře", "Prismatic Platform", "NMND", "vynucování", "kvalita"]
+++

## Definice

**Doctrine** (doktrína) je v kontextu Prismatic Platform, softwarové platformy, z níž Kompendium vzešlo, souhrnné označení pro **soustavu pojmenovaných pravidel – pilířů –**, které určují, jak se na platformě vyvíjí, testuje a dokumentuje. Každý pilíř má krátkou zkratku, vymezenou doménu a způsob vynucení. Index pojmů doktrínu shrnuje jako „18-pillar enforcement systém platformy“ a příloha [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) uvádí osmnáct pilířů.

Počet pilířů se mezi verzemi platformy měnil: příloha knihy uvádí osmnáct, referenční modul vynucovacích protokolů platformy devatenáct a novější verze provozní dokumentace platformy vyjmenovávají dalších několik. Číslo je proto třeba chápat jako údaj z doby zápisu, ne jako pevnou vlastnost doktríny.

Doktrína **není součástí taxonomie epistemické anihilace**. Kniha ji zmiňuje proto, že vznikla v prostředí platformy a řada jejích stránek se na pilíře odvolává.

## Pilíře

Přehled pilířů, jak je uvádí příloha [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md), s odkazy na hesla, která je vysvětlují:

| Pilíř | Doména | Heslo |
|-------|--------|-------|
| **3NL** | architektura | [3NL](@/glossary/three-nested-loops.md) |
| **NMND** | disciplína provedení | [Doktrína NM/ND](@/glossary/nm-nd.md) |
| **NWB** | trvalost řešení | [NWB](@/glossary/nwb.md) |
| **FLLM** | čistota stylů UI | [FLLM](@/glossary/fllm.md) |
| **M5M** | granulární práce | [M5M](@/glossary/m5m.md) |
| **NCLB** | doložitelnost tvrzení | [NCLB](@/glossary/nclb.md) |
| **TACH** | testování | [TACH](@/glossary/tach.md) |
| **ZERO** | běhová bezpečnost | [ZERO](@/glossary/zero.md) |
| **SEAL** | bezpečnost | [SEAL](@/glossary/seal.md) |
| **GITL** | dohledatelnost změn | [GITL](@/glossary/gitl.md) |
| **KNOW** | pokrytí znalostí | [KNOW](@/glossary/know.md) |

Dalšími pilíři jsou PERF (výkon), DEPS (závislosti), DOCS (dokumentace), OTEL (telemetrie), RDME (README v každé aplikaci), NLLB (žádný nefunkční odkaz) a HYGIENE (čistota repozitáře).

## Jak se doktrína vynucuje

Podle provozní dokumentace platformy se pilíře liší silou vynucení:

- **blokující při commitu** – změna, která pilíř poruší, se vůbec nezapíše (mj. NMND, TACH, ZERO, SEAL, PERF, DEPS, RDME, HYGIENE);
- **blokující v CI** – změna se zapíše, ale nesloučí (mj. NCLB, FLLM, GITL, NWB, DOCS, OTEL, NLLB);
- **poradní** – kontrola jen upozorní (mj. M5M, KNOW);
- **bez vynucovacího modulu** – 3NL slouží jako architektonická zásada.

Zastřešující zásadou je [Doktrína NM/ND](@/glossary/nm-nd.md) („No Mercy, No Doubts“): žádná nedokončená práce, žádné obcházení kontrol, rozhodování opřené o důkazy. Vynucení a obcházení řeší i platformní pojmy [Violation Protocol](@/glossary/violation-protocol.md), [Clean Run](@/glossary/clean-run.md) a [Trinity Gate](@/glossary/trinity-gate.md).

## Vztah ke Kompendiu

Kniha z doktríny převzala **několik zásad jako redakční pravidla**, nikoli jako obsah:

- z [NCLB](@/glossary/nclb.md) požadavek, aby žádné tvrzení nezůstalo bez ověřitelné opory;
- z [NWB](@/glossary/nwb.md) a NMND požadavek, aby stránka byla úplná, ne zástupný text;
- z NLLB a [KNOW](@/glossary/know.md) požadavek, aby každý odkaz vedl na existující stránku a každý pojem měl své heslo – to dnes hlídají kontroly repozitáře knihy.

Jak kniha s platformou souvisí, popisuje [1.6 Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md) a [Doktrinální rámec](@/kompendium/02-doktrinalni-ramec/_index.md).

## Meze přenosu

Doktrína je soubor pravidel pro vývoj softwaru a jeho slovník (nulová tolerance, žádná cesta zpět, absolutní zámek) je záměrně přísný. Pro práci s lidmi se nehodí: klinická, terapeutická a forenzní praxe stojí na úsudku, na kontextu, na možnosti změnit názor a na respektu k tempu člověka. Kompendium proto pilíře používá jen jako nárok na vlastní kvalitu – nikdy jako model zacházení s lidmi, o nichž píše. Tuto mez výslovně formuluje i heslo [Doktrína NM/ND](@/glossary/nm-nd.md) v oddílu o přenosu na lidské prostředí.

## Související

**Platforma**

- [Doktrína NM/ND](@/glossary/nm-nd.md) – zastřešující zásada.
- [NCLB](@/glossary/nclb.md) – pilíř s největším významem pro knihu.
- [AIAD](@/glossary/aiad.md) – standard definic agentů s povinným blokem vynucení doktríny.
- [Violation Protocol](@/glossary/violation-protocol.md) – postup při porušení.
- [Quality Debt](@/glossary/quality-debt.md) – dluh, kterému doktrína předchází.

**Kniha**

- [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) – tabulka platformních zkratek.
- [1.6 Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md) – souvislosti.
- [Doktrinální rámec](@/kompendium/02-doktrinalni-ramec/_index.md) – zásady knihy.
- [Index pojmů](@/kompendium/08-prilohy/index-pojmu.md) – terminologický rejstřík.
