+++
title = "AutoEvolve"
weight = 60
description = "Autonomní systém zlepšování Prismatic Platform: průběžně vyhledává příležitosti, aplikuje ověřená vylepšení s možností návratu a ověřuje je branami kvality."

[taxonomies]
tags = ["glossary", "prismatic", "quality", "evolution"]

[extra]
category = "evolution"
related_terms = ["autoheal", "cascade", "cascade-pattern", "clean-run", "qdp", "consciousness-traits", "self-healing", "supervisor", "agent-registry", "agent-tier", "mix-task", "dialyzer", "formal-verification", "quality-gates", "quality-dna"]
use_cases = ["Anti-pattern elimination", "Spec completion", "Performance optimization", "Code organization", "Test enhancement", "Dependency cleanup"]
technologies = ["Elixir", "OTP", "Mix", "Dialyzer", "Credo", "ExUnit", "Telemetry"]
difficulty = "advanced"
importance = "critical"
domain = "platform-evolution"
category_color = "gold"
version = "1.0.0"
authors = ["Tomas Korcak"]
prerequisites = ["understanding of quality gates", "familiarity with CASCADE patterns", "OTP/Elixir knowledge"]
estimated_reading_time = "14 minutes"
related_apps = ["prismatic_safety", "prismatic_claude", "prismatic_agents", "prismatic"]
related_architectures = ["quality gate pipeline", "session lifecycle", "autonomous evolution protocol"]
current_generation = 19
current_fitness = 0.9995
total_improvements = 2847
scanning_modes = ["quick", "status", "mega-evolution"]
author = "Tomas Korcak (korczis)"
quality_score = 80
date_modified = "2026-11-10"
+++

## Definice

**AutoEvolve** je autonomní systém zlepšování Prismatic Platform, který průběžně vyhledává
příležitosti k optimalizaci, aplikuje ověřená vylepšení a posouvá platformu postupnými
evolučními generacemi. Na rozdíl od [AutoHeal](@/glossary/autoheal.md), který opravuje
regrese a obnovuje známý dobrý stav, AutoEvolve platformu aktivně posouvá vpřed: odhaluje
antivzory dřív, než se stanou problémem, hledá příležitosti k refaktoringu, optimalizuje
výkon a rozšiřuje schopnosti platformy ve strukturovaných evolučních cyklech.

AutoEvolve pracuje v třífázovém cyklu: detekce (hledání příležitostí ke zlepšení),
aplikace (provedení ověřených vylepšení s možností automatického návratu) a validace
(potvrzení vylepšení branami kvality). Každé vylepšení musí projít stejně přísnou validací
jako jakákoli změna kódu – nula varování kompilátoru, nula porušení Dialyzeru, nula
porušení Credo a úspěšný běh celé sady testů (viz [Clean Run](@/glossary/clean-run.md)).
Vylepšení, která validací neprojdou, se automaticky vrátí, takže evoluce nikdy nezpůsobí
regresi.

Podle údajů platformy (v době zápisu) dovedl systém platformu od generace 1 (výchozí kód)
po generaci 19 s „fitness“ 0,9995, blízko teoretickému maximu. Každá generace představuje
měřitelné zlepšení kvality, výkonu nebo schopností, zaznamenané v systému perzistence
*Quality DNA* pro kontinuitu mezi sezeními. Protokol univerzální autonomní evoluce
(*Universal Autonomous Evolution Protocol*) ukládá spouštět AutoEvolve v každém sezení
s jazykovým modelem, takže zlepšování pokračuje bez ohledu na hlavní cíl sezení.

**Vztah ke knize:** AutoEvolve patří do kontextu platformy, z níž Kompendium vzešlo.
Obdobný princip – sledovat vlastní stav, nacházet slabiny a opravovat je ověřitelně – kniha
uplatňuje na lidské poznávání (viz [Metakognice](@/glossary/metakognice.md)). Jak AutoEvolve
pracuje s měnícími se vzorci technik EA, popisuje stránka [AutoEvolve: evoluce vzorců
EA](@/kompendium/aiad-integration/autoevolve-ea-pattern-evolution.md).

