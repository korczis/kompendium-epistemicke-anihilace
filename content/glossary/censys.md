+++
title = "Censys"
weight = 9
description = "Platforma dat z celointernetových skenů, která mapuje hostitele, certifikáty a služby veřejného internetu; na Prismatic Platform nezávislý druhý zdroj vedle Shodanu."

[taxonomies]
tags = ["glossary", "security", "censys", "prismatic", "osint"]

[extra]
category = "security"
related_terms = ["shodan", "easm", "signal-plurality", "attack-surface", "greynoise", "tls", "risk-score"]
tier = "TIER 1"
domain = "Security Intelligence"
platform_integration = "Prismatic Perimeter"
maturity = "Production"
complexity = "Advanced"
audience = ["security-engineers", "threat-analysts", "osint-practitioners"]
key_benefits = ["certificate-transparency", "internet-wide-scanning", "tls-assessment", "subdomain-enumeration"]
prerequisites = ["attack-surface", "tls", "easm"]
api_version = "v2"
scan_engine = "ZMap + ZGrab2"
data_model = "Hosts, Services, Certificates"
founded = "2013"
origin = "University of Michigan"
authentication = "API ID + Secret (HTTP Basic)"
prismatic_module = "PrismaticPerimeter.Sources.Censys"
query_language = "Censys Search Language"
refresh_rate = "Regular full-internet scans"
author = "Tomas Korcak (korczis)"
quality_score = 90
date_modified = "2026-11-10"
+++

## Definice

**Censys** je platforma bezpečnostního zpravodajství, která provádí průběžné skenování celého
internetu a katalogizuje hostitele, služby, certifikáty a software veřejného internetu.
Vzešla z akademického výzkumu celointernetového síťového skenování na Michiganské
univerzitě (Zakir Durumeric, J. Alex Halderman a spolupracovníci): v roce 2013 tam vznikl
skener ZMap, který dokáže projít celý adresní prostor IPv4 za méně než 45 minut, a v roce
2015 byl představen vyhledávač Censys postavený na jeho datech. Akademický původ odlišuje
Censys od alternativ s primárně komerčním zaměřením a přináší do bezpečnostního zpravodajství
přísnou metodiku a reprodukovatelné postupy skenování.

Censys se odlišuje hlubokým zaměřením na transparentnost certifikátů TLS/SSL, strukturovaným
a silně typovaným datovým modelem a komplexním pokrytím ekosystému certifikátů X.509.
Zatímco [Shodan](@/glossary/shodan.md) vyniká v objevování služeb a zařízení sběrem bannerů,
Censys poskytuje lepší přehled o certifikátech – sleduje jejich vydávání, expiraci, platnost
řetězců a soulad s požadavky Certificate Transparency (CT). Díky tomuto doplňkovému zaměření
je Censys nezbytným potvrzujícím zdrojem pro bezpečnostní hodnocení postavená na více
signálech.

Platforma nabízí webové rozhraní pro interaktivní průzkum i REST API pro programovou
integraci. Data průběžně obnovuje pravidelnými skeny celého internetu a uchovává historický
záznam vývoje internetové infrastruktury. Tato longitudinální data umožňují analýzu trendů
– jak se útočná plocha organizace mění v týdnech, měsících a letech.

**Vztah ke knize:** Censys patří do kontextu platformy, z níž Kompendium vzešlo
(bezpečnostní modul Prismatic Perimeter, viz [EASM](@/glossary/easm.md)). Pro knihu je
poučný princip, jímž se jeho data na platformě používají: žádné tvrzení se neopírá o jediný
zdroj a nezávislé zdroje se navzájem potvrzují nebo vyvracejí (viz [Signal
Plurality](@/glossary/signal-plurality.md) a [Triangulace
zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md)). Ověřování zdrojů OSINT
s ohledem na manipulaci popisuje stránka [OSINT: validace
zdrojů](@/kompendium/aiad-integration/osint-ea-source-validation.md).

## Metodika skenování

