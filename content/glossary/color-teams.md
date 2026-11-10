+++
title = "Color Teams (barevné týmy)"
weight = 18
description = "Šest útočně-obranných bezpečnostních týmů Prismatic Platform, které strukturovaným tokem signálů a syntézou útoku a obrany chrání epistemickou integritu platformy."

[taxonomies]
tags = ["glossary", "security", "color-teams", "prismatic", "epistemic"]

[extra]
category = "security"
related_terms = ["red-team", "blue-team", "purple-team", "gray-team", "white-team", "black-team", "attack-surface", "chaos-engineering", "easm", "hawkeye", "lean4", "qeve", "rbac", "threat-intelligence", "agent-tier", "agent-registry", "nabla-infinity", "trinity-gate", "epistemic-pipeline", "formal-verification", "consciousness-traits"]
domain = "epistemic-security"
complexity = "advanced"
maturity = "production"
platform_adoption = "core"
total_agents = 20
total_teams = 6
agent_tiers = ["L2", "L3", "L4"]
safety_critical_agents = 3
elixir_modules = ["PrismaticDark.Red.Commander", "PrismaticDark.Blue.Commander", "PrismaticDark.Purple.Coordinator", "PrismaticDark.White.Commander", "PrismaticDark.Gray.Commander", "PrismaticDark.Black.Commander"]
signal_flow = "Gray -> Red -> Purple -> Blue"
isolation_level = "sandbox"
ethics_check_interval = "10-15 seconds"
enforcement_level = "cosmic"
documentation_quality = "academic"
last_updated = "2026-11-10"
version = "2.0.0"
author = "Tomas Korcak (korczis)"
quality_score = 90
+++

## Definice a přehled

**Color Teams** (barevné týmy) je souhrnné označení šesti specializovaných bezpečnostních
týmů, které na Prismatic Platform zajišťují epistemickou bezpečnost syntézou útoku a obrany.
Týmy – Gray (průzkum hranic), Red (adversariální simulace), Blue (epistemická obrana),
Purple (syntéza a uzavírání), White (konstruktivní ověřování) a Black (teoretické modelování
hrozeb) – provozují 20 agentů ve strukturované architektuře toku signálů, v níž zjištění
postupují od průzkumu přes adversariální testování k ověřené obraně. Dohromady tvoří
uzavřený bezpečnostní ekosystém: každý obranný postoj je testován proti adversariálním
scénářům, každé adversariální zjištění je přiřazeno obranné reakci a každé tvrzení
o bezpečnosti je formálně ověřeno v [Trinity Gate](@/glossary/trinity-gate.md).

Architektura čerpá z vojenských a zpravodajských tradic, v nichž se samostatné týmy
s odlišnými pohledy a mandáty sbíhají ke společnému cíli. Bezpečnostní organizace používají
red teamy (útok) a blue teamy (obrana) od dob studené války; purple teamy, které obě strany
propojují, se rozšířily v 10. letech 21. století. Klíčovou novinkou implementace platformy je
**epistemické zaměření**: Color Teams netestují v tradičním smyslu síťovou obranu nebo
zranitelnosti aplikací, ale schopnost platformy utvářet přesná přesvědčení, odolávat
manipulaci svých znalostních systémů a zachovat epistemickou integritu pod adversariálním
tlakem. Je to bezpečnost uplatněná na samotný proces uvažování (viz [Epistemic
Security](@/glossary/epistemic-security.md)).

Veškeré operace Color Teams jsou výhradně simulační – se syntetickými daty v kontextech
soutěží CTF (*Capture The Flag*), obranného výzkumu a autorizovaných penetračních testů.
Žádný agent nemá přístup k produkčním datům, osobním údajům ani živému stavu systému. Omezení
je vynuceno izolací v sandboxu, síťovými restrikcemi a nepřetržitými etickými kontrolami
každých 10–15 sekund ve všech týmech.

**Vztah ke knize:** Color Teams patří do kontextu platformy, z níž Kompendium vzešlo, a jsou
jedním z míst, kde se taxonomie knihy uplatňuje obranně: Red Team simuluje epistemické útoky,
které kniha popisuje, Blue Team proti nim staví důkazní obranu. Jednotlivé týmy v souvislosti
s technikami EA popisují stránky [Red Team: detekce EA](@/kompendium/aiad-integration/red-team-ea-detection.md),
[Blue Team: obrana proti EA](@/kompendium/aiad-integration/blue-team-ea-defense.md),
[Purple Team: syntéza](@/kompendium/aiad-integration/purple-team-ea-synthesis.md),
[White Team: ověřování](@/kompendium/aiad-integration/white-team-ea-verification.md),
[Gray Team: okrajové případy](@/kompendium/aiad-integration/gray-team-ea-edge-cases.md)
a [Black Team: modelování](@/kompendium/aiad-integration/black-team-ea-modeling.md).

