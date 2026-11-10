+++
title = "Adapter Pattern (vzor adaptér)"
weight = 45
description = "Jednotné rozhraní úložiště Prismatic Platform, které pomocí behaviours v Elixiru a kontraktů ověřovaných při kompilaci zastírá sedm různých backendových technologií."

[taxonomies]
tags = ["glossary", "architecture", "design-patterns", "storage", "prismatic"]

[extra]
category = "storage"
related_terms = ["behaviour", "protocol", "ets", "kuzudb", "meilisearch", "duckdb", "ecto", "connection-pooling", "openapi-spec", "umbrella-application", "plug", "typespec"]
status = "active"
author = "Tomas Korcak (korczis)"
reading_time = "20 min"
difficulty = "advanced"
quality_score = 96
platforms = ["Prismatic Platform", "BEAM/OTP", "Phoenix LiveView"]
key_takeaway = "Vzor adaptér realizovaný přes behaviours v Elixiru umožňuje Prismatic Platform skrýt sedm backendů úložiště za jednotné rozhraní s kontraktem ověřovaným při kompilaci a s volbou backendu za běhu."
date_created = "2026-02-22"
date_updated = "2026-11-10"
related_concepts = ["strukturální návrhový vzor", "abstrakce rozhraní", "skládání backendů", "testování kontraktů", "inverze závislostí"]
see_also = ["behaviour", "protocol", "ets", "ecto", "kuzudb", "meilisearch"]
date_modified = "2026-11-10"
keywords = ["Adapter", "Pattern", "vzor adaptér", "Elixir", "glosář", "úložiště", "Prismatic Platform", "PostgreSQL"]
image = "/images/sections/glossary.png"
image_alt = "Adapter Pattern – Prismatic Platform"
+++

## Definice

**Vzor adaptér** (*Adapter Pattern*) je strukturální návrhový vzor, který definuje jednotné
rozhraní, jehož prostřednictvím klientský kód pracuje s různými backendovými
implementacemi. Zavedením kontraktu (rozhraní adaptéru) a jeho implementací pro každý
backend vzor odděluje aplikační logiku od infrastruktury: byznysový kód závisí jen na
abstraktním rozhraní, nikdy na konkrétní technologii. Adaptéry lze vyměňovat, skládat nebo
vrstvit, aniž by se měnil kód, který je používá.

V klasické formulaci „Gang of Four“ vzor adaptér převádí jedno rozhraní na jiné, které
klient očekává. Prismatic Platform jde dál: definuje kanonické rozhraní úložiště pomocí
*behaviours* Elixiru a implementuje je pro sedm různých technologií úložiště, každou
optimalizovanou pro jiný způsob přístupu. Nejde jen o převod rozhraní, ale o úplnou
abstrakční vrstvu, která umožňuje průhledné operace nad více backendy, vrstvenou mezipaměť
a testování řízené kontraktem napříč všemi implementacemi.

Síla vzoru v kontextu platformy plyne z ověřování behaviours při kompilaci. Když adaptér
úložiště prohlásí, že implementuje behaviour `PrismaticStorage.Core`, Dialyzer při
kompilaci ověří, že jsou implementována všechna požadovaná zpětná volání se správnými
typovými signaturami. To dává stejné záruky jako implementace rozhraní ve staticky
typovaných jazycích a přitom zachovává pružnost dynamického volání a porovnávání vzorů
v Elixiru.

**Vztah ke knize:** heslo patří do kontextu softwarové platformy, z níž Kompendium
vzešlo; v architektuře [3NL](@/glossary/3nl.md) je vzor adaptér typickým vzorem úrovně L3.
Pro čtenáře knihy může posloužit jako technická analogie toho, co Kompendium požaduje od
poznávání: oddělit úsudek od konkrétního zdroje a každý zdroj podrobit stejnému
„kontraktu“ ověření (srov. [Triangulace
zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md)).

## Přehled architektury úložiště

Vrstva úložiště platformy je uspořádána jako soubor aplikací umbrella projektu; každá
implementuje základní behaviour úložiště pro určitou backendovou technologii.

