+++
title = "Compliance Framework (rámec souladu)"
weight = 59
description = "Strukturovaný soubor regulatorních požadavků a kontrolních opatření, které musí organizace splnit (GDPR, NIS2, ISO 27001…); na platformě základ posouzení souladu."

[taxonomies]
tags = ["glossary", "security", "compliance", "prismatic", "legal"]

[extra]
category = "security"
related_terms = ["gdpr", "nis2", "zkb", "iso-27001", "security-rating"]
author = "Tomas Korcak (korczis)"
date_modified = "2026-11-10"
+++

## Definice a přehled

**Rámec souladu** (*compliance framework*) je strukturovaný soubor pokynů, předpisů
a kontrolních opatření, které musí organizace zavést, aby splnila zákonné, regulatorní nebo
oborové požadavky. Rámce určují, jaká bezpečnostní opatření jsou potřeba, jak je zavést a jak
se soulad posuzuje. K běžným rámcům patří GDPR (ochrana osobních údajů), NIS2 (bezpečnost sítí
a informací), ISO 27001 (řízení bezpečnosti informací), SOC 2 (kontroly servisních
organizací) a PCI DSS (odvětví platebních karet).

Rámce souladu spojují abstraktní bezpečnostní cíle s konkrétními, měřitelnými opatřeními.
Převádějí záměr zákonodárce („organizace musí chránit osobní údaje“) na konkrétní technické
a organizační požadavky („šifrovat data v klidu i při přenosu, uchovávat přístupové logy
12 měsíců, jednou ročně provádět penetrační test“). Tento převod je zásadní, protože dává
jasný, auditovatelný standard, podle něhož lze bezpečnostní stav organizace měřit.

Prostředí souladu je s rozšiřováním digitální regulace stále složitější. Organizace působící
ve více jurisdikcích musí současně splnit více překrývajících se rámců – GDPR pro ochranu
údajů v EU, NIS2 pro kybernetickou bezpečnost, místní předpisy jako český zákon
o kybernetické bezpečnosti a oborové standardy jako ISO 27001. Tato realita vyžaduje
automatizované nástroje, které umějí přiřadit technická zjištění k více regulatorním
požadavkům současně; to je úkolem modulu Prismatic Perimeter (viz [EASM](@/glossary/easm.md)).

**Vztah ke knize:** pojem patří do kontextu platformy, z níž Kompendium vzešlo. Pro knihu je
důležitá jeho stinná stránka – soulad „na papíře“, který vytváří zdání kontroly bez skutečné
ochrany (viz [Scam Compliance](@/glossary/scam-compliance.md)). Regulatorní screening
s ohledem na techniky EA popisuje stránka [Compliance: regulatorní
screening](@/kompendium/aiad-integration/compliance-ea-regulatory-screening.md); organizační
obranu kapitola [Organizační obrana](@/kompendium/organizational-defense/_index.md).

## Technický rozbor

### Taxonomie rámců

| Kategorie | Příklady | Vynucení | Sankce |
|----------|---------|-------------|-----------|
| regulatorní (povinné) | GDPR, NIS2, zákon o kybernetické bezpečnosti, HIPAA | zákonná povinnost | pokuty až 2–4 % celosvětového obratu |
| oborový standard | PCI DSS, SOC 2 | smluvní povinnost | ztráta obchodních vztahů |
| dobrovolný standard | ISO 27001, NIST CSF | dobrovolně přijatý | ztráta certifikace |
| vnitřní politika | bezpečnostní politiky firmy | organizační | kázeňská opatření |

### Kategorie kontrolních opatření

| Kategorie | Popis | Příklady opatření |
|----------|-------------|-----------------|
| řízení (governance) | organizační struktura a odpovědnost | bezpečnostní politika, role a odpovědnosti, řízení rizik |
| řízení přístupu | kdo smí k čemu přistupovat | autentizace, autorizace, správa oprávnění |
| ochrana dat | důvěrnost a integrita dat | šifrování, zálohy, klasifikace dat |
| síťová bezpečnost | ochrana síťové infrastruktury | firewally, segmentace, detekce průniku |
| reakce na incidenty | zvládání bezpečnostních incidentů | detekce, omezení, oznámení, obnova |
| kontinuita provozu | zachování činnosti při narušení | plánování obnovy, redundance, převzetí služeb |
| monitoring | sledování a záznam činnosti systémů | logování, výstrahy, auditní stopy |
| dodavatelský řetězec | řízení rizik třetích stran | posuzování dodavatelů, smluvní požadavky |

