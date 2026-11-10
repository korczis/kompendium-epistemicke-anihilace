+++
title = "HAWKEYE"
weight = 72
description = "Systém platformy Prismatic pro zpravodajství o návštěvnících webu: otisky, behaviorální analýza a detekce hrozeb s ochranou soukromí podle GDPR. Technický kontext knihy."

[taxonomies]
tags = ["glossary", "security", "hawkeye", "prismatic", "osint"]

[extra]
category = "security"
related_app = "prismatic-visitor-intelligence"
related_terms = ["easm", "osint", "threat-intelligence", "color-teams", "blue-team", "security-rating"]
complexity_level = "advanced"
security_domain = "visitor_intelligence"
real_time_classification = true
behavioral_analysis = true
fingerprinting_layers = 5
gdpr_compliant = true
telemetry_enabled = true
color_team_integration = true
nabla_compliant = true
signal_plurality_enforced = true
confidence_scoring = true
osint_enrichment = true
risk_categories = ["benign", "suspicious", "malicious", "unknown"]
detection_techniques = ["technical_fingerprinting", "behavioral_profiling", "osint_correlation", "pattern_matching"]
privacy_by_design = true
audit_trail_complete = true
threat_actor_attribution = true
platform_integration = "native_otp"
umbrella_apps = ["prismatic_visitor_intelligence", "prismatic_hawkeye", "prismatic_hawkeye_web", "prismatic_tracking"]
response_time = "sub_second"
false_positive_threshold = "1_percent"
author = "Tomas Korcak (korczis)"
date_created = "2026-02-23"
date_modified = "2026-11-10"
keywords = ["HAWKEYE", "Visitor", "Intelligence", "glossary", "security", "Prismatic Platform", "OSINT", "README"]
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "HAWKEYE – platforma Prismatic"
+++

## Definice

**HAWKEYE** je systém zpravodajství o návštěvnících (*Visitor Intelligence*) platformy Prismatic, z níž kniha vzešla. Jde o ucelený bezpečnostní subsystém, který v reálném čase provádí behaviorální analýzu návštěvníků webu, koreluje vzorce návštěv s kanály zpravodajství o hrozbách a poskytuje průběžný přehled o bezpečnostním postoji. Systém kombinuje technické otisky (*fingerprinting*), behaviorální profilování, analýzu relací a obohacení z otevřených zdrojů ([OSINT](@/glossary/osint.md)), aby návštěvníky zařadil na škále rizika a odhalil možné hrozby dřív, než mohou zneužít zranitelnosti útočné plochy platformy.

V jádru vychází HAWKEYE z principu, že smysluplný bezpečnostní poznatek nevzniká z izolovaných údajů, ale ze **spojení více behaviorálních a technických signálů**. Jediný požadavek HTTP o záměru mnoho neprozradí; korelovaný s otiskem, vzorci navigace, časováním požadavků, geolokačními údaji a známými ukazateli hrozeb však vytváří ucelený profil návštěvníka. Tento vícesignálový přístup odpovídá axiomu [Signal Plurality](@/glossary/signal-plurality.md) rámce [NABLA Infinity](@/glossary/nabla-infinity.md), který vyžaduje nejméně dva nezávislé signály, než vznikne jakékoli přesvědčení o zařazení návštěvníka.

Název HAWKEYE („jestřábí oko“) vyjadřuje roli bdělého pozorovatele platformy, který neustále sleduje činnost návštěvníků a přitom zůstává pro legitimní uživatele neviditelný. Na rozdíl od tradičních firewallů webových aplikací (WAF), které pracují se statickými sadami pravidel, používá HAWKEYE adaptivní behaviorální modely, které se vyvíjejí se změnami prostředí hrozeb, a poskytuje hloubkovou obranu prostřednictvím zpravodajství, ne pouhého porovnávání vzorů.

## Přehled