Skenovací infrastruktura Censys stojí na nástrojích ZMap a ZGrab a sbírá data ve dvou fázích:

| Fáze | Nástroj | Účel | Výkon |
|-------|------|---------|-------------|
| **objevení hostitelů** | ZMap | SYN sken celého IPv4 na cílových portech | celé IPv4 za < 45 minut |
| **sondování služeb** | ZGrab2 | handshake na aplikační vrstvě a sběr dat | hloubková kontrola podle protokolu |
| **sběr certifikátů** | monitory logů CT | agregace logů Certificate Transparency | průběžně, téměř v reálném čase |
| **obohacení dat** | proces Censys | ASN, geolokace, WHOIS, reverzní DNS | automatické dodatečné zpracování |

Dvoufázový přístup nejprve rychlým skenováním TCP SYN (ZMap) najde živé hostitele a pak
podrobnými sondami na aplikační vrstvě (ZGrab2) sbírá bannery služeb, certifikáty TLS,
hlavičky HTTP a metadata specifická pro protokol. Oddělení fází umožňuje skenovat efektivně
bez ztráty hloubky.

```
ZMap (SYN scan)  -->  Responsive IPs  -->  ZGrab2 (service probes)
                                                  |
                                         +--------+--------+
                                         |        |        |
                                       HTTP     TLS    Protocol-
                                      Headers   Certs   Specific
                                                  |
                                         CT Log Integration
                                                  |
                                         Censys Search Index
```
### Architektura ZMap

ZMap dosahuje své rychlosti několika volbami návrhu, které se zásadně liší od tradičních
skenerů portů jako Nmap. Místo tabulky stavů otevřených spojení (která by v internetovém
měřítku spotřebovala gigabajty paměti) používá bezstavové skenování založené na cyklických
multiplikativních grupách. Každý sondovací paket nese svou identitu v polích IP ID
a sekvenčního čísla TCP, takže ZMap dokáže přiřadit odpovědi bez stavu pro každé spojení.
Díky tomuto matematickému přístupu je spotřeba paměti stálá bez ohledu na počet
skenovaných hostitelů.

Skenovací proces běží ve třech souběžných fázích: generování paketů, které prochází adresní
prostor v pseudonáhodném pořadí (aby byl provoz rovnoměrně rozložen mezi sítě), odesílání
surových paketů SYN rychlostí linky a sběr odpovědí SYN-ACK. Pseudonáhodné pořadí je
podstatné, aby se provoz nesoustředil na jedinou síť, což by spustilo omezení četnosti nebo
výstrahy systémů detekce průniku.

### Sondování služeb ZGrab2

ZGrab2 rozšiřuje objevování hostitelů o analýzu protokolů aplikační vrstvy. U každého
odpovídajícího hostitele zahájí úplný handshake protokolu a získá podrobné informace
o službě:

| Protokol | Sbíraná data | Bezpečnostní význam |
|----------|---------------|-------------------|
| **HTTPS** | verze TLS, šifrovací sady, řetězec certifikátů, hlavičky HTTP | síla šifrování, platnost certifikátů |
| **HTTP** | hlavičky odpovědi, serverový software, řetězce přesměrování | verze softwaru, chybná konfigurace |
| **SSH** | algoritmy výměny klíčů, otisk klíče hostitele | slabé algoritmy, opakované použití klíčů |
| **SMTP** | banner, podpora STARTTLS, metody autentizace | bezpečnostní stav e-mailu |
| **FTP** | banner, anonymní přístup, podpora TLS | vystavení citlivých souborů |
| **DNS** | rekurzivní překlad, přenos zóny, DNSSEC | posouzení infrastruktury DNS |
| **RDP** | vyjednání zabezpečení, podpora NLA | vystavení vzdáleného přístupu |

## Datový model

Censys poskytuje dobře strukturovaný datový model uspořádaný kolem tří hlavních entit:

| Entita | Popis | Klíčová pole |
|--------|-------------|------------|
| **Hosts** | jednotlivé IP adresy se všemi pozorovanými službami | IP, porty, služby, autonomous_system, poloha, operační systém |
| **Services** | instance služby na portu hostitele | port, transportní protokol, název služby, banner, software, tls |
| **Certificates** | certifikáty X.509 pozorované v provozu | otisk, subjekt, vydavatel, platnost, algoritmus klíče, logy CT |

### Struktura dat hostitele

```json
{
  "ip": "93.184.216.34",
  "services": [
    {
      "port": 443,
      "service_name": "HTTP",
      "transport_protocol": "TCP",
      "tls": {
        "version_selected": "TLSv1.3",
        "cipher_selected": "TLS_AES_256_GCM_SHA384",
        "certificates": {
          "leaf_fp_sha_256": "abc123...",
          "chain_fps_sha_256": ["def456...", "ghi789..."]
        }
      },
      "http": {
        "response": {
          "status_code": 200,
          "headers": {"server": "nginx/1.24.0"}
        }
      }
    }
  ],
  "autonomous_system": {
    "asn": 15133,
    "name": "EDGECAST",
    "bgp_prefix": "93.184.216.0/24"
  },
  "location": {
    "country_code": "US",
    "city": "Norwell"
  }
}
```
### Identifikace služeb

Censys používá propracovanou identifikaci služeb (*fingerprinting*), která přesahuje prosté
porovnání bannerů. Analyzuje více signálů: hlavičky HTTP (Server, X-Powered-By,
X-AspNet-Version), zvláštnosti implementace TLS (pořadí šifrovacích sad, podpora rozšíření),
chování specifické pro protokol (preference algoritmů výměny klíčů SSH) a otisky JARM
(aktivní identifikace serverů TLS). Přístup s více signály dosahuje vyšší přesnosti než
kterákoli jednotlivá metoda.

## Integrace Certificate Transparency

Censys má jednu z nejúplnějších datových sad Certificate Transparency a agreguje certifikáty
ze všech hlavních logů CT. Pro bezpečnostní sledování je to zásadní:

| Schopnost CT | Popis | Bezpečnostní hodnota |
|--------------|-------------|----------------|
| **soupis certifikátů** | všechny certifikáty vydané pro doménu | odhalení neoprávněného vydání certifikátu |
| **sledování předcertifikátů** | certifikáty zalogované před vydáním | včasné varování před podezřelými žádostmi |
| **analýza vydavatelů** | které certifikační autority vydávají pro doménu | odhalení kompromitace CA nebo porušení pravidel |
| **sledování expirace** | sledování platnosti certifikátů | prevence výpadků z prošlých certifikátů |
| **výčet SAN** | získání alternativních jmen subjektu | objevení subdomén a související infrastruktury |
| **historické certifikáty** | archiv prošlých a odvolaných certifikátů | šetření dřívějších konfigurací infrastruktury |

Data CT jsou zvlášť cenná pro [EASM](@/glossary/easm.md), protože odhalují infrastrukturu,
kterou samotné skenování portů nenajde. Certifikát vydaný pro `internal-staging.example.com`
prozradí existenci této subdomény, i když server právě není dostupný.

### Proces zpracování logů CT

Censys sleduje všechny hlavní logy Certificate Transparency téměř v reálném čase a denně
zpracuje miliony certifikátů. U každého certifikátu provádí několik kroků obohacení:
vytahuje všechna alternativní jména subjektu (SAN) a sestavuje úplné mapování domén na
certifikáty, ověřuje platnost řetězce průchodem k známým kořenovým certifikátům, odhaluje
wildcard certifikáty, které mohou pokrývat neobjevené subdomény, a hledá certifikáty
s neobvykle dlouhou platností, které mohou ukazovat na chybnou konfiguraci nebo porušení
pravidel.

## Integrace přes API

Censys poskytuje REST Search API (v2) pro programový přístup k datům:

```elixir
# Censys API client for Prismatic EASM
defmodule PrismaticPerimeter.Sources.Censys do
  @moduledoc "Censys Search API v2 integration for attack surface discovery."

  @base_url "https://search.censys.io/api/v2"

  @type host_result :: %{
    ip: String.t(),
    services: [service()],
    autonomous_system: map(),
    location: map(),
    last_updated: DateTime.t()
  }

  @doc "Search Censys hosts index"
  @spec search_hosts(String.t(), keyword()) :: {:ok, [host_result()]} | {:error, term()}
  def search_hosts(query, opts \\ []) do
    params = %{
      q: query,
      per_page: Keyword.get(opts, :per_page, 50),
      cursor: Keyword.get(opts, :cursor, nil)
    }

    case authenticated_request(:get, "/hosts/search", params) do
      {:ok, %{status: 200, body: body}} ->
        {:ok, parse_host_results(body["result"]["hits"])}

      {:ok, %{status: 429}} ->
        {:error, :rate_limited}

      {:ok, %{status: status, body: body}} ->
        {:error, {:api_error, status, body}}

      {:error, reason} ->
        {:error, {:connection_error, reason}}
    end
  end

  @doc "Search for certificates matching a domain"
  @spec search_certificates(String.t()) :: {:ok, [map()]} | {:error, term()}
  def search_certificates(domain) do
    query = "parsed.names: #{domain}"

    case authenticated_request(:get, "/certificates/search", %{q: query}) do
      {:ok, %{status: 200, body: body}} ->
        {:ok, body["result"]["hits"]}

      {:error, reason} ->
        {:error, reason}
    end
  end

  @doc "Search for hosts associated with a domain"
  @spec domain_search(String.t()) :: {:ok, [host_result()]} | {:error, term()}
  def domain_search(domain) do
    search_hosts("services.tls.certificates.leaf_data.names: #{domain}")
  end

  @doc "Aggregate host data by autonomous system for a given domain"
  @spec aggregate_by_asn(String.t()) :: {:ok, [map()]} | {:error, term()}
  def aggregate_by_asn(domain) do
    params = %{
      q: "services.tls.certificates.leaf_data.names: #{domain}",
      field: "autonomous_system.asn",
      num_buckets: 50
    }

    case authenticated_request(:get, "/hosts/aggregate", params) do
      {:ok, %{status: 200, body: body}} ->
        {:ok, body["result"]["buckets"]}

      {:ok, %{status: status, body: body}} ->
        {:error, {:api_error, status, body}}

      {:error, reason} ->
        {:error, {:connection_error, reason}}
    end
  end

  defp authenticated_request(method, path, params) do
    headers = [
      {"Authorization", "Basic #{Base.encode64("#{api_id()}:#{api_secret()}")}"},
      {"Accept", "application/json"}
    ]

    HTTPClient.request(method, "#{@base_url}#{path}", headers: headers, params: params)
  end

  defp api_id, do: Application.get_env(:prismatic_perimeter, :censys_api_id)
  defp api_secret, do: Application.get_env(:prismatic_perimeter, :censys_api_secret)
end
```
## Vyhledávací jazyk Censys

Censys nabízí strukturovaný dotazovací jazyk. Na rozdíl od jednoduché syntaxe filtrů
klíč:hodnota u Shodanu podporuje logické operátory, přístup k vnořeným polím, zástupné znaky
a rozsahy:

| Typ dotazu | Syntaxe | Příklad |
|-----------|--------|---------|
| **přesná shoda** | `field: "value"` | `services.http.response.headers.server: "nginx"` |
| **logické AND** | `field1: val1 AND field2: val2` | `location.country_code: "CZ" AND services.port: 443` |
| **logické OR** | `field1: val1 OR field2: val2` | `services.port: 80 OR services.port: 443` |
| **negace** | `NOT field: value` | `NOT services.tls.certificates.leaf_data.issuer.organization: "Let's Encrypt"` |
| **zástupný znak** | `field: value*` | `services.tls.certificates.leaf_data.names: *.example.com` |
| **rozsah** | `field: [min TO max]` | `services.port: [8000 TO 9000]` |
| **existence** | `field: *` | `services.ssh: *` (hostitelé se SSH) |

