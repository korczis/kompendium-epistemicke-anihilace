+++
title = "Agent Registry (registr agentů)"
weight = 17
description = "Centrální katalog všech agentů AIAD na Prismatic Platform s jejich schopnostmi, úrovněmi oprávnění, doménami a závislostmi; jediný zdroj pravdy pro správu agentů."

[taxonomies]
tags = ["glossary", "agents", "agent-registry", "prismatic", "aiad"]

[extra]
category = "agents"
related_terms = ["aiad", "agent-tier", "archer-supreme", "supreme-commander", "blackboard", "color-teams", "agent", "consciousness-traits", "nabla-infinity", "supervisor", "process-isolation", "epistemic-pipeline", "mix", "autoevolve", "autoheal"]
total_agents = "530+"
static_agents = "500+"
runtime_agents = "~30"
domains = "16"
registry_file = ".claude/AGENT_REGISTRY.md"
index_command = "./.aiad/bin/aiad index"
specification_format = ".agent.md"
specification_directory = ".aiad/agents/"
tier_levels = ["L1 Operational", "L2 Tactical", "L3 Strategic", "L4 Safety-Critical", "L5 Supreme"]
governance_model = "Centralized Catalog with Auto-Indexing"
discovery_patterns = ["Direct Lookup", "Domain Search", "Tier Query", "Capability Match", "Dependency Resolution"]
integration_systems = ["Blackboard", "Epistemic Pipeline", "AutoEvolve", "Supervisor", "Quality Gates", "Color Teams"]
key_agents = ["archer-supreme", "supreme-coordinator", "red-commander", "blue-commander", "purple-coordinator"]
safety_critical_agents = ["gray-escalation-guard", "purple-regression-guard", "black-abstraction-enforcer"]
audit_capabilities = ["Population Audit", "Authority Audit", "Domain Coverage", "Duplicate Detection", "Deprecation Tracking"]
author = "Tomas Korcak (korczis)"
quality_score = 90
date_modified = "2026-11-10"
+++

## Definice

**Agent Registry** (registr agentů) je centralizovaný, autoritativní katalog, který
indexuje všechny agenty Prismatic Platform splňující standard [AIAD](@/glossary/aiad.md).
Zaznamenává volací znak každého agenta, úroveň oprávnění, doménovou specializaci,
schopnosti, provozní stav a závislosti na jiných agentech. Registr je veden v souboru
`.claude/AGENT_REGISTRY.md`, automaticky indexován nástroji AIAD příkazem
`./.aiad/bin/aiad index` a slouží jako jediný zdroj pravdy pro vyhledávání, správu
a koordinaci agentů v celém ekosystému platformy.

Registr není pasivním adresářem. Aktivně vynucuje správu agentů: brání duplicitním
definicím, ověřuje přiřazení úrovní podle specifikace [Agent Tier](@/glossary/agent-tier.md)
a zajišťuje, že každý agent platformy má dobře definovaný soubor specifikace. Při nasazení
[agenta](@/glossary/agent.md) běhové prostředí ověří jeho identitu proti registru.
Neregistrovaní agenti nemohou na platformě působit – toto omezení brání neoprávněným nebo
„zběhlým“ agentům v přístupu ke zdrojům platformy.

Návrh registru vychází z požadavku na dohledatelnost ve velkém měřítku. S více než
500 staticky definovanými agenty a přibližně 30 dalšími agenty vytvářenými za běhu (celkem
530+, stav v době zápisu; jiná hesla uvádějí starší počty) potřebuje platforma spolehlivý
mechanismus, jímž agenti najdou spolupracovníky, velitelé dostupné specialisty a systémy
správy celou populaci agentů k auditu. Registr jej poskytuje strukturovanou indexací,
doménovou klasifikací a dotazy podle úrovně.

**Vztah ke knize:** registr patří do kontextu platformy, z níž Kompendium vzešlo.
Agenti v něm zapsaní uplatňují taxonomii knihy v obranných úlohách – viz oddíl [AIAD
integrace a detekce EA](@/kompendium/aiad-integration/_index.md).

## Historický vývoj

