+++
title = "White Team (bílý tým)"
weight = 23
description = "Tým konstruktivního ověřování v Prismatic Platform: formální důkazy, validace kontraktů a analýza invariantů, které dokládají, že systém skutečně drží."

[taxonomies]
tags = ["glossary", "prismatic", "color-teams", "evidence", "agents"]

[extra]
category = "security"
related_terms = ["color-teams", "trinity-gate", "nabla-infinity", "purple-team"]
author = "Tomas Korcak (korczis)"
date_created = "2026-02-23"
date_modified = "2026-11-10"
keywords = ["White", "Team", "Constructive", "glossary", "security", "Prismatic Platform", "White Team", "Purple Team", "The White"]
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "White Team (bílý tým) – glosář"
+++

## Definice a přehled

White Team (bílý tým) je jedním ze šesti specializovaných [barevných týmů](@/glossary/color-teams.md)
v architektuře epistemické bezpečnosti Prismatic Platform. Tvoří ho tři agenti na úrovních
oprávnění L3–L4 a odpovídá za konstruktivní ověřování – disciplínu dokazování, že se systémy chovají
správně, pomocí postupné ověřovací metodiky, formálních matematických důkazů, validace kontraktů
a analýzy invariantů. Na rozdíl od [Red Teamu](@/glossary/red-team.md), který se snaží systémy
rozbít útočnou simulací, se White Team snaží dokázat, že systémy drží.

White Team má v architektuře toku signálů barevných týmů jedinečné postavení. Red Team vytváří
útočná zjištění a [Blue Team](@/glossary/blue-team.md) udržuje obranné postavení, White Team dodává
konstruktivní důkazy, že systémy splňují specifikované vlastnosti. Tyto důkazy vstupují do
rozhodnutí o uzavření v [Purple Teamu](@/glossary/purple-team.md), kde kombinace útočných zjištění
(Red), obranného postavení (Blue) a konstruktivních důkazů (White) určuje, zda byla bezpečnostní
otázka definitivně zodpovězena.

Veškerý výstup White Teamu prochází před přijetím jako ověřený branou [Trinity
Gate](@/glossary/trinity-gate.md). Čtyřvrstvá validace zajišťuje, že důkazy jsou strukturně
konzistentní (platný DAG v síti přesvědčení), logicky konzistentní (výroky se řídí logickými
pravidly) a formálně nutné (tvrzení dokázaná ve formálních systémech, jako je Lean4). Požadavek
Trinity Gate brání přijetí povrchně přesvědčivých, ale zásadně vadných ověřovacích artefaktů.

Postupná ověřovací metodika White Teamu má šest úrovní (L0–L5), z nichž každá představuje rostoucí
přísnost a důvěru:

| Úroveň | Název | Metoda | Důvěra |
|-------|------|--------|------------|
| **L0** | kouřový test | ověření základní funkčnosti | 0,30 |
| **L1** | ověření jednotek | testování kontraktů jednotlivých funkcí | 0,50 |
| **L2** | integrační ověření | testování interakcí mezi moduly | 0,65 |
| **L3** | ověření založené na vlastnostech | vlastnosti QuickCheck/StreamData | 0,80 |
| **L4** | formální ověření | formální důkazy v Lean4 | 0,95 |
| **L5** | úplné ověření | úplný formální důkaz se všemi invarianty | 0,99 |

Průchod těmito úrovněmi není vždy lineární. Agenti White Teamu posuzují rizikový profil každého cíle
ověření a určují vhodnou výchozí úroveň. Kritické bezpečnostní vlastnosti mohou začít na L3 nebo L4,
rutinní funkční kontrakty začínají na L0 a postupují nahoru podle potřeby.

