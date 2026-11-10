+++
title = "Učení po incidentu"
description = "Bez systematického rozboru se organizace vrací ke stejným chybám a útoky stejnými cestami. Kapitola popisuje rozbor bez hledání viníka, odpovědnost, databázi poučení a kontrolu opatření."
weight = 400

[taxonomies]
tags = ["kompendium", "organizational-defense", "crisis"]
categories = ["academic", "organizational", "governance"]

[extra]
related_terms = ["31-incident-response-EA", "39-cultural-rebuild", "21-decision-traceability", "8-policy-review-cycles"]
toc = true
+++

# Učení po incidentu

> **Pilíř:** Krizová reakce · **Oddíl:** [Organizační obrana](@/kompendium/organizational-defense/_index.md)

Organizace, která po incidentu řekne „je to za námi“, se obvykle za dva roky setká s tím
samým. Epistemické útoky se vracejí stejnými cestami, protože tyto cesty zůstaly otevřené:
kontrolní mechanismus, který selhal, vedoucí, který neviděl, kanál, kterým se signál
nedostal nahoru. Učení po incidentu je systematický rozbor toho, proč k incidentu došlo, proč
nebyl zachycen dřív a co se musí změnit. Je posledním krokem krizové reakce a prvním krokem
prevence.

## Riziko v daném prostředí

V letectví, energetice a zdravotnictví má rozbor incidentů dlouhou tradici; model „švýcarského
sýra“ Jamese Reasona (1990, 1997) ukazuje, že incident vzniká, když se zarovnají díry v
několika vrstvách obrany. Organizační epistemické incidenty se však rozebírají zřídka. Ve
firmě se uzavřou odchodem viníka, ve škole „vyřešením“ konkrétního případu, na univerzitě
disciplinárním rozhodnutím, ve veřejné správě politickým rozhodnutím, v médiích omluvou.
V neziskové organizaci se o selhání nemluví, aby se neohrozila důvěra dárců. Rizikem je, že
se zjistí, *kdo*, ale ne *jak* a *proč* – a že organizace přehlédne to, co Diane Vaughan
popsala jako normalizaci odchylek: postupné přivykání varovným signálům.

## Strukturální zranitelnosti

- Rozbor se nekoná nebo se omezí na hledání viníka.
- Rozbor vedou lidé, kteří byli do incidentu zapojeni.
- Poučení se nikam nezapíše; po odchodu účastníků se ztratí.
- Opatření se navrhnou, ale nikdo nesleduje jejich splnění.
- Organizace se nesdílí s ostatními a ostatní se nesdílejí s ní.

## Ochranné struktury

- Povinný rozbor po každém incidentu nad stanovenou závažnost, vedený osobou, která do
  incidentu nebyla zapojena.
- Rozbor bez hledání viníka zaměřený na systém: Které vrstvy obrany selhaly? Které signály
  existovaly a proč nevedly k akci? Co by příště pomohlo?
- Rozlišení systémové analýzy a osobní odpovědnosti: spravedlivá kultura (Dekker 2007)
  neodpouští úmyslné zneužití; rozbor bez hledání viníka se týká systému, zatímco odpovědnost
  jednotlivců řeší [interní vyšetřování](@/kompendium/organizational-defense/32-internal-investigation.md).
- Databáze poučení dostupná všem, kdo je potřebují, v anonymizované podobě.
- Čtvrtletní kontrola splnění opatření nejvyšším orgánem nebo
  [auditním výborem](@/kompendium/organizational-defense/5-audit-committee-EA.md).
- Zpráva pro zaměstnance (anonymizovaná), aby věděli, co se změnilo.

## Role a odpovědnosti

Vedoucí rozboru (nezávislý na incidentu) vede proces a píše zprávu. Účastníci incidentu
poskytují informace bez obav z postihu za chyby (s výjimkou úmyslu). Vlastníci opatření
odpovídají za jejich provedení. Správce databáze poučení zajišťuje dostupnost a
anonymizaci. Nejvyšší orgán kontroluje plnění. Dotčení mají možnost se k rozboru vyjádřit.

## Politiky a postupy

1. Kritéria, kdy je rozbor povinný.
2. Metodika rozboru: [časová osa](@/kompendium/forensic-legal/33-timeline-reconstruction.md),
   vrstvy obrany, signály, rozhodnutí a jejich podmínky.
3. Šablona zprávy: co se stalo, proč to nebylo zachyceno, co se změní, kdo a kdy.
4. Evidence opatření se stavem a termíny.
5. Navázání poučení na [revizi politik](@/kompendium/organizational-defense/8-policy-review-cycles.md),
   [vzdělávání](@/kompendium/organizational-defense/12-training-resilience.md) a
   [plán reakce na incident](@/kompendium/organizational-defense/31-incident-response-EA.md).

