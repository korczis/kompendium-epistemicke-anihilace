+++
title = "AutoHeal"
weight = 59
description = "Mechanismus automatické samoopravy Prismatic Platform: pět úrovní zásahu proti regresím kvality, ochrana jističem a validace každé opravy branami kvality."

[taxonomies]
tags = ["glossary", "evolution", "autoheal", "prismatic", "quality"]

[extra]
category = "evolution"
related_terms = ["autoevolve", "cascade", "cascade-pattern", "clean-run", "qdp", "self-healing", "supervisor", "circuit-breaker", "fault-tolerance", "let-it-crash", "mix", "dialyzer"]
author = "Tomas Korcak (korczis)"
quality_score = 77
date_modified = "2026-11-10"
+++

## Definice

**AutoHeal** je autonomní mechanismus samoopravy Prismatic Platform, který bez lidského
zásahu odhaluje a řeší regrese kvality, rozbité závislosti, posun konfigurace a selhání
kompilace. Pracuje s pětistupňovou hierarchií zásahů – od lehkého stanovení výchozího stavu
přes cílenou opravu až po úplnou obnovu platformy – a podle závažnosti zjištěného problému
uplatňuje stále razantnější nápravná opatření. Ztělesňuje závazek platformy k samoopravě
(*self-healing*): systém nemá své selhání jen odhalit, ale aktivně opravit.

AutoHeal se pojmově liší od [AutoEvolve](@/glossary/autoevolve.md), i když oba systémy úzce
spolupracují. AutoHeal je reaktivní – reaguje na zjištěné regrese a vrací platformu do
známého dobrého stavu. AutoEvolve je proaktivní – hledá příležitosti k optimalizaci
a posouvá platformu za její současný stav. Dohromady tvoří autonomní systém udržování
kvality: AutoHeal brání regresi, AutoEvolve pohání zlepšování.

Systém běží na hranicích sezení (povinně na začátku a na konci podle protokolu univerzální
autonomní evoluce) a na vyžádání, když sledování kvality zjistí anomálie. Každá oprava se
před přijetím ověřuje branami kvality, aby nevnesla nové problémy. Vzor jističe (*circuit
breaker*) brání kaskádovým selháním z opakovaných pokusů o opravu: po třech po sobě jdoucích
selháních se automaticky rozpojí a po 60 sekundách se automaticky obnoví.

**Vztah ke knize:** AutoHeal patří do kontextu platformy, z níž Kompendium vzešlo. Jeho
princip – nejprve stanovit výchozí stav, pak zasahovat přiměřeně závažnosti a každý zásah
ověřit – má obdobu ve fázovém přístupu krizové péče a zotavení, který kniha popisuje (viz
[Akutní stabilizace](@/kompendium/recovery-protocols/acute-stabilization-protocol.md)).
Jak AutoHeal opravuje regrese v detekci technik EA, popisuje stránka [AutoHeal: oprava
regresí EA](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md).

## Pět úrovní opravy

Hierarchie zásahů zajišťuje přiměřenou odezvu – drobné problémy dostanou lehké opravy,
kritická selhání spustí komplexní obnovu. Každá úroveň zahrnuje akce všech nižších úrovní.

### Úroveň 1: stanovení výchozího stavu

Základ fungování AutoHeal. Na začátku každého sezení zachytí aktuální stav kvality
platformy a vytvoří referenční bod, proti němuž lze regrese odhalit.

```bash
# Level 1: Baseline establishment (session start)
mix autoheal.baseline

# Actions performed:
# 1. Capture current compilation state (warnings, errors)
# 2. Record current quality score across all 13 domains
# 3. Snapshot Dialyzer PLT state
# 4. Record test suite pass/fail status
# 5. Store baseline in .claude/quality-dna/current-state.json
```
Výchozí stav se ukládá do systému perzistence *Quality DNA*, což umožňuje srovnání mezi
sezeními. Je-li výchozí stav na začátku sezení horší než na konci předchozího sezení,
AutoHeal okamžitě eskaluje na úroveň 2 k cílenému prošetření.

### Úroveň 2: cílená oprava

Když je zjištěna konkrétní regrese – nové varování kompilátoru, porušení Dialyzeru,
neúspěšný test –, úroveň 2 aplikuje cílenou opravu daného problému, aniž by narušila zbytek
platformy.

| Detekce | Reakce |
|-----------|----------|
| nové varování kompilátoru | najít zdroj, aplikovat vzor opravy CASCADE |
| porušení Dialyzeru | zkontrolovat Nuclear Cache; jde-li o fantom, opravit mezipaměť; je-li skutečné, najít nesoulad typů |
| neúspěšný test | najít změněný kód, ověřit regresi, případně obnovit |
| porušení Credo | aplikovat automatickou opravu formátování nebo refaktoring |

