+++
title = "Dokumentační standardy"
description = "Co nelze najít ani popsat, nelze bránit. Kapitola popisuje šablony klíčových dokumentů, jedno místo pravdy, vlastnictví, verzování bez přepisu a pravidelný audit zastaralých dokumentů."
weight = 240

[taxonomies]
tags = ["kompendium", "organizational-defense", "operational"]
categories = ["academic", "organizational", "governance"]

[extra]
related_terms = ["21-decision-traceability", "8-policy-review-cycles", "23-communication-policy", "27-information-classification"]
toc = true
+++

# Dokumentační standardy

> **Pilíř:** Provoz · **Oddíl:** [Organizační obrana](@/kompendium/organizational-defense/_index.md)

Dokumentace je dlouhodobá paměť organizace: postupy, rozhodnutí, incidenty, role, smlouvy.
Když jsou dokumenty v různých formátech, na různých místech, bez verzí a bez vlastníka,
organizace neví, co ví. Pro epistemický útok je to výhoda: kdo má přístup k „té správné“
verzi nebo kdo dokáže dokument nenápadně upravit, ovládá to, co bude platit za fakt.
Dokumentační standardy nejsou byrokracie, ale podmínka toho, aby bylo možné cokoli doložit.

## Riziko v daném prostředí

Ve zdravotnictví je dokumentace upravena právně (zákon č. 372/2011 Sb., o zdravotních
službách, a prováděcí předpisy) a dodatečné úpravy zdravotnické dokumentace jsou závažným
problémem; v řízení provozu a personálu však takové standardy často chybí. Ve škole jde o
dokumentaci výchovných opatření a řešení šikany, kde neúplný záznam znemožní pozdější
posouzení. Ve výzkumu o laboratorní deníky a záznamy o datech, jejichž neúplnost umožní
spory o autorství a o integritu výsledků. Ve firmě o postupy a smlouvy, ve veřejné správě o
spisy, v médiích o záznamy o ověřování zdrojů. Ve všech oblastech je riziko stejné:
retroaktivně upravený dokument mění minulost.

## Strukturální zranitelnosti

- Neexistuje jedno místo pravdy; každý má „svou“ verzi.
- Dokumenty nemají vlastníka, datum ani verzi.
- Úpravy přepisují původní obsah bez historie.
- Klíčové znalosti nejsou zapsané vůbec (v hlavách jednotlivců).
- Zastaralé dokumenty se neodlišují od platných.

## Ochranné struktury

- Jedno úložiště pro každý typ dokumentu s řízeným přístupem a s historií verzí.
- Šablony pro klíčové typy dokumentů s povinnými metadaty (vlastník, verze, datum
  účinnosti, stav, související dokumenty):
  - **rozhodnutí** – viz [sledovatelnost rozhodnutí](@/kompendium/organizational-defense/21-decision-traceability.md);
  - **incident** – co se stalo, kdy, kdo, jaká opatření;
  - **postup** – kroky, odpovědnosti, výjimky;
  - **role** – odpovědnosti, pravomoci, zastupitelnost;
  - **smlouva** – strany, závazky, schválení, změny.
- Pravidlo „neměnnosti“: úprava jen novou verzí; původní zůstává čitelná. U záznamů s
  důkazní hodnotou (incidenty, stížnosti) je vhodné technické zajištění proti přepisu.
- Pravidelný audit zastaralých dokumentů a jejich archivace nebo aktualizace.

## Role a odpovědnosti

Vlastník dokumentu odpovídá za obsah, aktuálnost a za to, že dokument je k nalezení. Správce
úložiště (IT, kancelář) odpovídá za techniku, přístupy a zálohy. Compliance a interní audit
ověřují vzorky. Vedoucí útvarů odpovídají za to, že klíčové znalosti jejich útvaru jsou
zapsány – vazba na [rotaci rolí](@/kompendium/organizational-defense/30-rotation-of-roles.md).
Každý autor odpovídá za pravdivost a úplnost.

## Politiky a postupy

1. Dokumentační standard: typy dokumentů, šablony, metadata, úložiště, přístupy.
2. Pravidla verzování a zákaz přepisu záznamů s důkazní hodnotou.
3. Měsíční nebo čtvrtletní audit zastaralých dokumentů s hlášením vlastníkům.
4. Pravidla uchovávání a skartace v souladu s právem; blokace skartace při sporu.
5. Navázání na [cykly revize politik](@/kompendium/organizational-defense/8-policy-review-cycles.md)
   a [klasifikaci informací](@/kompendium/organizational-defense/27-information-classification.md).