### Úrovně vyspělosti

| Úroveň | Název | Popis |
|-------|------|-------------|
| 1 | počáteční | nahodilá opatření, bez formálního rámce |
| 2 | rozvíjející se | rámec zvolen, opatření se zavádějí |
| 3 | definovaná | opatření zdokumentována a důsledně uplatňována |
| 4 | řízená | opatření měřena a sledována metrikami |
| 5 | optimalizující | průběžné zlepšování podle metrik a zpravodajství o hrozbách |

### Směrnice NIS2 (EU 2022/2555)

Směrnice o bezpečnosti sítí a informací 2 (NIS2) je hlavním předpisem EU v oblasti
kybernetické bezpečnosti a nahrazuje původní směrnici NIS:

| Hledisko | Podrobnost |
|--------|--------|
| rozsah | základní a důležité subjekty v 18 odvětvích |
| požadavky | řízení rizik, hlášení incidentů, bezpečnost dodavatelského řetězce |
| hlášení | významné incidenty: včasné varování do 24 hodin, oznámení do 72 hodin |
| sankce | u základních subjektů až 10 milionů EUR nebo 2 % celosvětového obratu |
| účinnost | lhůta pro transpozici členskými státy do října 2024 |
| klíčové články | čl. 21 (opatření k řízení rizik), čl. 23 (hlášení incidentů) |

### Český zákon o kybernetické bezpečnosti (ZKB)

Česká transpozice NIS2 s dalšími národními požadavky; platforma ji vede pod označením
„ZKB 264/2025 Sb.“ (číslo předpisu je údajem platformy, nikoli ověřenou citací této knihy):

| Hledisko | Podrobnost |
|--------|--------|
| rozsah | kritická infrastruktura, základní služby, důležité subjekty |
| dozorový orgán | NÚKIB (Národní úřad pro kybernetickou a informační bezpečnost) |
| požadavky | bezpečnostní dokumentace, posouzení rizik, zvládání incidentů |
| hlášení | v souladu s lhůtami NIS2 a se zvláštními požadavky NÚKIB |
| jazyk | dokumentace v češtině |
| audit | pravidelné audity |

## Architektura a implementace

### Engine posouzení souladu

```elixir
defmodule PrismaticPerimeter.Compliance.Engine do
  @moduledoc """
  Multi-framework compliance assessment engine.
  Evaluates discovered assets against framework requirements
  and maps technical findings to regulatory controls.
  """

  @frameworks [:nis2, :zkb, :iso27001, :gdpr]

  @spec assess(String.t(), [atom()]) :: {:ok, map()} | {:error, term()}
  def assess(target, frameworks \\ [:nis2, :zkb]) do
    with {:ok, assets} <- PrismaticPerimeter.discover(target),
         {:ok, findings} <- analyze_security_posture(assets) do
      assessments = Enum.map(frameworks, fn framework ->
        {framework, assess_framework(framework, findings)}
      end)

      {:ok, %{
        target: target,
        assessed_at: DateTime.utc_now(),
        frameworks: Map.new(assessments),
        overall_status: calculate_overall_status(assessments)
      }}
    end
  end

  defp assess_framework(:nis2, findings) do
    controls = PrismaticPerimeter.Compliance.NIS2.controls()

    Enum.map(controls, fn control ->
      evidence = evaluate_control(control, findings)
      %{
        article: control.article,
        requirement: control.description,
        status: evidence.status,
        evidence: evidence.details,
        remediation: if(evidence.status == :fail, do: control.remediation)
      }
    end)
  end

  defp assess_framework(:zkb, findings) do
    controls = PrismaticPerimeter.Compliance.ZKB.controls()
    Enum.map(controls, fn control ->
      evaluate_control(control, findings)
    end)
  end
end
```
### Mapování kontrolních opatření

