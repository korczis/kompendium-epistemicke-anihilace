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
přiřazuje jim odpověď. Platná politika vynucení rozlišuje čtyři stupně: drobnou odchylku, na
kterou se odpovídá upozorněním a okamžitou opravou; porušení kvality, které práci zablokuje,
dokud není opraveno; neúplné dodání, které vede k odmítnutí a novému začátku; a jednání
„kompromitované pochybností“, tedy obejití nebo zfalšování kontroly, které vede k odmítnutí a
úplnému přezkoumání (Korčák, 2025c). Smyslem protokolu je, aby každé porušení dostalo
odpověď přiměřenou své povaze, aby tato odpověď byla předem známá a aby po ní zůstal záznam.

Kompendium protokol popisuje ze dvou důvodů. Za prvé je to dobře čitelný příklad toho, jak lze
odpovědnost za kvalitu poznání uspořádat jako stupňovitou, předvídatelnou soustavu, a ne jako
libovůli toho, kdo právě kontroluje. Za druhé ukazuje hranici, kterou kniha sleduje v celé
části o organizacích: stupňování sankcí je legitimní, pokud se týká díla a pravidel, a stává se
nástrojem kontroly, pokud se obrátí proti osobě a jejímu vnitřnímu světu (Lifton, 1961).

## Pojmová historie

Protokol prošel vývojem, který je v pramenech dobře doložen. Kanonické znění doktríny ve verzi
2.0.0 z prosince 2025 obsahuje jen tři stupně: upozornění při první drobné odchylce, blokaci
při opakované odchylce nebo porušení kvality s postoupením k přezkumu a odmítnutí s úplným
novým začátkem, kam patří jak neúplné dodání, tak provedení zatížené pochybností (Korčák,
2025a). Politika vynucení z téhož měsíce poslední kategorii oddělila do samostatného čtvrtého
stupně a ke každému stupni určila, kdo porušení řeší, kdy musí být vyřešeno a jaký záznam po
něm zůstane: u prvního stupně automatický nástroj a prostý záznam, u druhého nástroj s
přezkumem a založený úkol, u třetího posuzovatel a zpráva o incidentu, u čtvrtého nejvyšší
úroveň řízení a přezkum architektury (Korčák, 2025c).

Pozdější doktrína epistemických axiomů převzala stejnou čtyřstupňovou logiku pro porušení
pravidel poznání: měkké porušení jednoho axiomu vede k upozornění, tvrdé porušení k blokaci,
selhání kontroly [Trinity Gate](@/glossary/trinity-gate.md) k zastavení a přezkumu a souběžné
porušení více axiomů k vyšetření a auditu (Korčák, 2026a). Protokol se tím rozšířil z kvality
kódu na kvalitu úsudku, což je pro knihu jeho nejzajímavější podoba. Starší platformní verze
tohoto hesla navíc uváděla, že se opakovaná drobná odchylka v témže souboru automaticky
povyšuje na vyšší stupeň; v politice vynucení toto pravidlo výslovně uvedeno není.

## Struktura stupňů

První stupeň, drobná odchylka, zahrnuje porušení, která neohrožují správnost, například
stylovou nejednotnost nebo mezeru v dokumentaci pomocné funkce. Odpovědí je upozornění a
oprava v rámci téže práce; porušení se zaznamená, aby bylo možné rozpoznat opakující se vzorec
(Korčák, 2025c). Takové zacházení odpovídá zásadě literatury o spolehlivých organizacích, že
drobné odchylky jsou cennými signály a mají se zaznamenávat dříve, než přerostou ve vážné
selhání (Weick a Sutcliffe, 2007).

Druhý stupeň, porušení kvality, zahrnuje selhání, která zachytí automatické nástroje:
varování překladače, nesplněnou kontrolu stylu nebo typů, neúspěšný test či pokles pokrytí
testy. Odpovědí je blokace: změna se nepřijme, dokud není opravena a znovu neprojde všemi
kontrolami (Korčák, 2025c). Literatura o průběžném dodávání softwaru popisuje stejný princip
jako zastavení linky, kdy se při selhání kontroly přeruší práce, dokud se příčina neodstraní,
protože přidávání další práce na vadný základ vadu jen rozšiřuje (Kim, Humble, Debois a
Willis, 2016).

