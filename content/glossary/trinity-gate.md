+++
title = "Trinity Gate (brána Trinity)"
weight = 32
description = "Čtyřvrstvá ověřovací brána Prismatic Platform: strukturní, logická a formální kontrola nutnosti plus metavrstva integrity, než se přijme jakékoli přesvědčení."

[taxonomies]
tags = ["glossary", "prismatic", "nabla", "evidence", "epistemic-pipeline"]

[extra]
category = "epistemic"
related_terms = ["nabla-infinity", "signal-plurality", "confidence-threshold", "white-team", "qeve", "agent", "entity-resolution", "epistemic-pipeline", "lean4", "property-based-testing", "provenance-mandatory", "purple-team", "qdp", "three-nl", "nm-nd", "no-mercy", "no-doubts", "blue-team"]
status = "active"
author = "Tomas Korcak (korczis)"
reading_time = "20 min"
difficulty = "advanced"
quality_score = 97
platforms = ["Prismatic Platform", "BEAM/OTP"]
key_takeaway = "Trinity Gate requires independent structural, logical, and formal necessity verification plus meta-integrity before any platform belief transitions from hypothesis to accepted conclusion"
date_created = "2026-02-22"
date_updated = "2026-02-22"
related_concepts = ["epistemic verification", "formal necessity", "modal logic", "graph theory", "belief networks", "multi-layer validation"]
see_also = ["nabla-infinity", "lean4", "nm-nd", "epistemic-pipeline", "white-team"]
word_count = 1939
date_modified = "2026-11-10"
keywords = ["Trinity", "Gate", "4-layer", "glossary", "epistemic", "Prismatic Platform", "Trinity Gate", "NABLA Infinity", "Core"]
image = "/images/sections/glossary.png"
image_alt = "Trinity Gate (brána Trinity) – glosář"
+++

## Definice

Trinity Gate je čtyřvrstvý ověřovací mechanismus, kterým musí před přijetím projít každé
přesvědčení, rozhodnutí a závěr platformy. Skládá se ze tří nezávislých ověřovacích bran –
strukturní konzistence (teorie grafů), logické konzistence (vyhodnocení podle pravidel)
a formální nutnosti (modální logika a důkazy v Lean4) – a z metavrstvy integrity, která ověřuje
správnost brány samotné. Žádné tvrzení nevznikne bez průchodu Trinity. Bez výjimek.

Brána existuje, aby řešila základní problém uvažování s asistencí umělé inteligence: mezeru mezi
„model si to myslí“ a „takhle to skutečně je“. Samotná statistická důvěra pro rozhodnutí
s vysokými sázkami nestačí. Systém si může být na 95 % jistý závěrem, který je strukturně
nesoudržný, logicky rozporný nebo formálně nenutný. Trinity Gate tyto mezery uzavírá tím, že
před přechodem přesvědčení z hypotézy na přijatý závěr vyžaduje nezávislé ověření ve třech
navzájem kolmých dimenzích.

V Prismatic Platform slouží Trinity Gate jako přechodový práh mezi zkoumáním v [NABLA
Infinity](@/glossary/nabla-infinity.md) a exekucí podle [NM/ND](@/glossary/nm-nd.md). Podle
dokumentace platformy bylo v době zápisu evidováno 629 entit Trinity se 100% souladem.

Pro Kompendium je Trinity Gate pojmem z kontextu platformy. Kniha z ní přebírá tři otázky,
které se hodí i při posuzování lidských přesvědčení v kauzách EA: Je řetězec důvodů kruhový?
Plyne závěr z premis, nebo je přesahuje? Je závěr nutný, nebo jen možný? (viz [Trinity Gate
a detekce EA](@/kompendium/aiad-integration/trinity-gate-ea-verification.md)).

## Tři brány

### Brána 1: Strukturní konzistence (teorie grafů)

První brána ověřuje topologickou integritu sítě přesvědčení analýzou z [teorie
grafů](@/glossary/graph-theory.md):

**Základní požadavek**: síť přesvědčení musí tvořit platný orientovaný acyklický graf (DAG) bez
strukturních rozporů v topologii závislostí.

Ověření strukturní konzistence zahrnuje:

- **platnost DAG**: graf přesvědčení musí být acyklický. Kruhové uvažování (A podporuje B, B
  podporuje C, C podporuje A) je strukturním selháním bez ohledu na to, jak věrohodně působí
  jednotlivé vazby (srov. [kruhová argumentace](@/glossary/cirkularni-argumentace.md));
- **integrita závislostí**: každý uzel závěru musí jít platnými hranami dohledat k uzlům důkazů.
  Odpojené závěry (přesvědčení bez cesty k podpůrným důkazům) se označí a odmítnou;
- **topologie rozporu**: existují-li protichůdné důkazy, musí graf výslovně reprezentovat obě
  strany s řádnou poznámkou, místo aby jednu potichu zahodil. Tím se na strukturní úrovni
  vynucuje axiom zachování rozporu z [NABLA Infinity](@/glossary/nabla-infinity.md);
- **ověření inferenčních cest**: topologie poznatků musí podporovat směr inference. Důkazy proudí
  nahoru k závěrům, ne naopak. Zpětné vytváření důkazů (přizpůsobení důkazů předem danému
  závěru) vytváří odhalitelné strukturní anomálie.

Strukturní konzistence se vyhodnocuje nejrychleji a je nejčastějším místem selhání. Přibližně
40 % odmítnutí Trinity Gate nastává v této fázi, obvykle kvůli kruhovému uvažování nebo
osiřelým uzlům přesvědčení.

### Brána 2: Logická konzistence (podle pravidel)

Druhá brána hodnotí, zda jsou inferenční pravidla použitá ve strukturně platném grafu správná:

**Základní požadavek**: závěry nesmějí odporovat premisám, inferenční pravidla musí být platná
a v žádném kroku nesmějí být porušeny axiomy [NABLA Infinity](@/glossary/nabla-infinity.md).

Ověření logické konzistence zahrnuje:

- **soulad premis a závěru**: každý závěr musí z uvedených premis plynout platným inferenčním
  pravidlem. Závěry, které tvrdí víc, než premisy podporují, se označí jako přesah;
- **správnost pravidel**: ověřují se i samotná inferenční pravidla. Pravidlo, které z týchž vstupů
  vytváří rozporné výstupy, je nesprávné, i když v daném případě náhodou dá správný výsledek;