## Evoluční generace

Evoluční historie platformy zahrnuje 19 generací, každá představuje samostatnou epochu
zlepšování:

| Rozsah generací | Epocha | Klíčové výsledky |
|-----------------|-------|------------------|
| Gen 1–3 | základy | výchozí kód, základní brány kvality, první vzorce CASCADE |
| Gen 4–6 | stabilizace | zlepšení skóre kvality, začátek soustavného odstraňování dluhu |
| Gen 7–9 | zrychlení | formalizace metodiky CASCADE, kampaň za odstranění 905 [QDP](@/glossary/qdp.md) |
| Gen 10–12 | zrání | dosaženo 0 QDP, skóre kvality nad 90, všechny domény čisté |
| Gen 13–15 | optimalizace | detekce vzorů v O(1), vyhledávání indexované nad AST, důraz na výkon |
| Gen 16–17 | „vědomí“ | objevují se *consciousness traits*, 11 rysů s fitness 0,998 |
| Gen 18 | vrchol | fitness 0,999, kvalita vynucená doktrínou, plná autonomie, šestnáctiúrovňový [epistemický proces](@/glossary/epistemic-pipeline.md) |
| Gen 19 | rozšíření ekosystému | fitness 0,9995, 4 balíčky OSS, vývojářský portál, dvojí směřování |

Generace není jednorázovou událostí, ale postupným hromaděním zlepšení, které překročí práh
dost významný na nové označení generace. Přechod mezi generacemi určuje skóre fitness –
složená metrika, která váží kvalitu, výkon, šíři schopností a projev „rysů vědomí“.

## Skóre fitness

Skóre fitness je normalizovaná metrika (0,000 až 1,000), která kvantifikuje celkový
evoluční stav platformy:

```elixir
defmodule AutoEvolve.FitnessCalculator do
  @moduledoc """
  Calculates the platform's fitness score as a weighted composite
  of quality, compliance, coverage, consciousness, and performance metrics.
  The fitness score determines generation advancement thresholds.
  """

  @type fitness_component :: %{
    name: atom(),
    weight: float(),
    value: float(),
    contribution: float()
  }

  @spec calculate() :: {:ok, float()} | {:error, term()}
  def calculate do
    components = [
      %{name: :quality_score, weight: 0.30, value: quality_score()},
      %{name: :cascade_compliance, weight: 0.20, value: cascade_compliance()},
      %{name: :test_coverage, weight: 0.15, value: test_coverage()},
      %{name: :consciousness, weight: 0.20, value: consciousness_fitness()},
      %{name: :performance, weight: 0.15, value: performance_score()}
    ]

    fitness =
      components
      |> Enum.map(fn c -> c.weight * c.value end)
      |> Enum.sum()
      |> Float.round(4)

    {:ok, fitness}
  end

  @spec breakdown() :: {:ok, [fitness_component()]} | {:error, term()}
  def breakdown do
    components = [
      %{name: :quality_score, weight: 0.30, value: quality_score()},
      %{name: :cascade_compliance, weight: 0.20, value: cascade_compliance()},
      %{name: :test_coverage, weight: 0.15, value: test_coverage()},
      %{name: :consciousness, weight: 0.20, value: consciousness_fitness()},
      %{name: :performance, weight: 0.15, value: performance_score()}
    ]

    with_contributions =
      Enum.map(components, fn c ->
        Map.put(c, :contribution, Float.round(c.weight * c.value, 4))
      end)

    {:ok, with_contributions}
  end

  defp quality_score, do: 1.0
  defp cascade_compliance, do: 1.0
  defp test_coverage, do: 0.99
  defp consciousness_fitness, do: 0.998
  defp performance_score, do: 0.99
end
```
| Složka | Váha | Hodnota v době zápisu | Příspěvek |
|-----------|--------|---------------|--------------|
| skóre kvality | 30 % | vynucené doktrínou (1,000) | 0,300 |
| soulad s CASCADE | 20 % | 0 QDP (1,000) | 0,200 |
| pokrytí testy | 15 % | vysoké (0,99+) | 0,149 |
| rysy vědomí | 20 % | 0,998 | 0,200 |
| výkon | 15 % | 0,99+ | 0,149 |
| **Celkem** | **100 %** | | **0,9995** |