Cílené opravy jsou nejčastější akcí AutoHeal. Většina regresí kvality je omezena na
konkrétní soubory nebo moduly a lze ji vyřešit bez širšího zásahu.

### Úroveň 3: oprava podle vzorců

Když je zjištěno více souvisejících problémů, úroveň 3 je rozpozná jako výskyty známého
vzorce CASCADE a aplikuje opravu na úrovni vzorce současně na všech dotčených místech.

```elixir
# Level 3: Pattern-based healing example
# Detection: Multiple length() > 0 checks introduced across 3 modules
# Recognition: Empty Check CASCADE pattern
# Action: Apply O(1) replacement across all instances

defmodule AutoHeal.PatternHealer do
  @doc "Apply CASCADE pattern fix across all affected locations"
  def heal_pattern(:empty_check, locations) do
    Enum.each(locations, fn {file, line} ->
      apply_empty_check_fix(file, line)
    end)
    validate_all_fixes(locations)
  end
end
```
Oprava podle vzorců je účinnější než jednotlivé cílené opravy, protože řeší kořenovou
příčinu (opakující se antivzor), ne jednotlivé symptomy.

### Úroveň 4: oprava napříč doménami

Když problémy zasahují více aplikací umbrella projektu nebo sdílené závislosti, úroveň 4
koordinuje opravy přes hranice domén. Řeší situace, kdy oprava v jedné aplikaci vyžaduje
odpovídající změny v aplikacích na ní závislých.

Oprava napříč doménami je zvlášť důležitá v architektuře umbrella projektu, kde
(v době zápisu) 89+ aplikací sdílí společné protokoly, behaviours a adaptéry úložiště (viz
[Adapter Pattern](@/glossary/adapter-pattern.md)). Změna typu v `prismatic_storage_core`
může vyžadovat úpravu specifikací v desítkách závislých aplikací.

### Úroveň 5: úplná obnova platformy

Nejrazantnější úroveň zásahu, spouštěná, když skóre kvality platformy klesne pod nouzový
práh (< 95 %) nebo když opravy nižších úrovní opakovaně selhaly. Úplná obnova provede:

1. úplné zneplatnění mezipamětí (oprava Nuclear Cache podle CASCADE ve všech aplikacích);
2. úplnou rekompilaci platformy s `--force`;
3. úplné přebudování PLT Dialyzeru;
4. spuštění celé sady testů;
5. přepočet skóre kvality ve všech 13 doménách;
6. srovnání s uloženým výchozím stavem;
7. eskalaci k lidskému přezkumu, pokud obnova selže.

Úroveň 5 je časově i výpočetně nákladná, ale zaručuje návrat do známého dobrého stavu.
Odpovídá čistému restartu infrastruktury kvality platformy.

## Ochrana jističem

AutoHeal obsahuje vzor jističe, který brání kaskádovým selháním z opakovaných pokusů
o opravu. Bez této ochrany by trvalé selhání mohlo spustit nekonečnou smyčku pokusů, z nichž
každý by spotřeboval zdroje a mohl situaci zhoršit.

```elixir
# Circuit breaker behavior in AutoHeal
defmodule AutoHeal.CircuitBreaker do
  @failure_threshold 3      # Open after 3 consecutive failures
  @reset_timeout_ms 60_000  # Auto-reset after 60 seconds

  # States:
  # :closed    - Normal operation, repairs attempted
  # :open      - Repairs blocked, waiting for reset
  # :half_open - Testing single repair to see if issue resolved
end
```
| Stav | Chování | Přechod |
|-------|----------|------------|
| **Sepnutý** | běžný provoz; opravy se zkoušejí při detekci | rozpojí se po 3 po sobě jdoucích selháních |
| **Rozpojený** | opravy blokovány; selhání se zaznamenávají, ale neřeší | po 60 sekundách přejde do polootevřeného stavu |
| **Polootevřený** | povolen jediný zkušební pokus o opravu | při úspěchu se sepne, při selhání znovu rozpojí |

Jistič zajišťuje, že AutoHeal při trvalých problémech, které nelze automaticky vyřešit,
degraduje řízeně a nespotřebovává neomezené zdroje na marné pokusy.

## Integrace do životního cyklu sezení

AutoHeal je zapojen do GenServeru SessionLifecycle (v době zápisu 905 řádků
v `prismatic_claude`), který spravuje háčky všech povinných operací sezení (srov.
[Session Discipline](@/glossary/session-discipline.md)):

```elixir
# Session lifecycle AutoHeal integration
defmodule PrismaticClaude.SessionLifecycle do
  # Session start: establish baseline
  def handle_cast(:session_start, state) do
    AutoHeal.establish_baseline()
    {:noreply, state}
  end

  # Session end: run healing cycle
  def handle_cast(:session_end, state) do
    AutoHeal.run_cycle()
    {:noreply, state}
  end
end
```
| Fáze sezení | Akce AutoHeal | Příkaz |
|---------------|----------------|---------|
| **začátek** | stanovení výchozího stavu | `mix autoheal.baseline` |
| **průběh** | oprava na vyžádání (spuštěná sledováním kvality) | `mix autoheal.repair` |
| **konec** | úplný cyklus opravy | `mix autoheal.cycle` |