```elixir
defmodule PrismaticPerimeter.Compliance.NIS2 do
  @moduledoc """
  NIS2 Directive control definitions and assessment logic.
  Maps Article 21 requirements to technical checks.
  """

  def controls do
    [
      %{
        article: "Art. 21(2)(a)",
        description: "Policies on risk analysis and information system security",
        checks: [:security_policy, :risk_assessment, :asset_inventory],
        remediation: "Implement documented security policy and risk assessment process"
      },
      %{
        article: "Art. 21(2)(b)",
        description: "Incident handling",
        checks: [:incident_response_plan, :detection_capability, :notification_process],
        remediation: "Establish incident response procedures with 24h notification capability"
      },
      %{
        article: "Art. 21(2)(c)",
        description: "Business continuity and crisis management",
        checks: [:backup_strategy, :dr_plan, :bcp_testing],
        remediation: "Implement and test business continuity and disaster recovery plans"
      },
      %{
        article: "Art. 21(2)(d)",
        description: "Supply chain security",
        checks: [:vendor_assessment, :dependency_scanning, :third_party_monitoring],
        remediation: "Assess and monitor supply chain security including dependencies"
      },
      %{
        article: "Art. 21(2)(e)",
        description: "Security in network and information systems acquisition",
        checks: [:secure_development, :vulnerability_management, :patch_management],
        remediation: "Implement secure development lifecycle and vulnerability management"
      },
      %{
        article: "Art. 21(2)(h)",
        description: "Policies and procedures regarding use of cryptography and encryption",
        checks: [:tls_configuration, :certificate_management, :key_management],
        remediation: "Deploy strong cryptography with proper key and certificate management"
      },
      %{
        article: "Art. 21(2)(j)",
        description: "Use of multi-factor authentication and continuous authentication",
        checks: [:mfa_deployment, :authentication_strength, :session_management],
        remediation: "Deploy MFA for all administrative and critical system access"
      }
    ]
  end
end
```
### Generování zprávy o souladu

```elixir
defmodule PrismaticPerimeter.Compliance.Report do
  @moduledoc """
  Generates compliance assessment reports for regulatory submission.
  """

  @spec generate(map(), atom()) :: {:ok, String.t()}
  def generate(assessment, format \\ :markdown) do
    report = """
    # Compliance Assessment Report
    ## Target: #{assessment.target}
    ## Date: #{DateTime.to_iso8601(assessment.assessed_at)}

    ## Executive Summary
    #{executive_summary(assessment)}

    ## Framework Assessments
    #{framework_details(assessment.frameworks)}

    ## Gap Analysis
    #{gap_analysis(assessment)}

    ## Remediation Roadmap
    #{remediation_roadmap(assessment)}

    ## Evidence Inventory
    #{evidence_inventory(assessment)}
    """

    {:ok, report}
  end

  defp executive_summary(assessment) do
    total_controls = count_controls(assessment.frameworks)
    passing = count_passing(assessment.frameworks)
    percentage = Float.round(passing / max(total_controls, 1) * 100, 1)

    """
    Overall compliance score: #{percentage}% (#{passing}/#{total_controls} controls passing)
    Status: #{assessment.overall_status}
    Frameworks assessed: #{Map.keys(assessment.frameworks) |> Enum.join(", ")}
    """
  end
end
```
## Použití v Prismatic Platform

Prismatic Perimeter implementuje posouzení souladu pro rámce NIS2 a ZKB s možností rozšíření
o další rámce.

### Dashboard souladu

Posouzení souladu je dostupné přes Phoenix LiveView na adrese `/perimeter/compliance`:

```elixir
defmodule PrismaticPerimeterWeb.ComplianceLive do
  use PrismaticPerimeterWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket,
      frameworks: [:nis2, :zkb],
      assessment: nil,
      loading: false
    )}
  end

  @impl true
  def handle_event("assess", %{"target" => target}, socket) do
    {:ok, assessment} = PrismaticPerimeter.assess_compliance(
      target,
      socket.assigns.frameworks
    )

    {:noreply, assign(socket, assessment: assessment, loading: false)}
  end
end
```
### Integrace přes API

```bash
# Assess compliance via REST API
curl -X POST http://localhost:4004/api/v1/perimeter/assess_compliance \
  -H "Content-Type: application/json" \
  -d '{"domain": "example.com", "frameworks": ["nis2", "zkb"]}'

# Response:
# {
#   "target": "example.com",
#   "overall_status": "partial_compliance",
#   "nis2": {"passing": 5, "failing": 2, "total": 7},
#   "zkb": {"passing": 4, "failing": 1, "total": 5}
# }
```
### Zasazení bezpečnostního hodnocení do kontextu