```elixir
defmodule PrismaticPerimeter.Sources.Censys.QueryBuilder do
  @moduledoc "Type-safe query builder for Censys Search Language."

  @type query :: String.t()

  @spec for_domain(String.t()) :: query()
  def for_domain(domain) do
    "services.tls.certificates.leaf_data.names: #{domain}"
  end

  @spec for_organization(String.t()) :: query()
  def for_organization(org) do
    "services.tls.certificates.leaf_data.subject.organization: \"#{org}\""
  end

  @spec with_port(query(), integer()) :: query()
  def with_port(base_query, port) do
    "#{base_query} AND services.port: #{port}"
  end

  @spec in_country(query(), String.t()) :: query()
  def in_country(base_query, country_code) do
    "#{base_query} AND location.country_code: \"#{country_code}\""
  end

  @spec excluding_cdn(query()) :: query()
  def excluding_cdn(base_query) do
    cdn_asns = ["AS13335", "AS20940", "AS16509"]
    exclusions = Enum.map_join(cdn_asns, " AND ", fn asn ->
      "NOT autonomous_system.asn: #{String.trim_leading(asn, "AS")}"
    end)
    "#{base_query} AND #{exclusions}"
  end
end
```
## Kontext na Prismatic Platform

Censys slouží v modulu Prismatic Perimeter jako doplňkový zdroj dat vedle
[Shodanu](@/glossary/shodan.md). Platforma se Censysu dotazuje na data certifikátů, služby
hostitelů a údaje o autonomních systémech při objevování útočné plochy. Jak požaduje axiom
[Signal Plurality](@/glossary/signal-plurality.md), zjištění z Censysu potvrzují nebo
vyvracejí data ze Shodanu a poskytují nezávislý druhý signál potřebný pro spolehlivé
bezpečnostní hodnocení.

| Použití | Výhoda Censys | Role v procesu |
|----------|-----------------|---------------|
| **objevování certifikátů** | hluboká integrace CT, úplná databáze certifikátů | hlavní zdroj pro objevování aktiv podle certifikátů |
| **posouzení TLS** | podrobná analýza šifrovacích sad a protokolů | potvrzení zjištění TLS ze Shodanu |
| **výčet subdomén** | získání polí SAN z certifikátů | doplněk k výčtu přes DNS |
| **historická analýza** | longitudinální data o změnách hostitelů | kalibrace časového stárnutí |
| **mapování ASN** | přesné přiřazení autonomního systému | vymezení hranice organizace |

Shodnou-li se Shodan a Censys na zjištění (např. oba odhalí prošlý certifikát TLS na témže
hostiteli), dostane zjištění vysoké skóre důvěry. Neshodnou-li se, platforma podle axiomu
zachování rozporů (*Contradiction Preservation*) zachová oba signály a označí zjištění
k přezkumu analytikem.

## Proces korelace více zdrojů

Platforma používá data Censys v procesu korelace více zdrojů, který slučuje zjištění od více
poskytovatelů OSINT:

```elixir
defmodule PrismaticPerimeter.CorrelationPipeline do
  @moduledoc "Multi-source OSINT correlation integrating Censys with other providers."

  @spec correlate_findings(String.t()) :: {:ok, map()} | {:error, term()}
  def correlate_findings(domain) do
    # Execute all source queries in parallel
    tasks = %{
      censys: Task.async(fn -> PrismaticPerimeter.Sources.Censys.domain_search(domain) end),
      shodan: Task.async(fn -> PrismaticPerimeter.Sources.Shodan.domain_search(domain) end),
      greynoise: Task.async(fn -> PrismaticPerimeter.Sources.GreyNoise.ip_context(domain) end)
    }

    results = Map.new(tasks, fn {source, task} ->
      {source, Task.await(task, 30_000)}
    end)

    with {:ok, censys_data} <- results.censys,
         {:ok, shodan_data} <- results.shodan do
      correlated = merge_and_score(censys_data, shodan_data, results.greynoise)
      {:ok, correlated}
    end
  end

  defp merge_and_score(censys_hosts, shodan_hosts, greynoise_result) do
    # Group by IP for cross-source comparison
    censys_by_ip = Map.new(censys_hosts, &{&1.ip, &1})
    shodan_by_ip = Map.new(shodan_hosts, &{&1.ip, &1})

    all_ips = MapSet.union(
      MapSet.new(Map.keys(censys_by_ip)),
      MapSet.new(Map.keys(shodan_by_ip))
    )

    Enum.map(all_ips, fn ip ->
      censys_entry = Map.get(censys_by_ip, ip)
      shodan_entry = Map.get(shodan_by_ip, ip)

      %{
        ip: ip,
        sources: compute_sources(censys_entry, shodan_entry),
        confidence: compute_confidence(censys_entry, shodan_entry),
        services: merge_services(censys_entry, shodan_entry),
        noise_classification: classify_noise(ip, greynoise_result)
      }
    end)
  end
end
```
## Srovnání Censys a Shodanu

| Hledisko | Censys | [Shodan](@/glossary/shodan.md) |
|-----------|--------|--------|
| **původ** | akademický (Michiganská univerzita) | nezávislý (John Matherly) |
| **skenovací engine** | ZMap + ZGrab2 (open source) | proprietární crawlery |
| **data certifikátů** | hluboká (integrace logů CT, analýza celého řetězce) | základní (jen získání certifikátu) |
| **ICS/SCADA** | střední pokrytí | rozsáhlé (Modbus, S7, BACnet, EtherNet/IP) |
| **aktuálnost dat** | pravidelné skeny celého internetu | průběžné procházení |
| **dotazovací jazyk** | Censys Search Language (strukturovaný) | filtry (klíč:hodnota) |
| **autentizace** | API ID + Secret (HTTP Basic) | klíč API |
| **historická data** | ano (placené úrovně) | ano (placené úrovně) |
| **akademické využití** | program bezplatného akademického přístupu | omezená bezplatná úroveň |
| **role na platformě** | potvrzení certifikátů, posouzení TLS | hlavní objevování služeb a zařízení |
| **podpora IPv6** | rostoucí pokrytí | omezená |
| **agregační dotazy** | vestavěné agregační API | ruční dodatečné zpracování |

## Úrovně API a limity

Úrovně a limity odpovídají stavu v době zápisu a mohou se měnit:

| Úroveň | Dotazů za měsíc | Výsledků na dotaz | Funkce |
|------|--------------|---------------|----------|
| **Community** | 250 | 100 | základní vyhledávání, omezené API |
| **Solo** | 25 000 | 1 000 | plné API, historická data |
| **Teams** | 250 000 | 10 000 | týmový přístup, pokročilá analytika |
| **Enterprise** | individuálně | neomezeně | vyhrazená infrastruktura, SLA |

Platforma omezuje četnost volání API Censys algoritmem klouzavého okna kalibrovaným podle
úrovně předplatného. Požadavky odmítnuté kvůli limitu se automaticky opakují s exponenciálním
odkladem.

```elixir
defmodule PrismaticPerimeter.Sources.Censys.RateLimiter do
  @moduledoc "Sliding window rate limiter for Censys API integration."

  use GenServer

  @type state :: %{
    window_ms: non_neg_integer(),
    max_requests: non_neg_integer(),
    requests: :queue.queue(integer())
  }

  @spec request_allowed?() :: boolean()
  def request_allowed? do
    GenServer.call(__MODULE__, :check_rate)
  end

  @spec record_request() :: :ok
  def record_request do
    GenServer.cast(__MODULE__, :record)
  end

  @impl true
  def handle_call(:check_rate, _from, state) do
    now = System.monotonic_time(:millisecond)
    cleaned = prune_old_requests(state.requests, now - state.window_ms)
    allowed = :queue.len(cleaned) < state.max_requests
    {:reply, allowed, %{state | requests: cleaned}}
  end

  @impl true
  def handle_cast(:record, state) do
    now = System.monotonic_time(:millisecond)
    {:noreply, %{state | requests: :queue.in(now, state.requests)}}
  end
end
```
## Bezpečnostní hlediska

