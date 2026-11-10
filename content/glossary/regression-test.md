+++
title = "Regression test (regresní test)"
weight = 56
description = "Povinný test, který dokazuje, že oprava chyby brání opakování konkrétní vady; v Prismatic Platform neobejitelný protokol úrovně P0."

[taxonomies]
tags = ["glossary", "prismatic", "quality", "doctrine", "architecture"]

[extra]
category = "quality"
related_terms = ["quality-gates", "nm-nd", "violation-protocol", "purple-team", "no-mercy"]
author = "Tomas Korcak (korczis)"
reading_time = "8 min"
word_count = 1612
date_created = "2026-02-23"
date_modified = "2026-11-10"
keywords = ["Regression", "Test", "Mandatory", "glossary", "quality", "Prismatic Platform", "Regression Test", "Step"]
quality_score = 87
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "Regression test (regresní test) – glosář"
+++

## Definice a přehled

Regresní test (*regression test*) je test napsaný speciálně k ověření, že dříve zjištěná
a opravená chyba se v dalších vývojových cyklech nevrátí. Na rozdíl od běžných jednotkových
testů, které ověřují zamýšlenou funkčnost, míří regresní testy na známé způsoby selhání –
zachycují přesné podmínky, které minulou vadu vyvolaly, a ověřují, že systém s nimi nyní
zachází správně. Výraz „regrese“ označuje jev, kdy se dříve fungující funkčnost rozbije kvůli
novým změnám, a regresní testy slouží jako automatické hlídky proti této třídě vad.

Regresní testování je základní praxí zajištění kvality softwaru, jeho účinnost však plně
závisí na disciplíně: každou opravu chyby musí doprovázet test, který by chybu zachytil dřív,
než byla nahlášena. Bez této disciplíny se tytéž vady vracejí napříč verzemi, podkopávají
důvěru uživatelů a spotřebovávají inženýrský čas na opakované šetření známých problémů.

Prismatic Platform povyšuje regresní testování z osvědčeného postupu na neobejitelný protokol.
Povinný protokol regresních testů je klasifikován jako P0 (absolutní) – nejvyšší úroveň
vynucení – se souladem vynuceným doktrínou bez ohledu na naléhavost, rozsah nebo úroveň
oprávnění. Oprava chyby bez odpovídajícího regresního testu se podle doktríny [NO
MERCY](https://prismatic-reality-com.github.io/prismatic-promo/glossary/no-mercy/) (viz [NO
MERCY, NO DOUBTS](@/glossary/no-mercy-no-doubts.md)) považuje za neúplnou dodávku.

| Hledisko protokolu | Požadavek |
|-----------------|-------------|
| **Klasifikace** | P0 absolutní – neobejitelné |
| **Rozsah** | každá oprava chyby, bez výjimek |
| **Ověření** | test musí před opravou selhat a po opravě projít |
| **Hlášení** | povinná zpráva s kořenovou příčinou, cestou k testu a stavem ověření |
| **Vynucení** | commit bez regresního testu je zablokován |
| **Přebití autoritou** | žádné – obejít ho nemůže ani [Supreme Commander](@/glossary/supreme-commander.md) |

Pro Kompendium je regresní test pojmem z kontextu platformy. Myšlenka „zachytit podmínky,
které vadu vyvolaly, aby se nevrátila“ má v knize obdobu v prevenci relapsu po zotavení
(viz [Dlouhodobá prevence relapsu](@/kompendium/recovery-protocols/longterm-relapse-prevention.md)).

## Technický rozbor

### Pětikrokový regresní protokol

Prismatic Platform vynucuje pro každou opravu chyby přísný pětikrokový protokol:

**Krok 1 – Určení kořenové příčiny**: před napsáním jakékoli opravy musí vývojář určit
kořenovou příčinu chyby a způsob selhání. Povrchní opravy, které řeší příznaky místo příčin, se
odmítají jako porušení L3 (neúplná dodávka; viz [Violation Protocol](@/glossary/violation-protocol.md)).

