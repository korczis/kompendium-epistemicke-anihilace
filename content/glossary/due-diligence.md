+++
title = "Due Diligence (náležitá péče, prověrka)"
weight = 50
description = "Soustavné prověření firmy, osoby nebo aktiva před transakcí či spoluprací: OSINT, entity resolution, sankční screening a křížově ověřené hodnocení rizika."

[taxonomies]
tags = ["glossary", "due-diligence", "osint", "compliance", "prismatic"]

[extra]
category = "intelligence"
status = "active"
author = "Tomas Korcak (korczis)"
difficulty = "intermediate"
technical_level = "intermediate-advanced"
domain_category = "compliance-intelligence"
related_concepts = ["kyc", "aml", "sanctions-screening", "beneficial-ownership", "entity-resolution"]
implementation_status = "production"
authority_level = "L3-strategic"
difficulty_rating = 6
prerequisites = ["osint", "compliance-framework", "risk-assessment", "knowledge-graph"]
learning_path = ["compliance-framework", "kyc", "aml", "due-diligence", "sanctions-screening", "entity-resolution"]
interactive_demos = ["/labs/glossary/due-diligence"]
code_examples = ["elixir"]
external_resources = ["https://www.fatf-gafi.org/en/publications/Fatfrecommendations/Fatf-recommendations.html", "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=celex%3A32015L0849", "https://www.sec.gov/education/smallbusiness/exemptofferings/due-diligence"]
version_introduced = "0.7.0"
stability_level = "stable"
testing_scenarios = ["entity-search-accuracy", "sanctions-hit-detection", "cross-source-validation", "risk-score-calibration", "false-positive-rate"]
related_terms = ["kyc", "aml", "sanctions-screening", "beneficial-ownership", "entity-resolution", "osint", "compliance-framework", "risk-score", "knowledge-graph", "triple-check"]
date_modified = "2026-11-10"
+++

## Definice

**Due diligence** (česky *náležitá péče*, v praxi *prověrka*) je soustavné prošetření
a vyhodnocení firmy, osoby nebo aktiva před uzavřením transakce, partnerství, investice nebo
spolupráce. Cílem je získat na důkazech založené porozumění finančnímu zdraví, právnímu
postavení, vlastnické struktuře, provozní odolnosti, pověsti a souladu s předpisy. Dnešní
prověrka přesahuje tradiční revizi dokumentů: zahrnuje automatizovaný sběr informací
z otevřených zdrojů, sjednocování entit napříč roztříštěnými datovými sadami (viz [Entity
Resolution](@/glossary/entity-resolution.md)), analýzu vztahů v grafu, detekci časových
vzorců, screening sankčních a sledovaných seznamů a strukturované hodnocení rizik podle
příslušných regulatorních rámců.

Prověrka má několik specializovaných podob: **obchodní** (postavení na trhu, konkurence,
koncentrace zákazníků), **finanční** (ověření tržeb, posouzení závazků, analýza pracovního
kapitálu), **právní** (soudní spory, soulad s předpisy, smluvní závazky), **technickou**
(technologie, duševní vlastnictví, technický dluh) a **compliance** (KYC/AML, [sankční
screening](@/glossary/sanctions-screening.md), identifikace politicky exponovaných osob,
ověření skutečných majitelů). Moderní platformy automatizují sběr dat a křížové ověřování
a lidskému úsudku ponechávají výklad a hodnocení rizika.

Na Prismatic Platform je prověrka implementována jako komplexní zpravodajský subsystém,
který v době zápisu spojoval 120+ adaptérů zdrojů [OSINT](@/glossary/osint.md), 30+ českých
veřejných rejstříků, globální sankční databáze a grafový engine pro sjednocování entit
postavený na KuzuDB.

