+++
title = "Paradigm shift (změna paradigmatu)"
weight = 50
description = "Kuhnův pojem změny paradigmatu použitý na softwarové inženýrství: od OOP k funkcionálnímu programování a procesnímu modelu OTP/BEAM v Prismatic Platform."

[taxonomies]
tags = ["glossary", "prismatic", "architecture", "science", "philosophy"]

[extra]
category = "core"
status = "active"
author = "Tomas Korcak (korczis)"
reading_time = "19 min"
difficulty = "advanced"
quality_score = 95
related_terms = ["beam-vm", "beam", "otp", "erlang", "elixir", "functional-programming-language", "actor-model", "genserver", "supervision-tree", "supervision", "behaviour", "behaviour-pattern", "architectural-pattern", "architectural-thinking", "autonomous-evolution"]
learning_outcomes = ["Understand Thomas Kuhn's paradigm shift framework and its application to software engineering", "Trace the major paradigm shifts in programming from imperative to functional to process-oriented", "Explain why the BEAM/OTP paradigm represents a fundamental shift in concurrent system design", "Compare the actor model with shared-state concurrency and identify appropriate use cases for each", "Implement paradigm-native Elixir code that leverages OTP patterns rather than fighting them", "Recognize paradigm lock-in and evaluate when a shift is warranted"]
prerequisites = ["architecture", "elixir", "otp", "beam"]
use_cases = ["Evaluating technology migrations", "Designing concurrent systems", "Training teams on new programming paradigms", "Architectural decision records", "Technology strategy development"]
key_technologies = ["Elixir", "Erlang", "OTP", "BEAM VM", "GenServer", "Supervisor", "Actor Model"]
complexity = "advanced"
see_also = ["beam-vm", "otp", "erlang", "elixir", "functional-programming-language", "actor-model"]
date_created = "2026-02-22"
date_updated = "2026-02-22"
version = "2.0.0"
word_count = 2900
date_modified = "2026-11-10"
keywords = ["Paradigm", "Shift", "Comprehensive", "OTPBEAM", "Prismatic", "Platform", "glossary", "core", "Prismatic Platform", "BEAM"]
image = "/images/sections/glossary.png"
image_alt = "Paradigm shift (změna paradigmatu) – glosář"
+++

## Definice

Změna paradigmatu (*paradigm shift*) je zásadní změna výchozích předpokladů, metod a rámců,
jimiž obor chápe svou oblast a přistupuje k ní. Pojem pochází z knihy Thomase Kuhna *The
Structure of Scientific Revolutions* (*Struktura vědeckých revolucí*, 1962). Kuhn v ní tvrdil,
že vědecký pokrok není plynulé, souvislé hromadění poznatků, ale řada revolučních zlomů –
změn paradigmatu –, při nichž se celý pojmový rámec oboru nahradí novým, který je
s předchozím nesouměřitelný (viz heslo [Kuhnova revoluce](@/glossary/kuhnova-revoluce.md)
a kapitolu [7.11 Kuhn: Paradigmatické revoluce a
inkomensurabilita](@/kompendium/07-teoreticke-reflexe/kuhn-paradigmaticke-revoluce.md)).

V softwarovém inženýrství se změny paradigmatu projevují jako zásadní proměny toho, jak
chápeme výpočet, strukturujeme programy, spravujeme stav, zvládáme souběžnost a uvažujeme
o chování systému. Nejde jen o nové nástroje nebo knihovny, ale o nové způsoby myšlení, které
předchozí přístupy činí nejen zastaralými, ale pojmově nedostačujícími. Přechod od
procedurálního k objektově orientovanému programování nespočíval v přidání tříd do C, ale
v novém pojetí programu jako souboru spolupracujících objektů místo posloupnosti instrukcí.
Podobně přechod k funkcionálnímu programování nespočívá v přidání lambda výrazů do Javy, ale
v novém pojetí výpočtu jako vyhodnocování matematických funkcí místo měnění stavu.