Pro Kompendium je White Team pojmem z kontextu platformy. Kniha z něj přebírá rozlišení, které je
užitečné i v klinické a forenzní práci: *doložit, že něco drží* (konstruktivní důkaz), je jiný úkol
než *nenajít, co to rozbije* (absence vyvrácení). Absence nalezené manipulace ještě není důkazem
její nepřítomnosti (srov. axiom informativní absence v hesle [Axiomy NABLA](@/glossary/nabla-axioms.md)).

## Technický rozbor

### Složení agentů

White Team tvoří tři agenti s odlišnou specializací a úrovní oprávnění:

**white-verifier-commander (L3 Strategic Commander)** řídí všechny ověřovací kampaně White Teamu.
Velitel přijímá požadavky na ověření od Purple Teamu, posuzuje rizikové profily cílů, přiděluje
specializované agenty a sestavuje složené důkazy z jednotlivých ověřovacích artefaktů. Má pravomoc
zpřísnit požadavky na ověření, když první výsledky ukazují na vyšší riziko, než se předpokládalo.

**white-contract-validator (L4 Operational Specialist)** se specializuje na testování kontraktů
rozhraní ve třech oblastech: behaviorální kontrakty (specifikace vstupů a výstupů funkcí),
protokolové kontrakty (soulad s předáváním zpráv a stavovými automaty) a kontrakty API (schémata
požadavků a odpovědí endpointů). Validace kontraktů zajišťuje, že moduly, služby a API odpovídají
deklarovaným rozhraním za všech specifikovaných podmínek.

**white-invariant-prover (L4 Operational Specialist)** zajišťuje nejpřísnější ověřovací činnosti:
testování založené na vlastnostech pomocí StreamData, konstrukci formálních důkazů v Lean4 a analýzu
vkládání chyb. Agent dokazuje, že systémové invarianty – vlastnosti, které musí platit vždy, bez
ohledu na vstup nebo stav – jsou matematicky zaručeny. Analýzou vkládání chyb ověřuje, že systémy
své invarianty udrží i v degradovaných podmínkách.

### Ověřovací metodika

Ověřovací metodika White Teamu je konstruktivní, ne destruktivní. Red Team se ptá „Dokážu to
rozbít?“, White Team se ptá „Dokážu doložit, že to drží?“. Rozdíl je zásadní: konstruktivní ověření
vytváří pozitivní důkaz správnosti, útočné testování negativní důkaz zranitelnosti. Pro úplnou
bezpečnostní jistotu je potřeba obojí.

```
Verification Request
    |
    v
[Risk Assessment] --> Determines starting verification level
    |
    v
[Contract Validation] --> Behavioral, Protocol, API contracts
    |
    v
[Property-Based Testing] --> StreamData properties, edge cases
    |
    v
[Formal Proofs] --> Lean4 mathematical proofs (if L4+ required)
    |
    v
[Composite Proof Construction] --> Combines evidence artifacts
    |
    v
[Trinity Gate Validation] --> 4-layer gate passage required
    |
    v
[Purple Team Delivery] --> Evidence feeds into closure decisions
```

### Nedestruktivní provoz

Zásadním omezením operací White Teamu je nedestruktivnost. Agenti White Teamu nesmějí nikdy měnit
systémy, které ověřují. Veškeré ověřovací činnosti jsou jen pro čtení nebo pracují s izolovanými
kopiemi. Toto omezení zajišťuje, že samo ověřování nemůže zavést vady ani změnit chování systému.
Vytvářené důkazní artefakty jsou čisté datové struktury – stromy důkazů, výsledky testů, zprávy
o souladu s kontrakty – bez vedlejších účinků na cílový systém.

## Architektura a implementace

### Ověřovací engine

Ověřovací engine White Teamu implementuje postupnou metodiku jako skládatelnou pipeline:

```elixir
defmodule PrismaticDark.WhiteTeam.VerificationEngine do
  @moduledoc """
  Progressive verification engine implementing L0-L5 methodology.
  Produces evidence artifacts without modifying target systems.
  All output passes through Trinity Gate validation.
  """

  @type verification_level :: :l0 | :l1 | :l2 | :l3 | :l4 | :l5
  @type evidence :: %{
    level: verification_level(),
    target: module(),
    method: atom(),
    result: :verified | :failed | :inconclusive,
    confidence: float(),
    proof_artifact: term(),
    timestamp: DateTime.t()
  }

  @spec verify(module(), keyword()) :: {:ok, list(evidence())} | {:error, term()}
  def verify(target_module, opts \\ []) do
    starting_level = Keyword.get(opts, :level, :l0)
    max_level = Keyword.get(opts, :max_level, :l5)

    starting_level
    |> levels_through(max_level)
    |> Enum.reduce_while({:ok, []}, fn level, {:ok, evidence_acc} ->
      case execute_verification(target_module, level) do
        {:ok, evidence} ->
          {:cont, {:ok, [evidence | evidence_acc]}}

        {:failed, evidence} ->
          {:halt, {:ok, [evidence | evidence_acc]}}

        {:error, reason} ->
          {:halt, {:error, {level, reason}}}
      end
    end)
    |> validate_through_trinity_gate()
  end

  defp execute_verification(target, :l0) do
    SmokeTest.run(target)
  end

  defp execute_verification(target, :l1) do
    ContractValidator.validate_unit_contracts(target)
  end

  defp execute_verification(target, :l2) do
    ContractValidator.validate_integration_contracts(target)
  end

  defp execute_verification(target, :l3) do
    InvariantProver.property_based_verification(target)
  end

  defp execute_verification(target, :l4) do
    InvariantProver.formal_proof(target)
  end

  defp execute_verification(target, :l5) do
    InvariantProver.complete_verification(target)
  end
end
```

### Validace kontraktů

Validátor kontraktů kontroluje tři kategorie kontraktů:

```elixir
defmodule PrismaticDark.WhiteTeam.ContractValidator do
  @moduledoc """
  Validates behavioral, protocol, and API contracts
  for interface compliance verification.
  """

  @spec validate_behavioral_contract(module(), atom(), list()) ::
    {:ok, evidence()} | {:failed, evidence()}
  def validate_behavioral_contract(module, function, test_cases) do
    results =
      test_cases
      |> Enum.map(fn %{input: input, expected: expected} ->
        actual = apply(module, function, input)
        %{input: input, expected: expected, actual: actual, pass: actual == expected}
      end)

    all_passed = Enum.all?(results, & &1.pass)

    evidence = %{
      level: :l1,
      target: module,
      method: :behavioral_contract,
      result: if(all_passed, do: :verified, else: :failed),
      confidence: if(all_passed, do: 0.50, else: 0.0),
      proof_artifact: %{
        function: function,
        test_cases: length(test_cases),
        passed: Enum.count(results, & &1.pass),
        failed: Enum.count(results, &(not &1.pass)),
        details: results
      },
      timestamp: DateTime.utc_now()
    }

    if all_passed, do: {:ok, evidence}, else: {:failed, evidence}
  end

  @spec validate_protocol_contract(module(), atom()) ::
    {:ok, evidence()} | {:failed, evidence()}
  def validate_protocol_contract(module, protocol) do
    # Verifies state machine transitions follow protocol specification
    states = protocol.states()
    transitions = protocol.transitions()

    valid =
      Enum.all?(transitions, fn {from, event, to} ->
        from in states and to in states and
        module.handle_transition(from, event) == {:ok, to}
      end)

    evidence = %{
      level: :l2,
      target: module,
      method: :protocol_contract,
      result: if(valid, do: :verified, else: :failed),
      confidence: if(valid, do: 0.65, else: 0.0),
      proof_artifact: %{protocol: protocol, states: states, transitions: length(transitions)},
      timestamp: DateTime.utc_now()
    }

    if valid, do: {:ok, evidence}, else: {:failed, evidence}
  end
end
```

### Dokazování invariantů

Dokazovač invariantů zajišťuje testování založené na vlastnostech a formální ověření:

```elixir
defmodule PrismaticDark.WhiteTeam.InvariantProver do
  @moduledoc """
  Property-based testing and formal proof construction.
  Uses StreamData for property testing and Lean4 integration
  for mathematical proofs.
  """

  use ExUnitProperties

  @spec property_based_verification(module()) ::
    {:ok, evidence()} | {:failed, evidence()}
  def property_based_verification(module) do
    properties = module.__properties__()

    results =
      Enum.map(properties, fn {name, generator, property_fn} ->
        case check_property(generator, property_fn) do
          :ok -> {:passed, name}
          {:error, counterexample} -> {:failed, name, counterexample}
        end
      end)

    all_passed = Enum.all?(results, &match?({:passed, _}, &1))

    evidence = %{
      level: :l3,
      target: module,
      method: :property_based_testing,
      result: if(all_passed, do: :verified, else: :failed),
      confidence: if(all_passed, do: 0.80, else: 0.0),
      proof_artifact: %{
        properties_tested: length(properties),
        passed: Enum.count(results, &match?({:passed, _}, &1)),
        failed: Enum.count(results, &match?({:failed, _, _}, &1))
      },
      timestamp: DateTime.utc_now()
    }

    if all_passed, do: {:ok, evidence}, else: {:failed, evidence}
  end
end
```

## Užití v Prismatic Platform

### Pozice v toku signálů

V architektuře toku signálů barevných týmů zaujímá White Team pozici konstruktivního ověřování:

```
Gray (boundary seeds) --> Red (adversarial scenarios) --> Purple (synthesis) --> Blue (defense)
                                    ^                          |       ^           |
                                    |                          v       |           v
                               Black (threat models)     White (proofs)    Platform Defense
```

Důkazy White Teamu proudí do Purple Teamu, kde se spojují se zjištěními Red Teamu a obranným
postavením Blue Teamu k rozhodnutím o uzavření. Bezpečnostní otázku lze „uzavřít“ jen tehdy, když
White Team dodal konstruktivní ověření, že příslušné vlastnosti platí, Red Team vyčerpal své útočné
scénáře a Blue Team potvrdil obrannou připravenost.

### Ověřování kontraktů SPARKLINE

White Team hraje klíčovou roli při ověřování kontraktů SPARKLINE. Validátor kontraktů zajišťuje,
že všechny kontrakty rozhraní mezi moduly platformy jsou splněny, a brání tak integračním selháním
a regresím chování. Ověření kontraktů je povinné před kanonizací SPARKLINE.

### Napojení na Trinity Gate

Veškerý výstup White Teamu musí před přijetím projít [Trinity Gate](@/glossary/trinity-gate.md).
Tato čtyřvrstvá brána ověřuje strukturní konzistenci, logickou konzistenci, formální nutnost
a – podle původního textu dokumentace – „sladění vědomí“ (*consciousness alignment*); heslo Trinity
Gate čtvrtou vrstvu popisuje jako metavrstvu integrity. Požadavek Trinity Gate zajišťuje, že důkazy
White Teamu nejsou jen syntakticky správné, ale i sémanticky smysluplné.

## Osvědčené postupy

1. **Začínat na přiměřené úrovni**: ne každý cíl ověření potřebuje formální důkazy L5. Úroveň
   ověření se má odpovídat rizikovému profilu. Bezpečnostně kritické invarianty si zaslouží L4–L5,
   rutinním funkčním kontraktům stačí L1–L2.
2. **Absolutně dodržovat nedestruktivnost**: agenti White Teamu nesmějí nikdy měnit cílové systémy.
   I operace čtení je třeba minimalizovat, aby se zabránilo vlivu pozorování na souběžné systémy.
3. **Vytvářet skládatelné důkazy**: strukturovat důkazní artefakty tak, aby se daly kombinovat do
   složených důkazů. Izolované výsledky ověření mají menší hodnotu než propojené sítě důkazů.