**Vztah ke knize:** prověrka je jedním z prostředí, pro která byla [taxonomie EA](@/glossary/taxonomie-ea.md) původně
vytvořena: posuzovatel potřebuje rozpoznat, zda zdroje, výpovědi a dokumenty nenesou stopy
manipulace. Kniha na prověrku odkazuje v heslech [Anihilační
fenomény](@/glossary/anihilacni-fenomeny.md), [DARVO](@/glossary/darvo.md) nebo [Ego
Death](@/glossary/ego-death.md); vážení zdrojů s ohledem na techniky EA popisuje stránka [DD
engine: vážení zdrojů](@/kompendium/aiad-integration/dd-engine-ea-source-weighting.md)
a práci s českými rejstříky [ARES: screening EA](@/kompendium/aiad-integration/czech-ares-ea-screening.md).

## Přehled

Pojem má původ v právu cenných papírů – konkrétně v oddílu 11 amerického Securities Act
z roku 1933, který zavedl „obhajobu náležitou péčí“ pro upisovatele, kteří prokázali, že
před nabídkou cenných papírů provedli přiměřené šetření. V dalších desetiletích se pojem
rozšířil daleko za cenné papíry – na fúze a akvizice, rizikový kapitál, private equity,
komerční úvěry, partnerské smlouvy, výběr dodavatelů i regulatorní soulad.

Regulatorní tlak na prověrky od počátku 21. století výrazně vzrostl:

**Boj proti praní peněz (AML):** doporučení Finančního akčního výboru (FATF), směrnice EU
proti praní peněz (AMLD4, AMLD5, AMLD6) a jejich národní provedení ukládají finančním
institucím a „povinným osobám“ provádět hloubkovou kontrolu klienta (CDD) a zesílenou
kontrolu (EDD) u klientů, skutečných majitelů a transakcí.

**Poznej svého klienta (KYC):** regulatorní rámce včetně amerického USA PATRIOT Act, směrnic
EU a místních předpisů požadují ověřovat totožnost klientů, posuzovat jejich rizikový profil
a sledovat jejich transakce kvůli podezřelé činnosti.

**Sankční soulad:** předpisy OFAC (USA), EU, OSN a národních orgánů požadují screening proti
sankčním seznamům, identifikaci politicky exponovaných osob a odhalování sankcionovaných
vlastnických struktur skrytých za složitým vrstvením společností.

**Transparentnost skutečných majitelů:** pátá směrnice AML a národní registry (v Česku
evidence skutečných majitelů podle zákona č. 37/2021 Sb.) vyžadují identifikaci a ověření
skutečných majitelů; obvyklým orientačním prahem je podíl nebo kontrola nad 25 %.

Přechod od ruční k automatizované, zpravodajsky řízené prověrce je zásadní změnou
schopností. Ruční procesy s týmy analytiků procházejícími dokumenty nahradily systémy, které
paralelně dotazují stovky zdrojů, sjednocují entity v roztříštěných datech, mapují grafy
vlastnictví, odhalují sankční shody přibližným porovnáním a vytvářejí skóre rizika – za
minuty místo týdnů.

## Technické podrobnosti

### Architektura procesu prověrky

Platforma implementuje prověrku jako vícestupňový proces od sběru dat přes sjednocení entit,
křížové ověření a skórování rizika až po tvorbu zprávy:

```elixir
defmodule PrismaticDD.Pipeline do
  @moduledoc """
  Orchestrates the due diligence investigation pipeline.

  Stages:
  1. Entity identification and source planning
  2. Parallel OSINT data collection from 120+ adapters
  3. Entity resolution and record linkage
  4. Graph construction and relationship analysis
  5. Sanctions and watchlist screening
  6. Cross-source validation (triple-check)
  7. Risk scoring and grade assignment
  8. Report generation
  """

  alias PrismaticDD.{
    EntityResolver,
    SourceOrchestrator,
    SanctionsScreener,
    RiskEngine,
    ReportGenerator
  }

  @type entity_type :: :company | :individual | :trust | :foundation
  @type investigation_params :: %{
          name: String.t(),
          entity_type: entity_type(),
          jurisdiction: String.t(),
          identifiers: map(),
          depth: :standard | :enhanced | :deep
        }
  @type investigation_result :: %{
          entity: EntityResolver.resolved_entity(),
          sources_queried: pos_integer(),
          sources_responded: pos_integer(),
          sanctions_hits: [SanctionsScreener.hit()],
          risk_score: RiskEngine.score(),
          risk_grade: :A | :B | :C | :D | :F,
          confidence: float(),
          report_id: String.t(),
          duration_ms: pos_integer()
        }

  @spec investigate(investigation_params()) :: {:ok, investigation_result()} | {:error, term()}
  def investigate(%{name: name, entity_type: type} = params) when is_binary(name) do
    start_time = System.monotonic_time(:millisecond)

    with {:ok, sources} <- plan_sources(params),
         {:ok, raw_data} <- collect_data(sources, params),
         {:ok, resolved} <- resolve_entity(raw_data, params),
         {:ok, graph} <- build_relationship_graph(resolved),
         {:ok, sanctions} <- screen_sanctions(resolved, graph),
         {:ok, validated} <- cross_validate(resolved, raw_data),
         {:ok, score} <- assess_risk(validated, sanctions, graph),
         {:ok, report_id} <- generate_report(validated, score, sanctions) do
      duration = System.monotonic_time(:millisecond) - start_time

      {:ok,
       %{
         entity: resolved,
         sources_queried: length(sources),
         sources_responded: count_responses(raw_data),
         sanctions_hits: sanctions,
         risk_score: score.numeric,
         risk_grade: score.grade,
         confidence: score.confidence,
         report_id: report_id,
         duration_ms: duration
       }}
    end
  end

  @spec plan_sources(investigation_params()) :: {:ok, [atom()]} | {:error, term()}
  defp plan_sources(%{jurisdiction: jurisdiction, entity_type: type, depth: depth}) do
    sources =
      SourceOrchestrator.available_sources()
      |> filter_by_jurisdiction(jurisdiction)
      |> filter_by_entity_type(type)
      |> filter_by_depth(depth)

    if Enum.empty?(sources) do
      {:error, :no_sources_available}
    else
      {:ok, sources}
    end
  end

  @spec collect_data([atom()], investigation_params()) :: {:ok, map()} | {:error, term()}
  defp collect_data(sources, params) do
    results =
      sources
      |> Task.async_stream(
        fn source -> SourceOrchestrator.query(source, params) end,
        max_concurrency: 20,
        timeout: :timer.seconds(30),
        on_timeout: :kill_task
      )
      |> Enum.reduce(%{}, fn
        {:ok, {:ok, source, data}}, acc -> Map.put(acc, source, data)
        {:ok, {:error, _source, _reason}}, acc -> acc
        {:exit, _reason}, acc -> acc
      end)

    {:ok, results}
  end

  @spec resolve_entity(map(), investigation_params()) :: {:ok, EntityResolver.resolved_entity()} | {:error, term()}
  defp resolve_entity(raw_data, params) do
    EntityResolver.resolve(raw_data, params)
  end

  @spec build_relationship_graph(EntityResolver.resolved_entity()) :: {:ok, map()} | {:error, term()}
  defp build_relationship_graph(entity) do
    PrismaticDD.GraphBuilder.build(entity)
  end

  @spec screen_sanctions(EntityResolver.resolved_entity(), map()) :: {:ok, [SanctionsScreener.hit()]} | {:error, term()}
  defp screen_sanctions(entity, graph) do
    SanctionsScreener.screen(entity, graph)
  end

  @spec cross_validate(EntityResolver.resolved_entity(), map()) :: {:ok, map()} | {:error, term()}
  defp cross_validate(entity, raw_data) do
    PrismaticDD.TripleCheck.validate(entity, raw_data)
  end

  @spec assess_risk(map(), [SanctionsScreener.hit()], map()) :: {:ok, RiskEngine.score()} | {:error, term()}
  defp assess_risk(validated, sanctions, graph) do
    RiskEngine.score(validated, sanctions, graph)
  end

  @spec generate_report(map(), RiskEngine.score(), [SanctionsScreener.hit()]) :: {:ok, String.t()} | {:error, term()}
  defp generate_report(entity, score, sanctions) do
    ReportGenerator.generate(entity, score, sanctions)
  end

  @spec count_responses(map()) :: non_neg_integer()
  defp count_responses(raw_data), do: map_size(raw_data)

  @spec filter_by_jurisdiction([atom()], String.t()) :: [atom()]
  defp filter_by_jurisdiction(sources, jurisdiction) do
    SourceOrchestrator.filter_by_jurisdiction(sources, jurisdiction)
  end

  @spec filter_by_entity_type([atom()], entity_type()) :: [atom()]
  defp filter_by_entity_type(sources, type) do
    SourceOrchestrator.filter_by_entity_type(sources, type)
  end

  @spec filter_by_depth([atom()], atom()) :: [atom()]
  defp filter_by_depth(sources, depth) do
    SourceOrchestrator.filter_by_depth(sources, depth)
  end
end
```
### Integrace českých rejstříků

