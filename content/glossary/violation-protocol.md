+++
title = "Protokol porušení (Violation Protocol)"
weight = 4
description = "Protokol porušení doktríny NM/ND: čtyři stupně od upozornění po úplné přezkoumání, princip přiměřené odpovědi a hranice mezi kontrolou díla a trestem."

[taxonomies]
tags = ["glossary", "doktrína", "kvalita", "organizace", "etika", "kompendium"]

[extra]
category = "doktrína platformy"
abbreviation = "VP"
related_terms = ["nm-nd", "no-mercy-no-doubts", "regression-test", "archer-supreme", "clean-run", "zero-warning-policy", "qdp", "session-discipline", "supreme-commander", "aiad"]
author = "Tomas Korcak (korczis)"
date_created = "2026-02-22"
date_modified = "2026-11-10"
+++

## Vymezení

Protokol porušení (*violation protocol*) je soubor pravidel, jímž doktrína
[NM/ND](@/glossary/nm-nd.md) v prostředí Prismatic Platform třídí porušení svých požadavků a
přiřazuje jim odpověď. Politika vynucení rozlišuje čtyři stupně: drobnou odchylku, na kterou se
odpovídá upozorněním a okamžitou opravou; porušení kvality, které práci zablokuje, dokud není
opraveno; neúplné dodání, které vede k odmítnutí a novému začátku; a jednání „kompromitované
pochybností“, tedy obejití nebo zfalšování kontroly, které vede k odmítnutí a úplnému
přezkoumání. Smyslem protokolu je, aby každé porušení dostalo odpověď přiměřenou své povaze,
aby tato odpověď byla předem známá a aby po ní zůstal záznam. Obdobné odstupňování dochovává
archiv knihy v kontrole Trinity Gate, která obsah podle závažnosti nálezu propustí s
upozorněním, zadrží k přezkumu, nebo zablokuje (Korčák, 2026b).

Kompendium protokol popisuje ze dvou důvodů. Za prvé je to dobře čitelný příklad toho, jak lze
odpovědnost za kvalitu poznání uspořádat jako stupňovitou, předvídatelnou soustavu, a ne jako
libovůli toho, kdo právě kontroluje. Za druhé ukazuje hranici, kterou kniha sleduje v celé
části o organizacích: stupňování sankcí je legitimní, pokud se týká díla a pravidel, a stává se
nástrojem kontroly, pokud se obrátí proti osobě a jejímu vnitřnímu světu (Lifton, 1961).

## Pojmová historie

Protokol prošel vývojem. Kanonické znění doktríny obsahovalo jen tři stupně: upozornění při
první drobné odchylce, blokaci při opakované odchylce nebo porušení kvality s postoupením k
přezkumu a odmítnutí s úplným novým začátkem, kam patřilo jak neúplné dodání, tak provedení
zatížené pochybností. Politika vynucení poslední kategorii oddělila do samostatného čtvrtého
stupně a ke každému stupni určila, kdo porušení řeší, kdy musí být vyřešeno a jaký záznam po
něm zůstane: u prvního stupně automatický nástroj a prostý záznam, u druhého nástroj s
přezkumem a založený úkol, u třetího posuzovatel a zpráva o incidentu, u čtvrtého nejvyšší
úroveň řízení a přezkum architektury. Oba dokumenty jsou interní a veřejně přístupné nejsou.
Stupňování, v němž s každým vyšším stupněm roste zásah do práce i nárok na záznam, je však
jednoduchou podobou regulační pyramidy, kterou rozebírá oddíl o odlišení od příbuzných jevů
(Ayres a Braithwaite, 1992).

Stejná stupňovitá logika se přenesla z kvality kódu na kvalitu úsudku. Archivovaný modul, který
rozšiřuje kontrolu [Trinity Gate](@/glossary/trinity-gate.md) o vrstvu detekce technik
epistemické anihilace, třídí nálezy podle závažnosti: obsah bez nálezu projde, při nálezech
nižší závažnosti projde s upozorněním a s mírou důvěry sníženou podle počtu nálezů, při vysoké
závažnosti se zadrží k dalšímu přezkumu a při kritické nebo terminální závažnosti se zablokuje
(Korčák, 2026b). Průchod kontrolou přitom míru důvěry nezvyšuje, kdežto zablokování ji snižuje,
a to tím více, čím je zásah tvrdší (Korčák, 2026b). Pozdější doktrína epistemických axiomů
vztáhla tutéž čtyřstupňovou logiku na porušení pravidel poznání, od upozornění při měkkém
porušení jednoho axiomu až po vyšetření při souběžném porušení více axiomů. Protokol se tím
rozšířil z kvality kódu na kvalitu úsudku, což je pro knihu jeho nejzajímavější podoba.

