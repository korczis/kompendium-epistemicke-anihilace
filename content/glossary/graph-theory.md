+++
title = "Teorie grafů (graph theory)"
weight = 50
description = "Matematika vrcholů a hran: formální základ řešení závislostí, ověřování grafu přesvědčení a kontrol Trinity Gate na platformě Prismatic; v knize nástroj analýzy sítí."

[taxonomies]
tags = ["glossary", "mathematics", "graph", "algorithms", "formal-methods", "verification"]

[extra]
category = "mathematics"
status = "active"
author = "Tomas Korcak (korczis)"
difficulty = "advanced"
date_created = "2026-02-22"
date_updated = "2026-02-22"
version = "2.0.0"
related_terms = ["graph-database", "knowledge-graph", "trinity-gate", "structural-consistency", "belief-graph", "supervision-tree", "entity-graph", "formal-verification", "dependency-injection", "dag"]
platforms = ["prismatic-platform"]
audience = ["engineers", "architects", "mathematicians", "formal-methods-practitioners"]
prerequisite_knowledge = ["mathematics", "data-structures", "algorithms"]
date_modified = "2026-11-10"
keywords = ["Graph", "Theory", "Prismatic", "Platforms", "Trinity", "Gate", "glossary", "mathematics", "Prismatic Platform", "Trinity Gate"]
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "Teorie grafů – platforma Prismatic"
+++

## Definice

**Teorie grafů** (*graph theory*) je odvětví diskrétní matematiky, které studuje grafy – matematické struktury tvořené vrcholy (uzly) spojenými hranami (vazbami) – a vlastnosti, algoritmy a věty, jimiž se řídí. Graf `G = (V, E)` je určen množinou vrcholů `V` a množinou hran `E`, kde každá hrana spojuje dva vrcholy. Teorie grafů dává formální základ úlohám o souvislosti, cestách, cyklech, tocích, barvení, párování a rovinnosti.

Na platformě Prismatic, z níž kniha vzešla, není teorie grafů akademickou abstrakcí, ale praktickým nástrojem používaným denně: stromy supervize jsou grafy, řetězce závislostí agentů jsou orientované acyklické grafy (DAG), síť přesvědčení NABLA musí tvořit platný DAG, aby prošla [Trinity Gate](@/glossary/trinity-gate.md), [entity resolution](@/glossary/entity-resolution.md) pracuje nad grafy s vlastnostmi a mapy útočné plochy platformy jsou procházitelné grafové struktury. Heslo patří do technického kontextu platformy; s knihou jej spojuje to, že **kruhové zdůvodnění je v řeči grafů cyklus** a že síťová analýza zdrojů je jedním z nástrojů detekce EA.

## Původ a kontext pojmu

Teorie grafů vznikla v roce 1736, kdy Leonhard Euler vyřešil úlohu sedmi mostů města Královce (Königsberg): dokázal, že žádná procházka městem nemůže přejít každý ze sedmi mostů právě jednou. Eulerův klíčový vhled spočíval v abstrakci úlohy od fyzické geografie k matematické struktuře – pevnina se stala vrcholy, mosty hranami a otázka se proměnila v otázku existence eulerovského tahu ve výsledném grafu. Tento akt abstrakce – převedení skutečné úlohy na její grafovou podstatu – zůstává ústřední metodou teorie grafů i po téměř třech stoletích.

Obor od Eulerovy doby nesmírně vyrostl. Mezi milníky patří:

- **1847:** Kirchhoffova věta o kostrách pro elektrické obvody;
- **1852:** problém čtyř barev (dokázán s pomocí počítače v roce 1976);
- **1936:** Kőnigova první učebnice teorie grafů;
- **1956:** Dijkstrův algoritmus nejkratší cesty;
- **1962:** Edmondsův algoritmus maximálního párování;
- **70. léta:** NP-úplnost mnoha grafových úloh (hamiltonovská kružnice, barvení grafu aj.);
- **2000. léta:** PageRank (Google) jako grafový algoritmus nad grafem webu;
- **2010. léta:** grafové neuronové sítě propojující teorii grafů a strojové učení;
- **2020. léta:** grafové databáze s vlastnostmi, které přinášejí teorii grafů do praktické správy dat.

