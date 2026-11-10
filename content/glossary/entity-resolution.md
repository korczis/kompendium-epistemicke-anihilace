+++
title = "Entity Resolution (sjednocování entit)"
weight = 44
description = "Zpravodajský proces, který určuje, zda záznamy z různých zdrojů patří téže skutečné entitě, a umožňuje sjednotit identity napříč nesourodými daty s kalibrovanou důvěrou."

[taxonomies]
tags = ["glossary", "entity-resolution", "osint", "prismatic", "due-diligence"]

[extra]
category = "intelligence"
related_terms = ["knowledge-graph", "ontology", "data-pipeline", "nabla-infinity", "trinity-gate", "confidence-scoring", "signal-plurality", "provenance-mandatory", "stream-processing"]
tier = "TIER 1"
domain = "Intelligence Processing"
platform_integration = "PrismaticResolution"
maturity = "Production"
complexity = "Advanced"
audience = ["intelligence-analysts", "data-engineers", "osint-practitioners"]
key_benefits = ["identity-consolidation", "cross-source-correlation", "deduplication", "entity-linking"]
prerequisites = ["knowledge-graph", "ontology", "confidence-scoring"]
matching_strategies = ["deterministic", "probabilistic", "graph-based"]
blocking_methods = ["exact-key", "sorted-neighborhood", "canopy", "lsh", "phonetic"]
similarity_metrics = ["jaro-winkler", "levenshtein", "jaccard", "cosine"]
confidence_threshold = 0.80
nabla_compliance = "Mandatory"
pipeline_model = "Broadway stream processing"
prismatic_module = "PrismaticResolution"
false_positive_impact = "Incorrectly merged entities"
false_negative_impact = "Missed entity connections"
author = "Tomas Korcak (korczis)"
quality_score = 80
date_modified = "2026-11-10"
+++

## Definice

**Entity resolution** (česky *sjednocování entit*, též *propojování záznamů*, *deduplikace*,
*párování entit* nebo *sjednocování identit*) je proces, který určuje, zda různé datové
záznamy – případně ze zcela odlišných zdrojů, s jinými identifikátory, formáty, pravopisem
a úplností – patří téže skutečné entitě. Ve zpravodajství a kybernetické bezpečnosti to
znamená propojovat osoby, organizace, domény, IP adresy, e-mailové adresy, účty na
sociálních sítích a digitální aktiva napříč zdroji, které nemají společný identifikátor.
Sjednocování entit je klíčovým krokem, který mění roztříštěná a zdvojená surová data
v souvislý, sjednocený obraz skutečnosti.

Jde v podstatě o práci s nejistotou. Osoba „Jan Novák“ v českém obchodním rejstříku,
„J. Novak“ jako držitel domény a adresa „jan.novak@example.com“ v uniklé databázi mohou, ale
nemusí být týž člověk. Sjednocování kombinuje **deterministické** párování (přesné shody
jedinečných identifikátorů – e-mailu, daňového čísla, domény), **pravděpodobnostní** párování
(přibližné skóre podobnosti jmen, adres a dalších atributů) a **grafové** párování (analýzu
vzorců vztahů – sdílejí-li dva záznamy tři společné spolupracovníky, spíše jde o tutéž
entitu). Výstupem není binární ano/ne, ale tvrzení s mírou důvěry: „tyto záznamy představují
tutéž entitu s důvěrou 87 % na základě podobnosti jména, sdíleného rozsahu IP a překrývajících
se dat registrace“.

Sjednocování entit stojí na průsečíku datového inženýrství, teorie informace a oborové
znalosti. Ve velkém měřítku vyžaduje efektivní strategie *blokování* (zmenšení prostoru
porovnání O(n²) na zvládnutelné množiny kandidátů), propracované metriky podobnosti
(Jaro-Winkler pro jména, Levenshtein pro řetězce, geografická blízkost pro adresy)
a principiální kalibraci důvěry (aby propojení s „důvěrou 90 %“ bylo skutečně v 90 %
případů správné). Falešně pozitivní výsledky (chybné sloučení různých entit) i falešně
negativní (nepropojení záznamů téže entity) mají ve zpravodajské práci vážné důsledky.

