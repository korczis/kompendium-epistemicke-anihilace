+++
title = "OSINT (zpravodajství z otevřených zdrojů)"
weight = 27
description = "Sběr a analýza informací z veřejně dostupných zdrojů: zpravodajský cyklus, typy zdrojů, ověřování a etické meze; v Prismatic Platform a axiomy NABLA."

[taxonomies]
tags = ["glossary", "osint", "intelligence", "due-diligence", "prismatic", "evidence"]

[extra]
category = "osint"
abbreviation = "OSINT"
related_terms = ["intelligence-fusion", "threat-intelligence", "easm", "hawkeye", "entity-resolution", "garden", "sanctions-screening"]
keywords = ["open source intelligence definition", "OSINT methodology guide", "intelligence gathering techniques", "OSINT source taxonomy", "public records intelligence", "digital forensics OSINT", "threat intelligence collection", "OSINT analysis framework"]
author = "Tomas Korcak (korczis)"
reading_time = "8 min"
word_count = 1689
date_created = "2026-02-23"
date_modified = "2026-11-10"
quality_score = 87
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "OSINT (zpravodajství z otevřených zdrojů) – glosář"
+++

## Definice a přehled

Zpravodajství z otevřených zdrojů (*Open Source Intelligence*, OSINT) je disciplína sběru,
zpracování, analýzy a předávání informací z veřejně dostupných zdrojů s cílem vytvořit použitelné
zpravodajské poznatky. Na rozdíl od signálového (SIGINT) nebo lidského (HUMINT) zpravodajství se
OSINT opírá výhradně o informace, které jsou veřejnosti legálně přístupné: veřejné rejstříky,
profily na sociálních sítích, registrace domén, logy Certificate Transparency, záznamy DNS, webový
obsah, odborné publikace, finanční výkazy, patentové databáze a komerční datové služby. OSINT
klade důraz na strukturované analytické postupy, ověřování zdrojů a etické metody sběru, které
respektují zákony o ochraně soukromí, podmínky užití a jurisdikční předpisy.

Historie OSINT je starší než digitální věk. Zpravodajští analytici vždy studovali noviny, rozhlasové
vysílání, odborné časopisy a veřejné záznamy. Změnilo se měřítko: digitální revoluce vytvořila
bezprecedentní objem veřejně dostupných informací. Problém se posunul od nedostatku informací
k informačnímu přetížení. Moderní praxe OSINT se soustředí na automatizovaný sběr, strukturovanou
analýzu, slučování entit napříč nesourodými zdroji a posouzení s kalibrovanou důvěrou, které
přiznává nejistotu.

OSINT se od jiných zpravodajských disciplín neliší jen zdroji, ale i metodikou. Tradiční
zpravodajství vychází z předpokladu, že důležité informace jsou skryté a je třeba je získat
skrytými prostředky. OSINT vychází z doplňujícího předpokladu, že důležité informace jsou často už
veřejně dostupné, ale zapadají v šumu obrovských datových sad. Dovednost analytika nespočívá
v získání přístupu, ale v rozpoznání relevance, korelaci signálů napříč zdroji a tvorbě posouzení,
podle nichž mohou rozhodující osoby jednat.

Zpravodajský cyklus OSINT sleduje standardní zpravodajský proces: plánování a řízení (na jaké
otázky je třeba odpovědět), sběr (získání dat ze zdrojů), zpracování (převod surových dat do
použitelné podoby), analýza (výklad zpracovaných dat a tvorba poznatků) a předání (doručení
poznatků spotřebitelům). V Prismatic Platform podporují každou fázi cyklu specializované nástroje,
agenti a pipeline, které automatizují rutinní operace a zachovávají dohled analytika nad
kritickými úsudky.

Pro Kompendium má OSINT dvojí roli. Je nástrojem ověřování – triangulace zdrojů je přímou obranou
proti dezinformacím (viz [EA × OSINT: Source Credibility under Epistemic
Attack](@/kompendium/cross-domain/1-ea-osint-source-credibility.md)). A zároveň je dvojího užití:
tytéž postupy umožňují pronásledování a [doxing](@/glossary/doxing.md). Kniha popisuje OSINT jen
v obranném a zákonném rámci; vyhledávání informací o soukromých osobách bez právního důvodu
nepopisuje.

