+++
title = "EASM (správa vnější útočné plochy)"
weight = 25
description = "External Attack Surface Management: průběžné objevování, soupis a sledování vnějších digitálních aktiv organizace; na Prismatic Platform modul Prismatic Perimeter."

[taxonomies]
tags = ["glossary", "security", "easm", "prismatic", "osint"]

[extra]
category = "security"
abbreviation = "EASM"
related_app = "prismatic-perimeter"
related_terms = ["security-rating", "nis2", "zkb", "color-teams", "risk-score", "attack-surface", "censys", "hawkeye", "liveview", "osint", "sanctions-screening", "shodan", "threat-intelligence", "timescaledb"]
author = "Tomas Korcak (korczis)"
quality_score = 80
date_modified = "2026-11-10"
+++

## Definice

**EASM** (*External Attack Surface Management*, správa vnější útočné plochy) je disciplína
kybernetické bezpečnosti zaměřená na průběžné objevování, soupis, klasifikaci a sledování
zvenčí viditelných digitálních aktiv organizace. Patří k nim domény, subdomény, IP adresy,
certifikáty SSL/TLS, cloudové zdroje, integrace SaaS, vystavená API, poštovní servery
a jakékoli služby dostupné z internetu, na které by mohl útočník mířit. EASM poskytuje
organizaci pohled „zvenku dovnitř“ – stejný, jaký má útočník – a umožňuje odhalit a odstranit
slabá místa dřív, než budou zneužita.

Jako samostatná tržní kategorie se EASM ustálila kolem roku 2020. Hnacím motorem bylo rychlé
rozšiřování útočných ploch organizací přechodem do cloudu, množením služeb SaaS, „stínovým
IT“, fúzemi a akvizicemi a infrastrukturou pro práci na dálku. Tradiční správa zranitelností,
která předpokládá, že organizace ví, jaká aktiva má, přestala stačit, když se vnější stopa
typického podniku rozrostla o tisíce neznámých nebo nespravovaných aktiv. EASM tuto mezeru
zaplňuje průběžným objevováním aktiv zvenčí, bez vnitřního přístupu a bez instalace agentů.

**Vztah ke knize:** EASM patří do kontextu platformy, z níž Kompendium vzešlo (aplikace
Prismatic Perimeter). Jeho základní myšlenka – podívat se na sebe očima protivníka a najít,
co jsme sami přehlédli – má v knize lidskou obdobu v osobní a organizační sebeprověrce (viz
[Audit vztahů](@/kompendium/self-defense-guides/22-relationship-audit.md) a [Klasifikace
informací](@/kompendium/organizational-defense/27-information-classification.md)). Spojení
s technikami EA popisuje stránka [Perimetr: útočná plocha a
EA](@/kompendium/aiad-integration/perimeter-ea-attack-surface.md); [Color
Teams](@/glossary/color-teams.md) doplňují technickou plochu o epistemickou.

## Přehled

Vnější útočná plocha moderní organizace sahá daleko za hlavní doménu a známé rozsahy IP
adres. Nasazení stínového IT, zapomenutá vývojová prostředí, infrastruktura převzatých firem,
integrace SaaS třetích stran a cloudové zdroje založené jednotlivými týmy vytvářejí útočnou
plochu, která bývá výrazně větší, než o čem bezpečnostní tým ví. Platformy EASM tuto mezeru
v přehledu uzavírají automatizovaným, průběžným průzkumem.

Životní cyklus EASM je nepřetržitá smyčka čtyř fází:

| Fáze | Činnost | Výstup |
|-------|----------|--------|
| **objevení** | automatizovaný průzkum DNS, certifikátů, IP prostoru, cloudu a zdrojů OSINT | úplný soupis aktiv |
| **klasifikace** | třídění aktiv podle typu, vlastnictví, technologie a byznysové funkce | strukturovaná taxonomie aktiv |
| **posouzení** | bezpečnostní hodnocení každého aktiva: zranitelnosti, chybné konfigurace, mezery v souladu | skóre rizika a bezpečnostní hodnocení |
| **sledování** | průběžná detekce změn a výstrahy na nová vystavení nebo zhoršení stavu | bezpečnostní informace v reálném čase |

### Kontext trhu

EASM soutěží na trhu se zavedenými hráči i novými platformami. Hodnocení silných a slabých
stránek v tabulce je pohledem platformy v době zápisu:

| Dodavatel | Přístup | Odlišení | Omezení |
|--------|----------|---------------|------------|
| **BitSight** | hodnocení rizik třetích stran | velká databáze hodnocení, napojení na pojištění | omezená hloubka objevování aktiv |
| **SecurityScorecard** | platforma bezpečnostního hodnocení | široké zdroje dat, integrace dotazníků | neprůhledná metodika hodnocení |
| **Black Kite** | zpravodajství o kybernetickém riziku | finanční kvantifikace rizika | složitý cenový model |
| **[Censys](@/glossary/censys.md)** | internetové skenování + ASM | hluboké technické skenování, data výzkumné kvality | podnikové ceny |
| **Prismatic Perimeter** | EASM + soulad + OSINT | soulad s NIS2/ZKB, zpravodajství z otevřených zdrojů, architektura Elixir/BEAM | vázané na platformu |

## Technické podrobnosti

### Architektura objevování aktiv

Objevování probíhá v několika datových rovinách, z nichž každá přispívá jinými typy aktiv
a informací:

| Datová rovina | Zdroje | Objevená aktiva |
|-----------|---------|-------------------|
| **DNS** | autoritativní DNS, pasivní DNS, logy CT, zkoušení jmen | subdomény, poštovní a jmenné servery, řetězce CNAME |
| **certifikáty** | Certificate Transparency, handshaky SSL/TLS | domény na certifikátech, údaje o CA, data expirace |
| **IP/síť** | WHOIS, BGP, [Shodan](@/glossary/shodan.md), Censys, skenování portů | rozsahy IP, otevřené porty, běžící služby, bannery |
| **cloud** | API poskytovatelů cloudu, detekce konfigurace | buckety S3, bloby Azure, zdroje GCP, konfigurace CDN |
| **web** | procházení HTTP, identifikace technologií | webové aplikace, technologické zásobníky, vystavené cesty |
| **e-mail** | záznamy MX, analýza SPF/DKIM/DMARC | poštovní infrastruktura, konfigurace zabezpečení e-mailu |

### Metodika bezpečnostního hodnocení

Platformy EASM vytvářejí bezpečnostní hodnocení, které kvantifikuje vnější bezpečnostní stav
organizace. Metodika Prismatic Perimeter používá vážený bodovací systém (viz [Risk
Score](@/glossary/risk-score.md)):

```elixir
defmodule PrismaticPerimeter.SecurityRating do
  @moduledoc """
  Calculates security ratings (A-F, 300-900) from EASM assessment data.
  Weighted scoring across multiple security domains produces a composite grade.
  """

  @type rating :: %{
    grade: :A | :B | :C | :D | :F,
    score: 300..900,
    domain_scores: %{atom() => float()},
    industry_percentile: non_neg_integer(),
    assessed_at: DateTime.t()
  }

  @domain_weights %{
    network_security: 0.25,
    application_security: 0.20,
    dns_health: 0.15,
    email_security: 0.15,
    certificate_management: 0.10,
    patch_cadence: 0.10,
    information_leak: 0.05
  }

  @spec calculate([map()]) :: {:ok, rating()} | {:error, term()}
  def calculate(assets) when is_list(assets) and length(assets) > 0 do
    domain_scores =
      @domain_weights
      |> Enum.map(fn {domain, _weight} ->
        {domain, assess_domain(domain, assets)}
      end)
      |> Map.new()

    weighted_score =
      Enum.reduce(@domain_weights, 0.0, fn {domain, weight}, acc ->
        acc + Map.get(domain_scores, domain, 0.0) * weight
      end)

    numeric_score = normalize_to_range(weighted_score, 300, 900)

    {:ok, %{
      grade: score_to_grade(numeric_score),
      score: round(numeric_score),
      domain_scores: domain_scores,
      industry_percentile: calculate_percentile(numeric_score),
      assessed_at: DateTime.utc_now()
    }}
  end

  def calculate(_), do: {:error, :invalid_assets}

  defp score_to_grade(score) when score >= 850, do: :A
  defp score_to_grade(score) when score >= 700, do: :B
  defp score_to_grade(score) when score >= 550, do: :C
  defp score_to_grade(score) when score >= 400, do: :D
  defp score_to_grade(_score), do: :F

  defp normalize_to_range(value, min, max) do
    min + value * (max - min)
  end
end
```
### Integrace souladu