| Aplikace | Backend | Optimalizováno pro | Latence | Použití |
|-------------|---------|---------------|---------|----------|
| `prismatic_storage_ets` | ETS | klíč–hodnota, souběžné čtení | mikrosekundy | horká mezipaměť, pracovní paměť |
| `prismatic_storage_ecto` | PostgreSQL přes Ecto | relační dotazy, transakce | milisekundy | trvalé úložiště, ACID |
| `prismatic_storage_meilisearch` | Meilisearch | fulltextové vyhledávání | milisekundy | objevování obsahu, hledání |
| `prismatic_storage_kuzudb` | KuzuDB | průchod grafem, dotazy na cesty | milisekundy | grafy vztahů, ontologie |
| `prismatic_storage_duckdb` | DuckDB | analytické OLAP, sloupcové | milisekundy | analytika, agregace |
| `prismatic_storage_redis` | Redis | pub/sub, distribuovaná mezipaměť | pod milisekundu | stav napříč uzly, cache |
| `prismatic_storage_file` | souborový systém | ukládání dokumentů | milisekundy | zprávy, exporty, artefakty |

Každý adaptér žije ve vlastní aplikaci umbrella projektu s nezávislými závislostmi, testy
a konfigurací. Díky této izolaci přidání nového backendu nevyžaduje žádné změny stávajících
adaptérů ani aplikačního kódu, který abstraktní rozhraní používá.

## Kontrakty založené na behaviours

Vzor adaptér na platformě stojí na *behaviours* Elixiru, které vynucují kontrakt při
kompilaci pomocí deklarací `@callback`.

### Definice základního behaviour

```elixir
defmodule PrismaticStorage.Core do
  @moduledoc """
  Core storage behaviour defining the contract all adapters must implement.
  """

  @type key :: binary() | atom()
  @type value :: term()
  @type opts :: keyword()
  @type error :: {:error, term()}

  @callback get(key(), opts()) :: {:ok, value()} | {:ok, nil} | error()
  @callback put(key(), value(), opts()) :: {:ok, value()} | error()
  @callback delete(key(), opts()) :: :ok | error()
  @callback list(opts()) :: {:ok, [value()]} | error()
  @callback exists?(key(), opts()) :: {:ok, boolean()} | error()
  @callback count(opts()) :: {:ok, non_neg_integer()} | error()

  @callback query(map(), opts()) :: {:ok, [value()]} | error()
  @callback bulk_put([{key(), value()}], opts()) :: {:ok, non_neg_integer()} | error()
  @callback bulk_delete([key()], opts()) :: {:ok, non_neg_integer()} | error()

  @optional_callbacks [query: 2, bulk_put: 2, bulk_delete: 2]
end
```
### Implementace adaptéru

Každý adaptér implementuje základní behaviour a převádí abstraktní operace na volání
specifická pro daný backend.

```elixir
defmodule PrismaticStorage.ETS do
  @behaviour PrismaticStorage.Core

  @impl true
  def get(key, opts) do
    table = Keyword.fetch!(opts, :table)
    case :ets.lookup(table, key) do
      [{^key, value}] -> {:ok, value}
      [] -> {:ok, nil}
    end
  end

  @impl true
  def put(key, value, opts) do
    table = Keyword.fetch!(opts, :table)
    true = :ets.insert(table, {key, value})
    {:ok, value}
  end

  @impl true
  def delete(key, opts) do
    table = Keyword.fetch!(opts, :table)
    true = :ets.delete(table, key)
    :ok
  end

  @impl true
  def list(opts) do
    table = Keyword.fetch!(opts, :table)
    values = :ets.tab2list(table) |> Enum.map(&elem(&1, 1))
    {:ok, values}
  end

  @impl true
  def exists?(key, opts) do
    table = Keyword.fetch!(opts, :table)
    {:ok, :ets.member(table, key)}
  end

  @impl true
  def count(opts) do
    table = Keyword.fetch!(opts, :table)
    {:ok, :ets.info(table, :size)}
  end
end
```
```elixir
defmodule PrismaticStorage.Ecto do
  @behaviour PrismaticStorage.Core

  @impl true
  def get(key, opts) do
    repo = Keyword.fetch!(opts, :repo)
    schema = Keyword.fetch!(opts, :schema)
    case repo.get(schema, key) do
      nil -> {:ok, nil}
      record -> {:ok, record}
    end
  end

  @impl true
  def put(key, value, opts) do
    repo = Keyword.fetch!(opts, :repo)
    schema = Keyword.fetch!(opts, :schema)
    changeset = schema.changeset(struct(schema), Map.put(value, :id, key))
    case repo.insert_or_update(changeset) do
      {:ok, record} -> {:ok, record}
      {:error, changeset} -> {:error, changeset}
    end
  end

  @impl true
  def query(filters, opts) do
    repo = Keyword.fetch!(opts, :repo)
    schema = Keyword.fetch!(opts, :schema)
    results = build_query(schema, filters) |> repo.all()
    {:ok, results}
  end

  # ... remaining callbacks
end
```
## Testování kontraktu