Třetí stupeň, neúplné dodání, se týká díla, které se vydává za hotové, ačkoli hotové není:
obsahuje pahýl kódu, zástupnou implementaci vracející pevnou hodnotu, nevyřízenou poznámku k
dopracování nebo opravu chyby bez [regresního testu](@/glossary/regression-test.md) (Korčák,
2025a). Odpovědí není oprava, ale odmítnutí a nový začátek. Zdůvodnění, které uváděla starší
verze hesla, je architektonické: doplňování neúplného díla po kouscích vede k roztříštěnému
návrhu, kdežto nový začátek vynucuje celistvé řešení. Fowler podobně upozorňuje, že kód, jehož
návrh se rozpadl, se často vyplatí přepsat, a ne dál záplatovat (Fowler, 1999).

Čtvrtý stupeň je kvalitativně odlišný. Netýká se vady díla, ale porušení důvěryhodnosti samotné
kontroly: obejití kontrol před uložením změny, vypnutí brány kvality nebo zfalšování výsledku
testu (Korčák, 2025c). Taková porušení ohrožují všechna ostatní pravidla, protože bez spolehlivé
kontroly ztrácí smysl každá další úroveň. Diane Vaughanová ukázala na rozhodování před havárií
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

Odlišit je třeba i stupně protokolu od kázeňských sankcí. Žádný stupeň v pramenech nesměřuje
k osobě: odpovědí je vždy osud díla, tedy jeho upozornění, zablokování, odmítnutí nebo
přezkoumání, a u nejvyššího stupně přezkum architektury, která porušení umožnila (Korčák,
2025c). Sidney Dekker v konceptu spravedlivé kultury rozlišuje lidskou chybu, rizikové jednání a
bezohlednost a upozorňuje, že trestání chyb vede k jejich zamlčování (Dekker, 2007). Čtvrtý
stupeň protokolu je jediný, který se týká vědomého jednání, a i ten vyžaduje nejprve zjistit,
zda šlo o omyl, nebo o úmyslné obejití.

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
návrhu, protokol nevidí, a jeho přísnost tak může vytvářet falešný dojem úplné kontroly
(Power, 1997). Druhou mezí je pevnost odpovědí: nový začátek u neúplného dodání je rozumný u
malých změn, u rozsáhlé práce však může být neúměrně nákladný, a prameny neuvádějí, jak se
taková situace řeší.

Otevřenou otázkou zůstává, jak protokol přenést z kódu, kde nástroje rozhodují mechanicky, do
práce s poznáním, kde o porušení musí rozhodnout člověk. Doktrína epistemických axiomů tento
přenos naznačuje, ale ponechává rozhodnutí o vyšších stupních na nejvyšší úrovni řízení
(Korčák, 2026a), a tím se vrací k otázce, kterou teorie regulace považuje za klíčovou: kdo
kontroluje kontrolora a jak se lze proti jeho rozhodnutí bránit (Ayres a Braithwaite, 1992).

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
- Korčák, T. (2025a). *NO MERCY, NO DOUBTS – AIAD execution doctrine* (verze 2.0.0). Prismatic
  Platform, interní dokument `.aiad/doctrine/no-mercy-no-doubts.doctrine.md`.
- Korčák, T. (2025c). *NMND – Žádná milost, žádné pochyby (Enforcement Policy)*. Prismatic
  Platform, interní dokument `.aiad/policies/no-mercy-no-doubts-enforcement.policy.md`.
- Korčák, T. (2026a). *Addiction Preservation Doctrine* (verze 1.0.0). Prismatic Platform,
  interní dokument `.aiad/doctrine/addiction-preservation.doctrine.md`.
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