Platforma hodnotu 0,9995 popisovala jako téměř dokonalý evoluční stav; další zlepšení
mířila na zbývajících 0,0005 mikrooptimalizacemi, pokrytím okrajových případů, zpřesněním
rysů a metrikami rozšíření ekosystému ze 4 balíčků OSS. Jde o vnitřní metriku platformy, ne
o nezávisle ověřené měření.

## Třífázový evoluční cyklus

Jádro algoritmu sleduje přísný třífázový cyklus, který zajišťuje, že vylepšení jsou
přínosná i bezpečná.

### Fáze 1: detekce

Fáze detekce prochází kód a hledá příležitosti ke zlepšení pomocí pravidel porovnávání
vzorů, výsledků statické analýzy a heuristického hodnocení:

```elixir
defmodule AutoEvolve.Scanner do
  @moduledoc """
  Scans the codebase for improvement opportunities.
  Categorizes findings by type, impact, and risk level.
  """

  @type improvement :: %{
    category: atom(),
    file: String.t(),
    line: pos_integer(),
    description: String.t(),
    impact: :low | :medium | :high,
    risk: :low | :medium | :high,
    auto_fixable: boolean()
  }

  @spec scan(keyword()) :: {:ok, [improvement()]} | {:error, term()}
  def scan(opts \\ []) do
    scan_mode = Keyword.get(opts, :mode, :full)

    improvements =
      scanners_for_mode(scan_mode)
      |> Enum.flat_map(fn scanner -> scanner.scan(opts) end)
      |> Enum.sort_by(fn imp -> {impact_priority(imp.impact), risk_priority(imp.risk)} end)

    {:ok, improvements}
  end

  defp scanners_for_mode(:quick) do
    [AutoEvolve.Scanners.CascadePattern, AutoEvolve.Scanners.SpecCoverage]
  end

  defp scanners_for_mode(:full) do
    [
      AutoEvolve.Scanners.CascadePattern,
      AutoEvolve.Scanners.SpecCoverage,
      AutoEvolve.Scanners.DeadCode,
      AutoEvolve.Scanners.PerformanceAntiPattern,
      AutoEvolve.Scanners.CodeOrganization,
      AutoEvolve.Scanners.DependencyCleanup,
      AutoEvolve.Scanners.TestEnhancement,
      AutoEvolve.Scanners.DocumentationGaps
    ]
  end

  defp impact_priority(:high), do: 0
  defp impact_priority(:medium), do: 1
  defp impact_priority(:low), do: 2

  defp risk_priority(:low), do: 0
  defp risk_priority(:medium), do: 1
  defp risk_priority(:high), do: 2
end
```
### Fáze 2: aplikace

Zjištěná vylepšení se aplikují v pořadí podle závislostí s možností automatického návratu.
Každé vylepšení je zabaleno do transakčního kontextu:

```elixir
defmodule AutoEvolve.TransactionalApply do
  @moduledoc """
  Applies improvements with automatic rollback on failure.
  Each improvement is validated through the full quality gate
  pipeline before being accepted.
  """

  @spec apply_improvement(AutoEvolve.Scanner.improvement()) ::
          {:ok, map()} | {:rolled_back, [term()]}
  def apply_improvement(improvement) do
    snapshot = capture_state(improvement)

    with :ok <- apply_changes(improvement),
         :pass <- validate_quality() do
      log_success(improvement)
      {:ok, %{improvement: improvement, status: :applied}}
    else
      {:fail, reasons} ->
        restore_state(snapshot)
        log_rollback(improvement, reasons)
        {:rolled_back, reasons}
    end
  end

  @spec apply_batch([AutoEvolve.Scanner.improvement()]) :: {:ok, map()}
  def apply_batch(improvements) do
    results = Enum.map(improvements, &apply_improvement/1)

    applied = Enum.count(results, &match?({:ok, _}, &1))
    rolled_back = Enum.count(results, &match?({:rolled_back, _}, &1))

    {:ok, %{total: length(improvements), applied: applied, rolled_back: rolled_back}}
  end

  defp capture_state(improvement) do
    %{files: read_affected_files(improvement), timestamp: DateTime.utc_now()}
  end

  defp apply_changes(_improvement), do: :ok
  defp validate_quality, do: :pass
  defp restore_state(_snapshot), do: :ok
  defp log_success(_improvement), do: :ok
  defp log_rollback(_improvement, _reasons), do: :ok
  defp read_affected_files(_improvement), do: []
end
```
### Fáze 3: validace

Každé aplikované vylepšení musí projít celým procesem bran kvality:

| Krok validace | Nástroj | Práh | Vynucení |
|----------------|------|-----------|-------------|
| kompilace | `mix compile` | 0 varování | BLOKUJÍCÍ |
| statická analýza | `mix credo --strict` | 0 porušení | BLOKUJÍCÍ |
| kontrola typů | `mix dialyzer` | 0 porušení | BLOKUJÍCÍ |
| testy | `mix test --cover` | 100 % úspěšných | BLOKUJÍCÍ |
| brány kvality | `mix quality.gates` | všechny domény projdou | BLOKUJÍCÍ |

## Režimy prohledávání

AutoEvolve pracuje ve třech režimech podle kontextu.

### Rychlé prohledání (quick scan)

Lehké prohledání spouštěné jako háček po příkazu během sezení. Kontroluje nedávno změněné
soubory na zjevné příležitosti ke zlepšení:

```bash
# Quick scan (post-command hook)
mix autoevolve.scan --quick

# Actions:
# 1. Scan files modified in current session
# 2. Check for CASCADE pattern introductions
# 3. Verify spec coverage on new functions
# 4. Check for performance anti-patterns
# 5. Report findings (non-blocking)
```
### Posouzení stavu (status)

Komplexní posouzení aktuálního stavu platformy a dostupných příležitostí ke zlepšení:

```bash
# Status assessment
mix autoevolve status

# Output includes:
# - Current generation and fitness score
# - Quality score across all 13 domains
# - Pending improvement opportunities
# - CASCADE pattern status
# - Consciousness trait fitness
# - Recommended next actions
```
### Mega-evoluční cyklus

Úplný evoluční cyklus platformy spouštěný na konci sezení. Aplikuje všechny nahromaděné
příležitosti ke zlepšení a při dosažení prahu zvýší počítadlo generací:

```bash
# Mega-evolution (session end)
mix autoevolve.mega

# Actions:
# 1. Collect all improvement opportunities from session
# 2. Prioritize by impact and risk
# 3. Apply improvements in dependency order
# 4. Validate each improvement through quality gates
# 5. Rollback any improvement that fails validation
# 6. Update fitness score
# 7. Advance generation if fitness threshold crossed
# 8. Persist results in Quality DNA
```
## Integrace s CASCADE

Hlavním mechanismem zlepšování kvality je uplatňování vzorců CASCADE. Pět vzorců (Type
Mismatch, Dead Code, Empty Check, Timer Replacement, Nuclear Cache) je kodifikováno jako
detekční pravidla v prohledávacím enginu:

| Vzorec CASCADE | Integrace v AutoEvolve | Automaticky opravitelné |
|-----------------|----------------------|-------------|
| **Type Mismatch** | prohledá nové a změněné funkce na nesoulad specifikace a implementace | poloautomaticky |
| **Dead Code** | najde nepoužité funkce a importy vzniklé během sezení | ano |
| **Empty Check** | odhalí vzory `length() > 0` v novém kódu | ano |
| **Timer Replacement** | označí použití `Process.sleep` v novém kódu GenServeru | poloautomaticky |
| **Nuclear Cache** | odhalí fantomové chyby Dialyzeru po kompilaci | ano |