| Hledisko | Popis | Zmírnění |
|--------------|-------------|------------|
| **zastarání dat** | data skenů mohou být hodiny nebo dny stará | křížová kontrola aktivním sondováním |
| **neúplné pokrytí** | ne všechny porty a protokoly se skenují v každém cyklu | doplnit Shodanem a aktivním skenováním |
| **falešně pozitivní výsledky** | identifikace služby může být nepřesná | ověřit přímým spojením |
| **mezery v IPv6** | pokrytí IPv6 roste, ale je neúplné | kombinovat s výčtem IPv6 přes DNS |
| **maskování CDN** | IP adresy CDN nemusí odrážet původní infrastrukturu | k určení původu použít SAN certifikátů |
| **přesnost geolokace** | geolokace IP je přibližná | k přiřazení organizace použít data ASN |

## Osvědčené postupy integrace

1. **Upřednostnit objevování podle certifikátů před skenováním hostitelů** – integrace logů CT
   je ve srovnání s jinými zdroji OSINT nejjedinečnějším přínosem Censysu. Censys používat
   hlavně pro zpravodajství o certifikátech, Shodan pro objevování služeb.
2. **Pro široké analýzy používat agregační dotazy** – agregační API poskytuje statistické
   souhrny bez čerpání kvóty na výsledky. Nejprve pochopit rozložení služeb, ASN nebo verzí
   softwaru, teprve pak jít k jednotlivým hostitelům.
3. **Ukládat odpovědi do mezipaměti s TTL podle frekvence skenů** – data Censys se obnovují
   podle plánu, ne průběžně. Mezipaměť na 6–12 hodin šetří volání bez ztráty významných změn.
4. **Implementovat jističe pro selhání API** – síťové problémy a limity mohou v procesu
   objevování vyvolat kaskádová selhání; jistič zajistí řízenou degradaci, když Censys není
   dostupný.
5. **Vždy ověřovat důvěru pluralitou signálů** – nikdy se u bezpečnostních tvrzení
   nespoléhat jen na Censys. Každé zjištění musí potvrdit alespoň jeden nezávislý zdroj.

Etický rámec práce s otevřenými zdroji popisuje heslo [OSINT](@/glossary/osint.md).

## Související pojmy

Bez vlastního hesla v glosáři knihy: *Attack Surface* (vnější infrastruktura, kterou Censys
pomáhá objevit), *TLS*, *Rate Limiting*, *Time Decay*, *Contradiction Preservation* (řešení
neshod Shodanu a Censysu) a *Knowledge Graph* (grafová databáze korelovaných zjištění).

## Související

**Platforma**

- [Shodan](@/glossary/shodan.md) – doplňková platforma internetového skenování pro objevování
  služeb.
- [EASM](@/glossary/easm.md) – správa útočné plochy, která data Censys využívá.
- [Signal Plurality](@/glossary/signal-plurality.md) – axiom, který Censys vyžaduje jako
  potvrzující zdroj.
- [GreyNoise](@/glossary/greynoise.md) – klasifikace „šumu“, která zjištění doplňuje.
- [Risk Score](@/glossary/risk-score.md) – hodnocení vycházející z ověřených zjištění.
- [Entity Resolution](@/glossary/entity-resolution.md) – propojení dat hostitelů
  s organizacemi.

**Kompendium**

- [OSINT: validace zdrojů](@/kompendium/aiad-integration/osint-ea-source-validation.md) –
  ověřování otevřených zdrojů s ohledem na manipulaci.
- [Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md) – lidský
  protějšek plurality signálů.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: censys](@/kompendium/glossary-bridges/bridge-censys.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
