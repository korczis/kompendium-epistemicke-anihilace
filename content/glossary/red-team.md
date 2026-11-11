+++
title = "Red Team (červený tým)"
weight = 19
description = "Tým útočné simulace v Prismatic Platform: pět primitiv epistemického útoku v izolovaném sandboxu se syntetickými daty slouží k ověření obrany."

[taxonomies]
tags = ["glossary", "prismatic", "color-teams", "security", "agents"]

[extra]
category = "security"
related_terms = ["color-teams", "blue-team", "purple-team", "nabla-infinity", "black-team", "gray-team", "tactical-execution", "white-team", "signal-plurality", "trinity-gate"]
difficulty = "advanced"
importance = "critical"
platform_relevance = "core"
date_created = "2025-06-15"
date_updated = "2026-02-22"
version = "3.0.0"
audience = ["security-engineers", "platform-architects", "ai-safety-researchers", "compliance-officers"]
prerequisites = ["color-teams", "nabla-infinity", "nm-nd", "aiad"]
domain = "security-operations"
related_patterns = ["adversarial-synthesis", "sandbox-isolation", "attack-taxonomy", "campaign-orchestration", "epistemic-validation"]
see_also = ["architecture/_index.md", "agents/_index.md", "technologies/_index.md", "capabilities/_index.md"]
acronyms = ["AIAD", "NM/ND", "NABLA", "OSINT", "CTF"]
standards = ["MITRE-ATT&CK", "OWASP", "NIST-CSF", "ISO-27001"]
tools = ["PrismaticDark.Sandbox", "PrismaticDark.RedTeam.Taxonomy", "PrismaticDark.RedTeam.Campaign"]
platforms = ["prismatic-platform", "beam-vm", "fly-io"]
author = "Tomas Korcak (korczis)"
date_modified = "2026-11-10"
keywords = ["Red", "Team", "Adversarial", "glossary", "security", "Prismatic Platform", "Red Team", "Purple Team"]
image = "/images/sections/glossary.png"
image_alt = "Red Team (červený tým) – glosář"
+++

## Definice a přehled

Red Team (červený tým) je specializovaná jednotka bezpečnostního provozu v šestičlenné
architektuře [barevných týmů](@/glossary/color-teams.md) Prismatic Platform, která provádí
cvičení útočné simulace s cílem odhalit zranitelnosti, slabiny a způsoby selhání systémů,
procesů a epistemické obrany. Pojem vychází z vojenských cvičení studené války, v nichž
vyhrazená „červená“ síla simulovala taktiku nepřítele proti bránícím se „modrým“ silám,
a vyvinul se v základní kámen moderní kybernetické bezpečnosti, bezpečnosti umělé
inteligence a epistemické bezpečnosti. V Prismatic Platform rozšiřuje Red Team tuto tradici
do oblasti [epistemické bezpečnosti](@/glossary/epistemic-security.md): cílem je integrita
znalostních systémů, pipeline uvažování a rozhodovacích procesů, nejen síťová infrastruktura.

Red Team Prismatic Platform je jedním ze šesti barevných týmů – vedle [Gray
Teamu](@/glossary/gray-team.md), [Blue Teamu](@/glossary/blue-team.md), [Purple
Teamu](@/glossary/purple-team.md), [White Teamu](@/glossary/white-team.md) a [Black
Teamu](@/glossary/black-team.md) – a společně tvoří ucelenou architekturu syntézy útoku
a obrany, kterou řídí doktrína [NO MERCY, NO DOUBTS](@/glossary/nm-nd.md). Red Team tvoří
4 agenti v hierarchické velitelské struktuře, kteří simulují epistemické útoky pomocí pěti
definovaných primitiv a generují útočné scénáře z ucelené taxonomie útoků o 329 položkách
(stav v době zápisu). Všechny operace běží v sandboxu se syntetickými daty a bez přístupu do
sítě, takže útočné simulace nemohou ovlivnit produkční systémy ani skutečná data.

Rozdíl mezi tradičním a epistemickým red teamingem je pro pochopení bezpečnostního modelu
platformy zásadní. Tradiční Red Teamy útočí na síťovou infrastrukturu, aplikace a fyzické
bezpečnostní perimetry. Epistemické Red Teamy cílí na integritu vzniku přesvědčení, hodnocení
důkazů a kalibraci důvěry – oblasti, kde jemná manipulace může mít nepřiměřeně velký dopad na
chování systému, aniž by spustila běžné bezpečnostní poplachy.

