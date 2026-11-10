+++
title = "Bounded Context (ohraničený kontext)"
weight = 23
description = "Výslovná hranice, uvnitř níž je doménový model definován a konzistentní; strategický vzor doménově řízeného návrhu, podle něhož jsou členěny aplikace platformy."

[taxonomies]
tags = ["glossary", "architecture", "bounded-context", "prismatic"]

[extra]
category = "architecture"
subcategory = "domain-modeling"
related_terms = ["domain-driven-design", "cqrs", "message-passing", "pubsub", "behaviour", "adapter-pattern", "event-sourcing", "process-isolation"]
complexity = "advanced"
implementation_guide = "yes"
code_examples = "yes"
best_practices = "yes"
use_cases = ["large-system-decomposition", "team-autonomy", "model-isolation", "context-communication"]
prerequisites = ["domain-driven-design", "elixir-otp", "umbrella-projects", "system-design"]
learning_path = ["domain-modeling", "strategic-ddd", "context-mapping", "tactical-patterns"]
difficulty = "advanced"
time_to_learn = "2-3 weeks"
industry_usage = "high"
pattern_type = "strategic-design"
architecture_layer = "domain"
quality_gates = ["model-consistency", "context-isolation", "interface-clarity"]
testing_approach = ["context-boundary-testing", "integration-testing", "contract-testing"]
monitoring = ["cross-context-communication", "context-health", "boundary-violations"]
scalability = "high"
design_principles = ["model-isolation", "context-autonomy", "explicit-boundaries", "ubiquitous-language"]
communication_patterns = ["published-interface", "anti-corruption-layer", "context-map"]
evolution_support = "high"
author = "Tomas Korcak (korczis)"
date_modified = "2026-11-10"
+++

## Definice

**Bounded context** (česky *ohraničený kontext*) je strategický vzor doménově řízeného
návrhu (*Domain-Driven Design*, DDD, Eric Evans 2003), který vymezuje výslovnou hranici
kolem doménového modelu; uvnitř ní jsou všechny pojmy, pravidla a vztahy vnitřně
konzistentní. Každý pojem má uvnitř hranice přesný, jednoznačný význam. Napříč hranicemi
může totéž slovo znamenat něco úplně jiného – a to není vada, ale záměrná volba návrhu,
která každému kontextu dovoluje modelovat jeho doménu co nejvěrněji, bez omezení
rozhodnutími jiných kontextů. Ohraničený kontext je hlavním nástrojem DDD pro zvládání
složitosti velkých systémů: místo jediného jednotného modelu celé organizace (který se
nevyhnutelně stane nekonzistentním kompromisem) se systém rozloží na kontexty, z nichž každý
vlastní svůj díl domény.

Pojem řeší základní problém návrhu softwaru: s růstem systému se jediný datový model stává
zdrojem provázanosti a zmatku. Když marketing, bezpečnost a infrastruktura mluví
o „zákazníkovi“, myslí každý něco jiného. Zákazník marketingu má demografii a skóre
zapojení. Zákazník bezpečnosti má hodnocení rizika a stav souladu. Zákazník infrastruktury
má kvóty zdrojů a tarif. Ohraničený kontext dovoluje každému týmu (a každému subsystému)
modelovat „zákazníka“ po svém, přičemž komunikace mezi kontexty probíhá přes dobře definovaná
rozhraní, ne přes sdílené vnitřní modely.

Na Prismatic Platform funguje každá aplikace umbrella projektu jako ohraničený kontext.
Kontext `prismatic_perimeter` definuje „aktivum“ jako prvek vnější útočné plochy (doménu, IP
adresu, certifikát nebo službu vystavenou internetu – viz [EASM](@/glossary/easm.md)),
zatímco `prismatic_storage_core` jako uložitelnou entitu splňující rys `Storable`. Nejde
o soupeřící definice, ale o definice přiměřené kontextu. Komunikace mezi těmito kontexty
probíhá přes protokoly a behaviours Elixiru definované v `prismatic_storage_core`, který
slouží jako sdílené jádro s rysy a kontrakty, aniž by vnucoval doménově specifický význam.

**Vztah ke knize:** pojem patří do kontextu platformy, z níž Kompendium vzešlo. Pro knihu je
poučný z opačné strany: co je v softwaru záměrná volba (týž výraz s jiným významem v jiném
kontextu), je v manipulaci častým nástrojem – nevyslovená změna kontextu, v němž se slovo
vykládá (srov. [Motte and Bailey](@/glossary/motte-and-bailey.md), [EA-4.3.3 Semantic
stability disruption](@/kompendium/techniques/ea-4-3-3-semantic-stability-disruption.md)
a detekční signaturu [Sémantická eroze](@/kompendium/detection-signatures/8-linguistic-semantic-erosion.md)).
Obranou je totéž, co DDD požaduje: výslovně vymezit, v jakém kontextu pojem platí.

## Hranice kontextů na Prismatic Platform