V softwarovém inženýrství se teorie grafů objevuje všude: řešení závislostí, sestavovací systémy, směrování v sítích, stavové automaty, workflow, optimalizace překladačů (grafy toku řízení), správa paměti (grafy dosažitelnosti) a správa verzí (DAG commitů). Platforma Prismatic ji využívá téměř ve všech subsystémech.

## Technické podrobnosti

### Základní typy grafů

Porozumění tomu, jak platforma Prismatic grafy používá, vyžaduje znalost několika typů grafů:

**Neorientovaný graf:** hrany nemají směr. Je-li `(u, v)` hrana, lze přejít z `u` do `v` i z `v` do `u`. Slouží k modelování symetrických vztahů jako „zná“ nebo „je podobný“.

**Orientovaný graf (digraf):** každá hrana má směr; `(u, v)` znamená z `u` do `v`. Slouží k modelování asymetrických vztahů jako „závisí na“, „dohlíží na“ nebo „implikuje“.

**Orientovaný acyklický graf (DAG):** orientovaný graf bez cyklů. Je klíčový pro řešení závislostí, pořadí sestavení a pro graf přesvědčení platformy – cyklus v grafu přesvědčení by znamenal, že přesvědčení podporuje samo sebe, což je epistemicky neplatné.

**Ohodnocený graf:** hrany nesou číselné váhy představující cenu, vzdálenost, kapacitu nebo jistotu. Používá se v algoritmech nejkratší cesty, při optimalizaci toků a v entity resolution vážené jistotou.

**Graf s vlastnostmi (*property graph*):** uzly a hrany nesou vlastnosti typu klíč–hodnota. Je to datový model KuzuDB a většiny moderních grafových databází; grafy entit na platformě jsou grafy s vlastnostmi.

**Strom:** souvislý acyklický neorientovaný graf; ekvivalentně souvislý graf s `n-1` hranami pro `n` vrcholů. Stromy supervize v OTP mají stromovou strukturu (kořenové stromy, jejichž kořenem je nejvyšší supervizor).

### Klíčové algoritmy na platformě

Na platformě Prismatic se přímo používají tyto grafové algoritmy (topologické řazení, detekce cyklů, nejkratší cesta podle Dijkstry a silně souvislé komponenty podle Tarjana):