| Hledisko | Tradiční Red Team | Epistemický Red Team (Prismatic) |
|--------|--------------------|--------------------|
| **Cíl** | síťová infrastruktura, aplikace | znalostní systémy, pipeline uvažování |
| **Útočná plocha** | porty, API, autentizace | zdroje důkazů, skóre důvěry, vznik přesvědčení |
| **Primitiva** | exploit, pivot, exfiltrace, perzistence | zkreslení, manipulace, otrávení, navození posunu, únos pozornosti |
| **Měřítko úspěchu** | kompromitace systému | zhoršení epistemické integrity |
| **Bezpečnostní opatření** | síťová izolace | sandbox + syntetická data + nulová síť |
| **Velikost taxonomie** | podle rámce | 329 položek, systematicky uspořádaných |
| **Integrace** | samostatná posouzení | nepřetržitá smyčka syntézy s Purple Teamem |

Pro Kompendium je Red Team pojmem z kontextu platformy. Jeho pět primitiv je však užitečnou
mřížkou i pro rozpoznání útoků na lidské poznání – každé má v knize obdobu, popsanou vždy
s detekcí a obranou (viz [Red Team a detekce EA](@/kompendium/aiad-integration/red-team-ea-detection.md)).

## Pět primitiv epistemického útoku

Operace Red Teamu jsou postaveny kolem pěti základních primitiv útoku, která pokrývají celé
spektrum epistemické manipulace. Primitiva byla odvozena z analýzy historických epistemických
selhání systémů umělé inteligence, zpravodajské analýzy a platforem pro podporu rozhodování
a představují minimální úplnou sadu potřebnou k modelování útočného chování proti znalostním
systémům.

**1. Zkreslení pravdy** (*Truth Distortion*): úprava faktického obsahu informačních zdrojů,
která do nich vnáší nepřesnosti. Patří sem jemné změny, které projdou povrchním ověřením, ale
poškodí navazující uvažování. Agent `red-epistemic-attacker` se specializuje na zkreslení,
která využívají mezeru mezi syntaktickou platností a sémantickou správností. Například úprava
výpočtu bezpečnostního hodnocení o 2 % – dost malá, aby nespustila prahové výstrahy, ale
dostatečná, aby při agregaci přes více datových bodů posunula hranici známky z B na C.

**2. Manipulace důvěry** (*Confidence Manipulation*): nadsazení nebo podhodnocení skóre důvěry
spojených s přesvědčeními nebo důkazy beze změny podkladových faktů. Útok využívá systémy,
které rozhodují podle prahů důvěry, a posouvá hraniční rozhodnutí přes prahové hranice.
V kontextu [NABLA Infinity](@/glossary/nabla-infinity.md) míří manipulace důvěry na bod
přechodu mezi zkoumáním (důvěra < 0,95) a exekucí (důvěra ≥ 0,95) a může vést k předčasnému
závazku nebo k neomezenému odkladu.

**3. Otrávení signálů** (*Signal Poisoning*): vkládání nepravdivých nebo zavádějících signálů
do toků důkazů, které poškozuje axiom [Signal Plurality](@/glossary/signal-plurality.md),
vyžadující pro vznik přesvědčení nejméně dva nezávislé signály. Otrávené signály se tváří, že
pocházejí z nezávislých zdrojů, a podkopávají požadavek plurality tím, že z jediného útočného
původu vytvářejí zdání potvrzení z více zdrojů.

**4. Navození posunu** (*Drift Induction*): zavádění podprahových změn, které jednotlivě
projdou detekcí, ale společně v čase posunou chování systému. Agent `red-drift-inducer` se
specializuje na analýzu kaskádového šíření a zjišťuje, jak se malá narušení sčítají v propojených
systémech. Navození posunu je obzvlášť nebezpečné, protože každá jednotlivá změna je v mezích
běžného rozptylu, takže detekce závisí na sledování kumulativní odchylky, ne jednotlivých anomálií.

**5. Únos výraznosti** (*Salience Hijacking*): manipulace tím, které informace dostanou
v procesech uvažování pozornost. Zvýrazněním irelevantních signálů nebo potlačením kritických
poškozuje únos výraznosti stanovení priorit, aniž by měnil podkladová data. Primitivum míří na
mechanismy pozornosti automatizovaných systémů i lidských analytiků a využívá omezenou
kapacitu procesů uvažování.

