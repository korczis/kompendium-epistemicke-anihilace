+++
title = "Inference (inference modelu AI)"
weight = 36
description = "Spuštění natrénovaného modelu umělé inteligence, které z nových vstupů vytváří výstupy; na platformě Prismatic lokální inference přes Ollama. Odlišení od inference jako usuzování."

[taxonomies]
tags = ["glossary", "technology", "inference", "prismatic", "AI"]

[extra]
category = "technology"
related_terms = ["ollama", "beam", "telemetry", "observability", "rate-limiting", "backpressure"]
author = "Tomas Korcak (korczis)"
reading_time = "8 min"
word_count = 1587
date_created = "2026-02-23"
date_modified = "2026-11-10"
keywords = ["Inference", "Executing", "glossary", "technology", "Prismatic Platform", "README", "Cache"]
quality_score = 67
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "Inference – platforma Prismatic"
+++

## Definice

**Inference** je výpočetní proces, při němž se spouští natrénovaný model umělé inteligence, aby z nových, dosud neviděných vstupů vytvořil výstupy (předpovědi, klasifikace, generovaný text nebo rozhodnutí). Na rozdíl od tréninku, který upravuje parametry modelu opakovaným průchodem daty s cílem minimalizovat ztrátovou funkci, inference používá pevné naučené parametry a převádí vstupy na výstupy dopředným průchodem neuronovou sítí modelu. V produkčních systémech zahrnuje inference celou pipeline: předzpracování vstupu a tokenizaci, sestavení tenzorů, dopředné šíření vrstvami modelu, vzorkování či dekódování výstupu a dodatečné zpracování výsledků do formátu, se kterým pracuje aplikace.

Výkon inference charakterizují tři hlavní rozměry: **latence** (doba do prvního tokenu a doba do dokončení u generativních modelů, celková doba odpovědi u klasifikačních modelů), **propustnost** (tokeny nebo požadavky za sekundu, které systém udrží) a **efektivita využití prostředků** (spotřeba paměti, využití GPU/CPU a energie na jednu inferenci). Tyto rozměry jsou v napětí – optimalizace propustnosti dávkováním zvyšuje latenci jednotlivých požadavků, minimalizace latence vyhrazenými prostředky snižuje propustnost a zvyšuje cenu. Produkční systémy musí mezi nimi volit podle požadavků aplikace: interaktivní aplikace upřednostňují latenci, dávkové pipeline propustnost.

Rozdíl mezi tréninkem a inferencí má zásadní důsledky pro architekturu. Trénink je dávkový proces, který hodiny či dny vyžaduje obrovské výpočetní prostředky a vytváří artefakt modelu. Inference je služba v reálném čase, která po celou dobu provozu aplikace vyžaduje trvalé zpracování s nízkou latencí. Proto jsou tréninková infrastruktura (clustery GPU, distribuované datové pipeline) a inferenční infrastruktura (obslužné frameworky, vyvažovače zátěže, cache modelů) zásadně odlišné systémy optimalizované pro odlišné úlohy.

**Pozor na dvojznačnost:** v logice a epistemologii znamená *inference* odvozování závěru z premis (usuzování). Toto heslo popisuje technický význam z oblasti strojového učení; epistemickým významem se v knize zabývají například [EA-4.3.4 Přerušení inferenčního řetězce](@/kompendium/techniques/ea-4-3-4-inferential-chain-breakage.md), [EA-5.1.16 Inferenční paralýza](@/kompendium/techniques/ea-5-1-16-inferencni-paralyza.md) a [Brandom: inferenční sémantika](@/kompendium/07-teoreticke-reflexe/brandom-inferential-semantics.md).

## Přehled

Prostředí inference se rychle proměnilo s rozšířením velkých jazykových modelů (LLM) a nástupem lokálních běhových prostředí. Kde dříve inference vyžadovala cloudové instance GPU za tisíce dolarů měsíčně, umožňují dnes techniky kvantizace a optimalizovaná běhová prostředí provozovat modely se 7–20 miliardami parametrů na běžném hardwaru s přijatelnou latencí. Toto zpřístupnění dovoluje platformám udržet funkce AI s menší závislostí na cloudu, lepší ochranou dat a předvídatelnými náklady.