## Struktura stupňů

První stupeň, drobná odchylka, zahrnuje porušení, která neohrožují správnost, například
stylovou nejednotnost nebo mezeru v dokumentaci pomocné funkce. Odpovědí je upozornění a oprava
v rámci téže práce; porušení se zaznamená, aby bylo možné rozpoznat opakující se vzorec. Takové
zacházení odpovídá zásadě literatury o spolehlivých organizacích, že drobné odchylky jsou
cennými signály a mají se zaznamenávat dříve, než přerostou ve vážné selhání (Weick a
Sutcliffe, 2007).

Druhý stupeň, porušení kvality, zahrnuje selhání, která zachytí automatické nástroje: varování
překladače, nesplněnou kontrolu stylu nebo typů, neúspěšný test či pokles pokrytí testy.
Odpovědí je blokace: změna se nepřijme, dokud není opravena a znovu neprojde všemi kontrolami.
Literatura o průběžném dodávání softwaru popisuje stejný princip jako zastavení linky, kdy se
při selhání kontroly přeruší práce, dokud se příčina neodstraní, protože přidávání další práce
na vadný základ vadu jen rozšiřuje (Kim, Humble, Debois a Willis, 2016).

Třetí stupeň, neúplné dodání, se týká díla, které se vydává za hotové, ačkoli hotové není:
obsahuje pahýl kódu, zástupnou implementaci vracející pevnou hodnotu, nevyřízenou poznámku k
dopracování nebo opravu chyby bez [regresního testu](@/glossary/regression-test.md). Odpovědí
není oprava, ale odmítnutí a nový začátek. Zdůvodnění, které uváděla starší verze hesla, je
architektonické: doplňování neúplného díla po kouscích vede k roztříštěnému návrhu, kdežto nový
začátek vynucuje celistvé řešení. Fowler podobně upozorňuje, že kód, jehož návrh se rozpadl, se
často vyplatí přepsat, a ne dál záplatovat (Fowler, 1999).

Čtvrtý stupeň je kvalitativně odlišný. Netýká se vady díla, ale porušení důvěryhodnosti samotné
kontroly: obejití kontrol před uložením změny, vypnutí brány kvality nebo zfalšování výsledku
testu. Taková porušení ohrožují všechna ostatní pravidla, protože bez spolehlivé kontroly
ztrácí smysl každá další úroveň. Diane Vaughanová ukázala na rozhodování před havárií
raketoplánu Challenger, jak se odchylka od bezpečnostních pravidel postupně stane přijatelnou
normou, když se opakovaně toleruje bez následků (Vaughan, 1996). Čtvrtý stupeň je pojistkou
právě proti takové normalizaci.

## Odlišení od příbuzných jevů

Protokol se liší od běžného binárního řízení kvality, v němž kontrola buď projde, nebo
neprojde, tím, že rozlišuje povahu porušení. Toto rozlišení má oporu v teorii regulace. Ian
Ayres a John Braithwaite navrhli model pyramidy vynucování, v němž regulátor začíná nejmírnější
odpovědí, přesvědčováním a upozorněním, a k tvrdším sankcím přistupuje jen tehdy, když mírnější
selžou; podmínkou účinnosti je, aby všichni věděli, že vyšší stupně existují a budou použity
(Ayres a Braithwaite, 1992). Protokol porušení je jednoduchou podobou takové pyramidy.

