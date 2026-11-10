+++
title = "Epistemic security (epistemická bezpečnost)"
weight = 60

description = "Mezioborové pole, které studuje systémové hrozby pro kolektivní i individuální poznávání: dezinformace, manipulovaná média, správu platforem a integritu poznávacích procesů."

[taxonomies]
tags = ["glossary", "security", "epistemic", "kompendium"]

[extra]
category = "security"
related_terms = ["info-ops", "deepfake", "deplatforming", "firehose-of-falsehood", "epistemicka-anihilace", "nabla-infinity"]
author = "Tomáš Korcak (korczis)"
reading_time = "6 min"
word_count = 1050
date_created = "2026-04-25"
date_modified = "2026-11-10"
keywords = ["epistemic security", "epistemická bezpečnost", "informační bezpečnost", "dezinformace", "epistemická integrita", "kolektivní poznávání"]
quality_score = 84
see_also = ["kompendium", "epistemicka-anihilace"]
image = "/images/sections/glossary.png"
image_alt = "Epistemic security – glosář"
+++

## Definice

**Epistemická bezpečnost** (angl. *epistemic security*) je mezioborové pole, které vzniklo
koncem 10. let 21. století na pomezí kognitivní vědy, bezpečnostních studií, filozofie
informace a bezpečnosti umělé inteligence. Zabývá se **systémovými hrozbami pro kolektivní
i individuální schopnost utvářet poznání**. Lidský ekosystém vědění chápe jako kritickou
infrastrukturu srovnatelnou s elektrickou sítí, vodárenstvím nebo finančním systémem:
všudypřítomnou, nepostradatelnou a zranitelnou záměrným útokem, strukturálním úpadkem
i emergentním selháním.

Základním textem je zpráva Alan Turing Institute *Tackling Threats to Informed
Decision-Making in Democratic Societies* (Seger, Avin, Pearson a kol., 2020), která chápe
epistemickou bezpečnost jako podmínky, za nichž společnost dokáže spolehlivě **získávat
pravdivá přesvědčení, revidovat je podle důkazů a slučovat rozptýlené vědění**.

Kompendium v tomto rámci rozlišuje tři úrovně hrozeb:

- **mikroepistemické** – útoky na poznávání jednotlivce (manipulace,
  [gaslighting](@/glossary/gaslighting.md), zneužití přesvědčovacích mechanismů);
- **mezoepistemické** – útoky na instituce, které vědění vytvářejí (akademická obec,
  žurnalistika, soudní proces);
- **makroepistemické** – útoky na ekosystém jako celek (selhání správy platforem, zahlcení
  obsahem generovaným AI, [epistemická monokultura](@/glossary/epistemicka-monokultura.md)).

## Původ a kontext pojmu

Ústředním poznatkem oboru je, že **pravdivé informace nestačí**. Populace potřebuje funkční
*epistemickou infrastrukturu* – systémy ověřování kvalifikace, rozmanitost zdrojů, časem
prověřené heuristiky, kalibrované sítě důvěry, institucionální kontroly –, aby z informací
vzniklo vědění. Protivník může tuto infrastrukturu poškodit, aniž by vyslovil jediné
nepravdivé tvrzení: například útokem objemem ([Firehose of
Falsehood](@/glossary/firehose-of-falsehood.md)), útokem na kvalifikaci (delegitimizace
odborníků, viz [EA-2.1.3 Credentialing
Attack](@/kompendium/techniques/ea-2-1-3-credentialing-attack.md)) nebo zachycením
pozornosti (utopení signálu v šumu optimalizovaném na zapojení).

Epistemická bezpečnost se překrývá s kybernetickou bezpečností (chrání systémy),
informační bezpečností (chrání data) a moderací obsahu (posuzuje jednotlivé položky), ale
liší se od nich. Jejím vlastním předmětem je **integrita samotného procesu utváření
vědění**.

## Jak se projevuje

Znaky oslabené epistemické bezpečnosti v komunitě nebo organizaci:

- lidé se neshodnou ani na tom, *jak* by se sporná otázka dala ověřit;
- důvěra se polarizuje: buď slepá, nebo žádná;
- instituce, které měly spory rozhodovat, jsou plošně zpochybněny (viz
  [Delegitimizace](@/glossary/delegitimizace.md));
- informační prostor je zahlcen obsahem, jehož původ nelze doložit (viz
  [Deepfake](@/glossary/deepfake.md));
- rozhodnutí se dělají podle toho, co se nejvíc šíří, ne podle toho, co je doloženo.

## Mechanismus

Útoky na epistemickou bezpečnost obvykle nemíří na jednotlivá fakta, ale na **spojnice**
mezi lidmi, zdroji a institucemi: oslabují důvěru tam, kde má být, a vytvářejí ji tam, kde
být nemá. Ekosystém pak ztrácí schopnost opravovat vlastní chyby. Proto je obrana
jednotlivce proti technikám EA nutná, ale nestačí; bránit je třeba i okolní ekosystém.