Lidské obdoby, které kniha rozebírá: zkreslení pravdy odpovídá [gaslightingu](@/glossary/gaslighting.md),
otrávení signálů koordinovanému zdání shody ([Firehose of
Falsehood](@/glossary/firehose-of-falsehood.md), boti), navození posunu postupné eskalaci
v kultovní konverzi ([sektářská konverze](@/glossary/sektarska-konverze.md)) a únos výraznosti
[EA-1.1.1 Selektivní expozici](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md).

## Taxonomie útoků o 329 položkách

Red Team vede ucelenou taxonomii útočných scénářů uspořádanou podle primitiva útoku, cílového
subsystému a úrovně složitosti. Taxonomie slouží zároveň jako testovací rámec a jako znalostní
báze známých vzorců epistemických útoků.

```elixir
defmodule PrismaticDark.RedTeam.Taxonomy do
  @moduledoc """
  329-entry adversarial scenario taxonomy for systematic
  epistemic security testing. All scenarios execute in
  sandboxed environments with synthetic data only.

  The taxonomy is organized into four complexity levels:
  - :basic - Single primitive, single target
  - :intermediate - Single primitive, multiple targets
  - :advanced - Multiple primitives, coordinated attack
  - :composite - Full campaign with chained primitives
  """

  @type attack_primitive ::
    :truth_distortion
    | :confidence_manipulation
    | :signal_poisoning
    | :drift_induction
    | :salience_hijacking

  @type complexity :: :basic | :intermediate | :advanced | :composite

  @type scenario :: %{
    id: String.t(),
    primitive: attack_primitive(),
    target: String.t(),
    complexity: complexity(),
    description: String.t(),
    preconditions: [String.t()],
    expected_impact: String.t(),
    detection_difficulty: float(),
    mitre_mapping: String.t() | nil,
    created_at: DateTime.t()
  }

  @spec scenarios_by_primitive(attack_primitive()) :: [scenario()]
  def scenarios_by_primitive(primitive) do
    taxonomy()
    |> Enum.filter(&(&1.primitive == primitive))
    |> Enum.sort_by(&(&1.complexity))
  end

  @spec composite_scenarios() :: [scenario()]
  def composite_scenarios do
    taxonomy()
    |> Enum.filter(&(&1.complexity == :composite))
  end

  @spec scenarios_targeting(String.t()) :: [scenario()]
  def scenarios_targeting(subsystem) do
    taxonomy()
    |> Enum.filter(&(subsystem in &1.targets))
  end

  @spec scenarios_by_detection_difficulty(float(), float()) :: [scenario()]
  def scenarios_by_detection_difficulty(min_difficulty, max_difficulty) do
    taxonomy()
    |> Enum.filter(fn s ->
      s.detection_difficulty >= min_difficulty and s.detection_difficulty <= max_difficulty
    end)
    |> Enum.sort_by(& &1.detection_difficulty, :desc)
  end

  @spec taxonomy_statistics() :: map()
  def taxonomy_statistics do
    all = taxonomy()
    %{
      total: length(all),
      by_primitive: Enum.frequencies_by(all, & &1.primitive),
      by_complexity: Enum.frequencies_by(all, & &1.complexity),
      avg_detection_difficulty: Enum.map(all, & &1.detection_difficulty) |> then(&(Enum.sum(&1) / length(&1)))
    }
  end
end
```

Taxonomie není statická. Agent `red-scenario-generator` ji průběžně rozšiřuje podle nových
hrozeb, nových schopností platformy, zjištění z teoretických modelů hrozeb [Black
Teamu](@/glossary/black-team.md) a skutečných vzorců epistemických útoků pozorovaných
v komunitách kybernetické bezpečnosti a bezpečnosti umělé inteligence. Každý nový scénář před
zařazením projde ověřením přes [Trinity Gate](@/glossary/trinity-gate.md).

## Architektura agentů

Red Team tvoří čtyři agenti v hierarchické velitelské struktuře definované standardem
[AIAD](@/glossary/aiad.md). Každý agent má konkrétní roli, úroveň oprávnění a specializaci,
které určují jeho provozní rozsah a vzorce interakce.