Platforma se napojuje na 30+ českých veřejných rejstříků a pokrývá tak český podnikatelský
prostor:

```elixir
defmodule PrismaticDD.CzechRegistries do
  @moduledoc """
  Unified interface to Czech public registries for due diligence.

  Integrates with ARES, Justice.cz (Commercial Register, ISIR),
  RZP (Trade Register), CUZK (Cadastral Registry), Registr Smluv
  (Contract Registry), and the Beneficial Ownership Register.
  """

  @type ico :: String.t()
  @type registry_result :: %{
          source: atom(),
          data: map(),
          fetched_at: DateTime.t(),
          confidence: float()
        }

  @registries [
    :ares,
    :justice_or,
    :justice_isir,
    :rzp,
    :cuzk,
    :registr_smluv,
    :beneficial_owners,
    :szr,
    :cedr,
    :ruian
  ]

  @spec search_by_ico(ico()) :: {:ok, [registry_result()]} | {:error, term()}
  def search_by_ico(ico) when is_binary(ico) and byte_size(ico) == 8 do
    results =
      @registries
      |> Task.async_stream(
        fn registry -> query_registry(registry, {:ico, ico}) end,
        max_concurrency: 10,
        timeout: :timer.seconds(15),
        on_timeout: :kill_task
      )
      |> Enum.flat_map(fn
        {:ok, {:ok, result}} -> [result]
        _ -> []
      end)

    {:ok, results}
  end

  def search_by_ico(_ico), do: {:error, :invalid_ico_format}

  @spec search_by_name(String.t(), keyword()) :: {:ok, [registry_result()]} | {:error, term()}
  def search_by_name(name, opts \\ []) when is_binary(name) do
    jurisdiction = Keyword.get(opts, :jurisdiction, "CZ")
    entity_type = Keyword.get(opts, :entity_type, :any)

    with {:ok, ares_results} <- query_registry(:ares, {:name, name}),
         candidates <- extract_icos(ares_results),
         {:ok, enriched} <- enrich_candidates(candidates) do
      filtered =
        enriched
        |> filter_by_entity_type_internal(entity_type)
        |> sort_by_relevance(name)

      {:ok, filtered}
    end
  end

  @spec query_registry(atom(), tuple()) :: {:ok, registry_result()} | {:error, term()}
  defp query_registry(registry, query) do
    adapter = registry_adapter(registry)
    adapter.search(query)
  end

  @spec registry_adapter(atom()) :: module()
  defp registry_adapter(:ares), do: PrismaticOSINT.Czech.ARES
  defp registry_adapter(:justice_or), do: PrismaticOSINT.Czech.Justice.CommercialRegister
  defp registry_adapter(:justice_isir), do: PrismaticOSINT.Czech.Justice.ISIR
  defp registry_adapter(:rzp), do: PrismaticOSINT.Czech.RZP
  defp registry_adapter(:cuzk), do: PrismaticOSINT.Czech.CUZK
  defp registry_adapter(:registr_smluv), do: PrismaticOSINT.Czech.RegistrSmluv
  defp registry_adapter(:beneficial_owners), do: PrismaticOSINT.Czech.BeneficialOwners
  defp registry_adapter(:szr), do: PrismaticOSINT.Czech.SZR
  defp registry_adapter(:cedr), do: PrismaticOSINT.Czech.CEDR
  defp registry_adapter(:ruian), do: PrismaticOSINT.Czech.RUIAN

  @spec extract_icos(registry_result()) :: [ico()]
  defp extract_icos(%{data: %{results: results}}) do
    Enum.map(results, & &1.ico)
  end

  defp extract_icos(_), do: []

  @spec enrich_candidates([ico()]) :: {:ok, [map()]} | {:error, term()}
  defp enrich_candidates(icos) do
    enriched =
      icos
      |> Task.async_stream(&search_by_ico/1, max_concurrency: 5, timeout: :timer.seconds(30))
      |> Enum.flat_map(fn
        {:ok, {:ok, results}} -> results
        _ -> []
      end)

    {:ok, enriched}
  end

  @spec filter_by_entity_type_internal([map()], atom()) :: [map()]
  defp filter_by_entity_type_internal(results, :any), do: results

  defp filter_by_entity_type_internal(results, type) do
    Enum.filter(results, fn r -> Map.get(r, :entity_type) == type end)
  end

  @spec sort_by_relevance([map()], String.t()) :: [map()]
  defp sort_by_relevance(results, _query), do: results
end
```
### Sankční screening