Zpravodajství o návštěvnících představuje posun od reaktivní bezpečnosti (blokování známých škodlivých aktérů) k proaktivní bezpečnosti (porozumění záměru návštěvníka pomocí behaviorální analýzy). Tradiční bezpečnostní nástroje působí na síťové nebo aplikační vrstvě a porovnávají jednotlivé požadavky s databázemi signatur. HAWKEYE působí na **zpravodajské vrstvě** a vytváří složené profily návštěvníků, které umožňují jemnější hodnocení rizika.

Systém zpracovává interakce návštěvníků vícestupňovou pipeline. Surový provoz HTTP nejprve projde technickým otiskováním – extrakcí vlastností prohlížeče, parametrů TLS, vzorců hlaviček HTTP a vlastností zařízení zjištěných JavaScriptem. Technický profil se pak obohatí o geolokační data, informace o ASN, skóre reputace IP a zpravodajství o hrozbách z OSINT. Behaviorální analýza sleduje vzorce navigace, rozložení časování požadavků, posloupnosti práce s formuláři a anomálie relací, aby odlišila lidské návštěvníky, automatizované scrapery, skenery zranitelností a sofistikované protivníky.

Klasifikační jádro HAWKEYE zařazuje návštěvníky do kategorií rizika (neškodný, podezřelý, škodlivý, neznámý) s příslušným skóre jistoty. Klasifikace vstupují do širšího bezpečnostního ekosystému platformy jako signály na úrovni návštěvníka pro rozhodování o řízení přístupu, politiky omezování rychlosti a postupy reakce na incidenty. Začlenění do architektury [Color Teams](@/glossary/color-teams.md) zajišťuje, že nálezy HAWKEYE zpracovávají obranní agenti [Blue Team](@/glossary/blue-team.md), korelují syntetické operace [Purple Team](@/glossary/purple-team.md) a testují je nepřátelské scénáře [Red Team](@/glossary/red-team.md).

## Technické podrobnosti

### Architektura otisků

HAWKEYE používá vrstvený přístup k otiskům, který kombinuje pasivní a aktivní techniky, aby vznikly profily odolné vůči podvržení:

| vrstva | technika | získávané signály | obtížnost podvržení |
|-------|-----------|-------------------|---------------------|
| **síťová** | analýza TCP/IP | otisk OS, MTU, TTL, velikost okna | střední |
| **TLS** | otisky JA3/JA3S | parametry TLS client hello, šifrovací sady | vysoká |
| **HTTP** | analýza hlaviček | User-Agent, Accept-Language, preference kódování | nízká |
| **prohlížeč** | sondování JavaScriptem | otisk canvas, renderer WebGL, písma, pluginy | středně vysoká |
| **behaviorální** | analýza interakcí | pohyb myši, dynamika stisků kláves, vzorce posouvání | velmi vysoká |

### Pipeline zpracování signálů

```
Raw Traffic --> Technical Fingerprint --> OSINT Enrichment --> Behavioral Analysis
                     |                        |                       |
                     v                        v                       v
              Device Profile          Threat Context           Intent Assessment
                     |                        |                       |
                     +------------------------+-----------------------+
                                              |
                                              v
                                    Composite Risk Score
                                    (confidence-weighted)
                                              |
                                              v
                                    Classification Decision
                                    [benign|suspicious|malicious|unknown]
```

### Modely behaviorálního profilování

HAWKEYE používá statistické modely, které rozlišují kategorie návštěvníků podle behaviorálních vzorců:

| chování | vzorec člověka | vzorec bota | vzorec skeneru |
|----------|---------------|-------------|-----------------|
| **časování požadavků** | proměnlivé, Poissonovo rozdělení | pevné intervaly, dávky | rychlé sekvenční |
| **navigace** | sleduje strukturu odkazů, vrací se | soustavné procházení bez návratů | cílené sondování koncových bodů |
| **pohyb myši** | Bézierovy křivky, mikrokorekce | žádný nebo lineární | žádný |
| **délka relace** | minuty až hodiny, proměnlivá | sekundy až minuty, předvídatelná | sekundy, soustavná |
| **chybové odpovědi** | vzácné, náhodné | střední, soustavné | četné, záměrné |