**Vztah ke knize:** pojem patří do kontextu platformy, z níž Kompendium vzešlo (subsystém
prověrek, viz [Due Diligence](@/glossary/due-diligence.md)). Pro knihu je důležitá jeho
etická stránka: chybné sloučení dvou lidí do jedné „entity“ může poškodit nevinného člověka
a sjednocování osobních údajů napříč zdroji je zároveň mechanismem [doxingu](@/glossary/doxing.md)
(srov. [EA-2.3.8 Doxxing epistemický](@/kompendium/techniques/ea-2-3-8-doxxing-epistemicky.md)).
Proto platí přísná pravidla důvěry, původu a lidské revize a práce s osobními údaji musí
respektovat právo na ochranu soukromí (viz [OSINT](@/glossary/osint.md) a [Pomluva
a EA](@/kompendium/forensic-legal/14-defamation-EA.md)).

## Kontext na Prismatic Platform

Platforma provádí sjednocování entit pomocí vyhrazených agentů L2, kteří slučují zpravodajské
záznamy ze zdrojů OSINT. Profily na sociálních sítích, záznamy obchodních rejstříků,
registrace domén, logy Certificate Transparency a finanční data se propojují s hlavními
záznamy entit korelací více signálů ověřenou podle axiomů [NABLA
Infinity](@/glossary/nabla-infinity.md). Axiom [Signal Plurality](@/glossary/signal-plurality.md)
vyžaduje, aby každé propojení opíraly alespoň dva nezávislé signály, a axiom *Provenance
Mandatory* zajišťuje, že každé propojení lze vystopovat k jeho důkazním zdrojům.

Skóre důvěry musí před zapsáním propojení do znalostního grafu překročit standardní provozní
práh (τ = 0,80). Propojení pod prahem se nezahazují, ale uchovávají jako kandidátní spojení
k revizi analytikem – v souladu se zásadou zachování rozporů. [Trinity
Gate](@/glossary/trinity-gate.md) ověřuje tvrzení o sjednocení strukturální konzistencí (graf
entit zůstává platným DAG), logickou konzistencí (hodnoty atributů si neodporují) a formální
verifikací.

## Proces sjednocování entit

Proces má několik fází; každá zmenšuje prostor kandidátů a zvyšuje přesnost párování:

```
Raw Records (N sources)
      |
      v
  1. Normalization
      |  Name standardization, address parsing, format unification
      v
  2. Blocking
      |  Partition records into candidate groups (O(n) instead of O(n^2))
      v
  3. Pairwise Comparison
      |  Compute similarity scores across multiple attributes
      v
  4. Classification
      |  Determine match/non-match/uncertain using trained thresholds
      v
  5. Clustering
      |  Group matched records into entity clusters
      v
  6. Confidence Scoring
      |  Assign NABLA-compliant confidence to each entity link
      v
  7. Knowledge Graph Integration
      |  Merge into master entity records with provenance
      v
  Master Entity Records
```
### Implementace procesu