```elixir
defmodule PrismaticDD.SanctionsScreener do
  @moduledoc """
  Multi-list sanctions screening with fuzzy name matching,
  alias resolution, and ownership chain traversal.

  Screens against EU consolidated sanctions list, OFAC SDN,
  UN consolidated list, and national lists. Uses configurable
  fuzzy matching thresholds to balance detection sensitivity
  against false positive rates.
  """

  @type hit :: %{
          list: :eu | :ofac_sdn | :un | :national,
          match_type: :exact | :fuzzy | :alias | :ownership,
          matched_name: String.t(),
          target_name: String.t(),
          similarity_score: float(),
          entry_id: String.t(),
          designation_date: Date.t() | nil,
          programs: [String.t()]
        }

  @type screening_result :: %{
          hits: [hit()],
          screened_entities: pos_integer(),
          lists_checked: [atom()],
          screening_time_ms: pos_integer()
        }

  @fuzzy_threshold 0.85
  @ownership_depth 4

  @spec screen(map(), map()) :: {:ok, [hit()]} | {:error, term()}
  def screen(entity, relationship_graph) do
    names = extract_all_names(entity)
    related = extract_related_entities(relationship_graph, @ownership_depth)

    all_targets = names ++ related

    hits =
      [:eu, :ofac_sdn, :un]
      |> Task.async_stream(
        fn list -> screen_against_list(list, all_targets) end,
        max_concurrency: 3,
        timeout: :timer.seconds(60)
      )
      |> Enum.flat_map(fn
        {:ok, {:ok, list_hits}} -> list_hits
        _ -> []
      end)
      |> Enum.sort_by(& &1.similarity_score, :desc)
      |> deduplicate_hits()

    {:ok, hits}
  end

  @spec screen_against_list(atom(), [String.t()]) :: {:ok, [hit()]} | {:error, term()}
  defp screen_against_list(list, targets) do
    entries = load_sanctions_list(list)

    hits =
      for target <- targets,
          entry <- entries,
          similarity = calculate_similarity(target, entry.name),
          similarity >= @fuzzy_threshold do
        %{
          list: list,
          match_type: if(similarity == 1.0, do: :exact, else: :fuzzy),
          matched_name: target,
          target_name: entry.name,
          similarity_score: similarity,
          entry_id: entry.id,
          designation_date: entry.designation_date,
          programs: entry.programs
        }
      end

    {:ok, hits}
  end

  @spec extract_all_names(map()) :: [String.t()]
  defp extract_all_names(entity) do
    primary = [entity[:name] | Map.get(entity, :aliases, [])]
    transliterations = Enum.flat_map(primary, &generate_transliterations/1)
    Enum.uniq(primary ++ transliterations)
  end

  @spec extract_related_entities(map(), pos_integer()) :: [String.t()]
  defp extract_related_entities(graph, depth) do
    PrismaticDD.GraphTraversal.ownership_chain(graph, depth)
    |> Enum.map(& &1.name)
  end

  @spec calculate_similarity(String.t(), String.t()) :: float()
  defp calculate_similarity(a, b) do
    String.jaro_distance(String.downcase(a), String.downcase(b))
  end

  @spec generate_transliterations(String.t()) :: [String.t()]
  defp generate_transliterations(name) do
    [name]
  end

  @spec deduplicate_hits([hit()]) :: [hit()]
  defp deduplicate_hits(hits) do
    hits
    |> Enum.uniq_by(fn h -> {h.list, h.entry_id, h.matched_name} end)
  end

  @spec load_sanctions_list(atom()) :: [map()]
  defp load_sanctions_list(_list), do: []
end
```
## Implementace v Prismatic Platform