## Implementace na platformě Prismatic

HAWKEYE je implementován v aplikaci `prismatic_visitor_intelligence` v rámci umbrella architektury platformy. Systém využívá návrhové vzory OTP pro souběžné zpracování návštěvníků, sběr dat odolný vůči chybám a klasifikaci v reálném čase:

```elixir
defmodule PrismaticVisitorIntelligence.Classifier do
  @moduledoc """
  Visitor classification engine combining technical fingerprints,
  behavioral signals, and OSINT enrichment into risk assessments.
  """

  use GenServer

  alias PrismaticVisitorIntelligence.Fingerprint
  alias PrismaticVisitorIntelligence.BehaviorAnalyzer
  alias PrismaticVisitorIntelligence.OSINTEnricher
  alias PrismaticVisitorIntelligence.RiskScorer

  @type risk_category :: :benign | :suspicious | :malicious | :unknown
  @type classification :: %{
    category: risk_category(),
    confidence: float(),
    signals: list(map()),
    fingerprint_id: String.t()
  }

  @spec classify_visitor(map()) :: {:ok, classification()} | {:error, term()}
  def classify_visitor(visitor_data) do
    with {:ok, fingerprint} <- Fingerprint.extract(visitor_data),
         {:ok, enrichment} <- OSINTEnricher.enrich(fingerprint),
         {:ok, behavior} <- BehaviorAnalyzer.analyze(visitor_data.session),
         {:ok, score} <- RiskScorer.compute(fingerprint, enrichment, behavior) do
      classification = %{
        category: categorize(score),
        confidence: score.confidence,
        signals: score.contributing_signals,
        fingerprint_id: fingerprint.id
      }

      emit_telemetry(:classification, classification)
      {:ok, classification}
    end
  end

  defp categorize(%{risk_score: score}) when score < 0.2, do: :benign
  defp categorize(%{risk_score: score}) when score < 0.5, do: :suspicious
  defp categorize(%{risk_score: score}) when score < 0.8, do: :malicious
  defp categorize(_score), do: :unknown

  defp emit_telemetry(event, data) do
    :telemetry.execute(
      [:prismatic, :visitor_intelligence, event],
      %{timestamp: System.monotonic_time()},
      data
    )
  end
end
```

### Zacházení s daty v souladu s GDPR

HAWKEYE uplatňuje principy ochrany soukromí již od návrhu (*privacy by design*), aby splnil požadavky GDPR a zároveň zachoval účinnost zpravodajství:

```elixir
defmodule PrismaticVisitorIntelligence.Privacy do
  @moduledoc """
  GDPR-compliant data handling for visitor intelligence.
  Implements data minimization, retention controls, and anonymization.
  """

  @retention_period_days 30
  @anonymization_fields [:ip_address, :user_agent, :cookies]

  @spec anonymize_visitor_data(map()) :: map()
  def anonymize_visitor_data(visitor_data) do
    visitor_data
    |> hash_identifiers()
    |> strip_pii()
    |> apply_retention_metadata()
  end

  @spec purge_expired_records() :: {:ok, non_neg_integer()}
  def purge_expired_records do
    cutoff = DateTime.add(DateTime.utc_now(), -@retention_period_days, :day)

    {count, _} =
      PrismaticVisitorIntelligence.Repo.delete_all(
        from(v in VisitorRecord, where: v.inserted_at < ^cutoff)
      )

    {:ok, count}
  end
end
```

## Srovnání s alternativami