Data EASM vstupují přímo do posouzení regulatorního souladu (viz [Compliance
Framework](@/glossary/compliance-framework.md)). Prismatic Perimeter hodnotí stav organizace
podle více rámců:

| Rámec | Jurisdikce | Klíčové požadavky relevantní pro EASM |
|-----------|-------------|-------------------------------|
| **NIS2** (EU 2022/2555) | Evropská unie | řízení rizik, hlášení incidentů, bezpečnost dodavatelského řetězce |
| **ZKB** (podle platformy 264/2025 Sb.) | Česká republika | povinnosti v kybernetické bezpečnosti, ochrana kritické infrastruktury |
| **GDPR** (EU 2016/679) | Evropská unie | ochrana údajů, oznamování porušení, ochrana soukromí už při návrhu |
| **DORA** (EU 2022/2554) | Evropská unie | řízení rizik ICT ve finančním sektoru |

## Implementace v Prismatic Platform

Platforma implementuje EASM aplikací Prismatic Perimeter (v době zápisu dokončené MVP,
milník M46). Architektura spojuje souběžnost Elixir/OTP pro paralelní objevování aktiv
s Phoenix LiveView pro vizualizaci v reálném čase:

```elixir
defmodule PrismaticPerimeter do
  @moduledoc """
  External Attack Surface Management facade.
  Provides the primary API for asset discovery, security rating,
  and compliance assessment.
  """

  @spec discover(String.t(), keyword()) :: {:ok, map()} | {:error, term()}
  def discover(domain, opts \\ []) do
    techniques = Keyword.get(opts, :techniques, [:dns, :certificates, :web, :email])

    tasks =
      Enum.map(techniques, fn technique ->
        Task.async(fn ->
          apply(PrismaticPerimeter.Discovery, technique, [domain, opts])
        end)
      end)

    results =
      tasks
      |> Task.yield_many(:timer.minutes(5))
      |> Enum.flat_map(fn
        {_task, {:ok, {:ok, assets}}} -> assets
        {task, nil} -> Task.shutdown(task, :brutal_kill); []
        _ -> []
      end)

    {:ok, %{
      domain: domain,
      assets: results,
      asset_count: length(results),
      discovered_at: DateTime.utc_now()
    }}
  end

  @spec security_rating(String.t()) :: {:ok, map()} | {:error, term()}
  def security_rating(domain) do
    with {:ok, surface} <- discover(domain),
         {:ok, rating} <- PrismaticPerimeter.SecurityRating.calculate(surface.assets) do
      {:ok, rating}
    end
  end

  @spec assess_compliance(String.t(), [atom()]) :: {:ok, map()} | {:error, term()}
  def assess_compliance(domain, frameworks \\ [:nis2, :zkb]) do
    with {:ok, surface} <- discover(domain),
         {:ok, rating} <- security_rating(domain) do
      assessments =
        Enum.map(frameworks, fn framework ->
          {framework, PrismaticPerimeter.Compliance.assess(framework, surface, rating)}
        end)
        |> Map.new()

      {:ok, %{domain: domain, frameworks: assessments}}
    end
  end
end
```
### Trasy dashboardu

| Trasa | Účel | Technologie |
|-------|---------|-----------|
| `/perimeter` | hlavní dashboard s přehledovými metrikami | Phoenix LiveView |
| `/perimeter/assets` | soupis aktiv s filtrováním a hledáním | LiveView + Alpine.js |
| `/perimeter/compliance` | podrobné posouzení souladu podle rámců | LiveView |
| `/perimeter/easm` | pokročilý dashboard EASM s řízením objevování | LiveView |

## Srovnání s alternativami

| Schopnost | Prismatic Perimeter | BitSight | SecurityScorecard | Censys ASM |
|-----------|--------------------|-----------|--------------------|------------|
| objevování aktiv | DNS, certifikáty, web, e-mail | skenování sítě | více zdrojů | hloubkové skenování |
| bezpečnostní hodnocení | A–F (300–900) | 250–900 | 0–100 | není (skóre rizika) |
| soulad | NIS2, ZKB, GDPR | SOC2, ISO | NIST, SOC2 | omezený |
| dashboard v reálném čase | Phoenix LiveView | webový portál | webový portál | webový portál |
| integrace OSINT | nativní (v době zápisu 250+ poskytovatelů) | omezená | omezená | výzkumné kvality |
| architektura | Elixir/BEAM (odolná vůči chybám) | proprietární | proprietární | Go/Python |
| nasazení | vlastní provoz + Fly.io | jen SaaS | jen SaaS | jen SaaS |