4. **Dokumentovat předpoklady ověření**: každý důkaz stojí na předpokladech. Zdokumentovat, jaké
   podmínky musí platit, aby byl důkaz platný, aby změna těchto podmínek spustila nové ověření.
5. **Průběžně se napojovat na Purple Team**: důkazy White Teamu mají největší hodnotu, když do Purple
   Teamu přicházejí v reálném čase a umožňují postupná rozhodnutí o uzavření místo dávkového přezkumu.
6. **Používat testování založené na vlastnostech jako most**: testování založené na vlastnostech (L3)
   překlenuje mezeru mezi běžným testováním (L0–L2) a formálním ověřením (L4–L5). Dává vysokou
   důvěru s nižšími náklady než úplné formální důkazy.

## Časté chyby

- **Přílišné spoléhání na ověření L0–L1**: kouřové testy a testy kontraktů jednotek dávají omezenou
  důvěru. Kritické systémy vyžadují ověření L3 a vyšší, aby dosáhly prahů důvěry potřebných pro
  soulad s [doktrínou NM/ND](@/glossary/nm-nd.md).
- **Chápat ověření jako jednorázové**: systémy se průběžně vyvíjejí. Důkazy sestavené pro verzi N
  nemusí platit pro verzi N+1. Při změně cílových systémů je třeba ověření provést znovu (srov.
  [Regression Test](@/glossary/regression-test.md)).
- **Zaměňovat testování s dokazováním**: testy ukazují chování pro konkrétní vstupy. Důkazy ukazují
  chování pro všechny možné vstupy ve specifikované oblasti. Hodnota White Teamu spočívá v postupu
  od testování (L0–L2) k dokazování (L3–L5).
- **Zanedbávat údržbu formálních důkazů**: důkazy v Lean4 vyžadují údržbu, když se mění typové
  signatury, rozhraní modulů nebo systémové invarianty. Neudržované důkazy zastarávají a dávají
  falešnou jistotu.
- **Ověřovat izolovaně bez kontextu**: ověření jednotlivých modulů izolovaně mine integrační selhání.
  Integrační ověření L2 je nezbytné pro zachycení porušení kontraktů mezi moduly.

## Související

**Pojmy platformy v tomto glosáři**

- [Color Teams](@/glossary/color-teams.md) – přehled všech šesti barevných týmů.
- [Trinity Gate](@/glossary/trinity-gate.md) – čtyřvrstvá brána, která ověřuje výstup White Teamu.
- [Purple Team](@/glossary/purple-team.md) – přijímá důkazy White Teamu k rozhodnutím o uzavření.
- [Red Team](@/glossary/red-team.md) – útočný protějšek konstruktivního přístupu.
- [Blue Team](@/glossary/blue-team.md) – tým obranného postavení doplňující ověřování.
- [NABLA Infinity](@/glossary/nabla-infinity.md) – epistemické axiomy standardů ověřování.
- [NM/ND](@/glossary/nm-nd.md) – doktrína vyžadující ověření opřené o důkazy.
- [QEVE](@/glossary/qeve.md) – ověřovací engine, jehož metody White Team používá.

**Hesla a přehledy platformy mimo tuto knihu**

- [Quality Gates](https://prismatic-reality-com.github.io/prismatic-promo/glossary/quality-gates/) –
  vynucení kvality, které důkazy White Teamu využívá.
- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/),
  [Technologie](https://prismatic-reality-com.github.io/prismatic-promo/technologies/),
  [Agenti](https://prismatic-reality-com.github.io/prismatic-promo/agents/),
  [Aplikace](https://prismatic-reality-com.github.io/prismatic-promo/apps/).

**Kniha**

- [White Team a detekce EA](@/kompendium/aiad-integration/white-team-ea-verification.md) –
  konstruktivní ověřování v detekci epistemických útoků.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: white-team](@/kompendium/glossary-bridges/bridge-white-team.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