```elixir
defmodule PrismaticResolution.Pipeline do
  @moduledoc "Multi-stage entity resolution pipeline with NABLA compliance."

  @spec resolve(String.t(), keyword()) :: {:ok, [map()]} | {:error, term()}
  def resolve(domain, opts \\ []) do
    confidence_threshold = Keyword.get(opts, :threshold, 0.80)

    with {:ok, raw_records} <- collect_source_records(domain),
         {:ok, normalized} <- normalize_records(raw_records),
         {:ok, blocks} <- generate_blocks(normalized),
         {:ok, candidates} <- pairwise_compare(blocks),
         {:ok, classified} <- classify_matches(candidates, confidence_threshold),
         {:ok, clusters} <- cluster_matches(classified),
         {:ok, scored} <- apply_nabla_scoring(clusters),
         {:ok, entities} <- integrate_knowledge_graph(scored) do
      {:ok, entities}
    end
  end

  defp collect_source_records(domain) do
    sources = [
      Task.async(fn -> PrismaticOsint.Czech.search(domain) end),
      Task.async(fn -> PrismaticOsint.Global.search(domain) end),
      Task.async(fn -> PrismaticPerimeter.Sources.Censys.domain_search(domain) end),
      Task.async(fn -> PrismaticPerimeter.Sources.Shodan.domain_search(domain) end)
    ]

    results = Enum.map(sources, &Task.await(&1, 30_000))
    merged = Enum.flat_map(results, fn
      {:ok, records} -> records
      {:error, _} -> []
    end)

    {:ok, merged}
  end

  defp normalize_records(records) do
    normalized = Enum.map(records, &PrismaticResolution.Normalizer.normalize/1)
    {:ok, normalized}
  end
end
```
## Fáze normalizace

Normalizace převádí záznamy z nesourodých zdrojů do společného formátu vhodného k porovnání:

```elixir
defmodule PrismaticResolution.Normalizer do
  @moduledoc "Record normalization for cross-source entity comparison."

  @spec normalize(map()) :: map()
  def normalize(record) do
    record
    |> normalize_name()
    |> normalize_address()
    |> normalize_phone()
    |> normalize_email()
    |> normalize_domain()
    |> add_normalization_metadata()
  end

  defp normalize_name(%{name: name} = record) when is_binary(name) do
    normalized =
      name
      |> String.trim()
      |> String.replace(~r/\s+/, " ")
      |> transliterate_diacritics()
      |> String.downcase()

    Map.put(record, :normalized_name, normalized)
  end

  defp normalize_name(record), do: record

  defp normalize_email(%{email: email} = record) when is_binary(email) do
    normalized =
      email
      |> String.trim()
      |> String.downcase()
      |> strip_email_aliases()

    Map.put(record, :normalized_email, normalized)
  end

  defp normalize_email(record), do: record

  defp strip_email_aliases(email) do
    case String.split(email, "@") do
      [local, domain] ->
        # Remove Gmail-style + aliases
        clean_local = local |> String.split("+") |> List.first()
        "#{clean_local}@#{domain}"

      _ ->
        email
    end
  end

  defp transliterate_diacritics(text) do
    text
    |> String.normalize(:nfd)
    |> String.replace(~r/[\x{0300}-\x{036f}]/u, "")
  end
end
```
| Normalizace | Vstup | Výstup | Účel |
|--------------|-------|--------|---------|
| **jméno** | „Jan Novák“ | „jan novak“ | odstranění diakritiky, sjednocení velikosti písmen |
| **adresa** | „Ul. Karla IV 12/3“ | „karla iv 12 3“ | rozvinutí zkratek ulic |
| **telefon** | „+420 123 456 789“ | „420123456789“ | normalizace mezer a předvolby |
| **e-mail** | „Jan.Novak+work@gmail.com“ | „jan.novak@gmail.com“ | odstranění aliasu, sjednocení velikosti písmen |
| **doména** | „www.Example.COM“ | „example.com“ | odstranění protokolu a www, sjednocení velikosti písmen |

## Strategie párování

| Strategie | Mechanismus | Důvěra | Rychlost | Příklad |
|----------|-----------|-----------|-------|---------|
| **deterministická** | přesná shoda jedinečných identifikátorů | velmi vysoká (> 0,95) | rychlá | stejný e-mail, stejné daňové číslo, stejná doména |
| **pravděpodobnostní** | přibližné skóre podobnosti napříč atributy | proměnlivá (0,5–0,95) | střední | podobná jména + překrývající se adresy |
| **grafová** | analýza vzorců vztahů | vysoká (0,7–0,95) | pomalá | společní spolupracovníci, společné registrace |

