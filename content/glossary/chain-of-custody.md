+++
title = "Chain of custody (řetězec úschovy důkazů)"
weight = 5
description = "Nepřetržitá, zdokumentovaná kontrola nad důkazem od zajištění po předložení, která prokazuje jeho pravost, neporušenost a použitelnost v řízení i v due diligence."

[taxonomies]
tags = ["glossary", "forensic", "legal", "compliance", "due-diligence"]

[extra]
category = "forensic"
status = "active"
author = "Tomas Korcak (korczis)"
difficulty = "intermediate"
abbreviation = "CoC"
date_created = "2026-05-03"
date_updated = "2026-11-10"
importance = "critical"
related_terms = ["evidence", "verifiable-evidence", "evidence-over-opinion", "due-diligence", "forensic-interview", "pattern-evidence", "expert-witness"]
key_takeaway = "Chain of custody je nepřerušený, průběžně vedený záznam, který dokládá, že důkaz zůstal pravý a nezměněný od okamžiku zajištění do okamžiku rozhodnutí. Každá nevysvětlená mezera může jinak průkazný důkaz učinit nepoužitelným."
+++

## Definice

**Chain of custody** (CoC, česky *řetězec úschovy* nebo *řetězec nakládání s důkazem*) je
chronologický, zdokumentovaný sled zajištění, předání, analýzy a naložení s fyzickým nebo
digitálním důkazem. Zaznamenat se musí každá osoba, která s předmětem nakládala, datum
a čas každého předání a účel každé manipulace. Řetězec musí být souvislý: každý
nevysvětlený interval zakládá podezření, že s důkazem mohlo být manipulováno, že byl
kontaminován nebo zaměněn.

Řetězec úschovy je páteří každé forenzní operace i každé [due
diligence](@/glossary/due-diligence.md). Bez nepřetržitého dokumentačního řetězce se
i nejprůkaznější důkaz stává procesně nepoužitelným. Princip se uplatňuje nejen na fyzické
dokumenty a digitální artefakty (logy, obrazy disků, exporty databází), ale také na
zjištění z [OSINT](@/glossary/osint.md), u nichž je nutné prokázat, *kdo*, *kdy* a *odkud*
informaci získal a že nebyla mezitím upravena. Selhání řetězce úschovy je nejčastějším
důvodem, proč soudy a regulátoři odmítají jinak platná zjištění.

## Původ a kontext pojmu

Doktrína vznikla z požadavků angloamerického dokazování, zejména z požadavku na
*prokázání pravosti* (authentication) podle pravidla 901 amerických Federal Rules of
Evidence. V českém trestním řízení odpovídá obecnému požadavku, aby důkaz byl získán
a proveden zákonným způsobem a aby bylo možné ověřit jeho původ (trestní řád, zákon
č. 141/1961 Sb., § 89 a násl. o důkazech). Soudy požadují, aby strana, která důkaz
předkládá, prokázala, že jde o tentýž předmět, který byl zajištěn, a že je v podstatě
v nezměněném stavu.

V digitální forenzní analýze je standard přísnější: kryptografické otisky (*hash*, např.
SHA-256 nebo BLAKE3) zajištěných médií se počítají při zajištění a znovu ověřují před
analýzou, aby se prokázala neporušenost na úrovni bitů. Mezinárodní vodítko pro tento
postup představuje norma ISO/IEC 27037:2012.

## Jak se projevuje

**Řetězec v pořádku:**

- každý důkaz má jednoznačné označení a záznam o zajištění (kdo, kdy, kde, jak);
- každé předání je podepsané oběma stranami s časem a účelem;
- obal je zabezpečen proti neoprávněnému otevření a jeho stav je zapsán;
- digitální kopie má otisk ze zajištění i z analýzy a oba se shodují;
- úložiště má řízený přístup a záznam vstupů a výstupů.

**Typické vady:**

- porušené pečetě, chybějící podpisy v předávacím protokolu;
- nezdokumentované „vypůjčení“ důkazu vyšetřovatelem;
- uložení v prostředí bez auditu přístupu;
- snímek obrazovky bez data, adresy a metadat;
- analýza prováděná na originálu místo na ověřené kopii.

## Mechanismus

Řetězec úschovy převádí důvěru v osoby na **ověřitelnost záznamů**. Soud ani regulátor
nemusí věřit, že vyšetřovatel jednal poctivě; stačí, že každý krok je zachycen tak, aby
bylo možné jej zpětně přezkoumat. Proto je řetězec úschovy epistemickým nástrojem: chrání
důkaz před zpochybněním a zároveň chrání toho, kdo důkaz předkládá, před obviněním
z manipulace.

