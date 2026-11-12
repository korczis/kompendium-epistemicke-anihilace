---
schema: adr/v1
id: adr-0014
kind: adr
title: "Šablonový blok „Co ověřit před čtením“ pryč, jmenný výčet autorit pryč, kniha nejmenuje léky ani dávkování"
status: accepted
date: 2026-11-12
tags:
  - content
  - safety
  - clinical
provenance:
  origin: authored
---

# 14. Šablonový blok „Co ověřit před čtením“ pryč, jmenný výčet autorit pryč, kniha nejmenuje léky ani dávkování

## Context

Vlákno obsahu 2e změřilo tři vrstvy, které žádná brána neviděla: blok `## Co ověřit před
čtením` (3 odrážky) na 191 stránkách technik, odstavec „Klinická tradice ukotvení“ se jmény
Vondráček, Mečíř, Kratochvíl, Höschl, Praško na 75 stránkách (žádné z nich v Literatuře,
bez roku, takže ho brány citací nevidí) a jmenované léky a klinické nástroje na 45–80 stránkách.

## Decision

Otázky vlastníkovi položilo vlákno obsahu (AskUserQuestion, session
`62aaa969-db73-4419-aeb1-23bc36e05c88`, odpovězeno 2026-11-12T11:43Z); integrace je zapisuje
doslovně, jak je vlákno předalo.

Otázka 1: „Blok „## Co ověřit před čtením" (3 odrážky) stojí na 191 technických stránkách;
novější stránky (ea-1-6-2, ea-2-5-8) ho nemají vůbec. Co s ním?“ — Odpověď:
**„Smazat ho (doporučeno)“**.

Otázka 2: „Blok „Klinická tradice ukotvení (Vondráček, Mečíř, Kratochvíl, Höschl, Praško)" je na
75 stránkách a ani jedno z těch jmen není v Literatuře žádné z nich. Žádná brána to nevidí,
protože jména jsou bez roku.“ — Odpověď: **„Jména pustit, tvrzení nechat jako čtení knihy
(doporučeno)“**.

Otázka 3: „Na 45 až 80 technických stránkách kniha jmenuje klinické nástroje a léky (MoCA,
TF-CBT, CAPS-CA-5, Seeking Safety, „atypická antipsychotika" s pokynem k titraci). Nezdrojované
a mimo defenzivní rámec.“ — Odpověď: **„Kniha nejmenuje léky ani dávkování (doporučeno)“**.
Shoduje se s ADR 0013, položenou nezávisle v integrační session.

## Consequences

- Blok `## Co ověřit před čtením` se ze 191 stránek odstraní (nepřevádí se na tabulku);
  novější stránky bez něj jsou vzorem.
- Výčet pěti jmen se odstraní; tvrzení o české klinické tradici zůstane jako čtení knihy.
- Léky: platí ADR 0013 bez výjimky pro klinické a krizové stránky (emergency-protocols,
  pharmacotherapy); medikace patří ošetřujícímu lékaři. Mimo dosah je jen název díla v
  bibliografii (`## Literatura`, `content/references.md`), který lék nejmenuje jako léčbu.
  Historický případ, jehož předmětem je lék (např. marketing opioidů), lék pojmenuje obecně
  („lék proti bolesti na předpis“), ne jménem skupiny ani přípravku.
- Jmenované terapeutické protokoly a nástroje (TF-CBT, DBT, Seeking Safety, MoCA, CAPS-CA-5)
  vlastník nerozhodl; odpověď 3 jmenuje jen léky a dávkování. Zůstávají otevřenou otázkou a vlny
  obsahu se jich nedotknou.
- Brány vlákna f3: `drug-name` (kurátorovaný seznam skupin a INN, mimo bibliografii) a
  `authority-without-source` (příjmení jako autorita bez roku a bez záznamu v Literatuře), obě
  nikdy do baseline, na nule po řezech.

## Doplněk 1 (2026-11-12): výčet autorit je deset jmen, ne pět

Vlákno obsahu změřilo celý oddíl `## Klinické pozadí`, ne jen jednu větu: na 75 stránkách stojí
jeden vložený odstavec („Technika EA-X.Y.Z se historicky vyvinula z konvergence několika
klinických tradic …“) s pěti závorkami bez roku a bez záznamu v Literatuře: (Ferenczi, Sándor),
(Foa, Edna B.), (Porges, Stephen W.), (Singer, Margaret T.; Hassan, Steven) a (Vondráček, Mečíř,
Kratochvíl, Höschl, Praško); na 65 z nich také „(Type I trauma per Terr)“. Závorky jsou ve tvaru
příjmení, jméno: deset lidí, ne patnáct jmen.

Odpověď vlastníka na otázku 2 („jména pustit, tvrzení nechat jako čtení knihy“) je použití
platného pravidla `project.content-sources-verifiable` (jméno jako autorita bez díla odchází),
takže platí pro všech deset, ne jen pro českou skupinu; nejde o nové rozhodnutí. Dále:

- Tvrzení o vývoji každé techniky „z konvergence klinických tradic“ kniha pro 75 technik doložit
  nemůže; odstraní se (ADR 0010: nejdřív osekat), ne přeformuluje.
- Terrovo rozlišení traumatu typu I a II je skutečné a doložitelné: Terr, L. C. (1991).
  Childhood traumas: an outline and overview. *American Journal of Psychiatry*, 148(1), 10–20.
  Zůstává jen tam, kde stránka rozlišení skutečně používá, s dílem v Literatuře stránky.
