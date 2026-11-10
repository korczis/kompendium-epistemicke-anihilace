+++
title = "Sledovatelnost rozhodnutí"
description = "Bez záznamu, kdo, kdy, proč a na základě čeho rozhodl, nelze nést odpovědnost ani se z chyb poučit. Kapitola popisuje záznamy rozhodnutí, registr, přezkum výsledků a ochranu záznamu."
weight = 210

[taxonomies]
tags = ["kompendium", "organizational-defense", "operational"]
categories = ["academic", "organizational", "governance"]

[extra]
related_terms = ["22-meeting-structure", "23-communication-policy", "24-documentation-standards", "40-post-incident-learning"]
toc = true
+++

# Sledovatelnost rozhodnutí

> **Pilíř:** Provoz · **Oddíl:** [Organizační obrana](@/kompendium/organizational-defense/_index.md)

„To se prostě rozhodlo“ je věta, za níž se skrývá ztráta odpovědnosti. Když nelze zjistit,
kdo rozhodl, kdy, na základě jakých informací a jaké alternativy zvažoval, nelze rozhodnutí
přezkoumat, poučit se z něj ani bránit se proti němu. Pro epistemický útok je taková mlha
ideální: dodatečně lze tvrdit cokoli – že se rozhodlo jinak, že to byl nápad někoho jiného,
že se o riziku nevědělo. Sledovatelnost rozhodnutí je proto paměť organizace, kterou nelze
přepsat.

## Riziko v daném prostředí

Ve veřejné správě je sledovatelnost do velké míry dána zákonem: správní řízení podle
zákona č. 500/2004 Sb., správního řádu, se vede ve spisu a rozhodnutí musí být odůvodněno.
Riziko leží mimo formální řízení – v přípravě koncepcí, zakázek a personálních rozhodnutí. V
nemocnici se klinická rozhodnutí zapisují do zdravotnické dokumentace, ale manažerská
rozhodnutí o personálu a provozu často nikoli. Ve firmě se strategická rozhodnutí dělají na
neformálních schůzkách, v redakci se rozhodnutí o stažení textu nezaznamenává. Ve škole a
na univerzitě jde o rozhodnutí o hodnocení, přijetí a disciplinárních věcech. Ve všech
prostředích hrozí vzorec, kdy se po selhání odpovědnost „rozpustí“ nebo
[přesune](@/glossary/blame-shifting.md) na nejslabší článek.

## Strukturální zranitelnosti

- Rozhodnutí vznikají v hovoru a nezapisují se.
- Zápisy neobsahují zdůvodnění ani zvažované alternativy.
- Podklady se mění po rozhodnutí; nelze zjistit, co rozhodovatel skutečně věděl.
- Neexistuje registr rozhodnutí; záznamy jsou rozptýlené v e-mailech.
- Nikdo neporovnává očekávané a skutečné výsledky rozhodnutí.

## Ochranné struktury

- Záznam rozhodnutí (decision record) pro rozhodnutí nad stanoveným významem s povinnými
  poli: kontext, zvažované alternativy, podklady a jejich verze, rozhodovatel, datum,
  očekávaný výsledek, nesouhlasy.
- Centrální registr rozhodnutí s vyhledáváním a s omezením úprav (nové verze, ne přepis).
- Archiv podkladů ve verzi, kterou rozhodovatel měl.
- Pravidelný přezkum: srovnání očekávaného a skutečného výsledku a rozbor odchylek.
- Napojení na [strukturu jednání](@/kompendium/organizational-defense/22-meeting-structure.md)
  a [komunikační politiku](@/kompendium/organizational-defense/23-communication-policy.md).

## Role a odpovědnosti

Rozhodovatel odpovídá za záznam nebo za to, že ho pořídí určený zapisovatel. Správce
registru (kancelář vedení, sekretariát) zajišťuje úplnost a uchování. Interní audit
testuje vzorky rozhodnutí, zda je lze zpětně rekonstruovat. [Auditní výbor](@/kompendium/organizational-defense/5-audit-committee-EA.md)
dostává přehled odchylek. Každý účastník rozhodování má právo, aby byl jeho nesouhlas
zapsán.

## Politiky a postupy

1. Definice rozhodnutí, která vyžadují záznam (finanční limit, dopad na lidi, výjimky z
   politik, strategické volby).
2. Šablona záznamu a lhůta pro jeho pořízení.
3. Pravidlo neměnnosti: oprava jen novou verzí s vysvětlením – viz
   [dokumentační standardy](@/kompendium/organizational-defense/24-documentation-standards.md).