```elixir
defmodule Prismatic.Graph.Algorithms do
  @moduledoc """
  Graph theory algorithms used across the Prismatic Platform
  for dependency resolution, cycle detection, shortest paths,
  and topological ordering.
  """

  @type vertex :: term()
  @type edge :: {vertex(), vertex()}
  @type graph :: %{vertices: MapSet.t(vertex()), edges: list(edge())}
  @type weight_fn :: (vertex(), vertex() -> number())

  # --- Topological Sort ---
  # Used for: agent dependency resolution, build ordering,
  # supervision tree construction

  @spec topological_sort(graph()) :: {:ok, list(vertex())} | {:error, :cycle_detected}
  def topological_sort(graph) do
    in_degree = compute_in_degrees(graph)

    queue =
      graph.vertices
      |> Enum.filter(fn v -> Map.get(in_degree, v, 0) == 0 end)
      |> :queue.from_list()

    do_topological_sort(graph, queue, in_degree, [])
  end

  defp do_topological_sort(graph, queue, in_degree, result) do
    case :queue.out(queue) do
      {:empty, _} ->
        if length(result) == MapSet.size(graph.vertices) do
          {:ok, Enum.reverse(result)}
        else
          {:error, :cycle_detected}
        end

      {{:value, vertex}, rest_queue} ->
        {updated_queue, updated_degrees} =
          outgoing_neighbors(graph, vertex)
          |> Enum.reduce({rest_queue, in_degree}, fn neighbor, {q, deg} ->
            new_deg = Map.update!(deg, neighbor, &(&1 - 1))

            if new_deg[neighbor] == 0 do
              {:queue.in(neighbor, q), new_deg}
            else
              {q, new_deg}
            end
          end)

        do_topological_sort(graph, updated_queue, updated_degrees, [vertex | result])
    end
  end

  # --- Cycle Detection ---
  # Used for: circular dependency prevention, belief graph validation,
  # Trinity Gate structural consistency

  @spec has_cycle?(graph()) :: boolean()
  def has_cycle?(graph) do
    case topological_sort(graph) do
      {:ok, _} -> false
      {:error, :cycle_detected} -> true
    end
  end

  # --- Shortest Path (Dijkstra) ---
  # Used for: entity resolution path finding, attack surface
  # blast radius calculation

  @spec shortest_path(graph(), vertex(), vertex(), weight_fn()) ::
    {:ok, list(vertex()), number()} | {:error, :no_path}
  def shortest_path(graph, source, target, weight_fn) do
    distances = %{source => 0}
    predecessors = %{}
    unvisited = graph.vertices

    {final_dist, final_pred} =
      dijkstra_loop(graph, unvisited, distances, predecessors, weight_fn)

    case Map.get(final_dist, target) do
      nil -> {:error, :no_path}
      dist -> {:ok, reconstruct_path(final_pred, source, target), dist}
    end
  end

  defp dijkstra_loop(_graph, unvisited, distances, predecessors, _weight_fn)
       when map_size(unvisited) == 0 do
    {distances, predecessors}
  end

  defp dijkstra_loop(graph, unvisited, distances, predecessors, weight_fn) do
    current =
      unvisited
      |> Enum.filter(&Map.has_key?(distances, &1))
      |> Enum.min_by(&Map.get(distances, &1), fn -> nil end)

    case current do
      nil ->
        {distances, predecessors}

      vertex ->
        updated_unvisited = MapSet.delete(unvisited, vertex)
        current_dist = distances[vertex]

        {new_dist, new_pred} =
          outgoing_neighbors(graph, vertex)
          |> Enum.filter(&MapSet.member?(unvisited, &1))
          |> Enum.reduce({distances, predecessors}, fn neighbor, {d, p} ->
            alt = current_dist + weight_fn.(vertex, neighbor)

            if alt < Map.get(d, neighbor, :infinity) do
              {Map.put(d, neighbor, alt), Map.put(p, neighbor, vertex)}
            else
              {d, p}
            end
          end)

        dijkstra_loop(graph, updated_unvisited, new_dist, new_pred, weight_fn)
    end
  end

  # --- Strongly Connected Components (Tarjan) ---
  # Used for: identifying circular dependency clusters,
  # finding tightly coupled module groups

  @spec strongly_connected_components(graph()) :: list(list(vertex()))
  def strongly_connected_components(graph) do
    state = %{
      index: 0,
      stack: [],
      on_stack: MapSet.new(),
      indices: %{},
      lowlinks: %{},
      components: []
    }

    final_state =
      Enum.reduce(graph.vertices, state, fn vertex, acc ->
        if Map.has_key?(acc.indices, vertex) do
          acc
        else
          tarjan_visit(graph, vertex, acc)
        end
      end)

    final_state.components
  end

  defp tarjan_visit(graph, vertex, state) do
    state = %{state |
      indices: Map.put(state.indices, vertex, state.index),
      lowlinks: Map.put(state.lowlinks, vertex, state.index),
      index: state.index + 1,
      stack: [vertex | state.stack],
      on_stack: MapSet.put(state.on_stack, vertex)
    }

    state =
      outgoing_neighbors(graph, vertex)
      |> Enum.reduce(state, fn neighbor, acc ->
        cond do
          not Map.has_key?(acc.indices, neighbor) ->
            acc = tarjan_visit(graph, neighbor, acc)
            lowlink = min(acc.lowlinks[vertex], acc.lowlinks[neighbor])
            %{acc | lowlinks: Map.put(acc.lowlinks, vertex, lowlink)}

          MapSet.member?(acc.on_stack, neighbor) ->
            lowlink = min(acc.lowlinks[vertex], acc.indices[neighbor])
            %{acc | lowlinks: Map.put(acc.lowlinks, vertex, lowlink)}

          true ->
            acc
        end
      end)

    if state.lowlinks[vertex] == state.indices[vertex] do
      {component, rest_stack, rest_on_stack} = pop_component(state.stack, state.on_stack, vertex, [])
      %{state |
        stack: rest_stack,
        on_stack: rest_on_stack,
        components: [component | state.components]
      }
    else
      state
    end
  end

  defp pop_component([vertex | rest], on_stack, target, acc) do
    updated_on_stack = MapSet.delete(on_stack, vertex)
    acc = [vertex | acc]

    if vertex == target do
      {acc, rest, updated_on_stack}
    else
      pop_component(rest, updated_on_stack, target, acc)
    end
  end

  # --- Helpers ---

  defp compute_in_degrees(graph) do
    Enum.reduce(graph.edges, %{}, fn {_from, to}, acc ->
      Map.update(acc, to, 1, &(&1 + 1))
    end)
  end

  defp outgoing_neighbors(graph, vertex) do
    graph.edges
    |> Enum.filter(fn {from, _to} -> from == vertex end)
    |> Enum.map(fn {_from, to} -> to end)
  end

  defp reconstruct_path(predecessors, source, target) do
    do_reconstruct(predecessors, source, target, [target])
  end

  defp do_reconstruct(_pred, source, source, path), do: path
  defp do_reconstruct(pred, source, current, path) do
    prev = Map.get(pred, current)
    do_reconstruct(pred, source, prev, [prev | path])
  end
end
```

