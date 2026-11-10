+++
title = "Elektronické důkazy"
description = "Zprávy, e-maily, metadata, lokalizace a syntetická média v kauzách EA: jak je zajistit, ověřit a vyložit a jak čelit námitce, že jde o podvrh."
weight = 35

[taxonomies]
tags = ["kompendium", "forensic-legal", "documentation-standards"]
categories = ["academic", "legal", "clinical"]

[extra]
related_terms = ["1-forensic-interview-protocol", "10-forensic-documentation", "11-undue-influence-doctrine", "12-coercive-control-law"]
parent = "kompendium-forensic-legal"
toc = true
+++

# Elektronické důkazy

Kapitola z [části o standardech dokumentace](@/kompendium/forensic-legal/_index.md) se
zabývá digitálními stopami, které jsou v kauzách epistemického zneužívání často nejbohatším
zdrojem důkazů: komunikace, záznamy polohy, finanční transakce, aktivita na sociálních
sítích. Zároveň popisuje digitální technologie jako nástroje kontroly a nová rizika
syntetických médií. Je určena vyšetřovatelům, znalcům z oboru kybernetiky, advokátům a
podpůrným organizacím.

## Právní a forenzní kontext

Elektronické důkazy se v řízení hodnotí jako listiny, věci nebo záznamy podle povahy.
Soud zkoumá jejich **autenticitu** (pochází od toho, komu je připisován), **integritu**
(nebyl změněn) a **úplnost** (není vytržen z kontextu). Pro identifikaci, sběr, získání a
uchování digitálních důkazů existuje norma ISO/IEC 27037. Mezinárodní spolupráci při
zajišťování dat upravuje Úmluva o kyberkriminalitě (Budapešť 2001). Zpracování osobních
údajů třetích osob podléhá nařízení (EU) 2016/679. Získání dat z cizího zařízení nebo účtu
bez oprávnění může být protiprávní a důkaz znehodnotit; orgány činné v trestním řízení
mají k zajištění dat vlastní zákonné nástroje.

## Specifika epistemického zneužívání

Digitální technologie hrají v EA dvojí roli. Jsou **nástrojem kontroly**:

- sledování polohy, kontrola telefonu, přístup do účtů;
- neustálá dostupnost a požadavek okamžité odpovědi;
- přepisování a mazání komunikace, popírání toho, co bylo napsáno;
- kontrola online reputace oběti a její izolace na sociálních sítích.

A jsou **zdrojem důkazů**: komunikace zachycuje vzorce kontroly, [gaslightingu](@/glossary/gaslighting.md)
a eskalace přesněji než paměť. Specifickým rizikem je obrácení: pachatel může tvrdit, že
důkazy jsou podvržené, nebo sám vytvořit syntetický obsah, který oběť diskredituje
([deepfake](@/glossary/deepfake.md), [klonovaný hlas](@/kompendium/techniques/ea-9-2-2-voice-cloning-EA.md),
[padělané dokumenty](@/kompendium/techniques/ea-9-2-9-AI-document-forgery.md)). Námitka
„to je fake“ je pak novou podobou zpochybnění reality oběti.

## Klíčové principy

- **Metadata jsou důkaz.** Datum, čas, odesílatel, zařízení – bez nich má obsah nižší váhu.
- **Celek před výběrem.** Úplné konverzace, ne jen vybrané zprávy.
- **Forenzní kopie.** U klíčových zařízení odborné zajištění s ověřením integrity.
- **Zákonnost zajištění.** Jen data, k nimž má osoba oprávněný přístup, nebo zajištěná
  orgány podle zákona.
- **Technická námitka vyžaduje technickou odpověď.** Obecné „může to být podvrh“ se
  vyvrací znaleckým ověřením, ne spory o dojmy.

## Procedurální postup

1. **Identifikace zdrojů.** Telefony, počítače, cloudové účty, komunikační aplikace,
   sociální sítě, bankovnictví, chytrá domácnost, lokalizační služby.
2. **Bezpečnostní kontrola.** Zjistit, zda pachatel nemá přístup k zařízením oběti
   (sdílení polohy, sdílené účty, neznámé aplikace); řešit to s ohledem na bezpečnost –
   náhlé odstřižení může vyvolat eskalaci.
3. **Zajištění.** Export dat se zachováním metadat; u klíčových zařízení forenzní kopie
   s kryptografickým otiskem; zachování originálního zařízení.
4. **Dokumentace.** Záznam o zajištění a řetězu úschovy (viz [Chain of
   custody](@/kompendium/forensic-legal/7-evidence-chain-of-custody.md)).
5. **Analýza.** Vyhledání vzorců: frekvence kontaktů, reakce na nedostupnost, popírání
   dřívějších sdělení, eskalace v čase.