### Fáze inferenční pipeline

| fáze | popis | typická latence | optimalizace |
|-------|-------------|-----------------|--------------|
| **předzpracování** | validace vstupu, tokenizace, vyhledání embeddingů | 1–5 ms | cache tokenů, dávková tokenizace |
| **prefill** | zpracování všech vstupních tokenů vrstvami attention | 50–500 ms | FlashAttention, tenzorový paralelismus |
| **generování** | autoregresivní generování tokenů (LLM) | 20–100 ms/token | KV-cache, spekulativní dekódování |
| **dodatečné zpracování** | dekódování tokenů, formátování a validace výstupu | 1–5 ms | streamování výstupu, předčasné ukončení |

### Techniky optimalizace modelu

| technika | úspora paměti | vliv na rychlost | vliv na kvalitu |
|-----------|------------------|--------------|----------------|
| **FP16** | 50 % oproti FP32 | 1,5–2× rychlejší | zanedbatelný |
| **kvantizace INT8** | 75 % oproti FP32 | 2–3× rychlejší | malý (< 1 % perplexity) |
| **kvantizace INT4 (GPTQ/AWQ)** | 87,5 % oproti FP32 | 3–4× rychlejší | střední (1–3 % perplexity) |
| **GGUF (llama.cpp)** | proměnlivá (typicky Q4_K_M) | optimalizováno pro CPU | podle úrovně kvantizace |
| **spekulativní dekódování** | žádná | 2–3× rychlejší generování | bezztrátové |
| **KV-cache** | paměť zvyšuje | nutná pro generování | bezztrátová |
| **průběžné dávkování** | žádná | 2–5× vyšší propustnost | bezztrátové |

### Architektury inference

```
                    +-----------------------+
                    |    Request Router     |
                    |  (load balancing,     |
                    |   rate limiting)      |
                    +----------+------------+
                               |
              +----------------+----------------+
              |                |                |
     +--------v------+  +-----v--------+  +---v-----------+
     | Local Runtime  |  | Cloud API    |  | Hybrid        |
     | (Ollama)       |  | (Claude,     |  | (local first, |
     | - 7B-20B       |  |  GPT)        |  |  cloud        |
     | - < 8GB RAM    |  | - Any size   |  |  fallback)    |
     | - Privacy      |  | - Fastest    |  | - Balanced    |
     +----------------+  +--------------+  +---------------+
```

## Technické podrobnosti

### Tokenizace a zpracování vstupu

Inference začíná převodem surového vstupu do formátu, který model očekává. U LLM jde o tokenizaci – převod textových řetězců na celočíselná ID tokenů podle slovníku modelu:

| tokenizér | velikost slovníku | průměr tokenů na slovo | používají |
|-----------|----------------|-----------------|---------|
| **BPE (Byte Pair Encoding)** | 32K–100K | 1,3–1,5 | GPT, Llama |
| **SentencePiece** | 32K–64K | 1,2–1,4 | T5, Gemma |
| **WordPiece** | 30K–50K | 1,4–1,6 | BERT |
| **Tiktoken** | 100K+ | 1,1–1,3 | GPT-4 (OpenAI) |

Hodnoty tokenů na slovo platí orientačně pro angličtinu; u češtiny bývají vyšší.

### Správa KV-cache

Při autoregresivním generování věnuje každý nový token pozornost všem předchozím tokenům. Bez cache by bylo nutné v každém kroku znovu spočítat attention pro celou sekvenci (složitost O(n²)). KV-cache ukládá mezivýsledky klíčů a hodnot attention a opětovným použitím snižuje generování jednoho tokenu na O(n):