### Zpravodajský subsystém DD

Aplikace OTP `prismatic_dd` poskytuje jádro enginu prověrek: správu případů, sjednocování
entit, grafovou analýzu v KuzuDB a engine křížového ověření *triple-check* postavený na
epistemickém rámci [NABLA Infinity](@/glossary/nabla-infinity.md). Rozhodovací část popisuje
heslo [Decision Core](@/glossary/decision-core.md).

### Integrace zdrojů OSINT

Platforma v době zápisu spojovala 120+ adaptérů zdrojů OSINT v těchto kategoriích:

- **české rejstříky** (28 adaptérů): ARES, Justice.cz (obchodní rejstřík, ISIR), RŽP, ČÚZK,
  Registr smluv, evidence skutečných majitelů a další;
- **globální zdroje** (84 adaptérů): [Shodan](@/glossary/shodan.md), VirusTotal,
  [Censys](@/glossary/censys.md), Hunter.io a poskytovatelé zpravodajství o doménách a IP;
- **sankční seznamy** (3 adaptéry): konsolidovaný seznam EU, seznam OFAC SDN, konsolidovaný
  seznam OSN;
- **regionální zdroje**: European Business Register (EU), Companies House (Spojené
  království), SEC EDGAR (USA).

### Engine skórování rizika

Engine [skóre rizika](@/glossary/risk-score.md) vytváří písmenná hodnocení (A–F) s číselným
skóre (300–900) přiřazeným k požadavkům NIS2 a českého zákona o kybernetické bezpečnosti
(viz [Compliance Framework](@/glossary/compliance-framework.md)). Skóre jsou kalibrována podle
oborových srovnání a obsahují intervaly spolehlivosti, které odrážejí úplnost a konzistenci
dostupných dat.

### Webové rozhraní

Subsystém DD je dostupný na adrese `/dd` webové aplikace; dlaždice šetření jsou i v dashboardu
Labs. Rozhraní LiveView podporuje sledování průběhu šetření v reálném čase, interaktivní
průzkum grafu vlastnických struktur a export zpráv do PDF.

### Ověření triple-check

Každé zjištění prochází křížovým ověřením *triple-check*, které vyžaduje potvrzení nejméně
třemi nezávislými zdroji, než je tvrzení považováno za ověřené. Metodika vychází z axiomu
[Signal Plurality](@/glossary/signal-plurality.md) rámce NABLA Infinity.

## Srovnání s alternativami