Toto heslo pochází z technické dokumentace Prismatic Platform. Pro Kompendium je Kuhnův pojem
důležitý jinak: změna paradigmatu u člověka (konverze, vystoupení ze skupiny) může být
zdravým vývojem i výsledkem manipulace, a kniha proto rozlišuje mezi svobodnou revizí
rámce a vnuceným přepisem (viz [Gestalt Shift](@/glossary/gestalt-shift.md),
[paradigmatická bezdomovina](@/glossary/paradigmaticka-bezdomovina.md)).

## Kuhnův rámec v softwarovém inženýrství

Kuhn popsal opakující se vzorec vědeckých revolucí, který překvapivě dobře odpovídá změnám
technologických paradigmat.

### Normální věda (normální inženýrství)

V obdobích „normální vědy“ pracují odborníci uvnitř zavedeného paradigmatu a řeší hádanky,
které paradigma vymezuje a k jejichž řešení dává nástroje. V softwarovém inženýrství tomu
odpovídají období postupného zlepšování v rámci zavedeného technologického stacku – nové
frameworky pro totéž paradigma, lepší nástroje pro tytéž jazyky, optimalizace existujících
vzorů.

Objektově orientované paradigma ovládalo „normální inženýrství“ od 90. let do 10. let
21. století. V tom období byly základní předpoklady stabilní: programy se organizují jako
hierarchie tříd, stav je zapouzdřen v objektech, souběžnost se řídí sdílenou pamětí se
zámky a návrhové vzory poskytují šablony pro běžné problémy.

### Anomálie

Anomálie jsou problémy, které současné paradigma nedokáže uspokojivě vyřešit. V čase se
hromadí a vytvářejí rostoucí napětí mezi sliby paradigmatu a jeho skutečnými schopnostmi.
V objektově orientovaném paradigmatu se anomálie hromadily kolem souběžnosti (sdílený
měnitelný stav + vlákna = souběhové chyby), distribuce (objekty předpokládají sdílenou
paměť, ale distribuované systémy ji nemají) a složitosti (hluboké hierarchie tříd jsou rigidní
a obtížně se o nich uvažuje).

„Callback hell“ v Node.js, přístup „synchronizovat všechno“ v souběžném programování v Javě
a exploze návrhových vzorů „Gang of Four“ (mnohé z nich obcházejí omezení paradigmatu,
místo aby vyjadřovaly přirozená řešení) jsou anomálie, které signalizovaly meze objektově
orientovaného paradigmatu pro moderní požadavky na systémy.

### Krize a revoluce

Když jsou anomálie příliš četné nebo příliš závažné, než aby je šlo přehlížet, vstupuje
paradigma do krize. Alternativní paradigmata, dříve odbývaná jako akademické kuriozity,
získávají půdu, protože odborníci hledají lepší řešení problémů, které staré paradigma řešit
neumí.

Krize souběžného programování v 10. letech 21. století – hnaná koncem růstu výkonu jednoho
jádra a nástupem distribuovaných systémů – vytvořila podmínky pro změnu paradigmatu směrem
k funkcionálnímu programování, neměnným datovým strukturám a procesně orientovaným modelům
souběžnosti. Virtuální stroj BEAM a jeho framework OTP, původně navržené v 80. letech pro
telekomunikační ústředny, našly novou relevanci jako paradigma, které už vyřešilo problémy,
jež zbytek odvětví teprve objevoval.

## Hlavní změny paradigmatu v softwarovém inženýrství

### Od nestrukturovaného ke strukturovanému programování (60.–70. léta)

Odstranění příkazů GOTO a přijetí strukturovaného řízení toku (if/else, while, for)
představovalo první velkou změnu paradigmatu v programování. Teoretický základ formuloval
Edsger Dijkstra v dopise „Go To Statement Considered Harmful“ (1968) a nové paradigma
ztělesnily jazyky jako Pascal a C.

### Od procedurálního k objektově orientovanému (80.–90. léta)

Přechod od procedur pracujících nad datovými strukturami k objektům, které zapouzdřují data
i chování, změnil způsob, jak programátoři organizují kód. Smalltalk předvedl vizi, C++
a Java ji přivedly do hlavního proudu. Změna zavedla pojmy dědičnost, polymorfismus
a zapouzdření, které se staly převládajícím slovníkem softwarového návrhu.

### Od sekvenčního k souběžnému (první dvě desetiletí 21. století)