| délka sekvence | bez KV-cache | s KV-cache | paměťová cena (7B FP16) |
|-----------------|------------------|---------------|----------------------|
| 512 tokenů | 512 dopředných průchodů | 1 průchod + 511 z cache | ~500 MB |
| 2048 tokenů | 2048 dopředných průchodů | 1 průchod + 2047 z cache | ~2 GB |
| 8192 tokenů | 8192 dopředných průchodů | 1 průchod + 8191 z cache | ~8 GB |

### Strategie dávkování

| strategie | popis | latence | propustnost | použití |
|----------|-------------|---------|------------|----------|
| **bez dávkování** | jeden požadavek najednou | nejnižší | nejnižší | interaktivní, jeden uživatel |
| **statické dávkování** | pevná velikost dávky, čeká se na naplnění | vyšší | střední | dávkové zpracování |
| **průběžné dávkování** | dynamické přidávání a dokončování | střední | nejvyšší | produkční obsluha |
| **spekulativní dávkování** | návrhový model generuje, hlavní model ověřuje | nízká | vysoká | generování citlivé na latenci |

## Implementace na platformě Prismatic

Platforma Prismatic, z níž kniha vzešla, spouští inferenční úlohy přes lokální infrastrukturu AI Ollama; agent Ollama Coordinator spravuje životní cyklus modelů, přidělování prostředků a sledování výkonu:

```elixir
defmodule PrismaticAgents.InferenceCoordinator do
  @moduledoc """
  Coordinates AI inference requests across local Ollama runtime
  and cloud fallback providers with backpressure and rate limiting.
  """

  use GenServer

  alias PrismaticAgents.OllamaClient
  alias PrismaticAgents.CloudFallback

  @max_concurrent_local 4
  @local_timeout_ms 30_000
  @memory_limit_bytes 8 * 1024 * 1024 * 1024  # 8GB

  @type inference_request :: %{
    model: String.t(),
    prompt: String.t(),
    max_tokens: pos_integer(),
    temperature: float()
  }

  @type inference_result :: %{
    output: String.t(),
    tokens_generated: pos_integer(),
    latency_ms: non_neg_integer(),
    provider: :local | :cloud
  }

  @spec infer(inference_request()) :: {:ok, inference_result()} | {:error, term()}
  def infer(request) do
    GenServer.call(__MODULE__, {:infer, request}, @local_timeout_ms)
  end

  @impl GenServer
  def handle_call({:infer, request}, _from, state) do
    start_time = System.monotonic_time(:millisecond)

    result =
      if state.active_requests < @max_concurrent_local and
           state.memory_usage < @memory_limit_bytes do
        execute_local(request, start_time)
      else
        execute_cloud_fallback(request, start_time)
      end

    emit_inference_telemetry(result)
    {:reply, result, update_state(state, result)}
  end

  defp execute_local(request, start_time) do
    case OllamaClient.generate(request) do
      {:ok, response} ->
        latency = System.monotonic_time(:millisecond) - start_time

        {:ok, %{
          output: response.text,
          tokens_generated: response.eval_count,
          latency_ms: latency,
          provider: :local
        }}

      {:error, :timeout} ->
        CloudFallback.generate(request, start_time)
    end
  end

  defp emit_inference_telemetry({:ok, result}) do
    :telemetry.execute(
      [:prismatic, :inference, :complete],
      %{
        latency_ms: result.latency_ms,
        tokens: result.tokens_generated
      },
      %{provider: result.provider}
    )
  end
end
```

### Konfigurace modelů

```elixir
defmodule PrismaticAgents.InferenceConfig do
  @moduledoc "Inference model configuration and selection."

  @models %{
    "qwen3-coder" => %{
      parameters: "7B",
      response_time: "< 3s",
      memory: "< 4GB",
      use_case: :code_generation
    },
    "gpt-oss:20b" => %{
      parameters: "20B",
      response_time: "< 5s",
      memory: "< 8GB",
      use_case: :general_reasoning
    },
    "deepseek-coder" => %{
      parameters: "6.7B",
      response_time: "< 3s",
      memory: "< 4GB",
      use_case: :code_analysis
    }
  }

  @spec select_model(atom()) :: {:ok, map()} | {:error, :no_suitable_model}
  def select_model(use_case) do
    case Enum.find(@models, fn {_name, config} -> config.use_case == use_case end) do
      {name, config} -> {:ok, Map.put(config, :name, name)}
      nil -> {:error, :no_suitable_model}
    end
  end
end
```