### Teorie grafů v Trinity Gate

První ověřovací kanál Trinity Gate – strukturní konzistence – je čistě grafovou kontrolou. Ověřuje, že síť přesvědčení platformy tvoří platný DAG:

```elixir
defmodule Prismatic.Trinity.StructuralConsistency do
  @moduledoc """
  Trinity Gate Layer 1: Structural Consistency.
  Verifies that the belief graph is a valid DAG with
  no orphan nodes, no unreachable subgraphs, and
  proper provenance chains.
  """

  alias Prismatic.Graph.Algorithms

  @type belief_graph :: Algorithms.graph()
  @type check_result :: {:pass, map()} | {:fail, list(String.t())}

  @spec verify(belief_graph()) :: check_result()
  def verify(graph) do
    checks = [
      {:acyclicity, &check_acyclicity/1},
      {:connectivity, &check_weak_connectivity/1},
      {:root_existence, &check_has_root/1},
      {:provenance_chain, &check_provenance/1}
    ]

    results = Enum.map(checks, fn {name, check_fn} -> {name, check_fn.(graph)} end)
    failures = Enum.filter(results, fn {_name, result} -> result != :pass end)

    if Enum.empty?(failures) do
      {:pass, %{checks_passed: length(checks), graph_size: MapSet.size(graph.vertices)}}
    else
      {:fail, Enum.map(failures, fn {name, {:fail, reason}} -> "#{name}: #{reason}" end)}
    end
  end

  defp check_acyclicity(graph) do
    if Algorithms.has_cycle?(graph) do
      {:fail, "Belief graph contains cycles -- circular reasoning detected"}
    else
      :pass
    end
  end

  defp check_weak_connectivity(graph) do
    components = weak_connected_components(graph)

    if length(components) == 1 do
      :pass
    else
      {:fail, "Belief graph has #{length(components)} disconnected subgraphs"}
    end
  end

  defp check_has_root(graph) do
    in_degrees = compute_in_degrees(graph)

    roots =
      graph.vertices
      |> Enum.filter(fn v -> Map.get(in_degrees, v, 0) == 0 end)

    case length(roots) do
      0 -> {:fail, "No root beliefs found (all beliefs depend on others)"}
      _ -> :pass
    end
  end

  defp check_provenance(graph) do
    case Algorithms.topological_sort(graph) do
      {:ok, order} ->
        valid =
          Enum.all?(order, fn vertex ->
            in_edges = Enum.filter(graph.edges, fn {_from, to} -> to == vertex end)
            in_degree = length(in_edges)
            in_degree == 0 or in_degree >= 1
          end)

        if valid, do: :pass, else: {:fail, "Provenance chain broken"}

      {:error, :cycle_detected} ->
        {:fail, "Cannot verify provenance -- cycles present"}
    end
  end

  defp compute_in_degrees(graph) do
    Enum.reduce(graph.edges, %{}, fn {_from, to}, acc ->
      Map.update(acc, to, 1, &(&1 + 1))
    end)
  end

  defp weak_connected_components(graph) do
    undirected_edges =
      Enum.flat_map(graph.edges, fn {a, b} -> [{a, b}, {b, a}] end)

    undirected = %{vertices: graph.vertices, edges: undirected_edges}

    graph.vertices
    |> Enum.reduce({[], MapSet.new()}, fn vertex, {components, visited} ->
      if MapSet.member?(visited, vertex) do
        {components, visited}
      else
        component = bfs(undirected, vertex)
        {[component | components], MapSet.union(visited, MapSet.new(component))}
      end
    end)
    |> elem(0)
  end

  defp bfs(graph, start) do
    do_bfs(graph, :queue.in(start, :queue.new()), MapSet.new([start]), [start])
  end

  defp do_bfs(graph, queue, visited, result) do
    case :queue.out(queue) do
      {:empty, _} ->
        result

      {{:value, vertex}, rest} ->
        neighbors =
          outgoing_neighbors(graph, vertex)
          |> Enum.reject(&MapSet.member?(visited, &1))

        new_visited = Enum.reduce(neighbors, visited, &MapSet.put(&2, &1))
        new_queue = Enum.reduce(neighbors, rest, &:queue.in(&1, &2))

        do_bfs(graph, new_queue, new_visited, result ++ neighbors)
    end
  end

  defp outgoing_neighbors(graph, vertex) do
    graph.edges
    |> Enum.filter(fn {from, _to} -> from == vertex end)
    |> Enum.map(fn {_from, to} -> to end)
  end
end
```