Konec Moorova zákona pro výkon jednoho jádra si vynutil přechod od sekvenčního k souběžnému
programování. Vícejádrové procesory se staly všudypřítomnými, ale nástroje převládajícího
paradigmatu pro souběžnost – vlákna a zámky – se ukázaly jako nedostatečné pro stavbu
spolehlivých souběžných systémů. Krize vedla k přijetí alternativních modelů souběžnosti:
aktorů (Erlang/Elixir), komunikujících sekvenčních procesů (Go), softwarové transakční paměti
(Clojure) a async/await (JavaScript, Rust, Python).

### Od imperativního k funkcionálnímu (10. a 20. léta 21. století)

Změna paradigmatu k funkcionálnímu programování nahrazuje měnitelný stav neměnnými daty,
vedlejší účinky čistými funkcemi a imperativní řízení toku deklarativními transformacemi.
Změna stále probíhá – většina hlavních jazyků převzala funkcionální prvky (lambdy,
map/filter/reduce, porovnávání se vzorem), aniž by zcela opustila imperativní základy.

### Od monolitického k distribuovanému (od 2010)

Přechod od monolitických aplikací k distribuovaným systémům (mikroslužby, architektury řízené
událostmi, serverless) je změnou paradigmatu systémové architektury. Mění základní jednotku
nasazení, komunikační model mezi komponentami i způsoby selhání, s nimiž musí systémy počítat.

## Paradigma OTP/BEAM

Virtuální stroj BEAM a framework OTP představují paradigma odlišné od objektově
orientovaného i čistě funkcionálního. Základní jednotkou paradigmatu BEAM je proces – lehká,
izolovaná výpočetní jednotka, která komunikuje výhradně předáváním zpráv.

### Procesně orientované myšlení

V paradigmatu BEAM je každá stavová entita procesem. Uživatelské sezení je proces.
Databázové spojení je proces. I položka cache může být proces. Nejde o optimalizační techniku
ani návrhový vzor – je to základní organizační princip všech programů na BEAM.

Procesní orientace řeší napětí mezi funkcionální čistotou a stavovým výpočtem. Jednotlivé
funkce uvnitř procesu jsou čisté – berou vstupy a vracejí výstupy bez vedlejších účinků. Stav
se spravuje na úrovni procesu rekurzivními smyčkami zpráv (GenServer), čímž vzniká čisté
oddělení čistého výpočtu od stavové interakce.

```elixir
defmodule Prismatic.ParadigmExample.SessionProcess do
  @moduledoc """
  Demonstrates the BEAM paradigm's process-oriented design.

  Each user session is a separate process with isolated state.
  Failures in one session cannot corrupt another. The supervisor
  automatically restarts crashed sessions, providing fault
  tolerance without explicit error handling in business logic.

  This design is impossible to replicate idiomatically in
  object-oriented languages because it relies on:
  1. Lightweight processes (~2KB each, millions possible)
  2. Complete memory isolation (no shared state)
  3. Preemptive scheduling (no process can starve others)
  4. Supervision trees (automatic fault recovery)

  ## The Meta-Rule

  If this code could be written identically in Node.js,
  it is WRONG. Process-oriented design must leverage what
  the BEAM uniquely provides.
  """

  use GenServer

  @type state :: %{
          user_id: String.t(),
          started_at: DateTime.t(),
          last_active: DateTime.t(),
          request_count: non_neg_integer(),
          data: map()
        }

  @spec start_link(keyword()) :: GenServer.on_start()
  def start_link(opts) do
    user_id = Keyword.fetch!(opts, :user_id)
    GenServer.start_link(__MODULE__, opts, name: via_tuple(user_id))
  end

  @spec get_state(String.t()) :: {:ok, state()} | {:error, :not_found}
  def get_state(user_id) do
    case GenServer.whereis(via_tuple(user_id)) do
      nil -> {:error, :not_found}
      pid -> {:ok, GenServer.call(pid, :get_state)}
    end
  end

  @spec record_activity(String.t(), map()) :: :ok | {:error, term()}
  def record_activity(user_id, activity) do
    GenServer.cast(via_tuple(user_id), {:record_activity, activity})
  end

  @impl true
  def init(opts) do
    state = %{
      user_id: Keyword.fetch!(opts, :user_id),
      started_at: DateTime.utc_now(),
      last_active: DateTime.utc_now(),
      request_count: 0,
      data: %{}
    }

    schedule_timeout_check()
    {:ok, state}
  end

  @impl true
  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_cast({:record_activity, activity}, state) do
    updated_state = %{state |
      last_active: DateTime.utc_now(),
      request_count: state.request_count + 1,
      data: Map.merge(state.data, activity)
    }

    {:noreply, updated_state}
  end

  @impl true
  def handle_info(:check_timeout, state) do
    idle_seconds = DateTime.diff(DateTime.utc_now(), state.last_active)

    if idle_seconds > 1800 do
      {:stop, :normal, state}
    else
      schedule_timeout_check()
      {:noreply, state}
    end
  end

  defp schedule_timeout_check do
    Process.send_after(self(), :check_timeout, :timer.minutes(5))
  end

  defp via_tuple(user_id) do
    {:via, Registry, {Prismatic.SessionRegistry, user_id}}
  end
end
```