Registr se vyvíjel v několika generacích, jak rostla populace agentů:

| Generace | Počet agentů | Formát registru | Klíčová novinka |
|------------|-------------|-----------------|----------------|
| Gen 1–3 | < 50 | ruční Markdown | ručně udržovaný seznam |
| Gen 4–7 | 50–150 | poloautomatický | standardizovaný formát specifikace AIAD |
| Gen 8–12 | 150–350 | automaticky indexovaný | nástroj `.aiad/bin/aiad index` |
| Gen 13–16 | 350–450 | doménově klasifikovaný | taxonomie 14 domén, správa úrovní |
| Gen 17–19 | 450–530+ | plná správa | příznaky kritičnosti pro bezpečnost, omezení izolace, auditní stopa |

Rané verze registru byly jednoduché tabulky v Markdownu udržované ručně. Když populace
agentů překročila stovku, ruční údržba začala být chybová a nekonzistentní. Formát
specifikace AIAD (soubory `.agent.md` se strukturovanou hlavičkou) a automatická indexace
problémy s konzistencí odstranily, protože registr se generuje z autoritativních zdrojových
souborů.

## Struktura registru

Každý záznam agenta v registru obsahuje standardizovanou sadu polí odvozených ze souboru
specifikace `.agent.md`:

| Pole | Popis | Příklad |
|-------|-------------|---------|
| **Call Sign** | jedinečný identifikátor agenta | `red-commander` |
| **Authority Tier** | klasifikace L1–L5 podle [Agent Tier](@/glossary/agent-tier.md) | L3 Strategic |
| **Domain** | hlavní provozní doména z taxonomie 16 domén | Security |
| **Specialization** | konkrétní schopnost nebo zaměření | orchestrace adversariálních scénářů |
| **Status** | aktuální provozní stav (active, standby, deprecated) | Active |
| **Dependencies** | jiní agenti nebo systémy nutné pro provoz | `red-epistemic-attacker`, `red-drift-inducer` |
| **Safety-Critical** | zda má agent oprávnění k bezpečnostnímu přepsání | No |
| **ISOLATED** | zda agent pracuje pod omezeními izolace | No |
| **Specification** | cesta k souboru definice `.agent.md` | `.aiad/agents/red-commander.agent.md` |
| **Version** | verze specifikace pro sledování změn | 2.1.0 |

Formát registru je navržen pro čtení lidmi (tabulka v Markdownu v `AGENT_REGISTRY.md`)
i pro strojové zpracování (strukturovaná pole, která nástroje AIAD dokážou vytáhnout).

```elixir
defmodule PrismaticAgents.Registry.Entry do
  @moduledoc """
  Represents a single agent entry in the Agent Registry.
  Each entry corresponds to an .agent.md specification file.
  """

  @type t :: %__MODULE__{
    call_sign: String.t(),
    tier: :L1 | :L2 | :L3 | :L4 | :L5,
    domain: String.t(),
    specialization: String.t(),
    status: :active | :standby | :deprecated,
    dependencies: [String.t()],
    safety_critical: boolean(),
    isolated: boolean(),
    specification_path: String.t(),
    version: String.t()
  }

  @enforce_keys [:call_sign, :tier, :domain]
  defstruct [
    :call_sign,
    :tier,
    :domain,
    :specialization,
    status: :active,
    dependencies: [],
    safety_critical: false,
    isolated: false,
    specification_path: nil,
    version: "1.0.0"
  ]
end
```
## Systém automatické indexace

Registr se udržuje automatickou indexací, která v adresáři `.aiad/agents/` vyhledá všechny
soubory specifikace `.agent.md` a z jejich obsahu registr znovu vygeneruje. Díky tomu je
registr vždy v souladu se skutečnými definicemi agentů – ruční úpravy registru se při
příštím spuštění indexace přepíšou.