| Agent | Role | Úroveň | Specializace | Hlavní výstup |
|-------|------|-------|----------------|----------------|
| `red-commander` | Strategic Commander | L3 | řízení kampaní, směrování zjištění k Purple/Blue | zprávy z kampaní, strategická zjištění |
| `red-epistemic-attacker` | Tactical Specialist | L2 | zkreslení pravdy, simulace otrávení zdrojů | výsledky útoků, důkazní artefakty |
| `red-drift-inducer` | Tactical Specialist | L2 | podprahové útoky posunem, kaskádové šíření | stopy posunu, kaskádová analýza |
| `red-scenario-generator` | Tactical Specialist | L2 | skládání vícetechnikových scénářů z taxonomie | nové scénáře, aktualizace taxonomie |

`red-commander` pracuje na úrovni L3 ([Strategic Command](@/glossary/strategic-command.md)),
řídí kampaně o více scénářích a směruje zjištění k [Purple Teamu](@/glossary/purple-team.md)
k syntéze a k [Blue Teamu](@/glossary/blue-team.md) k aktualizaci obranného postavení. Tři
taktičtí specialisté L2 ([Tactical Execution](@/glossary/tactical-execution.md)) provádějí pod
vedením velitele konkrétní primitiva útoku a každý vytváří strukturované artefakty zjištění,
které vstupují do smyčky syntézy útoku a obrany.

## Architektura toku signálů

Operace Red Teamu se řídí definovaným tokem signálů v širší architektuře [Color
Teams](@/glossary/color-teams.md). Pochopení tohoto toku je nezbytné pro pochopení, jak útočná
zjištění vedou ke zlepšení obrany.

```
Gray Team (boundary seeds) --> Red Team (adversarial scenarios)
                                    |
                                    +--> Purple Team (synthesis with Blue findings)
                                    |
                                    +--> Blue Team (defensive posture update)
                                    |
                              Black Team (theoretical threat models feed Red scenarios)
```

[Gray Team](@/glossary/gray-team.md) dodává podněty z průzkumu hranic – mezery ve specifikaci,
hraniční případy a zóny nejednoznačnosti –, které Red Team převádí na konkrétní útočné
scénáře. [Black Team](@/glossary/black-team.md) dodává teoretické modely hrozeb, které
ovlivňují strategii Red Teamu na abstraktní úrovni. Zjištění Red Teamu proudí k Purple Teamu
(k syntéze s obrannými zjištěními Blue Teamu) a přímo k Blue Teamu (k okamžité aktualizaci
obranného postavení). [White Team](@/glossary/white-team.md) následně ověřuje, že nápravná
opatření skutečně řeší zranitelnosti, které Red Team odhalil.

## Architektura izolace v sandboxu

Všechny operace Red Teamu běží uvnitř izolační hranice `PrismaticDark.Sandbox`. Architektura
zajišťuje, že útočné simulace nemohou ovlivnit produkční systémy, skutečná data ani vnější
sítě. Sandbox vynucuje tři invarianty: jen syntetická data, nulový přístup do sítě a neměnné
auditní logování.

```elixir
defmodule PrismaticDark.Sandbox do
  @moduledoc """
  Isolated execution environment for Red Team adversarial
  simulations. Enforces synthetic-only data, zero network
  access, and immutable audit logging.

  Safety invariants (NEVER bypassed):
  1. network_access: false (zero network connectivity)
  2. data_source: :synthetic_only (no real data, no PII)
  3. audit_log: append-only (immutable audit trail)
  """

  @enforce_keys [:session_id, :team, :operator]
  defstruct [
    :session_id,
    :team,
    :operator,
    network_access: false,
    data_source: :synthetic_only,
    audit_log: [],
    ethics_check_interval: 10_000,
    max_duration: :timer.hours(1),
    started_at: nil
  ]

  @type t :: %__MODULE__{}
  @type audit_entry :: %{timestamp: DateTime.t(), action: String.t(), details: map()}

  @spec execute(t(), (t() -> term())) :: {:ok, term(), [audit_entry()]} | {:error, :safety_violation, String.t()}
  def execute(%__MODULE__{} = sandbox, operation) when is_function(operation, 1) do
    with :ok <- verify_safety_constraints(sandbox),
         :ok <- verify_synthetic_data_only(sandbox),
         :ok <- verify_network_isolation(sandbox),
         :ok <- verify_duration_limit(sandbox) do
      sandbox = %{sandbox | started_at: DateTime.utc_now()}
      result = operation.(sandbox)
      {:ok, result, sandbox.audit_log}
    else
      {:error, violation} ->
        {:error, :safety_violation, violation}
    end
  end

  defp verify_safety_constraints(sandbox) do
    if sandbox.network_access == false and sandbox.data_source == :synthetic_only do
      :ok
    else
      {:error, "Safety constraints violated: network=#{sandbox.network_access}, data=#{sandbox.data_source}"}
    end
  end

  defp verify_synthetic_data_only(%{data_source: :synthetic_only}), do: :ok
  defp verify_synthetic_data_only(_), do: {:error, "Non-synthetic data source detected"}

  defp verify_network_isolation(%{network_access: false}), do: :ok
  defp verify_network_isolation(_), do: {:error, "Network access not permitted for Red Team operations"}

  defp verify_duration_limit(%{max_duration: max}) when is_integer(max) and max > 0, do: :ok
  defp verify_duration_limit(_), do: {:error, "Invalid or missing duration limit"}
end
```