### Aplikace umbrella projektu jako ohraničené kontexty

Aplikace umbrella projektu (v době zápisu 90+) odpovídají přímo ohraničeným kontextům. Každá
aplikace má:

- **vlastní `mix.exs`** s výslovnými závislostmi na jiných kontextech;
- **vlastní jmenný prostor**: `PrismaticPerimeter.*`, `PrismaticAgents.*`, `PrismaticSafety.*`;
- **vlastní `CLAUDE.md`**, který dokumentuje všudypřítomný jazyk a odpovědnosti kontextu;
- **vlastní testy**, které ověřují chování uvnitř kontextu nezávisle;
- **vlastní quality DNA**, která sleduje metriky kvality uvnitř hranice kontextu.

| Kontext (aplikace) | Doména | Klíčové entity | Všudypřítomný jazyk |
|--------------|--------|---------------|---------------------|
| `prismatic_perimeter` | EASM | Asset, SecurityRating, ComplianceAssessment | „objevit“, „posoudit“, „ohodnotit“ |
| `prismatic_agents` | správa agentů | Agent, Tier, Mission, Capability | „nasadit“, „provést“, „vyvíjet“ |
| `prismatic_safety` | vynucení kvality | QualityGate, Violation, HealingCycle | „vynutit“, „odhalit“, „opravit“ |
| `prismatic_storage_core` | kontrakty úložiště | Trait, Protocol, Behaviour | „uložit“, „načíst“, „přizpůsobit“ |
| `prismatic_storage_ets` | úložiště ETS | Table, Cache, TTL | „cachovat“, „vyhledat“, „vypršet“ |
| `prismatic_storage_ecto` | databázové úložiště | Repo, Migration, Changeset | „perzistovat“, „dotazovat“, „migrovat“ |
| `prismatic_claude` | inteligence sezení | StackFrame, SessionLifecycle | „push“, „pop“, „checkpoint“ |
| `prismatic_web` | uživatelské rozhraní | LiveView, Component, Route | „vykreslit“, „navigovat“, „interagovat“ |
| `prismatic_api` | API gateway | Endpoint, Dispatch, Schema | „objevit“, „směrovat“, „odeslat“ |

### Izolace modelů v praxi

Tentýž pojem modelovaný v různých kontextech různě:

```elixir
# In prismatic_perimeter: Asset is an attack surface element
defmodule PrismaticPerimeter.Domain.Asset do
  defstruct [
    :id, :type, :value, :risk_score,
    :first_discovered, :last_seen, :confidence,
    :vulnerabilities, :services
  ]
end

# In prismatic_storage_core: Asset is a storable entity
defmodule PrismaticStorageCore.Traits.Storable do
  @callback store(entity :: term()) :: {:ok, term()} | {:error, term()}
  @callback retrieve(id :: term()) :: {:ok, term()} | {:error, :not_found}
  @callback delete(id :: term()) :: :ok | {:error, term()}
end

# In prismatic_agents: Asset is not a concept at all
# Agents have Missions, Capabilities, and Tiers -- different domain
```
Izolace zajišťuje, že změny v tom, jak `prismatic_perimeter` modeluje aktiva, nemohou
nechtěně rozbít `prismatic_storage_core` ani `prismatic_agents`, protože nesdílejí vnitřní
model.

## Vzorce komunikace mezi kontexty

### Publikované rozhraní

Každý ohraničený kontext vystavuje veřejné API – své publikované rozhraní – prostřednictvím
modulu fasády. Vnitřní implementační podrobnosti jsou za ním skryty (srov. úroveň L1
v [3NL](@/glossary/3nl.md)).

```elixir
# prismatic_perimeter's public interface
defmodule PrismaticPerimeter do
  @moduledoc "Public facade for the EASM bounded context."

  @spec discover(String.t()) :: {:ok, AttackSurface.t()} | {:error, term()}
  def discover(domain), do: PrismaticPerimeter.Discovery.execute(domain)

  @spec security_rating(String.t()) :: {:ok, SecurityRating.t()} | {:error, term()}
  def security_rating(domain), do: PrismaticPerimeter.Rating.calculate(domain)

  @spec assess_compliance(String.t(), [atom()]) :: {:ok, Assessment.t()} | {:error, term()}
  def assess_compliance(domain, frameworks), do: PrismaticPerimeter.Compliance.assess(domain, frameworks)
end
```
### Komunikace mezi kontexty přes PubSub

Kontexty spolu komunikují událostmi PubSub místo přímých volání funkcí, a zachovávají tak
volnou provázanost:

```elixir
# prismatic_perimeter publishes an event when a rating changes
defmodule PrismaticPerimeter.Events do
  def publish_rating_change(domain, old_rating, new_rating) do
    Phoenix.PubSub.broadcast(
      PrismaticPubSub,
      "perimeter:ratings",
      {:rating_changed, %{
        domain: domain,
        old_grade: old_rating.grade,
        new_grade: new_rating.grade,
        changed_at: DateTime.utc_now()
      }}
    )
  end
end

# prismatic_web subscribes and updates the dashboard
defmodule PrismaticWeb.PerimeterDashboardLive do
  use PrismaticWeb, :live_view

  def mount(_params, _session, socket) do
    Phoenix.PubSub.subscribe(PrismaticPubSub, "perimeter:ratings")
    {:ok, assign(socket, ratings: load_current_ratings())}
  end

  def handle_info({:rating_changed, event}, socket) do
    {:noreply, update(socket, :ratings, &update_rating(&1, event))}
  end
end
```
### Protikorupční vrstva (*Anti-Corruption Layer*)

Při přebírání dat z vnějších systémů (poskytovatelé OSINT, API třetích stran) používá
platforma protikorupční vrstvy, které převádějí vnější modely na vnitřní model ohraničeného
kontextu:

| Vnější zdroj | Vnější model | Vnitřní model | Převod |
|----------------|---------------|----------------|-------------|
| [Shodan](@/glossary/shodan.md) | záznam hostitele Shodan | `PrismaticPerimeter.Domain.Asset` | `ShodanAdapter.to_asset/1` |
| [Censys](@/glossary/censys.md) | certifikát Censys | `PrismaticPerimeter.Domain.Certificate` | `CensysAdapter.to_certificate/1` |
| regulace NIS2 | specifikace rámce souladu | `PrismaticPerimeter.Domain.ComplianceFramework` | `NIS2Adapter.to_framework/1` |

```elixir
# Anti-corruption layer: translate Shodan response to internal model
defmodule PrismaticPerimeter.Adapters.ShodanAdapter do
  @behaviour PrismaticPerimeter.Ports.OsintProvider

  def to_asset(%{"ip_str" => ip, "ports" => ports, "hostnames" => hosts} = raw) do
    %PrismaticPerimeter.Domain.Asset{
      id: generate_asset_id(ip),
      type: :ip_address,
      value: ip,
      services: Enum.map(ports, &to_service/1),
      first_discovered: DateTime.utc_now(),
      confidence: calculate_confidence(raw)
    }
  end
end
```
Protikorupční vrstva je zvláštním případem vzoru [adaptér](@/glossary/adapter-pattern.md);
rámce souladu podrobněji popisuje heslo [Compliance
Framework](@/glossary/compliance-framework.md).

## Vzorce mapování kontextů

DDD definuje několik vzorců vztahů mezi ohraničenými kontexty.

### Sdílené jádro (*Shared Kernel*)

Malá, výslovně sdílená podmnožina doménového modelu, na níž závisí více kontextů. Změny
sdíleného jádra vyžadují souhlas všech kontextů, které je používají.

```
prismatic_storage_core (Shared Kernel)
    |
    +---> prismatic_storage_ets (implements traits)
    |
    +---> prismatic_storage_ecto (implements traits)
    |
    +---> prismatic_storage_meilisearch (implements traits)
    |
    +---> prismatic_storage_kuzudb (implements traits)
```
### Zákazník a dodavatel (*Customer-Supplier*)

Jeden kontext (dodavatel) poskytuje data, na nichž jiný (zákazník) závisí. Dodavatel při
návrhu rozhraní upřednostňuje potřeby zákazníka.

```
prismatic_perimeter (Supplier)
    |
    +---> prismatic_web (Customer: needs rating data for dashboard)
    |
    +---> prismatic_api (Customer: needs rating data for REST API)
```
### Oddělené cesty (*Separate Ways*)

Kontexty bez potřeby integrace pracují nezávisle. Na platformě fungují pomocné aplikace jako
`prismatic_utils` a `prismatic_telemetry` převážně nezávisle na doménově specifických
kontextech.

## Vývoj a refaktoring

Ohraničené kontexty nejsou dány jednou provždy při návrhu – vyvíjejí se, jak se porozumění
doméně prohlubuje. Platforma během svých generací vývoje prošla několika rozděleními
a sloučeními kontextů:

| Generace | Změna kontextu | Důvod |
|------------|---------------|------------|
| Gen 3 | rozdělení `prismatic` na `prismatic` a `prismatic_web` | oddělit API od UI |
| Gen 7 | vyčlenění `prismatic_storage_core` z `prismatic_storage` | izolovat rysy od implementací |
| Gen 12 | vznik `prismatic_perimeter` | nová doména EASM potřebovala vlastní kontext |
| Gen 15 | vznik `prismatic_claude` | inteligence sezení potřebovala vlastní doménový model |
| Gen 17 | vznik `prismatic_api` | samointrospektivní API si žádalo vlastní kontext |

Každé rozdělení sleduje vzorec: když jeden kontext začne obsahovat pojmy s rozdílnými
životními cykly nebo s různými skupinami zainteresovaných, je to signál, že se za jeden
kontext vydávají dva.

## Izolace procesů jako vynucení kontextu