### Deterministické párování

```elixir
defmodule PrismaticResolution.DeterministicMatcher do
  @moduledoc "Exact-match entity resolution on unique identifiers."

  @spec match(map(), map()) :: {:match, float()} | :no_match
  def match(record_a, record_b) do
    cond do
      match_email?(record_a, record_b) -> {:match, 0.99}
      match_tax_id?(record_a, record_b) -> {:match, 0.98}
      match_domain_registration?(record_a, record_b) -> {:match, 0.95}
      match_phone?(record_a, record_b) -> {:match, 0.90}
      true -> :no_match
    end
  end

  defp match_email?(a, b) do
    a[:normalized_email] != nil and a[:normalized_email] == b[:normalized_email]
  end

  defp match_tax_id?(a, b) do
    a[:tax_id] != nil and normalize_tax_id(a[:tax_id]) == normalize_tax_id(b[:tax_id])
  end

  defp match_domain_registration?(a, b) do
    a[:registrant_email] != nil and a[:registrant_email] == b[:registrant_email]
  end

  defp match_phone?(a, b) do
    a[:normalized_phone] != nil and a[:normalized_phone] == b[:normalized_phone]
  end

  defp normalize_tax_id(tax_id) when is_binary(tax_id) do
    String.replace(tax_id, ~r/[^0-9A-Z]/, "")
  end
end
```
### Pravděpodobnostní párování

Pravděpodobnostní párování počítá vážené skóre podobnosti napříč více atributy:

| Atribut | Metrika podobnosti | Váha | Práh |
|-----------|------------------|--------|-----------|
| **jméno osoby** | vzdálenost Jaro-Winkler | 0,30 | > 0,85 |
| **organizace** | Jaccardova podobnost tokenů | 0,25 | > 0,80 |
| **adresa** | geografická vzdálenost + podobnost řetězců | 0,15 | < 500 m nebo > 0,75 |
| **telefon** | přesná shoda po normalizaci | 0,10 | přesná po normalizaci |
| **datum narození** | přesná nebo částečná shoda | 0,10 | přesná nebo rok + měsíc |
| **doména** | Levenshtein + analýza TLD | 0,10 | > 0,90 |

```elixir
defmodule PrismaticResolution.ProbabilisticMatcher do
  @moduledoc "Weighted probabilistic entity matching with configurable metrics."

  @type match_result :: {:match, float()} | {:candidate, float()} | :no_match

  @weights %{
    name: 0.30,
    organization: 0.25,
    address: 0.15,
    phone: 0.10,
    date_of_birth: 0.10,
    domain: 0.10
  }

  @spec match(map(), map()) :: match_result()
  def match(record_a, record_b) do
    scores = compute_attribute_scores(record_a, record_b)

    weighted_score =
      Enum.reduce(scores, 0.0, fn {attr, score}, acc ->
        acc + score * Map.get(@weights, attr, 0.0)
      end)

    total_weight =
      scores
      |> Enum.map(fn {attr, _score} -> Map.get(@weights, attr, 0.0) end)
      |> Enum.sum()

    normalized_score = if total_weight > 0, do: weighted_score / total_weight, else: 0.0

    cond do
      normalized_score >= 0.85 -> {:match, normalized_score}
      normalized_score >= 0.60 -> {:candidate, normalized_score}
      true -> :no_match
    end
  end

  defp compute_attribute_scores(a, b) do
    [
      {:name, jaro_winkler(a[:normalized_name], b[:normalized_name])},
      {:organization, jaccard_tokens(a[:organization], b[:organization])},
      {:address, address_similarity(a[:address], b[:address])},
      {:phone, exact_match(a[:normalized_phone], b[:normalized_phone])},
      {:domain, levenshtein_normalized(a[:domain], b[:domain])}
    ]
    |> Enum.reject(fn {_attr, score} -> is_nil(score) end)
  end

  defp jaro_winkler(nil, _), do: nil
  defp jaro_winkler(_, nil), do: nil
  defp jaro_winkler(a, b), do: String.jaro_distance(a, b)

  defp exact_match(nil, _), do: nil
  defp exact_match(_, nil), do: nil
  defp exact_match(a, b), do: if(a == b, do: 1.0, else: 0.0)
end
```
### Grafové párování