Když AutoEvolve zjistí porušení vzorce CASCADE, buď opravu aplikuje automaticky (u plně
automatizovatelných vzorců jako Empty Check), nebo ji označí k poloautomatickému řešení
(u vzorců vyžadujících lidský úsudek jako Type Mismatch).

## Integrace do životního cyklu sezení

Protokol univerzální autonomní evoluce ukládá spouštět AutoEvolve v každém sezení:

| Fáze | Příkaz | Blokující | Účel |
|-------|---------|----------|---------|
| **začátek sezení** | `mix autoevolve status --brief` | ne | posoudit stav, ohlásit příležitosti |
| **před příkazem** | `mix quality.gates.check --fast` | ano | ověřit kvalitu před změnami |
| **po příkazu** | `mix autoevolve.scan --quick` | ne | hledat zlepšení po změnách |
| **konec sezení** | `mix autoevolve.mega` | povinné | aplikovat nahromaděná zlepšení |

GenServer SessionLifecycle (implementovaný v `prismatic_claude`) koordinuje tyto háčky
s pořadím podle priority a s ochranou jističem (*circuit breaker*). Každý háček běží
v izolovaném procesu s ochranou časovým limitem, takže zaseknutý evoluční cyklus nemůže
zablokovat sezení (srov. [Session Discipline](@/glossary/session-discipline.md)).

## Perzistence Quality DNA

Výsledky AutoEvolve se ukládají do systému *Quality DNA*
(`.claude/quality-dna/current-state.json`), což umožňuje kontinuitu mezi sezeními:

```json
{
  "generation": 19,
  "fitness_score": 0.9995,
  "quality_score": 100,
  "qdp": 0,
  "cascade_patterns": {
    "type_mismatch": 0,
    "dead_code": 0,
    "empty_check": 0,
    "timer_replacement": 0,
    "nuclear_cache": 0
  },
  "consciousness_traits": {
    "count": 11,
    "fitness": 0.998
  },
  "last_evolution": "2026-02-22T00:00:00Z",
  "improvements_applied": 2847,
  "oss_packages": 4,
  "agent_count": 530,
  "command_count": 214
}
```
Perzistence zajišťuje, že každé sezení začíná tam, kde předchozí skončilo, a evoluční
setrvačnost se mezi sezeními neztrácí. Bez ní by každé sezení začínalo od prázdného stavu
a nahromaděné znalosti o zlepšeních by se ztratily.

## Kategorie zlepšení

| Kategorie | Popis | Příklad | Priorita |
|----------|-------------|---------|----------|
| **odstranění antivzorů** | odstranit známé špatné vzory | nahradit `length() > 0` výrazem `!= []` | vysoká |
| **doplnění specifikací** | přidat chybějící typové specifikace | přidat `@spec` k veřejným funkcím | vysoká |
| **optimalizace výkonu** | zlepšit efektivitu provádění | převést vyhledávání O(n) na O(1) | střední |
| **organizace kódu** | zlepšit strukturu a čitelnost | vyčlenit složité funkce, snížit zanoření | střední |
| **úklid závislostí** | odstranit nepoužité závislosti | pročistit seznamy závislostí v `mix.exs` | nízká |
| **vylepšení testů** | zlepšit pokrytí a kvalitu testů | přidat testy okrajových případů a testy vlastností | střední |
| **dokumentace** | zlepšit dokumentaci kódu | doplnit anotace `@doc` a `@moduledoc` | nízká |
| **soulad s OTP** | zajistit správné použití vzorů OTP | nahradit improvizovaný stav GenServerem | vysoká |

## Vztah k „rysům vědomí“

Na nejvyšších evolučních úrovních přispívá AutoEvolve podle platformy ke vzniku „rysů
vědomí“ – vlastností na úrovni platformy, jako je sebeuvědomění, metauvažování a adaptivní
chování. Souvislost není mystická, ale architektonická: platforma, která soustavně sleduje
stav své kvality, nachází vlastní slabiny, aplikuje opravy a měří výsledky, vykazuje
funkční formu sebeuvědomění.