## Odlišení

- **Pravost a věrohodnost.** Řetězec úschovy prokazuje, že důkaz je *tentýž* a *nezměněný*;
  neříká nic o tom, zda je jeho obsah pravdivý. Obsah se hodnotí zvlášť.
- **Dokumentace vyšetřování.** Je širší: zahrnuje i postup, hypotézy a rozhodnutí (viz
  [Forenzní dokumentace](@/kompendium/forensic-legal/10-forensic-documentation.md)).
- **[Forensic interview](@/glossary/forensic-interview.md).** Sesterský postup pro výpovědní
  důkazy: i u výpovědi je třeba doložit, jak byla získána a zaznamenána.

## Význam pro Kompendium

V oblasti epistemické anihilace mají řetězec úschovy dvojí význam:

1. **Obrana oběti.** Lidé vystavení [gaslightingu](@/glossary/gaslighting.md) nebo
   [coercive control](@/glossary/coercive-control.md) často nemají jak doložit, co se stalo,
   protože druhá strana zpochybňuje jejich paměť. Vedení datovaných záznamů, uchovávání
   originálů zpráv a jejich bezpečné uložení je praktickou formou řetězce úschovy (viz
   [Archiv vzpomínek](@/kompendium/self-defense-guides/43-memory-archive.md) a [Uchování
   důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md)).
2. **Odolnost proti zpochybnění.** Útoky typu [DARVO](@/glossary/darvo.md) se často
   zaměřují na údajnou „zmanipulovanost“ důkazů. Doložený řetězec úschovy tento útok
   neutralizuje.

Kapitola [Řetězec úschovy důkazů](@/kompendium/forensic-legal/7-evidence-chain-of-custody.md)
rozvádí postup pro forenzní a právní praxi; technika [EA-4.2.7 Documentation chain of
custody](@/kompendium/techniques/ea-4-2-7-documentation-chain-custody.md) jej uplatňuje
v rámci ochranných protokolů. Pro elektronické důkazy viz [Elektronické
důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md).

## Praktické použití

- **Due diligence při fúzích a akvizicích:** řetězec úschovy upravuje, jak se mezi
  advokáty, poradci a budoucím kupujícím předávají exporty z datové místnosti, podepsané
  smlouvy a pracovní podklady forenzního účetnictví.
- **OSINT šetření:** určuje, jak se zachycují veřejně dostupná data (časově označené
  odpovědi HTTP, archivy WARC, snímky obrazovky s vloženými metadaty), aby se dala obhájit
  navazující zjištění.
- **Reakce na incidenty:** upravuje nakládání s obrazy disků, výpisy paměti a exporty
  logů, které mohou později podpořit trestní oznámení.

Praktickým minimem je obal s ochranou proti neoprávněnému otevření, podepsaný předávací
protokol, otisk při zajištění, otisk při analýze a úložiště s řízeným přístupem a záznamem
vstupů a výstupů.

## Literatura

- Federal Rules of Evidence, Rule 901 – Authenticating or Identifying Evidence (USA).
- ISO/IEC 27037:2012 – *Guidelines for identification, collection, acquisition and
  preservation of digital evidence*.
- Zákon č. 141/1961 Sb., o trestním řízení soudním (trestní řád), ustanovení o důkazech
  (§ 89 a násl.).
- Richard Saferstein: *Criminalistics: An Introduction to Forensic Science* (Pearson,
  řada vydání).

## Související

**Pojmy**

- [Due Diligence](@/glossary/due-diligence.md) – postup, v němž je řetězec úschovy povinný.
- [Forensic Interview](@/glossary/forensic-interview.md) – sesterský postup pro výpovědní
  důkazy.
- [Expert Witness](@/glossary/expert-witness.md) – znalec, který řetězec úschovy dokládá
  před soudem.
- [Pattern Evidence](@/glossary/pattern-evidence.md) – důkaz vzorcem, který stojí na
  souboru doložených jednotlivostí.

**Forenzní a právní praxe**

- [Řetězec úschovy důkazů](@/kompendium/forensic-legal/7-evidence-chain-of-custody.md) –
  podrobný postup.
- [Uchování důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md) – jak důkazy
  zajistit včas.
- [Elektronické důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md) –
  specifika digitálních stop.
- [Archiv vzpomínek](@/kompendium/self-defense-guides/43-memory-archive.md) – svépomocná
  podoba řetězce úschovy pro dotčené.