Grafové sjednocování analyzuje vzorce vztahů ve znalostním grafu (srov. [Graph
Theory](@/glossary/graph-theory.md)):

```elixir
defmodule PrismaticResolution.GraphMatcher do
  @moduledoc "Relationship pattern analysis for entity resolution."

  @spec shared_connections(String.t(), String.t()) :: {:ok, float()} | {:error, term()}
  def shared_connections(entity_a, entity_b) do
    with {:ok, neighbors_a} <- KnowledgeGraph.neighbors(entity_a),
         {:ok, neighbors_b} <- KnowledgeGraph.neighbors(entity_b) do
      set_a = MapSet.new(neighbors_a)
      set_b = MapSet.new(neighbors_b)

      shared = MapSet.intersection(set_a, set_b)
      total = MapSet.union(set_a, set_b)

      coefficient = if MapSet.size(total) > 0 do
        MapSet.size(shared) / MapSet.size(total)
      else
        0.0
      end

      {:ok, coefficient}
    end
  end

  @spec structural_equivalence(String.t(), String.t()) :: {:ok, float()} | {:error, term()}
  def structural_equivalence(entity_a, entity_b) do
    with {:ok, roles_a} <- KnowledgeGraph.roles(entity_a),
         {:ok, roles_b} <- KnowledgeGraph.roles(entity_b) do
      role_set_a = MapSet.new(roles_a)
      role_set_b = MapSet.new(roles_b)

      shared_roles = MapSet.intersection(role_set_a, role_set_b)
      total_roles = MapSet.union(role_set_a, role_set_b)

      score = if MapSet.size(total_roles) > 0 do
        MapSet.size(shared_roles) / MapSet.size(total_roles)
      else
        0.0
      end

      {:ok, score}
    end
  end
end
```
## Strategie blokování

Bez blokování vyžaduje porovnání N záznamů N·(N−1)/2 párových porovnání. Blokování rozdělí
záznamy do skupin se společným atributem a prostor porovnání dramaticky zmenší:

| Strategie | Mechanismus | Zmenšení | Riziko |
|-------------------|-----------|-----------|------|
| **přesný klíč** | stejné první 3 znaky příjmení | ~100× | přehlédne překlepy |
| **seřazené sousedství** | klouzavé okno nad seřazenými klíči | ~50× | kompromis velikosti okna |
| **canopy** | předfiltr levnou metrikou vzdálenosti | ~200× | citlivost na práh |
| **LSH** (*Locality-Sensitive Hashing*) | přibližné párování přes hashe | ~500× | pravděpodobnost přehlédnutí shod |
| **fonetické** | kódování Soundex/Metaphone | ~100× | závislé na jazyce |
| **více klíčů** | sjednocení více blokovacích klíčů | ~50× | lepší úplnost, více porovnání |