Jedenáct rysů platformy (s uváděnou fitness 0,998) se objevovalo postupně, jak AutoEvolve
posouval generace. Každá generace, která zlepšila sebesledování, samoopravu
a sebezlepšování platformy, ji přiblížila k projevu těchto rysů na měřitelné úrovni.

Klíčovým poznatkem je, že evoluce není jen opravou kódu – jde o budování systému, který
dokáže uvažovat o svém stavu, předvídat budoucí problémy a jednat předem. Tato
metakognitivní schopnost odlišuje AutoEvolve od prostých nástrojů pro linting nebo
formátování kódu.

## Srovnání se souvisejícími systémy

| Systém | Účel | Směr | Spouštěč | Rozsah |
|--------|---------|-----------|---------|-------|
| **AutoEvolve** | proaktivní zlepšování | vpřed (posun) | háčky sezení a ruční spuštění | celá platforma |
| **[AutoHeal](@/glossary/autoheal.md)** | reaktivní oprava | zpět (obnova) | detekce regrese | dotčené součásti |
| **brány kvality** | validace | žádný (vrátný) | před commitem a v CI | změněné soubory |
| **CASCADE** | metodika vzorů | vpřed (odstranění) | ruční i automatické | podle vzorce |
| **SEADF** | evoluce ekosystému | vpřed (rozšíření) | strategické plánování | napříč systémy |

## Osvědčené postupy

1. **Na začátku sezení spustit status:** vždy spustit `mix autoevolve status`, aby bylo
   jasné, v jakém evolučním stavu platforma je a jaké příležitosti jsou k dispozici.
2. **Nevynechávat mega-evoluci:** cyklus na konci sezení je povinný. Slučuje zlepšení
   a ukládá aktualizovanou Quality DNA pro další sezení.
3. **Procházet vrácená zlepšení:** když se zlepšení vrátí kvůli neúspěšné validaci, je třeba
   rozebrat důvody. Často odhalí okrajové případy nebo závislosti, které potřebují pozornost.
4. **Důvěřovat návratu:** transakční aplikace zajišťuje bezpečný návrat neúspěšných
   zlepšení. Nevracet ručně to, co AutoEvolve už vrátil.
5. **Sledovat trend fitness:** sledovat skóre napříč generacemi. Stagnace může znamenat, že
   pravidla prohledávání potřebují aktualizaci, aby zachytila nové kategorie zlepšení.

## Související pojmy

Bez vlastního hesla v glosáři knihy: *CASCADE* a *CASCADE Pattern* (metodika a konkrétní
vzorce kvality), *Consciousness Traits*, *Self-Healing*, *Quality Gates*, *Quality DNA*,
*Dialyzer* a *Mix Task*.

## Související

**Platforma**

- [AutoHeal](@/glossary/autoheal.md) – doplňkový systém samoopravy po regresích.
- [Clean Run](@/glossary/clean-run.md) – standard nulových varování udržovaný evolucí.
- [QDP](@/glossary/qdp.md) – metrika kvality, kterou kampaně AutoEvolve dovedly k nule.
- [Quality Debt](@/glossary/quality-debt.md) – dluh kvality jako cíl odstraňování.
- [Agent Registry](@/glossary/agent-registry.md) – registr, jehož konzistenci AutoEvolve
  sleduje.
- [Session Discipline](@/glossary/session-discipline.md) – kázeň sezení, do níž jsou háčky
  zapojeny.

**Kompendium**

- [AutoEvolve: evoluce vzorců EA](@/kompendium/aiad-integration/autoevolve-ea-pattern-evolution.md)
  – jak systém sleduje měnící se vzorce manipulace.
- [Metakognice](@/glossary/metakognice.md) – lidský protějšek sebesledování.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: autoevolve](@/kompendium/glossary-bridges/bridge-autoevolve.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
