+++
title = "Falsifikovatelnost (falsifiability)"
weight = 6
description = "Popperovo kritérium demarkace: tvrzení je vědecké, jen když je lze v principu vyvrátit pozorováním. Praxe v analýze, OSINT a klinickém posuzování manipulace."

[taxonomies]
tags = ["glossary", "epistemology", "philosophy", "science", "methodology"]

[extra]
category = "philosophy-of-science"
status = "active"
author = "Tomas Korcak (korczis)"
difficulty = "intermediate"
abbreviation = "Falsif."
date_created = "2026-05-03"
date_updated = "2026-05-03"
importance = "high"
related_terms = ["falsifikace", "lakatos", "epistemicke-trauma", "hypothesis-generation", "evidence", "bayesian-reasoning"]
keywords = ["falsifiability", "Popper", "demarcation", "scientific method", "refutation", "testability", "philosophy of science"]
key_takeaway = "A theory that explains every possible observation explains nothing — only claims that forbid certain outcomes carry empirical content. Falsifikovatelnost is the structural property that separates science from rhetoric, ideology, and pseudoscience."
see_also = ["falsifikace", "lakatos", "hypothesis-generation"]
image = "/images/sections/glossary.png"
image_alt = "Falsifikovatelnost - Prismatic Platform"
+++

## Definice

**Falsifikovatelnost** (anglicky *falsifiability* nebo *refutability*) je Popperovo demarkační kritérium: výrok, hypotéza nebo teorie je vědecká jen tehdy, když činí předpovědi, které by v principu mohl vyvrátit nějaký pozorovatelný stav věcí. Schopnost být vyvrácen je **logickou vlastností tvrzení samého** – nezávisí na tom, zda se někdo o test skutečně pokusil. Tvrzení, která nevylučují žádné možné pozorování (například „všechno se děje z nějakého důvodu“), jsou nefalzifikovatelná, a proto leží mimo vědu.

Falsifikovatelnost je vlastnost tvrzení; [falsifikace](@/glossary/falsifikace.md) je akt, jímž se tvrzení skutečně vyvrátí protipříkladem. Teorie může být falzifikovatelná a dosud nevyvrácená – to je normální stav dobré vědecké teorie.

## Původ a kontext pojmu

Popper formuloval kritérium v *Logik der Forschung* (1934) jako odpověď logickým pozitivistům Vídeňského kroužku, kteří hledali kritérium *verifikace*. Popper ukázal, že verifikace je u univerzálních zákonů logicky nemožná (žádný konečný počet pozorování nedokazuje, že „všechny labutě jsou bílé“), zatímco jediné odporující pozorování (jedna černá labuť) hypotézu vyvrací. Vědecký pokrok se tím stává řadou *domněnek a vyvrácení* (*conjectures and refutations*).

Imre Lakatos kritérium později zjemnil: izolovanou hypotézu lze vždy zachránit dodatkem *ad hoc*, takže falsifikovatelnost se uplatňuje na celé výzkumné programy, ne na jednotlivé výroky; viz [Lakatos](@/glossary/lakatos-vyzkumny-program.md) a [Lakatosův výzkumný program](@/glossary/lakatos-vyzkumny-program.md). Širší filozofický kontext podává [popperianismus](@/glossary/popperianismus.md), v knize kapitola [Falsifikovatelnost](@/kompendium/03-zakladni-kategorie/falsifikovatelnost.md).

## Jak se projevuje

Falsifikovatelné a nefalzifikovatelné tvrzení lze v praxi rozeznat podle jednoduchého testu: **jaký důkaz by toto tvrzení vyvrátil?**

| tvrzení | falzifikovatelné? | proč |
|---|---|---|
| „Subjekt X je skutečným majitelem společnosti Y.“ | ano | vyvrátí je registr, smlouva nebo doložený jiný majitel |
| „Partner mě v úterý zamkl v bytě.“ | ano | vyvrátí je doložená nepřítomnost obou osob |
| „Vůdce vidí, co my nevidíme.“ | ne | žádné pozorování není s tvrzením v rozporu |
| „Kdo odchází, nebyl připraven.“ | ne | odchod je vždy vyložen jako důkaz nepřipravenosti |

V manipulativních systémech se nefalzifikovatelná tvrzení hromadí v jádru doktríny; viz signaturu [nevyvratitelných tvrzení](@/kompendium/detection-signatures/3-linguistic-unfalsifiable-claims.md) a techniku [EA-1.3.1 Imunizace proti falsifikaci](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md).

## Mechanismus

Falsifikovatelnost chrání poznání tím, že **zavazuje tvrzení vůči světu**. Tvrzení, které by mohlo selhat, nese informaci: vylučuje některé stavy věcí. Tvrzení, které selhat nemůže, nevylučuje nic, a proto nic neříká. Manipulace využívá toho, že nefalzifikovatelná tvrzení působí silně – nikdy nejsou „přistižena“ při omylu. Strukturálně tím přesouvají autoritu z pozorování na mluvčího.

## Odlišení

