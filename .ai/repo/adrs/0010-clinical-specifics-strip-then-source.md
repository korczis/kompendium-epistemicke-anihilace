---
schema: adr/v1
id: adr-0010
kind: adr
title: "Klinické podrobnosti bez pramene: nejdřív osekat, pak doložit; terminální protokoly přerámovat na rozpoznání"
status: accepted
date: 2026-11-11
tags:
  - content
  - safety
  - clinical
provenance:
  origin: authored
---

# 10. Klinické podrobnosti bez pramene: nejdřív osekat, pak doložit; terminální protokoly přerámovat na rozpoznání

## Context

Revize 2026-11-11 (vlákno obsahu, session 2e) našla na produkci vymyšlené a chybně připsané
klinické údaje, které žádná brána nevidí, protože stojí v próze: výskyt fotosenzitivní epilepsie
„u 5 % populace“ (skutečnost řádově 1 : 4000), tvrzený souhlas skutečného klienta u složených
kazuistik, ECRI jako validovaný krok diagnostické baterie, prahy přerušení protokolu (HRV > 20 %,
HR > 90 % predikovaného maxima a skóre DES > 30 použité jako kritérium přerušení) a neexistující
nástroj „DES-mini“. Screeningový práh DES-II kolem 30 sám je doložitelný (Carlson & Putnam 1993,
`content/references.md`); vymyšlené bylo jeho použití jako kritéria přerušení a název nástroje
(doplněk 1). Tyto jednotlivé případy
opravuje řez `feature/vymyslena-klinika` podle platného pravidla `project.content-sources-verifiable`.

Zbývá vrstva, kterou jednotlivé opravy nezasáhnou: stránky, které nesou klinické, diagnostické
nebo protokolární podrobnosti (fáze terapie, trvání, prahy, rozhodovací pravidla) a nemají na sobě
ani jednu citaci. Otázka vlastníkovi níže uvádí 35 stránek a „celé“ oddíly; přesný výčet opravuje
doplněk 1 (34 stránek, oddíly 06 a 04 jen zčásti).

Oddíl `04-terminalni-protokoly` popisuje postupy řízené dekonstrukce identity s monitorováním
a kritérii přerušení. Brána obranného rámce `howto` (`scripts/check-ia.py`) tyto stránky měří
a propouští je. Na každé stránce hledá nadpisy „Operační modus/postup/sekvence“ a „Forensní
markery“ a obrat „před aplikací … techniky“; „Krok N“ v nadpisu nebo buňce tabulky jen na
stránkách technik. Terminální protokoly píší postup v jiných tvarech: `### Trigger criteria pro
intervenci`, `## Šest fází rekonstrukčního protokolu`, `### Hard exclusion criteria`,
`### Response protokoly` a eskalace `Level 1 — Enhanced monitoring` / `Level 2 — Pause and
assess` / `Level 3 — Immediate abort`. Je to posloupnost kroků bez slova „Krok“, a proto prošla.
Brána, která propustí postup psaný anglickými podstatnými jmény, nedokládá, že na stránce postup
není.

## Decision

Otázky vlastníkovi (AskUserQuestion, session `62aaa969-db73-4419-aeb1-23bc36e05c88`,
2026-11-11, položila session 2e), doslovně:

Otázka 1:

> „35 stránek nese klinické, diagnostické nebo protokolární podrobnosti a nemá na sobě ani jednu
> citaci — celé 06-klinicke-aplikace (11), celé 04-terminalni-protokoly (10), části
> 03-zakladni-kategorie a 5 z 05-ultramari-techniky. Jsou to fáze terapie, trvání, prahy a
> rozhodovací pravidla. Jak to vyřešit?“

Možnosti: „Nejdřív osekat, pak doložit (doporučeno)“, „Doložit, nic nemazat“, „Označit stránky,
obsah nechat“. Odpověď vlastníka doslovně: **„Nejdřív osekat, pak doložit (doporučeno)“**.

Otázka 2:

> „Oddíl 04-terminalni-protokoly (10 stránek) popisuje postupy řízené dekonstrukce identity
> s monitorováním a kritérii přerušení. Po odstranění vymyšlených prahů zůstává struktura postupu
> bez jakékoli opory. Co s tím oddílem?“