| vlastnost | HAWKEYE | tradiční WAF | komerční detekce botů | integrace SIEM |
|---------|---------|----------------|--------------------------|------------------|
| **behaviorální analýza** | spojení více signálů s hodnocením jistoty | porovnávání vzorů podle pravidel | modely strojového učení | korelace logů |
| **obohacení OSINT** | přes 250 poskytovatelů přes GARDEN (v době zápisu) | jen seznamy reputace IP | omezené kanály hrozeb | integrace vnějších kanálů |
| **soulad s ochranou soukromí** | GDPR od návrhu, minimalizace dat | podle dodavatele | podle dodavatele, často neprůhledné | podle SIEM |
| **hloubka integrace** | nativní OTP, Color Teams, NABLA | plugin/middleware | SDK/JavaScriptový tag | přeposílání logů |
| **klasifikace v reálném čase** | pod sekundu, vážená jistotou | milisekundy, binární povolit/zakázat | sekundy, podle skóre | minuty až hodiny |
| **epistemická důslednost** | soulad s [axiomy NABLA](@/glossary/nabla-axioms.md), sledování původu | žádná | proprietární modely | korelační pravidla |

Hlavní odlišností HAWKEYE je začlenění do epistemické infrastruktury platformy. Na rozdíl od komerčních alternativ, které vydávají neprůhledné rizikové skóre, nesou klasifikace HAWKEYE úplná metadata o původu, úrovně jistoty a přiřazení přispívajících signálů – analytik tak rozumí nejen tomu, co bylo rozhodnuto, ale i proč, což naplňuje axiom NABLA *Provenance Mandatory* (povinný původ).

## Osvědčené postupy

1. **Soulad se Signal Plurality:** nikdy nezařazovat návštěvníka podle jediného signálu. HAWKEYE vynucuje axiom tím, že před jakýmkoli hodnocením rizika vyžaduje nejméně dva nezávislé signály. Podezřelá IP adresa sama nestačí; musí být korelována s behaviorálními anomáliemi, nesrovnalostmi otisku nebo ukazateli hrozeb z OSINT.
2. **Odstupňovaná reakce:** reagovat úměrně klasifikaci rizika. Neškodní návštěvníci mají neomezený přístup, podezřelí čelí zesílenému sledování a výzvám CAPTCHA, škodliví jsou omezeni nebo zablokováni. Vyhýbat se binárním rozhodnutím povolit/zakázat, která vyvolávají kaskády falešně pozitivních nálezů.
3. **Průběžná kalibrace modelů:** pravidelně ověřovat přesnost klasifikace proti ověřeným datům. Podíl falešně pozitivních nálezů nad 1 % ukazuje na drift modelu, který vyžaduje rekalibraci. Přesnost klasifikace sleduje jako metriku kvality Quality Floor Guardian.
4. **Architektura s prioritou soukromí:** sbírat jen minimum dat nutných ke klasifikaci. Osobní identifikátory anonymizovat nebo hašovat už v místě sběru, ne dodatečně. Zavést automatické mazání dat podle nastavitelných dob uchování.
5. **Rozmanitost zdrojů OSINT:** udržovat různorodé zdroje obohacení, aby nevznikla závislost na jediném zdroji. Znalostní báze GARDEN zpřístupňuje přes 250 poskytovatelů, ale aktivní obměna zdrojů zajišťuje kvalitu zpravodajství i při výpadku nebo zhoršení kvality dat jednotlivých poskytovatelů.

## Případy užití

