+++
title = "Scam compliance (podvolení podvodu)"
weight = 100
description = "Scam compliance: proč lidé vyhoví podvodníkovi navzdory varovným signálům. Psychologické páky, znaky, právní rámec, prevence a péče o oběti."

[taxonomies]
tags = ["glossary", "kompendium", "psychology", "security", "legal"]

[extra]
category = "psychology"
related_terms = ["undue-influence", "elder-abuse", "love-bombing", "trauma-bonding", "socialni-izolace", "coercive-control"]
author = "Tomas Korcak (korczis)"
date_created = "2026-05-03"
date_modified = "2026-11-10"
quality_score = 75
ref_count_at_creation = 1
+++

## Definice

**Scam compliance** (podvolení podvodu) označuje chování oběti podvodu, která vyhoví požadavkům podvodníka – převede peníze, sdělí přístupové údaje, podepíše smlouvu, zatají jednání před blízkými – navzdory varovným signálům, které by za jiných okolností rozpoznala. Pojem přesouvá otázku z „proč byl ten člověk tak naivní“ na „jaké podmínky vytvořil podvod, aby se běžné rozhodování dočasně vypnulo“.

Kompendium pojem zařazuje mezi jevy epistemické povahy: podvod nespoléhá jen na nepravdivou informaci, ale na **řízení podmínek, za nichž člověk informace vyhodnocuje** – čas, emoce, izolaci a důvěru.

## Původ a kontext pojmu

Pojem vychází z viktimologie podvodů, z psychologie sociálního vlivu a z bezpečnosti informačních systémů. Robert Cialdini v knize *Influence* (1984) popsal principy, na nichž stojí běžné i zneužité ovlivňování: reciprocitu, závazek a konzistenci, sociální důkaz, autoritu, sympatii a vzácnost. Frank Stajano a Paul Wilson (2011) na základě analýzy podvodných schémat formulovali principy, které podvody využívají, a ukázali, že jde o systematické zranitelnosti lidského rozhodování, nikoli o selhání jednotlivců. Z praxe obětí je známé, že oběti mají často vysoké vzdělání i zkušenost a že stud vede k tomu, že podvody bývají hlášeny jen zčásti.

## Jak se projevuje

Varovné znaky pro blízké, banky a profesionály:

- **náhlé utajování** finančních operací a komunikace, vysvětlované pokynem třetí osoby („nikomu to neříkejte, ani v bance“);
- **časový tlak a naléhavost**, které neumožňují poradit se ([vytváření časového tlaku](@/kompendium/detection-signatures/14-behavioral-time-pressure-creation.md));
- **silná emoční aktivace** – strach (ohrožený účet, policie, nemoc), naděje (výnos, výhra) nebo náklonnost (online vztah);
- **eskalace** od malých částek k velkým a opakované „poslední“ platby;
- **odmítání pochybností blízkých** a obrana podvodníka, někdy s hněvem;
- **ztráta kontaktu** s dosavadními poradci a přáteli ([akcelerace izolace](@/kompendium/detection-signatures/13-behavioral-isolation-acceleration.md));
- po odhalení **stud, sebeobviňování a riziko opakované viktimizace** „pomocníky“, kteří slibují vrácení peněz.

## Mechanismus

Popis je strukturální a slouží rozpoznání. Podvodné schéma typicky kombinuje čtyři prvky:

1. **Rámec autority nebo vztahu.** Podvodník vystupuje jako instituce, odborník nebo blízká osoba; tím přebírá roli zdroje pravdy. U romantických podvodů se vazba buduje intenzivní pozorností připomínající [love bombing](@/glossary/love-bombing.md) a může přejít v [traumatickou vazbu](@/glossary/trauma-bonding.md).
2. **Emoční zúžení.** Strach nebo touha zúží pozornost na jediný cíl a odsunou kritické hodnocení.
3. **Izolace od korekce.** Pokyn mlčet a nevěřit blízkým odstraní nezávislé hlasy, které by podvod rozpoznaly; jde o tutéž strukturu jako [sociální izolace](@/glossary/socialni-izolace.md) v jiných kontextech.
4. **Postupný závazek.** Každý další krok je obhajobou předchozího; přiznat podvod znamená přiznat ztrátu, a tak je snazší pokračovat.

Stejná struktura se objevuje v [MLM schématech](@/kompendium/case-studies/13-mlm-recovery.md) a [finančních kultech](@/kompendium/case-studies/20-finance-cult.md), kde se podvodné prvky mísí se skupinovou identitou. Technologická rovina (podvržený hlas, cílené zprávy) je popsána v [EA-9.2.2 Voice cloning](@/kompendium/techniques/ea-9-2-2-voice-cloning-EA.md) a v mostu [social engineering](@/kompendium/cross-domain/17-ea-security-social-engineering.md).

## Odlišení