Izolace procesů ve virtuálním stroji BEAM poskytuje mechanismus, který hranice ohraničených
kontextů vynucuje za běhu. Procesy každého kontextu běží izolovaně – pád v
`prismatic_perimeter` nemůže poškodit stav `prismatic_agents`, protože jde o samostatné
aplikace OTP se samostatnými stromy supervize.

Je to víc, než nabízí většina programovacích prostředí. V typické architektuře mikroslužeb
jsou hranice kontextů vynucovány síťovými voláními (které lze obejít sdílenou databází).
V BEAM je vynucuje sám virtuální stroj – procesy nemají přístup k paměti jiných procesů
a jediným komunikačním mechanismem je předávání zpráv.

## Pokročilé vzory návrhu kontextů

### Hexagonální architektura uvnitř kontextů

Každý ohraničený kontext platformy sleduje hexagonální architekturu (porty a adaptéry), aby
udržel čisté hranice mezi doménovou logikou a technickými záležitostmi:

```elixir
defmodule PrismaticPerimeter.Architecture do
  @moduledoc """
  Hexagonal architecture implementation within the EASM bounded context.

  Domain Core (hexagon center):
  - Domain models: Asset, SecurityRating, ComplianceAssessment
  - Domain services: RatingCalculator, ComplianceAnalyzer
  - Domain events: AssetDiscovered, RatingChanged, ComplianceUpdated

  Ports (hexagon edges):
  - Primary ports: AssetDiscovery, SecurityRating, ComplianceAssessment
  - Secondary ports: OsintProvider, NotificationService, StorageRepository

  Adapters (outside hexagon):
  - Primary adapters: REST API controllers, GraphQL resolvers
  - Secondary adapters: Shodan, Censys, Ecto repositories, email services
  """

  # Primary port - what the context offers to the outside world
  defmodule Ports.AssetDiscovery do
    @moduledoc "Port for external asset discovery operations."

    @callback discover_assets(String.t()) :: {:ok, [Asset.t()]} | {:error, term()}
    @callback track_asset_changes(Asset.t()) :: :ok | {:error, term()}
    @callback get_discovery_status(String.t()) :: {:ok, DiscoveryStatus.t()} | {:error, term()}
  end

  # Secondary port - what the context needs from external systems
  defmodule Ports.OsintProvider do
    @moduledoc "Port for OSINT data sources."

    @callback search_hosts(String.t()) :: {:ok, [HostData.t()]} | {:error, term()}
    @callback get_certificates(String.t()) :: {:ok, [CertificateData.t()]} | {:error, term()}
    @callback enumerate_services(String.t()) :: {:ok, [ServiceData.t()]} | {:error, term()}
  end

  # Domain service - pure business logic
  defmodule Domain.AssetDiscoveryService do
    @moduledoc "Core domain service for asset discovery logic."

    alias PrismaticPerimeter.Domain.{Asset, DiscoveryContext, RiskAnalyzer}

    @spec discover_and_analyze(String.t(), DiscoveryContext.t()) ::
            {:ok, [Asset.t()]} | {:error, term()}
    def discover_and_analyze(target, context) do
      with {:ok, raw_assets} <- gather_raw_assets(target, context),
           {:ok, analyzed_assets} <- analyze_assets(raw_assets, context),
           {:ok, risk_assessed} <- assess_risks(analyzed_assets, context) do
        {:ok, risk_assessed}
      end
    end

    defp gather_raw_assets(target, context) do
      # Coordinate multiple OSINT providers through ports
      providers = context.enabled_providers

      results = Enum.map(providers, fn provider ->
        Task.async(fn ->
          provider.search_hosts(target)
        end)
      end)
      |> Task.await_many(30_000)

      # Aggregate results while maintaining provenance
      assets = results
      |> Enum.filter(&match?({:ok, _}, &1))
      |> Enum.flat_map(fn {:ok, data} -> data end)
      |> deduplicate_assets()

      {:ok, assets}
    end

    defp analyze_assets(assets, context) do
      analyzed = Enum.map(assets, fn asset ->
        %Asset{asset |
          risk_score: RiskAnalyzer.calculate_risk(asset, context.risk_model),
          confidence: calculate_confidence(asset),
          analyzed_at: DateTime.utc_now()
        }
      end)

      {:ok, analyzed}
    end
  end

  # Primary adapter - REST API
  defmodule Adapters.RestApi do
    @moduledoc "REST API adapter for the EASM context."

    use PrismaticApi.Controller
    alias PrismaticPerimeter.Ports.AssetDiscovery

    @impl true
    def discover(conn, %{"target" => target}) do
      case AssetDiscovery.discover_assets(target) do
        {:ok, assets} ->
          conn
          |> put_status(:ok)
          |> json(%{
            status: "success",
            target: target,
            assets_discovered: length(assets),
            assets: serialize_assets(assets)
          })

        {:error, reason} ->
          conn
          |> put_status(:unprocessable_entity)
          |> json(%{status: "error", reason: inspect(reason)})
      end
    end

    defp serialize_assets(assets) do
      Enum.map(assets, &serialize_asset/1)
    end

    defp serialize_asset(asset) do
      %{
        id: asset.id,
        type: asset.type,
        value: asset.value,
        risk_score: asset.risk_score,
        confidence: asset.confidence,
        discovered_at: asset.first_discovered,
        services: serialize_services(asset.services)
      }
    end
  end

  # Secondary adapter - Shodan integration
  defmodule Adapters.ShodanProvider do
    @moduledoc "Shodan OSINT provider adapter."

    @behaviour PrismaticPerimeter.Ports.OsintProvider

    alias PrismaticPerimeter.External.ShodanClient

    @impl true
    def search_hosts(target) do
      with {:ok, response} <- ShodanClient.search(target),
           {:ok, normalized} <- normalize_shodan_response(response) do
        {:ok, normalized}
      end
    end

    defp normalize_shodan_response(%{"matches" => matches}) do
      hosts = Enum.map(matches, &normalize_shodan_host/1)
      {:ok, hosts}
    end

    defp normalize_shodan_host(shodan_host) do
      # Anti-corruption layer: translate Shodan's model to our domain model
      %PrismaticPerimeter.Domain.HostData{
        ip_address: shodan_host["ip_str"],
        port: shodan_host["port"],
        protocol: shodan_host["transport"],
        service: shodan_host["product"],
        version: shodan_host["version"],
        banner: shodan_host["data"],
        country: get_in(shodan_host, ["location", "country_code"]),
        organization: shodan_host["org"],
        asn: shodan_host["asn"],
        hostnames: shodan_host["hostnames"] || [],
        timestamp: parse_shodan_timestamp(shodan_host["timestamp"])
      }
    end
  end
end
```
### Event sourcing v kontextu