- **Ochrana útočné plochy:** HAWKEYE rozpoznává průzkumnou činnost (skenování portů, výčet adresářů, sondování zranitelností) podle behaviorálních vzorců skenerů. Včasné odhalení umožní obranu dřív, než dojde k pokusům o zneužití.
- **Správa botů:** odlišuje užitečné boty (crawlery vyhledávačů, monitorovací služby) od škodlivých (scrapery, *credential stuffing*, spamboti) behaviorálním otiskem, který jde dál než analýza řetězce User-Agent.
- **Korelace se zpravodajstvím o hrozbách:** IP adresy, ASN a behaviorální vzorce návštěvníků se pomocí OSINT korelují se známou infrastrukturou aktérů hrozeb, což umožňuje přiřadit průzkum konkrétním skupinám nebo kampaním.
- **Monitoring souladu:** HAWKEYE poskytuje auditní stopy činnosti návštěvníků, které splňují požadavky NIS2 a ISO 27001 na sledování přístupu a detekci incidentů. Rozhodnutí o klasifikaci se zapisují s úplným původem pro regulatorní přezkum.
- **Signály pro Blue Team:** klasifikace v reálném čase vstupují přímo do agenta `blue-signal-aggregator` modrého týmu a tvoří dimenzi zpravodajství o návštěvnících ve vícevrstvém obranném postoji platformy. Podezřelé vzorce spouštějí vyšetřovací postupy Blue Team.
- **Vstup do bezpečnostního hodnocení:** zpravodajství o návštěvnících přispívá k celkovému bezpečnostnímu hodnocení platformy; objem a sofistikovanost hrozeb zjištěných vůči aktivu ovlivňují jeho [risk score](@/glossary/risk-score.md) v systému [EASM](@/glossary/easm.md) Prismatic Perimeter.

## Pokročilé techniky otisků

Schopnosti otiskování HAWKEYE přesahují tradiční otisky prohlížeče a mají vytvořit identifikaci návštěvníka odolnou vůči pokusům o obejití.

### Otisky canvas a WebGL

```elixir
defmodule PrismaticVisitorIntelligence.BrowserFingerprint do
  @moduledoc """
  Advanced browser fingerprinting using canvas rendering and WebGL parameters
  to create unique device signatures.
  """

  @spec extract_canvas_fingerprint(map()) :: {:ok, String.t()} | {:error, term()}
  def extract_canvas_fingerprint(browser_data) do
    canvas_operations = [
      "fillText('Prismatic Platform Test', 10, 50)",
      "arc(100, 100, 50, 0, 2 * Math.PI)",
      "beginPath(); moveTo(0,0); lineTo(50,50); stroke()"
    ]

    canvas_hash =
      browser_data
      |> Map.get(:canvas_results, [])
      |> Enum.map(&hash_canvas_operation/1)
      |> Enum.join(":")
      |> sha256()

    webgl_parameters = extract_webgl_parameters(browser_data)

    composite_fingerprint = "#{canvas_hash}:#{webgl_parameters}"
    {:ok, composite_fingerprint}
  end

  defp extract_webgl_parameters(browser_data) do
    webgl_data = Map.get(browser_data, :webgl, %{})

    %{
      renderer: Map.get(webgl_data, :renderer, "unknown"),
      vendor: Map.get(webgl_data, :vendor, "unknown"),
      version: Map.get(webgl_data, :version, "unknown"),
      extensions: Map.get(webgl_data, :extensions, []) |> Enum.sort(),
      max_texture_size: Map.get(webgl_data, :max_texture_size, 0)
    }
    |> Jason.encode!()
    |> sha256()
  end
end
```

### Otisky na úrovni sítě

```elixir
defmodule PrismaticVisitorIntelligence.NetworkFingerprint do
  @moduledoc """
  TCP/IP and TLS-level fingerprinting for robust visitor identification
  even when browser fingerprints are spoofed.
  """

  @spec analyze_tcp_fingerprint(map()) :: map()
  def analyze_tcp_fingerprint(connection_data) do
    %{
      tcp_window_size: Map.get(connection_data, :window_size),
      mtu_discovery: analyze_mtu(connection_data),
      ttl_analysis: analyze_ttl_pattern(connection_data),
      tcp_options: extract_tcp_options(connection_data),
      timestamp_behavior: analyze_tcp_timestamps(connection_data)
    }
  end

  @spec extract_ja3_fingerprint(map()) :: String.t()
  def extract_ja3_fingerprint(tls_data) do
    # JA3 fingerprint: Version,Ciphers,Extensions,EllipticCurves,EllipticCurvePointFormats
    version = Map.get(tls_data, :version, "")
    ciphers = Map.get(tls_data, :cipher_suites, []) |> Enum.join("-")
    extensions = Map.get(tls_data, :extensions, []) |> Enum.sort() |> Enum.join("-")
    curves = Map.get(tls_data, :elliptic_curves, []) |> Enum.join("-")
    point_formats = Map.get(tls_data, :ec_point_formats, []) |> Enum.join("-")

    ja3_string = "#{version},#{ciphers},#{extensions},#{curves},#{point_formats}"
    Base.encode16(:crypto.hash(:md5, ja3_string), case: :lower)
  end

  defp analyze_mtu(%{packets: packets}) do
    packets
    |> Enum.map(&Map.get(&1, :size, 0))
    |> Enum.max()
    |> case do
      size when size <= 1500 -> :ethernet
      size when size <= 9000 -> :jumbo_frame
      _ -> :custom
    end
  end
end
```