## Historický kontext

Zpravodajská práce s otevřenými zdroji se institucionalizovala už za druhé světové války – ve
Spojených státech vznikla v roce 1941 služba pro monitorování zahraničního vysílání, později známá
jako *Foreign Broadcast Information Service* (FBIS), která sledovala a překládala zahraniční média
a za studené války se stala jádrem práce s otevřenými zdroji. (Původní verze hesla vznik FBIS
chybně kladla do pozdní studené války.) V 90. letech nástup internetu exponenciálně rozšířil objem
veřejně dostupných informací a na počátku 21. století zpravodajské služby po celém světě uznaly
OSINT za rovnocennou disciplínu vedle SIGINT, HUMINT, GEOINT a MASINT.

Zpráva americké komise pro 11. září (2004) upozornila na selhání zpravodajské komunity při syntéze
veřejně dostupných informací, které mohly poskytnout varování před útoky. To podnítilo
institucionální investice do schopností OSINT. Vznik Open Source Center (OSC) v roce 2005 a jeho
nástupce Open Source Enterprise (OSE) formalizoval roli OSINT v americké zpravodajské komunitě.

V soukromém sektoru získaly techniky OSINT význam díky výzkumu kybernetické bezpečnosti,
konkurenčnímu zpravodajství a šetřením v rámci [due diligence](@/glossary/due-diligence.md).
Schopnosti OSINT v Prismatic Platform podle její dokumentace čerpají z více než dvaceti let
praktické zpravodajské práce zachycené ve znalostní bázi
[GARDEN](https://prismatic-reality-com.github.io/prismatic-promo/glossary/garden/), zejména
v repozitáři `sig`, který v době zápisu obsahoval přes 250 integrací poskytovatelů OSINT.

## Technický rozbor

### Taxonomie zdrojů OSINT

Zdroje OSINT se třídí podle typu, spolehlivosti a způsobu přístupu:

| Kategorie | Zdroje | Spolehlivost | Způsob přístupu |
|----------|---------|-------------|---------------|
| **Doménové zpravodajství** | záznamy DNS, WHOIS, výčet subdomén | vysoká | přímý dotaz (protokol DNS) |
| **Certifikátové zpravodajství** | logy Certificate Transparency, záznamy vydavatelů | velmi vysoká | API logů CT (crt.sh, Censys) |
| **Síťové zpravodajství** | rozsahy IP, mapování ASN, skeny portů | vysoká | Shodan, Censys, pasivní DNS |
| **Webové zpravodajství** | obsah webu, robots.txt, hlavičky | střední | požadavky HTTP, procházení webu |
| **Rejstříkové zpravodajství** | registrace firem, soudní záznamy, podání | velmi vysoká | vládní API, extrakce z webu |
| **Sociální zpravodajství** | profily na sociálních sítích, veřejné příspěvky | nízká až střední | API platforem, veřejné stránky |
| **Finanční zpravodajství** | podání SEC, výroční zprávy, patentové databáze | velmi vysoká | EDGAR, API patentových úřadů |
| **Akademické zpravodajství** | výzkumné články, sborníky konferencí | vysoká | akademické databáze, preprintové servery |
| **Geoprostorové zpravodajství** | satelitní snímky, mapová data, check-iny | střední | veřejná mapová API, služby snímků |

### Architektura sběru

Prismatic Platform implementuje sběr OSINT architekturou s více adaptéry:

```elixir
defmodule PrismaticOSINT.Collector do
  @moduledoc """
  Multi-source OSINT collector with adapter-based backend selection.
  Coordinates collection across DNS, certificate, registry, and web sources.
  """

  @type collection_target :: %{
    domain: String.t() | nil,
    email: String.t() | nil,
    person: String.t() | nil,
    organization: String.t() | nil,
    ip_address: String.t() | nil
  }

  @type collection_result :: %{
    target: collection_target(),
    findings: list(map()),
    sources_queried: list(String.t()),
    collection_time_ms: non_neg_integer(),
    confidence: float()
  }

  @spec collect(collection_target(), keyword()) :: {:ok, collection_result()} | {:error, term()}
  def collect(target, opts \\ []) do
    adapters = select_adapters(target, opts)
    timeout = Keyword.get(opts, :timeout, 30_000)

    tasks =
      Enum.map(adapters, fn adapter ->
        Task.async(fn ->
          start = System.monotonic_time(:millisecond)
          result = adapter.collect(target)
          duration = System.monotonic_time(:millisecond) - start

          :telemetry.execute(
            [:prismatic, :osint, :collection],
            %{duration_ms: duration},
            %{adapter: adapter.name(), target_type: target_type(target)}
          )

          {adapter.name(), result, duration}
        end)
      end)

    results = Task.await_many(tasks, timeout)

    findings =
      results
      |> Enum.flat_map(fn
        {_adapter, {:ok, data}, _duration} -> data
        {_adapter, {:error, _reason}, _duration} -> []
      end)

    {:ok, %{
      target: target,
      findings: findings,
      sources_queried: Enum.map(results, fn {adapter, _, _} -> adapter end),
      collection_time_ms: Enum.max_by(results, fn {_, _, d} -> d end) |> elem(2),
      confidence: calculate_confidence(results)
    }}
  end

  defp select_adapters(%{domain: domain}, _opts) when is_binary(domain) do
    [
      PrismaticOSINT.Adapters.DNS,
      PrismaticOSINT.Adapters.CertificateTransparency,
      PrismaticOSINT.Adapters.WHOIS,
      PrismaticOSINT.Adapters.WebContent,
      PrismaticOSINT.Adapters.Shodan
    ]
  end

  defp select_adapters(%{email: email}, _opts) when is_binary(email) do
    [
      PrismaticOSINT.Adapters.EmailVerification,
      PrismaticOSINT.Adapters.BreachDatabase,
      PrismaticOSINT.Adapters.SocialMedia,
      PrismaticOSINT.Adapters.DomainFromEmail
    ]
  end

  defp select_adapters(%{organization: org}, _opts) when is_binary(org) do
    [
      PrismaticOSINT.Adapters.BusinessRegistry,
      PrismaticOSINT.Adapters.ARES,
      PrismaticOSINT.Adapters.CommercialRegister,
      PrismaticOSINT.Adapters.FinancialFilings
    ]
  end

  defp calculate_confidence(results) do
    successful = Enum.count(results, fn {_, result, _} -> match?({:ok, _}, result) end)
    total = length(results)
    if total > 0, do: successful / total, else: 0.0
  end
end
```

### Slučování entit

Klíčovou výzvou OSINT je [slučování entit](@/glossary/entity-resolution.md) (*entity
resolution*) – určení, zda odkazy z různých zdrojů označují tutéž entitu reálného světa. Jména se
liší (John Smith, J. Smith, John R. Smith), adresy se mění, organizace používají více názvů a lidé
se objevují v různých kontextech:

```elixir
defmodule PrismaticOSINT.EntityResolution do
  @moduledoc """
  Fuzzy entity resolution across OSINT sources.
  Uses multiple similarity metrics with configurable thresholds.
  """

  @type entity :: %{
    name: String.t(),
    aliases: list(String.t()),
    identifiers: map(),
    sources: list(String.t()),
    confidence: float()
  }

  @similarity_threshold 0.85

  @spec resolve(list(map())) :: list(entity())
  def resolve(raw_entities) do
    raw_entities
    |> Enum.sort_by(&(-length(&1.sources)))
    |> Enum.reduce([], fn entity, resolved ->
      case find_match(entity, resolved) do
        {:match, existing, score} ->
          merged = merge_entities(existing, entity, score)
          replace_entity(resolved, existing, merged)

        :no_match ->
          [entity_to_resolved(entity) | resolved]
      end
    end)
  end

  defp find_match(entity, resolved) do
    resolved
    |> Enum.map(fn existing ->
      score = calculate_similarity(entity, existing)
      {existing, score}
    end)
    |> Enum.filter(fn {_, score} -> score >= @similarity_threshold end)
    |> Enum.max_by(fn {_, score} -> score end, fn -> nil end)
    |> case do
      nil -> :no_match
      {existing, score} -> {:match, existing, score}
    end
  end

  defp calculate_similarity(a, b) do
    name_sim = PrismaticOSINT.Similarity.jaro_winkler(a.name, b.name)
    alias_sim = max_alias_similarity(a, b)
    id_sim = identifier_overlap(a, b)

    # Weighted combination
    name_sim * 0.4 + alias_sim * 0.3 + id_sim * 0.3
  end
end
```

Chybné sloučení dvou různých osob se stejným jménem je jednou z nejzávažnějších chyb OSINT,
protože může poškodit nevinného člověka; proto se sloučení s nízkou jistotou označuje a ověřuje.

### České právní a obchodní zpravodajství

Prismatic Platform má specializované schopnosti OSINT pro české právní a obchodní zpravodajství:

| Zdroj | API/metoda | Poskytovaná data |
|--------|-----------|---------------|
| **ARES** (Ministerstvo financí) | REST API | registrace firem, IČO, DIČ, adresy |
| **Obchodní rejstřík** (Justice.cz) | extrakce z webu + API | statutární orgány, společníci, listiny |
| **Insolvenční rejstřík** (ISIR) | REST API | insolvenční řízení, přihlášky pohledávek |
| **Živnostenský rejstřík** | extrakce z webu | živnostenská oprávnění, odpovědní zástupci |
| **Katastr nemovitostí** (ČÚZK) | REST API | vlastnictví nemovitostí, věcná břemena, zástavy |
| **Soudní rozhodnutí** | extrakce z webu | rozsudky, řízení, exekuční příkazy |

```elixir
defmodule PrismaticOSINT.Adapters.ARES do
  @moduledoc """
  ARES (Administrative Register of Economic Subjects) adapter.
  Queries Czech Ministry of Finance for company registration data.
  """

  @behaviour PrismaticOSINT.Adapter

  @ares_api "https://ares.gov.cz/ekonomicke-subjekty-v-be/rest"

  @impl PrismaticOSINT.Adapter
  def name, do: "ares_czech"

  @impl PrismaticOSINT.Adapter
  def collect(%{organization: org_name}) when is_binary(org_name) do
    with {:ok, response} <- search_by_name(org_name),
         {:ok, entities} <- parse_response(response) do
      {:ok, Enum.map(entities, &normalize_entity/1)}
    end
  end

  def collect(%{identifiers: %{ico: ico}}) when is_binary(ico) do
    with {:ok, response} <- lookup_by_ico(ico),
         {:ok, entity} <- parse_single_response(response) do
      {:ok, [normalize_entity(entity)]}
    end
  end

  defp search_by_name(name) do
    url = "#{@ares_api}/ekonomicke-subjekty/vyhledat"
    params = %{obchodniJmeno: name, start: 0, pocet: 20}
    HTTPClient.get(url, [], params: params)
  end

  defp normalize_entity(raw) do
    %{
      name: raw["obchodniJmeno"],
      ico: raw["ico"],
      dic: raw["dic"],
      address: format_address(raw["sidlo"]),
      legal_form: raw["pravniForma"],
      registration_date: raw["datumVzniku"],
      source: "ares_czech",
      retrieved_at: DateTime.utc_now()
    }
  end
end
```

## Soulad OSINT s NABLA

Všechna zjištění OSINT v Prismatic Platform musí odpovídat epistemickým axiomům [NABLA
Infinity](@/glossary/nabla-infinity.md) (podrobně [Axiomy NABLA](@/glossary/nabla-axioms.md)):

| Axiom | Uplatnění v OSINT | Vynucení |
|-------|-------------------|-------------|
| **Pluralita signálů** | pro každé tvrzení nejméně 2 nezávislé zdroje | TVRDÉ – zjištění z jediného zdroje označena „neověřeno“ |
| **[Zachování rozporu](https://prismatic-reality-com.github.io/prismatic-promo/glossary/contradiction-preservation/)** | protichůdné záznamy se zachovají, neřeší se | TVRDÉ – obě verze uloženy s proveniencí |
| **[Povinná provenience](https://prismatic-reality-com.github.io/prismatic-promo/glossary/provenance-mandatory/)** | každé zjištění jde dohledat ke zdroji | TVRDÉ – zaznamená se URL zdroje, časové razítko a metoda |
| **Časový rozpad** | zjištění nesou razítka aktuálnosti | TVRDÉ – zastaralá zjištění se automaticky oslabí |
| **Nezávislost zdrojů** | křížové ověření napříč nezávislými poskytovateli | MĚKKÉ – nezávislé potvrzení má vyšší váhu |

## Architektura a implementace

### Zpravodajská pipeline

Zpravodajská pipeline OSINT sleduje standardní zpravodajský cyklus s automatizací specifickou pro
Prismatic:

```
Planning           Collection          Processing         Analysis           Dissemination
+-----------+     +-----------+       +-----------+      +-----------+      +-----------+
| Define    |---->| Multi-    |------>| Normalize |----->| Entity    |----->| Reports   |
| collection|     | adapter   |       | deduplicate      | resolution|      | alerts    |
| requirements    | parallel  |       | validate  |      | correlation      | feeds     |
|           |     | collection|       |           |      | assessment|      |           |
+-----------+     +-----------+       +-----------+      +-----------+      +-----------+
```

### Omezení rychlosti a etický sběr

Sběr OSINT respektuje limity zdrojů a etické meze:

```elixir
defmodule PrismaticOSINT.RateLimiter do
  @moduledoc """
  Token bucket rate limiter for OSINT collection adapters.
  Ensures compliance with API terms of service and ethical collection limits.
  """
  use GenServer

  @type config :: %{
    requests_per_second: float(),
    requests_per_minute: non_neg_integer(),
    burst_limit: non_neg_integer()
  }

  @default_config %{
    requests_per_second: 5.0,
    requests_per_minute: 100,
    burst_limit: 10
  }

  def start_link(adapter, config \\ @default_config) do
    GenServer.start_link(__MODULE__, {adapter, config}, name: via(adapter))
  end

  @spec acquire(atom()) :: :ok | {:error, :rate_limited}
  def acquire(adapter) do
    GenServer.call(via(adapter), :acquire)
  end

  @impl GenServer
  def handle_call(:acquire, _from, state) do
    now = System.monotonic_time(:millisecond)

    if tokens_available?(state, now) do
      {:reply, :ok, consume_token(state, now)}
    else
      {:reply, {:error, :rate_limited}, state}
    end
  end
end
```

## Uživatelské rozhraní OSINT Toolbox

Prismatic Platform v době zápisu zpřístupňovala 120 nástrojů OSINT přes rozhraní
[LiveView](https://prismatic-reality-com.github.io/prismatic-promo/glossary/phoenix-liveview/) na
adrese `/osint/toolbox`, uspořádaných do 7 kategorií:

| Kategorie | Nástroje | Klíčové zdroje |
|----------|-------|-------------|
| **Česko** | 28 adaptérů | ARES, Justice, ISIR, obchodní rejstřík, živnostenský rejstřík |
| **Globální** | 84 adaptérů | Shodan, VirusTotal, Censys, Hunter.io, SecurityTrails |
| **Sankce** | 3 | sankce EU, OFAC SDN, konsolidovaný seznam OSN |
| **EU** | 1 | European Business Register |
| **Spojené království** | 1 | Companies House |
| **USA** | 1 | SEC EDGAR |
| **Univerzální** | 2 | EmailIntelligence, EmailIntelligenceRateLimited |

Každý nástroj nabízí v přehledu LiveView jednotné rozhraní: vstupní parametry, řízení běhu,
zobrazení výsledků a možnosti exportu. Rozhraní je napojeno na infrastrukturu
[telemetrie](https://prismatic-reality-com.github.io/prismatic-promo/glossary/telemetry/) platformy
kvůli sledování výkonu a viditelnosti limitů.

## Užití v Prismatic Platform

Prismatic Platform má hluboké kořeny v OSINT, sahající ke znalostní bázi GARDEN a jejímu repozitáři
`sig` s více než 250 poskytovateli OSINT nashromážděnými za více než dvacet let zpravodajské práce.

### Schopnosti OSINT v platformě

| Schopnost | Aplikace | Integrace |
|-----------|-------------|-------------|
| **Objevování útočné plochy** | `prismatic_perimeter` | DNS, certifikáty, služby, cloudové zdroje (viz [EASM](@/glossary/easm.md)) |
| **Zpravodajství o návštěvnících** | `prismatic_hawkeye` | geolokace IP, mapování organizací, korelace hrozeb (viz [HAWKEYE](@/glossary/hawkeye.md)) |
| **Sankční prověrka** | `prismatic_osint` | sankční seznamy EU/USA/OSN, databáze PEP (viz [Sanctions Screening](@/glossary/sanctions-screening.md)) |
| **Obchodní zpravodajství** | `prismatic_osint` | české rejstříky, ARES, obchodní rejstřík |
| **[Zpravodajství o hrozbách](https://prismatic-reality-com.github.io/prismatic-promo/glossary/threat-intelligence/)** | `prismatic_osint` | feedy IOC, databáze malwaru, korelace zranitelností |

### Dědictví OSINT z GARDEN

Znalostní báze GARDEN přispívá více než 250 integracemi poskytovatelů OSINT z původního repozitáře
`sig`, uspořádanými podle oblastí (počty v době zápisu):

| Oblast | Poskytovatelé | Klíčové zdroje |
|--------|----------|-------------|
| **Domény/DNS** | 45+ | PassiveDNS, SecurityTrails, VirusTotal, Shodan |
| **E-mail** | 30+ | Hunter.io, Have I Been Pwned, EmailRep |
| **Sociální sítě** | 25+ | platformy sociálních sítí, výčet uživatelských jmen |
| **Firmy** | 40+ | OpenCorporates, firemní rejstříky, SEC/EDGAR |
| **Hrozby** | 35+ | AlienVault OTX, abuse.ch, Maltiverse |
| **Geoprostor** | 20+ | MaxMind, IP2Location, Google Maps |
| **Certifikáty** | 15+ | crt.sh, Censys, SSL Labs |
| **Infrastruktura** | 40+ | Shodan, Censys, ZoomEye, BinaryEdge |

## Srovnání s jinými zpravodajskými disciplínami

| Disciplína | Zdroje | Právní omezení | Potenciál automatizace | Pokrytí v Prismatic |
|------------|---------|-------------------|---------------------|-------------------|
| **OSINT** | veřejná data | malá (podmínky užití, soukromí) | vysoký | úplné (120 nástrojů) |
| **SIGINT** | komunikace | přísná (soudní povolení) | střední | netýká se |
| **HUMINT** | lidské kontakty | přísná (právní a etická) | nízký | netýká se |
| **GEOINT** | snímky/geoprostorová data | střední | vysoký | částečné (geolokace IP) |
| **MASINT** | měření/signatury | přísná | vysoký | netýká se |
| **CYBINT** | kybernetické operace | střední | vysoký | částečné (zpravodajství o hrozbách) |

## Osvědčené postupy

**Ověřovat ve více nezávislých zdrojích.** U kritických poznatků se nikdy nespoléhat na jediný zdroj
OSINT. Zjištění křížově ověřit nejméně ve dvou nezávislých zdrojích ([Signal
Plurality](@/glossary/signal-plurality.md)). Záznam o registraci domény potvrzený logy Certificate
Transparency a záznamy DNS dává mnohem vyšší důvěru než kterýkoli zdroj sám.

**Pečlivě sledovat provenienci.** Každé zjištění musí obsahovat URL zdroje, časové razítko získání
a metodu sběru. [Provenience](https://prismatic-reality-com.github.io/prismatic-promo/glossary/provenance-mandatory/)
umožňuje ověření, posouzení aktuálnosti a právní obhajitelnost. Bez provenience se zpravodajský
poznatek neliší od fámy.

**Respektovat limity a podmínky užití.** Agresivní extrakce nebo zneužívání API poškozují komunitu
OSINT, protože vedou poskytovatele k omezení přístupu. Zavést řádné omezení rychlosti, respektovat
robots.txt a dodržovat podmínky užití API. Udržitelný sběr zajišťuje dlouhodobý přístup.

**Uplatňovat časový rozpad na zjištění.** Data OSINT mají trvanlivost. Záznamy DNS se mění,
certifikáty vyprší, firmy se slučují a lidé se stěhují. Zavést automatické sledování aktuálnosti
a plány nového sběru, aby zastaralé poznatky nekontaminovaly analýzu.

**Zachovávat protichůdné informace.** Když se zdroje neshodnou, zachovat obě verze s jejich
proveniencí, místo aby se vybrala jedna. Rozpory jsou informativní – mohou ukazovat na rozdíly
v aktuálnosti dat, záměrný klam nebo legitimní nejednoznačnost.

**Zvažovat přiměřenost u osob.** Sběr informací o fyzických osobách má mít zákonný důvod
a odpovídat účelu (zásada minimalizace podle GDPR). Kompendium zdůrazňuje, že ani veřejně dostupná
data nesmějí sloužit k sestavení profilu, který by umožnil pronásledování nebo nátlak.

## Časté chyby

**Konfirmační bias při sběru.** Pokušení hledat jen informace podporující hypotézu je silné. Plán
sběru má zahrnovat zdroje, které by hypotézu mohly vyvrátit (srov. [konfirmační
bias](@/glossary/konfirmacni-bias.md) a [EA × Due Diligence: Confirmation
Bias](@/kompendium/cross-domain/9-ea-dd-investigation-bias.md)). Axiom plurality signálů v NABLA
vyžaduje aktivně hledat protichůdné důkazy.

**Zaměňovat objem dat s kvalitou poznatků.** Shromáždění více dat automaticky nevede k lepším
poznatkům. Hodnota vzniká ve fázi analýzy, kde se surová data vykládají, korelují a posuzují.
Investice do sběru bez odpovídající investice do analýzy vytváří datové bažiny.

**Přehlížet právní a etické meze.** OSINT používá veřejné zdroje, ale „veřejné“ má právní nuance.
Extrakce dat za přihlašovací bránou, přístup k uloženým osobním údajům po žádosti o výmaz nebo sběr
dat v jurisdikcích s přísnými zákony o ochraně soukromí mohou vytvořit právní riziko. Je třeba znát
právní rámec každého zdroje.

**Jednojazyčné zkreslení.** Analýza OSINT, která pracuje jen v angličtině, mine poznatky dostupné
v jiných jazycích. Pro české obchodní zpravodajství jsou nejautoritativnější zdroje česky. Je třeba
zavést vícejazyčný sběr a analýzu.

**Chápat automatizovaný sběr jako konečný.** Automatizované nástroje OSINT výborně shromažďují data,
ale špatně vykládají kontext. Automatizovaná zjištění je třeba brát jako surový vstup vyžadující
přezkum analytikem, ne jako hotový zpravodajský produkt.

## Související

**Pojmy v tomto glosáři**

- [Intelligence Fusion](@/glossary/intelligence-fusion.md) – metodika korelace dat OSINT z více
  zdrojů.
- [EASM](@/glossary/easm.md) – správa vnější útočné plochy postavená na OSINT.
- [Entity Resolution](@/glossary/entity-resolution.md) – neostré porovnávání napříč variantami
  zdrojů.
- [Sanctions Screening](@/glossary/sanctions-screening.md) – regulatorní soulad s využitím zdrojů
  OSINT.
- [Shodan](@/glossary/shodan.md), [Censys](@/glossary/censys.md) – skenery internetové
  infrastruktury.
- [Doxing](@/glossary/doxing.md) – zneužití postupů OSINT proti osobám.

**Hesla a přehledy platformy mimo tuto knihu**

- [Threat Intelligence](https://prismatic-reality-com.github.io/prismatic-promo/glossary/threat-intelligence/),
  [GARDEN](https://prismatic-reality-com.github.io/prismatic-promo/glossary/garden/),
  [Prismatic Perimeter](https://prismatic-reality-com.github.io/prismatic-promo/glossary/prismatic-perimeter/),
  [DNS Enumeration](https://prismatic-reality-com.github.io/prismatic-promo/glossary/dns-enumeration/),
  [Vulnerability Assessment](https://prismatic-reality-com.github.io/prismatic-promo/glossary/vulnerability-assessment/).
- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/),
  [Agenti](https://prismatic-reality-com.github.io/prismatic-promo/agents/),
  [Technologie](https://prismatic-reality-com.github.io/prismatic-promo/technologies/),
  [Aplikace](https://prismatic-reality-com.github.io/prismatic-promo/apps/).

**Kniha**

- [OSINT Agent a detekce EA](@/kompendium/aiad-integration/osint-ea-source-validation.md) – ověřování
  zdrojů pod epistemickým útokem.
- [EA × OSINT: triangulace napříč zdroji](@/kompendium/cross-domain/8-ea-osint-cross-source-triangulation.md) –
  pluralita v investigativní praxi.
- [EA × OSINT: ARES Validation](@/kompendium/cross-domain/2-ea-osint-czech-ares-validation.md) –
  české rejstříky z pohledu EA.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)