Ohraničené kontexty platformy používají *event sourcing* (ukládání sledu událostí), aby
udržely auditní stopu a umožnily dotazy na stav v čase:

```elixir
defmodule PrismaticPerimeter.EventSourcing do
  @moduledoc """
  Event sourcing implementation for the EASM bounded context.

  All state changes are captured as domain events, providing:
  - Complete audit trail of all operations
  - Ability to replay state at any point in time
  - Support for event-driven communication with other contexts
  - Basis for CQRS read model projections
  """

  # Domain events
  defmodule Events.AssetDiscovered do
    @derive Jason.Encoder
    defstruct [
      :asset_id, :domain, :asset_type, :asset_data,
      :discovery_method, :confidence, :discovered_at,
      :event_id, :event_version, :correlation_id
    ]
  end

  defmodule Events.SecurityRatingChanged do
    @derive Jason.Encoder
    defstruct [
      :asset_id, :domain, :old_rating, :new_rating,
      :rating_factors, :calculated_at, :changed_by,
      :event_id, :event_version, :correlation_id
    ]
  end

  defmodule Events.ComplianceViolationDetected do
    @derive Jason.Encoder
    defstruct [
      :asset_id, :framework, :violation_type, :severity,
      :requirement, :evidence, :detected_at,
      :event_id, :event_version, :correlation_id
    ]
  end

  # Event store
  defmodule EventStore do
    @moduledoc "Event storage and retrieval for the EASM context."

    use GenServer

    def start_link(opts) do
      GenServer.start_link(__MODULE__, opts, name: __MODULE__)
    end

    @spec append_event(String.t(), term()) :: :ok | {:error, term()}
    def append_event(stream_id, event) do
      GenServer.call(__MODULE__, {:append_event, stream_id, event})
    end

    @spec read_events(String.t(), non_neg_integer()) :: {:ok, [term()]} | {:error, term()}
    def read_events(stream_id, from_version \\ 0) do
      GenServer.call(__MODULE__, {:read_events, stream_id, from_version})
    end

    @spec read_all_events(DateTime.t()) :: {:ok, [term()]} | {:error, term()}
    def read_all_events(from_timestamp) do
      GenServer.call(__MODULE__, {:read_all_events, from_timestamp})
    end

    def init(opts) do
      storage_adapter = Keyword.get(opts, :storage, :ets)

      state = case storage_adapter do
        :ets ->
          table = :ets.new(:event_store, [:ordered_set, :public, :named_table])
          %{adapter: :ets, table: table}
        :postgres ->
          %{adapter: :postgres, repo: PrismaticStorage.Repo}
      end

      {:ok, state}
    end

    def handle_call({:append_event, stream_id, event}, _from, state) do
      event_with_metadata = add_event_metadata(event, stream_id)

      case store_event(event_with_metadata, stream_id, state) do
        :ok ->
          publish_event(event_with_metadata)
          {:reply, :ok, state}
        error ->
          {:reply, error, state}
      end
    end

    def handle_call({:read_events, stream_id, from_version}, _from, state) do
      events = retrieve_events(stream_id, from_version, state)
      {:reply, {:ok, events}, state}
    end

    defp add_event_metadata(event, stream_id) do
      %{event |
        event_id: generate_event_id(),
        event_version: get_next_version(stream_id),
        correlation_id: get_correlation_id()
      }
    end

    defp publish_event(event) do
      # Publish to PubSub for other contexts to consume
      Phoenix.PubSub.broadcast(
        PrismaticPubSub,
        "easm:events",
        {:domain_event, event}
      )

      # Also publish specific event types
      event_type = event.__struct__ |> Module.split() |> List.last()
      Phoenix.PubSub.broadcast(
        PrismaticPubSub,
        "easm:#{event_type}",
        {:domain_event, event}
      )
    end
  end

  # Event-sourced aggregate
  defmodule Domain.AssetAggregate do
    @moduledoc "Event-sourced aggregate for EASM assets."

    defstruct [
      :id, :current_state, :version, :uncommitted_events
    ]

    def new(id) do
      %__MODULE__{
        id: id,
        current_state: %{},
        version: 0,
        uncommitted_events: []
      }
    end

    def load_from_history(id, events) do
      Enum.reduce(events, new(id), fn event, aggregate ->
        apply_event(aggregate, event)
      end)
    end

    def discover_asset(aggregate, asset_data, discovery_context) do
      event = %Events.AssetDiscovered{
        asset_id: aggregate.id,
        domain: asset_data.domain,
        asset_type: asset_data.type,
        asset_data: asset_data,
        discovery_method: discovery_context.method,
        confidence: asset_data.confidence,
        discovered_at: DateTime.utc_now()
      }

      add_event(aggregate, event)
    end

    def update_security_rating(aggregate, new_rating, rating_factors) do
      current_rating = get_in(aggregate.current_state, [:security_rating])

      if current_rating != new_rating do
        event = %Events.SecurityRatingChanged{
          asset_id: aggregate.id,
          domain: aggregate.current_state.domain,
          old_rating: current_rating,
          new_rating: new_rating,
          rating_factors: rating_factors,
          calculated_at: DateTime.utc_now()
        }

        add_event(aggregate, event)
      else
        aggregate
      end
    end

    defp add_event(aggregate, event) do
      %{aggregate |
        uncommitted_events: [event | aggregate.uncommitted_events]
      }
      |> apply_event(event)
    end

    defp apply_event(aggregate, %Events.AssetDiscovered{} = event) do
      new_state = %{
        domain: event.domain,
        type: event.asset_type,
        data: event.asset_data,
        discovered_at: event.discovered_at,
        confidence: event.confidence
      }

      %{aggregate |
        current_state: new_state,
        version: aggregate.version + 1
      }
    end

    defp apply_event(aggregate, %Events.SecurityRatingChanged{} = event) do
      new_state = Map.put(aggregate.current_state, :security_rating, event.new_rating)

      %{aggregate |
        current_state: new_state,
        version: aggregate.version + 1
      }
    end
  end
end
```
### Integrační vzory kontextů

