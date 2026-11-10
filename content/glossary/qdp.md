+++
title = "QDP (body dluhu kvality)"
weight = 11
description = "Quality Debt Points – metrika Prismatic Platform, v níž se každé porušení kvality kódu počítá jako dluh; v době zápisu platforma uváděla 0 QDP."

[taxonomies]
tags = ["glossary", "prismatic", "quality", "architecture", "doctrine"]

[extra]
category = "quality"
acronym = "QDP"
technical_domain = "Quality Engineering"
complexity_level = "Advanced"
platform_relevance = "Critical"
related_terms = ["cascade", "cascade-pattern", "clean-run", "autoheal", "autoevolve", "code-coverage", "typespec", "dialyzer", "qdp"]
elixir_libraries = ["credo", "dialyxir", "ex_unit", "stream_data"]
phoenix_integration = "Indirect - quality gates run before deployment of Phoenix applications"
beam_specific = false
prismatic_modules = ["PrismaticSafety.QualityFloorGuardian", "Mix.Tasks.Quality.Gates", "Mix.Tasks.Quality.ForbiddenPatterns"]
total_qdp = 0
total_eliminated = 905
quality_domains = 13
enforcement_layers = 6
cascade_phases = 4
industry_comparison = "SonarQube, Code Climate, Coveralls"
first_introduced = "Gen 3"
last_updated = "2026-02-22"
author = "Tomas Korcak (korczis)"
date_created = "2026-02-23"
date_modified = "2026-11-10"
keywords = ["QDP", "Quality", "Debt", "Points", "Current", "glossary", "Prismatic Platform", "Missing", "High", "Medium"]
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "QDP (body dluhu kvality) – glosář"
+++

## Definice