## Historický kontext a teoretický základ

Myšlenka adversariálního testování je starší než počítače. Válečné hry, v nichž jeden tým
hraje protivníka (rudé síly) a druhý se brání (modré síly), sahají k pruské *Kriegsspiel* 19.
století. Během studené války se v americkém obranném plánování ustálila praxe vyčleňovat
skupiny, které myslí jako protivník a hledají slabiny vojenských plánů a systémů.

Kybernetická bezpečnost tato barevná označení převzala zhruba od 90. let. Red teamy
prováděly penetrační testy, blue teamy provozovaly bezpečnostní dohledová centra a pojem
purple team vznikl, když organizace zjistily, že útok a obrana jsou nejúčinnější v těsném
propojení. V 10. letech poskytl rámec MITRE ATT&CK oběma stranám společný slovník.

Color Teams platformy tuto tradici rozšiřují třemi směry. Za prvé přidávají Gray Team (průzkum
hranic) a Black Team (teoretické modelování hrozeb), aby pokryly epistemické otázky, které
tradiční bezpečnostní týmy přehlížejí. Za druhé přidávají White Team (konstruktivní
ověřování), který do bezpečnostní smyčky vnáší formální metody – důkazy v Lean4, testování
založené na vlastnostech, validaci kontraktů. Za třetí působí na epistemické úrovni a testují
nejen systémy, ale schopnost platformy správně uvažovat za adversariálních podmínek. Tento
posun odráží zvláštní bezpečnostní požadavky platforem postavených na umělé inteligenci, kde
je sám proces uvažování kritickou útočnou plochou.

## Šest týmů

### Gray Team – průzkum hranic (3 agenti)

[Gray Team](@/glossary/gray-team.md) provádí průzkum mezer ve specifikacích, okrajových
případů a posunu možností jen pro čtení. Jeho mandátem je odhalit nejednoznačnost, nikoli ji
vyřešit – najít hranice, kde se chování systému stává nedefinovaným nebo nečekaným. Ve všech
operacích vynucuje nulovou změnu stavu, takže průzkum nikdy nemění zkoumané systémy.

| Agent | Oprávnění | Role |
|-------|-----------|------|
| `gray-explorer-commander` | L3 Strategic | řídí kampaně Gray, směruje zjištění k Red/Blue/Purple |
| `gray-edge-finder` | L4 Specialist | analýza hraničních hodnot, hledání mezer ve specifikacích |
| `gray-escalation-guard` | L4 Safety-Critical | brání eskalaci z Gray do Black, oprávnění zastavit operace |

`gray-escalation-guard` je zvlášť důležitý – brání tomu, aby průzkum hranic nechtěně vstoupil
na území [Black Teamu](@/glossary/black-team.md), a udržuje tak izolační hranici mezi
průzkumnou a teoretickou doménou hrozeb. Má oprávnění zastavit každou operaci Gray, která se
blíží prahu eskalace.

### Red Team – adversariální simulace (4 agenti)

[Red Team](@/glossary/red-team.md) simuluje epistemické útoky pěti definovanými primitivy:
zkreslení pravdy, manipulace důvěrou, otrávení signálu, vyvolání posunu a únos salience.
Veškeré provádění probíhá v sandboxu jen se syntetickými daty a každý scénář se zapisuje do
neměnné auditní stopy. Zjištění Red Teamu putují k [Purple Teamu](@/glossary/purple-team.md)
k syntéze a k [Blue Teamu](@/glossary/blue-team.md) k obranné reakci.

| Agent | Oprávnění | Role |
|-------|-----------|------|
| `red-commander` | L3 Strategic | řídí adversariální scénáře, předává zjištění Purple/Blue |
| `red-epistemic-attacker` | L2 Tactical | simulace zkreslení pravdy a otrávení zdrojů |
| `red-drift-inducer` | L2 Tactical | útoky podprahovým posunem, analýza kaskádového šíření |
| `red-scenario-generator` | L2 Tactical | skládá scénáře z více technik podle taxonomie s 329 položkami |