- **soulad s axiomy**: v každém inferenčním kroku se kontroluje všech sedm [axiomů
  NABLA](@/glossary/nabla-axioms.md). Porušení [plurality signálů](@/glossary/signal-plurality.md)
  (přesvědčení z jediného zdroje), [povinné
  provenience](https://prismatic-reality-com.github.io/prismatic-promo/glossary/provenance-mandatory/)
  (nedohledatelná tvrzení) a další porušení axiomů spouštějí okamžité selhání brány;
- **sledování předpokladů**: každý předpoklad zavedený při inferenci se výslovně sleduje. Skryté
  předpoklady – premisy, které se používají, ale nikdy nevysloví – se odhalují analýzou
  závislostí a označují jako prosakování předpokladů.

Logická konzistence zachytí chyby, které strukturní analýza mine. Graf přesvědčení může být
dokonale platným DAG a přitom obsahovat logicky nesprávné inferenční kroky. Tato brána zajišťuje,
že uvažování je správné, ne jen správně utvořené.

### Brána 3: Formální nutnost (modální logika + Lean4)

Třetí brána je nejpřísnější. Pomocí [modální logiky](@/glossary/modalni-logika.md) a formálních
důkazů v [Lean4](https://prismatic-reality-com.github.io/prismatic-promo/glossary/lean4/) určuje,
zda je závěr nejen pravděpodobný, ale **nutný**:

**Základní požadavek**: závěr musí být při daných důkazech prokazatelně nutný, ne jen možný nebo
pravděpodobný.

Ověření formální nutnosti zahrnuje:

- **vyhodnocení v modální logice**: rozlišuje nutnost (závěr musí platit ve všech možných světech
  slučitelných s důkazy) a možnost (závěr může platit v některých možných světech). U kritických
  rozhodnutí možnost nestačí;
- **dokazování v Lean4**: jádro tvrzení se převede na větu v Lean4 a podrobí formálnímu důkazu.
  Lze-li větu dokázat, je závěr formálně nutný. Nelze-li ji dokázat ani vyvrátit, je závěr možný,
  ale ne nutný. Najde-li se protipříklad, je závěr formálně vyvrácen;
- **minimalita předpokladů**: formální důkaz se audituje, aby používal minimum nutných
  předpokladů. Důkazy, které závisejí na zbytečných předpokladech, jsou křehké – odebrání
  zbytečného předpokladu by nemělo důkaz zneplatnit;
- **konstrukce protipříkladu**: když důkaz selže, systém se pokusí sestrojit výslovný protipříklad.
  Konkrétní protipříklad je mnohem informativnější než obecné „důkaz selhal“, protože určuje
  konkrétní podmínky, za nichž se závěr hroutí.

Formální vrstva je výpočetně náročná a uplatňuje se výběrově u závěrů s vysokými sázkami. U běžných
operací stačí strukturní a logická brána. U kritických rozhodnutí (práh důvěry 0,95) jsou povinné
všechny tři brány.

## Metavrstva integrity

Nad třemi hlavními branami ověřuje čtvrtá metavrstva samotný mechanismus brány:

- **ověření nezávislosti bran**: potvrzuje, že tři brány hodnotí nezávisle a průchod jednou branou
  neovlivňuje hodnocení jiné;
- **kontrola úplnosti**: ověřuje, že ověření pokrylo celý rozsah tvrzení, ne jeho část. Částečné
  ověření, které projde, protože zkontrolovalo jen snadné části, je selháním metaintegrity;
- **audit sebekonzistence**: metavrstva uplatňuje tytéž strukturní, logické a formální kontroly na
  vlastní hodnoticí proces a brání rekurzivním selháním ověření;
- **detekce manipulace**: odhaluje jakýkoli pokus kontroly brány obejít nebo oslabit – změnou
  konfigurace, výběrovým předložením důkazů nebo zúžením rozsahu.

Metavrstva integrity brání tomu, aby se z Trinity Gate stalo razítko. Bez ní by brána mohla
s hromaděním hraničních případů a normalizací obcházení časem degradovat.

## Architektura implementace

Trinity Gate je implementována jako pipeline nezávislých ověřovacích fází, které pracují se
stejným vstupním tvrzením, ale vydávají nezávislé verdikty:

```elixir
defmodule PrismaticEpistemic.TrinityGate do
  @moduledoc """
  4-layer verification gate for platform beliefs.
  All three gates plus meta-integrity must pass for acceptance.
  No claim is established without Trinity passage.
  """

  @type claim :: %{
    id: String.t(),
    proposition: String.t(),
    evidence: [evidence_ref()],
    belief_graph: Graph.t(),
    confidence: float(),
    context: :critical | :standard | :exploratory | :research
  }

  @type gate_result :: %{
    gate: :structural | :logical | :formal | :meta,
    verdict: :pass | :fail,
    details: map(),
    duration_ms: non_neg_integer()
  }

  @type trinity_result :: %{
    claim_id: String.t(),
    passed: boolean(),
    gates: [gate_result()],
    meta_integrity: gate_result(),
    evaluated_at: DateTime.t()
  }

  @spec evaluate(claim()) :: {:ok, trinity_result()} | {:error, term()}
  def evaluate(claim) do
    with {:ok, structural} <- evaluate_structural(claim),
         {:ok, logical} <- evaluate_logical(claim),
         {:ok, formal} <- evaluate_formal(claim, claim.context),
         {:ok, meta} <- evaluate_meta_integrity([structural, logical, formal]) do
      result = %{
        claim_id: claim.id,
        passed: all_passed?([structural, logical, formal, meta]),
        gates: [structural, logical, formal],
        meta_integrity: meta,
        evaluated_at: DateTime.utc_now()
      }

      emit_telemetry(result)
      {:ok, result}
    end
  end

  defp all_passed?(results) do
    Enum.all?(results, &(&1.verdict == :pass))
  end

  defp emit_telemetry(result) do
    :telemetry.execute(
      [:prismatic, :epistemic, :trinity_gate, :evaluation],
      %{duration_ms: total_duration(result), passed: result.passed},
      %{claim_id: result.claim_id, context: :standard}
    )
  end
end
```

## Prahy důvěry

Trinity Gate pracuje ve spojení se systémem [prahů
důvěry](https://prismatic-reality-com.github.io/prismatic-promo/glossary/confidence-threshold/).
Požadovaná úroveň důvěry a přísnost brány se liší podle kontextu:

| Kontext | Práh (τ) | Trinity Gate | Zdůvodnění |
|---------|---------|--------------|-----------|
| kritická rozhodnutí | 0,95 | POVINNÁ (všechny 3 brány + meta) | produkční nasazení, bezpečnostní posouzení, určení souladu |
| běžný provoz | 0,80 | POVINNÁ (všechny 3 brány + meta) | rutinní provoz platformy, rozhodnutí agentů, zpracování dat |
| průzkumná analýza | 0,60 | DOPORUČENÁ | výzkum, tvorba hypotéz, zkoumání vzorců |
| výzkumné dotazy | 0,50 | VOLITELNÁ | spekulativní analýza, šetření v rané fázi |

Práh je minimálním skóre důvěry z [QEVE](@/glossary/qeve.md), které je potřeba, aby se ověření
v Trinity Gate vůbec zahájilo. Hypotéza s důvěrou 0,70 v kontextu kritického rozhodnutí (práh 0,95)
se odmítne dřív, než k bráně dojde. Tím se nemrhá výpočetním výkonem na formální důkazy závěrů,
kterým chybějí dostatečné důkazy.

## Napojení na doktrínu NM/ND

Trinity Gate je mostem mezi zkoumáním a exekucí v doktríně [NM/ND](@/glossary/nm-nd.md) (No
Mercy, No Doubts):

```
EXPLORATION PHASE (NABLA Infinity)
  - Maps uncertainty
  - Preserves contradictions
  - Maintains parallel hypotheses
  - Computes confidence scores
        |
        v
TRANSITION CONDITION
  confidence >= 0.95
  AND trinity_gate.passed (all 3 layers + meta)
  AND axioms_compliant (all 7 NABLA axioms satisfied)
        |
        v
EXECUTION PHASE (No Mercy, No Doubts)
  - Decisive action
  - Complete delivery
  - Zero tolerance for incomplete implementation
  - Full commitment to verified conclusion
```

Přechod je v rámci jednoho rozhodovacího cyklu jednosměrný a nevratný. Jakmile Trinity Gate projde
a exekuce začne, vyžaduje doktrína [No
Mercy](https://prismatic-reality-com.github.io/prismatic-promo/glossary/no-mercy/) úplné dotažení.
Neexistuje částečná exekuce ani kličkování. Přísnost brány ospravedlňuje rozhodnost jednání.

Napojení brání dvěma selháním:

1. **Předčasná exekuce**: jednání na základě neověřených přesvědčení, protože se „zdají správná“
   nebo protože časový tlak vyžaduje rozhodnutí. Trinity Gate vynucuje pauzu.
2. **Nekonečné zkoumání**: nikdy se nezavázat k jednání, protože vždy existují další důkazy ke
   shromáždění ([paralýza analýzou](@/glossary/paralysis-by-analysis.md)). Práh důvěry a průchod
   branou dávají jasný, objektivní spouštěč přechodu.

## Analýza selhání a diagnostika

Když hodnocení v Trinity Gate selže, systém vytvoří podrobné diagnostické informace, které
umožňují rychlé vyřešení. Každé selhání brány obsahuje konkrétní podmínky, které vedly
k odmítnutí, a důkazy, které by byly k vyřešení potřeba.

```elixir
defmodule PrismaticEpistemic.TrinityGate.Diagnostics do
  @moduledoc """
  Produces detailed failure diagnostics for Trinity Gate rejections.
  Each failure report identifies the specific gate, the failure mode,
  and the remediation path.
  """

  @type failure_diagnostic :: %{
    gate: :structural | :logical | :formal,
    failure_mode: atom(),
    description: String.t(),
    affected_nodes: [String.t()],
    remediation: String.t(),
    evidence_needed: [String.t()]
  }

  @spec diagnose(map()) :: {:ok, [failure_diagnostic()]}
  def diagnose(%{verdict: :fail, gate: :structural, details: details}) do
    diagnostics = []

    diagnostics =
      if details[:cycles] do
        [%{
          gate: :structural,
          failure_mode: :circular_reasoning,
          description: "Belief graph contains #{length(details.cycles)} cycle(s)",
          affected_nodes: List.flatten(details.cycles),
          remediation: "Break circular dependencies by identifying independent evidence",
          evidence_needed: ["Independent evidence for at least one node in each cycle"]
        } | diagnostics]
      else
        diagnostics
      end

    diagnostics =
      if details[:orphaned_nodes] do
        [%{
          gate: :structural,
          failure_mode: :orphaned_conclusions,
          description: "#{length(details.orphaned_nodes)} conclusion(s) lack evidence paths",
          affected_nodes: details.orphaned_nodes,
          remediation: "Connect orphaned conclusions to evidence nodes or remove them",
          evidence_needed: Enum.map(details.orphaned_nodes, &"Evidence for #{&1}")
        } | diagnostics]
      else
        diagnostics
      end

    {:ok, diagnostics}
  end
end
```

## Protokol vynucení

Selhání Trinity Gate spouštějí stupňované reakce vynucení:

| Úroveň | Spouštěč | Reakce | Autorita |
|-------|---------|----------|-----------|
| **E1** | porušení měkkého axiomu v průzkumném kontextu | varování, žádost o opravu | úroveň agenta |
| **E2** | porušení tvrdého axiomu nebo selhání jedné brány | BLOCK – operace zastavena, vydáno odmítnutí | úroveň systému |
| **E3** | selhání Trinity Gate (kterékoli brány v povinném kontextu) | HALT – povinný přezkum, žádný obchvat | nejvyšší autorita |
| **E4** | více porušení axiomů nebo selhání metaintegrity | zahájeno šetření, nutný úplný audit | cosmic clearance |

Vynucení E3 je nejčastějším důsledkem interakce s Trinity Gate. Když v povinném kontextu selže
kterákoli ze tří bran, celé hodnocení se zastaví. Selhání se zaznamená s úplnými diagnostickými
informacemi: která brána selhala, proč a jaké důkazy by byly k vyřešení potřeba. Obchvat
neexistuje. Závěr se musí buď znovu vyhodnotit s dalšími důkazy, nebo odmítnout.

Vynucení E4 je vyhrazeno selháním metaintegrity a systematickým porušením. Selhání metaintegrity
naznačuje, že byl kompromitován samotný ověřovací mechanismus, což ohrožuje epistemický základ
všech následných rozhodnutí. Spouštěče E4 vyžadují cosmic clearance (nejvyšší úroveň autority
v platformě) a vedou k úplnému auditu všech nedávných hodnocení v Trinity Gate.

## Statistiky platformy

Dokumentace platformy v době zápisu uváděla tyto statistiky provozu Trinity Gate:

| Metrika | Hodnota |
|--------|-------|
| celkem entit Trinity | 629 |
| míra souladu | 100 % |
| průměrná doba hodnocení (strukturní) | 12 ms |
| průměrná doba hodnocení (logické) | 45 ms |
| průměrná doba hodnocení (formální) | 250–2000 ms |
| podíl odmítnutí (strukturní) | ~40 % selhání |
| podíl odmítnutí (logické) | ~35 % selhání |
| podíl odmítnutí (formální) | ~25 % selhání |

Rozložení odmítnutí mezi branami odráží jejich doplňující se role: strukturní kontroly zachytí
nejčastější chyby (kruhové uvažování, osiřelé uzly), logické kontroly chyby uvažování, které
strukturním ověřením projdou, a formální kontroly nejjemnější problémy, kdy jsou závěry možné, ale
ne nutné.

## Proč Trinity Gate existuje

Trinity Gate řeší konkrétní kategorii selhání, kterou běžné ověřování umělé inteligence přehlíží:
mezeru mezi důvěrou a pravdou.

**Důvěra není důkaz.** Jazykový model si může být na 99 % jistý fakticky nesprávným tvrzením.
Statistická důvěra měří, jak silně model něčemu věří, ne zda je to pravda. Strukturní konzistence
zajišťuje soudržnost sítě přesvědčení. Logická konzistence zajišťuje správnost uvažování. Formální
nutnost zajišťuje, že závěr je důkazy vynucen, ne jimi jen naznačen.

**Pocity nejsou důkazy.** Lidští analytici i systémy umělé inteligence si vytvářejí intuice, které
se zdají správné, ale postrádají přísné ukotvení. Trinity Gate vyžaduje, aby každý přijatý závěr
prošel třemi nezávislými ověřovacími metodami. Intuice, která obstojí ve strukturním, logickém
i formálním zkoumání, je ověřená intuice. Intuice, která neprojde kteroukoli branou, se odmítne,
ať působí jakkoli přesvědčivě.

**Pravděpodobnost není nutnost.** Závěr, který je na 95 % pravděpodobný, je stále na 5 % chybný.
U kritických rozhodnutí – bezpečnostních posouzení, určení souladu, [due diligence](@/glossary/due-diligence.md) u akvizic – není
otázkou „jak pravděpodobné?“, ale „je to nutné?“. Formální brána (modální logika + Lean4) na tuto
otázku odpovídá přímo.

**Ověření musí ověřovat samo sebe.** Každý ověřovací systém, který nekontroluje vlastní integritu,
je zranitelný vůči degradaci. Metavrstva brání tomu, aby se Trinity Gate stala formalitou –
políčkem, které vždy projde, protože nikdo nekontroluje, zda funguje samo políčko.

[Purple Team](@/glossary/purple-team.md) (syntéza a uzavírání) je organizačním doplňkem Trinity
Gate a zajišťuje, že smyčka útoku a obrany Red–Blue dospěje ke skutečnému uzavření, ne
k falešnému vyřešení.

## Meze přenosu na lidské poznání

U lidí nelze požadovat „formální nutnost“ každého přesvědčení – většina lidského poznání je
pravděpodobnostní a opírá se o důvěru ve svědectví. Kniha proto bránu nepřenáší jako normu, ale
jako diagnostickou pomůcku: manipulativní systémy přesvědčení často vykazují právě strukturní
vady, které brána zachycuje (kruhové zdůvodnění „vůdce má pravdu, protože to říká vůdce“, závěry
přesahující premisy, skryté předpoklady; srov. [EA-1.3.1 Imunizace proti
falsifikaci](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md)).

## Související

**Pojmy platformy v tomto glosáři**

- [NABLA Infinity](@/glossary/nabla-infinity.md) – epistemický rámec, jehož axiomy brána vynucuje.
- [QEVE](@/glossary/qeve.md) – ověřovací engine, který dodává vstupy brány.
- [NM/ND](@/glossary/nm-nd.md) – exekuční doktrína, kterou průchod branou umožňuje.
- [White Team](@/glossary/white-team.md) – konstruktivní ověřovací tým, který vytváří formální důkazy.
- [Purple Team](@/glossary/purple-team.md) – syntetický tým uzavírání smyčky Red–Blue.
- [Signal Plurality](@/glossary/signal-plurality.md) – axiom kontrolovaný v logické bráně.
- [Epistemic Pipeline](@/glossary/epistemic-pipeline.md) – šestnáctiúrovňová pipeline, v níž
  brána působí.
- [Modální logika](@/glossary/modalni-logika.md) – logický základ formální brány.

**Hesla a přehledy platformy mimo tuto knihu**

- [Lean4](https://prismatic-reality-com.github.io/prismatic-promo/glossary/lean4/),
  [Confidence Threshold](https://prismatic-reality-com.github.io/prismatic-promo/glossary/confidence-threshold/),
  [Provenance Mandatory](https://prismatic-reality-com.github.io/prismatic-promo/glossary/provenance-mandatory/),
  [3NL Framework](https://prismatic-reality-com.github.io/prismatic-promo/glossary/three-nl/),
  [Property-Based Testing](https://prismatic-reality-com.github.io/prismatic-promo/glossary/property-based-testing/).
- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/),
  [Technologie](https://prismatic-reality-com.github.io/prismatic-promo/technologies/).

**Kniha**

- [Trinity Gate a detekce EA](@/kompendium/aiad-integration/trinity-gate-ea-verification.md) –
  ověřování v detekci epistemických útoků.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: trinity-gate](@/kompendium/glossary-bridges/bridge-trinity-gate.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
