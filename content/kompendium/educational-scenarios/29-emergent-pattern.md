+++
title = "Vzdělávací scénář: Emergentní vzorec"
date = 2026-04-26
description = "Padesát jednotlivě nevinných záznamů ombudsmana: najít vzorec viditelný až v agregaci pomocí shlukování, časové korelace a anomálií a nepodlehnout iluzi shluku."
weight = 100
draft = false

[taxonomies]
tags = ["kompendium", "educational-scenario", "advanced", "agregace-dat"]

[extra]
level = "Advanced"
type = "educational-scenario"
+++

# Vzdělávací scénář: Emergentní vzorec

> **Úroveň**: Advanced
> **Učební cíl**: Identifikovat vzorec, který je viditelný teprve při agregaci dat, a ověřit, že nejde o artefakt analýzy
> **Doporučená délka**: 180 minut (práce s datovým souborem)
> **Pro koho**: ombudsmani, compliance a interní audit, analytici, výzkumníci, členové etických komisí

Některé vzorce nejsou vidět zblízka. Každý jednotlivý incident má rozumné vysvětlení:
odklad termínu, změna školitele, nedorozumění o autorství, „osobní důvody“ odchodu. Teprve
když se padesát takových záznamů položí vedle sebe, ukáže se, že se soustřeďují kolem stejných
míst, lidí a období. Zároveň platí opak: lidský mozek nachází vzorce i v náhodě. Scénář učí obojí –
**najít emergentní vzorec a ověřit, že je skutečný** – a navazuje na
[koordinaci na více cílech](@/kompendium/educational-scenarios/28-multi-target-coordination.md),
kde byl vzorec patrný už z kvalitativního srovnání.

## Učební cíle

Účastník po cvičení:

1. převede nestrukturované záznamy na analyzovatelné proměnné (kdo, kde, kdy, jaký typ
   události, jak skončila);
2. použije tři jednoduché analytické přístupy: shlukování podle místa a aktérů, časovou
   korelaci a vyhledání anomálií vůči základní míře;
3. rozpozná zdroje falešných vzorců: rozdílnou velikost jednotek, zkreslení v ohlašování,
   vícenásobné srovnávání a iluzi shluku (hledání terče kolem díry po kulce);
4. formuluje zjištění jako hypotézu k ověření, ne jako obvinění, a navrhne další kroky instituce.

## Scénář

Kancelář akademického ombudsmana velké univerzity má za šest let padesát záznamů (smyšlených,
anonymizovaných a synteticky připravených). Žádný nevedl k formálnímu řízení. Typické záznamy:
„doktorandka žádá o změnu školitele z osobních důvodů“, „spor o pořadí autorů vyřešen dohodou“,
„student přerušil studium, uvádí vyhoření“, „stížnost na nevhodný tón na semináři, vzata zpět“.

Účastníci dostanou tabulku se záznamy a s doplňkovými údaji: fakulta, ústav, pracovní skupina
(anonymizovaný kód), typ události, datum, výsledek, a počet doktorandů v každé jednotce (pro
výpočet základní míry).

Postup v týmech:

1. **Kódování (40 min)** – sjednotit typy událostí do kategorií; rozhodnout, co je „stejný typ“.
2. **Shlukování (40 min)** – kde se události soustřeďují? Výpočet míry na sto doktorandů,
   nikoli absolutních počtů.
3. **Časová analýza (30 min)** – změnil se výskyt v čase? Souvisí změny s personálními
   událostmi (nástup vedoucího, reorganizace)?
4. **Kontrola artefaktů (30 min)** – mohl by vzorec vzniknout jinak?
5. **Závěr (40 min)** – jednostránková poznámka pro rektora.

Data obsahují jeden skutečný vzorec (jedna pracovní skupina s výrazně zvýšenou mírou změn
školitele a přerušení studia po nástupu nového vedoucího) a jeden falešný (fakulta s mnoha
záznamy, která je prostě největší a má aktivní studentskou radu, jež k ombudsmanovi studenty
posílá).

## Signály, kterých si všimnout

- **Shluk nad základní mírou** – výskyt v jednotce výrazně převyšuje očekávání podle její
  velikosti.
- **Časový zlom** – změna výskytu navazuje na identifikovatelnou událost.
- **Různé kategorie, stejný uzel** – přerušení studia, změny školitele a spory o autorství se
  sbíhají u téže skupiny; srovnej [vzorcový důkaz](@/glossary/pattern-evidence.md).
- **Vzaté zpět stížnosti** – samy o sobě neznamenají nic; v kombinaci se změnami školitele
  mohou ukazovat na strach z odvety.
- **Eufemismy v záznamech** – „osobní důvody“, „vyhoření“ opakované u jedné jednotky; srovnej
  [sémantická eroze](@/kompendium/detection-signatures/8-linguistic-semantic-erosion.md).
- **Zkreslení ohlašování** – více záznamů tam, kde je ombudsman známější, ne kde je víc problémů.

## Diskusní otázky

1. Který shluk obstál po přepočtu na základní míru a který zmizel?
2. Jak velké musí být odchýlení, abyste ho brali vážně? Proč je nebezpečné rozhodnout to až
   po pohledu na data?
