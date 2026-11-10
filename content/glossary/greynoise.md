+++
title = "GreyNoise"
weight = 9
description = "Platforma pro analýzu internetového šumu, která rozlišuje neškodné skenery od cílených útoků a snižuje falešné poplachy; na platformě Prismatic třetí nezávislý zdroj signálu."

[taxonomies]
tags = ["glossary", "security", "greynoise", "prismatic", "osint"]

[extra]
category = "security"
related_terms = ["shodan", "censys", "easm", "signal-plurality", "attack-surface", "risk-score"]
author = "Tomas Korcak (korczis)"
reading_time = "6 min"
word_count = 1288
date_created = "2026-02-23"
date_modified = "2026-11-10"
keywords = ["GreyNoise", "Internet", "glossary", "security", "Prismatic Platform", "Censys", "Shodan", "RIOT", "Filter"]
quality_score = 77
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "GreyNoise – platforma Prismatic"
+++

## Definice

**GreyNoise** je platforma kybernetického zpravodajství, která sbírá a analyzuje **internetový šum na pozadí** – neustálou palbu automatizovaného skenování, procházení a zkoušení, která tvoří „počasí“ internetu. Firmu založil Andrew Morris v roce 2017. GreyNoise provozuje celosvětově rozmístěnou síť pasivních senzorů, které pozorují a třídí nevyžádaný internetový provoz. Tím, že katalogizuje, které IP adresy hromadně skenují internet, a určuje, zda je jejich činnost neškodná (bezpečnostní výzkumníci, vyhledávače, legitimní skenery), nebo škodlivá (botnety, červi, skenery exploitů), pomáhá analytikům odlišit cílené útoky od oportunistického šumu na pozadí.

Základní myšlenkou GreyNoise je, že značná část poplachů generovaných bezpečnostními nástroji není vyvolána skutečnou hrozbou, ale necíleným automatizovaným skenováním internetu. V oboru se uvádí, že takový neškodný šum může tvořit až 30–40 % poplachů firewallů a systémů detekce průniku (údaj přebíráme z původního hesla bez ověření konkrétní studie). Identifikací a odfiltrováním tohoto šumu GreyNoise výrazně snižuje objem falešně pozitivních nálezů, které musí bezpečnostní týmy prošetřit, a analytici se mohou soustředit na skutečné hrozby.

GreyNoise zařazuje každou pozorovanou IP adresu do jedné ze tří kategorií: **neškodná** (*benign* – známé legitimní skenery jako [Shodan](@/glossary/shodan.md), [Censys](@/glossary/censys.md), akademičtí výzkumníci a sondy CDN), **škodlivá** (*malicious* – známé botnety, skenery exploitů a infrastruktura řízení a kontroly) nebo **neznámá** (*unknown* – pozorované skenování bez dostatečného kontextu pro zařazení). Toto trojí třídění spolu s bohatými kontextovými metadaty o chování každého skeneru činí z GreyNoise cenný doplněk aktivních skenovacích nástrojů.

## Hlavní schopnosti

GreyNoise poskytuje několik navzájem propojených schopností pro zpravodajství o internetovém šumu:

| schopnost | popis | bezpečnostní přínos |
|-----------|-------------|----------------|
| **klasifikace šumu** | třídění IP na neškodné, škodlivé a neznámé | méně únavy z poplachů, priorita skutečných hrozeb |
| **dataset RIOT** | *Rule It Out* – databáze známých neškodných služeb | okamžité vyloučení falešně pozitivních nálezů |
| **kontext IP** | podrobná metadata o chování při skenování | pochopení záměru a metody skeneru |
| **systém štítků** | behaviorální štítky popisující činnost skeneru | rychlé zařazení (např. „Mirai-like“, „SSH Bruteforcer“) |
| **korelace CVE** | přiřazení skenování ke konkrétním exploitům zranitelností | sledování aktivních kampaní zneužívání |
| **časová analýza** | historie chování skeneru | odhalení změn chování nebo záměru |
| **detekce hromadného skenování** | identifikace IP skenujících velké části internetu | odlišení cíleného a oportunistického skenování |

## Klasifikační model IP adres

Klasifikační systém GreyNoise poskytuje odstíněný pohled na skenovací činnost v internetu:

| klasifikace | definice | příklady | reakce na poplach |
|---------------|------------|----------|-------------|
| **neškodná** | známé legitimní, neškodné skenování | Shodan, Censys, Google, Cloudflare, univerzitní výzkumníci | potlačit poplach |
| **škodlivá** | známé škodlivé skenování nebo zneužívání | botnety (Mirai, Hajime), skenery exploitů, infrastruktura C2 | eskalovat a prošetřit |
| **neznámá** | pozorované skenování, nedostatek dat pro zařazení | neidentifikované hromadné skenery, výstupní uzly VPN, nově pozorované IP | třídění podle kontextu |

