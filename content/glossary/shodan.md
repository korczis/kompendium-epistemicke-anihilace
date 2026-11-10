+++
title = "Shodan"
weight = 9
description = "Vyhledávač zařízení připojených k internetu, který mapuje otevřené porty, služby a zranitelnosti; v Prismatic Platform hlavní zdroj dat pro správu vnější útočné plochy."

[taxonomies]
tags = ["glossary", "osint", "security", "prismatic", "intelligence"]

[extra]
category = "security"
related_terms = ["easm", "censys", "greynoise", "attack-surface", "signal-plurality", "risk-score", "tls", "rate-limiting"]
platform_relevance = "critical"
complexity = "intermediate"
domain = "osint"
layer = "intelligence-collection"
paradigm = "passive-reconnaissance"
creator = "John Matherly"
founded = "2009"
prismatic_usage = "easm-primary-discovery-source"
quality_impact = "high"
safety_level = "authorized-only"
documentation_required = true
integration_pattern = "api-client"
api_type = "REST"
data_freshness = "continuous-scanning"
related_apps = ["prismatic_perimeter", "prismatic_osint_core", "prismatic_perimeter_core"]
compliance_relevance = ["nis2", "zkb"]
see_also = ["censys", "greynoise", "easm", "attack-surface", "risk-score", "signal-plurality"]
author = "Tomas Korcak (korczis)"
reading_time = "9 min"
word_count = 1772
date_created = "2026-02-23"
date_modified = "2026-11-10"
keywords = ["Shodan", "Internet-wide", "glossary", "security", "Prismatic Platform", "Filter", "String"]
quality_score = 90
image = "/images/sections/glossary.png"
image_alt = "Shodan – glosář"
+++

## Definice

Shodan je vyhledávač zařízení připojených k internetu, který průběžně skenuje celý adresní
prostor IPv4 (a stále více i IPv6) a katalogizuje otevřené porty, běžící služby, bannery
protokolů, certifikáty SSL/TLS a metadata zařízení. Vytvořil ho John Matherly v roce 2009.
Od tradičních vyhledávačů, jako je Google, se zásadně liší: neindexuje webový obsah doručovaný
přes HTTP, ale infrastrukturní vrstvu internetu – servery, zařízení IoT, průmyslové řídicí
systémy (ICS/SCADA), databáze, síťové prvky, kamery a jakékoli zařízení, které odpovídá na síťové
sondy.

Metodika skenování Shodanu spočívá v odesílání sestavených paketů na každou IP adresu na
určitých portech, sběru odpovědí (bannerů) a jejich indexaci v prohledávatelné databázi. Banner
je úvodní odpověď, kterou služba odešle při navázání spojení – obvykle prozradí název softwaru,
verzi, podrobnosti konfigurace a někdy i operační systém. Tato data pasivního průzkumu jsou
neocenitelná pro bezpečnostní profesionály, kteří provádějí inventarizaci aktiv, posouzení
zranitelností a monitorování expozice, aniž by cílovou infrastrukturu sami aktivně sondovali.