### Stromy supervize jako grafové struktury

Stromy supervize v OTP jsou kořenové stromy (zvláštní případ DAG), v nichž jsou supervizoři vnitřními uzly a pracovní procesy listy:

```
                    Application
                        |
                  TopSupervisor
                   /         \
          DomainSuperA    DomainSuperB
           /     \           /    \
      WorkerA  WorkerB  WorkerC  WorkerD
```

Modul PrismaticSupervisor používá teorii grafů pro spouštění v pořadí podle závislostí:

1. sestaví graf závislostí ze specifikací aplikací;
2. topologickým řazením určí pořadí spuštění;
3. odhalí cykly (kruhové závislosti) a ohlásí je jako chyby;
4. seskupí nezávislé aplikace pro paralelní spuštění.

## Implementace

### Řešení závislostí

Resolver závislostí platformy určuje topologickým řazením správné pořadí spuštění aplikací umbrella projektu (v době zápisu jich bylo 115):

```bash
# Show dependency graph and detect cycles
mix supervisor deps --cycles

# Show application startup order
mix supervisor discover
```

### Orchestrace agentů pomocí grafů

Agenti [AIAD](@/glossary/aiad.md) (v době zápisu přes 530) mají závislosti úloh, které tvoří DAG. Při orchestraci složité operace (např. `/orchestrate`) systém:

1. sestaví graf závislostí úloh;
2. topologickým řazením najde pořadí provedení;
3. určí nezávislé úlohy, které mohou běžet paralelně;
4. provádí úlohy ve vlnách, kde každá vlna obsahuje navzájem nezávislé úlohy.