**Krok 2 – Vytvoření regresního testu**: napsat jeden nebo více testů, které reprodukují
přesné podmínky selhání. Test má procházet konkrétní cestou kódu, která selhala, se vstupy,
jež původní vadu vyvolaly.

**Krok 3 – Ověření selhání**: spustit regresní test proti neopravené kódové základně
a potvrdit, že selže. Tento krok dokazuje, že test vadu skutečně odhaluje. Test, který proti
neopravenému kódu projde, buď testuje něco jiného, nebo už byla chyba opravena.

**Krok 4 – Provedení opravy**: provést opravu kódu, která řeší kořenovou příčinu určenou
v kroku 1. Oprava má být minimální a cílená – řešit kořenovou příčinu bez zbytečných změn,
které komplikují přezkum a zvyšují riziko regrese.

**Krok 5 – Ověření průchodu**: spustit regresní test proti opravené kódové základně
a potvrdit, že projde. Navíc spustit celou sadu testů a ověřit, že oprava nezavádí nové regrese
jinde.

```elixir
defmodule PrismaticQuality.RegressionProtocol do
  @moduledoc """
  Enforces the mandatory five-step regression test protocol.
  Every bug fix must pass through this protocol before commit.
  """

  @type regression_report :: %{
    bug_description: String.t(),
    root_cause: String.t(),
    test_file: String.t(),
    test_name: String.t(),
    fails_before_fix: boolean(),
    passes_after_fix: boolean(),
    coverage_scope: [String.t()],
    timestamp: DateTime.t()
  }

  @spec validate_protocol(regression_report()) ::
          :ok | {:error, :incomplete_protocol, String.t()}
  def validate_protocol(report) do
    validations = [
      {report.bug_description != "", "Bug description required"},
      {report.root_cause != "", "Root cause analysis required"},
      {report.test_file != "", "Test file path required"},
      {report.test_name != "", "Test name required"},
      {report.fails_before_fix == true, "Test must fail before fix (proves test validity)"},
      {report.passes_after_fix == true, "Test must pass after fix (proves fix works)"},
      {report.coverage_scope != [], "Coverage scope must be documented"}
    ]

    case Enum.find(validations, fn {valid, _} -> not valid end) do
      nil -> :ok
      {_, message} -> {:error, :incomplete_protocol, message}
    end
  end

  @spec generate_report(map()) :: String.t()
  def generate_report(params) do
    """
    REGRESSION TEST REPORT
    ========================
    Bug Fixed: #{params.bug_description}
    Root Cause: #{params.root_cause}
    Test Added: #{params.test_file} :: #{params.test_name}
    Validation: #{if params.fails_before_fix and params.passes_after_fix, do: "PASS", else: "FAIL"}
      - Test fails before fix: #{params.fails_before_fix}
      - Test passes after fix: #{params.passes_after_fix}
    Coverage: #{Enum.join(params.coverage_scope, ", ")}
    Timestamp: #{DateTime.utc_now() |> DateTime.to_iso8601()}
    """
  end
end
```

### Návrhové vzory regresních testů

Účinné regresní testy se řídí konkrétními návrhovými vzory, které maximalizují jejich ochrannou
hodnotu:

**Vzor přesné reprodukce**: test znovu vytvoří přesný sled operací, vstupů a stavu, který
původní chybu vyvolal. Je to nejčastější a nejspolehlivější vzor.

```elixir
defmodule PrismaticPerimeter.SecurityRatingTest do
  use ExUnit.Case, async: true

  describe "regression: score calculation overflow (BUG-1247)" do
    test "handles score exceeding 900 maximum without overflow" do
      # Exact reproduction: multiple A-grade factors pushed score above 900
      factors = [
        %{category: :dns, score: 95, weight: 0.3},
        %{category: :ssl, score: 98, weight: 0.3},
        %{category: :headers, score: 99, weight: 0.2},
        %{category: :network, score: 97, weight: 0.2}
      ]

      # Before fix: this returned 912, breaking the 300-900 scale
      {:ok, rating} = SecurityRating.calculate(factors)

      assert rating.score <= 900
      assert rating.score >= 300
      assert rating.grade == :A
    end
  end
end
```