Izolace v sandboxu není jen osvědčený postup – je to nepodkročitelný bezpečnostní požadavek
vynucovaný na úrovni infrastruktury. I přístup do sítě „jen pro čtení“ by mohl prozradit
informace o útočných schopnostech nebo vnitřní struktuře platformy. Interval etických kontrol
zajišťuje, že automatizované etické ověření běží během aktivních operací každých 10 sekund
a brání tomu, aby se útočné myšlení rozšířilo do skutečně škodlivého území.

## Provádění kampaní

Operace Red Teamu se organizují do kampaní – strukturovaných sledů útočných scénářů navržených
k testování konkrétních aspektů obrany platformy. Kampaně dávají organizační rámec testování
o více scénářích a vytvářejí strukturovaná zjištění, která [Purple Team](@/glossary/purple-team.md)
využívá k syntéze útoku a obrany.

```elixir
defmodule PrismaticDark.RedTeam.Campaign do
  @moduledoc """
  Orchestrates multi-scenario adversarial campaigns.
  Each campaign targets a specific defensive capability
  and produces structured findings for Purple Team synthesis.

  Campaigns follow a graduated complexity approach:
  1. Basic scenarios verify fundamental defenses
  2. Intermediate scenarios test defense depth
  3. Advanced scenarios probe defense interactions
  4. Composite scenarios simulate realistic multi-vector attacks
  """

  alias PrismaticDark.{Sandbox, RedTeam.Taxonomy}

  @type finding :: %{
    scenario_id: String.t(),
    primitive: Taxonomy.attack_primitive(),
    target: String.t(),
    result: :defended | :partial_bypass | :full_bypass | :safety_halt,
    evidence: [map()],
    recommendations: [String.t()],
    detection_time_ms: non_neg_integer() | nil,
    timestamp: DateTime.t()
  }

  @spec run_campaign(String.t(), [Taxonomy.scenario()], keyword()) ::
          {:ok, [finding()]} | {:error, term()}
  def run_campaign(campaign_id, scenarios, opts \\ []) do
    sandbox = %Sandbox{
      session_id: campaign_id,
      team: :red,
      operator: Keyword.get(opts, :operator, "red-commander")
    }

    findings =
      scenarios
      |> Enum.sort_by(& &1.complexity)
      |> Enum.map(fn scenario ->
        case Sandbox.execute(sandbox, fn ctx -> execute_scenario(ctx, scenario) end) do
          {:ok, result, _audit} ->
            %{
              scenario_id: scenario.id,
              primitive: scenario.primitive,
              target: scenario.target,
              result: classify_result(result),
              evidence: result.evidence,
              recommendations: generate_recommendations(result),
              detection_time_ms: result[:detection_time_ms],
              timestamp: DateTime.utc_now()
            }

          {:error, :safety_violation, reason} ->
            %{
              scenario_id: scenario.id,
              primitive: scenario.primitive,
              target: scenario.target,
              result: :safety_halt,
              evidence: [%{reason: reason}],
              recommendations: ["Review safety constraints"],
              detection_time_ms: nil,
              timestamp: DateTime.utc_now()
            }
        end
      end)

    emit_to_purple_team(campaign_id, findings)
    {:ok, findings}
  end

  defp classify_result(%{defenses_bypassed: 0}), do: :defended
  defp classify_result(%{defenses_bypassed: n, total_defenses: t}) when n < t, do: :partial_bypass
  defp classify_result(_), do: :full_bypass

  defp generate_recommendations(%{result: :defended}), do: ["Defense effective - maintain current posture"]
  defp generate_recommendations(%{weaknesses: weaknesses}), do: Enum.map(weaknesses, & &1.recommendation)

  defp emit_to_purple_team(campaign_id, findings) do
    :telemetry.execute(
      [:prismatic_dark, :red_team, :campaign_complete],
      %{findings_count: length(findings), bypasses: Enum.count(findings, &(&1.result != :defended))},
      %{campaign_id: campaign_id, findings: findings}
    )
  end
end
```