Sada testů kontraktu adaptéru zajišťuje, že každá implementace splňuje úplnou specifikaci
rozhraní, nikoli jen typové signatury kontrolované Dialyzerem.

```elixir
defmodule PrismaticStorage.AdapterContractTest do
  @moduledoc """
  Reusable test harness that validates any adapter against the
  full PrismaticStorage.Core interface specification.

  Usage:
    use PrismaticStorage.AdapterContractTest,
      adapter_module: PrismaticStorage.ETS
  """

  defmacro __using__(opts) do
    adapter = Keyword.fetch!(opts, :adapter_module)

    quote do
      use ExUnit.Case, async: true

      @adapter unquote(adapter)

      describe "#{inspect(@adapter)} contract compliance" do
        test "get returns {:ok, nil} for missing keys" do
          assert {:ok, nil} = @adapter.get("nonexistent", test_opts())
        end

        test "put followed by get returns the stored value" do
          assert {:ok, value} = @adapter.put("key1", %{data: "test"}, test_opts())
          assert {:ok, ^value} = @adapter.get("key1", test_opts())
        end

        test "delete removes a stored value" do
          {:ok, _} = @adapter.put("key2", %{data: "test"}, test_opts())
          assert :ok = @adapter.delete("key2", test_opts())
          assert {:ok, nil} = @adapter.get("key2", test_opts())
        end

        test "exists? returns true for stored keys" do
          {:ok, _} = @adapter.put("key3", %{data: "test"}, test_opts())
          assert {:ok, true} = @adapter.exists?("key3", test_opts())
          assert {:ok, false} = @adapter.exists?("missing", test_opts())
        end

        test "count returns the number of stored entries" do
          assert {:ok, initial} = @adapter.count(test_opts())
          {:ok, _} = @adapter.put("cnt1", %{}, test_opts())
          {:ok, _} = @adapter.put("cnt2", %{}, test_opts())
          assert {:ok, count} = @adapter.count(test_opts())
          assert count == initial + 2
        end

        test "list returns all stored values" do
          {:ok, _} = @adapter.put("lst1", %{a: 1}, test_opts())
          {:ok, _} = @adapter.put("lst2", %{a: 2}, test_opts())
          assert {:ok, values} = @adapter.list(test_opts())
          assert length(values) >= 2
        end
      end
    end
  end
end
```
Tento test kontraktu používá každý adaptér:

```elixir
# In prismatic_storage_ets/test/
use PrismaticStorage.AdapterContractTest, adapter_module: PrismaticStorage.ETS

# In prismatic_storage_ecto/test/
use PrismaticStorage.AdapterContractTest, adapter_module: PrismaticStorage.Ecto

# In prismatic_storage_meilisearch/test/
use PrismaticStorage.AdapterContractTest, adapter_module: PrismaticStorage.Meilisearch
```
## Volba adaptéru za běhu

Platforma podporuje volbu adaptéru za běhu, takže backend lze přepnout konfigurací bez
změny kódu.

```elixir
defmodule PrismaticStorage do
  @moduledoc "Unified storage facade with runtime adapter resolution."

  def get(key, opts \\ []) do
    adapter = resolve_adapter(opts)
    adapter.get(key, opts)
  end

  def put(key, value, opts \\ []) do
    adapter = resolve_adapter(opts)
    adapter.put(key, value, opts)
  end

  defp resolve_adapter(opts) do
    Keyword.get_lazy(opts, :adapter, fn ->
      Application.get_env(:prismatic_storage, :default_adapter, PrismaticStorage.ETS)
    end)
  end
end
```
Volba adaptéru řízená konfigurací:

```elixir
# config/dev.exs
config :prismatic_storage, default_adapter: PrismaticStorage.ETS

# config/prod.exs
config :prismatic_storage, default_adapter: PrismaticStorage.Ecto

# config/test.exs
config :prismatic_storage, default_adapter: PrismaticStorage.ETS
```
## Skládání a vrstvení backendů

Jednou z nejsilnějších schopností vzoru adaptér na platformě je průhledné skládání
backendů: adaptéry lze vrstvit a kombinovat tak přednosti více backendů.

### Mezipaměť se zápisem skrz (*write-through*)

```elixir
defmodule PrismaticStorage.CacheThrough do
  @behaviour PrismaticStorage.Core

  @impl true
  def get(key, opts) do
    cache = Keyword.fetch!(opts, :cache_adapter)
    primary = Keyword.fetch!(opts, :primary_adapter)

    case cache.get(key, opts) do
      {:ok, nil} ->
        # Cache miss: read from primary, populate cache
        case primary.get(key, opts) do
          {:ok, value} when not is_nil(value) ->
            cache.put(key, value, opts)
            {:ok, value}
          result ->
            result
        end

      {:ok, value} ->
        {:ok, value}  # Cache hit
    end
  end

  @impl true
  def put(key, value, opts) do
    cache = Keyword.fetch!(opts, :cache_adapter)
    primary = Keyword.fetch!(opts, :primary_adapter)

    # Write to both: primary first, then cache
    with {:ok, value} <- primary.put(key, value, opts),
         {:ok, _} <- cache.put(key, value, opts) do
      {:ok, value}
    end
  end
end
```
### Dotaz nad více backendy

```elixir
# Query across graph + relational backends
defmodule PrismaticStorage.MultiQuery do
  def find_related_assets(domain) do
    # Graph query for relationships
    {:ok, related} = PrismaticStorage.KuzuDB.query(
      %{type: :related_assets, domain: domain},
      adapter: PrismaticStorage.KuzuDB
    )

    # Relational query for details
    ids = Enum.map(related, & &1.id)
    {:ok, details} = PrismaticStorage.Ecto.query(
      %{ids: ids, include: [:vulnerabilities, :compliance]},
      adapter: PrismaticStorage.Ecto
    )

    # Full-text search for contextual matches
    {:ok, contextual} = PrismaticStorage.Meilisearch.query(
      %{search: domain, facets: ["asset_type", "risk_level"]},
      adapter: PrismaticStorage.Meilisearch
    )

    {:ok, merge_results(related, details, contextual)}
  end
end
```
## Telemetrie a pozorovatelnost

Vzor adaptér nabízí přirozené místo pro instrumentaci. Protože všechny operace úložiště
procházejí rozhraním adaptéru, lze telemetrii připojit na úrovni kontraktu a získat
jednotnou pozorovatelnost napříč všemi backendy bez úprav jednotlivých adaptérů.

```elixir
defmodule PrismaticStorage.InstrumentedAdapter do
  @moduledoc """
  Wraps any storage adapter with telemetry instrumentation.
  Measures latency, tracks error rates, and emits storage events
  for all operations without modifying the underlying adapter.
  """

  @behaviour PrismaticStorage.Core

  @spec new(module(), keyword()) :: map()
  def new(adapter, opts \\ []) do
    %{adapter: adapter, opts: opts}
  end

  @impl true
  def get(key, opts) do
    adapter = Keyword.fetch!(opts, :instrumented_adapter)
    metadata = %{adapter: adapter, operation: :get, key: key}

    :telemetry.span(
      [:prismatic, :storage, :get],
      metadata,
      fn ->
        result = adapter.get(key, opts)
        {result, Map.put(metadata, :result, elem(result, 0))}
      end
    )
  end

  @impl true
  def put(key, value, opts) do
    adapter = Keyword.fetch!(opts, :instrumented_adapter)
    metadata = %{adapter: adapter, operation: :put, key: key}

    :telemetry.span(
      [:prismatic, :storage, :put],
      metadata,
      fn ->
        result = adapter.put(key, value, opts)
        {result, Map.put(metadata, :result, elem(result, 0))}
      end
    )
  end

  @impl true
  def delete(key, opts) do
    adapter = Keyword.fetch!(opts, :instrumented_adapter)

    :telemetry.span(
      [:prismatic, :storage, :delete],
      %{adapter: adapter, operation: :delete, key: key},
      fn ->
        result = adapter.delete(key, opts)
        {result, %{}}
      end
    )
  end
end
```
Instrumentovaný adaptér umožňuje dashboardy s rozložením latence, chybovostí
a propustností pro každý backend – vše odvozené z jednotného rozhraní adaptéru, bez
instrumentačního kódu specifického pro backend.