- **Od pravdivosti:** nefalzifikovatelné tvrzení může být pravdivé (metafyzika, víra); jen nepatří do vědy a nemůže sloužit jako zjištění v analýze.
- **Od verifikovatelnosti:** verifikace hledá potvrzení, falsifikovatelnost hledá možné vyvrácení.
- **Od [falsifikabilita](@/glossary/falsifikabilita.md):** synonymum užívané v jiném hesle glosáře.
- **Od hodnotových soudů:** „násilí je špatné“ není empirická hypotéza; falzifikační kritérium se na něj nevztahuje a neoslabuje jej.

## Význam pro Kompendium

V praxi platformy Prismatic, z níž kniha vzešla, je falsifikovatelnost operativním kritériem pro rozlišení **vědecky obhajitelného tvrzení** od **interpretačního narativu**. Při analýze [due diligence](@/glossary/due-diligence.md), při vyšetřování [OSINT](@/glossary/osint.md) i při klinickém posouzení manipulativních vzorců je první otázka vždy stejná: *jaký důkaz by toto tvrzení vyvrátil?* Pokud na ni nelze odpovědět, jde o víru, nikoli o zjištění. Princip stojí v jádru pilíře NCLB (*No Claim Left Behind*) – žádné tvrzení ve zprávě nesmí být formulováno tak, aby bylo imunní vůči vyvrácení. Manažerské použití: vyžadovat od analytiků u každého závěru výslovné *podmínky falzifikace*.

V investigativní praxi platformy se kritérium uplatňuje třemi způsoby:

1. **Hypotézy v případu due diligence** (např. „subjekt X je skutečným majitelem entity Y“) musí být formulovány s výslovnou podmínkou vyvrácení – *jaký dokument, registr nebo svědectví by hypotézu vyvrátilo?*
2. **Zjištění OSINT** podléhají *výzvě red teamu* – analytik z opozičního týmu musí najít alternativní vysvětlení nálezu; pokud žádné neexistuje a původní hypotéza zakazuje konkrétní pozorování, je nález robustní. Viz [Red Team](@/glossary/red-team.md).
3. **Klinické vzorce manipulace** ([gaslighting](@/glossary/gaslighting.md), [double bind](@/glossary/double-bind.md)) se diagnostikují na základě behaviorálních prediktorů, které musí být v zásadě měřitelné – bez tohoto kritéria se diagnóza stává neodvolatelnou nálepkou.

Třetí bod je pro knihu zásadní: Kompendium samo musí být falzifikovatelné. Kdyby se „EA“ dalo najít v jakémkoli vztahu, rámec by se stal stejným nástrojem moci, proti kterému varuje; viz [riziko kruhového uvažování](@/kompendium/critical-perspectives/4-circular-reasoning-risk.md).

## Obrana a zotavení

- U vlastních přesvědčení si zapisovat podmínky, za kterých by neplatila ([falzifikační myšlení](@/kompendium/self-defense-guides/5-falsification-thinking.md)).
- U cizích tvrzení se ptát, co by je vyvrátilo, a všímat si, zda otázka vyvolá vysvětlení, nebo útok.
- V terapii a výuce cvičit formulaci falzifikovatelných hypotéz o vlastní situaci ([návrh falzifikace](@/kompendium/educational-scenarios/6-falsification-design.md)).

## Literatura

- Karl R. Popper: *Logik der Forschung* (1934); *The Logic of Scientific Discovery* (Hutchinson, 1959).
- Karl R. Popper: *Conjectures and Refutations: The Growth of Scientific Knowledge* (Routledge, 1963).
- Imre Lakatos: „Falsification and the Methodology of Scientific Research Programmes“, in: I. Lakatos, A. Musgrave (eds.): *Criticism and the Growth of Knowledge* (Cambridge UP, 1970).
- A. F. Chalmers: *What Is This Thing Called Science?* (4. vyd., Hackett, 2013).

## Související

**Pojmy**

- [Falsifikace](@/glossary/falsifikace.md) – akt vyvrácení teorie protipříkladem.
- [Lakatos](@/glossary/lakatos-vyzkumny-program.md) – metodologie výzkumných programů, která Poppera zjemňuje.
- [Epistemické trauma](@/glossary/epistemicke-trauma.md) – patologie, která vzniká, když je falsifikace sociálně zablokována.
- [Popperianismus](@/glossary/popperianismus.md) – širší filozofická pozice.

**Kniha**

- [Falsifikovatelnost](@/kompendium/03-zakladni-kategorie/falsifikovatelnost.md) – kapitola základních kategorií.
- [EA-7.2.3 Popper: falzifikace](@/kompendium/techniques/ea-7-2-3-popper-falsification.md) – teoretická reflexe.

**Mimo knihu**

- [Hypothesis Generation](https://prismatic-reality-com.github.io/prismatic-promo/glossary/hypothesis-generation/) – tvorba testovatelných tvrzení.
- [Evidence](https://prismatic-reality-com.github.io/prismatic-promo/glossary/evidence/) – pozorovací „měna“ falsifikace.
- [Bayesian Reasoning](https://prismatic-reality-com.github.io/prismatic-promo/glossary/bayesian-reasoning/) – doplňkový pravděpodobnostní rámec aktualizace.
