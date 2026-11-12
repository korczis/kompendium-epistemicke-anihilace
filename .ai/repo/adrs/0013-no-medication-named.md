---
schema: adr/v1
id: adr-0013
kind: adr
title: "Kniha nejmenuje léky ani lékové skupiny"
status: accepted
date: 2026-11-12
tags:
  - content
  - safety
  - clinical
provenance:
  origin: authored
---

# 13. Kniha nejmenuje léky ani lékové skupiny

## Context

Kniha už odstranila všechny dávky léků (brána `drug-dose`). Vlákno obsahu 2e změřilo, že na 45
stránkách technik zůstala jmenovaná léková skupina „atypická antipsychotika“, podaná jako
„předchozí farmakologická stabilizace“ před expozicí, a že některé stránky jmenují terapeutické
protokoly jako kroky (TF-CBT, DBT). Brána `drug-dose` je nevidí, protože neobsahují dávku.

## Decision

Otázka vlastníkovi (AskUserQuestion, session `5d49a595-d035-4bbe-b04a-d12695922860`,
2026-11-12), doslovně:

> „45 technique pages name a medication class ("atypická antipsychotika", given as prior
> pharmacological stabilisation before exposure), and some pages name therapy protocols as steps
> (TF-CBT, DBT). The book already removed all drug doses. Should the book name medication classes
> at all?“

Možnosti: „Never name medication (Recommended)“ – „Remove every drug class and medication
instruction; the book says medication belongs to the treating physician and names nothing. A check
refuses drug classes on any page.“; „Name only with a real source“; „Leave as is“. Odpověď
vlastníka doslovně: **„Never name medication (Recommended)“**.

Kniha tedy nejmenuje žádný lék ani lékovou skupinu a nedává žádný pokyn k medikaci. Kde se o ní
mluví, řekne, že medikace patří ošetřujícímu lékaři, a nic nejmenuje.

## Consequences

- Vlákno obsahu odstraní jmenované lékové skupiny a medikační pokyny ze 45 stránek spolu se
  sekcemi `Intervenční variace`.
- Vlákno bran přidá požadavek, který na každé stránce odmítne jmenovanou lékovou skupinu nebo
  lék (nikdy do baseline, strop podle změření, po řezu 0).
- Jmenované terapeutické protokoly a nástroje jako kroky techniky (TF-CBT, DBT, MoCA …) jsou
  samostatná otázka; toto rozhodnutí se jich netýká.

## Doplněk 1 (2026-11-12): stránka o akutní farmakoterapii

Vlákno obsahu změřilo: jmenovaná skupina „atypická antipsychotika“ stojí na 27 stránkách (všechny
ve vlně výčtu autorit, odstraní se tam), pokyn k farmakologické stabilizaci bez jmenované skupiny
na 28 (25 ve vlně, 3 mimo ni: `02-uvod/definice.md`, `quick-reference/qr-ea-5-2-30.md`,
`emergency-protocols/18-emergency-pharmacotherapy.md`). Poslední je stránka o 2355 slovech, jejímž
celým předmětem je akutní farmakoterapie; jmenuje skupiny léků obecně a mluví o dávkování.

Integrace odpověď vlastníka uplatnila takto (nejde o nové rozhodnutí vlastníka; může ho zvrátit):
podle zvolené možnosti („the book says medication belongs to the treating physician and names
nothing“) stránka jako samostatný protokol zaniká. Její poctivý zbytek — rozhodnutí o medikaci v
tomto stavu patří ošetřujícímu psychiatrovi, při akutní dekompenzaci má ta cesta zůstat otevřená a
kniha o lécích neuvažuje — přejde jako odstavec do nejbližší krizové stránky v
`emergency-protocols/`; stará adresa vede přes `aliases` na novou, příchozí odkazy se přepíší.