## Užití v Prismatic Platform

V Prismatic Platform plní Red Team několik kritických funkcí, které přímo podporují
bezpečnostní postavení a epistemickou integritu platformy.

**Ověření epistemické bezpečnosti**: scénáře Red Teamu testují sedm [axiomů
NABLA](@/glossary/nabla-axioms.md) v útočných podmínkách. Útoky otrávením signálů ověřují, že
požadavek plurality signálů skutečně brání epistemickým selháním z jediného zdroje. Útoky
manipulací důvěry ověřují, že [Trinity Gate](@/glossary/trinity-gate.md) zachytí uměle
nadsazená skóre důvěry. Útoky zkreslením pravdy testují schopnost axiomu povinné provenience
dohledat přesvědčení k jejich původu a odhalit manipulaci.

**Posouzení obranného postavení**: zjištění z kampaní Red Teamu proudí k [Blue
Teamu](@/glossary/blue-team.md) k aktualizaci obranného postavení a k [Purple
Teamu](@/glossary/purple-team.md) k syntéze. Vzniká smyčka nepřetržitého zlepšování, v níž
útočné objevy vedou ke zlepšení obrany. Analytik uzavření v Purple Teamu sleduje, zda bylo
každé zjištění Red Teamu přiměřeně vyřešeno, a brání tomu, aby zjištění byla vzata na vědomí,
ale nenapravena.

**Kalibrace detekce posunu**: agent `red-drift-inducer` generuje podprahové scénáře posunu,
které kalibrují citlivost agenta `blue-drift-detector` Blue Teamu. Protože je přesně známo,
jaký posun byl zaveden, může platforma změřit přesnost detekce a upravit prahy. Kalibrace je
kritická, protože citlivost detekce posunu je kompromisem: příliš citlivá vede k falešně
pozitivním výsledkům, příliš necitlivá přehlédne skutečný posun.

**Údržba knihovny scénářů**: `red-scenario-generator` udržuje a rozšiřuje taxonomii o 329
položkách podle nových hrozeb, nových schopností platformy a zjištění z teoretických modelů
hrozeb [Black Teamu](@/glossary/black-team.md). Každý nový scénář se klasifikuje podle
primitiva, složitosti, cílového subsystému a obtížnosti detekce, aby bylo pokrytí útočné
krajiny úplné.

**Zátěžové testování axiomů NABLA**: každý ze sedmi axiomů NABLA (pluralita signálů, zachování
rozporu, informativní absence, časový rozpad, platnost neznáma, nezávislost zdrojů, povinná
provenience) má vyhrazené scénáře Red Teamu, které zkoumají hranice jeho vynucení. Systematické
pokrytí zajišťuje, že epistemický rámec není jen teoreticky správný, ale prakticky odolný pod
útočným tlakem.

## Telemetrie a pozorovatelnost

Operace Red Teamu vysílají úplné telemetrické události, které umožňují monitorování, výstrahy
a analýzu po kampani. Všechny události dodržují standardní telemetrické konvence platformy.

```elixir
defmodule PrismaticDark.RedTeam.Telemetry do
  @moduledoc """
  Telemetry event definitions for Red Team operations.
  All events are emitted to [:prismatic_dark, :red_team, *] namespace.
  """

  @spec attach_handlers() :: :ok
  def attach_handlers do
    events = [
      [:prismatic_dark, :red_team, :campaign_start],
      [:prismatic_dark, :red_team, :campaign_complete],
      [:prismatic_dark, :red_team, :scenario_executed],
      [:prismatic_dark, :red_team, :safety_violation],
      [:prismatic_dark, :red_team, :taxonomy_updated],
      [:prismatic_dark, :red_team, :ethics_check]
    ]

    :telemetry.attach_many(
      "red-team-handler",
      events,
      &handle_event/4,
      nil
    )
  end

  defp handle_event([:prismatic_dark, :red_team, :safety_violation], measurements, metadata, _config) do
    Logger.error("RED TEAM SAFETY VIOLATION",
      session_id: metadata.session_id,
      violation: metadata.violation,
      severity: measurements.severity
    )
  end
end
```

## Bezpečnostní protokoly