```bash
# Trigger auto-indexing of all agent specifications
./.aiad/bin/aiad index

# The indexer performs:
# 1. Scans .aiad/agents/ for all .agent.md files
# 2. Parses frontmatter and structured content from each file
# 3. Validates tier assignments and domain classifications
# 4. Detects duplicate call signs or conflicting specifications
# 5. Generates the unified AGENT_REGISTRY.md
# 6. Updates domain-specific sub-indexes
# 7. Emits validation report with warnings and errors
```
Automatická indexace běží jako součást udržovacího cyklu AIAD a spouští se automaticky při
přidání nových agentů nebo změně stávajících. Systém [AutoEvolve](@/glossary/autoevolve.md)
sleduje konzistenci registru a při zjištění odchylky spustí novou indexaci.

```elixir
defmodule PrismaticAgents.Registry.Indexer do
  @moduledoc """
  Auto-indexing engine that builds the Agent Registry from
  individual .agent.md specification files.
  """

  @spec index_all(String.t()) :: {:ok, index_result()} | {:error, term()}
  def index_all(agents_dir \\ ".aiad/agents/") do
    with {:ok, spec_files} <- list_specs(agents_dir),
         {:ok, entries} <- parse_all(spec_files),
         :ok <- validate_no_duplicates(entries),
         :ok <- validate_tier_assignments(entries),
         :ok <- validate_dependencies(entries) do
      {:ok, %{
        total: length(entries),
        by_domain: group_by_domain(entries),
        by_tier: group_by_tier(entries),
        warnings: collect_warnings(entries)
      }}
    end
  end

  @spec validate_no_duplicates([Entry.t()]) :: :ok | {:error, {:duplicates, [String.t()]}}
  defp validate_no_duplicates(entries) do
    duplicates =
      entries
      |> Enum.group_by(& &1.call_sign)
      |> Enum.filter(fn {_sign, agents} -> length(agents) > 1 end)
      |> Enum.map(fn {sign, _} -> sign end)

    case duplicates do
      [] -> :ok
      dupes -> {:error, {:duplicates, dupes}}
    end
  end
end
```
## Doménová klasifikace

Agenti jsou zařazeni do 16 provozních domén; každá představuje samostatnou funkční oblast
platformy (počty jsou přibližné, stav v době zápisu):

| Doména | Počet agentů | Popis | Klíčoví agenti |
|--------|-------------|-------------|------------|
| **Security** | ~40 | [Color Teams](@/glossary/color-teams.md) a bezpečnostní operace | 20 agentů Color Teams a bezpečnostní specialisté |
| **Quality** | ~45 | vynucení kvality, brány a sledování | strážce minimální kvality, vynucovač Credo |
| **Evolution** | ~35 | [AutoEvolve](@/glossary/autoevolve.md), [AutoHeal](@/glossary/autoheal.md), správa generací | evoluční skener, koordinátor oprav |
| **Intelligence** | ~40 | [OSINT](@/glossary/osint.md), [entity resolution](@/glossary/entity-resolution.md), analýza dat | ghost recon, delta force, e-mailový OSINT |
| **Architecture** | ~25 | návrh platformy, vzory, standardy | architekt Elixiru, návrhář systému |
| **Storage** | ~20 | perzistence dat, adaptéry, mezipaměť | koordinátor úložiště, specialisté na adaptéry |
| **Web** | ~20 | LiveView, Phoenix, frontend | koordinátor UI, specialisté na dashboardy |
| **Testing** | ~30 | generování testů, pokrytí, validace | generátor testů, analyzátor pokrytí |
| **Documentation** | ~25 | dokumentace, příručky, správa znalostí | generátor dokumentace, indexátor znalostí |
| **Deployment** | ~15 | CI/CD, vydání, infrastruktura | koordinátor nasazení, správce vydání |
| **Epistemic** | ~30 | [NABLA Infinity](@/glossary/nabla-infinity.md), [Trinity Gate](@/glossary/trinity-gate.md), epistemický proces | epistemický validátor, správce přesvědčení |
| **Consciousness** | ~20 | „rysy vědomí“, sebereflexe agentů | monitor vědomí, hodnotitel rysů |
| **Perimeter** | ~15 | [EASM](@/glossary/easm.md), útočná plocha, soulad | skener perimetru, hodnotitel souladu |
| **Promo** | ~10 | obohacování obsahu, správa webu | vylepšovač obsahu |
| **API** | ~10 | API gateway, vyhledávání koncových bodů, OpenAPI | skener API, generátor specifikací |
| **Ecosystem** | ~15 | balíčky OSS, vývojářský portál, komunita | architekt SDK, koordinátor pluginů |