## Strategie zpracování chyb

Vzor adaptér vynucuje jednotnou strategii zpracování chyb napříč backendy. Každý adaptér
musí převést chyby specifické pro backend na standardní formát platformy
`{:ok, value} | {:error, reason}`. Tato normalizace zajišťuje, že aplikační kód nikdy
nemusí přímo řešit výjimky PostgreSQL, chybové atomy ETS ani chybové kódy HTTP
z Meilisearch.

```elixir
defmodule PrismaticStorage.ErrorNormalizer do
  @moduledoc """
  Normalizes backend-specific errors into the platform's
  standard error tuple format for consistent error handling.
  """

  @type storage_error ::
    {:error, :not_found}
    | {:error, :connection_failed}
    | {:error, :timeout}
    | {:error, :conflict}
    | {:error, {:validation, list(String.t())}}

  @spec normalize(term(), atom()) :: storage_error()
  def normalize(%Postgrex.Error{postgres: %{code: :unique_violation}}, :ecto) do
    {:error, :conflict}
  end

  def normalize(%DBConnection.ConnectionError{}, :ecto) do
    {:error, :connection_failed}
  end

  def normalize(:timeout, _backend) do
    {:error, :timeout}
  end

  def normalize({:error, reason}, _backend) do
    {:error, reason}
  end
end
```
Když tedy aplikační kód dostane `{:error, :connection_failed}`, může implementovat
opakování pokusu, aniž by věděl, zda pod ním běží PostgreSQL, Redis, nebo Meilisearch.
Normalizace chyb je součástí kontraktu adaptéru, nikoli dodatečným nápadem.

## Srovnání s jinými abstrakčními vzory

| Vzor | Mechanismus volání | Nejvhodnější pro | Použití na platformě |
|---------|-------------------|----------|-----------------|
| **Adaptér (behaviour)** | zpětná volání na úrovni modulu | abstrakce backendu | adaptéry úložiště |
| **Protokol** | volání podle datového typu | polymorfní operace nad daty | kódování, formátování |
| **Plug** | řetězec zpracování požadavku | HTTP middleware | zpracování požadavků |
| **Strategie** | volba funkce za běhu | volba algoritmu | bodovací algoritmy |
| **Repository** | doménově specifické rozhraní | objekty přístupu k datům | repozitáře Ecto |

Pro úložiště byl zvolen adaptér přes behaviours, protože rozhodnutí o volání závisí na
typu backendu (modulu), ne na datovém typu (to by mluvilo pro protokoly). Jedna datová
struktura (např. záznam o bezpečnostním aktivu) může být uložena v kterémkoli backendu,
takže volání podle modulu je přirozenou volbou.

## Přidání nového adaptéru

Díky vzoru adaptér je přidání nového backendu úložiště dobře definovanou operací s nízkým
rizikem.

| Krok | Akce | Ověření |
|------|--------|-------------|
| 1 | vytvořit aplikaci umbrella projektu `prismatic_storage_new` | `mix new apps/prismatic_storage_new` |
| 2 | přidat `@behaviour PrismaticStorage.Core` | Dialyzer kontroluje úplnost zpětných volání |
| 3 | implementovat všechny funkce `@callback` | kompilátor varuje před chybějícími voláními |
| 4 | přidat `use PrismaticStorage.AdapterContractTest` | testy kontraktu ověří chování |
| 5 | nastavit v `config/*.exs` | volba adaptéru za běhu funguje |
| 6 | podle potřeby přidat sdružování spojení (*connection pooling*) | pool je supervidován ve stromu aplikace |
| 7 | zdokumentovat v registru adaptérů | ostatní součásti jej najdou |

