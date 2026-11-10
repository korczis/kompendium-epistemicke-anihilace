+++
title = "Archer Supreme"
weight = 13
description = "Agent nejvyššího oprávnění L5 na Prismatic Platform pro krizové zásahy a „nemožné mise“: neomezený přístup ke zdrojům, přepsání nižších agentů, povinný audit."

[taxonomies]
tags = ["glossary", "agents", "prismatic", "aiad"]

[extra]
category = "agents"
abbreviation = "ARCHER"
domain = "strategic-command"
complexity = "advanced"
maturity = "production"
platform_version = "8.0.0"
generation = 19
enforcement_level = "supreme"
authority_level = "L5"
call_sign = "ARCHER"
related_terms = ["agent-tier", "supreme-commander", "aiad", "nm-nd", "agent-registry", "strategic-command", "violation-protocol", "nabla-infinity"]
platforms = ["elixir", "otp", "beam"]
use_cases = ["crisis-intervention", "impossible-mission-execution", "strategic-analysis", "milestone-intelligence", "cross-domain-coordination"]
mission_types = ["crisis-intervention", "impossible-objective", "strategic-analysis", "agent-override", "cross-domain-coordination"]
activation_channels = ["direct-command", "violation-escalation", "quality-emergency"]
teams_coordinated = ["gray-team", "red-team", "blue-team", "purple-team", "white-team", "black-team"]
author = "Tomas Korcak (korczis)"
date_modified = "2026-11-10"
+++

## Definice a přehled

**Archer Supreme** je [agent](@/glossary/agent.md) s nejvyšším oprávněním L5 (viz [Agent
Tier](@/glossary/agent-tier.md)), specializovaný na to, aby „nemožné“ cíle proměnil
v rutinní taktická vítězství. S neomezeným přístupem ke zdrojům platformy a oprávněním
přepsat všechny agenty nižších úrovní řeší krizové zásahy, provádění „nemožných misí“
a strategické analýzy, které vyžadují nejvyšší jistotu a rozhodné jednání. Působí pod
plným vynucením doktríny [NO MERCY, NO DOUBTS](@/glossary/nm-nd.md), podle níž musí být
každá mise dokončena s absolutní přesností, nebo se o ni vůbec nepokoušet.

Archer Supreme představuje vrchol hierarchie oprávnění agentů Prismatic Platform. Zatímco
agenti L1–L4 působí v ohraničených doménách s vymezenými schopnostmi, Archer Supreme tyto
hranice překračuje a řeší úkoly, které se týkají celé platformy. Jeho filozofie návrhu stojí
na nejvyšší taktické sebejistotě podložené přísnými standardy provedení – sebejistota podle
dokumentace není aroganci, je-li soustavně potvrzována výsledky. Každá mise sleduje formální
čtyřfázový protokol: taktické posouzení, uplatnění taktické brilance, nejvyšší provedení
a ověření vítězství.

Agent vznikl jako odpověď na třídu úkolů, které nezvládl žádný agent jedné domény:
průřezové krize zasahující více aplikací, strategické analýzy přes více než 20 milníků
v GitLabu a zdánlivě nemožné cíle, které vyžadují koordinaci zdrojů napříč celým umbrella
projektem (v době zápisu 115 aplikací). Jméno vyjadřuje přesnost (lučištník) a úroveň
oprávnění (nejvyšší) – chirurgickou přesnost s neomezeným oprávněním.

**Vztah ke knize:** Archer Supreme patří do kontextu platformy, z níž Kompendium vzešlo.
Jak agent koordinuje obranu proti technikám EA, popisuje stránka [Archer Supreme: orchestrace
EA](@/kompendium/aiad-integration/archer-supreme-ea-orchestration.md). Kniha sama přitom
upozorňuje na riziko, které takový model nese i v lidských organizacích: soustředění
neomezené moci do jednoho místa vyžaduje silný audit a vnější kontrolu (srov. [Kontrolní
výbor](@/kompendium/organizational-defense/5-audit-committee-EA.md)).

## Historický kontext a zaznamenané výsledky