## Modely strojového učení

HAWKEYE používá pro různé aspekty klasifikace návštěvníků několik modelů strojového učení.

### Detekce behaviorálních anomálií

```elixir
defmodule PrismaticVisitorIntelligence.BehaviorML do
  @moduledoc """
  Machine learning models for detecting behavioral anomalies
  in visitor interaction patterns.
  """

  @spec train_anomaly_detector(list(map())) :: {:ok, map()} | {:error, term()}
  def train_anomaly_detector(training_data) do
    # Feature extraction for behavioral analysis
    features = Enum.map(training_data, &extract_behavioral_features/1)

    # One-class SVM for anomaly detection
    model_config = %{
      algorithm: :one_class_svm,
      nu: 0.05,  # Expected anomaly rate
      kernel: :rbf,
      gamma: :scale
    }

    case MLTraining.train(features, model_config) do
      {:ok, trained_model} ->
        validation_score = cross_validate(features, trained_model)

        model_metadata = %{
          model: trained_model,
          training_size: length(features),
          validation_score: validation_score,
          trained_at: DateTime.utc_now(),
          feature_count: length(hd(features))
        }

        {:ok, model_metadata}

      error ->
        error
    end
  end

  defp extract_behavioral_features(session_data) do
    %{
      request_interval_mean: calculate_interval_statistics(session_data, :mean),
      request_interval_stddev: calculate_interval_statistics(session_data, :stddev),
      navigation_depth: Map.get(session_data, :max_depth, 0),
      unique_endpoints: session_data |> Map.get(:endpoints, []) |> Enum.uniq() |> length(),
      error_rate: calculate_error_rate(session_data),
      session_duration: Map.get(session_data, :duration_seconds, 0),
      mouse_movement_entropy: calculate_mouse_entropy(session_data),
      keyboard_typing_cadence: analyze_typing_patterns(session_data)
    }
    |> Map.values()
  end
end
```

## Výkon a škálování

### Výsledky zátěžových testů

HAWKEYE byl v prostředí platformy testován při různé zátěži (hodnoty v době zápisu):

| metrika | úroveň zátěže | výkon | spotřeba prostředků |
|--------|------------|-------------|----------------|
| **klasifikace za sekundu** | lehká (100 návštěvníků/min) | 50 klasifikací/s | 2 % CPU, 50 MB RAM |
| **klasifikace za sekundu** | střední (1 000 návštěvníků/min) | 400 klasifikací/s | 15 % CPU, 200 MB RAM |
| **klasifikace za sekundu** | vysoká (10 000 návštěvníků/min) | 2 500 klasifikací/s | 60 % CPU, 800 MB RAM |
| **průměrná doba klasifikace** | všechny úrovně | 1,2 ms | – |
| **doba klasifikace P99** | všechny úrovně | 8,5 ms | – |
| **paměť na profil návštěvníka** | – | 2,4 KB | úložiště ETS |

### Architektura horizontálního škálování