Doménová klasifikace není výlučná: někteří agenti působí ve více doménách a jsou uvedeni
pod hlavní doménou s křížovými odkazy na vedlejší. Registr podporuje dotazy podle domény,
takže agenti L3 a výše mohou najít dostupné specialisty v konkrétní oblasti.

## Rozložení úrovní oprávnění

Registr sleduje rozložení agentů podle úrovní oprávnění a zajišťuje přiměřenou správu:

| Úroveň | Počet | Podíl | Role | Příklady agentů |
|------|-------|------------|------|----------------|
| **L1 Operational** | ~200 | 38 % | provádění úkolů, specialisté jedné domény | skener souborů, spouštěč testů, formátovač dokumentace |
| **L2 Tactical** | ~180 | 34 % | vícekrokové postupy, koordinace v rámci domény | red epistemic attacker, blue drift detector |
| **L3 Strategic** | ~100 | 19 % | koordinace napříč doménami, velení týmům | red commander, blue commander, purple coordinator |
| **L4 Safety-Critical** | ~40 | 7 % | bezpečnostní přepsání, nouzový zásah | gray escalation guard, purple regression guard |
| **L5 Supreme** | ~10 | 2 % | oprávnění pro celou platformu, strategická rozhodnutí | [Archer Supreme](@/glossary/archer-supreme.md), [Supreme Commander](@/glossary/supreme-commander.md) |

Rozložení má tvar pyramidy: většina agentů pracuje na L1–L2 (provádění), menší počet
koordinuje na L3 (strategie) a jen několik má oprávnění kritická pro bezpečnost (L4) nebo
nejvyšší (L5). To odpovídá vojenským velitelským strukturám a zajišťuje, že oprávnění je
soustředěno nahoře, zatímco provozní kapacita je rozložena v základně.

## Vyhledávání agentů

Registr umožňuje několik vzorců vyhledávání, které jsou pro koordinaci platformy nezbytné:

**Přímé vyhledání:** podle volacího znaku vrátí úplnou specifikaci agenta včetně úrovně,
domény, schopností a stavu. Používá je každý agent, který ví, jakého spolupracovníka
potřebuje.

**Hledání podle domény:** vrátí všechny agenty v dané doméně. Používají je velitelé L3
k nalezení dostupných specialistů pro taktické úkoly.

**Dotaz podle úrovně:** vrátí všechny agenty dané úrovně oprávnění. Používají je agenti L4
a výše k nalezení rovnocenných partnerů pro koordinaci napříč doménami.

**Shoda schopností:** k požadované schopnosti najde agenty, kteří ji poskytují. Používá je
systém *Blackboard* ke směrování požadavků na znalosti k vhodným specialistům.

**Řešení závislostí:** k danému agentovi určí všechny agenty, na nichž závisí, a ověří
jejich dostupnost. Používá se při nasazení, aby byly splněny provozní předpoklady.