Klasifikaci podpírají bohatá metadata:

```json
{
  "ip": "198.51.100.42",
  "seen": true,
  "classification": "benign",
  "first_seen": "2024-01-15",
  "last_seen": "2026-02-14",
  "actor": "Censys",
  "tags": ["censys-scanner", "tls-scanner", "http-crawler"],
  "cve": [],
  "metadata": {
    "asn": "AS395954",
    "city": "Ann Arbor",
    "country": "United States",
    "country_code": "US",
    "organization": "Censys, Inc.",
    "os": "Linux",
    "rdns": "scanner-42.censys.io"
  },
  "raw_data": {
    "scan": [
      {"port": 443, "protocol": "TCP"},
      {"port": 80, "protocol": "TCP"}
    ],
    "web": {
      "useragents": ["Mozilla/5.0 zgrab/0.x"]
    }
  }
}
```

## Dataset RIOT

Dataset RIOT (*Rule It Out*, „vylučte to“) je kurátorovaná databáze IP adres patřících známým neškodným službám. Na rozdíl od hlavního klasifikačního systému, který pozoruje chování při skenování, RIOT identifikuje adresy podle jejich organizačního vlastnictví:

| kategorie RIOT | příklady | účel |
|--------------|----------|---------|
| **poskytovatelé CDN** | Cloudflare, Akamai, Fastly, AWS CloudFront | filtrovat kontroly stavu a sondy okrajových uzlů CDN |
| **vyhledávače** | Googlebot, Bingbot, Yandex, Baidu Spider | filtrovat provoz crawlerů |
| **cloudoví poskytovatelé** | kontroly stavu AWS, GCP, Azure | filtrovat monitoring infrastruktury |
| **bezpečnostní skenery** | Shodan, Censys, Qualys, Rapid7 | filtrovat známé neškodné bezpečnostní skenování |
| **poskytovatelé DNS** | Google DNS, Cloudflare DNS, OpenDNS | filtrovat provoz překladu DNS |
| **monitorovací služby** | Pingdom, UptimeRobot, StatusCake | filtrovat sondy sledování dostupnosti |

Dataset RIOT umožňuje okamžité vyloučení falešně pozitivních nálezů: je-li IP adresa, která poplach vyvolala, v databázi RIOT, lze poplach bezpečně potlačit bez další analýzy. Přístup „vylučte to“ je výrazně rychlejší než behaviorální analýza.

## Integrace přes API

GreyNoise nabízí pro programový přístup komunitní (bezplatné) i podnikové API:

```elixir
# GreyNoise API client for Prismatic EASM
defmodule PrismaticPerimeter.Sources.GreyNoise do
  @moduledoc "GreyNoise API integration for noise filtering and IP context"

  @base_url "https://api.greynoise.io/v3"

  @type ip_context :: %{
    ip: String.t(),
    seen: boolean(),
    classification: :benign | :malicious | :unknown,
    actor: String.t() | nil,
    tags: [String.t()],
    cve: [String.t()],
    first_seen: Date.t() | nil,
    last_seen: Date.t() | nil,
    metadata: map()
  }

  @doc "Get full context for a specific IP address"
  @spec ip_context(String.t()) :: {:ok, ip_context()} | {:error, term()}
  def ip_context(ip) do
    case authenticated_request(:get, "/community/#{ip}") do
      {:ok, %{status: 200, body: body}} ->
        {:ok, parse_context(body)}

      {:ok, %{status: 404}} ->
        {:ok, %{ip: ip, seen: false, classification: :unknown}}

      {:error, reason} ->
        {:error, reason}
    end
  end

  @doc "Quick check if IP is noise (benign scanner)"
  @spec is_noise?(String.t()) :: {:ok, boolean()} | {:error, term()}
  def is_noise?(ip) do
    case ip_context(ip) do
      {:ok, %{classification: :benign}} -> {:ok, true}
      {:ok, _} -> {:ok, false}
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Check if IP is in RIOT dataset (known benign service)"
  @spec riot_check(String.t()) :: {:ok, map()} | {:error, term()}
  def riot_check(ip) do
    case authenticated_request(:get, "/riot/#{ip}") do
      {:ok, %{status: 200, body: body}} -> {:ok, body}
      {:ok, %{status: 404}} -> {:ok, %{riot: false, ip: ip}}
      {:error, reason} -> {:error, reason}
    end
  end

  @doc "Bulk context lookup for multiple IPs"
  @spec bulk_context([String.t()]) :: {:ok, [ip_context()]} | {:error, term()}
  def bulk_context(ips) when is_list(ips) do
    body = %{ips: ips}

    case authenticated_request(:post, "/noise/multi/quick", body) do
      {:ok, %{status: 200, body: results}} ->
        {:ok, Enum.map(results, &parse_context/1)}

      {:error, reason} ->
        {:error, reason}
    end
  end

  @doc "Lookup context for IPs associated with a domain's attack surface"
  @spec context_lookup(String.t()) :: {:ok, [ip_context()]} | {:error, term()}
  def context_lookup(domain) do
    # GreyNoise does not search by domain directly;
    # this is called after Shodan/Censys resolve IPs for a domain
    {:ok, []}
  end

  defp authenticated_request(method, path, body \\ nil) do
    headers = [
      {"key", api_key()},
      {"Accept", "application/json"}
    ]

    HTTPClient.request(method, "#{@base_url}#{path}",
      headers: headers,
      json: body
    )
  end

  defp api_key, do: Application.get_env(:prismatic_perimeter, :greynoise_api_key)
end
```