Podle záznamů platformy je nejlépe zdokumentovaným výsledkem agenta komplexní analýza
20 milníků GitLabu a více než 102 issues, z níž vznikl dokument strategické zpravodajské
analýzy milníků. Analýza zařadila 6 aktivních milníků podle priority, zmapovala závislosti
mezi milníky a vytvořila čtyřfázový plán provedení na 12 týdnů. Žádný agent jedné domény
by ji nemohl provést, protože vyžadovala současné porozumění úložišti, bezpečnostním
operacím, infrastruktuře kvality, webovým rozhraním a koordinaci agentů.

Druhým zaznamenaným výsledkem bylo odstranění všech 905 bodů dluhu kvality
([QDP](@/glossary/qdp.md), viz [Quality Debt](@/glossary/quality-debt.md)) v 89 aplikacích
v jediném prodlouženém sezení. To vyžadovalo rozpoznat vzorce CASCADE – opakovaná porušení
téhož typu ve více aplikacích – a koordinovat dávkové opravy bez jediné regrese ve všech
13 doménách kvality. Výsledkem byl podle platformy první stav souladu s doktrínou ve všech
22 pilířích, udržovaný v dalších generacích průběžným sledováním strážcem minimální kvality
(*Quality Floor Guardian*).

Třetí zaznamenaná mise řešila vážný konflikt mezi agenty [Red Teamu](@/glossary/red-team.md)
a [Blue Teamu](@/glossary/blue-team.md) při bezpečnostním posouzení. Red Team odhalil možnou
epistemickou zranitelnost, ale obranná reakce Blue Teamu vytvářela falešné poplachy, které
blokovaly legitimní operace. Archer Supreme koordinoval s [Purple Teamem](@/glossary/purple-team.md)
syntézu obou pohledů a výsledkem byl zpřesněný bezpečnostní postoj, který zranitelnost
řešil bez narušení provozu.

## Technický rozbor

### Model oprávnění

Archer Supreme působí na úrovni L5, nejvyšší v klasifikaci [AIAD](@/glossary/aiad.md). To
mu dává schopnosti, které nemá žádný jiný agent:

| Schopnost | Rozsah | Omezení |
|-----------|-------|-------------|
| Přístup ke zdrojům | neomezený – všechny zdroje, databáze, API a souborové systémy platformy | povinná auditní stopa |
| Přepsání agentů | může přepsat rozhodnutí a akce kteréhokoli agenta L1–L4 | nemůže přepsat jiného agenta L5 |
| Eskalace porušení | porušení L4 spouštějí Supreme Review pod jeho oprávněním | musí vyřešit, nemůže odložit |
| Přepsání bran kvality | v nouzi může obejít standardní brány kvality | nouzové zdůvodnění a audit |
| Koordinace napříč doménami | může současně řídit agenty ve všech 16 doménách platformy | veškerá koordinace se zaznamenává |
| Nové vyjednání kontraktu | může zahájit nové vyjednání kontraktu Sparkline | stále nutné ověření White Teamem |

### Struktura definice AIAD

```yaml
# .aiad/agents/archer-supreme.agent.md
agent-spec:
  id: "archer-supreme"
  name: "Archer Supreme"
  version: "2.0.0"
  classification: "L5-SUPREME"
  domain: "strategic-command"
  call_sign: "ARCHER"
  authority:
    level: 5
    scope: ["unlimited"]
    override: ["L1", "L2", "L3", "L4"]
  capabilities:
    - "impossible-mission-execution"
    - "crisis-intervention"
    - "strategic-analysis"
    - "milestone-intelligence"
    - "cross-domain-coordination"
    - "quality-emergency-response"
    - "agent-override-authority"
  enforcement:
    doctrine: "no-mercy-no-doubts"
    version: "2.0.0"
    compliance: mandatory
  activation:
    command: "/archer-supreme"
    triggers: ["crisis", "impossible-objective", "strategic-analysis"]
```
### Protokol provedení mise

Archer Supreme sleduje u každé mise přísný čtyřfázový protokol. Žádnou fázi nelze vynechat
a každá musí splnit kritéria dokončení, než začne další:

| Fáze | Název | Popis | Kritéria dokončení |
|-------|------|-------------|-------------------|
| 1 | Supreme Tactical Assessment (taktické posouzení) | komplexní analýza problému, potřebných zdrojů a kritérií úspěchu | důvěra ≥ 0,80, zdroje určeny |
| 2 | Tactical Brilliance Application (návrh plánu) | vypracování plánu provedení s více záložními variantami | plán ověřen, záložní varianty definovány |
| 3 | Supreme Execution (provedení) | implementace s chirurgickou přesností a průběžným sledováním | všechny akce dokončeny, žádné regrese |
| 4 | Legendary Victory Validation (ověření výsledku) | ověření výsledků proti kritériím úspěchu s dokumentací | všechna kritéria splněna, zpráva vytvořena |

### Rámec důvěry

Archer Supreme pracuje s rámcem důvěry, který se přímo mapuje na epistemický systém [NABLA
Infinity](@/glossary/nabla-infinity.md); rozhodnutí tak stojí na důkazech a nejistota je
výslovně kvantifikována:

```elixir
defmodule PrismaticAgents.ArcherSupreme.Confidence do
  @moduledoc """
  Confidence assessment for Archer Supreme mission execution.
  Maps tactical confidence to NABLA epistemic thresholds.
  No mission proceeds without adequate confidence backed by
  Trinity Gate passage for critical operations.
  """

  @type confidence_level :: :supreme | :high | :moderate | :exploratory

  @spec assess(map()) :: {confidence_level(), float()}
  def assess(mission_context) do
    signals = gather_signals(mission_context)
    trinity_result = PrismaticNabla.TrinityGate.evaluate(signals)

    confidence = calculate_confidence(signals, trinity_result)

    cond do
      confidence >= 0.95 and trinity_result == :passed -> {:supreme, confidence}
      confidence >= 0.80 -> {:high, confidence}
      confidence >= 0.60 -> {:moderate, confidence}
      true -> {:exploratory, confidence}
    end
  end

  @spec calculate_confidence([map()], atom()) :: float()
  defp calculate_confidence(signals, trinity_result) do
    base = Enum.count(signals, & &1.verified) / max(length(signals), 1)
    trinity_bonus = if trinity_result == :passed, do: 0.1, else: 0.0
    min(base + trinity_bonus, 1.0)
  end

  defp gather_signals(context) do
    [
      %{source: :quality_dna, verified: context[:quality_score] >= 95},
      %{source: :test_suite, verified: context[:tests_passing] == true},
      %{source: :compilation, verified: context[:zero_warnings] == true},
      %{source: :resource_availability, verified: context[:resources_available] == true}
    ]
  end
end
```
## Architektura a implementace

### Mechanismus aktivace

Archer Supreme lze aktivovat třemi kanály s různou prioritou a charakterem odezvy:

```elixir
defmodule PrismaticAgents.ArcherSupreme.Activation do
  @moduledoc """
  Handles Archer Supreme activation through multiple channels.
  Each activation channel has distinct priority, context, and
  response time characteristics.
  """

  @spec activate(atom(), map()) :: {:ok, pid()} | {:error, term()}
  def activate(:direct_command, params) do
    with {:ok, mission} <- parse_mission(params),
         {:ok, assessment} <- assess_feasibility(mission) do
      PrismaticAgents.ArcherSupreme.Mission.start_link(mission, assessment)
    end
  end

  def activate(:violation_escalation, %{level: 4} = violation) do
    mission = %{
      type: :supreme_review,
      target: violation.source,
      context: violation,
      priority: :critical
    }
    PrismaticAgents.ArcherSupreme.Mission.start_link(mission)
  end

  def activate(:quality_emergency, %{score: score} = state) when score < 95 do
    mission = %{
      type: :quality_crisis,
      current_score: score,
      degradation: state.degradation_rate,
      priority: :emergency
    }
    PrismaticAgents.ArcherSupreme.Mission.start_link(mission)
  end

  defp parse_mission(params) do
    case Map.fetch(params, :mission) do
      {:ok, mission_type} -> {:ok, %{type: mission_type, params: params}}
      :error -> {:error, :missing_mission_type}
    end
  end

  defp assess_feasibility(mission) do
    case PrismaticAgents.ArcherSupreme.Confidence.assess(mission) do
      {:supreme, _} -> {:ok, :proceed}
      {:high, _} -> {:ok, :proceed_with_monitoring}
      {:moderate, _} -> {:ok, :proceed_with_caution}
      {:exploratory, _} -> {:error, :insufficient_confidence}
    end
  end
end
```
### Typy misí