## Vzdělávání a trénink

Autoři se učí psát dokumenty pro čtenáře, který o věci nic neví, a zapisovat fakta odděleně
od interpretací. U záznamů o incidentech a stížnostech je důležité zapisovat přesná slova,
data a svědky, nikoli dojmy. Vedoucí se učí, že „to máme v hlavě“ je riziko. Užitečné jsou
zásady [forenzní dokumentace](@/kompendium/forensic-legal/10-forensic-documentation.md) a
[klinické dokumentace](@/kompendium/forensic-legal/31-clinical-documentation-EA.md), které
ukazují, jak zapisovat tak, aby záznam obstál i ve sporu.

## Řešení incidentu

Zjistí-li se, že dokument byl dodatečně upraven nebo že klíčová dokumentace chybí:

1. Zajistit všechny dostupné verze a historii úprav (kdo, kdy, co změnil).
2. Porovnat s jinými zdroji (e-maily, kopie, výtisky, zálohy).
3. Posoudit dopad: která rozhodnutí se o upravený dokument opírala.
4. Při podezření na úmysl postupovat podle [interního vyšetřování](@/kompendium/organizational-defense/32-internal-investigation.md);
   zachovat [řetězec úschovy](@/glossary/chain-of-custody.md) zajištěných verzí.

**Příklad (anonymizovaný kompozit).** Ve škole rodiče tvrdili, že na šikanu upozorňovali
opakovaně, škola tvrdila, že poprvé. Záznamy z jednání s rodiči byly v různých souborech u
různých učitelů a dva z nich byly upraveny po stížnosti. Teprve zavedení jednotné šablony a
úložiště s historií verzí zabránilo opakování podobného sporu.

## Ochrana dotčené osoby

Člověk, o němž dokumentace vypovídá (pacient, žák, zaměstnanec, stěžovatel), má právo na
přesnost záznamů a v mnoha případech i na přístup k nim (například podle GDPR nebo podle
předpisů o zdravotnické dokumentaci). Kdo upozorní na úpravy záznamů, může být chráněn
podle zákona č. 171/2023 Sb. Pro dotčenou osobu je zkušenost, kdy oficiální záznam popírá
její zkušenost, zvláště zatěžující; potvrzení skutečného průběhu je součástí nápravy.

## Vyhodnocení a indikátory selhání

- Dokumenty v různých formátech, na různých místech, bez verzí a bez vlastníka.
- Při šetření nelze najít klíčový dokument nebo jeho původní verzi.
- Velký podíl dokumentů je zastaralý.
- Lidé vědí, jak se věci dělají, ale nikde to není zapsáno.

Metriky: podíl dokumentů s vlastníkem a datem revize, doba potřebná k nalezení dokumentu,
počet zastaralých dokumentů.

## Meze a otevřené otázky

Dokumentace nezachytí tacitní znalost a kontext; příliš mnoho dokumentů vede k tomu, že nikdo
nic nečte. Standard musí být jednoduchý, jinak se obchází. Otevřené zůstává, jak zajistit
integritu dokumentů v prostředí sdílených editorů, kde lze obsah snadno měnit, a jak
zacházet s dokumenty, které generují nástroje umělé inteligence.

## Související

**Sesterské kapitoly**

- [Sledovatelnost rozhodnutí](@/kompendium/organizational-defense/21-decision-traceability.md)
  – záznamy rozhodnutí jako typ dokumentu.
- [Cykly revize politik](@/kompendium/organizational-defense/8-policy-review-cycles.md) –
  údržba předpisů.
- [Komunikační politika](@/kompendium/organizational-defense/23-communication-policy.md) –
  co se zaznamenává.
- [Klasifikace informací](@/kompendium/organizational-defense/27-information-classification.md)
  – citlivost dokumentů.

**Forenzní praxe**

- [Forenzní dokumentace](@/kompendium/forensic-legal/10-forensic-documentation.md) – jak
  zapisovat, aby záznam obstál.
- [Chain of custody](@/glossary/chain-of-custody.md) – řetězec úschovy záznamů.
- [EA-4.2.7 Documentation chain of custody](@/kompendium/techniques/ea-4-2-7-documentation-chain-custody.md)
  – nepřerušený řetězec dokumentace.

**Techniky**

- [EA-2.4.2 Policy Rewriting Skrytá](@/kompendium/techniques/ea-2-4-2-policy-rewriting-skryta.md)
  – skryté úpravy pravidel a dokumentů.