Platforma se stala nepostradatelným nástrojem disciplíny správy vnější útočné plochy
([EASM](@/glossary/easm.md), *External Attack Surface Management*), v níž organizace potřebují
pochopit svou zvenčí viditelnou stopu z pohledu útočníka. Dotazy na aktiva spojená s cílovou
organizací umožňují bezpečnostním týmům objevit stínové IT, zapomenuté servery, chybně nastavené
služby a odhalené databáze, o nichž organizace nemusí vědět. V Prismatic Platform je Shodan
hlavním zdrojem dat pipeline objevování aktiv modulu Prismatic Perimeter (viz
[EASM](@/glossary/easm.md)), která zjištění předává enginu [bezpečnostního
hodnocení](https://prismatic-reality-com.github.io/prismatic-promo/glossary/security-rating/);
ten vytváří známky A–F bezpečnostního postavení organizace.

Pro Kompendium je Shodan pojmem z kontextu platformy (bezpečnost infrastruktury). S tématem
knihy souvisí nepřímo: stejná logika „co vidí útočník, musí vidět i obránce“ platí pro digitální
stopu ohrožených osob, kterou lze zneužít k pronásledování (viz [Doxing](@/glossary/doxing.md)).
Kniha se zabývá jen obranným užitím – vyhledávání informací o lidech bez jejich souhlasu
nepopisuje.

## Historický kontext a vývoj

Shodan začal jako osobní projekt Johna Matherlyho z doby jeho studií, inspirovaný myšlenkou
vytvořit vyhledávač zařízení připojených k internetu místo webových stránek. Název odkazuje na
umělou inteligenci SHODAN, záporáka herní série *System Shock*. Projekt, který vznikl ze
zvědavosti, se rychle stal jedním z nejdůležitějších nástrojů profesionálů v kybernetické
bezpečnosti.

V raném období skenování internetu dominovaly nástroje jako Nmap, které vyžadovaly aktivní,
cílené skenování konkrétních rozsahů IP. Inovací Shodanu bylo nepřetržité skenování celého
internetu s výsledky indexovanými v prohledávatelné databázi. Místo vlastního skenování (které
trvá, spotřebovává šířku pásma a může spustit systémy detekce průniku) se lze dotázat na předem
shromážděná data Shodanu a okamžitě zjistit, co je na libovolné IP adrese nebo u organizace
vystaveno.

Postupně se Shodan rozšířil od základního skenování portů a sběru bannerů o analýzu certifikátů
SSL/TLS, značkování zranitelností (párování verzí softwaru se známými CVE), snímky obrazovky
(vizuální zachycení webových rozhraní, relací RDP a ploch VNC) a specializovanou podporu protokolů
průmyslových řídicích systémů (Modbus, DNP3, EtherNet/IP), protokolů IoT (MQTT, CoAP)
a databázových protokolů (MongoDB, Elasticsearch, Redis). Produkt Shodan Monitor poskytuje
nepřetržité monitorování zadaných rozsahů IP a upozorňuje organizace, když se na jejich aktivech
objeví nové služby nebo změní konfigurace.

Etické hodnocení Shodanu se vyvíjelo spolu s nástrojem. Raní kritici ho považovali za nástroj
hackerů, který triviálně usnadňuje hledání zranitelných systémů. Bezpečnostní komunita dnes
Shodan obecně uznává jako obranný nástroj: najde-li Shodan vaši odhalenou databázi, najde ji
i útočník. Rozdíl je v tom, že Shodan umožňuje obráncům expozice najít a opravit dřív, než je
útočníci zneužijí. Tento pohled odpovídá filosofii Prismatic Platform používat schopnosti
[OSINT](@/glossary/osint.md) pro autorizované obranné bezpečnostní operace.

## Schopnosti skenování

Skenovací infrastruktura Shodanu pokrývá široké spektrum protokolů a služeb a dává hluboký
vhled do infrastruktury vystavené do internetu.

| Schopnost | Popis | Příklady zjištění |
|-----------|-------------|-----------------|
| **Skenování portů** | zjišťuje otevřené porty TCP/UDP v celém IPv4 | SSH na nestandardních portech, odhalené databáze |
| **Sběr bannerů** | zachycuje identifikační odpovědi služeb | verze softwaru, podrobnosti konfigurace |
| **Analýza SSL/TLS** | zkoumá řetězce certifikátů a sady šifer | prošlé certifikáty, slabé protokoly, certifikáty podepsané samy sebou |
| **Obsah HTTP** | zachycuje hlavičky HTTP a titulky stránek | administrační panely, stránky s výchozími přihlašovacími údaji |
| **Specifické protokoly** | hloubková kontrola běžných protokolů | Modbus (ICS), MQTT (IoT), RTSP (kamery) |
| **Značkování zranitelností** | určuje známé CVE z dat bannerů | verze softwaru spárované s CVE |
| **Mapování organizací** | přiřazuje IP organizacím přes WHOIS/BGP | atribuce podle čísla autonomního systému (ASN) |
| **Geolokace** | mapuje IP adresy na fyzická místa | země, město, poskytovatel, souřadnice |
| **Snímky obrazovky** | vizuální zachycení vystavených rozhraní | webové dashboardy, relace RDP, plochy VNC |
| **Průmyslové protokoly** | skenování Modbus, DNP3, EtherNet/IP, BACnet | řídicí jednotky SCADA, PLC, automatizace budov |

### Běžné vyhledávací filtry Shodanu

| Filtr | Účel | Příklad dotazu |
|--------|---------|---------------|
| `hostname:` | hledání podle názvu hostitele/domény | `hostname:example.com` |
| `org:` | hledání podle názvu organizace | `org:"Acme Corporation"` |
| `port:` | filtr podle otevřeného portu | `port:3389` (RDP) |
| `product:` | filtr podle softwarového produktu | `product:Apache` |
| `version:` | filtr podle verze softwaru | `version:2.4.49` (známá zranitelnost) |
| `country:` | filtr podle kódu země | `country:CZ` |
| `city:` | filtr podle města | `city:Prague` |
| `net:` | filtr podle rozsahu CIDR | `net:192.168.0.0/16` |
| `ssl:` | filtr podle pole certifikátu SSL | `ssl.cert.subject.cn:example.com` |
| `vuln:` | filtr podle identifikátoru CVE | `vuln:CVE-2021-44228` (Log4Shell) |
| `has_screenshot:true` | jen výsledky se snímky | vizuální objevování vystavených služeb |
| `asn:` | filtr podle čísla autonomního systému | `asn:AS13335` (Cloudflare) |

### Pokročilé skládání dotazů

Shodan podporuje booleovské operátory a vnořené dotazy pro přesné vyhledávání. Pro automatizovaný
výčet aktiv v Prismatic Platform je to zásadní: dotazy musí být dost specifické, aby se vyhnuly
falešně pozitivním výsledkům, a zároveň dost úplné, aby odhalily stínové IT.

```
# Find Apache servers in Czech Republic with known vulnerabilities
product:Apache country:CZ vuln:CVE-2021-41773

# Find exposed MongoDB instances (no authentication)
product:MongoDB port:27017 "MongoDB Server Information"

# Find Elasticsearch clusters with publicly readable indices
product:Elasticsearch port:9200 "cluster_name"

# Find exposed industrial control systems
tag:ics country:CZ
```

## Napojení přes API

Shodan poskytuje REST API pro programový přístup, které umožňuje automatizované objevování aktiv
a monitorovací postupy.

```elixir
defmodule PrismaticPerimeter.Sources.Shodan do
  @moduledoc """
  Shodan API integration for external attack surface discovery.
  Implements rate-limited, resilient querying with circuit breaker
  protection and result caching for the EASM pipeline.
  """

  @base_url "https://api.shodan.io"

  @type search_result :: %{
    ip: String.t(),
    port: pos_integer(),
    protocol: String.t(),
    banner: String.t(),
    product: String.t() | nil,
    version: String.t() | nil,
    vulns: [String.t()],
    ssl: map() | nil,
    location: map(),
    timestamp: DateTime.t()
  }

  @doc "Search Shodan for hosts matching a query"
  @spec search(String.t(), keyword()) :: {:ok, [search_result()]} | {:error, term()}
  def search(query, opts \\ []) do
    params = %{
      key: api_key(),
      query: query,
      page: Keyword.get(opts, :page, 1),
      minify: Keyword.get(opts, :minify, false)
    }

    case HTTPClient.get("#{@base_url}/shodan/host/search", params: params) do
      {:ok, %{status: 200, body: body}} ->
        {:ok, parse_results(body["matches"])}

      {:ok, %{status: 429}} ->
        {:error, :rate_limited}

      {:ok, %{status: status, body: body}} ->
        {:error, {:api_error, status, body["error"]}}

      {:error, reason} ->
        {:error, {:connection_error, reason}}
    end
  end

  @doc "Get all information about a specific host"
  @spec host_info(String.t()) :: {:ok, map()} | {:error, term()}
  def host_info(ip) do
    case HTTPClient.get("#{@base_url}/shodan/host/#{ip}", params: %{key: api_key()}) do
      {:ok, %{status: 200, body: body}} -> {:ok, body}
      {:ok, %{status: 404}} -> {:error, :not_found}
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Search for hosts associated with a domain"
  @spec domain_search(String.t()) :: {:ok, [search_result()]} | {:error, term()}
  def domain_search(domain) do
    search("hostname:#{domain}")
  end

  @doc "Get DNS information for a domain including subdomains"
  @spec dns_resolve(String.t()) :: {:ok, map()} | {:error, term()}
  def dns_resolve(domain) do
    case HTTPClient.get("#{@base_url}/dns/domain/#{domain}", params: %{key: api_key()}) do
      {:ok, %{status: 200, body: body}} -> {:ok, body}
      {:error, reason} -> {:error, reason}
    end
  end

  defp api_key, do: Application.get_env(:prismatic_perimeter, :shodan_api_key)

  defp parse_results(nil), do: []
  defp parse_results(matches) when is_list(matches) do
    Enum.map(matches, fn match ->
      %{
        ip: match["ip_str"],
        port: match["port"],
        protocol: match["transport"],
        banner: match["data"],
        product: match["product"],
        version: match["version"],
        vulns: Map.get(match, "vulns", []) |> Map.keys(),
        ssl: match["ssl"],
        location: match["location"],
        timestamp: parse_timestamp(match["timestamp"])
      }
    end)
  end
end
```

## Datový model

Datový model Shodanu zachycuje bohaté informace o každém objeveném hostiteli a službě.

| Pole | Typ | Popis |
|-------|------|-------------|
| `ip_str` | String | adresa IPv4 nebo IPv6 |
| `port` | Integer | číslo otevřeného portu |
| `transport` | String | `tcp` nebo `udp` |
| `data` | String | surový text banneru |
| `product` | String | identifikovaný softwarový produkt |
| `version` | String | verze softwaru |
| `os` | String | zjištěný operační systém |
| `org` | String | organizace (z WHOIS/BGP) |
| `asn` | String | číslo autonomního systému |
| `isp` | String | poskytovatel internetu |
| `ssl` | Object | podrobnosti certifikátu a konfigurace SSL/TLS |
| `vulns` | Object | známé identifikátory CVE odpovídající službě |
| `location` | Object | země, město, souřadnice, region |
| `timestamp` | DateTime | kdy byl sken proveden |
| `hostnames` | Array | názvy z reverzního DNS |
| `domains` | Array | přidružené doménové názvy |
| `tags` | Array | klasifikační štítky služby (např. `ics`, `cloud`) |
| `http` | Object | data specifická pro HTTP (hlavičky, titulek, otisk favicony) |

## Kontext v Prismatic Platform

Prismatic Platform zapojuje Shodan jako hlavní zdroj dat pipeline objevování aktiv [EASM](@/glossary/easm.md)
v modulu Perimeter. Při správě vnější útočné plochy platforma dotazuje API Shodanu na vystavené
služby, otevřené porty a data bannerů spojená s cílovými doménami a rozsahy IP. Integrace probíhá
v několika krocích.

### Pipeline objevování

1. **Objevení**: dotázat Shodan na všechny hostitele odpovídající cílovým doménám, rozsahům IP
   a názvům organizací.
2. **Obohacení**: z dat bannerů vytěžit verze softwaru, konfigurace TLS a značky zranitelností.
3. **Korelace**: porovnat zjištění Shodanu s daty [Censys](@/glossary/censys.md)
   a [GreyNoise](@/glossary/greynoise.md).
4. **Skórování**: předat ověřená zjištění enginu [rizikového skórování](@/glossary/risk-score.md).
5. **Hodnocení**: agregovat oskórovaná zjištění do [bezpečnostního
   hodnocení](https://prismatic-reality-com.github.io/prismatic-promo/glossary/security-rating/)
   organizace.

Zjištění Shodanu vstupují do epistemické pipeline platformy, v níž axiom [Signal
Plurality](@/glossary/signal-plurality.md) vyžaduje potvrzení nejméně z jednoho dalšího
nezávislého zdroje, než zjištění smí ovlivnit bezpečnostní hodnocení. Služba zjištěná jen
Shodanem se označí jako „nepotvrzená“, dokud Censys nebo jiný zdroj nedodá potvrzující důkaz.

```elixir
defmodule PrismaticPerimeter.Discovery.Pipeline do
  @moduledoc """
  Multi-source discovery pipeline for EASM asset enumeration.
  Enforces signal plurality by requiring findings from at least
  two independent sources before affecting security ratings.
  """

  @doc "Execute multi-source discovery for a target domain"
  @spec discover(String.t()) :: {:ok, list(map())} | {:error, term()}
  def discover(domain) do
    # Parallel queries to independent sources (Signal Plurality)
    tasks = [
      Task.async(fn -> PrismaticPerimeter.Sources.Shodan.domain_search(domain) end),
      Task.async(fn -> PrismaticPerimeter.Sources.Censys.domain_search(domain) end),
      Task.async(fn -> PrismaticPerimeter.Sources.GreyNoise.context_lookup(domain) end)
    ]

    [shodan_result, censys_result, greynoise_result] =
      Task.await_many(tasks, 30_000)

    # Correlate findings across sources
    correlated = correlate_findings(shodan_result, censys_result, greynoise_result)

    # Score only findings with multi-source confirmation
    scored = Enum.map(correlated, &score_finding/1)

    {:ok, scored}
  end

  defp correlate_findings({:ok, shodan}, {:ok, censys}, {:ok, greynoise}) do
    shodan_ips = MapSet.new(shodan, & &1.ip)
    censys_ips = MapSet.new(censys, & &1.ip)

    # Findings confirmed by multiple sources
    confirmed = MapSet.intersection(shodan_ips, censys_ips)

    Enum.map(shodan, fn finding ->
      confidence = if MapSet.member?(confirmed, finding.ip), do: :confirmed, else: :unconfirmed
      noise_context = Enum.find(greynoise, &(&1.ip == finding.ip))

      Map.merge(finding, %{
        confirmation_status: confidence,
        noise_classification: noise_context && noise_context.classification,
        source_count: count_sources(finding.ip, shodan_ips, censys_ips)
      })
    end)
  end
end
```

### Omezení rychlosti a jistič

Prismatic Platform implementuje pro volání API Shodanu propracované omezení rychlosti, které
kombinuje algoritmus token bucket se vzorem [jističe](https://prismatic-reality-com.github.io/prismatic-promo/glossary/circuit-breaker/)
(*circuit breaker*) pro elegantní zvládání selhání API.

```elixir
defmodule PrismaticPerimeter.Sources.Shodan.RateLimiter do
  @moduledoc """
  Token bucket rate limiter calibrated to the organization's Shodan
  API tier. Prevents credit exhaustion and respects provider quotas.
  """

  use GenServer

  @spec acquire_token() :: :ok | {:error, :rate_limited}
  def acquire_token do
    GenServer.call(__MODULE__, :acquire)
  end

  @impl true
  def handle_call(:acquire, _from, %{tokens: 0} = state) do
    {:reply, {:error, :rate_limited}, state}
  end

  def handle_call(:acquire, _from, %{tokens: tokens} = state) when tokens > 0 do
    {:reply, :ok, %{state | tokens: tokens - 1}}
  end

  @impl true
  def handle_info(:refill, state) do
    new_tokens = min(state.tokens + state.refill_rate, state.max_tokens)
    Process.send_after(self(), :refill, state.refill_interval)
    {:noreply, %{state | tokens: new_tokens}}
  end
end
```

## Úrovně API a limity

Shodan nabízí několik úrovní přístupu k API s různými schopnostmi a limity. Údaje odpovídají
dokumentaci platformy v době zápisu; aktuální nabídku je třeba ověřit u poskytovatele.

| Úroveň | Měsíční kredity | Skenovací kredity | Výsledky/dotaz | Funkce |
|------|----------------|-------------|---------------|----------|
| **Free** | 0 | 0 | 0 (jen vyhledávání) | základní vyhledávání, bez API |
| **Membership** | 100 | 100 | 100 | přístup k API, základní filtry |
| **Small Business** | 65 536 | 65 536 | neomezeně | monitorování sítě, výstrahy |
| **Corporate** | 327 680 | 327 680 | neomezeně | detekce zranitelností, úplné API |
| **Enterprise** | individuálně | individuálně | neomezeně | vyhrazené skenování, SLA |

Konfigurace omezovače rychlosti v Prismatic Platform se automaticky přizpůsobí úrovni Shodanu
dané organizace a zajistí optimální využití API bez vyčerpání kreditů.

## Etické a právní ohledy

| Ohled | Popis | Přístup Prismatic |
|--------------|-------------|-------------------|
| **Oprávnění** | skenování cizí infrastruktury může mít právní důsledky | dotazy jen na autorizované cíle |
| **Citlivost dat** | výsledky Shodanu mohou odhalit citlivé podrobnosti infrastruktury | [šifrování v klidu](https://prismatic-reality-com.github.io/prismatic-promo/glossary/encryption-at-rest/) všech uložených výsledků |
| **Odpovědné zveřejnění** | zjištěné zranitelnosti se mají nahlásit | integrovaný postup oznamování zjištění |
| **Podmínky užití** | podmínky Shodanu omezují některé vzorce automatizovaného užití | omezení rychlosti a dotazy v souladu s podmínkami |
| **Uchovávání dat** | historická data mohou obsahovat zastaralá zjištění | skórování s [časovým rozpadem](https://prismatic-reality-com.github.io/prismatic-promo/glossary/time-decay/) podle razítek |
| **Soulad s GDPR** | IP adresy mohou být podle GDPR osobními údaji | zacházení s daty a jejich uchovávání v souladu s [GDPR](https://prismatic-reality-com.github.io/prismatic-promo/glossary/gdpr/) |

Prismatic Platform před provedením jakéhokoli dotazu na Shodan vynucuje přísné kontroly
oprávnění. Bezpečnostní architektura barevných týmů platformy, zejména agenti obranného postavení
[Blue Teamu](@/glossary/blue-team.md), průběžně hlídá, aby sběr OSINT probíhal v autorizovaných
mezích. Každý dotaz mířící na infrastrukturu mimo autorizovaný rozsah spustí okamžitou výstrahu
a jeho provedení se zablokuje.

## Srovnání s alternativami

| Vlastnost | Shodan | [Censys](@/glossary/censys.md) | [GreyNoise](@/glossary/greynoise.md) | BinaryEdge | ZoomEye |
|---------|--------|--------|-----------|------------|---------|
| **Hlavní zaměření** | objevování služeb/zařízení | skenování certifikátů/hostitelů | klasifikace šumu | zpravodajství o hrozbách | mapování kyberprostoru |
| **Metodika skenování** | proprietární crawlery | založeno na ZMap | pasivní senzory | proprietární | proprietární |
| **Data certifikátů** | základní | hluboká (integrace CT) | minimální | střední | střední |
| **Historická data** | ano (placeně) | ano (placeně) | omezená | ano | ano |
| **Pokrytí ICS/SCADA** | rozsáhlé | střední | omezené | střední | dobré |
| **Ergonomie API** | dobrá | dobrá | výborná | dobrá | střední |
| **Role v Prismatic** | hlavní objevování | potvrzení certifikátů | filtrování šumu | nezapojeno | nezapojeno |
| **Podpora IPv6** | rostoucí | silná | omezená | rostoucí | rostoucí |
| **Snímky obrazovky** | ano | ano | ne | ne | ano |

## Monitorování a výstrahy

Shodan Monitor poskytuje nepřetržitý dohled nad zadanými síťovými rozsahy. Prismatic Platform
zapojuje výstrahy Shodan Monitor do pipeline nepřetržitého monitorování [EASM](@/glossary/easm.md)
a při zjištění změn na sledovaných aktivech spouští automatické nové posouzení.

| Typ výstrahy | Spouštěč | Reakce Prismatic |
|-----------|---------|-------------------|
| **Nová služba** | dříve neviděný port/služba | zařadit do pipeline objevování |
| **Vypršení SSL** | certifikát se blíží vypršení | vytvořit výstrahu souladu |
| **Zranitelnost** | nové CVE spárované se službou | spustit přepočet hodnocení |
| **Změna konfigurace** | zjištěna změna obsahu banneru | znovu obohatit a oskórovat |

## Osvědčené postupy

1. **Kombinovat s více zdroji**: pro bezpečnostní posouzení se nikdy nespoléhat jen na Shodan.
   Axiom [Signal Plurality](@/glossary/signal-plurality.md) vyžaduje potvrzení z nezávislých
   zdrojů, jako jsou Censys a GreyNoise.
2. **Zavést správné omezení rychlosti**: respektovat kvóty API Shodanu kvůli spolehlivému
   přístupu. Používat algoritmy token bucket kalibrované na úroveň předplatného.
3. **Agresivně cachovat výsledky**: data Shodanu se mění pomalu (mezi skeny uplynou hodiny až
   dny). Cache na 1–4 hodiny snižuje počet volání API bez výrazného dopadu na přesnost.
4. **Filtrovat šum pomocí GreyNoise**: porovnat zjištění Shodanu s [GreyNoise](@/glossary/greynoise.md)
   a odlišit skutečně vystavené služby od šumu na pozadí internetu.
5. **Monitorovat nepřetržitě**: ke zjišťování změn vnější útočné plochy používat Shodan Monitor
   nebo periodické dotazy, ne snímky k jednomu okamžiku.
6. **Respektovat právní meze**: dotazovat Shodan jen na infrastrukturu, k jejímuž posouzení máte
   oprávnění. Výsledky ukládat s přiměřenými kontrolami přístupu a pravidly uchovávání.

## Související

**Pojmy v tomto glosáři**

- [EASM](@/glossary/easm.md) – správa útočné plochy, pro niž je Shodan hlavním zdrojem.
- [Censys](@/glossary/censys.md) – doplňkový zdroj skenovacích dat pro potvrzení.
- [GreyNoise](@/glossary/greynoise.md) – analýza internetového šumu doplňující zjištění.
- [Signal Plurality](@/glossary/signal-plurality.md) – axiom vyžadující potvrzení dat Shodanu.
- [Risk Score](@/glossary/risk-score.md) – skórování, do něhož zjištění vstupují.
- [OSINT](@/glossary/osint.md) – širší disciplína zpravodajství z otevřených zdrojů.

**Hesla a přehledy platformy mimo tuto knihu**

- [Attack Surface](https://prismatic-reality-com.github.io/prismatic-promo/glossary/attack-surface/),
  [Security Rating](https://prismatic-reality-com.github.io/prismatic-promo/glossary/security-rating/),
  [Rate Limiting](https://prismatic-reality-com.github.io/prismatic-promo/glossary/rate-limiting/),
  [TLS](https://prismatic-reality-com.github.io/prismatic-promo/glossary/tls/),
  [Encryption at Rest](https://prismatic-reality-com.github.io/prismatic-promo/glossary/encryption-at-rest/),
  [Circuit Breaker](https://prismatic-reality-com.github.io/prismatic-promo/glossary/circuit-breaker/).
- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/),
  [Aplikace](https://prismatic-reality-com.github.io/prismatic-promo/apps/),
  [OSINT na webu platformy](https://prismatic-reality-com.github.io/prismatic-promo/osint/).

**Kniha**

- [Perimeter a detekce EA](@/kompendium/aiad-integration/perimeter-ea-attack-surface.md) –
  útočná plocha z pohledu epistemických útoků.
- [EA × Security: Threat Intel Source Validation](@/kompendium/cross-domain/24-ea-security-threat-intelligence-validation.md) –
  ověřování zdrojů zpravodajství o hrozbách.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)