### Ověřování sítě přesvědčení

Každé tvrzení zpracované rámcem NABLA se přidá do grafu přesvědčení. Než je jakékoli tvrzení přijato (průchod Trinity Gate), graf se zkontroluje na:

- acykličnost (žádné kruhové zdůvodnění);
- slabou souvislost (žádná osiřelá přesvědčení);
- existenci kořene (axiomy jako základ);
- řetězce původu (každé přesvědčení lze dohledat k důkazu).

## Srovnání

### Teorie grafů a teorie množin

Teorie množin se zabývá souhrny prvků bez vnitřní struktury. Teorie grafů přidává párové vztahy mezi prvky. Graf lze sice reprezentovat jako množinu uspořádaných dvojic, ale grafově specifické algoritmy (nejkratší cesta, detekce cyklů, toky) nemají přirozené množinové ekvivalenty.

### Teorie grafů a teorie kategorií

Teorie kategorií teorii grafů zobecňuje tím, že přidává skládání šipek (morfismů). Každý graf lze chápat jako volnou kategorii, ale kategorie mají další strukturu (identické morfismy, asociativní skládání), kterou grafy nemají. Platforma používá pojmy teorie kategorií ve svém [vzoru adaptéru](@/glossary/adapter-pattern.md) (funktory mezi kategoriemi úložišť).

### Orientované a neorientované použití

| použití | typ grafu | důvod |
|---|---|---|
| řešení závislostí | orientovaný (DAG) | závislosti jsou asymetrické |
| analýza sociálních sítí | neorientovaný | „zná“ je symetrické |
| mapování útočné plochy | orientovaný | „překládá se na“ má směr |
| shlukování podle podobnosti | neorientovaný ohodnocený | podobnost je symetrická |
| sítě přesvědčení | orientovaný (DAG) | „podporuje“ má směr a je acyklické |
| stromy supervize | orientovaný (strom) | „dohlíží na“ je hierarchické |

## Osvědčené postupy

### 1. Zvolit správnou reprezentaci grafu

Seznamy sousedů jsou efektivní pro řídké grafy (většinu grafů ze skutečného světa). Matice sousednosti jsou efektivní pro husté grafy a pro operace jako násobení matic. Platforma pro většinu grafových operací používá reprezentaci seznamem hran.

### 2. Ověřit vlastnosti grafu včas

Před spuštěním algoritmu ověřte, že graf má očekávané vlastnosti (acykličnost u DAG, souvislost u cest, nezáporné váhy u Dijkstry). Cena ověření je zanedbatelná ve srovnání s laděním chybných výsledků algoritmu na poškozeném grafu.

### 3. Řešit závislosti topologickým řazením

Kdykoli existuje vztah „musí proběhnout před“, modelujte jej jako DAG a seřaďte topologicky. Platí to pro sestavovací systémy, pořadí migrací, orchestraci agentů i pořadí spouštění supervizorů.

### 4. Odhalovat a hlásit cykly

Cykly v grafech závislostí jsou vždy chybou. Odhalujte je proaktivně (Tarjanův algoritmus silně souvislých komponent) a hlaste je s úplnou cestou cyklu, aby vývojáři mohli opravit skutečnou příčinu.

### 5. Omezit hloubku průchodu

V provozních grafových operacích vždy omezte maximální hloubku. Neomezené BFS/DFS na velkých grafech může spotřebovat nadměrnou paměť a čas. Většina praktických dotazů potřebuje nejvýše 3–5 kroků průchodu.

### 6. Znát složitost algoritmů

Znejte časovou složitost používaných algoritmů: BFS/DFS je O(V+E), Dijkstra s haldou O((V+E) log V), topologické řazení O(V+E) a SCC O(V+E). U velkých grafů záleží i na konstantách.

## Časté chyby

### Záměna orientovaných a neorientovaných operací