## Srovnání s alternativami

| rozměr | lokální inference (Ollama) | cloudové API (Claude/GPT) | inference na okraji sítě | vlastní trénink |
|-----------|-------------------------|------------------------|----------------|-----------------|
| **latence** | 1–5 s (7B), 3–10 s (20B) | 0,5–3 s (optimalizováno) | 10–100 ms | různá |
| **soukromí** | úplná lokalita dat | data se posílají poskytovateli | v zařízení | podle nastavení |
| **náklady** | amortizace hardwaru | cena za token | cena zařízení | cena clusteru GPU |
| **kvalita modelu** | dobrá (rozsah 7–20B) | nejlepší (velké modely) | omezená (1–3B) | doménově specifická |
| **škálovatelnost** | omezená hardwarem | prakticky neomezená | podle zařízení | podle clusteru |
| **dostupnost** | 99 %+ (lokální hardware) | 99,9 % (podle SLA) | 100 % (offline) | různá |

## Osvědčené postupy

1. **Volit velikost modelu podle úlohy:** doplňování kódu a klasifikace často dobře zvládnou modely 7B, složité usuzování a vícekrokové plánování těží z větších modelů. Nesahat automaticky po největším modelu, když stačí menší.
2. **Zavést zpětný tlak (*backpressure*):** nikdy nedovolit, aby požadavky na inferenci překročily kapacitu systému. Omezené fronty, omezování rychlosti a jističe brání vyčerpání prostředků. Model předávání zpráv v BEAM podporuje zpětný tlak přirozeně prostřednictvím časových limitů volání GenServer.
3. **Sledovat spotřebu prostředků:** využití GPU/CPU, paměť a latenci inference vést jako telemetrické metriky. Nastavit upozornění, když se paměť blíží limitu (> 90 % rozpočtu 8 GB) a latence překročí prahy (> 5 s u interaktivních požadavků).
4. **Navrhnout řízený ústup:** při přetížení nebo nedostupnosti lokální inference automaticky směrovat na cloudové poskytovatele; při nedostupnosti cloudu degradovat řízeně na odpovědi z cache nebo zjednodušené heuristiky.
5. **Ukládat do cache s rozmyslem:** u deterministických vstupů ukládat výsledky inference. Pro přibližné zásahy cache používat shodu podle sémantické podobnosti.
6. **Streamovat odpovědi:** u generativních modelů posílat tokeny klientovi průběžně. Snižuje to vnímanou latenci a umožňuje předčasné ukončení.

## Případy užití

- **Rozhodování agentů:** agenti [AIAD](@/glossary/aiad.md) (v době zápisu 434) používají inferenci k plánování úloh, analýze kódu, hodnocení kvality a rozhodování; každý agent volí model podle své specializace a složitosti úlohy.
- **Generování a analýza kódu:** inference pohání generování kódu pro vývoj platformy, návrhy oprav kvality a detekci vzorů. Modely jako qwen3-coder a deepseek-coder jsou optimalizovány pro porozumění kódu v Elixiru a jeho generování.
- **Analýza OSINT:** inference zpracování přirozeného jazyka extrahuje entity, vztahy a sentiment z nestrukturovaných dat [OSINT](@/glossary/osint.md) a předává strukturované zpravodajství do znalostního grafu.
- **Bezpečnostní klasifikace:** modely klasifikují bezpečnostní hrozby, hodnotí závažnost zranitelností a vytvářejí popisy rizik pro bezpečnostní hodnocení Prismatic Perimeter.
- **Vývoj kvality:** systém [AutoEvolve](@/glossary/autoevolve.md) používá inferenci k hledání příležitostí ke zlepšení, navrhování refaktoringu a hodnocení dopadu navržených změn napříč aplikacemi umbrella projektu (v době zápisu 90).

