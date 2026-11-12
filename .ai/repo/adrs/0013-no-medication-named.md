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
