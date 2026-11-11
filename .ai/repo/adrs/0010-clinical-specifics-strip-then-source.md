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
kazuistik, ECRI jako validovaný krok diagnostické baterie, prahy přerušení (HRV > 20 %, HR > 90 %
predikovaného maxima, DES > 30) a neexistující nástroj „DES-mini“. Tyto jednotlivé případy
opravuje řez `feature/vymyslena-klinika` podle platného pravidla `project.content-sources-verifiable`.

Zbývá vrstva, kterou jednotlivé opravy nezasáhnou: 35 stránek nese klinické, diagnostické nebo
protokolární podrobnosti (fáze terapie, trvání, prahy, rozhodovací pravidla) a nemá na sobě ani
jednu citaci — celé `06-klinicke-aplikace` (11), celé `04-terminalni-protokoly` (10), části
`03-zakladni-kategorie` a 5 stránek `05-ultramari-techniky`.

Oddíl `04-terminalni-protokoly` popisuje postupy řízené dekonstrukce identity s monitorováním
a kritérii přerušení. Obranný rámec (`project.content-defensive-frame`, brána `howto`) se dosud
uplatňoval na stránky technik, ne na tento oddíl; proto mohl nést intervaly monitorování a
kritéria přerušení.

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

- Obranný rámec platí poprvé i pro `04-terminalni-protokoly`. Pořadí je: obsah se změní, potom
  brána `howto` (`scripts/check-ia.py`) dostane tyto stránky do svého dosahu a doloží výsledek.
- Vlnu dělá vlákno obsahu (2e) až po vyprázdnění fronty slučování (katalogy, oprava mobilního
  draweru, řez `vymyslena-klinika`, EA-1.6.2, osy katalogu, oprava brány šablonových čísel, B9),
  aby přistála na známém základu.
- Řez `vymyslena-klinika` u každé opravy uvádí, co tam stálo a že to bylo chybné; vlna se drží
  téhož, aby čtenář odlišil opravu od mezery.
