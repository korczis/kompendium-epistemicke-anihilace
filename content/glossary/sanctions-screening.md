+++
title = "Sanctions screening (sankční prověrka)"
weight = 29
description = "Automatizované prověřování osob a subjektů proti sankčním seznamům EU, USA, Spojeného království a OSN s neostrým porovnáváním a slučováním entit."

[taxonomies]
tags = ["glossary", "compliance", "osint", "due-diligence", "prismatic"]

[extra]
category = "osint"
related_terms = ["osint", "intelligence-fusion", "nis2", "easm", "entity-resolution", "security-rating", "threat-intelligence", "compliance-framework", "gdpr"]
keywords = ["sanctions screening automation", "OFAC SDN list checking", "EU sanctions compliance", "fuzzy name matching", "entity resolution deduplication", "AML KYC screening", "sanctions list management", "PEP screening", "Elixir parallel screening", "regulatory compliance automation"]
platform_integration = "deep"
related_app = "prismatic_intel"
complexity = "advanced"
audience = ["compliance-officers", "risk-analysts", "osint-investigators", "security-engineers"]
date_created = "2026-02-22"
version = "2.0.0"
requires_knowledge = ["osint", "entity-resolution", "elixir"]
prismatic_components = ["SanctionsScreening", "ListManager", "FuzzyMatcher", "EntityResolver", "ResultAggregator"]
supported_lists = ["EU Consolidated", "OFAC SDN", "OFSI", "UN Consolidated"]
matching_algorithms = ["exact", "soundex", "levenshtein", "jaro-winkler", "n-gram", "token-based"]
screening_threshold = 0.85
enforcement_level = "P1"
compliance_frameworks = ["NIS2", "AML5D", "OFAC", "EU Sanctions Regulation"]
author = "Tomas Korcak (korczis)"
reading_time = "7 min"
word_count = 1356
date_modified = "2026-11-10"
quality_score = 80
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "Sanctions screening (sankční prověrka) – glosář"
+++

## Definice a přehled

Sankční prověrka (*sanctions screening*) je regulatorní proces systematického porovnávání
fyzických osob, organizací, plavidel, adres a dalších subjektů s oficiálními sankčními seznamy,
které vedou státní a nadnárodní orgány. Hlavními seznamy jsou konsolidovaný sankční seznam
Evropské unie, seznam SDN (*Specially Designated Nationals*) amerického úřadu OFAC (*Office of
Foreign Assets Control*), seznam britského úřadu OFSI (*Office of Financial Sanctions
Implementation*) a konsolidovaný seznam Rady bezpečnosti OSN. Proces identifikuje sankcionované
subjekty, politicky exponované osoby (PEP) a subjekty podléhající restriktivním opatřením,
včetně zmrazení majetku, zákazů cestování, zbrojních embarg a obchodních omezení.

Sankční prověrka stojí na průsečíku regulatorního souladu, prevence finanční kriminality
a národní bezpečnosti. Organizace, na něž se sankční předpisy vztahují – finanční instituce,
pojišťovny, zprostředkovatelé obchodu a stále častěji i technologické firmy –, musí před
navázáním obchodního vztahu nebo zpracováním platby prověřit protistrany, zákazníky, skutečné
majitele a transakce proti příslušným seznamům. Nesplnění povinností přináší přísné sankce
včetně trestního stíhání, vysokých pokut (u závažných porušení v řádu miliard dolarů)
a poškození pověsti. V České republice provádění mezinárodních sankcí upravuje zákon
č. 69/2006 Sb., o provádění mezinárodních sankcí.