Taxonomie scénářů Red Teamu obsahuje (v době zápisu) 329 položek uspořádaných podle útočného
primitiva, cílového subsystému a úrovně složitosti. Každý scénář obsahuje předpoklady,
očekávané indikátory a detekční signatury, které přímo vstupují do konfigurace sledování
Blue Teamu. Pět primitiv odpovídá strukturálně vzorcům, které Kompendium popisuje u lidí –
od [gaslightingu](@/glossary/gaslighting.md) (zkreslení pravdy) po [Firehose of
Falsehood](@/glossary/firehose-of-falsehood.md) (únos salience).

### Blue Team – epistemická obrana (4 agenti)

[Blue Team](@/glossary/blue-team.md) udržuje obranný postoj platformy syntézou důkazů. Na
rozdíl od tradičních blue teamů, které reagují na aktivní hrozby, vytváří strukturovaná
hodnocení důkazů ukotvená v axiomech [NABLA Infinity](@/glossary/nabla-infinity.md). Slučuje
signály z více domén, odhaluje behaviorální a konfigurační posun a udržuje průběžně
aktualizovaný obranný postoj.

| Agent | Oprávnění | Role |
|-------|-----------|------|
| `blue-commander` | L3 Strategic | slučuje důkazy specialistů do jednotného obranného postoje |
| `blue-auth-sentinel` | L2 Operational | sledování hranice autentizace, detekce eskalace oprávnění |
| `blue-drift-detector` | L2 Operational | detekce behaviorálního, konfiguračního, závislostního a výkonnostního posunu |
| `blue-signal-aggregator` | L2 Operational | korelace signálů napříč doménami s vynucením plurality NABLA |

### Purple Team – syntéza a uzavírání (4 agenti)

[Purple Team](@/glossary/purple-team.md) je ústředním uzlem uzavírání smyčky Red–Blue. Je
jedinou autoritou pro přechody stavu uzavření – rozhoduje, kdy bylo bezpečnostní zjištění
obrannými opatřeními dostatečně vyřešeno. Ztělesňuje zásadu, že „purpurová je vlastnost
systému ve chvíli, kdy přestane lhát sám sobě“.

| Agent | Oprávnění | Role |
|-------|-----------|------|
| `purple-coordinator` | L3 Strategic | syntetizační uzel, autorita uzavření, vynucení „antimetrik“ |
| `purple-mapper` | L4 Operational | obousměrné přiřazení zjištění Red k obraně Blue |
| `purple-closure-analyst` | L4 Operational | vyhodnocení uzavření podle 4 podmínek, detekce falešného uzavření |
| `purple-regression-guard` | L4 Safety-Critical | správa regresních pastí, vynucení brány nasazení |

`purple-regression-guard` brání zvlášť nebezpečnému selhání – falešnému uzavření, kdy se
bezpečnostní zjištění zdá vyřešené, ale skrytá zranitelnost přetrvává v jiné podobě.
Vyhodnocení uzavření podle čtyř podmínek vyžaduje důkazy od Red Teamu (útok už neuspěje), Blue
Teamu (obrana je aktivní), White Teamu (formální vlastnosti platí) a samotného Purple Teamu
(žádné známky regrese).

### White Team – konstruktivní ověřování (3 agenti)

[White Team](@/glossary/white-team.md) dokazuje, že systémy obstojí, postupnou metodikou na
úrovních přísnosti ověření L0 až L5. Vytváří důkazní artefakty technikami formální verifikace
včetně důkazů v Lean4, testování založeného na vlastnostech a validace kontraktů. Veškerý
výstup prochází [Trinity Gate](@/glossary/trinity-gate.md).

| Agent | Oprávnění | Role |
|-------|-----------|------|
| `white-verifier-commander` | L3 Strategic | řídí ověřovací kampaně, skládá složené důkazy |
| `white-contract-validator` | L4 Operational | testování kontraktů rozhraní, validace behaviour/protokolů/API |
| `white-invariant-prover` | L4 Operational | testování vlastností, formální důkazy v Lean4, analýza vkládání chyb |

### Black Team – teoretické modelování hrozeb (2 agenti)

[Black Team](@/glossary/black-team.md) pracuje pod MAXIMÁLNÍMI omezeními izolace a provádí
čistě epistemickou simulaci adversariální optimalizace v nejhorším případě. Vytváří jen
abstraktní modely hrozeb – nikdy spustitelný obsah. Veškerý výstup prochází filtrem
AbstractionFilter L1–L4 a tým nemá žádné síťové připojení.

