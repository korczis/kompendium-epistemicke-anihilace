---
schema: adr/v1
id: adr-0012
kind: adr
title: "Klinické údaje bez pramene se opraví všechny a brána clinical-figure brání jejich návratu"
status: accepted
date: 2026-11-12
tags:
  - content
  - safety
  - clinical
  - enforcement
provenance:
  origin: authored
---

# 12. Klinické údaje bez pramene se opraví všechny a brána clinical-figure brání jejich návratu

## Context

ADR 0010 rozhodl, že klinické podrobnosti bez pramene se nejdřív osekají a pak doloží. Brány
je neviděly: `template-figure` měří jen řádky opakované na několika stránkách, `drug-dose` jen
dávky léků. Trvání terapie („12–36 měsíců“), dávka supervize („alespoň 10 % sessions“), počty
sezení, podíly úspěšnosti a prahy klinických skóre v próze žádná brána neměřila; proto se
dostaly na stovku stránek a zůstaly tam.

## Decision

Pokyn vlastníka (session `5d49a595-d035-4bbe-b04a-d12695922860`, 2026-11-11T23:36:21.086Z,
v konverzaci integrační session po zprávě o 45 stránkách s opakovanými údaji), doslovně:

> „do th rewrite, cleanup / fix all findings clan way, preennt it in future“

Z toho plyne:

1. Všechny nálezy se opraví čistě: údaj bez pramene nahradí oznamovací věta (kniha údaj
   neuvádí, dřívější verze ho měla bez zdroje), stránka pod prahem rozsahu dostane skutečný
   obsah, ne výplň. Rozdělení práce: vlákno obsahu 2e 45 stránek s „12–36 měsíců“ a „10 %
   sessions“ a přerámování `04-terminalni-protokoly`; integrační session zbylé stránky
   `template-figure` a stránky ADR 0010 mimo oddíl 04.
2. Prevence: požadavek `clinical-figure` v `scripts/check-ia.py`. Odstavec, položka seznamu
   nebo řádek tabulky s klinickým údajem (rozsah trvání ve dnech, týdnech, měsících nebo
   sezeních, podíl sezení, pacientů či klientů, míra úspěšnosti nebo relapsu, číselný práh
   klinického skóre, počet sezení, minimální dávka hodin či sezení, rozsah počtu technik nebo
   účastníků) musí nést citaci autor–rok nebo předpis. Číselná kritéria v tabulkách (κ > 0,7,
   ≥ 85 %, „do 30 min“) brána zatím neměří: vlákno obsahu jich na svých stránkách napočítalo 260
   řádků a jsou samostatnou vlnou. Nikdy se
   nezapisuje do baseline; `PENDING_ZERO` začíná na změřených 123 stránkách a smí jen klesat.

## Consequences

- Nová stránka nebo úprava, která přidá klinický údaj bez pramene, neprojde `check-ia` ani
  pre-push branou; dosavadní nálezy se snižují s každým řezem a strop se snižuje při slučování.
- `test/cases/24_clinical_figure.sh` dokládá, že brána údaj bez citace odmítne, s citací přijme
  a v bibliografii neměří.

## Doplněk 1 (2026-11-12): všechny nálezy check-ia, plán záznamu

Vlastník pokyn zopakoval doslovně („do th rewrite, cleanup / fix all findings clan way, preennt
it in future“). Integrace ho čte jako všechny otevřené nálezy `scripts/check-ia.py`, změřené na
`efb081ca`: citations 1164, bullets 1052, bold-candidate 296, detail 223, weak-link 223,
bold-term 126, template-figure 103, citation-unresolved 43, bibliography 29, related 2.
Každá třída je už v baseline, která smí jen klesat; cílem je nula a přechod mezi požadavky,
které se nikdy nezapisují do baseline. Jedna třída, jeden vlastník:

- **bold-term**: nástroj `link-terms.py --bold` existoval, ale žádná brána ho nespouštěla.
  Teď běží ve `verify-content --fix`, pre-push, `verify-all` i CI; 126 → 0, nikdy do baseline.
- **citation-unresolved, bibliography, related**: integrační session; zdroj jen jistě
  existující dílo, jinak se tvrzení přeformuluje nebo odstraní.
- **template-figure, clinical-figure**: řezy vlákna obsahu a integrace (viz výše), cíl 0.
- **bullets**: vlákno obsahu 2e mimo `glossary/`; skutečný výčet souřadných položek zůstává
  seznamem a hlásí se jako změřená výjimka.
- **bold-candidate a bullets v `glossary/`**: vlákno katalogů; dávky ze schváleného
  klasifikačního seznamu (zrušit tučné písmo, štítek, alias existujícího hesla v
  `extra.aliases`, nové heslo jen se skutečným pramenem, nikdy pahýl).
- **detail, weak-link**: vlákno bran f3 nejdřív měří a dělí na opravitelné nástrojem a na psaní.
- **citations**: nezačne nikdo, dokud (a) brána fabricated-citation není na main a nulová,
  (b) každá přidaná citace se hlásí po odstavcích i s tvrzením, které má doložit, a (c) se
  postupuje malými změřenými dávkami. Přípustné opravy: skutečný pramen, o kterém je pisatel
  jistý; odkaz na vlastní rámec knihy (nejvýš tři na stránku); přeformulování na interpretaci
  knihy; **vypuštění tvrzení**. Vymyšlená citace nikdy. Odůvodnění: rozbor knihy už našel
  5 vymyšlených a 7 chybně připsaných citací; vlna s kvótou citací je přesně tvar, který je plodí.
- Bránu se ověřuje jejími vlastními vzory, nikdy ručním grepem: řádkový grep vlákna obsahu
  prohlásil oddíl 04 za čistý, vzory brány howto (tolerantní k zalomení řádku) našly dva
  zbývající nálezy.

## Doplněk 2 (2026-11-12): bullets jen spolu s citacemi téže stránky

Vlákno obsahu změřilo, že převod seznamů na prózu přesouvá dluh, ne ruší ho: na pěti
zkušebních stránkách klesl `bullets` 1052 → 1048, `citations` zůstal 1164 (počítá stránky),
ale necitovaných odstavců na stránce přibylo (např. detection-signatures/_index 3 → 9,
ea-3-1-1 5 → 9) a baseline to četla jako zlepšení (3158 → 3154). Vlna bez citací by vyrobila
tisíce necitovaných odstavců při lepších souhrnných číslech.

Proto: `bullets` se opravuje po stránkách spolu s citacemi téže stránky, nikdy jako samostatný
mechanický převod. Převedený bod dostane skutečný pramen, nebo je označen jako interpretace
knihy, nebo se vypustí. Platí pro něj táž podmínka jako pro `citations`: brána
fabricated-citation je na main a nulová, dávky jsou malé a hlášené po odstavcích. Jednotkou
práce je stránka: 914 stránek mimo `glossary/` (14 588 položek seznamů), `glossary/` vlákno
katalogů. Detail/weak-link (223 stránek, totožné seznamy): práh 1100 slov platí i pro glosář
(pokyn vlastníka: každý markdown aspoň 2 × A4); vlákno bran f3 dodá seznam podle chybějících
slov, psaní nesou vlastníci stránek.