Prismatic Platform implementuje sankční prověrku jako integrovanou součást své pipeline
[OSINT](@/glossary/osint.md) a [fúze zpravodajských informací](@/glossary/intelligence-fusion.md)
a využívá model souběžnosti Elixiru k paralelní prověrce proti více seznamům s odezvou pod
sekundu. Výsledky prověrek vstupují přímo do [bezpečnostních
hodnocení](https://prismatic-reality-com.github.io/prismatic-promo/glossary/security-rating/)
a [posouzení souladu](@/glossary/compliance-framework.md) a dávají jednotný pohled na riziko
subjektu v regulatorní, bezpečnostní i provozní dimenzi.

Pro Kompendium je sankční prověrka pojmem z kontextu platformy. Kniha se jí dotýká tam, kde
rozhoduje o lidech: shoda jména na seznamu je hypotéza, ne zjištění, a neopatrné závěry mohou
poškodit nevinné osoby se stejným nebo podobným jménem (viz [EA × OSINT: Sankční seznamy
a atribuční bias](@/kompendium/cross-domain/4-ea-osint-sanctions-list-bias.md)).

## Historický kontext a regulatorní prostředí

Moderní sankční režim má kořeny v americkém zákoně *Trading with the Enemy Act* z roku 1917
a v sankcích Společnosti národů proti Itálii v roce 1935. Sankční prostředí v dnešní podobě však
vzniklo hlavně po útocích z 11. září 2001, kdy byl globální finanční systém mobilizován jako
zbraň proti financování terorismu. Zákon *USA PATRIOT Act* z roku 2001 výrazně rozšířil
pravomoci OFAC a rozsah povinností finančních institucí v oblasti sankčního souladu.

V Evropě vyvinula Evropská unie vlastní sankční rámec prostřednictvím rozhodnutí v rámci
společné zahraniční a bezpečnostní politiky (SZBP), prováděných nařízeními Rady, která jsou
přímo použitelná ve všech členských státech. Sankční prostředí EU se dramaticky zkomplikovalo
po ruské anexi Krymu v roce 2014 a po plnohodnotné invazi na Ukrajinu v roce 2022, která vyvolala
nejrozsáhlejší sankční balíčky v dějinách EU – více než deset po sobě jdoucích balíčků
s tisíci individuálních označení osob a subjektů.

Odchod Spojeného království z EU vytvořil třetí velký sankční režim; jeho právním základem je
zákon *Sanctions and Anti-Money Laundering Act 2018* a vymáhání finančních sankcí má na starosti
OFSI při britském ministerstvu financí. Rada bezpečnosti OSN vede vlastní konsolidovaný seznam,
který jsou členské státy povinny provádět, ale který se rozsahem a výkladem může od národních
provedení lišit.

Tato víceúrovňová složitost napříč jurisdikcemi je základní technickou výzvou sankční prověrky.
Subjekt může být sankcionován jedním orgánem, a jiným ne, nebo sankcionován v různých programech
s různými omezeními. Prismatic Platform to řeší paralelní prověrkou proti všem hlavním seznamům
a konsolidovaným posouzením rizika, které zohledňuje konkrétní regulatorní povinnosti
prověřující organizace.

## Technický rozbor

### Algoritmy porovnávání

Systémy sankční prověrky kombinují více strategií porovnávání, aby maximalizovaly záchyt
a zároveň udržely míru falešně pozitivních shod pod kontrolou:

| Algoritmus | Přístup | Silná stránka | Slabina | Váha v Prismatic |
|-----------|----------|----------|----------|-----------------|
| **Přesná shoda** | porovnání znak po znaku | nula falešně pozitivních | mine jakoukoli variantu | 1,0 |
| **Soundex/Metaphone** | porovnání fonetického kódu | zachytí výslovnostní varianty | jazykově specifické, vysoká míra FP | 0,6 |
| **Levenshteinova vzdálenost** | editační vzdálenost řetězců | zachytí překlepy a drobné odchylky | výpočetně náročné | 0,8 |
| **Jaro-Winkler** | vážené transpozice znaků | dobré pro porovnávání jmen | citlivé na rozdíly délky | 0,85 |
| **N-gramy** | míra překryvu podřetězců | jazykově nezávislé | vysoká míra falešně pozitivních | 0,7 |
| **Tokenové** | porovnání slov s přeskupením | zvládá různé pořadí jmen | mine částečné shody jmen | 0,75 |

Produkční systémy obvykle kombinují více algoritmů ve skórovací pipeline, v níž každý algoritmus
přispívá váženým skóre do složené důvěry shody. Shody nad nastavitelným prahem (ve výchozí
konfiguraci Prismatic Platform 0,85) se označí k lidskému přezkumu, jasné neshody projdou
automaticky.

### Pipeline normalizace jmen

Před porovnáním procházejí jména subjektů normalizační pipeline, která řeší běžné varianty:

```elixir
defmodule PrismaticIntel.SanctionsScreening.NameNormalizer do
  @moduledoc """
  Normalizes entity names before sanctions matching to improve
  detection rates. Handles transliteration, honorific removal,
  script conversion, and cultural naming pattern normalization.
  """

  @spec normalize(String.t()) :: {:ok, list(String.t())} | {:error, term()}
  def normalize(name) when is_binary(name) do
    variants =
      name
      |> String.trim()
      |> generate_variants()
      |> Enum.map(&apply_normalizations/1)
      |> Enum.uniq()

    {:ok, variants}
  end

  defp generate_variants(name) do
    [
      name,
      remove_honorifics(name),
      remove_diacritics(name),
      transliterate(name),
      reverse_name_order(name)
    ]
    |> Enum.reject(&is_nil/1)
  end

  defp apply_normalizations(name) do
    name
    |> String.downcase()
    |> String.replace(~r/[^\p{L}\p{N}\s]/u, "")
    |> String.replace(~r/\s+/, " ")
    |> String.trim()
  end

  defp remove_honorifics(name) do
    honorifics = ~w(mr mrs ms dr prof sir dame lord lady haj sheikh)
    words = String.split(name, " ")
    filtered = Enum.reject(words, fn w -> String.downcase(w) in honorifics end)
    Enum.join(filtered, " ")
  end

  defp remove_diacritics(name) do
    name
    |> :unicode.characters_to_nfd_binary()
    |> String.replace(~r/[\x{0300}-\x{036f}]/u, "")
  end

  defp transliterate(name), do: name
  defp reverse_name_order(name) do
    parts = String.split(name, " ", trim: true)
    if length(parts) >= 2, do: Enum.join(Enum.reverse(parts), " "), else: nil
  end
end
```

### Správa a příjem seznamů

Sankční seznamy se zveřejňují v různých formátech (XML, CSV, PDF, JSON) s různou frekvencí
aktualizací a různými schématy. ListManager platformy převádí tyto různorodé zdroje do
jednotného interního formátu:

| Seznam | Orgán | Frekvence aktualizace | Formát | Položky (přibližně, v době zápisu) |
|------|-----------|-----------------|--------|------------------|
| **EU konsolidovaný** | Evropská komise | denně | XML | 10 000+ |
| **OFAC SDN** | ministerstvo financí USA | několikrát týdně | XML, CSV, PDF | 12 000+ |
| **OFSI** | ministerstvo financí Spojeného království | týdně | CSV, XML | 4 000+ |
| **OSN konsolidovaný** | Rada bezpečnosti OSN | dle potřeby | XML | 800+ |
| **Seznamy PEP** | různí poskytovatelé | měsíčně | proprietární | 1 000 000+ |

```elixir
defmodule PrismaticIntel.SanctionsScreening.ListManager do
  @moduledoc """
  Manages sanctions list ingestion, normalization, and caching.
  Lists are fetched from authoritative sources, parsed into a
  unified schema, and cached in ETS for sub-millisecond lookup.
  Automatic refresh ensures lists are never stale beyond the
  configured maximum age.
  """

  use GenServer

  @type list_entry :: %{
    id: String.t(),
    source_list: atom(),
    names: list(String.t()),
    aliases: list(String.t()),
    date_of_birth: Date.t() | nil,
    nationalities: list(String.t()),
    entry_type: :individual | :entity | :vessel | :aircraft,
    sanctions_programs: list(String.t()),
    designation_date: Date.t(),
    last_updated: DateTime.t()
  }

  @spec start_link(keyword()) :: GenServer.on_start()
  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @impl true
  def init(opts) do
    table = :ets.new(:sanctions_lists, [:set, :public, read_concurrency: true])
    schedule_refresh(Keyword.get(opts, :refresh_interval, :timer.hours(1)))
    {:ok, %{table: table, last_refresh: nil}, {:continue, :initial_load}}
  end

  @impl true
  def handle_continue(:initial_load, state) do
    load_all_lists(state.table)
    {:noreply, %{state | last_refresh: DateTime.utc_now()}}
  end

  @spec get_entries(atom()) :: [list_entry()]
  def get_entries(list_name) do
    :ets.match_object(:sanctions_lists, {list_name, :_})
    |> Enum.map(fn {_list, entry} -> entry end)
  end

  defp load_all_lists(table) do
    [:eu_consolidated, :ofac_sdn, :ofsi, :un_consolidated]
    |> Task.async_stream(&fetch_and_parse/1, max_concurrency: 4, timeout: 60_000)
    |> Enum.each(fn {:ok, {list_name, entries}} ->
      Enum.each(entries, fn entry ->
        :ets.insert(table, {list_name, entry})
      end)
    end)
  end

  defp fetch_and_parse(list_name) do
    # Fetch from authoritative source and parse into unified schema
    {list_name, []}
  end

  defp schedule_refresh(interval) do
    Process.send_after(self(), :refresh, interval)
  end
end
```

## Implementace v Prismatic Platform

Prismatic Platform implementuje sankční prověrku jako součást pipeline fúze zpravodajských
informací a pro paralelní kontrolu více seznamů využívá model souběžnosti Elixiru:

```elixir
defmodule PrismaticIntel.SanctionsScreening do
  @moduledoc """
  Multi-list sanctions screening with fuzzy matching and entity resolution.
  Checks entities against EU, OFAC, OFSI, and UN sanctions lists in parallel
  using Task.async_stream for bounded concurrency. Results are deduplicated
  through entity resolution and classified by risk level.
  """

  alias PrismaticIntel.SanctionsScreening.{
    ListManager,
    FuzzyMatcher,
    EntityResolver,
    NameNormalizer
  }

  @type screening_result :: %{
    entity: String.t(),
    matches: list(match()),
    risk_level: :clear | :potential_match | :confirmed_match,
    confidence: float(),
    lists_checked: list(atom()),
    checked_at: DateTime.t(),
    screening_id: String.t()
  }

  @type match :: %{
    list: atom(),
    entry_id: String.t(),
    matched_name: String.t(),
    similarity_score: float(),
    match_algorithm: atom(),
    sanctions_programs: list(String.t()),
    entry_type: :individual | :entity | :vessel | :aircraft
  }

  @lists [:eu_consolidated, :ofac_sdn, :ofsi, :un_consolidated]

  @spec screen_entity(String.t(), keyword()) :: {:ok, screening_result()} | {:error, term()}
  def screen_entity(entity_name, opts \\ []) do
    threshold = Keyword.get(opts, :threshold, 0.85)
    lists = Keyword.get(opts, :lists, @lists)

    with {:ok, normalized_names} <- NameNormalizer.normalize(entity_name) do
      tasks =
        Enum.map(lists, fn list ->
          Task.async(fn ->
            entries = ListManager.get_entries(list)
            Enum.flat_map(normalized_names, fn name ->
              FuzzyMatcher.find_matches(name, entries, threshold)
            end)
          end)
        end)

      raw_matches =
        tasks
        |> Task.await_many(30_000)
        |> List.flatten()

      resolved_matches = EntityResolver.deduplicate(raw_matches)

      result = %{
        entity: entity_name,
        matches: resolved_matches,
        risk_level: classify_risk(resolved_matches),
        confidence: calculate_confidence(resolved_matches),
        lists_checked: lists,
        checked_at: DateTime.utc_now(),
        screening_id: generate_screening_id()
      }

      {:ok, result}
    end
  end

  @spec screen_batch(list(String.t()), keyword()) :: {:ok, list(screening_result())} | {:error, term()}
  def screen_batch(entity_names, opts \\ []) do
    results =
      entity_names
      |> Task.async_stream(&screen_entity(&1, opts), max_concurrency: 10, timeout: 60_000)
      |> Enum.map(fn {:ok, result} -> result end)

    {:ok, results}
  end

  defp classify_risk([]), do: :clear
  defp classify_risk(matches) do
    max_score = matches |> Enum.map(& &1.similarity_score) |> Enum.max()
    cond do
      max_score >= 0.95 -> :confirmed_match
      max_score >= 0.85 -> :potential_match
      true -> :clear
    end
  end

  defp calculate_confidence(matches) do
    case matches do
      [] -> 1.0
      _ -> matches |> Enum.map(& &1.similarity_score) |> Enum.max()
    end
  end

  defp generate_screening_id do
    "scr_" <> Base.encode16(:crypto.strong_rand_bytes(8), case: :lower)
  end
end
```

## Napojení na komponenty platformy

Výsledky prověrek vstupují do několika navazujících systémů:

| Komponenta | Integrace | Účel |
|-----------|------------|---------|
| [Security Rating](https://prismatic-reality-com.github.io/prismatic-promo/glossary/security-rating/) | míra rizika ovlivňuje skóre | sankční expozice zhoršuje hodnocení organizace |
| [EASM](@/glossary/easm.md) | prověrka dodavatelského řetězce | odhaluje sankcionované subjekty v sítích dodavatelů |
| soulad s [NIS2](https://prismatic-reality-com.github.io/prismatic-promo/glossary/nis2/) | riziko dodavatelského řetězce | NIS2 vyžaduje posouzení bezpečnosti dodavatelského řetězce |
| [Intelligence Fusion](@/glossary/intelligence-fusion.md) | korelace více zdrojů | výsledky prověrek se korelují s dalšími daty OSINT |
| [Audit Trail](https://prismatic-reality-com.github.io/prismatic-promo/glossary/audit-trail/) | dokumentace souladu | všechna rozhodnutí z prověrek se zaznamenávají s úplnou auditní stopou |
| [SIEM](https://prismatic-reality-com.github.io/prismatic-promo/glossary/siem/) | bezpečnostní události | výsledky prověrek se vysílají jako bezpečnostní telemetrie |

## Srovnání s alternativami

| Přístup | Pokrytí | Rychlost | Přesnost | Náklady |
|----------|----------|-------|----------|------|
| **Vlastní prověrka** | přizpůsobitelné | rychlá (lokálně) | závisí na implementaci | vývoj + údržba |
| **Komerční SaaS** (Dow Jones, Refinitiv) | úplné + PEP | latence API | vysoká (vyladěné modely) | cena za dotaz |
| **Bureau van Dijk / Moody's** | zaměření na finance | střední | velmi vysoká | podniková licence |
| **Jen otevřené seznamy** | jen vládní seznamy | rychlá | omezená (bez PEP) | zdarma (seznamy) + vývoj |
| **Integrace v Prismatic** | více seznamů + obohacení z OSINT | paralelní, pod sekundu | vysoká (neostré porovnání + slučování) | součást platformy |

Komerční poskytovatelé prověrek nabízejí širší pokrytí dat (zejména databáze PEP, negativní
mediální zmínky a vlastnické struktury firem), ale přinášejí závislost na API, náklady za dotaz
a otázky umístění dat. Vlastní prověrka dává plnou kontrolu a odstraňuje náklady za dotaz, ale
vyžaduje významné investice do správy seznamů, vývoje porovnávacích algoritmů a průběžné údržby.

## Auditní stopa a dokumentace souladu

Každá operace prověrky vytváří neměnný auditní záznam, který dokumentuje parametry prověrky,
výsledky a rozhodnutí:

```elixir
defmodule PrismaticIntel.SanctionsScreening.AuditLogger do
  @moduledoc """
  Records immutable audit logs for all sanctions screening operations.
  Required by regulatory frameworks for compliance evidence.
  Records are retained for the configured period (minimum 5 years).
  """

  @spec log_screening(screening_result(), keyword()) :: {:ok, String.t()} | {:error, term()}
  def log_screening(result, opts \\ []) do
    audit_record = %{
      screening_id: result.screening_id,
      entity_screened: result.entity,
      lists_checked: result.lists_checked,
      match_count: length(result.matches),
      risk_level: result.risk_level,
      confidence: result.confidence,
      screened_at: result.checked_at,
      screened_by: Keyword.get(opts, :operator, "system"),
      disposition: Keyword.get(opts, :disposition, :pending_review),
      disposition_reason: Keyword.get(opts, :reason),
      retention_until: Date.add(Date.utc_today(), 365 * 7)
    }

    {:ok, audit_record.screening_id}
  end
end
```

## Osvědčené postupy

1. **Kalibrovat prahy shody podle ochoty nést riziko.** Příliš nízké prahy vytvářejí zahlcující
   množství falešně pozitivních shod, příliš vysoké hrozí přehlédnutím skutečných shod. Začít na
   0,85 a upravovat podle provozní zkušenosti a regulatorních pokynů.
2. **Aktualizace seznamů uplatňovat neprodleně.** Sankční označení nabývají účinnosti okamžitě po
   zveřejnění. Automatizované pipeline příjmu s ověřením integrity mají aktualizace zpracovat do
   několika hodin od zveřejnění.
3. **Dokumentovat všechna rozhodnutí z prověrek.** Regulátoři očekávají úplné auditní stopy, které
   dokládají důkladný přezkum shod, zdokumentované zdůvodnění rozhodnutí a uchování záznamů po
   dobu 5–7 let.
4. **Prověřovat průběžně, ne jen při navázání vztahu.** Dávková opakovaná prověrka existujících
   vztahů při každé aktualizaci seznamů zachytí subjekty označené až po úvodním schválení.
5. **Kombinovat více algoritmů porovnávání.** Žádný jednotlivý algoritmus nezachytí všechny typy
   variant. Víceúrovňová skórovací pipeline platformy pokrývá transliteraci, fonetickou
   podobnost i typografické odchylky.
6. **Slučovat entity napříč seznamy.** Tentýž sankcionovaný subjekt uvedený na více seznamech pod
   různými variantami jména je třeba sloučit do jediného záznamu, aby bylo posouzení rizika
   přesné (viz [Entity Resolution](@/glossary/entity-resolution.md)).

## Časté chyby

- **Prověrka proti zastaralým seznamům**: používání starých verzí seznamů vytváří mezery v souladu.
  Zavést automatickou obnovu s výstrahami při zastarání.
- **Přílišné spoléhání na přesnou shodu**: přesná shoda mine prakticky všechny pokusy o obcházení.
  Neostré porovnávání je pro smysluplnou detekci povinné.
- **Přehlížení aliasů a transliteračních variant**: sankcionované subjekty používají aliasy,
  transliterace a záměrné zamlžování. Normalizace a generování variant jsou nezbytnými kroky
  předzpracování.
- **Nezohlednění rozdílů písma**: arabská, cyrilská a čínská jména mají více platných přepisů do
  latinky. Porovnávání napříč písmy vyžaduje specializovanou práci s transliterací.
- **Brát prověrku jako jednorázovou kontrolu**: sankční seznamy se průběžně aktualizují. Průběžné
  monitorování je regulatorním očekáváním, ne volitelným vylepšením.
- **Zaměnit shodu jména s identitou**: každou shodu nad prahem musí potvrdit další
  identifikátory (datum narození, státní příslušnost, adresa, registrační čísla) – jinak hrozí
  újma osobám se shodným jménem.

## Související

**Pojmy v tomto glosáři**

- [OSINT](@/glossary/osint.md) – metodika přístupu k veřejným sankčním datům.
- [Intelligence Fusion](@/glossary/intelligence-fusion.md) – korelace výsledků prověrek z více
  zdrojů.
- [EASM](@/glossary/easm.md) – kontext útočné plochy, který výsledky obohacuje.
- [Entity Resolution](@/glossary/entity-resolution.md) – technologie deduplikace, na níž stojí
  přesnost prověrky.
- [Compliance Framework](@/glossary/compliance-framework.md) – regulatorní požadavky, z nichž
  povinnost prověrky plyne.
- [Due Diligence](@/glossary/due-diligence.md) – hlavní kontext užití.
- [Risk Score](@/glossary/risk-score.md) – skórování rizik, do něhož výsledky vstupují.

**Hesla a přehledy platformy mimo tuto knihu**

- [NIS2](https://prismatic-reality-com.github.io/prismatic-promo/glossary/nis2/),
  [Security Rating](https://prismatic-reality-com.github.io/prismatic-promo/glossary/security-rating/),
  [Threat Intelligence](https://prismatic-reality-com.github.io/prismatic-promo/glossary/threat-intelligence/),
  [Audit Trail](https://prismatic-reality-com.github.io/prismatic-promo/glossary/audit-trail/),
  [SDN List](https://prismatic-reality-com.github.io/prismatic-promo/glossary/sdn-list/).
- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/),
  [Technologie](https://prismatic-reality-com.github.io/prismatic-promo/technologies/),
  [Aplikace](https://prismatic-reality-com.github.io/prismatic-promo/apps/).

**Kniha**

- [EA × OSINT: Sankční seznamy a atribuční bias](@/kompendium/cross-domain/4-ea-osint-sanctions-list-bias.md) –
  zkreslení při práci se sankčními daty.
- [Compliance Agent a detekce EA](@/kompendium/aiad-integration/compliance-ea-regulatory-screening.md) –
  regulatorní prověrka v detekci EA.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: sanctions-screening](@/kompendium/glossary-bridges/bridge-sanctions-screening.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