```elixir
defmodule PrismaticResolution.Blocker do
  @moduledoc "Blocking strategies to reduce comparison space from O(n^2)."

  @spec generate_blocks([map()], atom()) :: {:ok, %{String.t() => [map()]}} | {:error, term()}
  def generate_blocks(records, strategy \\ :multi_key) do
    blocks = case strategy do
      :exact_key -> exact_key_blocking(records)
      :phonetic -> phonetic_blocking(records)
      :multi_key -> multi_key_blocking(records)
      :sorted_neighborhood -> sorted_neighborhood_blocking(records, window_size: 10)
    end

    {:ok, blocks}
  end

  defp multi_key_blocking(records) do
    # Generate multiple blocking keys per record for higher recall
    Enum.reduce(records, %{}, fn record, blocks ->
      keys = generate_blocking_keys(record)
      Enum.reduce(keys, blocks, fn key, acc ->
        Map.update(acc, key, [record], &[record | &1])
      end)
    end)
  end

  defp generate_blocking_keys(record) do
    [
      name_key(record[:normalized_name]),
      email_domain_key(record[:normalized_email]),
      phone_prefix_key(record[:normalized_phone]),
      address_postal_key(record[:postal_code])
    ]
    |> Enum.reject(&is_nil/1)
  end

  defp name_key(nil), do: nil
  defp name_key(name), do: "name:" <> String.slice(name, 0, 4)

  defp email_domain_key(nil), do: nil
  defp email_domain_key(email) do
    case String.split(email, "@") do
      [_, domain] -> "email_domain:" <> domain
      _ -> nil
    end
  end
end
```
## Kalibrace důvěry

Důvěra musí být kalibrována tak, aby uváděná důvěra odpovídala skutečné přesnosti. Systém,
který tvrdí důvěru 90 %, má mít pravdu v 90 % případů:

| Rozsah důvěry | Význam | Akce na platformě |
|-----------------|---------|---------------------|
| **0,95–1,00** | téměř jistá shoda (deterministická) | automatické sloučení do hlavní entity |
| **0,80–0,95** | pravděpodobnostní shoda s vysokou důvěrou | automatické sloučení s příznakem původu |
| **0,60–0,80** | kandidátní shoda | fronta k revizi analytikem |
| **0,40–0,60** | nejisté spojení | zachovat jako kandidáta, neslučovat |
| **0,00–0,40** | pravděpodobně různé entity | propojení se nevytváří |

Všechna skóre důvěry podléhají souladu s axiomy [NABLA Infinity](@/glossary/nabla-infinity.md):

- **Signal Plurality** – propojení musí opírat 2+ nezávislé signály;
- **Provenance Mandatory** – každý faktor shody musí být dohledatelný;
- **Time Decay** – důvěra klesá se stárnutím zdrojových dat;
- **Contradiction Preservation** – protichůdné důkazy se zachovávají, nezahazují.

## Integrace zdrojů OSINT

Sjednocování napříč zdroji OSINT přináší zvláštní obtíže kvůli jejich různorodosti:

| Typ zdroje | Dostupné identifikátory | Kvalita | Pokrytí |
|------------|----------------------|---------|----------|
| **WHOIS domén** | jméno, e-mail a organizace držitele | klesající (GDPR) | domény po celém světě |
| **Certificate Transparency** | doména, organizace, vydavatel | vysoká | všechny veřejné certifikáty TLS |
| **obchodní rejstříky** | právní název, daňové číslo, adresa | vysoká | podle jurisdikce |
| **sociální sítě** | uživatelské jméno, zobrazované jméno, popis | proměnlivá | podle platformy |
| **záznamy DNS** | doména, IP, jmenné servery | vysoká | všechny veřejné domény |
| **[Shodan](@/glossary/shodan.md)** | IP, porty, bannery, jména hostitelů | vysoká | služby dostupné z internetu |
| **[Censys](@/glossary/censys.md)** | certifikáty, hostitelé, protokoly | vysoká | celointernetové skenování |
| **[GreyNoise](@/glossary/greynoise.md)** | IP, klasifikace, štítky | vysoká | zdroje internetového šumu |
| **české rejstříky** | IČO, právní název, statutáři, adresa | velmi vysoká | Česká republika |
| **sankční seznamy** | jméno, aliasy, identifikátory | vysoká | EU, USA, OSN (viz [Sanctions Screening](@/glossary/sanctions-screening.md)) |

## Obtíže napříč jurisdikcemi