GenServer SessionLifecycle spravuje spouštění háčků s pořadím podle priority, ochranou
jističem a vysíláním telemetrie. Háčky spouštějí úlohy mix v izolovaných procesech
s ochranou časovým limitem, takže zaseknutá operace AutoHeal nemůže zablokovat sezení.

## Integrace se SEADF

AutoHeal působí jako jeden ze sedmi subsystémů rámce SEADF (*Self-Evolving Autonomous
Development Framework*):

| Subsystém SEADF | Role | Vztah k AutoHeal |
|-----------------|------|--------------------------|
| **Scanner** | detekce příležitostí | nachází problémy k opravě |
| **Pipeline** | koordinace provádění | řídí sledy oprav |
| **Quality Guardian** | nepřetržité sledování | spouští AutoHeal při regresi kvality |
| **Knowledge Sync** | perzistence mezi sezeními | ukládá výchozí stavy a historii oprav |
| **Cross-Domain Innovator** | hledání nových řešení | navrhuje nové strategie oprav |
| **Autonomous Reporter** | sdělování stavu | hlásí akce a výsledky AutoHeal |
| **Enhanced Healing** | sám AutoHeal | pětistupňová hierarchie zásahů |

Historie oprav se ukládá do Quality DNA, což umožňuje učení mezi sezeními. Pokud určitá
oprava soustavně řeší určitý typ regrese, AutoHeal ji u podobných budoucích regresí
upřednostní.

## Validace oprav

Každá oprava, bez ohledu na úroveň, musí před přijetím projít validací:

1. **kompilace:** `mix compile --warnings-as-errors` projde s nulou varování (viz [Clean
   Run](@/glossary/clean-run.md));
2. **typy:** `mix dialyzer` neohlásí žádné porušení;
3. **styl:** `mix credo --strict` neohlásí žádné porušení;
4. **testy:** projdou dotčené testy (úroveň 2) nebo celá sada (úrovně 4–5);
5. **skóre kvality:** skóre platformy je stejné nebo lepší než výchozí stav.

Opravy, které validací neprojdou, se vrátí a eskalují na další úroveň. Selže-li validace
i po obnově na úrovni 5, systém eskaluje k lidskému přezkumu s podrobnou diagnostickou
zprávou.

## Telemetrie a pozorovatelnost

AutoHeal vysílá strukturované telemetrické události o každé operaci:

```elixir
# Telemetry events emitted by AutoHeal
:telemetry.execute(
  [:prismatic_claude, :autoheal, :baseline_established],
  %{quality_score: 100, domains_clean: 13},
  %{session_id: session_id}
)

:telemetry.execute(
  [:prismatic_claude, :autoheal, :repair_applied],
  %{level: 2, duration_ms: 1500},
  %{pattern: :type_mismatch, file: "lib/some_module.ex"}
)

:telemetry.execute(
  [:prismatic_claude, :autoheal, :circuit_breaker_opened],
  %{failures: 3},
  %{reason: :persistent_dialyzer_failure}
)
```
Události jsou napojeny na systémy pozorovatelnosti a metrik platformy, takže je fungování
AutoHeal viditelné a vzorce oprav lze analyzovat zpětně.

## Související pojmy

Bez vlastního hesla v glosáři knihy: *CASCADE* a *CASCADE Pattern* (metodika a vzorce, podle
nichž AutoHeal opravuje), *Self-Healing*, *Circuit Breaker*, *Fault Tolerance*, *Let It
Crash* (filozofie Erlangu, která přístup AutoHeal doplňuje), *Supervisor*, *Dialyzer*
a *Mix*.

## Související

**Platforma**

- [AutoEvolve](@/glossary/autoevolve.md) – doplňkový proaktivní systém zlepšování.
- [Clean Run](@/glossary/clean-run.md) – standard nulových varování, který AutoHeal udržuje.
- [QDP](@/glossary/qdp.md) – metrika kvality, jejímuž hromadění AutoHeal brání.
- [Regression Test](@/glossary/regression-test.md) – testy, které regrese odhalují.
- [Adapter Pattern](@/glossary/adapter-pattern.md) – sdílené adaptéry, kvůli nimž je nutná
  oprava napříč doménami.

**Kompendium**

- [AutoHeal: oprava regresí EA](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md)
  – samooprava detekce technik EA.
- [Akutní stabilizace](@/kompendium/recovery-protocols/acute-stabilization-protocol.md) –
  lidská obdoba přiměřeného, fázového zásahu.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: autoheal](@/kompendium/glossary-bridges/bridge-autoheal.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