4. Čtvrtletní přezkum vybraných rozhodnutí a povinný rozbor při výrazné odchylce.
5. Doba uchování a přístupová práva.

## Vzdělávání a trénink

Rozhodovatelé se učí psát krátké, ale úplné záznamy: proč, ne jen co. Důležité je zapsat
i to, co se nevědělo, a rizika, která se vědomě přijala. Vedoucí se učí, že záznam chrání i
je: kdo rozhodl v dobré víře s nejlepšími dostupnými informacemi, může to doložit.
Zapisovatelé se učí rozpoznat, kdy se v diskusi [posouvá rámování](@/kompendium/detection-signatures/4-linguistic-framing-shift.md)
nebo kdy je téma odsunuto bez rozhodnutí.

## Řešení incidentu

Je-li sporné, kdo a jak rozhodl (typicky po selhání):

1. Zajistit všechny záznamy, podklady, e-maily a kalendáře ve verzi z rozhodné doby –
   zásady [elektronických důkazů](@/kompendium/forensic-legal/35-electronic-evidence-EA.md).
2. [Rekonstruovat časovou osu](@/kompendium/forensic-legal/33-timeline-reconstruction.md):
   co kdo věděl a kdy.
3. Porovnat rekonstrukci s výpověďmi účastníků; rozpory jsou samy o sobě zjištěním.
4. Vyvodit závěry pro systém (chybějící záznam) i pro odpovědnost osob.

**Příklad (anonymizovaný kompozit).** Po neúspěšném projektu v jedné firmě vedení tvrdilo,
že tým riziko nikdy nehlásil. Vedoucí týmu měl e-mail s varováním, ale bez reakce. Teprve
zavedení registru rozhodnutí s polem „známá rizika“ způsobilo, že se taková varování
nemohla ztratit a že odpovědnost za přijaté riziko nesl ten, kdo ho přijal.

## Ochrana dotčené osoby

Pracovník, kterému se dodatečně přičítá rozhodnutí, které neučinil, nebo který je obviňován,
že „nic nehlásil“, potřebuje přístup k záznamům, aby se mohl bránit. Organizace mu ho musí
umožnit. Kdo upozorní na úpravy záznamů nebo podkladů, upozorňuje na možné protiprávní
jednání a může být chráněn podle zákona č. 171/2023 Sb. Zkušenost, kdy organizace popírá to,
co se prokazatelně stalo, má rysy [institucionálního gaslightingu](@/kompendium/detection-signatures/12-behavioral-gaslighting-pattern.md).

## Vyhodnocení a indikátory selhání

- Rozhodnutí „se prostě stalo“, nikdo neví kdo, kdy a proč, dokumenty jsou ztracené.
- Zápisy neobsahují zdůvodnění ani nesouhlas.
- Podklady se po rozhodnutí upravují.
- Přezkum výsledků se nekoná.

Metrika: podíl vzorku rozhodnutí, která lze plně rekonstruovat.

## Meze a otevřené otázky

Ne každé rozhodnutí potřebuje záznam; přebujelá byrokracie vede k obcházení. Záznam
nezachytí neformální vliv, který rozhodnutí předcházel. Otevřené zůstává, jak zaznamenávat
rozhodnutí v krizi, kdy je čas nejvzácnější – řešením je krátký záznam dodatečně, ale v
pevné lhůtě.

## Související

**Sesterské kapitoly**

- [Struktura jednání](@/kompendium/organizational-defense/22-meeting-structure.md) – kde
  rozhodnutí vznikají.
- [Komunikační politika](@/kompendium/organizational-defense/23-communication-policy.md) –
  kanály, které zanechávají stopu.
- [Dokumentační standardy](@/kompendium/organizational-defense/24-documentation-standards.md)
  – šablony a verzování.
- [Učení po incidentu](@/kompendium/organizational-defense/40-post-incident-learning.md) –
  záznamy jako podklad rozboru.

**Forenzní praxe**

- [Rekonstrukce časové osy](@/kompendium/forensic-legal/33-timeline-reconstruction.md) –
  postup zpětného dohledání.
- [Elektronické důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md) – zajištění
  digitálních záznamů.
- [EA-4.2.7 Documentation chain of custody](@/kompendium/techniques/ea-4-2-7-documentation-chain-custody.md)
  – nepřerušený řetězec záznamů.

**Pojmy a signatury**

- [Blame shifting](@/glossary/blame-shifting.md) – přesouvání odpovědnosti.
- [Gaslighting vzorec](@/kompendium/detection-signatures/12-behavioral-gaslighting-pattern.md)
  – popírání prokazatelného.