## Kontext na platformě Prismatic

Platforma Prismatic, z níž kniha vzešla, začleňuje GreyNoise do modulu Perimeter, kde dává kontext nálezům ze služeb Shodan a Censys. Když pipeline objevování [EASM](@/glossary/easm.md) najde vystavené služby, data GreyNoise určují, zda příchozí provoz k těmto službám představuje cílenou hrozbu, nebo neškodný šum na pozadí. Tento kontext výrazně zpřesňuje bezpečnostní hodnocení, protože činnost neškodných skenerů nenafukuje [risk score](@/glossary/risk-score.md).

GreyNoise vstupuje do pipeline objevování ve fázi obohacování:

1. **Objevování** (Shodan + Censys): identifikace vystavených služeb a jejich zdrojových IP.
2. **Filtrace šumu** (GreyNoise): klasifikace IP, které s objevenými službami komunikují.
3. **Obohacení kontextem:** připojení behaviorálních štítků, klasifikace a dat RIOT k nálezům.
4. **Úprava skóre:** změna rizikového skóre podle klasifikace šumu.

```elixir
# GreyNoise noise filtering in the EASM pipeline
defmodule PrismaticPerimeter.Enrichment.NoiseFilter do
  alias PrismaticPerimeter.Sources.GreyNoise

  @doc "Filter and contextualize findings with GreyNoise data"
  @spec enrich_findings([finding()]) :: [enriched_finding()]
  def enrich_findings(findings) do
    # Extract unique IPs from findings
    ips = findings |> Enum.map(& &1.source_ip) |> Enum.uniq()

    # Bulk lookup for efficiency
    {:ok, contexts} = GreyNoise.bulk_context(ips)
    context_map = Map.new(contexts, &{&1.ip, &1})

    # Enrich each finding
    Enum.map(findings, fn finding ->
      context = Map.get(context_map, finding.source_ip, %{classification: :unknown})

      %{finding |
        noise_classification: context.classification,
        noise_actor: context[:actor],
        noise_tags: context[:tags] || [],
        risk_adjustment: calculate_risk_adjustment(context),
        confidence_modifier: confidence_from_classification(context)
      }
    end)
  end

  defp calculate_risk_adjustment(%{classification: :benign}), do: -0.5
  defp calculate_risk_adjustment(%{classification: :malicious}), do: +0.3
  defp calculate_risk_adjustment(%{classification: :unknown}), do: 0.0

  defp confidence_from_classification(%{classification: :benign}), do: 0.95
  defp confidence_from_classification(%{classification: :malicious}), do: 0.90
  defp confidence_from_classification(_), do: 0.50
end
```

GreyNoise slouží jako **třetí nezávislý zdroj signálu** pro axiom [Signal Plurality](@/glossary/signal-plurality.md). Zatímco Shodan a Censys poskytují signály o objevených aktivech, GreyNoise poskytuje signály o kontextu hrozby; vzniká tak vícerozměrné hodnocení, které splňuje epistemický požadavek nezávislého potvrzení.

## Dopad na snížení falešně pozitivních nálezů

Kvantitativní dopad integrace GreyNoise na přesnost poplachů, jak jej uvádí platforma (orientační hodnoty, ne výsledek publikované studie):

| metrika | bez GreyNoise | s GreyNoise | zlepšení |
|--------|-------------------|----------------|-------------|
| **objem poplachů** | 100 % (výchozí stav) | 60–70 % | snížení o 30–40 % |
| **podíl falešně pozitivních** | 30–40 % | 5–10 % | snížení o 75–80 % |
| **čas třídění analytikem** | 15–30 min na poplach | 5–10 min na poplach | snížení o 50–67 % |
| **průměrná doba reakce** | hodiny | minuty | řádové zlepšení |
| **přesnost rizikového skóre** | střední | vysoká | výrazné zlepšení |