| Agent | Oprávnění | Role |
|-------|-----------|------|
| `black-theorist-commander` | L3 Strategic (ISOLATED) | abstraktní modely hrozeb, analýza škodlivé optimalizace |
| `black-abstraction-enforcer` | L3 Safety-Critical (ISOLATED) | vynucení abstrakce výstupu L1–L4, detekce spustitelného obsahu |

## Architektura toku signálů

Tok signálů mezi týmy sleduje strukturovaný kaskádový vzor, v němž zjištění postupují od
průzkumu přes adversariální testování k ověřené obraně:

```
Gray (boundary seeds) --> Red (adversarial scenarios) --> Purple (synthesis) --> Blue (defense)
                                    ^                          |       ^           |
                                    |                          v       |           v
                               Black (threat models)     White (proofs)    Platform Defense
```
Tok probíhá v cyklech:

1. **Setí:** Gray Team najde hraniční podmínky a mezery ve specifikacích a předá je Red Teamu
   jako zárodky scénářů.
2. **Simulace útoku:** Red Team ze zárodků Gray a z abstraktních modelů Black Teamu sestaví
   adversariální scénáře.
3. **Syntéza:** Purple Team přiřadí zjištění Red Teamu k obranným schopnostem Blue Teamu
   a najde mezery.
4. **Obrana:** Blue Team podle syntézy Purple aktualizuje obranný postoj a vytvoří
   strukturované důkazy.
5. **Ověření:** White Team formálně ověří, že obranná opatření splňují deklarované vlastnosti.
6. **Uzavření:** Purple Team pro každé zjištění vyhodnotí, zda lze smyčku Red–Blue uzavřít,
   podle čtyř podmínek.

Cyklus běží nepřetržitě; každá iterace může vytvořit nové hraniční podmínky k průzkumu pro
Gray Team, a vzniká tak sebeposilující smyčka zlepšování bezpečnosti.

## Technická implementace

### GenServer koordinace Color Teams

```elixir
defmodule PrismaticDark.ColorTeam.Coordinator do
  @moduledoc """
  Coordinates signal flow across all six Color Teams.
  Manages the adversarial-defensive cycle, routes findings,
  and enforces safety protocols. This is the central
  orchestration point for all Color Team operations.
  """

  use GenServer

  @type team :: :gray | :red | :blue | :purple | :white | :black
  @type finding :: %{
    id: String.t(),
    source_team: team(),
    severity: :critical | :high | :medium | :low,
    category: atom(),
    description: String.t(),
    evidence: [map()],
    timestamp: DateTime.t()
  }

  @type cycle_state :: %{
    cycle_id: String.t(),
    phase: :seeding | :attack | :synthesis | :defense | :verification | :closure,
    findings: [finding()],
    started_at: DateTime.t(),
    team_status: %{team() => :active | :idle | :blocked}
  }

  @spec start_link(keyword()) :: GenServer.on_start()
  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @spec submit_finding(finding()) :: {:ok, String.t()} | {:error, term()}
  def submit_finding(finding) do
    GenServer.call(__MODULE__, {:submit_finding, finding})
  end

  @spec get_cycle_status() :: {:ok, cycle_state()}
  def get_cycle_status do
    GenServer.call(__MODULE__, :get_status)
  end

  @impl true
  def init(opts) do
    state = %{
      current_cycle: nil,
      findings: [],
      safety_check_ref: schedule_safety_check(),
      opts: opts
    }

    {:ok, state}
  end

  @impl true
  def handle_call({:submit_finding, finding}, _from, state) do
    with :ok <- validate_finding(finding),
         :ok <- check_safety_constraints(finding),
         {:ok, routed} <- route_finding(finding) do
      :telemetry.execute(
        [:prismatic, :color_team, :finding],
        %{count: 1},
        %{team: finding.source_team, severity: finding.severity}
      )

      {:reply, {:ok, routed.id}, %{state | findings: [finding | state.findings]}}
    else
      {:error, reason} -> {:reply, {:error, reason}, state}
    end
  end

  @impl true
  def handle_call(:get_status, _from, state) do
    {:reply, {:ok, build_status(state)}, state}
  end

  @impl true
  def handle_info(:safety_check, state) do
    run_ethics_validation(state)
    state = %{state | safety_check_ref: schedule_safety_check()}
    {:noreply, state}
  end

  @spec route_finding(finding()) :: {:ok, finding()} | {:error, term()}
  defp route_finding(%{source_team: :gray} = finding) do
    PrismaticDark.Red.Commander.ingest_boundary_seed(finding)
    {:ok, finding}
  end

  defp route_finding(%{source_team: :red} = finding) do
    PrismaticDark.Purple.Coordinator.ingest_adversarial_finding(finding)
    PrismaticDark.Blue.Commander.update_threat_model(finding)
    {:ok, finding}
  end

  defp route_finding(%{source_team: :black} = finding) do
    PrismaticDark.Red.Commander.ingest_threat_model(finding)
    {:ok, finding}
  end

  defp route_finding(finding), do: {:ok, finding}

  defp schedule_safety_check do
    interval = Enum.random(10_000..15_000)
    Process.send_after(self(), :safety_check, interval)
  end

  defp validate_finding(_finding), do: :ok
  defp check_safety_constraints(_finding), do: :ok
  defp run_ethics_validation(_state), do: :ok
  defp build_status(state), do: %{findings_count: length(state.findings)}
end
```
## Přehled složení agentů