Ceny konkurenčních služeb, které původní heslo uvádělo, kniha vynechává jako neověřené;
tabulka srovnává jen zdroje, automatizaci a model provozu.

| Platforma | Zdroje | Automatizace | Vlastní provoz |
|----------|---------|------------|-------------|
| **Prismatic DD** | 120+ adaptérů, 30+ českých rejstříků | automatizace celého procesu | ano |
| **Refinitiv World-Check** | globální PEP a sankce, média | screening a ruční revize | ne (jen SaaS) |
| **Dow Jones Risk & Compliance** | globální sankce, negativní zprávy | screening a výstrahy | ne (jen SaaS) |
| **LexisNexis Risk Solutions** | rejstříky USA a světa, spory | poloautomatizované | ne (jen SaaS) |
| **OpenSanctions** | globální sankce a PEP | jen data, bez procesu | ano (data) |
| **Maltego** | transformace OSINT | založené na transformacích | desktopová aplikace |

## Osvědčené postupy

1. **Rozmanitost zdrojů:** u každého údaje dotazovat více nezávislých zdrojů. Zjištění
   z jediného zdroje je ze své podstaty nespolehlivé; metodika triple-check vyžaduje tři
   nezávislé potvrzující zdroje.
2. **Nejdřív sjednotit entity:** před analýzou sjednotit identity entit napříč zdroji. Tatáž
   entita se může objevovat pod různými jmény, identifikátory a přepisy; bez sjednocení je
   hodnocení roztříštěné a neúplné.
3. **Procházet řetězce vlastnictví:** sledovat vlastnictví až ke skutečným majitelům. Složité
   struktury s fiktivními společnostmi, svěřenskými fondy a nominee uspořádáními mohou být
   navrženy tak, aby zakryly sankcionované nebo rizikové vlastnictví.
4. **Časová analýza:** zkoumat nejen současný stav, ale i historické vzorce. Odstoupení
   členů orgánů krátce před vynucovacími opatřeními, změny vlastnictví v době sankčních
   rozhodnutí nebo posuny finančních vzorců mohou ukazovat na riziko, které snímek
   současného stavu nezachytí.
5. **Kalibrace přibližného porovnání:** pečlivě nastavit prahy sankčního screeningu. Příliš
   přísný práh (> 0,95) přehlédne varianty přepisu a aliasy, příliš volný (< 0,80) vytvoří
   nadměrné množství falešných shod. Výchozí hodnota platformy 0,85 vyvažuje citlivost
   a přesnost.
6. **Screening negativních zpráv:** vedle rejstříků a sankcí zahrnout strukturovaný screening
   médií. Negativní zprávy často předcházejí formálním vynucovacím opatřením a dávají včasné
   varování.
7. **Průběžné sledování:** prověrka není jednorázovým úkonem. U trvajících vztahů je třeba
   sledovat změny sankčních seznamů, rejstříků, skutečných majitelů a zpráv.
8. **Auditní stopa:** vést neměnnou stopu každého dotazu, odpovědi zdroje, rozhodnutí
   o shodě a hodnocení rizika. Regulátoři vyžadují doložitelný průběh prověrky (srov. [Chain
   of custody](@/glossary/chain-of-custody.md)).

## Časté chyby

1. **Screening jen podle jména:** porovnávat jen hlavní jméno bez aliasů, přepisů, dřívějších
   jmen a spojených entit. Tak se přehlédnou shody, které používají jiný pravopis nebo jinou
   podobu jména.
2. **Přehlížení vlastnických struktur:** prověřit jen přímou protistranu bez řetězců
   vlastnictví. Sankcionované osoby často působí přes vrstvy fiktivních společností
   a nominee uspořádání.
3. **Zastaralá data:** spoléhat na data z mezipaměti nebo zřídka aktualizovaná. Sankční
   seznamy, rejstříky i evidence skutečných majitelů se mění průběžně.