**Vzor reprodukce hranice**: test míří na konkrétní hraniční podmínku, kterou chyba porušila,
a testuje obě strany hranice:

```elixir
describe "regression: empty asset list crash (BUG-1198)" do
  test "returns empty rating for organization with zero discovered assets" do
    # Before fix: Enum.min/1 crashed on empty list
    {:ok, rating} = SecurityRating.calculate_for_org(%{assets: []})

    assert rating.score == 0
    assert rating.grade == :F
    assert rating.confidence == :none
  end

  test "calculates rating correctly for single asset" do
    {:ok, rating} = SecurityRating.calculate_for_org(%{assets: [valid_asset()]})

    assert rating.score > 0
    assert rating.confidence == :low
  end
end
```

**Vzor reprodukce souběhu**: u chyb ze souběhu (*race condition*) test prochází souběžným
scénářem, který vadu vyvolal:

```elixir
describe "regression: concurrent session writes causing data loss (BUG-1302)" do
  test "concurrent session updates are serialized without data loss" do
    {:ok, session} = SessionStore.create(%{user_id: "test-user"})

    tasks =
      for i <- 1..50 do
        Task.async(fn ->
          SessionStore.update(session.id, %{counter: i})
        end)
      end

    results = Task.await_many(tasks, 5_000)

    # Before fix: some updates were silently dropped
    assert Enum.all?(results, &match?({:ok, _}, &1))

    {:ok, final} = SessionStore.get(session.id)
    assert final.version == 50
  end
end
```

## Architektura a implementace

### Napojení na brány kvality