| Tým | Agenti | L2 | L3 | L4 | Kritičtí pro bezpečnost |
|------|--------|----|----|----|-----------------|
| Gray | 3 | 0 | 1 | 2 | 1 (escalation-guard) |
| Red | 4 | 3 | 1 | 0 | 0 |
| Blue | 4 | 3 | 1 | 0 | 0 |
| Purple | 4 | 0 | 1 | 3 | 1 (regression-guard) |
| White | 3 | 0 | 1 | 2 | 0 |
| Black | 2 | 0 | 2 | 0 | 1 (abstraction-enforcer) |
| **Celkem** | **20** | **6** | **7** | **7** | **3** |

Všichni agenti jsou zapsáni v [Agent Registry](@/glossary/agent-registry.md) s úplnými
specifikacemi schopností, klasifikací [Agent Tier](@/glossary/agent-tier.md) a přiřazením
domén.

## Bezpečnostní protokoly

| Protokol | Vynucení | Rozsah |
|----------|-------------|-------|
| **izolace v sandboxu** | všechny operace Red/Black běží jen v PrismaticDark.Sandbox | Red, Black |
| **jen syntetická data** | žádná skutečná data, osobní údaje ani produkční stav v žádné simulaci | všechny týmy |
| **bez přístupu k síti** | nulové síťové připojení u izolovaných operací | Red, Black |
| **etické kontroly** | automatická validace každých 10–15 sekund | všechny týmy |
| **strážci eskalace** | Gray Escalation Guard a Black Abstraction Enforcer brání rozšiřování rozsahu | Gray, Black |
| **auditní logování** | neměnná auditní stopa každé operace | všechny týmy |
| **žádný spustitelný výstup** | doména Black nikdy nevytváří spustitelný kód ani návody ke zneužití | Black |
| **filtrování abstrakce** | veškerý výstup Black prochází AbstractionFilter L1–L4 | Black |
| **autorita uzavření** | uzavřít zjištění smí jen Purple Team; aktivní detekce falešného uzavření | Purple |
| **prevence regresí** | purple regression-guard blokuje nasazení při bezpečnostní regresi | Purple |

## Model epistemické bezpečnosti

Architektura Color Teams uplatňuje nový přístup k bezpečnosti platformy, který působí na
epistemické úrovni, nikoli na tradiční úrovni sítě nebo aplikace. Výchozí premisou je, že
platforma schopná autonomního uvažování musí zabezpečit nejen data a infrastrukturu, ale
i samotný proces uvažování.

[NABLA Infinity](@/glossary/nabla-infinity.md) určuje, jak se přesvědčení utvářejí. [Trinity
Gate](@/glossary/trinity-gate.md) určuje, jak se přijímají. Color Teams určují, jak se tyto
mechanismy testují za adversariálních podmínek. Vrstvený přístup zajišťuje, že:

- útoky manipulací signálu odhalí slučovač signálů Blue Teamu;
- manipulaci důvěrou testuje epistemický útočník Red Teamu;
- útoky posunem sleduje detektor posunu Blue Teamu a testuje vyvolávač posunu Red Teamu;
- formální vlastnosti dokazuje dokazovatel invariantů White Teamu;
- teoretické nejhorší případy modeluje theorist-commander Black Teamu;
- všechna zjištění slučuje Purple Team do použitelného obranného postoje.

## Integrace se systémy platformy

### Integrace zpravodajství o hrozbách