```elixir
defmodule PrismaticVisitorIntelligence.ClusterCoordinator do
  @moduledoc """
  Coordinates HAWKEYE operations across multiple nodes
  for horizontal scaling of visitor intelligence.
  """

  use GenServer

  @spec start_link(keyword()) :: GenServer.on_start()
  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @spec distribute_classification(String.t(), map()) :: :ok
  def distribute_classification(visitor_id, visitor_data) do
    target_node = select_processing_node(visitor_id)

    case target_node do
      node when node == node() ->
        # Process locally
        PrismaticVisitorIntelligence.classify_visitor_local(visitor_data)

      remote_node ->
        # Delegate to remote node
        :rpc.cast(remote_node, PrismaticVisitorIntelligence, :classify_visitor_local, [visitor_data])
    end

    :ok
  end

  defp select_processing_node(visitor_id) do
    # Consistent hashing for visitor distribution
    hash = :erlang.phash2(visitor_id)
    available_nodes = [node() | Node.list()]
    node_index = rem(hash, length(available_nodes))
    Enum.at(available_nodes, node_index)
  end

  @impl true
  def init(_opts) do
    # Setup node monitoring
    :net_kernel.monitor_nodes(true)

    state = %{
      active_nodes: [node() | Node.list()],
      node_capacities: %{},
      load_balancer: :consistent_hash
    }

    {:ok, state}
  end
end
```

## Soulad a audit

### Implementace souladu s GDPR

```elixir
defmodule PrismaticVisitorIntelligence.GDPRCompliance do
  @moduledoc """
  GDPR compliance implementation for visitor intelligence data handling.
  Provides data subject rights, consent management, and audit trails.
  """

  @spec handle_data_subject_request(String.t(), atom()) :: {:ok, map()} | {:error, term()}
  def handle_data_subject_request(visitor_id, request_type) do
    case request_type do
      :access ->
        retrieve_visitor_data(visitor_id)

      :deletion ->
        delete_visitor_data(visitor_id)

      :rectification ->
        {:error, :not_applicable}  # Behavioral data cannot be rectified

      :portability ->
        export_visitor_data(visitor_id)

      _ ->
        {:error, :invalid_request_type}
    end
  end

  @spec anonymize_for_analytics(map()) :: map()
  def anonymize_for_analytics(visitor_data) do
    # Remove direct identifiers, keep behavioral patterns
    visitor_data
    |> Map.drop([:ip_address, :user_agent, :session_id])
    |> Map.put(:visitor_hash, hash_visitor_identity(visitor_data))
    |> Map.put(:anonymized_at, DateTime.utc_now())
  end

  defp retrieve_visitor_data(visitor_id) do
    with {:ok, profile} <- PrismaticStorage.get(:visitor_profiles, visitor_id),
         {:ok, classifications} <- get_visitor_classifications(visitor_id),
         {:ok, sessions} <- get_visitor_sessions(visitor_id) do

      complete_record = %{
        profile: profile,
        classifications: classifications,
        sessions: sessions,
        data_sources: [:behavioral, :fingerprint, :osint],
        retention_period: "30 days",
        legal_basis: "legitimate_interest"
      }

      {:ok, complete_record}
    end
  end
end
```

## Další vývoj

### Pokročilé behaviorální modelování

Plánovaná rozšíření zahrnují modely hlubokého učení pro sofistikovanější behaviorální analýzu:

```elixir
defmodule PrismaticVisitorIntelligence.DeepLearning do
  @moduledoc """
  Future: Deep learning models for advanced behavioral pattern recognition
  using transformer architectures for sequence analysis.
  """

  # Planned implementation for behavioral sequence analysis
  @spec train_behavioral_transformer(list()) :: {:ok, map()}
  def train_behavioral_transformer(behavioral_sequences) do
    # Implementation planned for Q2 2026
    {:ok, %{status: :planned}}
  end
end
```

### Federované učení

Budoucí verze mají podporovat federované učení napříč více nasazeními platformy Prismatic se zachováním soukromí.

