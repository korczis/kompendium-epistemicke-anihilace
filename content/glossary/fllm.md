+++
title = "FLLM"
weight = 100
description = "FLLM (Flowbite LLM): pilíř doktríny Prismatic Platform pro čistotu stylů v uživatelském rozhraní. Co vyžaduje, jak se vynucuje a jak souvisí s Kompendiem."

[taxonomies]
tags = ["glossary", "prismatic", "doctrine", "quality"]

[extra]
category = "doctrine"
abbreviation = "FLLM"
related_terms = ["doctrine", "nm-nd", "aiad", "quality-debt", "zero"]
keywords = ["FLLM", "Flowbite LLM", "CSS hygiena", "Tailwind", "doktrína", "Prismatic Platform"]
+++

## Definice

**FLLM** (*Flowbite LLM*) je jeden z pilířů [doktríny](@/glossary/doctrine.md) Prismatic Platform, softwarové platformy, z níž Kompendium vzešlo. Příloha [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) jej řadí do domény **UI design** s poznámkou „CSS hygiena“. Pilíř se týká toho, jak se v kódu platformy píšou styly uživatelského rozhraní: místo ručně psaných stylů má rozhraní stát na sdíleném systému komponent (Flowbite) a utilitních třídách frameworku Tailwind CSS.

Zkratka FLLM tedy **nepatří do terminologie epistemické anihilace**. V knize se objevuje proto, že kniha vznikla jako součást platformy a některé její stránky na platformní pravidla odkazují.

## Co pilíř vyžaduje

Podle provozní dokumentace platformy pilíř FLLM zakazuje nebo omezuje:

- vložené styly přímo v šablonách (atribut `style="…"`);
- bloky `<style>` uvnitř šablon;
- vlastní definice tříd ve zdrojových souborech CSS.

Preferovány jsou utilitní třídy Tailwindu (případně jejich skládání). Dokumentace výslovně uvádí, že kontrola **neověřuje**, zda je použita konkrétní komponenta Flowbite; hlídá jen čistotu stylů. Vynucení probíhá jako upozornění při commitu a jako blokující kontrola v CI, tedy před sloučením změny.

## Proč takové pravidlo existuje

Ručně psané styly se v rozsáhlém projektu snadno rozrůstají, navzájem si odporují a vytvářejí skrytý technický dluh (viz [quality debt](@/glossary/quality-debt.md)). Sdílený systém komponent dává rozhraní jednotný vzhled, usnadňuje přístupnost a umožňuje měnit vzhled na jednom místě. FLLM je tedy pravidlem udržitelnosti, nikoli estetiky.

## Vztah ke Kompendiu

Kniha FLLM přímo nevyužívá jako pojem, ale jeho logika se v ní objevuje dvakrát:

1. **Web knihy** je postaven na stejném přístupu – na Tailwindu a komponentách Flowbite – a pravidla repozitáře knihy vyžadují, aby uživatelské rozhraní z tohoto systému vycházelo.
2. **Metodicky**: [stránka o propojení technik s vizualizacemi](@/kompendium/section-bridges/bridge-techniques-to-visualizations.md) varuje před „estetickou inflací“ – přidáváním diagramů jen proto, že vypadají dobře – a odvolává se přitom na FLLM. Vizualizace v knize má mít funkci (orientace, opora poznávání, klinická referenční karta), jinak patří do příloh.

Tato druhá paralela je interpretační: FLLM sám o vizualizacích v knize nerozhoduje.

## Meze přenosu

Stejně jako u ostatních pilířů doktríny je třeba rozlišovat mezi pravidly pro software a pravidly pro práci s lidmi. Požadavek „žádné vlastní styly“ dává smysl v kódu, ale nemá obdobu v klinické nebo terapeutické praxi a Kompendium ho tak nepoužívá.

## Související

**Platforma**

- [Doctrine](@/glossary/doctrine.md) – soustava pilířů, k nimž FLLM patří.
- [Doktrína NM/ND](@/glossary/nm-nd.md) – zastřešující zásada nulové tolerance.
- [AIAD](@/glossary/aiad.md) – standard definic agentů s povinným blokem vynucení doktríny.
- [Quality Debt](@/glossary/quality-debt.md) – dluh, kterému pilíř předchází.
- [ZERO](@/glossary/zero.md) – sousední pilíř pro běhovou bezpečnost.

**Kniha**

- [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) – tabulka platformních zkratek.
- [1.6 Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md) – jak kniha s platformou souvisí.
- [Index pojmů](@/kompendium/08-prilohy/index-pojmu.md) – terminologický rejstřík.