Pokročilé vzory integrace ohraničených kontextů při zachování jejich autonomie:

```elixir
defmodule PrismaticPlatform.ContextIntegration do
  @moduledoc """
  Integration patterns between bounded contexts in the Prismatic Platform.

  Provides infrastructure for:
  - Saga orchestration across contexts
  - Distributed transaction compensation
  - Event-driven process management
  - Cross-context query coordination
  """

  # Saga pattern for cross-context workflows
  defmodule Sagas.ComprehensiveAssessment do
    @moduledoc """
    Saga orchestrating a comprehensive security assessment across multiple contexts.

    Steps:
    1. Perimeter discovers assets
    2. Intelligence analyzes threats
    3. Agents execute targeted scans
    4. Safety validates results
    5. Web updates dashboard
    """

    use GenStateMachine

    def start_link(target_domain) do
      GenStateMachine.start_link(__MODULE__, %{target: target_domain})
    end

    def init(%{target: target}) do
      saga_id = generate_saga_id()

      initial_data = %{
        saga_id: saga_id,
        target: target,
        steps_completed: [],
        compensation_needed: [],
        results: %{}
      }

      {:ok, :started, initial_data, [{:next_event, :internal, :begin_discovery}]}
    end

    def handle_event(:internal, :begin_discovery, :started, data) do
      # Step 1: Discover assets via Perimeter context
      case PrismaticPerimeter.discover(data.target) do
        {:ok, assets} ->
          updated_data = %{data |
            steps_completed: [:discovery | data.steps_completed],
            results: Map.put(data.results, :assets, assets)
          }
          {:next_state, :discovery_complete, updated_data,
           [{:next_event, :internal, :analyze_threats}]}

        {:error, reason} ->
          # Saga fails, no compensation needed yet
          {:next_state, :failed, %{data | failure_reason: reason}}
      end
    end

    def handle_event(:internal, :analyze_threats, :discovery_complete, data) do
      # Step 2: Analyze threats via Intelligence context
      assets = data.results.assets

      case PrismaticIntelligence.analyze_threats(assets) do
        {:ok, threat_analysis} ->
          updated_data = %{data |
            steps_completed: [:threat_analysis | data.steps_completed],
            results: Map.put(data.results, :threats, threat_analysis)
          }
          {:next_state, :threats_analyzed, updated_data,
           [{:next_event, :internal, :execute_scans}]}

        {:error, reason} ->
          # Need to compensate discovery step
          compensate_discovery(data)
          {:next_state, :compensating, %{data |
            failure_reason: reason,
            compensation_needed: [:discovery]
          }}
      end
    end

    def handle_event(:internal, :execute_scans, :threats_analyzed, data) do
      # Step 3: Execute targeted scans via Agents context
      threats = data.results.threats
      high_risk_targets = filter_high_risk_targets(threats)

      case PrismaticAgents.execute_targeted_scans(high_risk_targets) do
        {:ok, scan_results} ->
          updated_data = %{data |
            steps_completed: [:scans | data.steps_completed],
            results: Map.put(data.results, :scans, scan_results)
          }
          {:next_state, :scans_complete, updated_data,
           [{:next_event, :internal, :validate_results}]}

        {:error, reason} ->
          # Compensate previous steps
          compensate_threat_analysis(data)
          compensate_discovery(data)
          {:next_state, :compensating, %{data |
            failure_reason: reason,
            compensation_needed: [:threat_analysis, :discovery]
          }}
      end
    end

    def handle_event(:internal, :validate_results, :scans_complete, data) do
      # Step 4: Validate results via Safety context
      all_results = data.results

      case PrismaticSafety.validate_assessment(all_results) do
        {:ok, validation} ->
          if validation.passed do
            updated_data = %{data |
              steps_completed: [:validation | data.steps_completed],
              results: Map.put(data.results, :validation, validation)
            }
            {:next_state, :validated, updated_data,
             [{:next_event, :internal, :update_dashboard}]}
          else
            # Validation failed, compensate all steps
            compensate_all_steps(data)
            {:next_state, :compensating, %{data |
              failure_reason: :validation_failed,
              compensation_needed: [:scans, :threat_analysis, :discovery]
            }}
          end

        {:error, reason} ->
          compensate_all_steps(data)
          {:next_state, :compensating, %{data |
            failure_reason: reason,
            compensation_needed: [:scans, :threat_analysis, :discovery]
          }}
      end
    end

    def handle_event(:internal, :update_dashboard, :validated, data) do
      # Step 5: Update dashboard via Web context
      case PrismaticWeb.update_assessment_dashboard(data.target, data.results) do
        :ok ->
          # Saga completed successfully
          publish_saga_completion(data)
          {:next_state, :completed, data}

        {:error, reason} ->
          # Dashboard update failed, but we don't compensate for this
          # The assessment is still valid, just not displayed
          Logger.warn("Dashboard update failed for saga #{data.saga_id}: #{inspect(reason)}")
          {:next_state, :completed, data}
      end
    end

    # Compensation functions
    defp compensate_discovery(data) do
      # Remove discovered assets from cache, cancel pending operations
      PrismaticPerimeter.cancel_discovery(data.target)
    end

    defp compensate_threat_analysis(data) do
      # Clear threat analysis cache, cancel analysis jobs
      PrismaticIntelligence.cancel_threat_analysis(data.results.assets)
    end

    defp compensate_all_steps(data) do
      compensate_discovery(data)
      compensate_threat_analysis(data)
      # Scans may have started external processes, need to cancel them
      if Map.has_key?(data.results, :scans) do
        PrismaticAgents.cancel_scans(data.results.scans)
      end
    end
  end

  # Context query coordinator for read operations
  defmodule QueryCoordinator do
    @moduledoc """
    Coordinates queries across multiple bounded contexts for complex read operations.
    """

    @spec get_comprehensive_security_overview(String.t()) :: {:ok, map()} | {:error, term()}
    def get_comprehensive_security_overview(domain) do
      # Parallel queries across contexts
      query_tasks = [
        Task.async(fn -> {"perimeter", PrismaticPerimeter.get_attack_surface(domain)} end),
        Task.async(fn -> {"intelligence", PrismaticIntelligence.get_threat_profile(domain)} end),
        Task.async(fn -> {"agents", PrismaticAgents.get_scan_history(domain)} end),
        Task.async(fn -> {"safety", PrismaticSafety.get_quality_metrics(domain)} end)
      ]

      # Await all queries with timeout
      results = Task.await_many(query_tasks, 30_000)

      # Combine results while maintaining context boundaries
      overview = Enum.reduce(results, %{}, fn {context, result}, acc ->
        case result do
          {:ok, data} -> Map.put(acc, context, data)
          {:error, reason} -> Map.put(acc, context, %{error: reason})
        end
      end)

      # Enhance with cross-context correlations
      enhanced_overview = add_cross_context_insights(overview)

      {:ok, enhanced_overview}
    end

    defp add_cross_context_insights(overview) do
      # Example: correlate perimeter findings with agent scan results
      case {overview["perimeter"], overview["agents"]} do
        {%{assets: assets}, %{scans: scans}} when is_list(assets) and is_list(scans) ->
          correlations = correlate_assets_with_scans(assets, scans)
          Map.put(overview, :correlations, correlations)
        _ ->
          overview
      end
    end

    defp correlate_assets_with_scans(assets, scans) do
      # Find assets that were also covered by agent scans
      Enum.flat_map(assets, fn asset ->
        matching_scans = Enum.filter(scans, fn scan ->
          asset_matches_scan_target?(asset, scan)
        end)

        if not Enum.empty?(matching_scans) do
          [%{
            asset_id: asset.id,
            asset_type: asset.type,
            matching_scans: length(matching_scans),
            scan_confirmation: determine_scan_confirmation(asset, matching_scans)
          }]
        else
          []
        end
      end)
    end
  end
end
```
## Strategie testování kontextů