QDP (*Quality Debt Points*, body dluhu kvality) je kvantitativní metrika Prismatic Platform pro
sledování dluhu kvality kódu. Každé porušení kvality – chybějící
[typespec](https://prismatic-reality-com.github.io/prismatic-promo/glossary/typespec/),
nebezpečný přístup do mapy, antivzorec `length() > 0`, chybějící anotace `@impl`, varování při
kompilaci, porušení Credo (srov. [Clean Run](@/glossary/clean-run.md)) – se podle závažnosti
počítá jako jeden nebo více QDP. Metrika dává jediné číselné skóre celkového nahromaděného
dluhu kvality v kódové základně, a činí tak dluh kvality viditelným, měřitelným a řešitelným.
Na rozdíl od vágních kvalitativních hodnocení („kód by potřeboval trochu uklidit“) dává QDP
přesné, reprodukovatelné číslo, které lze sledovat v čase, srovnávat mezi sezeními a použít
jako podmínku bran v pipeline průběžné integrace.

QDP je modelován podle finančního technického dluhu (viz [Quality Debt](@/glossary/quality-debt.md)):
každé porušení představuje „půjčku“ vzatou z kvality kódu, kterou je nakonec třeba
„splatit“. Na rozdíl od finančního dluhu se dluh kvality úročí tiše a nelineárně – chybějící
typespec dnes znamená typovou chybu zítra, chybějící anotace `@impl` regresi callbacku příští
týden, nebezpečný přístup do mapy pád v produkci příští měsíc. Kvůli tomuto úročení není
100 QDP jen dvakrát horší než 50 QDP; interakce mezi porušeními vytvářejí emergentní způsoby
selhání, které jsou horší než součet jednotlivých problémů. Chybějící typespec u funkce, která
používá nebezpečný přístup do mapy, vytváří dvojí slepé místo, kde před chybami nechrání ani
statická analýza, ani běhová bezpečnost. QDP kvantifikuje toto nahromaděné riziko jedním
číslem a umožňuje řízení kvality opřené o data, analýzu trendů a vynucení.

Podle dokumentace platformy byl v době zápisu stav QDP **0**, tedy úplné odstranění všech
sledovaných kategorií dluhu kvality napříč 115 aplikacemi umbrelly; rozsah kódu dokumentace na
tomto místě uváděla kolem 99 800 řádků (jinde se uvádějí jiná čísla, proto je berte jen
orientačně). Stavu se dosáhlo systematickým uplatněním vzorů
[CASCADE](https://prismatic-reality-com.github.io/prismatic-promo/glossary/cascade-pattern/),
které ve strukturované, měřitelné kampani o čtyřech fázích odstranily 905 QDP. Stav nulového
QDP se nyní vynucuje pre-commit hooky, branami CI/CD a Quality Floor Guardian, takže je
strukturně nemožné zavést nový dluh kvality bez výslovného přiznání a okamžité nápravy.

Pro Kompendium je QDP pojmem z kontextu platformy. Kniha z něj přebírá jen princip, že
nedostatek se má počítat a viditelně evidovat, ne skrývat – v knize mu odpovídají kontroly
informační architektury a sestavení, které nesmějí stav zhoršit.

## Metodika skórování QDP

Každá oblast kvality přispívá QDP podle závažnosti porušení a možného dopadu na spolehlivost
v produkci:

| Závažnost | QDP za porušení | Příklady | Zdůvodnění |
|----------|------------------|---------|-----------|
| **Kritická (P0)** | 5 QDP | nebezpečný přístup do mapy v produkční cestě, vzor úniku paměti, chybějící ošetření chyb u externích volání | může způsobit pád v produkci nebo ztrátu dat |
| **Vysoká (P1)** | 3 QDP | chybějící typespec u veřejné funkce, varování při kompilaci, chybějící regresní test | blokuje statickou analýzu nebo skrývá vady |
| **Střední (P2)** | 2 QDP | chybějící anotace @impl, porušení složitosti v Credo, problém s přesností DateTime | snižuje udržovatelnost nebo správnost |
| **Nízká (P3)** | 1 QDP | porušení stylu, drobný problém Credo, TODO bez kontextu, chybějící guard | snižuje čitelnost nebo vytváří malé riziko |

Skórování je v rámci jedné oblasti aditivní, napříč souvisejícími oblastmi multiplikativní.
Má-li funkce chybějící typespec (3 QDP) i nebezpečný přístup do mapy (5 QDP), je efektivní dluh
vyšší než 8 QDP, protože [Dialyzer](https://prismatic-reality-com.github.io/prismatic-promo/glossary/dialyzer/)
nemůže nebezpečný přístup bez typespecu ochránit. Tento interakční efekt zachycuje složený
skórovací algoritmus Quality Floor Guardian.

## Oblasti kvality (všechny s nulou porušení)

Třináct oblastí kvality sledovaných QDP pokrývá celé spektrum kvality kódu, od typové
bezpečnosti přes běhové chování po dokumentaci (stav v době zápisu):

| Oblast | Co sleduje | Metoda detekce | Dopad na QDP | Porušení |
|--------|----------------|-----------------|-----------|------------|
| **Dialyzer** | porušení typového systému | statická analýza (Dialyzer PLT) | kritický/vysoký | 0 |
| **Credo** | styl a složitost kódu | analyzátor Credo (`--strict`) | střední/nízký | 0 |
| **Kompilace** | varování kompilátoru | `--warnings-as-errors` | vysoký | 0 |
| **Přesnost DateTime** | chybná práce s časem | detekce vzorů | střední | 0 |
| **Guard funkce** | chybějící nebo chybné guardy | analýza AST | střední | 0 |
| **Pokrytí @impl** | chybějící implementační anotace | analýza modulů (709 zkontrolováno) | střední | 0 |
| **Paměťová bezpečnost** | možné úniky paměti | detekce vzorů | kritický | 0 |
| **Výkon** | O(n) tam, kde je možné O(1) | detekce vzorů (potenciál zrychlení 90–250×) | vysoký | 0 |
| **Prevence regresí** | chybějící regresní testy | analýza pokrytí testy | vysoký | 0 |
| **Časové vzory** | antivzorce `Process.sleep` | porovnávání vzorů v AST | střední | 0 |
| **Správa TODO** | nevyřešené TODO/FIXME | prohledávání komentářů | nízký | 0 |
| **Pokrytí typespecy** | chybějící anotace @spec | introspekce modulů | vysoký | 0 |
| **Nebezpečný přístup do mapy** | `map.key` místo `Map.get` | porovnávání vzorů v AST | kritický | 0 |

## Kampaň odstranění 905 QDP

Odstranění 905 QDP je jedním z charakteristických úspěchů platformy v oblasti kvality.
Kampaň použila vzory CASCADE – systematické odstraňování kategorie po kategorii s ověřením
v každé fázi. Každá fáze cílila na konkrétní kategorie porušení, měřila pokrok kvantitativně
a ověřovala, že opravy nezavedly regrese:

| Vzor CASCADE | Odstraněno QDP | Popis |
|----------------|---------------|-------------|
| **Type Mismatch** | ~200 QDP | vyřešena varování Dialyzeru ve všech aplikacích, doplněny chybějící typespecy |
| **Dead Code** | ~150 QDP | odstraněn nedosažitelný kód, nepoužívané funkce a osiřelé moduly |
| **Empty Check** | ~180 QDP | `length() > 0` nahrazeno `Enum.any?/1` a porovnáváním se vzorem |
| **Timer Replacement** | ~75 QDP | `Process.sleep` nahrazen správnými vzory časovačů a timeouty GenServeru |
| **Nuclear Cache** | ~100 QDP | opraveny vzory zastaralé cache v adresáři `_build`, které působily fantomová varování |
| **Ostatní vzory** | ~200 QDP | doplnění typespeců, anotací @impl, opravy guardů, bezpečnost přístupu do map |

```
QDP Timeline:
905 QDP ----[CASCADE Phase 1]----> 600 QDP   (Type Mismatch + Dead Code)
600 QDP ----[CASCADE Phase 2]----> 300 QDP   (Empty Check + Timer Replacement)
300 QDP ----[CASCADE Phase 3]----> 100 QDP   (Nuclear Cache + Typespecs)
100 QDP ----[CASCADE Phase 4]---->  25 QDP   (@impl + Guards + Memory Safety)
 25 QDP ----[Final Sprint]------->   0 QDP   (COMPLETE ELIMINATION)
```

Každá fáze postupovala podle přísného protokolu: najít všechna porušení v cílové kategorii,
vytvořit [regresní testy](@/glossary/regression-test.md) pro ta nejkritičtější, provést
opravy, ověřit nulu regresí a aktualizovat Quality DNA novým výchozím stavem. Zvlášť
pozoruhodná byla fáze Nuclear Cache – přibližně 100 QDP byla fantomová porušení způsobená
zastaralými artefakty kompilace v adresáři `_build`. Opravou byl příkaz „nuclear cache“:
`rm -rf _build/dev/lib/prismatic_claude/ebin && rm -rf priv/plts/dialyzer.plt`, který si vynutil
čisté sestavení a odhalil skutečný počet porušení.

Poučení z této fáze má obecnou platnost i mimo software: část „problémů“ může být artefaktem
měřicího nástroje, a ne skutečností – proto se měření samo musí ověřovat (srov. [Signal
Plurality](@/glossary/signal-plurality.md)).

## Infrastruktura vynucení

QDP se vynucuje na několika úrovních, což vytváří hloubkovou obranu, jež činí regresi kvality
prakticky nemožnou:

| Vrstva vynucení | Mechanismus | Spouštěč | Obchvat povolen |
|------------------|-----------|---------|----------------|
| **Pre-commit hooky** | `.githooks/pre-commit-quality-protection` (11 fází) | každý `git commit` | nikdy |
| **CI/CD pipeline** | `mix quality.gates` v GitLab CI | každý merge request | nikdy |
| **Quality Floor Guardian** | `prismatic_safety/quality_floor_guardian.ex` | nepřetržité monitorování | nikdy |
| **Protokoly sezení** | kvóta QDP na sezení Claude | každé vývojové sezení | nikdy |
| **[Autoheal](@/glossary/autoheal.md)** | `mix autoheal.cycle` | automaticky při zjištění regrese | – (automaticky) |
| **[Autoevolve](@/glossary/autoevolve.md)** | `mix autoevolve.mega` | protokol konce sezení | – (automaticky) |

### Implementace kontroly brány kvality

```elixir
defmodule Mix.Tasks.Quality.Gates do
  @moduledoc """
  Comprehensive quality gate check that validates all 13 quality domains.
  Returns non-zero exit code on any violation, blocking CI/CD pipelines.
  """

  use Mix.Task

  @spec run(list(String.t())) :: :ok | no_return()
  def run(args) do
    fast_mode = "--fast" in args

    results = [
      {:compilation, check_compilation()},
      {:dialyzer, check_dialyzer(fast_mode)},
      {:credo, check_credo()},
      {:typespecs, check_typespecs()},
      {:impl_coverage, check_impl_coverage()},
      {:memory_safety, check_memory_safety()},
      {:unsafe_map_access, check_unsafe_map_access()},
      {:timing_patterns, check_timing_patterns()},
      {:todo_management, check_todo_management()},
      {:datetime_precision, check_datetime_precision()},
      {:guard_functions, check_guard_functions()},
      {:performance, check_performance()},
      {:regression_prevention, check_regression_prevention()}
    ]

    qdp = calculate_qdp(results)

    case qdp do
      0 ->
        Mix.shell().info("QDP: 0 - all quality gates passed")
        :ok

      total ->
        Mix.shell().error("QDP: #{total} violations detected")
        report_violations(results)
        Mix.raise("Quality gates failed with #{total} QDP")
    end
  end

  defp calculate_qdp(results) do
    Enum.reduce(results, 0, fn {domain, count}, acc ->
      acc + count * severity_weight(domain)
    end)
  end

  defp severity_weight(:unsafe_map_access), do: 5
  defp severity_weight(:memory_safety), do: 5
  defp severity_weight(:dialyzer), do: 3
  defp severity_weight(:compilation), do: 3
  defp severity_weight(:typespecs), do: 3
  defp severity_weight(:regression_prevention), do: 3
  defp severity_weight(:impl_coverage), do: 2
  defp severity_weight(:credo), do: 2
  defp severity_weight(:datetime_precision), do: 2
  defp severity_weight(:guard_functions), do: 2
  defp severity_weight(:timing_patterns), do: 2
  defp severity_weight(:performance), do: 3
  defp severity_weight(:todo_management), do: 1

  defp report_violations(results) do
    results
    |> Enum.filter(fn {_domain, count} -> count > 0 end)
    |> Enum.each(fn {domain, count} ->
      Mix.shell().error("  #{domain}: #{count} violations (#{count * severity_weight(domain)} QDP)")
    end)
  end
end
```

## Vynucení zakázaných vzorů

Nad rámec 13 oblastí kvality vynucuje platforma ucelenou sadu zakázaných vzorů, které brání
tomu, aby dluh kvality vůbec vznikl:

```elixir
defmodule Mix.Tasks.Quality.ForbiddenPatterns do
  @moduledoc """
  Scans the codebase for forbidden patterns that indicate quality debt,
  placeholder code, or incomplete implementations.
  """

  @forbidden_categories %{
    mocks: ~r/Mox\.defmock/,
    stubs: ~r/raise\s+"not implemented"|raise\s+:not_implemented/,
    placeholders: ~r/#\s*(PLACEHOLDER|STUB|MOCK|FIXME|HACK|WORKAROUND|XXX)/,
    naive: ~r/#\s*(naive|temporary|quick and dirty)/i,
    todos: ~r/#\s*TODO(?!\([a-zA-Z]+\))/
  }

  @spec run(list(String.t())) :: :ok | no_return()
  def run(args) do
    count_only = "--count-only" in args
    category_filter = extract_category(args)

    violations =
      scan_codebase()
      |> filter_whitelisted()
      |> filter_category(category_filter)

    total = length(violations)

    if count_only do
      Mix.shell().info("#{total}")
    else
      report_violations(violations)
    end

    if total > 0 do
      Mix.raise("#{total} forbidden patterns detected")
    end

    :ok
  end
end
```

| Kategorie | Rozsah | Závažnost | Vzory | Dopad na QDP |
|----------|-------|----------|----------|------------|
| **Mocky** | lib/ | BLOCK | `Mox.defmock` v produkčním kódu | 5 QDP |
| **Stuby** | lib/ | BLOCK | `raise "not implemented"` | 5 QDP |
| **Zástupné značky** | vše | BLOCK | `# PLACEHOLDER`, `# STUB`, `# FIXME`, `# HACK` | 3 QDP |
| **Naivní kód** | lib/ | BLOCK | `# naive`, `# temporary`, `# quick and dirty` | 3 QDP |
| **Localhost** | lib/ | WARN | `"http://localhost..."` mimo konfiguraci | 1 QDP |
| **Přeskočené testy** | test/ | WARN | `@tag :skip` bez odkazu na issue | 1 QDP |

## QDP a doktrína NO MERCY

Vynucování QDP je jádrovým výrazem doktríny [NO MERCY, NO DOUBTS](@/glossary/no-mercy-no-doubts.md).
Doktrína vyžaduje nulovou toleranci k porušením kvality a QDP poskytuje kvantitativní
mechanismus vynucení:

| Princip doktríny | Vyjádření v QDP |
|-------------------|---------------|
| **Nulová tolerance** | QDP musí být 0; jakékoli nenulové QDP blokuje commity |
| **Úplná exekuce** | kontroluje se všech 13 oblastí; žádné částečné hodnocení kvality |
| **Kvalita na prvním místě** | brány kvality běží před povolením jakéhokoli sloučení |
| **Žádné výmluvy** | porušení QDP se musí opravit okamžitě, ne odložit |
| **100% pokrytí testy** | chybějící testy se počítají jako QDP v oblasti prevence regresí |
| **Žádné stuby** | zástupný kód se počítá jako QDP přes zakázané vzory |
| **Připraveno do produkce** | každý commit musí zachovat stav 0 QDP |
| **Povinné regresní testy** | každá oprava chyby musí obsahovat testy, které se do QDP počítají |

## Napojení na Quality DNA

Stav QDP se mezi sezeními uchovává systémem Quality DNA, který ukládá snímky metrik kvality ve
formátu JSON do `.claude/quality-dna/current-state.json` v adresáři každé aplikace:

```json
{
  "quality_score": 100,
  "qdp_total": 0,
  "qdp_history": [
    {"session": 1, "qdp": 905, "date": "2025-11-01"},
    {"session": 15, "qdp": 600, "date": "2025-12-01"},
    {"session": 28, "qdp": 300, "date": "2025-12-15"},
    {"session": 35, "qdp": 100, "date": "2026-01-05"},
    {"session": 38, "qdp": 25, "date": "2026-01-15"},
    {"session": 42, "qdp": 0, "date": "2026-01-31"}
  ],
  "domains": {
    "dialyzer": {"violations": 0, "trend": "stable", "weight": 3},
    "credo": {"violations": 0, "trend": "stable", "weight": 2},
    "compilation": {"violations": 0, "trend": "stable", "weight": 3},
    "typespecs": {"violations": 0, "trend": "stable", "weight": 3},
    "impl_coverage": {"violations": 0, "trend": "stable", "weight": 2},
    "memory_safety": {"violations": 0, "trend": "stable", "weight": 5},
    "unsafe_map_access": {"violations": 0, "trend": "stable", "weight": 5},
    "timing_patterns": {"violations": 0, "trend": "stable", "weight": 2},
    "todo_management": {"violations": 0, "trend": "stable", "weight": 1},
    "datetime_precision": {"violations": 0, "trend": "stable", "weight": 2},
    "guard_functions": {"violations": 0, "trend": "stable", "weight": 2},
    "performance": {"violations": 0, "trend": "stable", "weight": 3},
    "regression_prevention": {"violations": 0, "trend": "stable", "weight": 3}
  },
  "last_updated": "2026-02-14T10:30:00Z",
  "session_count": 42,
  "apps_tracked": 115
}
```

Quality DNA umožňuje analýzu napříč sezeními: odhalování trendů (zhoršuje se některá oblast
mezi sezeními?), sledování rychlosti (jak rychle se QDP odstraňují?) a výstrahy před regresí
(zavedlo sezení nové QDP po období nuly?). Tento historický rozměr mění QDP z měření
v jednom okamžiku na trajektorii kvality.

## Quality Floor Guardian

Quality Floor Guardian je autonomní monitorovací systém, který odhaluje regresi kvality
a spouští nápravu:

```elixir
defmodule PrismaticSafety.QualityFloorGuardian do
  @moduledoc """
  Autonomous quality monitoring that detects score degradation
  and triggers automatic evolution before issues impact the platform.
  Enforcement levels: OPTIMAL (100-99%), WARNING (98-99%),
  CRITICAL (95-98%), EMERGENCY (<95%).
  """

  use GenServer

  @enforcement_levels %{
    optimal: {99, 100},
    warning: {98, 99},
    critical: {95, 98},
    emergency: {0, 95}
  }

  @spec current_score() :: {:ok, non_neg_integer()} | {:error, term()}
  def current_score do
    GenServer.call(__MODULE__, :current_score)
  end

  @spec enforcement_level() :: :optimal | :warning | :critical | :emergency
  def enforcement_level do
    GenServer.call(__MODULE__, :enforcement_level)
  end
end
```

| Rozsah skóre | Úroveň | Akce |
|-------------|-------|--------|
| **100–99 %** | OPTIMAL | jen monitorovat, zaznamenat stav |
| **98–99 %** | WARNING | výstraha, zjistit příčinu |
| **95–98 %** | CRITICAL | spustit autoevoluci, blokovat nekritické změny |
| **< 95 %** | EMERGENCY | blokovat všechny commity, eskalovat k Supreme Review |

## Srovnání s přístupy v odvětví

| Přístup | Rozsah | Vynucení | Granularita | Nulová tolerance |
|----------|-------|-------------|-------------|----------------|
| **QDP (Prismatic)** | 13 oblastí kvality, veškerý kód | pre-commit + CI + Guardian | skóre za každé porušení s vahami závažnosti | ano |
| **SonarQube** | code smells, chyby, zranitelnosti | integrace do CI, brány kvality | závažnost problému (blocker/critical/major/minor) | nastavitelné |
| **Code Climate** | udržovatelnost, pokrytí testy | integrace s GitHubem | známkování ve stylu GPA (A–F) | ne |
| **Coveralls** | jen pokrytí testy | integrace do CI | procento pokrytí na soubor | nastavitelné |
| **Technical Debt Ratio** | odhadovaný čas na opravu všech problémů | jen doporučující | odhad v čase | ne |
| **ESLint/Prettier** | styl a syntaxe | pre-commit hooky | závažnost podle pravidla | nastavitelné |

QDP se od těchto přístupů liší ve třech zásadních ohledech. Zaprvé jeho model vynucení není
doporučující – je to tvrdá brána, která nepustí kód do repozitáře, pokud porušení existují.
Zadruhé pokrývá současně více dimenzí analýzy (typovou bezpečnost, běhové chování,
dokumentaci, výkon, paměťovou bezpečnost), ne jediný aspekt. Zatřetí je napojen na systémy
autonomní nápravy (autoheal, autoevolve), které určité kategorie QDP dokážou opravit
automaticky bez zásahu člověka. To je praktické vyjádření doktríny NO MERCY.

## Meze metriky

Kompendium k heslu dodává obecnou výhradu, kterou zná z hodnocení lidí: jakmile se metrika
stane cílem, hrozí, že se optimalizuje číslo, ne skutečnost (Goodhartův zákon, rozebíraný
v hesle [Purple Team](@/glossary/purple-team.md)). Nulové QDP znamená, že žádná *sledovaná*
kategorie nemá porušení – ne že kód nemá vady. Stejně tak nulové skóre ve screeningovém
dotazníku neznamená, že člověk není pod vlivem manipulace (viz [6.1.3 Self-report
instrumenty](@/kompendium/06-klinicke-aplikace/self-report-instrumenty.md)).

## Související

**Pojmy platformy v tomto glosáři**

- [Quality Debt](@/glossary/quality-debt.md) – pojem dluhu kvality, který QDP měří.
- [Clean Run](@/glossary/clean-run.md) – kompilace bez varování jako mechanismus vynucení QDP.
- [Autoheal](@/glossary/autoheal.md) – automatická náprava spouštěná regresí QDP.
- [Autoevolve](@/glossary/autoevolve.md) – vývoj platformy řízený analýzou trendů QDP.
- [Trinity Gate](@/glossary/trinity-gate.md) – ověřovací systém zajišťující integritu tvrzení
  o kvalitě.
- [Zero Warning Policy](@/glossary/zero-warning-policy.md) – politika nulových varování.

**Hesla a přehledy platformy mimo tuto knihu**

- [CASCADE](https://prismatic-reality-com.github.io/prismatic-promo/glossary/cascade/) –
  metodika, která odstranila 905 QDP.
- [Dialyzer](https://prismatic-reality-com.github.io/prismatic-promo/glossary/dialyzer/),
  [Typespec](https://prismatic-reality-com.github.io/prismatic-promo/glossary/typespec/),
  [Code Coverage](https://prismatic-reality-com.github.io/prismatic-promo/glossary/code-coverage/),
  [Property-Based Testing](https://prismatic-reality-com.github.io/prismatic-promo/glossary/property-based-testing/) –
  nástroje a metody, které porušení odhalují nebo jim předcházejí.
- [Metrics](https://prismatic-reality-com.github.io/prismatic-promo/glossary/metrics/),
  [Observability](https://prismatic-reality-com.github.io/prismatic-promo/glossary/observability/) –
  QDP jako metrika v systému pozorovatelnosti.
- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/),
  [Schopnosti](https://prismatic-reality-com.github.io/prismatic-promo/capabilities/),
  [Technologie](https://prismatic-reality-com.github.io/prismatic-promo/technologies/) –
  přehledy platformy.

**Kniha**

- [1.6 Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md) – co
  kniha z platformy přebírá.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: qdp](@/kompendium/glossary-bridges/bridge-qdp.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