6. **Ověření autenticity.** Při námitce podvrhu znalecká analýza metadat, souladu se
   záznamy poskytovatele služby, konzistence s ostatními důkazy.
7. **Prezentace.** Výtah s odkazy na úplná data; vizualizace časových vzorců.

## Markery a diferenciální úvahy

Na technologickou kontrolu ukazuje:

- sdílení polohy, které oběť nemůže vypnout bez sankce;
- požadavky na okamžitou odpověď a reakce na nedostupnost;
- znalost informací, které mohl pachatel získat jen z přístupu do zařízení;
- mazání nebo úpravy konverzací.

Na možnou manipulaci s důkazy ukazuje nesoulad metadat s obsahem, chybějící části
konverzací, soubory bez původních metadat nebo technické artefakty syntetického obsahu.
Diferenciálně je třeba odlišit **dohodnuté sdílení** polohy nebo účtů mezi partnery, které
je běžné, od jednostranné kontroly, a **běžnou ztrátu dat** od záměrného mazání.

## Riziková místa

- **Snímky obrazovky jako jediný důkaz** – snadno zpochybnitelné.
- **Neoprávněný přístup** oběti nebo jejích podporovatelů do účtů pachatele.
- **Stalkerware** – sledovací aplikace v zařízení oběti, které pachateli prozradí, že
  oběť sbírá důkazy.
- **Synchronizace** – smazání na jednom zařízení maže data všude.
- **Přecenění detekce syntetického obsahu** – nástroje pro rozpoznání deepfake nejsou
  dostatečně spolehlivé, aby samy rozhodly.

## Modelová situace (anonymizovaná)

Muž tvrdí, že ho bývalá partnerka léta sledovala a popírala, co mu psala. Partnerka v řízení
předloží zvukovou nahrávku, na níž muž údajně vyhrožuje, a tvrdí, že jeho zprávy jsou
upravené. Znalec provede forenzní zajištění obou telefonů. Zprávy muže odpovídají datům
v zařízení i záznamům poskytovatele. U nahrávky chybějí původní metadata a obsahuje
technické nesrovnalosti; znalec však výslovně uvede, že synteticky vytvořený obsah nelze
s jistotou prokázat. Soud nahrávce nepřizná váhu, protože její původ nelze ověřit, a opře
se o zprávy s doloženou integritou.

## Doporučení pro praxi

### Pro dotčenou osobu

- Neodstraňujte nic; exportujte konverzace se zachováním dat.
- Zkontrolujte, kdo má přístup k vašim zařízením a účtům, ale postupujte opatrně a ideálně
  s podporou – náhlé změny mohou být rizikové.
- Nevstupujte do účtů druhé osoby.

### Pro vyšetřovatele a znalce

- Zajišťujte data se zachováním metadat a ověřením integrity.
- U námitky podvrhu proveďte technické ověření a uveďte jeho meze.
- Zkoumejte i technologickou kontrolu jako součást skutku.

### Pro advokáty

- Předkládejte úplné exporty, ne výběry.
- Na námitku podvrhu odpovídejte návrhem na znalecké ověření.

## Limity a otevřené otázky

Rozvoj syntetických médií podkopává důvěru v jakýkoli záznam – jev, který se v literatuře
popisuje jako „dividenda lháře“: pravý záznam lze odbýt jako podvrh. Šifrované komunikační
služby a krátkodobé zprávy ztěžují zajištění. Otevřenou otázkou je, jak v řízení nakládat
s obrovským objemem komunikace a zda lze použít automatizovanou analýzu, aniž by se do ní
promítly skryté předpoklady.

## Související

**V této sekci**

- [Chain of custody](@/kompendium/forensic-legal/7-evidence-chain-of-custody.md) – integrita digitálních stop.
- [Uchování důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md) – praktické zajištění.
- [Protokoly nahrávání](@/kompendium/forensic-legal/36-recording-protocols.md) – audio a video záznamy.

**Techniky**

- [Deepfake Personality](@/kompendium/techniques/ea-9-2-1-deepfake-personality.md) – syntetická identita.
- [Synthetic Witness Testimony](@/kompendium/techniques/ea-9-2-7-synthetic-witness-testimony.md) – podvržená svědectví.
- [Real-time monitoring](@/kompendium/techniques/ea-4-2-2-real-time-monitoring.md) – technologická kontrola.

**Glosář a sebeobrana**

- [Deepfake](@/glossary/deepfake.md) – syntetická média.
- [OSINT](@/glossary/osint.md) – otevřené zdroje a jejich etické meze.
- [Detekce AI obsahu](@/kompendium/self-defense-guides/40-ai-content-detection.md) – osobní obrana proti syntetickému obsahu.