## Význam pro Kompendium

HAWKEYE je technický pojem platformy, v knize slouží jako příklad dvou věcí. Za prvé ukazuje princip, který Kompendium uplatňuje i na lidskou detekci EA: **žádné zařazení podle jediného signálu**, odstupňovaná reakce místo binárního verdiktu, průběžná kalibrace a záznam důvodů. Za druhé připomíná, že nástroje sledování mají **dvojí použití**: stejná technika, která chrání web před útočníkem, může v jiných rukou sloužit dohledu nad lidmi. Kompendium proto vyžaduje minimalizaci dat a účelové omezení, viz [Dual-use poznání](@/glossary/dual-use-poznani.md), [Panopticism](@/glossary/panopticism.md) a [Zuboff: dohledový kapitalismus](@/kompendium/07-teoreticke-reflexe/zuboff-surveillance-capitalism.md). Použití HAWKEYE v kontextu EA popisuje [HAWKEYE a zpravodajství o návštěvnících](@/kompendium/aiad-integration/hawkeye-ea-visitor-intelligence.md).

## Související

**Platforma**

- [EASM](@/glossary/easm.md) – správa vnější útočné plochy, která doplňuje zpravodajství o návštěvnících.
- [OSINT](@/glossary/osint.md) – metodika, z níž pocházejí zdroje obohacení.
- [Blue Team](@/glossary/blue-team.md) – obranný tým, který zpracovává signály HAWKEYE.
- [NABLA Infinity](@/glossary/nabla-infinity.md) – epistemický rámec určující požadavky na jistotu klasifikace.
- [Signal Plurality](@/glossary/signal-plurality.md) – axiom vyžadující více signálů pro zařazení.
- [Color Teams](@/glossary/color-teams.md) – rámec bezpečnostních operací, do něhož HAWKEYE patří.

**Kniha**

- [HAWKEYE a zpravodajství o návštěvnících](@/kompendium/aiad-integration/hawkeye-ea-visitor-intelligence.md) – použití v kontextu EA.
- [Dual-use poznání](@/glossary/dual-use-poznani.md) – etika nástrojů dvojího užití.
- [Ochrana narativu podle GDPR](@/kompendium/cross-domain/27-ea-compliance-gdpr-narrative-protection.md) – ochrana osobních údajů v kontextu EA.

**Mimo knihu**

- [Threat Intelligence](https://prismatic-reality-com.github.io/prismatic-promo/glossary/threat-intelligence/) – strukturovaná data o hrozbách.
- [Security Rating](https://prismatic-reality-com.github.io/prismatic-promo/glossary/security-rating/) – celkové hodnocení bezpečnostního postoje.
- [GDPR](https://prismatic-reality-com.github.io/prismatic-promo/glossary/gdpr/) – předpis o ochraně údajů, kterým se HAWKEYE řídí.
- [prismatic_visitor_intelligence](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/apps/prismatic_visitor_intelligence/README.md) – aplikace zpravodajství o návštěvnících.
- [prismatic_hawkeye](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/apps/prismatic_hawkeye/README.md) – jádro HAWKEYE.
- [prismatic_hawkeye_web](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/apps/prismatic_hawkeye_web/README.md) – webový přehled HAWKEYE.
- [prismatic_perimeter](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/apps/prismatic_perimeter/README.md) – doplňkový EASM pro vnější postoj.
- [prismatic_osint_core](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/apps/prismatic_osint_core/README.md) – obohacení profilů z OSINT.
- [prismatic_tracking](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/apps/prismatic_tracking/README.md) – infrastruktura behaviorálního sledování.
- [Architecture](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) – bezpečnostní architektura platformy.
- [Capabilities](https://prismatic-reality-com.github.io/prismatic-promo/capabilities/) – přehled bezpečnostních a zpravodajských schopností.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: hawkeye](@/kompendium/glossary-bridges/bridge-hawkeye.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