## Význam pro Kompendium

Pro knihu je inference modelů AI podstatná proto, že výstupy jazykových modelů se stávají zdrojem tvrzení, které lidé přebírají. Model nevypovídá o světě; generuje pravděpodobné pokračování textu. Kompendium popisuje rizika, která z toho plynou: [EA-9.1.1 Praní halucinací](@/kompendium/techniques/ea-9-1-1-llm-hallucination-laundering.md), [EA-9.1.8 Zesilování konfabulací](@/kompendium/techniques/ea-9-1-8-llm-confabulation-amplification.md) a [EA-9.1.6 Obcházení přiřazení zdroje](@/kompendium/techniques/ea-9-1-6-llm-source-attribution-bypass.md). Obranou je zacházet s výstupem modelu jako s hypotézou, ne jako se svědectvím, a ověřovat jej proti zdrojům ([detekce obsahu generovaného AI](@/kompendium/self-defense-guides/40-ai-content-detection.md)).

## Související

**Platforma**

- [AIAD](@/glossary/aiad.md) – agenti, kteří inferenci používají k rozhodování.
- [AutoEvolve](@/glossary/autoevolve.md) – systém vývoje kvality využívající inferenci.
- [OSINT](@/glossary/osint.md) – oblast, v níž inference extrahuje entity a vztahy.

**Kniha**

- [EA-9.1.1 Praní halucinací](@/kompendium/techniques/ea-9-1-1-llm-hallucination-laundering.md) – když se výstup modelu stane „faktem“.
- [EA-5.1.16 Inferenční paralýza](@/kompendium/techniques/ea-5-1-16-inferencni-paralyza.md) – inference ve smyslu usuzování.
- [Detekce obsahu generovaného AI](@/kompendium/self-defense-guides/40-ai-content-detection.md) – obrana jednotlivce.

**Mimo knihu (web a repozitář platformy)**

- [Ollama](https://prismatic-reality-com.github.io/prismatic-promo/glossary/ollama/) – lokální běhové prostředí AI pro modely platformy.
- [Backpressure](https://prismatic-reality-com.github.io/prismatic-promo/glossary/backpressure/) – řízení toku, které brání přetížení inference.
- [Rate Limiting](https://prismatic-reality-com.github.io/prismatic-promo/glossary/rate-limiting/) – omezování požadavků chránící prostředky.
- [Telemetry](https://prismatic-reality-com.github.io/prismatic-promo/glossary/telemetry/) – metriky výkonu inference.
- [Observability](https://prismatic-reality-com.github.io/prismatic-promo/glossary/observability/) – infrastruktura sledování stavu inference.
- [BEAM](https://prismatic-reality-com.github.io/prismatic-promo/glossary/beam/) – virtuální stroj pro souběžné zpracování požadavků.
- [GenServer](https://prismatic-reality-com.github.io/prismatic-promo/glossary/genserver/) – chování OTP, které implementuje koordinátor inference.
- [Node](https://prismatic-reality-com.github.io/prismatic-promo/glossary/node/) – uzel BEAM.
- [prismatic_ollama](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/apps/prismatic_ollama/README.md) – lokální běhové prostředí inference přes Ollama.
- `prismatic_agents` (aplikace platformy, není součástí tohoto repozitáře) – systém agentů využívající inferenci.
- [app_ai_safety](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/apps/app_ai_safety/README.md) – sledování bezpečnosti výstupů inference.
- [app_ai_interpretability](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/apps/app_ai_interpretability/README.md) – analýza interpretovatelnosti výsledků.
- [prismatic_telemetry](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/apps/prismatic_telemetry/README.md) – telemetrie výkonu inference.
- [Architecture](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) – architektura AI inference a integrační vzory.
- [Capabilities](https://prismatic-reality-com.github.io/prismatic-promo/capabilities/) – schopnosti AI a strojového učení.