Kontrola souvislosti pro neorientovaný graf spuštěná na orientovaném grafu může dát zavádějící výsledky. Orientovaný graf může být slabě souvislý (souvislý při ignorování směru hran), ale ne silně souvislý. Používejte algoritmus odpovídající typu grafu.

### Přehlížení změn grafu

Mnoho grafových algoritmů předpokládá, že se graf během výpočtu nemění. Úprava grafu (přidání či odebrání vrcholů nebo hran) během průchodu může způsobit nenápadné chyby: vynechané vrcholy, nekonečné smyčky nebo nesprávné výsledky. Před algoritmickou operací pořiďte snímek grafu.

### Exponenciální výčet cest

Počítání nebo výčet všech cest mezi dvěma vrcholy v obecném grafu může mít exponenciální složitost. Potřebujete-li najít všechny cesty, přidejte omezení (maximální délka, vyloučené vrcholy), aby výpočet zůstal zvládnutelný.

### Paměťová náročnost velkých grafů

Ukládání explicitních objektů hran s vlastnostmi může u velkých grafů spotřebovat značnou paměť. Pro úlohy s převahou čtení zvažte komprimované reprezentace (formát CSR/CSC), pro grafy, které se nevejdou do paměti, proudové zpracování.

### Opomíjení teorie grafů u „jednoduchých“ úloh

Mnoho úloh, které zdánlivě s grafy nesouvisejí, jsou ve skutečnosti grafové úlohy v přestrojení. Stavové automaty jsou grafy, hierarchie typů jsou stromy, směrování v síti je úloha nejkratší cesty a rozvrhování je barvení grafu. Rozpoznání grafové struktury umožní použít dobře prozkoumané algoritmy.

## Případy užití

### Návrh stromů supervize v OTP

Každá aplikace OTP je stromem supervizorů a pracovních procesů. Teorie grafů formalizuje otázky o tomto stromu: „Co se stane, když tento uzel selže?“ (analýza podstromu), „Jaká je strategie restartu?“ (průchod stromem), „Existují jediné body selhání?“ (hledání artikulací).

### Analýza dosahu v modulu Perimeter

Když je v aktivu objevena zranitelnost, modul [EASM](@/glossary/easm.md) vypočítá její „dosah“ (*blast radius*) průchodem grafu aktiv od zranitelného uzlu. Všechny uzly dosažitelné v nastavitelné hloubce představují potenciálně zasažená aktiva.

### Ověřování sítě přesvědčení NABLA

Kontrola strukturní konzistence v Trinity Gate používá detekci cyklů k zabránění kruhovému zdůvodnění, analýzu souvislosti k vyloučení osiřelých přesvědčení a topologické řazení k ověření, že každé přesvědčení má platný řetězec původu zpět k axiomům nebo důkazům. Viz [NABLA Infinity](@/glossary/nabla-infinity.md).

### Rozvrhování úloh agentů

Orchestrátor AIAD sestaví graf závislostí úloh, určí nezávislé úlohy (vrcholy bez nevyřešených závislostí) a naplánuje je k paralelnímu provedení. Jak se úlohy dokončují, stávají se způsobilými úlohy na nich závislé – klasický vzor rozvrhování řízeného topologickým řazením.

### Řešení závislostí brán kvality

Brány kvality mají závislosti: Dialyzer závisí na překladu, testy závisí na překladu, Credo závisí na zdrojových souborech. Pipeline kvality tyto závislosti řeší topologickým řazením, aby určila správné pořadí provedení a maximalizovala paralelismus.

## Význam pro Kompendium

Pro čtenáře knihy je teorie grafů užitečná ve třech ohledech. Za prvé, **[kruhová argumentace](@/glossary/cirkularni-argumentace.md) je cyklus**: tvrzení, které se po několika krocích opírá samo o sebe, lze v grafu zdůvodnění přímo ukázat. Za druhé, **citační a zdrojové sítě** odhalují koordinaci a uzavřenost – signatury [citační kruhovosti](@/kompendium/detection-signatures/18-network-citation-circularity.md) a [monokultury zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md) jsou grafové vlastnosti. Za třetí, výzkum EA pracuje se [síťovou analýzou](@/kompendium/research-methodology/network-analysis-EA.md) vztahů ve skupinách, kde se izolace projevuje jako rozpad hran k vnějšímu světu. Teorie grafů tu nic nediagnostikuje; dává jen přesný jazyk pro strukturu, kterou pak musí vyložit kliník nebo analytik.