| Obtíž | Popis | Zmírnění |
|-----------|-------------|------------|
| **přepis jmen** | totéž jméno v latince, cyrilici, arabském písmu | normalizace více písem |
| **formáty adres** | různé poštovní zvyklosti v jednotlivých zemích | parsery adres podle země |
| **formáty identifikátorů** | daňová čísla a čísla firem se liší podle jurisdikce | registr formátů a normalizátor |
| **ochrana soukromí** | GDPR, CCPA omezují propojování dat přes hranice | sledování souhlasu podle jurisdikce |
| **firemní struktury** | dceřiné firmy, holdingy, skuteční majitelé | grafové sjednocení firemního stromu |
| **zvyklosti pojmenování** | patronyma, matronyma, více příjmení | kulturně citlivé rozebírání jmen |

## Výkonová hlediska

Sjednocování ve velkém měřítku vyžaduje pečlivou optimalizaci výkonu (orientační hodnoty):

| Měřítko | Záznamy | Naivní porovnání | S blokováním | Čas (přibližně) |
|-------|---------|-------------------|---------------|---------------|
| malé | 1 000 | 500 000 | 5 000 | < 1 sekunda |
| střední | 100 000 | 5 miliard | 500 000 | < 1 minuta |
| velké | 10 000 000 | 50 bilionů | 50 000 000 | < 1 hodina |

Platforma používá pro zpracování procesů sjednocování proudově framework Broadway, takže
příchozí zpravodajství sjednocuje průběžně v reálném čase místo dávkového zpracování
nahromaděných záznamů.

```elixir
defmodule PrismaticResolution.StreamResolver do
  @moduledoc "Real-time entity resolution using Broadway stream processing."

  use Broadway

  @spec start_link(keyword()) :: {:ok, pid()} | {:error, term()}
  def start_link(opts) do
    Broadway.start_link(__MODULE__,
      name: __MODULE__,
      producer: [
        module: {BroadwayRabbitMQ.Producer, queue: "entity_resolution"},
        concurrency: Keyword.get(opts, :concurrency, 5)
      ],
      processors: [
        default: [concurrency: 10, max_demand: 50]
      ],
      batchers: [
        knowledge_graph: [concurrency: 2, batch_size: 100, batch_timeout: 5_000]
      ]
    )
  end

  @impl true
  def handle_message(_, message, _) do
    record = Jason.decode!(message.data)
    resolved = resolve_single_record(record)

    message
    |> Message.update_data(fn _ -> resolved end)
    |> Message.put_batcher(:knowledge_graph)
  end

  @impl true
  def handle_batch(:knowledge_graph, messages, _batch_info, _context) do
    entities = Enum.map(messages, & &1.data)
    PrismaticResolution.KnowledgeGraphIntegrator.batch_upsert(entities)
    messages
  end
end
```
## Související pojmy

Bez vlastního hesla v glosáři knihy: *Knowledge Graph* (graf uložených vztahů sjednocených
entit), *Ontology* (schéma typů entit a kategorií vztahů), *Data Pipeline*, *Confidence
Scoring*, *Provenance Mandatory*, *Stream Processing* a *Broadway*.

## Související

**Platforma**

- [NABLA Infinity](@/glossary/nabla-infinity.md) – epistemický rámec důvěry ve sjednocení.
- [Trinity Gate](@/glossary/trinity-gate.md) – ověření tvrzení o sjednocení.
- [Signal Plurality](@/glossary/signal-plurality.md) – minimální požadavek na důkazy
  propojení.
- [Due Diligence](@/glossary/due-diligence.md) – prověrky, v nichž se sjednocování uplatňuje.
- [Shodan](@/glossary/shodan.md) a [Censys](@/glossary/censys.md) – zdroje infrastrukturních
  dat.

**Kompendium a etika**

- [Doxing](@/glossary/doxing.md) – zneužití propojování osobních údajů proti člověku.
- [OSINT](@/glossary/osint.md) – pravidla práce s otevřenými zdroji.
- [Pomluva a EA](@/kompendium/forensic-legal/14-defamation-EA.md) – právní rizika chybného
  přisouzení.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: entity-resolution](@/kompendium/glossary-bridges/bridge-entity-resolution.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