Bezpečnostní hodnocení (A–F, viz [Risk Score](@/glossary/risk-score.md)) se vykládá ve vztahu
ke konkrétním rámcům souladu:

| Hodnocení | Význam pro NIS2 | Význam pro ZKB |
|--------|-----------------|-----------------|
| A (850–900) | očekávaný plný soulad | očekávaný plný soulad |
| B (700–849) | drobné mezery, pravděpodobně v souladu | drobné mezery, doporučena náprava |
| C (550–699) | podstatné mezery, částečný soulad | podstatné mezery, riziko přezkumu NÚKIB |
| D (400–549) | významné mezery, nesoulad | významné mezery, riziko vynucovacích opatření |
| F (300–399) | kritické mezery, vynucení pravděpodobné | kritické mezery, nutný okamžitý zásah |

## Osvědčené postupy

1. **Posuzovat více rámců současně** – organizace mají obvykle více povinností; zjištění se
   v jednom průchodu přiřadí ke všem použitelným rámcům.
2. **Automatizovat sběr důkazů** – ruční sběr je pomalý, chybový a v době auditu už
   zastaralý. Ověřování technických opatření je třeba automatizovat.
3. **Udržovat průběžný soulad** – jednorázová posouzení vytvářejí falešný pocit bezpečí.
   Průběžné sledování odhalí posun mezi formálními posouzeními.
4. **Převádět technická zjištění na byznysové riziko** – mezery v souladu sdělovat jazykem
   regulatorního rizika (pokuty, vynucovací opatření), ne jen technických nedostatků.
5. **Verzovat politiky** – dokumentace souladu má být verzována, pravidelně revidována
   a aktualizována při změně předpisů (srov. [Cykly revize
   politik](@/kompendium/organizational-defense/8-policy-review-cycles.md)).
6. **Počítat s vývojem rámců** – předpisy se mění. Engine souladu má být rozšiřitelný, aby
   šlo přidávat nové rámce a požadavky bez změny architektury.

## Časté chyby

- **Soulad „na odškrtnutí“:** opatření zavedená kvůli auditu, ne kvůli skutečné ochraně.
  Vytvářejí falešný pocit bezpečí a selhávají při skutečných hrozbách. V krajní podobě jde
  o předstíraný soulad, který kniha popisuje jako [Scam Compliance](@/glossary/scam-compliance.md).
- **Bujení rámců:** snaha vyhovět příliš mnoha rámcům najednou bez jednotného mapování
  opatření. Doporučuje se hlavní rámec (např. NIST CSF), na který se ostatní mapují.
- **Zastaralá posouzení:** brát jednorázové posouzení jako trvalý stav. Infrastruktura
  i hrozby se mění průběžně; posouzení se musí opakovat.
- **Chybějící důkazy:** opatření existují, ale není doloženo, že fungují. Auditoři vyžadují
  důkaz, ne tvrzení (srov. [Chain of custody](@/glossary/chain-of-custody.md)).
- **Nevymezený rozsah:** nejasné, které systémy a data spadají pod který rámec. Přílišné
  rozšíření i zúžení rozsahu vytvářejí rizika.

## Související pojmy

Bez vlastního hesla v glosáři knihy: *GDPR*, *NIS2*, *ZKB*, *Security Rating* a *CVE*.
Plné znění směrnice NIS2 je dostupné na [EUR-Lex](https://eur-lex.europa.eu/eli/dir/2022/2555).

## Související

**Platforma**

- [EASM](@/glossary/easm.md) – správa vnější útočné plochy, která dodává data pro soulad.
- [Risk Score](@/glossary/risk-score.md) – skóre rizika vykládané ve vztahu k rámcům.
- [Due Diligence](@/glossary/due-diligence.md) – prověrka, v níž je soulad jedním z hledisek.
- [Sanctions Screening](@/glossary/sanctions-screening.md) – příbuzná regulatorní kontrola.

**Kompendium**

- [Scam Compliance](@/glossary/scam-compliance.md) – předstíraný soulad jako nástroj klamu.
- [Compliance: regulatorní screening](@/kompendium/aiad-integration/compliance-ea-regulatory-screening.md)
  – soulad s ohledem na techniky EA.
- [Organizační obrana](@/kompendium/organizational-defense/_index.md) – instituce odolné
  vůči manipulaci.