- **Důvěřivost jako rys.** Podvolení podvodu není důkazem hlouposti ani trvalé důvěřivosti; jde o situačně vyvolaný stav, kterému podléhají i odborníci.
- **Snížená rozhodovací způsobilost.** U kognitivního úpadku nebo demence je třeba posoudit kapacitu (viz [EA-8.1.10 Decision-Making Capacity Scale](@/kompendium/techniques/ea-8-1-10-decision-making-capacity-scale.md)); ochranná opatření se pak liší.
- **Nepřípustný vliv.** U [undue influence](@/glossary/undue-influence.md) jde o dlouhodobou vazbu, v níž osoba zneužívá důvěru (např. pečovatel, „duchovní rádce“); podvod bývá kratší a anonymnější.
- **Zneužívání seniorů a domácí ekonomická kontrola.** Finanční vykořisťování blízkou osobou patří do rámce [zneužívání seniorů](@/glossary/elder-abuse.md) nebo [coercive control](@/glossary/coercive-control.md).
- **Riskantní, ale svobodná investice** nebo patologické hráčství – rozdíl je v tom, zda byla rozhodnutí vědomá a informovaná.

## Právní rámec

V českém právu je základní skutkovou podstatou **podvod podle § 209 trestního zákoníku** (zákon č. 40/2009 Sb.): obohacení sebe nebo jiného tím, že někoho uvede v omyl, využije jeho omylu nebo zamlčí podstatné skutečnosti, a způsobí tak na cizím majetku škodu. Pro posuzování je podstatné doložit průběh komunikace a sled operací; viz [podvod jako element EA](@/kompendium/forensic-legal/17-fraud-EA-element.md), [uchování důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md) a u starších osob [právo o zneužívání seniorů](@/kompendium/forensic-legal/46-elder-abuse-law.md). Konkrétní postup závisí na jurisdikci a vyžaduje právní poradenství.

## Význam pro Kompendium

Scam compliance ukazuje v malém měřítku a krátkém čase tytéž prvky, které jinde působí roky: substituci zdroje pravdy, izolaci, emoční zúžení a eskalaci závazku. Je proto vhodným vstupem do výuky rozpoznávání a do [organizační prevence](@/kompendium/prevention-resilience/12-warning-sign-recognition.md).

## Obrana a zotavení

Pro jednotlivce a rodiny:

- **Pravidlo pauzy:** žádná instituce nepožaduje okamžitý převod ani utajení před blízkými. Naléhavost a mlčenlivost jsou samy o sobě důvodem zastavit se.
- **Ověření jiným kanálem** – zavěsit a zavolat na známé číslo instituce, ne na číslo ze zprávy.
- **Domluvená „druhá osoba“** pro finanční rozhodnutí nad určitou částku; viz [kalibrace důvěry](@/kompendium/self-defense-guides/23-trust-calibration.md).

Pro profesionály:

- **Nevyčítat.** Stud je hlavní překážkou nahlášení a hlavním rizikem opakované viktimizace; viz [riziko obviňování oběti](@/kompendium/critical-perspectives/13-victim-blaming-risk.md).
- **Stabilizace a obnova důvěry v sebe** – oběť často ztrácí důvěru ve vlastní úsudek obecně; u seniorů viz [rekonstrukční protokol pro seniory](@/kompendium/recovery-protocols/recovery-elder-protocol.md).
- **Varovat před „vymahači“,** kteří po podvodu nabízejí vrácení peněz za poplatek.

## Literatura

- Cialdini, R. B. (1984). *Influence: The Psychology of Persuasion*.
- Stajano, F., Wilson, P. (2011). Understanding scam victims: seven principles for systems security. *Communications of the ACM*, 54.

## Související

**Glosář**

- [Undue influence](@/glossary/undue-influence.md) – dlouhodobé zneužití důvěry.
- [Elder abuse](@/glossary/elder-abuse.md) – zranitelná skupina s vysokým rizikem.
- [Love bombing](@/glossary/love-bombing.md) – mechanismus romantických podvodů.
- [Sociální izolace](@/glossary/socialni-izolace.md) – odstranění korekce blízkými.

**Detekce a případy**

- [Detekční signatura: Vytváření časového tlaku](@/kompendium/detection-signatures/14-behavioral-time-pressure-creation.md) – klíčový marker.
- [Případ 13: MLM recovery](@/kompendium/case-studies/13-mlm-recovery.md) – podvod spojený se skupinovou identitou.
- [EA × Security: Social Engineering 2.0](@/kompendium/cross-domain/17-ea-security-social-engineering.md) – organizační rovina.

**Právo a zotavení**

- [Podvod jako element EA](@/kompendium/forensic-legal/17-fraud-EA-element.md) – právní posouzení.
- [Rekonstrukční protokol pro seniory](@/kompendium/recovery-protocols/recovery-elder-protocol.md) – následná péče.