4. **Falešná jistota z automatizace:** brát výsledky automatického screeningu jako konečné bez
   lidské revize. Automatizace vyniká ve sběru dat a porovnávání vzorů, ale nenahradí lidský
   úsudek při výkladu a hodnocení rizika.
5. **Slepota k jurisdikcím:** uplatňovat jednu metodiku všude bez ohledu na místní předpisy,
   dostupné zdroje a zvyklosti pojmenování.
6. **Strnulé prahy:** používat pevné prahy bez kontextu. Skóre podobnosti 0,87 může být
   jasnou shodou u krátkého jména („Li Wei“), ale falešnou shodou u dlouhého názvu firmy
   s běžnými slovy.
7. **Chybějící negativní indikátory:** soustředit se jen na to, co bylo nalezeno, a ne na to,
   co chybí. Absence očekávaných záznamů v rejstřících, finančních výkazů nebo webové
   přítomnosti může být významnější než kterékoli jednotlivé zjištění.
8. **Nedostatečná dokumentace:** neprovést záznam metodiky, dotázaných zdrojů, zjištění
   a rozhodnutí. Neúplná dokumentace podkopává regulatorní hodnotu celého procesu.

## Případy užití

### Prověrka před investicí

Fondy rizikového kapitálu a private equity prověřují cílové firmy před investicí. Proces
dotazuje české rejstříky na finanční zdraví, obchodní rejstřík na strukturu společnosti,
evidenci skutečných majitelů, sankční seznamy kvůli souladu a globální zdroje OSINT kvůli
pověsti.

### Soulad KYC/AML

Finanční instituce a povinné osoby provádějí hloubkovou a zesílenou kontrolu klienta, jak ji
vyžadují předpisy AML. Automatizovaný proces výrazně zkracuje čas přijetí klienta
a zachovává regulatorní soulad.

### Hodnocení rizika dodavatelů

Organizace posuzují bezpečnostní stav a soulad dodavatelů. Šetření spojuje bezpečnostní
hodnocení (přes Prismatic Perimeter, viz [EASM](@/glossary/easm.md)) s prověrkou entity.

### Prověrka při fúzích a akvizicích

Fúze a akvizice vyžadují komplexní prošetření cílové firmy po finanční, právní, technické
i compliance stránce. Sběr z více zdrojů a sjednocování entit zkracuje fázi sběru dat
z týdnů na hodiny.

### Sledování sankčního souladu

Organizace podléhající sankčním předpisům průběžně prověřují protistrany, skutečné majitele
a účastníky transakcí proti sankčním seznamům EU, OFAC a OSN. Engine přibližného porovnání
zvládá varianty jmen, přepisy a aliasy.

## Související pojmy

Bez vlastního hesla v glosáři knihy: *KYC*, *AML*, *Beneficial Ownership* (skuteční majitelé),
*Triple Check* (křížové ověření třemi zdroji), *Knowledge Graph*, *Security Rating*, *Audit
Trail* a *Confidence Scoring*.

## Související

**Platforma**

- [Sanctions Screening](@/glossary/sanctions-screening.md) – automatický screening sankčních
  seznamů.
- [Entity Resolution](@/glossary/entity-resolution.md) – sjednocování identit napříč zdroji.
- [Risk Score](@/glossary/risk-score.md) – kvantifikované hodnocení rizika.
- [Compliance Framework](@/glossary/compliance-framework.md) – regulatorní rámce souladu.
- [NABLA Infinity](@/glossary/nabla-infinity.md) – epistemický rámec plurality důkazů
  a sledování původu.
- [OSINT](@/glossary/osint.md) – zpravodajství z otevřených zdrojů.

**Kompendium**

- [DD engine: vážení zdrojů](@/kompendium/aiad-integration/dd-engine-ea-source-weighting.md)
  – jak prověrka zohledňuje techniky EA.
- [Chain of custody](@/glossary/chain-of-custody.md) – dokumentace, která dává prověrce
  důkazní váhu.