```elixir
defmodule PrismaticAgents.Registry do
  @moduledoc """
  Agent Registry providing discovery, lookup, and governance
  for all 530+ AIAD-compliant agents in the platform.
  """

  @spec lookup(String.t()) :: {:ok, Entry.t()} | {:error, :not_found}
  def lookup(call_sign) do
    case :ets.lookup(@table, call_sign) do
      [{^call_sign, entry}] -> {:ok, entry}
      [] -> {:error, :not_found}
    end
  end

  @spec by_domain(String.t()) :: {:ok, [Entry.t()]}
  def by_domain(domain) do
    entries =
      :ets.tab2list(@table)
      |> Enum.filter(fn {_sign, entry} -> entry.domain == domain end)
      |> Enum.map(fn {_sign, entry} -> entry end)

    {:ok, entries}
  end

  @spec by_tier(:L1 | :L2 | :L3 | :L4 | :L5) :: {:ok, [Entry.t()]}
  def by_tier(tier) do
    entries =
      :ets.tab2list(@table)
      |> Enum.filter(fn {_sign, entry} -> entry.tier == tier end)
      |> Enum.map(fn {_sign, entry} -> entry end)

    {:ok, entries}
  end

  @spec by_capability(String.t()) :: {:ok, [Entry.t()]}
  def by_capability(capability) do
    entries =
      :ets.tab2list(@table)
      |> Enum.filter(fn {_sign, entry} -> capability in entry.capabilities end)
      |> Enum.map(fn {_sign, entry} -> entry end)

    {:ok, entries}
  end

  @spec resolve_dependencies(String.t()) :: {:ok, [Entry.t()]} | {:error, term()}
  def resolve_dependencies(call_sign) do
    with {:ok, agent} <- lookup(call_sign) do
      deps = Enum.map(agent.dependencies, fn dep_sign ->
        case lookup(dep_sign) do
          {:ok, dep} -> {:ok, dep}
          {:error, _} -> {:error, {:missing_dependency, dep_sign}}
        end
      end)

      case Enum.find(deps, &match?({:error, _}, &1)) do
        nil -> {:ok, Enum.map(deps, fn {:ok, d} -> d end)}
        error -> error
      end
    end
  end
end
```
## Rozšíření za běhu

Kromě více než 500 staticky definovaných agentů vytváří platforma za běhu přibližně
30 dalších. Vznikají dynamicky podle stavu platformy – například když přibude nová aplikace
umbrella projektu, která potřebuje vlastního agenta pro sledování kvality, nebo když
konkrétní šetření vyžaduje dočasného specialistu.

Agenti vytvoření za běhu se zapisují do stejného registru jako statičtí, s dodatečným
příznakem `runtime: true`. Řídí se stejnou klasifikací [Agent Tier](@/glossary/agent-tier.md),
přiřazením domény a specifikací schopností jako statičtí agenti. Rozdíl je v životním
cyklu: statičtí agenti přetrvávají restarty platformy, agenty vytvořené za běhu podle
potřeby znovu vytvářejí jejich nadřazené supervizory OTP.

```elixir
defmodule PrismaticAgents.Registry.RuntimeExtension do
  @moduledoc "Manages runtime-generated agent entries in the registry."

  @spec register_runtime_agent(Entry.t()) :: {:ok, Entry.t()} | {:error, term()}
  def register_runtime_agent(%Entry{} = entry) do
    runtime_entry = %{entry | runtime: true, registered_at: DateTime.utc_now()}

    with :ok <- validate_call_sign_available(runtime_entry.call_sign),
         :ok <- validate_tier_within_bounds(runtime_entry.tier) do
      :ets.insert(@table, {runtime_entry.call_sign, runtime_entry})
      {:ok, runtime_entry}
    end
  end

  @spec deregister_runtime_agent(String.t()) :: :ok | {:error, :not_found}
  def deregister_runtime_agent(call_sign) do
    case :ets.lookup(@table, call_sign) do
      [{^call_sign, %{runtime: true}}] ->
        :ets.delete(@table, call_sign)
        :ok
      [{^call_sign, %{runtime: false}}] ->
        {:error, :cannot_deregister_static_agent}
      [] ->
        {:error, :not_found}
    end
  end
end
```
## Správa a audit

Registr je základem správy agentů:

- **audit populace** – úplný seznam agentů je kdykoli k dispozici ke kontrole;
- **audit oprávnění** – přiřazení úrovní lze přezkoumat z hlediska přiměřeného rozložení
  oprávnění;
- **pokrytí domén** – mezery lze najít porovnáním přiřazení agentů s potřebami platformy;
- **detekce duplicit** – automatická indexace odhalí a odmítne duplicitní volací znaky
  a předejde tak konfliktům identity;
- **sledování vyřazení** – agenti označení jako vyřazení zůstávají v registru kvůli auditu,
  ale nejsou nabízeni k aktivnímu vyhledání;
- **historie změn** – časová razítka generování a sledování rozdílů umožňují auditní stopu
  změn správy.