## Srovnání s alternativami

| vlastnost | GreyNoise | Shodan | Censys | AbuseIPDB |
|---------|-----------|--------|--------|-----------|
| **hlavní účel** | klasifikace šumu | objevování služeb | skenování hostitelů a certifikátů | hlášení zneužití |
| **sběr dat** | pasivní senzory | aktivní skenování | aktivní skenování | hlášení komunity |
| **klasifikační model** | neškodná/škodlivá/neznámá | identifikace služeb | výčet hostitelů | kategorie zneužití |
| **dataset RIOT** | ano (kurátorovaná databáze neškodných) | ne | ne | ne |
| **korelace CVE** | sledování aktivního zneužívání | značení zranitelností | omezená | ne |
| **rychlost API** | velmi rychlá (dotaz na jednu IP pod 100 ms) | střední | střední | rychlá |
| **role na platformě** | filtrace šumu, kontext hrozby | primární objevování | potvrzení certifikátů | neintegrováno |

## Význam pro Kompendium

GreyNoise patří do technického kontextu platformy. Jeho princip má však v knize obecnou platnost: **ne každý signál je útok** a systém, který na šum reaguje jako na hrozbu, se zahltí falešnými poplachy a přestane rozlišovat. Kompendium totéž připomíná v kritické perspektivě [riziko falešně pozitivních závěrů](@/kompendium/critical-perspectives/5-false-positive-risk.md): ne každá manipulativně vyznívající věta je technika EA. Naopak rozlišit cílenou koordinovanou činnost od přirozeného pozadí je jádrem [detekce botů](@/kompendium/cross-domain/6-ea-osint-bot-detection.md), signatury [koordinace botů](@/kompendium/detection-signatures/20-network-bot-coordination.md) a [validace zpravodajství o hrozbách](@/kompendium/cross-domain/24-ea-security-threat-intelligence-validation.md). Použití v modulu Perimeter z pohledu EA popisuje [Perimeter a útočná plocha EA](@/kompendium/aiad-integration/perimeter-ea-attack-surface.md).

## Související

**Platforma**

- [Shodan](@/glossary/shodan.md) – skenovací platforma, jejíž nálezy GreyNoise zasazuje do kontextu.
- [Censys](@/glossary/censys.md) – platforma objevování doplněná filtrací šumu.
- [EASM](@/glossary/easm.md) – správa útočné plochy, které snížení šumu prospívá.
- [Signal Plurality](@/glossary/signal-plurality.md) – axiom, který GreyNoise naplňuje jako třetí zdroj signálu.
- [Risk Score](@/glossary/risk-score.md) – hodnocení zpřesněné odfiltrováním neškodných skenerů.

**Kniha**

- [Riziko falešně pozitivních závěrů](@/kompendium/critical-perspectives/5-false-positive-risk.md) – obecná obdoba problému šumu.
- [Detekce botů](@/kompendium/cross-domain/6-ea-osint-bot-detection.md) – odlišení koordinace od pozadí.
- [Perimeter a útočná plocha EA](@/kompendium/aiad-integration/perimeter-ea-attack-surface.md) – modul, do kterého GreyNoise patří.

**Mimo knihu (web platformy)**

- [Attack Surface](https://prismatic-reality-com.github.io/prismatic-promo/glossary/attack-surface/) – vnější plocha, na níž filtrace šumu zpřesňuje hodnocení.
- [Rate Limiting](https://prismatic-reality-com.github.io/prismatic-promo/glossary/rate-limiting/) – správa kvót API při integraci.
- [Contradiction Preservation](https://prismatic-reality-com.github.io/prismatic-promo/glossary/contradiction-preservation/) – zacházení s protichůdnými hodnoceními hrozby.
- [Time Decay](https://prismatic-reality-com.github.io/prismatic-promo/glossary/time-decay/) – časový kontext stárnoucích nálezů.
- [Confidence Scoring](https://prismatic-reality-com.github.io/prismatic-promo/glossary/confidence-scoring/) – úrovně jistoty klasifikace.
- [Architecture](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) – architektura pipeline obohacování EASM.
- [Apps](https://prismatic-reality-com.github.io/prismatic-promo/apps/) – aplikace Prismatic Perimeter.
- [OSINT](https://prismatic-reality-com.github.io/prismatic-promo/osint/) – metodika sběru zpravodajství z otevřených zdrojů.