### Filosofie „let it crash“

Snad nejvíce paradigma měnícím rysem OTP je filosofie „let it crash“ („nech to spadnout“).
V objektově orientovaném paradigmatu je ošetření chyb defenzivní – kód obaluje operace bloky
try/catch, kontroluje návratové hodnoty a snaží se zotavit z každého možného selhání.
V paradigmatu BEAM se od procesů očekává, že při neočekávaných podmínkách spadnou,
a supervizory je automaticky restartují do známého dobrého stavu.

Není to nedbalost; je to záměrné rozhodnutí návrhu založené na pozorování, že většina kódu
pro zotavení z chyb je sama chybová (ošetřuje případy, které programátor předvídal, ale chyby,
které shazují systémy, jsou z definice nepředvídané). Oddělením zotavení z chyb (supervize)
od obchodní logiky (pracovní procesy) dosahuje OTP odolnosti vůči chybám, která je
robustnější a zároveň jednodušší na uvažování než defenzivní programování.

### Supervize jako architektura

V paradigmatu BEAM není [supervizní
strom](https://prismatic-reality-com.github.io/prismatic-promo/glossary/supervision-tree/)
implementačním detailem – je to architektura. Struktura supervizního stromu určuje domény
selhání systému, pořadí inicializace a strategii zotavení každé komponenty. Návrh aplikace
na BEAM začíná návrhem supervizního stromu, ne hierarchie tříd ani struktury modulů.

Umbrella Prismatic Platform (v době zápisu 115 aplikací) je uspořádána jako hierarchie
supervizorů, v níž každá aplikace přispívá svým podstromem do celkového supervizního stromu
platformy. Tato struktura zajišťuje, že selhání v jedné aplikaci (třeba adaptér
[OSINT](@/glossary/osint.md), který narazí na neočekávanou odpověď API) zůstane izolované
v podstromu dané aplikace a neovlivní zbytek platformy.

## Rozpoznání uvíznutí v paradigmatu

Jedním z nejzákeřnějších účinků paradigmatického myšlení je uvíznutí v paradigmatu
(*paradigm lock-in*) – neschopnost vidět řešení mimo pojmový rámec současného paradigmatu.
Vývojáři vyškolení v objektově orientovaném programování často píší „objektově orientovaný
Elixir“ – vytvářejí GenServery, které zrcadlí hierarchie tříd, používají procesy jako objekty
a bojují s funkcionální povahou jazyka, místo aby ji přijali.

Znaky uvíznutí v paradigmatu: GenServery pro bezstavové operace (stačila by funkce), hluboké
hierarchie procesů zrcadlící dědičnost tříd, sahání po měnitelném stavu (ETS, slovník procesu)
tam, kde by neměnné datové struktury byly jednodušší, a implementace návrhových vzorů z OOP,
které ve funkcionálním programování nemají odpovídající potřebu (většina vzorů Gang of Four
řeší problémy, které ve funkcionálních jazycích neexistují).

Metapravidlo Prismatic Platform – „Kdyby šlo stejné řešení napsat identicky v Node.js, je
ŠPATNĚ“ – je heuristikou pro odhalení uvíznutí v paradigmatu. Kód, který nevyužívá jedinečné
schopnosti BEAM (izolaci procesů, supervizi, porovnávání se vzorem, neměnná data), je kód,
který změnu paradigmatu nedokončil.

Kompendium zná analogii u lidí: uvíznutí v rámci, který člověk převzal od skupiny, se
projevuje tím, že každou novou zkušenost překládá do starého slovníku (srov. [Kognitivní
stagnace](@/glossary/kognitivni-stagnace.md)).

## Funkcionální změna podrobněji

Změna paradigmatu k funkcionálnímu programování zahrnuje několik provázaných pojmových změn.

**Neměnnost** odstraňuje celou kategorii chyb – souběhové chyby, neočekávané mutace, zastaralé
reference –, protože datové struktury se po vytvoření nedají změnit. V Elixiru jsou všechna
data neměnná. Operace, které zdánlivě datovou strukturu mění (jako `Map.put/3`), ve
skutečnosti vytvářejí novou strukturu a běhové prostředí efektivně sdílí nezměněné části
(strukturní sdílení).

**Porovnávání se vzorem** (*pattern matching*) nahrazuje podmíněné větvení deklarativním
rozkladem dat. Místo imperativního ověřování podmínek a vybírání hodnot funkce deklarují tvar
dat, který očekávají, a běhové prostředí zvolí odpovídající klauzuli funkce.

**Pipeline** nahrazují vnořená volání funkcí lineárními řetězci transformací dat. Operátor
pipe (`|>`) v Elixiru činí tok dat transformacemi výslovným a čitelným a nahrazuje čtení
vnořených volání „zevnitř ven“ tokem „shora dolů“.

**Algebraické datové typy** (v Elixiru označené n-tice jako `{:ok, value}` a
`{:error, reason}`) nahrazují výjimky u očekávaných selhání, takže ošetření chyb je výslovně
v signaturách funkcí, ne skryté v blocích try/catch.

## Změny paradigmatu v Prismatic Platform

Prismatic Platform ztělesňuje několik změn paradigmatu současně.

**Od monolitu k umbrelle**: architektura umbrella (v době zápisu 115 aplikací) chápe aplikace
jako nezávislé jednotky s výslovnými závislostmi, ne jako monolitickou kódovou základnu
s implicitní provázaností (srov. [Bounded Context](@/glossary/bounded-context.md)).

**Od REST k reálnému času**: Phoenix LiveView posouvá architekturu webových aplikací od cyklů
požadavek–odpověď k trvalým spojením WebSocket se serverem vykreslovanými aktualizacemi,
takže pro interaktivní funkce nejsou potřeba samostatné frontendové aplikace.

**Od ručního k autonomnímu**: infrastruktura [AutoEvolve](@/glossary/autoevolve.md)
a [AutoHeal](@/glossary/autoheal.md) posouvá řízení kvality od ručního code review
k autonomnímu, průběžnému vynucování kvality, které problémy odhaluje a opravuje bez zásahu
člověka.

**Od statického k adaptivnímu**: rámec SEADF a Quality Floor Guardian posouvají provoz systému
od statických konfigurací k adaptivním systémům, které měří vlastní chování a vyvíjejí vlastní
standardy kvality.

## Kdy je změna paradigmatu oprávněná

Ne každá nová technologie představuje změnu paradigmatu a ne každá změna paradigmatu se hodí
do každého kontextu. Rozhodnutí o přijetí nového paradigmatu vyžaduje poctivé posouzení
několika faktorů.

**Soulad problému a paradigmatu**: řeší nové paradigma skutečné anomálie současného přístupu,
nebo problémy, které nemáte? Paradigma BEAM je transformační pro souběžné systémy odolné vůči
chybám; u jednoduchých CRUD aplikací s minimálními požadavky na souběžnost přináší menší
výhodu.

**Připravenost týmu**: změny paradigmatu vyžadují přeškolení. Tým zkušených vývojářů v Javě se
přes noc nestane produktivním týmem v Elixiru. Investici do učení je třeba vážit proti
očekávanému přínosu.

**Zralost ekosystému**: paradigma je jen tak užitečné jako jeho ekosystém. Knihovny, nástroje,
dokumentace a podpora komunity rozhodují, zda se teoretické výhody paradigmatu promítnou do
praktické produktivity.

**Náklady migrace**: existující systémy nelze změnit paradigmaticky „na místě“. Náklady
přepsání, integrace nebo postupné migrace musí být realistické.

## Past nedokončené změny

Mnoho organizací se o změnu paradigmatu pokusí, ale zastaví se v půli a vytvoří hybridní
systémy, které spojují nejhorší stránky obou paradigmat. Psaní kódu ve stylu Javy v Elixiru,
používání vzorů OOP ve funkcionálním jazyce nebo stavba monolitických architektur nasazených
jako mikroslužby jsou příklady nedokončených změn, které zvyšují složitost, aniž by přinesly
výhody kteréhokoli paradigmatu.

Prismatic Platform se této pasti vyhýbá důsledným vynucováním vzorů vlastních paradigmatu:
brány kvality odmítají kód, který nevyužívá vzory OTP, metapravidlo zachytí uvíznutí
v paradigmatu a ekosystém agentů [AIAD](@/glossary/aiad.md) (v době zápisu 530 agentů) pracuje
celý v pojmovém rámci paradigmatu BEAM.

U lidí má „nedokončená změna“ jiný význam: člověk, který opustil jeden rámec a nový ještě
nemá, prožívá [paradigmatickou bezdomovinu](@/glossary/paradigmaticka-bezdomovina.md), v níž je
zvlášť zranitelný vůči nabídce hotového světonázoru. Postup zotavení popisuje protokol
[Paradigm](@/kompendium/recovery-protocols/paradigm.md).

## Související

**Pojmy v tomto glosáři**

- [Kuhnova revoluce](@/glossary/kuhnova-revoluce.md) – filosofický původ pojmu.
- [Gestalt Shift](@/glossary/gestalt-shift.md) – percepční model náhlé změny rámce.
- [Paradigmatická bezdomovina](@/glossary/paradigmaticka-bezdomovina.md) – stav mezi dvěma
  rámci u člověka.
- [AutoEvolve](@/glossary/autoevolve.md) – autonomní vývoj kvality v platformě.

**Hesla platformy mimo tuto knihu**

- [BEAM VM](https://prismatic-reality-com.github.io/prismatic-promo/glossary/beam-vm/),
  [BEAM](https://prismatic-reality-com.github.io/prismatic-promo/glossary/beam/) (Bogdan/Björn's
  Erlang Abstract Machine), [OTP](https://prismatic-reality-com.github.io/prismatic-promo/glossary/otp/),
  [Erlang](https://prismatic-reality-com.github.io/prismatic-promo/glossary/erlang/),
  [Elixir](https://prismatic-reality-com.github.io/prismatic-promo/glossary/elixir/) –
  virtuální stroj, framework a jazyky paradigmatu.
- [Functional Programming Language](https://prismatic-reality-com.github.io/prismatic-promo/glossary/functional-programming-language/),
  [Actor Model](https://prismatic-reality-com.github.io/prismatic-promo/glossary/actor-model/),
  [GenServer](https://prismatic-reality-com.github.io/prismatic-promo/glossary/genserver/),
  [Supervision Tree](https://prismatic-reality-com.github.io/prismatic-promo/glossary/supervision-tree/),
  [Behaviour](https://prismatic-reality-com.github.io/prismatic-promo/glossary/behaviour/) –
  funkcionální paradigma, model aktorů a hlavní abstrakce OTP.
- [Architectural Pattern](https://prismatic-reality-com.github.io/prismatic-promo/glossary/architectural-pattern/),
  [Autonomous Evolution](https://prismatic-reality-com.github.io/prismatic-promo/glossary/autonomous-evolution/) –
  vzory napříč paradigmaty a samozdokonalující se systémy.

**Kniha**

- [7.11 Kuhn: Paradigmatické revoluce a inkomensurabilita](@/kompendium/07-teoreticke-reflexe/kuhn-paradigmaticke-revoluce.md) –
  Kuhnův rámec ve vztahu k EA.
- [Protokol Paradigm](@/kompendium/recovery-protocols/paradigm.md) – zotavení po rozpadu
  světonázoru.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)