Registr je propojen se systémy strukturovaného logování a pozorovatelnosti platformy, takže
lze dávat do souvislosti identitu agenta s jeho provozní telemetrií.

## Integrace s Color Teams

Systém [Color Teams](@/glossary/color-teams.md) se při ověřování složení týmů silně opírá
o registr. Každý ze šesti barevných týmů ([Gray](@/glossary/gray-team.md),
[Red](@/glossary/red-team.md), [Blue](@/glossary/blue-team.md),
[Purple](@/glossary/purple-team.md), [White](@/glossary/white-team.md),
[Black](@/glossary/black-team.md)) má definovanou sestavu agentů, kterou je nutné ověřit
proti registru:

| Tým | Požadovaní agenti | Ověření v registru |
|------|----------------|---------------------|
| **Gray** | 3 agenti (commander, edge-finder, escalation-guard) | ověření úrovně a příznaků kritičnosti |
| **Red** | 4 agenti (commander, epistemic-attacker, drift-inducer, scenario-generator) | kontrola omezení izolace |
| **Blue** | 4 agenti (commander, auth-sentinel, drift-detector, signal-aggregator) | ověření přiřazení domény |
| **Purple** | 4 agenti (coordinator, mapper, closure-analyst, regression-guard) | řešení závislostí mezi týmy |
| **White** | 3 agenti (verifier-commander, contract-validator, invariant-prover) | kontrola schopností formálního ověřování |
| **Black** | 2 agenti (theorist-commander, abstraction-enforcer) | vynucena MAXIMÁLNÍ izolace |

## Integrace se systémy platformy

| Systém | Integrace | Účel |
|--------|-------------|---------|
| **Blackboard** | vyhledání schopností agentů | směruje požadavky na znalosti k vhodným specialistům |
| **[Epistemic Pipeline](@/glossary/epistemic-pipeline.md)** | řízení přístupu podle úrovně | agenti mají přístup jen k úrovním procesu odpovídajícím jejich oprávnění |
| **[AutoEvolve](@/glossary/autoevolve.md)** | sledování konzistence registru | odhaluje a opravuje odchylky registru |
| **Supervisor** | mapování procesů na agenty | spojuje procesy OTP s identitami agentů |
| **Quality Gates** | kontrola souladu agentů | ověřuje, že všichni agenti splňují standardy kvality |
| **[Color Teams](@/glossary/color-teams.md)** | ověření složení týmů | složení týmů odpovídá specifikacím |
| **SEADF** | koordinace subsystémů | směruje úkoly do vhodných domén agentů |

## Související pojmy

Bez vlastního hesla v glosáři knihy: *Blackboard* (sdílené úložiště znalostí, které
k vyhledání agentů používá registr), *Consciousness Traits* (rysy sledované u každého agenta
v registru) a *Supervisor* (supervize OTP, která spravuje procesy registrovaných agentů).

## Související

**Platforma**

- [AIAD](@/glossary/aiad.md) – standard definic, jímž se řídí všichni registrovaní agenti.
- [Agent](@/glossary/agent.md) – základní pojem autonomní provozní jednotky.
- [Agent Tier](@/glossary/agent-tier.md) – klasifikace oprávnění L1–L5 indexovaná
  v registru.
- [Archer Supreme](@/glossary/archer-supreme.md) a [Supreme
  Commander](@/glossary/supreme-commander.md) – agenti nejvyšší úrovně.
- [Color Teams](@/glossary/color-teams.md) – bezpečnostní agenti ve šesti týmech.
- [NABLA Infinity](@/glossary/nabla-infinity.md) – epistemický rámec chování
  registrovaných agentů.
- [AutoEvolve](@/glossary/autoevolve.md) a [AutoHeal](@/glossary/autoheal.md) – systémy
  evoluce a samoopravy, které registr využívají.

**Kompendium**

- [AIAD integrace a detekce EA](@/kompendium/aiad-integration/_index.md) – jak agenti
  platformy uplatňují taxonomii knihy.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: agent-registry](@/kompendium/glossary-bridges/bridge-agent-registry.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