Testování ohraničených kontextů vyžaduje zvláštní přístupy, aby se zachovala izolace a přitom
fungovala integrace:

```elixir
defmodule PrismaticPerimeter.ContextTest do
  @moduledoc """
  Testing strategies for bounded context isolation and integration.
  """

  use ExUnit.Case
  import ExUnit.CaptureLog

  # Context boundary testing
  describe "context boundary enforcement" do
    test "contexts cannot access each other's internal modules" do
      # Attempt to access internal module from another context should fail
      assert_raise UndefinedFunctionError, fn ->
        PrismaticAgents.Internal.SomeModule.private_function()
      end
    end

    test "contexts communicate only through published interfaces" do
      # Test that only facade modules are accessible
      assert function_exported?(PrismaticPerimeter, :discover, 1)
      assert function_exported?(PrismaticPerimeter, :security_rating, 1)

      # Internal modules should not be part of public API
      refute Code.ensure_loaded?(PrismaticPerimeter.Internal.DiscoveryEngine)
    end
  end

  # Contract testing between contexts
  describe "cross-context contracts" do
    test "perimeter context provides expected interface to web context" do
      # Test the contract that web context depends on
      assert {:ok, _rating} = PrismaticPerimeter.security_rating("example.com")
      assert {:ok, _assets} = PrismaticPerimeter.discover("example.com")
    end

    test "perimeter events match web context expectations" do
      # Test event structure compatibility
      Phoenix.PubSub.subscribe(PrismaticPubSub, "perimeter:ratings")

      # Trigger a rating change
      PrismaticPerimeter.update_security_rating("example.com", :B, %{reason: "test"})

      assert_receive {:rating_changed, event}
      assert Map.has_key?(event, :domain)
      assert Map.has_key?(event, :old_grade)
      assert Map.has_key?(event, :new_grade)
      assert Map.has_key?(event, :changed_at)
    end
  end

  # Integration testing with external systems
  describe "anti-corruption layer testing" do
    test "shodan adapter correctly translates external data" do
      external_data = %{
        "ip_str" => "93.184.216.34",
        "ports" => [80, 443],
        "hostnames" => ["example.com"],
        "org" => "Example Organization"
      }

      {:ok, asset} = PrismaticPerimeter.Adapters.ShodanAdapter.to_asset(external_data)

      assert asset.type == :ip_address
      assert asset.value == "93.184.216.34"
      assert length(asset.services) == 2
      assert asset.confidence > 0.0
    end
  end
end
```
## Související pojmy

