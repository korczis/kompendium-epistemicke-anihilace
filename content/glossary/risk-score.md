+++
title = "Risk score (rizikové skóre)"
weight = 9
description = "Číselné hodnocení bezpečnostního rizika jednotlivého aktiva nebo zjištění v Prismatic Platform, vždy s mírou důvěry a řetězcem důkazů."

[taxonomies]
tags = ["glossary", "prismatic", "security", "due-diligence", "evidence"]

[extra]
category = "security"
related_terms = ["easm", "attack-surface", "signal-plurality", "confidence-scoring", "nabla-infinity", "provenance-mandatory", "monte-carlo-verification", "epistemic-robustness", "blue-team", "risk-score", "shodan", "censys", "greynoise"]
author = "Tomas Korcak (korczis)"
reading_time = "9 min"
word_count = 1794
date_created = "2026-02-23"
date_modified = "2026-11-10"
keywords = ["Risk", "Score", "Numeric", "glossary", "security", "Prismatic Platform", "Monte Carlo", "NABLA", "HARD"]
quality_score = 87
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "Risk score (rizikové skóre) – glosář"
+++

## Definice

Rizikové skóre (*risk score*) je číselná hodnota, která kvantifikuje bezpečnostní riziko
spojené s konkrétním aktivem, zjištěním nebo zranitelností. Na rozdíl od souhrnného
bezpečnostního hodnocení (*Security Rating*, které hodnotí celou organizaci známkou A až F) se
riziková skóre vztahují k jednotlivým položkám: konkrétnímu otevřenému portu, chybně nastavené
službě, prošlému certifikátu, zranitelnosti přenosu zóny DNS. Každé skóre obsahuje míru důvěry,
která vyjadřuje, jak jisté je posouzení, a řetězec důkazů, který skóre spojuje s konkrétními
pozorovatelnými daty v souladu s axiomem [povinné
provenience](https://prismatic-reality-com.github.io/prismatic-promo/glossary/provenance-mandatory/).

Riziková skóre jsou atomickými stavebními kameny systému bezpečnostního hodnocení Prismatic
Perimeter. Počítají se z pozorovatelných důkazů metodikou odpovídající principům CVSS (*Common
Vulnerability Scoring System*), upravenou pro pozorování výhradně zvenčí. Skóre se pak agregují,
váží podle kritičnosti aktiv a závažnosti zjištění, a vzniká celkové bezpečnostní hodnocení
A–F, s nímž pracují organizace, pracovníci compliance a analytici [due
diligence](@/glossary/due-diligence.md).

Epistemologické stanovisko zabudované do systému rizikového skórování zní: **riziko není jediné
číslo, ale rozdělení s nejistotou**. Rizikové skóre 72 s důvěrou 0,95 znamená něco zásadně
jiného než rizikové skóre 72 s důvěrou 0,45. První je dobře doložené posouzení, druhé
kvalifikovaný odhad. Prismatic Platform zachází se skóre i s jeho důvěrou jako s plnohodnotnými
daty, takže navazující spotřebitelé mohou rozlišit zjištění s vysokou důvěrou od předběžných
posouzení.

Pro Kompendium je rizikové skóre pojmem z kontextu platformy (bezpečnost infrastruktury, ne
hodnocení lidí). Kniha z něj přebírá jediný princip: číslo bez míry jistoty a bez dohledatelných
důkazů nemá rozhodovat o člověku – to platí i pro screeningové nástroje EA (viz [Riziko falešně
pozitivních detekcí](@/kompendium/critical-perspectives/5-false-positive-risk.md)).

## Metodika skórování

Metodika rizikového skórování pracuje s číselnou stupnicí 0–100, která se pro lidské čtenáře
převádí na známky. Zohledňuje více dimenzí rizika, z nichž každá přispívá do složeného skóre
váženým vzorcem.

### Číselná stupnice a převod na známky

| Rozsah skóre | Známka | Výklad | Typické rysy |
|-------------|-------|---------------|------------------------|
| 90–100 | A | výborné | minimální expozice, silná opatření, aktuální záplaty |
| 80–89 | B | dobré | drobné problémy, celkově dobře udržované |
| 70–79 | C | přiměřené | znatelné mezery, některé zastaralé služby |
| 60–69 | D | podprůměrné | významná expozice, více zjištění |
| 0–59 | F | kritické | závažné zranitelnosti, nutná urgentní náprava |

Alternativní stupnice používaná v některých kontextech je 300–900 (podobně jako úvěrová skóre),
kde A = 800–900, B = 700–799, C = 600–699, D = 500–599, F = 300–499. Skórovací engine podporuje
obě stupnice; interně se používá 0–100, stupnice 300–900 je k dispozici pro externí výkaznictví.

### Vícerozměrné rizikové faktory

Jednotlivá riziková skóre se počítají z několika pozorovatelných dimenzí:

| Dimenze | Váha | Zdroje důkazů | Příklady zjištění |
|-----------|--------|-----------------|-----------------|
| **Síťová expozice** | 25 % | skeny portů, bannery služeb | otevřené databázové porty, nešifrované služby |
| **Kryptografické postavení** | 20 % | analýza TLS, kontrola certifikátů | prošlé certifikáty, slabé šifry, chybějící HSTS |
| **Aktuálnost záplat** | 20 % | detekce verzí, korelace s CVE | zastaralý software, známé zranitelnosti |
| **Konfigurační hygiena** | 15 % | analýza hlaviček, záznamy DNS | chybějící bezpečnostní hlavičky, mezery v SPF/DKIM |
| **Únik informací** | 10 % | analýza obsahu, kontrola metadat | odhalené administrační panely, ladicí endpointy |
| **Signály reputace** | 10 % | korelace s blocklisty, databáze zneužití | IP na blocklistech, doména ve feedech hrozeb |

```elixir
defmodule PrismaticPerimeter.RiskScoring do
  @moduledoc """
  Computes risk scores from observable evidence with confidence tracking.
  Every score satisfies NABLA axioms: signal plurality, provenance, time decay.
  """

  @type risk_score :: %{
    score: 0..100,
    grade: :a | :b | :c | :d | :f,
    confidence: float(),
    dimensions: map(),
    evidence_chain: [evidence_ref()],
    computed_at: DateTime.t()
  }

  @dimension_weights %{
    network_exposure: 0.25,
    cryptographic_posture: 0.20,
    patch_currency: 0.20,
    configuration_hygiene: 0.15,
    information_leakage: 0.10,
    reputation_signals: 0.10
  }

  @spec compute(asset_id(), [finding()]) :: {:ok, risk_score()} | {:error, term()}
  def compute(asset_id, findings) do
    with {:ok, dimensions} <- score_dimensions(findings),
         {:ok, confidence} <- compute_confidence(findings),
         {:ok, composite} <- weighted_composite(dimensions) do
      {:ok, %{
        score: composite,
        grade: score_to_grade(composite),
        confidence: confidence,
        dimensions: dimensions,
        evidence_chain: extract_evidence_chain(findings),
        computed_at: DateTime.utc_now()
      }}
    end
  end

  defp score_to_grade(score) when score >= 90, do: :a
  defp score_to_grade(score) when score >= 80, do: :b
  defp score_to_grade(score) when score >= 70, do: :c
  defp score_to_grade(score) when score >= 60, do: :d
  defp score_to_grade(_score), do: :f

  defp weighted_composite(dimensions) do
    composite =
      @dimension_weights
      |> Enum.reduce(0.0, fn {dim, weight}, acc ->
        dim_score = Map.get(dimensions, dim, 100)
        acc + dim_score * weight
      end)
      |> round()

    {:ok, min(100, max(0, composite))}
  end
end
```

## Bezpečnostní hodnocení EASM

V kontextu [správy vnější útočné plochy](@/glossary/easm.md) (EASM, *External Attack Surface
Management*) se riziková skóre agregují do bezpečnostních hodnocení, která dávají celkový obraz
vnějšího bezpečnostního postavení organizace. Agregace má hierarchickou strukturu:

```
Organization Security Rating (A-F)
|
+-- Domain Risk Scores
|   +-- example.com: 82 (B)
|   +-- api.example.com: 67 (D)
|   +-- mail.example.com: 91 (A)
|
+-- IP Range Risk Scores
|   +-- 203.0.113.0/24: 75 (C)
|   +-- 198.51.100.0/24: 88 (B)
|
+-- Certificate Risk Scores
|   +-- *.example.com: 95 (A)
|   +-- legacy.example.com: 42 (F)
|
+-- Service Risk Scores
    +-- HTTPS (443): 90 (A)
    +-- SMTP (25): 71 (C)
    +-- MySQL (3306): 23 (F) -- exposed database!
```

Agregace uplatňuje vážení kritičnosti aktiv: zjištění na primární doméně váží víc než totéž
zjištění na vývojové subdoméně. Kritická produkční databáze má vyšší dopad než testovací
prostředí. Vážení zajišťuje, že souhrnné bezpečnostní hodnocení odpovídá skutečnému rizikovému
profilu a nezkreslují ho četná, ale bezvýznamná zjištění na nekritických aktivech.

## Důvěra podložená NABLA

Každé rizikové skóre v Prismatic Platform splňuje požadavky axiomů [NABLA
Infinity](@/glossary/nabla-infinity.md), čímž se rizikové skórování Prismatic zásadně liší od
běžných služeb bezpečnostního hodnocení:

| Axiom NABLA | Uplatnění v rizikovém skórování | Vynucení |
|-------------|---------------------------|-------------|
| **[Pluralita signálů](@/glossary/signal-plurality.md)** | zjištění musí potvrdit nejméně 2 nezávislé zdroje, než ovlivní skóre | TVRDÉ – zjištění z jediného zdroje jdou do karantény |
| **[Zachování rozporu](https://prismatic-reality-com.github.io/prismatic-promo/glossary/contradiction-preservation/)** | když jeden skener zranitelnost najde a jiný ne, zachovají se oba výsledky | TVRDÉ – rozpor snižuje důvěru |
| **[Časový rozpad](https://prismatic-reality-com.github.io/prismatic-promo/glossary/time-decay/)** | výsledky skenů starší 30 dní dostávají postupně nižší váhu | TVRDÉ – zastaralá zjištění se rozpadají k neutrální hodnotě |
| **[Povinná provenience](https://prismatic-reality-com.github.io/prismatic-promo/glossary/provenance-mandatory/)** | každé skóre jde dohledat ke konkrétním datům skenu zdokumentovaným řetězcem důkazů | TVRDÉ – skóre bez provenience se odmítají |
| **Nezávislost zdrojů** | skóre ze [Shodanu](@/glossary/shodan.md), [Censysu](@/glossary/censys.md) a [GreyNoise](@/glossary/greynoise.md) se váží podle nezávislosti zdrojů | MĚKKÉ – korelované zdroje dostanou slevu |

Výpočet důvěry zahrnuje všechny faktory souladu s axiomy:

```
confidence = base_confidence
  * signal_plurality_factor      (1.0 if 2+ sources, 0.5 if 1 source)
  * contradiction_factor         (1.0 if no contradictions, 0.7-0.9 if contradictions exist)
  * time_decay_factor            (1.0 if fresh, decays by ~2% per week)
  * source_independence_factor   (1.0 if fully independent, reduced for correlated sources)
```

Důvěra rizikového skóre tak přirozeně klesá s časem, s protichůdnými důkazy nebo při
nedostatečné rozmanitosti zdrojů. Spotřebitelé skóre mohou filtrovat podle prahu důvěry:
zpráva pro compliance může vyžadovat důvěru ≥ 0,80, zatímco přehled výstrah může zobrazovat
zjištění s důvěrou ≥ 0,50.

## Ověření metodou Monte Carlo

U kritických posouzení rizik (organizace posuzované kvůli akvizici, regulatornímu souladu nebo
strategickému partnerství) uplatňuje platforma [ověření Monte
Carlo](https://prismatic-reality-com.github.io/prismatic-promo/glossary/monte-carlo-verification/)
k validaci rozdělení rizikových skóre. Simulace Monte Carlo místo jediného bodového odhadu
vytváří rozdělení pravděpodobnosti možných rizikových skóre (srov. [QEVE](@/glossary/qeve.md)).

Postup simulace:

1. **Vzorkování důkazů**: pro každé zjištění vzorkovat z rozdělení důvěry (se zohledněním
   nejistoty měření, spolehlivosti zdroje a časového rozpadu).
2. **Narušení vah**: náhodně narušit váhy dimenzí v ověřených rozmezích (vyjadřuje nejistotu
   samotného modelu vážení).
3. **Agregace**: spočítat složené skóre pro každý pokus Monte Carlo.
4. **Analýza rozdělení**: po 10 000 a více pokusech analyzovat výsledné rozdělení skóre.

Výstup obsahuje:

| Metrika | Popis | Příklad |
|--------|-------------|---------|
| **Průměrné skóre** | průměr všech pokusů | 73,2 |
| **Medián skóre** | 50. percentil | 74 |
| **Dolní mez 95% IS** | 2,5. percentil | 68 |
| **Horní mez 95% IS** | 97,5. percentil | 79 |
| **Pravděpodobnost známky** | pravděpodobnost každé známky | C: 72 %, B: 18 %, D: 10 % |

Pravděpodobnostní přístup je cenný zejména pro due diligence, kde bodový odhad „známka C“ je
méně užitečný než vědomí „72% pravděpodobnost C, 18% pravděpodobnost B, 10% pravděpodobnost D“.
Rozdělení Monte Carlo zachycuje nejistotu, která je pozorování výhradně zvenčí vlastní.

## Uplatnění v due diligence

Riziková skóre mají v kontextu due diligence konkrétní účel: umožnit informovaná rozhodnutí
o obchodních vztazích (akvizice, partnerství, výběr dodavatelů) kvantifikací vnějšího
bezpečnostního postavení cíle. Případ užití v due diligence klade další požadavky nad rámec
běžného bezpečnostního monitorování a vytváří samostatný analytický rámec.

| Požadavek | Implementace | Zdůvodnění | Technické podrobnosti |
|-------------|---------------|-----------|-------------------|
| **Snímek k určitému datu** | skóre spočtená z důkazů shromážděných v definovaném okně posouzení | závěry due diligence musí odkazovat ke konkrétnímu datu | období sběru důkazů obvykle 7–14 dní pro úplné pokrytí |
| **Srovnávací benchmarking** | skóre obsahují percentil v odvětví | „známka C“ znamená v různých odvětvích různé věci | klasifikace odvětví podle kódů NAICS, rozdělení skóre srovnatelných subjektů |
| **Analýza trendu** | historická trajektorie skóre z dostupných datových bodů | pro posouzení rizika záleží na tom, zda se postavení zlepšuje, nebo zhoršuje | pokud jsou data, nejméně 90denní ohlédnutí, intervaly spolehlivosti trendu |
| **Materialita zjištění** | riziková zjištění tříděná podle materiality (kritická/významná/drobná) | ne všechna zjištění jsou pro obchodní rozhodnutí podstatná | hodnocení dopadu odvozené z CVSS s vážením obchodního kontextu |
| **Odhad nákladů nápravy** | zjištění obsahují odhad úsilí potřebného k nápravě | slouží k vyjednávání a úpravám ocenění v due diligence | nákladové modely podle typu zjištění, velikosti organizace a složitosti |

### Pokročilá analytika due diligence

Platforma poskytuje specializované analytické schopnosti pro scénáře due diligence s vysokými
sázkami:

```elixir
defmodule PrismaticPerimeter.DueDiligence do
  @moduledoc """
  Specialized risk scoring for merger & acquisition due diligence.
  Provides point-in-time snapshots with industry benchmarking.
  """

  @type assessment_report :: %{
    target_organization: String.t(),
    assessment_period: {Date.t(), Date.t()},
    overall_score: risk_score(),
    industry_benchmark: industry_comparison(),
    trend_analysis: trend_summary(),
    material_findings: [material_finding()],
    remediation_roadmap: remediation_plan()
  }

  def comprehensive_assessment(organization_id, industry_naics, assessment_window_days \\ 14) do
    assessment_period = {
      Date.add(Date.utc_today(), -assessment_window_days),
      Date.utc_today()
    }

    with {:ok, assets} <- discover_target_assets(organization_id, assessment_period),
         {:ok, findings} <- comprehensive_scan(assets, assessment_period),
         {:ok, scores} <- compute_asset_scores(findings),
         {:ok, benchmark} <- industry_benchmark_analysis(scores, industry_naics),
         {:ok, trends} <- historical_trend_analysis(organization_id, 90),
         {:ok, material} <- classify_material_findings(findings, organization_size(organization_id)),
         {:ok, roadmap} <- generate_remediation_roadmap(material) do

      {:ok, %{
        target_organization: organization_id,
        assessment_period: assessment_period,
        overall_score: aggregate_scores(scores),
        industry_benchmark: benchmark,
        trend_analysis: trends,
        material_findings: material,
        remediation_roadmap: roadmap,
        generated_at: DateTime.utc_now()
      }}
    end
  end

  defp industry_benchmark_analysis(target_scores, naics_code) do
    # Query historical assessments for same industry
    industry_scores = PrismaticStorage.query_industry_scores(naics_code, last_12_months: true)

    percentile = calculate_percentile(target_scores.overall, industry_scores)

    {:ok, %{
      industry_naics: naics_code,
      target_percentile: percentile,
      industry_median: Enum.median(industry_scores),
      industry_quartiles: quartiles(industry_scores),
      peer_count: length(industry_scores)
    }}
  end
end
```

### Rámec klasifikace materiality

Posouzení due diligence rozlišuje zjištění podstatná pro obchodní rozhodnutí od těch, která
představují běžnou bezpečnostní hygienu:

**Kritická (blokují obchod)**:

- odhalené databáze obsahující osobní údaje;
- indikátory aktivního zneužívání ve zpravodajství o hrozbách;
- zranitelnosti kritické infrastruktury (CVSS ≥ 9,0);
- vypršení certifikátu v průběhu transakce.

**Významná (ovlivňují ocenění)**:

- významné kryptografické slabiny (slabé TLS, prošlé certifikáty);
- neopravené zranitelnosti s veřejnými exploity;
- otevřené služby u kritických obchodních aplikací;
- mezery v regulatorním souladu (GDPR, SOX apod.).

**Drobná (vyžadují monitorování)**:

- odhalení informací (bannery serverů, ladicí stránky);
- chybějící bezpečnostní hlavičky;
- zastaralé verze softwaru bez aktivních exploitů;
- zlepšení konfigurace DNS.

Klasifikace přímo ovlivňuje strukturu obchodu: kritická zjištění mohou transakci zablokovat
nebo vyžadovat zádržné na úschovném účtu, významná ovlivňují vyjednávání o ocenění a drobná se
stávají součástí plánu integrace.

## Vztah ke skórování důvěry

[Skórování důvěry](https://prismatic-reality-com.github.io/prismatic-promo/glossary/confidence-scoring/)
a rizikové skórování jsou v Prismatic Platform příbuzné, ale odlišné pojmy:

| Dimenze | Rizikové skóre | Skóre důvěry |
|-----------|-----------|-----------------|
| **Co měří** | jak rizikové je aktivum/zjištění? | jak jistí si jsme tvrzením? |
| **Stupnice** | 0–100 (vyšší = bezpečnější) | 0,0–1,0 (vyšší = jistější) |
| **Předmět** | aktivum, zjištění nebo organizace | přesvědčení, tvrzení nebo posouzení |
| **Řídí se** | metodikou bezpečnostního hodnocení | axiomy [NABLA Infinity](@/glossary/nabla-infinity.md) |
| **Může být nejisté?** | ano – právě to vyjadřuje skóre důvěry | ne – důvěra je sama mírou nejistoty |

Každé rizikové skóre nese skóre důvěry. Rizikové skóre říká „tento port je nebezpečný“ (jak
rizikové), skóre důvěry říká „tímto posouzením jsme si jisti z 87 %“ (jak jisté). Společně
dávají posouzení i metaposouzení jeho spolehlivosti.

## Vztah k epistemické robustnosti

[Epistemická robustnost](https://prismatic-reality-com.github.io/prismatic-promo/glossary/epistemic-robustness/)
měří, jak dobře rizikové skóre odolá útočnému zpochybnění. Rizikové skóre je epistemicky
robustní, pokud by přežilo epistemické útoky [Red Teamu](@/glossary/red-team.md): zkreslení
pravdy, manipulaci důvěry, otrávení signálů, navození posunu a únos výraznosti.

### Rámec ověření robustnosti

Platforma implementuje vícevrstvý ověřovací systém, který zajišťuje, že riziková skóre si
zachovají epistemickou integritu i v útočných podmínkách:

```elixir
defmodule PrismaticPerimeter.EpistemicValidation do
  @moduledoc """
  Validates risk score epistemic robustness through Blue Team defensive protocols.
  Implements multi-layer verification against the 5 epistemic attack primitives.
  """

  @attack_primitives [
    :truth_distortion,      # Manipulating source data to skew risk perception
    :confidence_manipulation, # Artificially inflating/deflating certainty levels
    :signal_poisoning,      # Injecting false signals into evidence streams
    :drift_induction,       # Gradually shifting baselines through persistent manipulation
    :salience_hijacking     # Redirecting attention to irrelevant or manufactured findings
  ]

  def validate_robustness(risk_score, evidence_chain) do
    validation_results =
      @attack_primitives
      |> Enum.map(fn primitive ->
        {primitive, test_resistance(risk_score, evidence_chain, primitive)}
      end)
      |> Enum.into(%{})

    overall_robustness = compute_robustness_score(validation_results)

    {overall_robustness, validation_results}
  end

  defp test_resistance(risk_score, evidence_chain, :truth_distortion) do
    # Test how score changes if individual evidence items are perturbed
    perturbation_tests =
      evidence_chain
      |> Enum.map(fn evidence ->
        perturbed_score = compute_with_perturbed_evidence(evidence, risk_score)
        abs(perturbed_score.score - risk_score.score)
      end)

    max_deviation = Enum.max(perturbation_tests)
    %{resistance: 1.0 - (max_deviation / 100), max_deviation: max_deviation}
  end

  defp test_resistance(risk_score, evidence_chain, :signal_poisoning) do
    # Test robustness against additional false signals
    false_signals = generate_adversarial_signals(evidence_chain)
    poisoned_score = compute_with_additional_evidence(risk_score, false_signals)

    deviation = abs(poisoned_score.score - risk_score.score)
    %{resistance: 1.0 - (deviation / 100), signal_impact: deviation}
  end
end
```

[Blue Team](@/glossary/blue-team.md) robustnost rizikových skóre průběžně ověřuje:

- **agregací signálů** – ověřuje, že každé zjištění podporuje více nezávislých zdrojů,
  a vzájemně koreluje zjištění ze Shodanu, Censysu a GreyNoise kvůli odhalení nesrovnalostí;
- **detekcí posunu** – sleduje postupné podprahové změny, které by mohly skóre manipulovat,
  a statistickým řízením procesu odhaluje posuny výchozího stavu;
- **monitorováním autentizačních hranic** – zajišťuje, že zdroje dat nebyly kompromitovány:
  ověřuje odpovědi API, hledá neočekávané vzorce dat a sleduje metriky zdraví zdrojů;
- **syntézou důkazů** – vytváří strukturované důkazní artefakty místo prostých posouzení
  založených na výstrahách a udržuje úplné auditní stopy od surových dat skenu po konečná skóre;
- **validací napříč časem** – srovnává stabilitu rizikových skóre ve více oknech posouzení
  a odhaluje pokusy o manipulaci;
- **analýzou korelace zdrojů** – odhaluje, když údajně nezávislé zdroje dávají podezřele
  podobné výsledky, což ukazuje na možnou kompromitaci nebo koordinaci.

### Prahy robustnosti a akce

Riziková skóre, která neprojdou kontrolami epistemické robustnosti, podléhají stupňovaným
protokolům reakce:

| Skóre robustnosti | Akce | Autorita | Časový rámec |
|------------------|--------|-----------|----------|
| **0,90–1,00** | publikovat normálně | automaticky | v reálném čase |
| **0,75–0,89** | publikovat s varováním o robustnosti | Blue Team | 1–4 hodiny |
| **0,60–0,74** | pozdržet k syntéze Purple Teamu | Purple Team | 4–24 hodin |
| **pod 0,60** | karanténa do prošetření | triáda Red–Blue–Purple | ruční přezkum |

Riziková skóre, která kontrolami epistemické robustnosti neprojdou, se označí sníženou důvěrou
a před publikací se směrují k [Purple Teamu](@/glossary/purple-team.md) k syntéze a ověření.
Purple Team provede obousměrné mapování mezi útočnými scénáři Red Teamu a obrannými důkazy Blue
Teamu, aby určil, zda selhání robustnosti představuje skutečnou nejistotu, nebo systematický útok.

## Související

**Pojmy platformy v tomto glosáři**

- [EASM](@/glossary/easm.md) – správa vnější útočné plochy, která dodává položky ke skórování.
- [Signal Plurality](@/glossary/signal-plurality.md) – axiom vyžadující více zdrojů důkazů.
- [NABLA Infinity](@/glossary/nabla-infinity.md) – epistemický rámec kvality důkazů.
- [Blue Team](@/glossary/blue-team.md) – obranný tým, který ověřuje integritu skóre.
- [Shodan](@/glossary/shodan.md), [Censys](@/glossary/censys.md),
  [GreyNoise](@/glossary/greynoise.md) – vnější skenery: síťová expozice, certifikáty
  a služby, kontext internetového šumu.
- [Sanctions Screening](@/glossary/sanctions-screening.md) – další vrstva rizikového posouzení
  v due diligence.

**Hesla a přehledy platformy mimo tuto knihu**

- [Attack Surface](https://prismatic-reality-com.github.io/prismatic-promo/glossary/attack-surface/),
  [Confidence Scoring](https://prismatic-reality-com.github.io/prismatic-promo/glossary/confidence-scoring/),
  [Provenance Mandatory](https://prismatic-reality-com.github.io/prismatic-promo/glossary/provenance-mandatory/),
  [Monte Carlo Verification](https://prismatic-reality-com.github.io/prismatic-promo/glossary/monte-carlo-verification/),
  [Epistemic Robustness](https://prismatic-reality-com.github.io/prismatic-promo/glossary/epistemic-robustness/),
  [Contradiction Preservation](https://prismatic-reality-com.github.io/prismatic-promo/glossary/contradiction-preservation/).
- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/),
  [Technologie](https://prismatic-reality-com.github.io/prismatic-promo/technologies/),
  [Schopnosti](https://prismatic-reality-com.github.io/prismatic-promo/capabilities/).

**Kniha**

- [Perimeter a detekce EA](@/kompendium/aiad-integration/perimeter-ea-attack-surface.md) –
  útočná plocha z pohledu epistemických útoků.
- [EA × Due Diligence: Evidence Quality Tiering](@/kompendium/cross-domain/15-ea-dd-evidence-quality-assessment.md) –
  stupňování kvality důkazů.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)