## Odlišení

- **Kybernetická bezpečnost** – chrání technické systémy; epistemická bezpečnost chrání
  procesy poznání, které na nich běží.
- **Boj proti dezinformacím** – zaměřuje se na nepravdivý obsah; epistemická bezpečnost
  i na pravdivý obsah použitý ke zkreslení a na strukturu důvěry.
- **[Info-Ops](@/glossary/info-ops.md)** – informační operace jsou jednou z hrozeb, které
  obor studuje.
- **[Deplatforming](@/glossary/deplatforming.md)** – jeden z obranných zásahů, s vlastními
  náklady.

## Význam pro Kompendium

Epistemická bezpečnost je **makrorámcem**, v němž působí katalog technik Kompendia na
mikroúrovni. Samo [Kompendium](@/kompendium/_index.md) je artefaktem epistemické
bezpečnosti: taxonomií útočných technik proti individuálnímu a kolektivnímu poznávání,
určenou kvalifikovaným klinikům, výzkumníkům a bezpečnostním profesionálům. Kolektivní
rozměr podrobně rozvádí oddíl [Populační zdraví a prevence](@/kompendium/population-health/_index.md).

Na platformě, z níž kniha vzešla, je epistemická bezpečnost **organizujícím rámcem**, který
spojuje jinak nesourodé subsystémy:

- [NABLA Infinity](@/glossary/nabla-infinity.md) je proces epistemické bezpečnosti na
  úrovni platformy: invarianty rozmanitosti zdrojů, sledování falzifikovatelnosti, audity
  původu a křížové kontroly napříč modalitami společně vytvářejí vícevrstvou obranu proti
  katalogu technik EA;
- [Decision Engine](@/glossary/decision-engine.md) považuje integritu epistemického procesu
  za **prvořadý signál důvěry**: rozhodnutí je jen tak věrohodné, jak věrohodný je proces,
  který vytvořil jeho vstupy;
- [Color Teams](@/glossary/color-teams.md) převádějí doporučení oboru do praxe: [Red Team](@/glossary/red-team.md)
  simuluje útočníky, [Blue Team](@/glossary/blue-team.md) zpevňuje obranu, [Purple Team](@/glossary/purple-team.md) slučuje zjištění;
- hesla [Info-Ops](@/glossary/info-ops.md), [Deepfake](@/glossary/deepfake.md), [Firehose
  of Falsehood](@/glossary/firehose-of-falsehood.md) a [Deplatforming](@/glossary/deplatforming.md)
  se věnují jednotlivým podoblastem širšího pole.

## Obrana a zotavení

- **Jednotlivec:** rozmanitá informační strava, ověřování přes nezávislé zdroje, vědomé
  zacházení s pozorností (viz [Informační dieta](@/kompendium/self-defense-guides/33-information-diet.md)
  a [Rozpočet pozornosti](@/kompendium/self-defense-guides/34-attention-budget.md)).
- **Organizace:** dohledatelnost rozhodnutí, nezávislé kontrolní role, standardy
  dokumentace (viz [Dohledatelnost rozhodnutí](@/kompendium/organizational-defense/21-decision-traceability.md)).
- **Společnost:** mediální gramotnost, kvalita veřejné debaty, ochrana nezávislých institucí
  (viz [Prevence mediální gramotností](@/kompendium/prevention-resilience/6-media-literacy-prevention.md)).

## Literatura

- Elizabeth Seger, Shahar Avin, Gavin Pearson a kol.: *Tackling Threats to Informed
  Decision-Making in Democratic Societies: Promoting Epistemic Security in a
  Technologically-Advanced World* (The Alan Turing Institute, 2020).
- C. Thi Nguyen: „Echo Chambers and Epistemic Bubbles“, *Episteme* (2020).

## Související

**Pojmy**

- [Info-Ops](@/glossary/info-ops.md) – informační operace vojenského typu.
- [Deepfake](@/glossary/deepfake.md) – hrozba syntetických médií.
- [Deplatforming](@/glossary/deplatforming.md) – obranný zásah na úrovni platforem.
- [Firehose of Falsehood](@/glossary/firehose-of-falsehood.md) – technika útoku objemem.
- [Epistemic Bubble](@/glossary/epistemic-bubble.md) – strukturální zúžení informačního
  pole.
- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) – kategorie mikroepistemické
  újmy.
- [NABLA Infinity](@/glossary/nabla-infinity.md) – [epistemický proces](@/glossary/epistemic-pipeline.md) platformy.

**Prevence**

- [Populační zdraví a prevence](@/kompendium/population-health/_index.md) – kolektivní
  rozměr.
- [Prevence mediální gramotností](@/kompendium/prevention-resilience/6-media-literacy-prevention.md)
  – společenská obrana.