Žádný stávající adaptér ani aplikační kód není třeba měnit. Sada testů kontraktu zaručuje,
že nový adaptér splňuje stejný behaviorální kontrakt jako všechny stávající.

## Výkonové charakteristiky

| Adaptér | Latence čtení | Latence zápisu | Možnosti dotazů | Škálovatelnost |
|---------|-------------|---------------|-----------------|-------------|
| ETS | < 1 mikrosekunda | < 1 mikrosekunda | jen klíč–hodnota | jeden uzel |
| Ecto/PostgreSQL | 1–10 ms | 1–10 ms | plné SQL, spojení | více uzlů (replikace) |
| Meilisearch | 5–50 ms | 10–100 ms | fulltext, fasety | horizontální |
| KuzuDB | 1–50 ms | 5–50 ms | průchod grafem, Cypher | jeden uzel |
| DuckDB | 10–100 ms | 10–50 ms | analytické SQL, sloupcové | jeden uzel |
| Redis | < 1 ms | < 1 ms | klíč–hodnota, setříděné množiny | cluster |

Výkonové charakteristiky (orientační hodnoty platformy) určují volbu backendu.
Architektura s více backendy umožňuje zvolit pro každý způsob přístupu optimální backend:
ETS pro čtení na horké cestě, PostgreSQL pro transakční zápisy, Meilisearch pro hledání
a KuzuDB pro průchod vztahy.

## Migrace mezi backendy

Vzor adaptér zjednodušuje migraci mezi backendy, protože aplikační kód závisí jen na
abstraktním rozhraní. Migrace z jednoho backendu na jiný má tři kroky: implementovat nový
adaptér, ověřit, že projde sadou testů kontraktu, a upravit konfiguraci. Aplikační kód
zůstane nedotčen.

Pro migraci dat mezi backendy umožňuje jednotné rozhraní obecný migrační nástroj:

```elixir
defmodule PrismaticStorage.Migrator do
  @moduledoc """
  Migrates data between storage backends using the uniform adapter interface.
  Works with any pair of adapters that implement PrismaticStorage.Core.
  """

  @spec migrate(module(), module(), keyword()) :: {:ok, non_neg_integer()} | {:error, term()}
  def migrate(source_adapter, target_adapter, opts \\ []) do
    batch_size = Keyword.get(opts, :batch_size, 1000)

    with {:ok, items} <- source_adapter.list(opts) do
      items
      |> Enum.chunk_every(batch_size)
      |> Enum.reduce({:ok, 0}, fn batch, {:ok, count} ->
        pairs = Enum.map(batch, fn {key, value} -> {key, value} end)
        case target_adapter.bulk_put(pairs, opts) do
          {:ok, n} -> {:ok, count + n}
          error -> error
        end
      end)
    end
  end
end
```
Tento nástroj funguje pro libovolnou dvojici adaptérů, aniž by znal vnitřek kteréhokoli
backendu, a ukazuje tak plnou sílu abstrakce adaptéru.

## Související pojmy

Technické pojmy, s nimiž vzor souvisí (bez vlastního hesla v glosáři knihy): *behaviour*
(mechanismus kontraktu ověřovaný při kompilaci), *typespec* (typové anotace v definicích
`@callback`), ETS (úložiště v paměti), Ecto (databázová vrstva adaptéru PostgreSQL), KuzuDB
(grafová databáze), *connection pooling* (správa spojení), Plug (skládání zpracování
požadavků), Dialyzer (statická analýza kontraktů), testování založené na vlastnostech
a Redis (distribuovaná mezipaměť).

## Související

**Platforma**

- [3NL](@/glossary/3nl.md) – architektura, v níž je vzor adaptér vzorem úrovně L3.
- [Bounded Context](@/glossary/bounded-context.md) – doménové hranice, které adaptéry
  respektují.
- [AIAD](@/glossary/aiad.md) – standard, který mezi typy součástí uvádí i adaptéry.
- [Entity Resolution](@/glossary/entity-resolution.md) – úloha, která čerpá z více backendů
  současně.

**Kompendium**

- [Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md) –
  lidský protějšek jednotného ověřování různých zdrojů.
- [Glosář](@/glossary/_index.md) – rejstřík hesel.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: adapter-pattern](@/kompendium/glossary-bridges/bridge-adapter-pattern.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