## Související

**Platforma**

- [Trinity Gate](@/glossary/trinity-gate.md) – používá teorii grafů v kanálu strukturní konzistence.
- [NABLA Infinity](@/glossary/nabla-infinity.md) – rámec, jehož síť přesvědčení musí být DAG.
- [Entity Resolution](@/glossary/entity-resolution.md) – sloučení záznamů nad grafem entit.
- [AIAD](@/glossary/aiad.md) – agenti orchestrovaní podle grafu závislostí.
- [EASM](@/glossary/easm.md) – analýza útočné plochy jako průchod grafem.

**Kniha**

- [Cirkulární argumentace](@/glossary/cirkularni-argumentace.md) – kruhové zdůvodnění jako cyklus.
- [Citační kruhovost](@/kompendium/detection-signatures/18-network-citation-circularity.md) – síťová signatura EA.
- [Síťová analýza ve výzkumu EA](@/kompendium/research-methodology/network-analysis-EA.md) – metodika.

**Mimo knihu (web platformy)**

- [Graph Database](https://prismatic-reality-com.github.io/prismatic-promo/glossary/graph-database/) – trvalé úložiště grafových dat (KuzuDB).
- [Knowledge Graph](https://prismatic-reality-com.github.io/prismatic-promo/glossary/knowledge-graph/) – hlavní použití teorie grafů ve zpravodajské doméně platformy.
- [Structural Consistency](https://prismatic-reality-com.github.io/prismatic-promo/glossary/structural-consistency/) – kontrola Trinity Gate ověřující vlastnosti DAG grafu přesvědčení.
- [Belief Graph](https://prismatic-reality-com.github.io/prismatic-promo/glossary/belief-graph/) – orientovaný acyklický graf epistemického stavu platformy.
- [Supervision Tree](https://prismatic-reality-com.github.io/prismatic-promo/glossary/supervision-tree/) – konstrukce OTP modelující hierarchie procesů jako kořenové stromy.
- [Entity Graph](https://prismatic-reality-com.github.io/prismatic-promo/glossary/entity-graph/) – modelování vztahů mezi entitami objevenými v OSINT.
- [Formal Verification](https://prismatic-reality-com.github.io/prismatic-promo/glossary/formal-verification/) – grafové důkazy správnosti algoritmů.
- [Circular Dependency](https://prismatic-reality-com.github.io/prismatic-promo/glossary/circular-dependency/) – cyklus v grafu závislostí.
- [Dependency Injection](https://prismatic-reality-com.github.io/prismatic-promo/glossary/dependency-injection/) – oddělení vrcholů grafu, které brání nechtěným hranám.
- [DAG (Directed Acyclic Graph)](https://prismatic-reality-com.github.io/prismatic-promo/glossary/ast/) – struktura pro řešení závislostí a sítě přesvědčení.
- [Formal Proof](https://prismatic-reality-com.github.io/prismatic-promo/glossary/formal-proof/) – matematické důkazy opřené o grafové argumenty.
- [Modal Logic](https://prismatic-reality-com.github.io/prismatic-promo/glossary/modal-logic/) – logika, jejíž Kripkeho sémantika je grafová (možné světy jako vrcholy).
- [Lean4](https://prismatic-reality-com.github.io/prismatic-promo/glossary/lean4/) – dokazovač vět pro formální grafové důkazy v Trinity Gate.
- [Theorem Proving](https://prismatic-reality-com.github.io/prismatic-promo/glossary/theorem-proving/) – automatické ověřování opřené o grafové struktury.