3. Kolik srovnání jste provedli a jak to ovlivňuje pravděpodobnost, že jeden shluk vyjde
   „náhodou“?
4. Jak odlišit systémový problém (kultura pracoviště) od působení konkrétní osoby?
5. Co sdělit rektorovi, aby zjištění vedlo k šetření, ale nepoškodilo předem nikoho konkrétního?
6. Jak upravit sběr dat, aby příště byl vzorec vidět dřív?

## Modelové odpovědi

- **K otázce 1.** Největší fakulta má nejvíc záznamů, ale po přepočtu je průměrná; její
  „vzorec“ vytvořila velikost a ohlašovací kultura. Pracovní skupina s novým vedoucím má
  míru několikanásobně vyšší a časový zlom.
- **K otázce 2.** Práh by měl být stanoven před analýzou. Kdo ho určí až po pohledu na data,
  snadno nakreslí terč kolem nejbližšího shluku. Ideálně se hypotéza ověří na nových datech;
  srovnej [pre-registraci](@/kompendium/research-methodology/pre-registration-EA-research.md).
- **K otázce 3.** Při desítkách jednotek a několika kategoriích je pravděpodobné, že některý
  shluk vyjde nápadně jen náhodou. Proto mají větší váhu vzorce, které se sbíhají ve více
  nezávislých ukazatelích a mají časový zlom; viz [kauzální inference](@/kompendium/research-methodology/causal-inference-EA.md).
- **K otázce 4.** Systémový problém se projeví napříč jednotkami se společným rysem (financování,
  pravidla); osobní působení se váže na konkrétní osobu a sleduje ji i při přesunu. Data to
  mohou naznačit, rozhodnout musí šetření.
- **K otázce 5.** Popsat vzorec, jeho sílu a meze, alternativní vysvětlení a doporučit
  nezávislé šetření s ochranou studentů. Nejmenovat osobu jako viníka; viz
  [interní vyšetřování](@/kompendium/organizational-defense/32-internal-investigation.md).
- **K otázce 6.** Jednotné kódování záznamů, evidence velikosti jednotek, pravidelný přehled
  a [anonymní zpětná vazba](@/kompendium/organizational-defense/14-anonymous-feedback.md)
  s [exit interview](@/kompendium/organizational-defense/13-exit-interview-EA.md) jako doplňkový zdroj.

## Časté chyby

- **Absolutní čísla.** Bez základní míry vítězí velikost jednotky.
- **Práh po faktu.** Hranice „nápadnosti“ stanovená až podle dat.
- **Kauzalita z korelace.** Časový zlom podporuje hypotézu, ale nedokazuje příčinu.
- **Nálepka na osobu.** Statistický vzorec se ve zprávě promění v obvinění.
- **Zahození kvalitativních dat.** Text záznamů obsahuje informace, které tabulka ztratí.

## Debriefing pro facilitátora

Nechte týmy nejprve odhalit falešný vzorec (velká fakulta) – je to nejcennější moment
scénáře. Teprve potom diskutujte skutečný. Zdůrazněte, že kvantitativní analýza je zde
nástrojem pro to, *kde* se dívat, ne pro to, *co* se stalo.

Datový soubor je syntetický, ale připomíná skutečné záznamy; připomeňte zásady ochrany
osobních údajů a minimalizace dat při práci s reálnými záznamy; viz
[datová bezpečnost výzkumu](@/kompendium/research-methodology/data-security-EA-research.md).

## Rozšiřující úkoly

1. **Vlastní data.** Navrhněte kódovací schéma pro záznamy, se kterými pracujete (stížnosti,
   incidenty, exit interview).
2. **Přenos do compliance.** Prostudujte [AML: pattern recognition](@/kompendium/cross-domain/28-ea-compliance-aml-pattern-recognition.md)
   a porovnejte jeho metody se scénářem.
3. **Případová studie.** Přečtěte si [výzkumnou laboratoř jako kult](@/kompendium/case-studies/35-research-lab-cult.md)
   a zvažte, které stopy by se objevily v datech ombudsmana.

## Související

**Navazující scénáře**

- [Koordinace na více cílech](@/kompendium/educational-scenarios/28-multi-target-coordination.md) – kvalitativní podoba téže úlohy.
- [Koordinace botů](@/kompendium/educational-scenarios/17-bot-coordination.md) – agregace v síťových datech.
- [Zkreslení v peer review](@/kompendium/educational-scenarios/13-peer-review-bias.md) – akademické prostředí na úrovni instituce.

**Metodologie**

- [Časové řady v EA monitoringu](@/kompendium/research-methodology/time-series-EA.md) – analýza časového zlomu.
- [Tematická analýza](@/kompendium/research-methodology/thematic-analysis-EA.md) – kódování textových záznamů.

**Organizační obrana**

- [Sledovatelnost rozhodnutí](@/kompendium/organizational-defense/21-decision-traceability.md) – data, která umožňují vzorec vidět.
- [Učení po incidentu](@/kompendium/organizational-defense/40-post-incident-learning.md) – co s výsledkem udělat.

**Glosář**

- [Pattern evidence](@/glossary/pattern-evidence.md) – vzorec jako důkaz.
- [Graph theory](@/glossary/graph-theory.md) – nástroje pro shlukování podle vztahů.