Red Team pracuje pod přísnými bezpečnostními protokoly, které nelze vyjednávat ani obejít.
Vynucují se na několika vrstvách – v kódu, v infrastruktuře a organizačně –, aby vznikla
hloubková obrana proti porušení bezpečnostních hranic.

| Protokol | Vynucení | Ověření |
|----------|-------------|-------------|
| **Izolace v sandboxu** | všechny operace v PrismaticDark.Sandbox | kontroly při kompilaci a za běhu |
| **Jen syntetická data** | žádná skutečná data, žádné osobní údaje, žádný produkční stav | ověření zdroje dat při každé operaci |
| **Nulový přístup do sítě** | operace Red bez síťového připojení | pravidla firewallu + ověření za běhu |
| **Etické kontroly** | automatizované ověření každých 10 sekund | periodický časovač s eskalací při selhání |
| **Eskalační stráže** | Gray Escalation Guard brání rozšiřování rozsahu | nezávislý bezpečnostní agent s pravomocí přebít |
| **Auditní logování** | neměnná auditní stopa každé operace | log jen pro připisování s ověřením integrity |
| **Časové limity** | kampaň nejvýše 1 hodina | vynucení časovačem s automatickým ukončením |
| **Jen oprávněný kontext** | CTF, obranný výzkum, autorizované testování | ověření kontextu při zahájení kampaně |

Bezpečnostní protokoly vycházejí z předpokladu, že útočné myšlení vytváří kognitivní rizika
i v kontextu simulace. Kadence etických kontrol (každých 10 sekund) je záměrně častá, aby
zabránila postupné normalizaci stále agresivnějších vzorců útoku. Eskalační stráž [Gray
Teamu](@/glossary/gray-team.md) má nezávislou pravomoc zastavit kteroukoli operaci Red Teamu,
která vykazuje známky rozšiřování mimo hranice testování epistemické bezpečnosti.

Kompendium tento princip přebírá pro vlastní obsah: mechanismy se popisují jen jako
rozpoznatelné vzorce spolu s detekcí a obranou, nikdy jako postup (viz [1.3 Etické aspekty
a upozornění](@/kompendium/01-predmluva/eticke-aspekty.md) a [Dual Use](@/kompendium/08-prilohy/dual-use.md)).

## Osvědčené postupy

1. **Vždy v sandboxu**: nikdy nespouštět útočné scénáře mimo izolační hranici, bez ohledu na
   zdánlivou bezpečnost. Jediný chybně nastavený scénář může poškodit produkční data nebo
   prozradit vnitřní strukturu vnějším pozorovatelům.
2. **Výhradně syntetická data**: generovat realistická, ale zcela syntetická testovací data.
   Použití anonymizovaných produkčních dat hrozí reidentifikací a vnáší skutečné důsledky,
   které porušují mandát „jen simulace“.
3. **Strukturovaná zjištění**: každé zjištění dokumentovat s ID scénáře, důkazy, posouzením
   dopadu, dobou detekce a použitelnými doporučeními. Nestrukturovaná zjištění vytvářejí šum
   bez zlepšení.
4. **Napojení na Purple Team**: všechna zjištění směrovat přes syntézu [Purple
   Teamu](@/glossary/purple-team.md), ne přímo inženýrům. Purple Team zasadí zjištění do
   kontextu existujících obran a brání zdvojeným nápravám.
5. **Kadence etických kontrol**: během aktivních operací udržovat automatizované etické
   ověření každých 10–15 sekund. Brání to přesahu útočného myšlení do skutečně škodlivého území.
6. **Stupňovaná složitost**: začínat kampaně základními scénáři a eskalovat ke složeným útokům.
   Tím se ověří základní obrany dřív, než se testují sofistikované útoky z více primitiv.
7. **Úplnost auditní stopy**: každá operace Red Teamu musí vytvořit neměnný auditní záznam.
   Mezery v auditu vytvářejí slepá místa odpovědnosti a podkopávají integritu bezpečnostního
   programu.
8. **Aktuálnost taxonomie**: taxonomii útoků revidovat a aktualizovat nejméně jednou měsíčně.
   Nové funkce platformy vytvářejí nové útočné plochy, které existující scénáře nemusí pokrývat.

## Časté chyby

- **Rozšiřování rozsahu**: útočné myšlení se může posunout od testování obrany k vývoji
  skutečných útočných schopností. Přísné eskalační stráže a eskalační stráž [Gray
  Teamu](@/glossary/gray-team.md) tomuto přechodu brání. Hranice mezi „testováním obrany“
  a „vývojem útoku“ vyžaduje trvalou bdělost.