Odlišit je třeba i stupně protokolu od kázeňských sankcí. Žádný stupeň protokolu nesměřuje k
osobě: odpovědí je vždy osud díla, tedy jeho upozornění, zablokování, odmítnutí nebo
přezkoumání, a u nejvyššího stupně přezkum architektury, která porušení umožnila. Sidney Dekker
v konceptu spravedlivé kultury rozlišuje lidskou chybu, rizikové jednání a bezohlednost a
upozorňuje, že trestání chyb vede k jejich zamlčování (Dekker, 2007). Čtvrtý stupeň protokolu
je jediný, který se týká vědomého jednání, a i ten vyžaduje nejprve zjistit, zda šlo o omyl,
nebo o úmyslné obejití.

## Organizační a právní rámec

V organizaci, která chce podobný protokol zavést, rozhoduje o jeho účinku kultura hlášení.
James Reason ukázal, že organizace se z chyb učí jen tehdy, když existuje spolehlivý systém
jejich hlášení a když lidé vědí, kde vede hranice mezi přijatelným a nepřijatelným jednáním
(Reason, 1997). Protokol tuto hranici zviditelňuje tím, že ji zapisuje předem, a záznam o
každém porušení umožňuje rozpoznat vzorce, které ukazují na vadu procesu, a ne na selhání
jednotlivce. Praktickou stránku rozvádí oddíl
[učení po incidentu](@/kompendium/organizational-defense/40-post-incident-learning.md).

Z hlediska procesní spravedlnosti má protokol tři žádoucí vlastnosti: pravidla jsou známa
předem, odpověď je přiměřená povaze porušení a po rozhodnutí zůstává záznam, který lze
přezkoumat. Braithwaite tyto vlastnosti považuje za podmínku toho, aby regulované subjekty
pravidla přijaly za legitimní a dodržovaly je i bez dozoru (Braithwaite, 2002). Organizace,
která protokol přebírá, by k nim měla doplnit čtvrtou: možnost namítnout, že porušení bylo
zařazeno chybně, jak předpokládá oddíl
[interní vyšetřování](@/kompendium/organizational-defense/32-internal-investigation.md)
(Dekker, 2007).

## Význam pro epistemickou obranu

Pro odborníka, který posuzuje skupinu s vysokou mírou kontroly, je protokol užitečný jako
srovnávací vzor. V totalistickém prostředí existují také stupňované odpovědi na „porušení“, ale
jejich předmětem nejsou výstupy, nýbrž myšlenky, pochybnosti a vztahy člověka; Lifton popsal
kult zpovědi, v němž se od člena vyžaduje neustálé odhalování vlastních prohřešků, a požadavek
čistoty, podle něhož je každá odchylka morálním selháním (Lifton, 1961). Michel Foucault ukázal,
jak se moderní disciplína opírá o soustavné pozorování, záznam a normalizující sankci, které
proniknou až do sebepojetí toho, kdo je pozorován (Foucault, 1975).

Rozlišovací znaky jsou proto zřetelné. Protokol, který chrání poznání, se vztahuje na dílo,
jeho pravidla jsou veřejná, odpověď přiměřená a otevřená přezkumu a za nejzávažnější považuje
podvod s kontrolou. Systém, který poznání ničí, se vztahuje na osobu, pravidla mění podle
potřeby vedení, trestá pochybnost a za nejzávažnější považuje nesouhlas (Hassan, 1988).
Člověk, který z takového prostředí odchází, potřebuje často znovu získat schopnost odlišit
chybu, kterou lze opravit, od viny, kterou mu skupina připisovala; tuto práci popisují
[protokoly zotavení](@/kompendium/recovery-protocols/_index.md) (Herman, 1992).

## Meze a otevřené otázky

Mezí protokolu je, že přiměřenost odpovědi stojí na správném zařazení porušení, a zařazení
závisí na nástrojích, které porušení odhalí. Co nástroje nezachytí, například chybný úsudek v
návrhu, protokol nevidí, a jeho přísnost tak může vytvářet falešný dojem úplné kontroly (Power,
1997). Druhou mezí je pevnost odpovědí: nový začátek u neúplného dodání je rozumný u malých
změn, u rozsáhlé práce však může být neúměrně nákladný, a protokol neurčuje, jak se taková
situace řeší.

