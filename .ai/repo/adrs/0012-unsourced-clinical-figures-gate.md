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