Možnosti: „Přerámovat na rozpoznání (doporučeno)“, „Odstranit oddíl s přesměrováním“, „Nechat
jako je“. Odpověď vlastníka doslovně: **„Přerámovat na rozpoznání (doporučeno)“**.

Z toho plyne:

1. Na všech 35 stránkách se nejdřív odstraní každé číslo, práh, trvání a rozhodovací pravidlo
   bez pramene, které by klinik mohl vzít jako pokyn; kvalitativní popis zůstává.
2. Teprve potom vlna doplní skutečné prameny tam, kde existují. Údaj, ke kterému se pramen
   nenajde, se nevrací.
3. `04-terminalni-protokoly` se přerámuje na to, jak se takový postup pozná a jak se mu brání,
   stejně jako kniha zachází s rodinami útoků. Oddíl se neodstraňuje a nezůstává postupem.

## Consequences

- Obranný rámec se na `04-terminalni-protokoly` uplatní obsahem: oddíl se přerámuje na
  rozpoznání. Pořadí je: obsah se změní, potom vlákno brány (f3) rozšíří vzory `howto` o
  strukturní tvary postupu (tabulky a nadpisy fází, `Fáze N`, eskalace `Level N`, nadpisy
  „… criteria“). Rozšíření nejspíš zasáhne i stránky mimo těchto deset, proto se nejdřív změří
  na celé knize a zapne se, až když jeho nálezy jsou vyřešené nebo zapsané v ratchetu
  `PENDING_ZERO`.
- Vlnu dělá vlákno obsahu (2e) až po vyprázdnění fronty slučování (katalogy, oprava mobilního
  draweru, řez `vymyslena-klinika`, EA-1.6.2, osy katalogu, oprava brány šablonových čísel, B9),
  aby přistála na známém základu.
- Řez `vymyslena-klinika` u každé opravy uvádí, co tam stálo a že to bylo chybné; vlna se drží
  téhož, aby čtenář odlišil opravu od mezery.

## Doplněk 1 (2026-11-11): přesný výčet stránek a jeden příklad

Rozbor vlny (vlákno obsahu 2e, ověřeno v integraci) opravil kontext; rozhodnutí vlastníka
platí beze změny.

- Stránek bez citace s klinickými podrobnostmi je **34**, ne 35. `03-zakladni-kategorie` jich má
  7, ne 6: výčet v otázce vynechal `scenar-f.md` (0 citací, pět řádků `**Trvání**` s rozsahy
  měsíců, jediný commit, který ho měnil, je odstranění platformy). Má týž tvar jako `scenar-g`
  a `scenar-h`, jejichž procenta opravil řez `vymyslena-klinika`, a z původního výčtu by zůstal
  jako jediný netknutý.
- `06-klinicke-aplikace` není celý: z 18 stránek je 6 doložených (desítky citací) a jsou vzorem,
  podle kterého se ostatní doplní. Ani `04-terminalni-protokoly` není celý: `visualizations.md`
  citace má.
- Příklad „DES > 30“ v kontextu: screeningový práh DES-II kolem 30 je doložitelný (Carlson &
  Putnam 1993). Vymyšlený byl nástroj „DES-mini“ a použití prahu jako kritéria přerušení uvnitř
  protokolu; řez `vymyslena-klinika` odstranil obojí, obsah je tedy správně, kontext byl
  nepřesný.
- Kritérium „ani jedna citace“ má blízkou třídu, kterou nezachytí: `03/kapitola-1.md` má pár
  citací proti desítkám necitovaných odstavců. Vlna ji posoudí stejně, i když do výčtu nepatří.
- Způsob osekání: řádek bez pramene nahrazuje oznamovací věta („Podíl kniha neuvádí: dřívější
  verze tu měla procenta bez zdroje…“), jak to zavedl řez `vymyslena-klinika`. Je slovně
  neutrální, takže žádná stránka neklesne pod práh rozsahu; nový doložený obsah potřebuje jen
  `06/supervizni-ramce.md`.
- Přerámování `04-terminalni-protokoly` na rozpoznání musí přistát dřív, než vlákno brány
  rozšíří vzory `howto`, jinak brána odmítne oddíl dřív, než je obsah hotový. Vzorem je
  `konceptualni-dekonstrukce.md`, psaná už v rejstříku rozpoznání.