## Osvědčené postupy

1. **Průběžné objevování:** spouštět objevování pravidelně (alespoň denně), ne jednorázově.
   Útočné plochy se mění s vývojem infrastruktury.
2. **Korelovat více zdrojů:** žádný jednotlivý zdroj nedá úplný přehled. Kombinovat výčet
   DNS, Certificate Transparency, pasivní DNS a aktivní skenování (viz [Signal
   Plurality](@/glossary/signal-plurality.md)).
3. **Zasadit zjištění do kontextu:** holé počty aktiv bez byznysového kontextu nic neznamenají.
   Aktiva třídit podle útvaru, kritičnosti, citlivosti dat a regulatorního rozsahu.
4. **Upřednostnit podle rizika:** ne všechna vystavení jsou stejná. Nápravu soustředit na
   aktiva s vysokým byznysovým dopadem a vysokou zneužitelností, ne jen na vysoká skóre
   závažnosti.
5. **Sledovat trendy:** sledovat vývoj hodnocení v čase, ne jen okamžitá skóre. Klesající
   trend ukazuje na systémové problémy, i když je absolutní skóre ještě přijatelné.
6. **Napojit na reakci na incidenty:** zjištění EASM mají vstupovat do postupů reakce na
   incidenty s jasným postupem posouzení, nápravy a ověření (srov. [Reakce na
   incidenty](@/kompendium/organizational-defense/31-incident-response-EA.md)).

## Případy užití

- **řízení rizik třetích stran** – posouzení bezpečnostního stavu dodavatelů, partnerů
  a článků dodavatelského řetězce vnějším pozorováním bez vnitřního přístupu a dotazníků;
- **prověrka při fúzích a akvizicích** – posouzení digitální bezpečnosti cílové firmy
  a odhalení skrytých závazků, technického dluhu a mezer v souladu před dokončením transakce
  (viz [Due Diligence](@/glossary/due-diligence.md));
- **průběžné sledování souladu** – udržování souladu s NIS2 a ZKB průběžným vnějším
  hodnocením a tvorba důkazů pro regulatorní audity;
- **odhalování stínového IT** – nalezení neschválených cloudových zdrojů, integrací SaaS
  a nasazení infrastruktury mimo povědomí bezpečnostního týmu;
- **ochrana značky** – odhalování překlepových domén, phishingové infrastruktury
  a neoprávněného užití značky organizace.

## Související pojmy

Bez vlastního hesla v glosáři knihy: *Security Rating*, *NIS2*, *ZKB*, *DNS Enumeration*,
*Attack Surface*, *Threat Intelligence*, *GDPR* a *Breach Database*. Původní heslo odkazovalo
i na dokumentaci aplikací platformy (`prismatic_perimeter`, `prismatic_osint_core`,
`prismatic_compliance` a další), která není součástí repozitáře knihy.

## Související

**Platforma**

- [Shodan](@/glossary/shodan.md) a [Censys](@/glossary/censys.md) – internetové skenery,
  z nichž objevování čerpá.
- [OSINT](@/glossary/osint.md) – zpravodajská metodika, na níž objevování stojí.
- [HAWKEYE](@/glossary/hawkeye.md) – zpravodajství o návštěvnících, doplněk vnějšího EASM.
- [Risk Score](@/glossary/risk-score.md) – hodnocení A–F, které EASM vytváří.
- [Compliance Framework](@/glossary/compliance-framework.md) – rámce, podle nichž se soulad
  posuzuje.
- [GreyNoise](@/glossary/greynoise.md) – rozlišení cíleného provozu od internetového šumu.

**Kompendium**

- [Perimetr: útočná plocha a EA](@/kompendium/aiad-integration/perimeter-ea-attack-surface.md)
  – vnější plocha v souvislosti s technikami EA.
- [Color Teams](@/glossary/color-teams.md) – epistemická útočná plocha vedle technické.