| Typ mise | Spouštěč | Trvání | Příklad |
|-------------|---------|----------|---------|
| krizový zásah | nouzový stav kvality, výpadek produkce | minuty až hodiny | skóre kvality klesne pod 95 % |
| nemožný cíl | přímý příkaz se složitými požadavky | hodiny až dny | odstranit 905 položek QDP v jednom sezení |
| strategická analýza | revize milníků, posouzení architektury | hodiny | strategická analýza milníků GitLabu |
| přepsání agenta | porušení L4, protichůdné akce agentů | minuty | vyřešit protichůdná doporučení agentů |
| koordinace napříč doménami | úkol přes více aplikací vyžadující jednotné řízení | hodiny | odstranění vzorců CASCADE v celé platformě |

### Integrace s Color Teams

Při misích souvisejících s bezpečností koordinuje Archer Supreme všech šest [Color
Teams](@/glossary/color-teams.md) a slouží jako strategická velitelská vrstva nad veliteli
jednotlivých týmů:

```
Archer Supreme (L5 Authority)
  |
  +-- Gray Team (boundary exploration)
  |     +-- gray-explorer-commander (L3)
  |     +-- gray-edge-finder (L4)
  |     +-- gray-escalation-guard (L4)
  |
  +-- Red Team (adversarial simulation)
  |     +-- red-commander (L3)
  |     +-- red-epistemic-attacker (L2)
  |     +-- red-drift-inducer (L2)
  |     +-- red-scenario-generator (L2)
  |
  +-- Blue Team (epistemic defense)
  |     +-- blue-commander (L3)
  |     +-- blue-auth-sentinel (L2)
  |     +-- blue-drift-detector (L2)
  |     +-- blue-signal-aggregator (L2)
  |
  +-- Purple Team (synthesis and closure)
  |     +-- purple-coordinator (L3)
  |     +-- purple-mapper (L4)
  |     +-- purple-closure-analyst (L4)
  |     +-- purple-regression-guard (L4)
  |
  +-- White Team (constructive verification)
  |     +-- white-verifier-commander (L3)
  |     +-- white-contract-validator (L4)
  |     +-- white-invariant-prover (L4)
  |
  +-- Black Team (theoretical threat modeling)
        +-- black-theorist-commander (L3, ISOLATED)
        +-- black-abstraction-enforcer (L3, ISOLATED)
```
Každý barevný tým dostává při bezpečnostních operacích napříč týmy taktické pokyny od
Archer Supreme; syntetizačním uzlem pro zjištění všech ostatních týmů je Purple Team.

## Zprávy o misích

Každá mise vytváří formální zprávu, která dokumentuje taktické posouzení, provedené akce
a dosažené výsledky:

```elixir
defmodule PrismaticAgents.ArcherSupreme.Report do
  @moduledoc """
  Generates tactical mission reports for Archer Supreme operations.
  Reports are persisted to .claude/session-context/ for cross-session
  continuity and strategic intelligence accumulation.
  """

  @spec generate(map()) :: {:ok, String.t()} | {:error, term()}
  def generate(mission_result) do
    report = """
    ARCHER SUPREME - MISSION REPORT
    ================================
    Mission ID: #{mission_result.id}
    Classification: #{mission_result.type}
    Status: #{mission_result.status}
    Duration: #{format_duration(mission_result.duration)}

    TACTICAL ASSESSMENT
    -------------------
    Impossibility Rating: #{mission_result.impossibility}/10
    Confidence Level: #{mission_result.confidence}
    Trinity Gate: #{mission_result.trinity_status}

    EXECUTION SUMMARY
    -----------------
    Actions Taken: #{length(mission_result.actions)}
    Agents Coordinated: #{length(mission_result.agents_used)}
    Domains Affected: #{length(mission_result.domains)}

    RESULTS
    -------
    Objective Achieved: #{mission_result.objective_met}
    Quality Impact: #{mission_result.quality_delta}
    Regression Count: #{mission_result.regressions}

    VERDICT: #{verdict(mission_result)}
    """

    {:ok, report}
  end

  @spec verdict(map()) :: String.t()
  defp verdict(%{objective_met: true, regressions: 0}),
    do: "LEGENDARY VICTORY - Textbook tactical excellence."
  defp verdict(%{objective_met: true}),
    do: "VICTORY - Objective achieved with tactical precision."
  defp verdict(_),
    do: "ONGOING - Additional tactical assessment required."

  defp format_duration(ms) when is_integer(ms) do
    minutes = div(ms, 60_000)
    seconds = div(rem(ms, 60_000), 1000)
    "#{minutes}m #{seconds}s"
  end

  defp format_duration(_), do: "N/A"
end
```
## Oprávnění k přepsání a jeho správa

Oprávnění k přepsání je nejsilnější a nejpečlivěji spravovanou schopností agenta. Každé
přepsání je zaznamenáno, zdůvodněno a auditovatelné:

```elixir
defmodule PrismaticAgents.ArcherSupreme.Override do
  @moduledoc """
  Exercises L5 override authority over lower-tier agents.
  Every override is logged with full justification and context
  for post-mission audit and governance compliance.
  """

  @spec override_agent(String.t(), atom(), map()) :: {:ok, map()} | {:error, term()}
  def override_agent(agent_id, action, context) do
    with {:ok, agent_def} <- PrismaticAgents.Registry.lookup(agent_id),
         :ok <- verify_lower_tier(agent_def),
         :ok <- log_override(agent_id, action, context) do
      PrismaticAgents.execute_override(agent_id, action, context)
    end
  end

  @spec verify_lower_tier(map()) :: :ok | {:error, atom()}
  defp verify_lower_tier(%{authority: %{level: level}}) when level < 5, do: :ok
  defp verify_lower_tier(_), do: {:error, :cannot_override_supreme}

  @spec log_override(String.t(), atom(), map()) :: :ok
  defp log_override(agent_id, action, context) do
    :telemetry.execute(
      [:prismatic, :archer_supreme, :override],
      %{timestamp: DateTime.utc_now()},
      %{agent_id: agent_id, action: action, context: context}
    )
    :ok
  end
end
```
## Použití v Prismatic Platform

### Strategická analýza milníků

```bash
# Archer Supreme milestone analysis invocation
/archer-supreme --mission=strategic-analysis \
  --target=gitlab-milestones \
  --scope=all-active \
  --depth=comprehensive

# Output: Strategic intelligence document
# - 6 active milestones analyzed
# - 14 closed milestones cataloged
# - 102+ issues classified by priority
# - 4-phase execution plan generated
# - Cross-milestone dependency mapping
```
### Protokol řešení krize

```elixir
# Quality Floor Guardian escalation triggers Archer Supreme
defmodule PrismaticSafety.QualityFloorGuardian do
  @moduledoc """
  Monitors quality score and escalates to Archer Supreme
  when emergency thresholds are breached.
  """

  @spec handle_info(tuple(), map()) :: {:noreply, map()}
  def handle_info({:quality_check, score}, state) when score < 95 do
    Logger.emergency("Quality score #{score}/100 - EMERGENCY threshold breached")

    {:ok, _mission} = PrismaticAgents.ArcherSupreme.Activation.activate(
      :quality_emergency,
      %{score: score, degradation_rate: state.trend}
    )

    {:noreply, %{state | emergency_active: true}}
  end
end
```
### Převod nemožného cíle