Regresní testy se zapojují do širší pipeline [Quality
Gates](https://prismatic-reality-com.github.io/prismatic-promo/glossary/quality-gates/), která
běží u každého commitu. Systém bran kvality ověřuje nejen to, že všechny testy projdou, ale
i to, že nedávné commity s opravami chyb obsahují odpovídající přírůstky regresních testů:

```
Commit --> Pre-Commit Hook --> Quality Gates Pipeline
                                    |
                                    +-- Compilation (zero warnings)
                                    +-- Credo (strict mode)
                                    +-- Dialyzer (type checking)
                                    +-- Test Suite (all tests including regressions)
                                    +-- Regression Protocol Validation
                                    |       |
                                    |       +-- Bug fix commits must include new test files
                                    |       +-- Test must exercise the fixed code path
                                    |       +-- Report must be generated
                                    +-- Coverage Check (100% target)
```

### Strážce regresí Purple Teamu

Agent `purple-regression-guard` [Purple Teamu](@/glossary/purple-team.md) rozšiřuje pojem
regresního testu na bezpečnostní zjištění. Když je bezpečnostní zranitelnost zjištěna
a odstraněna, strážce regresí zajistí, že:

1. nápravu ověřuje bezpečnostní regresní test;
2. test je přidán do sady bezpečnostních regresí;
3. zjištění nelze uzavřít bez regresního testu;
4. budoucí nasazení znovu ověří všechny bezpečnostní regrese.

Vzniká tak monotónně rostoucí sada bezpečnostních regresí, která zachycuje každou minulou
zranitelnost a brání návratu kterékoli z nich.

### Organizace regresních testů

Regresní testy v Prismatic Platform se řídí jednotnou organizační strukturou:

```
apps/
  prismatic_perimeter/
    test/
      regression/
        bug_1247_score_overflow_test.exs
        bug_1198_empty_asset_crash_test.exs
        bug_1302_concurrent_session_test.exs
      prismatic_perimeter_test.exs
```

Každý soubor regresního testu je pojmenován identifikátorem chyby, takže je okamžitě
dohledatelný k původnímu hlášení vady. Adresář `test/regression/` poskytuje přehledný
inventář všech minulých vad a jejich ochranných testů.

## Užití v Prismatic Platform

Povinný protokol regresních testů podle dokumentace platformy výrazně přispěl k jejím
metrikám kvality (údaje v době zápisu):

**5 864 testovacích souborů**: rozsáhlá sada testů platformy obsahuje stovky regresních testů
nashromážděných během 18 generací vývoje. Každý test představuje chybu, která byla nalezena,
analyzována, opravena a trvale ohlídána.

**Nula regresních incidentů**: od zavedení protokolu P0 platforma nezaznamenala žádný regresní
incident – žádná dříve opravená chyba se v žádné další verzi nevrátila.

**Napojení na Quality Floor Guardian**: [Quality Floor
Guardian](https://prismatic-reality-com.github.io/prismatic-promo/glossary/quality-floor-guardian/)
sleduje zdraví regresních testů v rámci autonomního monitorování kvality. Stane-li se regresní
test nestabilním (občas selhává), spustí šetření dřív, než nestabilita zakryje skutečnou regresi.

**Vynucení v pre-commitu**: hook `.githooks/pre-commit` ověřuje, že commity označené jako opravy
chyb obsahují odpovídající přírůstky testů. Commity, které tímto ověřením neprojdou, se
zablokují už ve fázi lokálního vývoje, dřív než se dostanou do CI/CD.

## Příklady kódu

### Úplný postup regresního testu

```elixir
defmodule PrismaticStorageEts.RegistryRegressionTest do
  @moduledoc """
  Regression tests for PrismaticStorageEts.Registry.
  Each test documents the original bug and validates the fix.
  """
  use ExUnit.Case, async: true

  alias PrismaticStorageEts.Registry

  # BUG-1156: Registry.lookup/2 returned {:ok, nil} instead of {:error, :not_found}
  # Root Cause: Missing nil guard in ETS lookup result handling
  # Fixed in: commit abc123
  describe "regression: BUG-1156 nil lookup result" do
    test "returns {:error, :not_found} for non-existent keys" do
      {:ok, registry} = Registry.start_link(name: :test_reg_1156)

      result = Registry.lookup(registry, "non_existent_key")

      assert result == {:error, :not_found}
      refute match?({:ok, nil}, result)
    end
  end

  # BUG-1203: Registry.delete/2 silently succeeded for non-existent keys
  # Root Cause: ETS.delete/2 always returns true regardless of key existence
  # Fixed in: commit def456
  describe "regression: BUG-1203 silent delete" do
    test "returns {:error, :not_found} when deleting non-existent key" do
      {:ok, registry} = Registry.start_link(name: :test_reg_1203)

      result = Registry.delete(registry, "ghost_key")

      assert result == {:error, :not_found}
    end

    test "returns {:ok, deleted_value} when deleting existing key" do
      {:ok, registry} = Registry.start_link(name: :test_reg_1203b)
      Registry.insert(registry, "real_key", "value")

      result = Registry.delete(registry, "real_key")

      assert result == {:ok, "value"}
    end
  end
end
```

### Generátor regresních testů

```elixir
defmodule PrismaticQuality.RegressionGenerator do
  @moduledoc """
  Generates regression test scaffolding from bug reports.
  Ensures consistent test structure and documentation.
  """

  @spec generate(map()) :: {:ok, String.t()} | {:error, :missing_fields}
  def generate(bug_report) do
    required = [:id, :module, :description, :root_cause, :inputs, :expected, :actual]

    if Enum.all?(required, &Map.has_key?(bug_report, &1)) do
      test_content = """
      defmodule #{bug_report.module}RegressionTest do
        @moduledoc \"\"\"
        Regression test for #{bug_report.id}: #{bug_report.description}
        Root Cause: #{bug_report.root_cause}
        \"\"\"
        use ExUnit.Case, async: true

        describe "regression: #{bug_report.id}" do
          test "#{bug_report.description}" do
            # Setup: reproduce the exact conditions
            #{generate_setup(bug_report)}

            # Exercise: execute the operation that failed
            result = #{generate_exercise(bug_report)}

            # Verify: assert correct behavior (opposite of the bug)
            #{generate_assertions(bug_report)}
          end
        end
      end
      """

      {:ok, test_content}
    else
      {:error, :missing_fields}
    end
  end

  defp generate_setup(report), do: Enum.join(report.inputs, "\n    ")
  defp generate_exercise(report), do: report.exercise || "Module.function(input)"
  defp generate_assertions(report), do: "assert result == #{inspect(report.expected)}"
end
```

## Osvědčené postupy

1. **Pojmenovat testy podle ID chyb**: použít identifikátor ze sledování chyb v názvu testu
   i modulu. Vzniká přímý řetězec dohledatelnosti od hlášení vady k ochrannému testu.
2. **Zdokumentovat kořenovou příčinu**: do souboru testu napsat komentář, co chybu způsobilo,
   ne jen jaký byl příznak. Budoucí vývojáři potřebují pochopit, proč test existuje.
3. **Testovat hranici, ne jen opravu**: regresní test má pokrýt konkrétní případ selhání
   a nejméně jednu sousední hraniční podmínku. Chyby se často shlukují kolem hraničních podmínek.
4. **Udržovat testy rychlé**: regresní testy běží u každého commitu. Vyžaduje-li regresní test
   drahou přípravu (databáze, síť), zvažte, zda ho lze přestavět tak, aby stejnou logiku
   procházel s levnější infrastrukturou.
5. **Nikdy regresní testy nemazat**: regresní testy jsou trvalou součástí sady testů. I když se
   testovaný kód refaktoruje, test se má upravit tak, aby procházel ekvivalentní logikou
   v novém kódu.
6. **Samostatný adresář regresí**: v každé aplikaci udržovat vyhrazený adresář
   `test/regression/`. Usnadňuje to audit regresního pokrytí a pochopení historie vad platformy.
7. **Automatizovat protokol**: k automatickému vynucení regresního protokolu používat
   pre-commit hooky a kontroly CI/CD. Ruční vynucení je pod tlakem termínů nespolehlivé.

## Časté chyby

- **Testovat příznak, ne příčinu**: regresní test, který kontroluje jen viditelný příznak, může
  projít, i když se kořenová příčina vrátí v trochu jiné podobě. Testujte přímo mechanismus
  kořenové příčiny.
- **Vynechat ověření selhání**: bez potvrzení, že test na neopraveném kódu selže, si nelze být
  jistý, že test vadu skutečně odhaluje. Test, který vždy projde, neposkytuje žádnou ochranu
  před regresí.
- **Příliš široké testy**: regresní test, který prochází příliš mnoho kódu, může projít, i když
  konkrétní oprava regreduje, protože jiné cesty kódu selhání zakryjí. Regresní testy mají být
  soustředěné a minimální.
- **Nestabilní regresní testy**: občas selhávající regresní testy jsou horší než žádný test.
  Vytvářejí únavu z výstrah a mohou vést týmy k přehlížení skutečných regresí. Nestabilní testy
  okamžitě opravit nebo dát do karantény.
- **Chybějící kontext ve zprávách**: zpráva o regresi bez analýzy kořenové příčiny nezachytí
  inženýrské znalosti získané při ladění. Tyto znalosti předcházejí podobným chybám
  v souvisejícím kódu.
- **Hromadné opravy bez jednotlivých testů**: při opravě více souvisejících chyb napsat pro
  každou samostatný regresní test. Spojené testy mohou zakrýt jednotlivé regrese.

## Metriky a průběžné zlepšování

Prismatic Platform vede podrobné metriky účinnosti regresních testů a průběžně podle nich
zpřesňuje protokol (hodnoty podle dokumentace v době zápisu):

**Pokrytí regresními testy**: procento commitů s opravou chyby, které obsahují regresní testy.
Cíl: 100 % (od zavedení protokolu 100 %).

**Míra účinnosti testů**: procento regresních testů, které při ověřovacích cvičeních úspěšně
odhalí záměrně znovu zavedené chyby. Měsíční audity náhodně vyberou 10 regresních testů
a dočasně znovu zavedou odpovídající chyby, aby ověřily, že je testy zachytí.

**Míra falešně pozitivních výsledků**: procento regresních testů, které selžou kvůli
nestabilitě, ne kvůli skutečné regresi. Cíl: < 2 % (v době zápisu 1,3 %).

**Režie údržby**: čas strávený úpravami regresních testů kvůli refaktoringu nebo
architektonickým změnám. Sleduje se, aby regresní protokol nevytvářel neudržitelnou zátěž.

**Míra návratu chyb**: počet dříve opravených chyb, které se vrátí. Cíl: 0 (od zavedení
protokolu dosaženo).

Metriky vstupují do systému Quality DNA, který sleduje trendy kvality napříč generacemi
a spouští cykly autonomního zlepšování ([AutoEvolve](@/glossary/autoevolve.md)), když se metriky
odchýlí od cílů.

## Pokročilé vzory a techniky

**Integrace metamorfního testování**: některé regresní testy využívají principy metamorfního
testování – ověřují, že mezi vstupy a výstupy platí určité vztahy, místo kontroly konkrétních
výstupních hodnot. To je cenné zejména u regresních testů algoritmů, jejichž přesný výstup se
může mezi implementacemi lišit.

**Regresní testy založené na vlastnostech**: s nástrojem PropCheck nebo podobnými některé
regresní testy generují stovky testovacích případů podle vlastností, které má opravený kód
zachovávat. Tento přístup zachytí regrese, k nimž dochází jen při specifických kombinacích
vstupů, které testy založené na příkladech nepokrývají.

**Časová detekce regresí**: pokročilé regresní testy obsahují časová tvrzení, která ověřují,
že oprava nezhoršila výkonové charakteristiky. Například oprava chyby v třídicím algoritmu
obsahuje výkonové regresní testy, které zajistí, že oprava omylem nezavede chování O(n²) tam,
kde se očekává O(n log n).

## Analogie v Kompendiu

Kniha z regresního protokolu přebírá dvě myšlenky. Zaprvé: po zotavení z epistemické anihilace
je užitečné výslovně pojmenovat podmínky, za nichž manipulace fungovala (izolace, časový tlak,
závislost na jediném zdroji), aby je člověk příště rozpoznal dřív – to je jádro [subakutního
detekčního tréninku](@/kompendium/recovery-protocols/subacute-detection-training.md). Zadruhé:
„oprava příznaku“ (odchod z jedné skupiny) nemusí odstranit „kořenovou příčinu“ (zranitelnost,
která vede ke vstupu do další). Rozdíl je v tom, že u lidí nejde o testy, ale o podporu
a svobodnou volbu; o regresi v systémech platformy pojednává [AutoHeal a detekce
EA](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md).

## Související

**Pojmy platformy v tomto glosáři**

- [NM/ND](@/glossary/nm-nd.md) – řídicí rámec, který regresní test vyžaduje u každé opravy.
- [Violation Protocol](@/glossary/violation-protocol.md) – eskalace při chybějícím regresním
  testu.
- [Purple Team](@/glossary/purple-team.md) – bezpečnostní strážce regresí podle téhož principu.
- [QDP](@/glossary/qdp.md) – chybějící regresní testy jako body dluhu kvality.
- [Clean Run](@/glossary/clean-run.md) – stav testů a kompilace bez šumu.

**Hesla a přehledy platformy mimo tuto knihu**

- [Quality Gates](https://prismatic-reality-com.github.io/prismatic-promo/glossary/quality-gates/),
  [NO MERCY](https://prismatic-reality-com.github.io/prismatic-promo/glossary/no-mercy/),
  [Pre-Commit Hooks](https://prismatic-reality-com.github.io/prismatic-promo/glossary/pre-commit-hooks/),
  [SEADF](https://prismatic-reality-com.github.io/prismatic-promo/glossary/seadf/) – pipeline
  vynucení, doktrína, lokální vynucení a samovyvíjející se rámec.
- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/),
  [Technologie](https://prismatic-reality-com.github.io/prismatic-promo/technologies/),
  [Příkazy](https://prismatic-reality-com.github.io/prismatic-promo/commands/) – přehledy platformy.

**Kniha**

- [Dlouhodobá prevence relapsu](@/kompendium/recovery-protocols/longterm-relapse-prevention.md) –
  lidská obdoba ochrany před návratem.
- [AutoHeal a detekce EA](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md) –
  oprava regresí v detekci EA.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: regression-test](@/kompendium/glossary-bridges/bridge-regression-test.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