- **Falešná jistota z ubráněných výsledků**: scénář klasifikovaný jako „ubráněný“ dokazuje jen
  to, že byl zablokován konkrétní vektor útoku. Varianty mohou uspět. Složené scénáře testují
  robustnost obrany vůči novým kombinacím, které jednotlivé základní scénáře odhalit nemohou.
- **Přehlížení podprahových zjištění**: částečná obejití a těsná minutí často ukazují na
  závažnější zranitelnosti než čistá selhání. Analytik uzavření v Purple Teamu cíleně sleduje
  vzorce v dílčích výsledcích, které naznačují systémové slabiny.
- **Porušení síťové izolace**: i přístup do sítě „jen pro čtení“ může prozradit informace
  o útočných schopnostech nebo vnitřní architektuře. Nulový přístup do sítě je pro operace
  Red a Black Teamu nepodkročitelný.
- **Zastarávání taxonomie**: taxonomie útoků vyžadují průběžnou aktualizaci, jak se platforma
  vyvíjí. Nové funkce vytvářejí nové útočné plochy. Taxonomie o 329 položkách je živý dokument,
  ne pevná reference.
- **Předčasné ukončení kampaně**: zastavení kampaně po prvních „ubráněných“ výsledcích vynechá
  stupňovanou složitost, kterou složené scénáře přinášejí. Plán kampaně je třeba vždy dokončit.

## Historický kontext a vývoj v odvětví

Red teaming má kořeny ve vojenské strategii studené války, kdy se jednotky simulující
protivníka označovaly „červeně“. Do kybernetické bezpečnosti se praxe dostala přes vojenskou
a zpravodajskou komunitu v 90. letech, do hlavního proudu ji uvedla publikace NIST SP 800-115
(*Technical Guide to Information Security Testing and Assessment*) a dále se vyvinula se
systematickým katalogem taktik, technik a postupů protivníka v rámci MITRE ATT&CK.

Rozšíření red teamingu na epistemickou bezpečnost představuje příspěvek Prismatic Platform
k tomuto vývoji. Jak se systémy umělé inteligence stále víc podílejí na rozhodování, rozšiřuje
se útočná plocha za tradiční infrastrukturu na znalostní systémy, pipeline uvažování
a mechanismy kalibrace důvěry, na které se umělá inteligence spoléhá. Epistemický red teaming
na tuto rozšířenou útočnou plochu odpovídá pěti primitivy a taxonomií o 329 položkách.

## Související

**Pojmy platformy v tomto glosáři**

- [Blue Team](@/glossary/blue-team.md) – obranný protějšek, který přijímá zjištění Red.
- [Purple Team](@/glossary/purple-team.md) – syntetický uzel uzavírání smyčky Red–Blue.
- [Black Team](@/glossary/black-team.md) – teoretické modelování hrozeb pro scénáře.
- [Gray Team](@/glossary/gray-team.md) – průzkum hranic, který dodává podněty kampaním.
- [White Team](@/glossary/white-team.md) – konstruktivní ověření nápravy zjištění.
- [Color Teams](@/glossary/color-teams.md) – přehled všech šesti barevných týmů.
- [NABLA Infinity](@/glossary/nabla-infinity.md), [Trinity Gate](@/glossary/trinity-gate.md),
  [Signal Plurality](@/glossary/signal-plurality.md) – rámec, brána a axiom, které útočná
  simulace testuje.
- [Tactical Execution](@/glossary/tactical-execution.md), [AIAD](@/glossary/aiad.md) – úroveň
  L2 specialistů a standard definic agentů.

**Přehledy platformy mimo tuto knihu**

- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/),
  [Agenti](https://prismatic-reality-com.github.io/prismatic-promo/agents/),
  [Technologie](https://prismatic-reality-com.github.io/prismatic-promo/technologies/),
  [Schopnosti](https://prismatic-reality-com.github.io/prismatic-promo/capabilities/).

**Kniha**

- [Red Team a detekce EA](@/kompendium/aiad-integration/red-team-ea-detection.md) – útočná
  simulace jako nástroj rozpoznání EA.
- [2.7 Vztah ke Decision Engine a Color Teams](@/kompendium/02-uvod/_index.md) –
  jak barevné týmy vstupují do knihy.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: red-team](@/kompendium/glossary-bridges/bridge-red-team.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