## Vzdělávání a trénink

Vedoucí rozborů se učí metodiku a facilitaci: jak klást otázky, které hledají podmínky, ne
viníky; jak pracovat s [konfirmačním zkreslením](@/glossary/konfirmacni-bias.md) a se
zkreslením zpětného pohledu („bylo to přece jasné“). Inspiraci nabízí
[debriefingový protokol](@/kompendium/techniques/ea-3-1-9-debriefing-protocol.md) a
[detekce selhání](@/kompendium/techniques/ea-4-1-6-failure-mode-detection.md). Všichni
zaměstnanci se učí, že sdílení vlastní chyby v rozboru je příspěvek, ne přiznání viny.

## Řešení incidentu

Postup rozboru:

1. Rozhodnutí o rozboru a výběr nezávislého vedoucího (po stabilizaci, ale do několika
   týdnů).
2. Sběr podkladů: dokumenty, záznamy, rozhovory s účastníky a dotčenými.
3. Rekonstrukce: co se dělo, které signály existovaly, kdo je viděl, co s nimi udělal.
4. Analýza vrstev obrany: struktura, kanály, kultura, lidé.
5. Návrh opatření s vlastníky a termíny; zpráva nejvyššímu orgánu a zaměstnancům.
6. Kontrola plnění po třech, šesti a dvanácti měsících.

**Příklad (anonymizovaný kompozit).** Rozbor po odhalení dlouholetého zastrašování v jednom
regionálním úřadu ukázal, že signály existovaly v pěti vrstvách: stížnosti občanů, odchody
úředníků, varování odborové organizace, nevysvětlené změny v zápisech a anonymní podnět.
Každá vrstva signál „vyřešila“ samostatně. Hlavním opatřením bylo zavedení společného
přehledu signálů, který čtvrtletně posuzuje nezávislá osoba.

## Ochrana dotčené osoby

Rozbor nesmí dotčené znovu poškodit: nesmí je nutit k opakovanému vyprávění, odhalovat
jejich identitu ani zpochybňovat jejich zkušenost. Pokud se jejich výpověď do rozboru
zahrnuje, děje se to s jejich souhlasem a v anonymizované podobě. Oznamovatelé, kteří na
incident upozornili, by měli dostat informaci o tom, co se změnilo – pro mnohé je to
důležitou součástí uzavření. Ochrana podle zákona č. 171/2023 Sb. platí i v období po
incidentu.

## Vyhodnocení a indikátory selhání

- Žádný rozbor, „je to za námi“, poučení nikde nezapsané, stejné chyby za dva roky.
- Rozbor skončí nalezením viníka.
- Opatření se nesplní a nikdo to nekontroluje.
- Databáze poučení existuje, ale nikdo ji nečte.

Metriky: podíl incidentů s rozborem, podíl splněných opatření v termínu, počet opakovaných
incidentů stejného typu.

## Meze a otevřené otázky

Rozbor bez hledání viníka může být zneužit k zakrytí osobní odpovědnosti; proto se odděluje
od vyšetřování. Zpětný pohled zkresluje a vytváří iluzi, že vše bylo předvídatelné.
Sdílení poučení s jinými organizacemi naráží na obavy o pověst. Otevřené zůstává, jak se
učit z „téměř incidentů“, které nikdo nezaznamenal, a jak systémovou analýzu propojit s
přístupy, které nabízí [systémová teorie](@/kompendium/critical-perspectives/21-systems-theory-alternative.md).

## Související

**Sesterské kapitoly**

- [Reakce na incident s EA fokusem](@/kompendium/organizational-defense/31-incident-response-EA.md)
  – krizová fáze před rozborem.
- [Kulturní obnova](@/kompendium/organizational-defense/39-cultural-rebuild.md) – dlouhodobá
  práce s poučením.
- [Sledovatelnost rozhodnutí](@/kompendium/organizational-defense/21-decision-traceability.md)
  – podklady rozboru.
- [Cykly revize politik](@/kompendium/organizational-defense/8-policy-review-cycles.md) –
  kam se poučení promítají.

**Techniky**

- [EA-3.1.9 Debriefingový protokol](@/kompendium/techniques/ea-3-1-9-debriefing-protocol.md)
  – struktura rozboru.
- [EA-4.1.6 Failure mode detection](@/kompendium/techniques/ea-4-1-6-failure-mode-detection.md)
  – hledání míst selhání.

**Zotavení a kritika**

- [Dlouhodobá kultivace resilience](@/kompendium/recovery-protocols/longterm-resilience-cultivation.md)
  – odolnost jako výsledek učení.
- [Systémová teorie jako alternativa](@/kompendium/critical-perspectives/21-systems-theory-alternative.md)
  – systémový pohled na selhání.