Color Teams využívají zdroje zpravodajství o hrozbách (*threat intelligence*). Red Team
používá profily aktérů a jejich TTP k sestavení realistických scénářů. Blue Team zapracovává
indikátory kompromitace do konfigurace sledování. Purple Team dává vnější zpravodajství do
souvislosti s vnitřními zjištěními a hodnotí riziko.

### Koordinace s EASM

Prismatic Perimeter (viz [EASM](@/glossary/easm.md)) a Color Teams se koordinují tak, aby
pokryly vnější i epistemickou útočnou plochu. Perimeter sleduje technickou útočnou plochu
(vystavené služby, zranitelné konfigurace), Color Teams epistemickou (manipulace věděním,
zhoršování uvažování).

### Integrace s branami kvality

Zjištění Color Teams vstupují do bran kvality jako bezpečnostní omezení. Kritické zjištění
bez uzavření Purple Teamem blokuje nasazení systémem bran kvality před commitem.

## Osvědčené postupy

1. **Udržovat hranice mezi týmy:** mandát každého týmu je přesně vymezen – Gray zkoumá
   hranice, Red útočí, Blue brání, Purple slučuje, White ověřuje, Black modeluje hrozby.
   Překračování hranic oslabuje adversariální integritu architektury.
2. **Vynucovat směr toku signálů:** zjištění musí procházet definovanou kaskádou. Obejití
   syntézy Purple Teamu (přímo z Red do Blue) odstraní mechanismus uzavírání smyčky.
3. **Vyžadovat uzavření podle 4 podmínek:** nikdy neuzavřít zjištění bez důkazů ze všech čtyř
   relevantních pohledů.
4. **Spouštět etické kontroly nepřetržitě:** interval 10–15 sekund není předmětem vyjednávání.
   Jeho vypnutí nebo prodloužení otevírá prostor pro rozšiřování rozsahu.
5. **Chránit izolaci Black Teamu:** maximální izolace existuje proto, že teoretické modelování
   hrozeb může vést k nebezpečným poznatkům. Vynucovač abstrakce musí ověřit každý výstup.

## Časté chyby

- **Přímé spojení Red–Blue:** když zjištění Red jdou přímo k Blue bez syntézy Purple, obranné
  reakce postrádají strategický kontext a mohou řešit symptomy místo příčin.
- **Přijetí falešného uzavření:** uzavření na základě neúplných důkazů (chybí jedna nebo více
  podmínek) vytváří falešný pocit bezpečí.
- **Eskalace z Gray do Black:** průzkum hranic se může nechtěně přiblížit území modelování
  hrozeb; strážce eskalace musí být aktivní a mít pravomoc operace zastavit.
- **Manipulace metrikami:** měření účinnosti Color Teams počtem zjištění motivuje k zjištěním
  nízké závažnosti. Vynucení „antimetrik“ v Purple Teamu brání kvantifikaci, která deformuje
  chování.
- **Zastaralé modely hrozeb:** modely Black Teamu bez aktualizace podle současného
  zpravodajství vedou ke scénářům teoreticky zajímavým, ale provozně nerelevantním.

## Související pojmy

Bez vlastního hesla v glosáři knihy: *Formal Verification* a *Lean4* (techniky White Teamu),
*Attack Surface*, *Threat Intelligence* a *Consciousness Traits*.

## Související

**Týmy**

- [Red Team](@/glossary/red-team.md), [Blue Team](@/glossary/blue-team.md), [Purple
  Team](@/glossary/purple-team.md) – útok, obrana a syntéza.
- [Gray Team](@/glossary/gray-team.md), [White Team](@/glossary/white-team.md), [Black
  Team](@/glossary/black-team.md) – průzkum hranic, ověřování a teoretické modely.

**Platforma**

- [NABLA Infinity](@/glossary/nabla-infinity.md) – epistemický rámec, který týmy testují
  a hájí.
- [Trinity Gate](@/glossary/trinity-gate.md) – ověřovací brána.
- [Epistemic Pipeline](@/glossary/epistemic-pipeline.md) – šestnáctiúrovňový proces, který
  týmy chrání.
- [EASM](@/glossary/easm.md) – správa vnější útočné plochy, která Color Teams doplňuje.

**Kompendium**

- [Epistemic Security](@/glossary/epistemic-security.md) – obor, do něhož architektura
  zapadá.
- [Red Team: detekce EA](@/kompendium/aiad-integration/red-team-ea-detection.md) – simulace
  technik EA v praxi.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: color-teams](@/kompendium/glossary-bridges/bridge-color-teams.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