```bash
# Convert an impossible objective into a tactical plan
/archer-supreme --mission=impossible-conversion \
  --objective="Eliminate all 905 QDP items across 89 apps in one session" \
  --constraints="zero regression, all tests passing" \
  --confidence=supreme

# Result: 905 QDP items eliminated
# - CASCADE patterns identified and batch-fixed
# - Zero regressions introduced
# - Quality score: doctrine-enforced (PERFECT)
# - All 13 quality domains: PASS
```
## Osvědčené postupy

1. **Vyhradit pro skutečné krize** – Archer Supreme je strategickým prostředkem. Nevolat jej
   na rutinní úkoly, které zvládnou agenti L1–L4. Nadužívání oslabuje jeho účinnost při
   krizích.
2. **Dokumentovat každou aktivaci** – každá mise vytváří auditní stopu. Zprávy je třeba
   procházet a hledat v nich vzorce, které pomohou budoucím krizím předejít.
3. **Respektovat rámec důvěry** – vrátí-li posouzení důvěry `:exploratory`, mise potřebuje
   před provedením další šetření. Nejvyšší jistotu nelze vynutit tam, kde je situace
   nejistá.
4. **Koordinovat, neřídit do detailu** – při koordinaci agentů nižších úrovní vydávat
   strategické pokyny a taktické podrobnosti nechat specialistům. Hierarchie agentů má svůj
   důvod.
5. **Analýza po misi** – po každém vyřešení krize provést retrospektivu, najít kořenové
   příčiny a předejít opakování. Vyřešená krize je vzorec, kterému je třeba předcházet.
6. **Respektovat auditní stopu** – každé přepsání, každé obejití brány kvality, každá
   nouzová akce musí být zaznamenány. Auditní stopa není byrokracie, ale správa.

## Časté chyby

- **Nadužívání:** aktivace na rutinní úkoly snižuje hodnotu krizových schopností a vytváří
  zbytečnou režii. Zvládne-li úkol agent L3, ať jej řeší L3.
- **Ignorování prahů důvěry:** pokračování s důvěrou `:moderate` u kritických misí riskuje
  selhání. Před vysoce rizikovými operacemi je třeba počkat na důvěru `:supreme` podloženou
  průchodem [Trinity Gate](@/glossary/trinity-gate.md).
- **Vynechání ověření ve fázi 4:** fáze ověření zachytí jemné regrese, které se projeví až po
  provedení všech změn. Nikdy ji nevynechávat, ani když se mise zdá úspěšná.
- **Přepsání bez auditu:** uplatnění oprávnění k přepsání bez řádného záznamu vytváří mezery
  ve správě. Každé přepsání musí být zdokumentováno se zdůvodněním a kontextem.
- **Předčasná eskalace:** ne každý problém vyžaduje zásah L5. Systém úrovní je navržen tak,
  aby se většina problémů vyřešila na L1–L3. Eskalovat na Archer Supreme jen tehdy, když
  nižší úrovně prokazatelně nestačí.

## Související pojmy

Bez vlastního hesla v glosáři knihy: *Quality Floor Guardian* – systém sledování, který
eskaluje na Archer Supreme.

## Související

**Platforma**

- [Agent Tier](@/glossary/agent-tier.md) – úroveň L5 Supreme.
- [Supreme Commander](@/glossary/supreme-commander.md) – agent L5 pro strategickou
  koordinaci celé platformy.
- [AIAD](@/glossary/aiad.md) – standard definic, jímž se agent řídí.
- [Violation Protocol](@/glossary/violation-protocol.md) – porušení L4 eskalují do Supreme
  Review.
- [NM/ND Doctrine](@/glossary/nm-nd.md) – rámec vynucení všech operací nejvyšší úrovně.
- [Strategic Command](@/glossary/strategic-command.md) – koordinační vrstva řízená agenty
  L5.
- [Agent Registry](@/glossary/agent-registry.md) – katalog, v němž je agent registrován.
- [NABLA Infinity](@/glossary/nabla-infinity.md) – epistemický rámec posouzení důvěry.

**Kompendium**

- [Archer Supreme: orchestrace EA](@/kompendium/aiad-integration/archer-supreme-ea-orchestration.md)
  – role agenta v obraně proti technikám EA.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: archer-supreme](@/kompendium/glossary-bridges/bridge-archer-supreme.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