Otevřenou otázkou zůstává, jak protokol přenést z kódu, kde nástroje rozhodují mechanicky, do
práce s poznáním, kde o porušení musí rozhodnout člověk. Doktrína epistemických axiomů tento
přenos naznačuje, ale ponechává rozhodnutí o vyšších stupních na nejvyšší úrovni řízení; v
archivované aplikaci připadaly kritické epistemické útoky agentovi s nejvyšší autoritou
(Korčák, 2026c). Tím se protokol vrací k otázce, kterou teorie regulace považuje za klíčovou:
kdo kontroluje kontrolora a jak se lze proti jeho rozhodnutí bránit (Ayres a Braithwaite,
1992).

## Literatura

- Ayres, I., & Braithwaite, J. (1992). *Responsive regulation: Transcending the deregulation
  debate*. Oxford University Press.
- Braithwaite, J. (2002). *Restorative justice and responsive regulation*. Oxford University
  Press.
- Dekker, S. (2007). *Just culture: Balancing safety and accountability*. Ashgate.
- Foucault, M. (1975). *Surveiller et punir: Naissance de la prison*. Gallimard.
- Fowler, M. (1999). *Refactoring: Improving the design of existing code*. Addison-Wesley.
- Hassan, S. (1988). *Combatting cult mind control*. Park Street Press.
- Herman, J. L. (1992). *Trauma and recovery*. Basic Books.
- Kim, G., Humble, J., Debois, P., & Willis, J. (2016). *The DevOps handbook: How to create
  world-class agility, reliability, and security in technology organizations*. IT Revolution
  Press.
- Korčák, T. (2026b). *PrismaticAnnihilation.TrinityBridge* (modul). Archiv kompendia,
  `archive/prismatic-platform/apps/prismatic_annihilation/lib/prismatic_annihilation/trinity_bridge.ex`
  (dostupné v repozitáři knihy).
- Korčák, T. (2026c). *Prismatic Annihilation – Agent Deployment Guide*. Archiv kompendia,
  `archive/prismatic-platform/apps/prismatic_annihilation/AGENTS.md` (dostupné v repozitáři
  knihy).
- Lifton, R. J. (1961). *Thought reform and the psychology of totalism: A study of
  „brainwashing“ in China*. W. W. Norton.
- Power, M. (1997). *The audit society: Rituals of verification*. Oxford University Press.
- Reason, J. (1997). *Managing the risks of organizational accidents*. Ashgate.
- Vaughan, D. (1996). *The Challenger launch decision: Risky technology, culture, and deviance
  at NASA*. University of Chicago Press.
- Weick, K. E., & Sutcliffe, K. M. (2007). *Managing the unexpected: Resilient performance in
  an age of uncertainty* (2nd ed.). Jossey-Bass.

## Související

**Doktrína**

- [Doktrína NM/ND](@/glossary/nm-nd.md) – doktrína, jejíž porušení protokol třídí.
- [No Mercy, No Doubts](@/glossary/no-mercy-no-doubts.md) – etické vymezení tvrdosti vůči
  chybám, a ne lidem.
- [QDP](@/glossary/qdp.md) – metrika dluhu kvality, z níž vycházela porušení druhého stupně.
- [Regression Test](@/glossary/regression-test.md) – test, jehož chybění je neúplným dodáním.
- [Archer Supreme](@/glossary/archer-supreme.md) – agent pověřený přezkumem nejzávažnějších
  porušení.

**Organizační obrana**

- [Učení po incidentu](@/kompendium/organizational-defense/40-post-incident-learning.md) – jak
  se z porušení stává poučení.
- [Interní vyšetřování](@/kompendium/organizational-defense/32-internal-investigation.md) –
  přezkum sporného zařazení.
- [Psychologická bezpečnost](@/kompendium/organizational-defense/16-psychological-safety.md) –
  podmínka, za níž se porušení hlásí, a neskrývají.

**Zneužití kontroly**

- [High control group](@/glossary/high-control-group.md) – prostředí, v němž se stupňované
  sankce obracejí proti osobě.
- [Lifton: kritéria myšlenkové reformy](@/kompendium/techniques/ea-8-2-2-lifton-thought-reform-criteria.md)
  – kult zpovědi a požadavek čistoty.
- [Protokoly zotavení](@/kompendium/recovery-protocols/_index.md) – oddělení opravitelné chyby
  od připisované viny.