Bez vlastního hesla v glosáři knihy: *Domain-Driven Design* (strategická metodika, která
ohraničené kontexty definuje), *CQRS* (oddělení modelů pro čtení a zápis), *Event Sourcing*,
*Message Passing*, *PubSub*, *Behaviour* (kontrakty zpětných volání definující porty na
hranicích kontextů), *Process Isolation*, *BEAM*, *Ecto*, *Umbrella Application* (technický
mechanismus implementace kontextů) a *Saga Pattern* (koordinace postupů napříč kontexty).

## Související

**Platforma**

- [Adapter Pattern](@/glossary/adapter-pattern.md) – implementace protikorupční vrstvy pro
  vnější systémy.
- [3NL](@/glossary/3nl.md) – architektura vnořených úrovní, s níž jsou kontexty sladěny.
- [Agent](@/glossary/agent.md) – agenti AIAD působící v příslušných kontextech.
- [Shodan](@/glossary/shodan.md) a [Censys](@/glossary/censys.md) – vnější zdroje, jejichž
  modely se převádějí.
- [Compliance Framework](@/glossary/compliance-framework.md) – rámce souladu jako vnější
  model.

**Kompendium**

- [Motte and Bailey](@/glossary/motte-and-bailey.md) – zneužití změny kontextu významu
  v argumentaci.
- [Sémantická eroze](@/kompendium/detection-signatures/8-linguistic-semantic-erosion.md) –
  detekce nevyslovené změny významu.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: bounded-context](@/kompendium/glossary-bridges/bridge-bounded-context.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
