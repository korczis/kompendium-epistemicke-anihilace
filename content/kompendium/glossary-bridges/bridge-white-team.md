+++
title = "Bridge: White Team (bílý tým)"
description = "Most mezi heslem White Team a knihou: konstruktivní ověřování, že systém drží, rozdíl mezi „nenalezeno“ a „doloženo“ a lidská obdoba – nezávislý rozhodčí a doložená odolnost."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "white-team", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["white-team", "color-teams", "red-team", "purple-team", "qeve", "evidence-based"]
glossary_target = "white-team"
toc = false
+++

# Bridge: White Team (bílý tým)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a nápravě. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[White Team](@/glossary/white-team.md) (bílý tým) je jedním z [barevných týmů](@/glossary/color-teams.md)
platformy, z níž Kompendium vzešlo. Odpovídá za **konstruktivní ověřování**: dokládá, že se systémy
chovají správně, pomocí postupné ověřovací metodiky, formálních důkazů, validace kontraktů a analýzy
invariantů. Validace kontraktů vychází z přístupu, který Meyer (1992) nazval návrhem podle kontraktu:
každá součást systému výslovně uvádí, co od svého okolí předpokládá a co mu zaručuje, a obojí lze
kontrolovat. Zatímco [Red Team](@/glossary/red-team.md) se snaží systém rozbít, bílý tým se snaží
doložit, že drží – a hodnotí i kvalitu důkazního záznamu, o který se takové tvrzení opírá.

Ve vojenských a bezpečnostních cvičeních označuje „bílá buňka“ neutrální skupinu, která cvičení řídí,
stanoví pravidla a hodnotí výsledek; Zenko (2015) popisuje, že bez takového rozhodčího se cvičení
snadno změní ve formalitu, jejíž výsledek je předem dán. Platforma tuto roli rozšiřuje o formální
ověřování. Myšlenkové kořeny leží v axiomatickém přístupu ke správnosti programů, který formuloval
Hoare (1969): chování programu lze popsat podmínkami před a po provedení a invarianty, a jejich splnění
dokázat. Heslo patří do kontextu platformy; kniha ho zařazuje mezi mosty kvůli zásadě, kterou z něj
přebírá: **„nenalezeno“ neznamená „doloženo“**.

## Konstruktivní ověřování očima knihy

Dijkstra (1972) ve své přednášce při převzetí Turingovy ceny upozornil, že testování programu může
ukázat přítomnost chyb, ale nikdy jejich nepřítomnost. Bílý tým stojí právě na tomto rozlišení: to, že
útok neuspěl, ještě neznamená, že systém je bezpečný; znamená jen, že tento útok neuspěl. Doložit
správnost vyžaduje jiný druh práce než hledat chyby – vymezit, co má platit, a ukázat, že to platí.

Kniha tento rozdíl přenáší na lidské posuzování. V klinice a ve forenzní praxi platí, že nepřítomnost
dokladu o manipulaci nebo zneužívání není dokladem o jejich nepřítomnosti; kdo nic nenašel, má to
uvést jako výsledek svého hledání, ne jako závěr o skutečnosti. Platí to i opačně: organizace, v níž
audit nenašel žádné problémy, není tím ještě doloženě zdravá – kniha proto u organizační obrany
rozlišuje mezi absencí stížností a doloženou bezpečností. Kahneman (2011) popsal sklon usuzovat jen
z toho, co je k dispozici, jako by to bylo vše, co existuje; bílý tým je technickou ochranou proti
tomuto sklonu.

Druhou stránkou je **konstruktivní pohled na odolnost**. Kniha se většinou zabývá tím, jak manipulace
škodí; bílý tým připomíná, že stejně důležité je doložit, co funguje – které obranné struktury
v instituci skutečně drží a které schopnosti si člověk po zotavení skutečně obnovil. Výzkum odolnosti
po nepříznivých zkušenostech, jak ho shrnula Masten (2001), ukazuje, že odolnost je obvykle výsledkem
běžných adaptačních systémů – vztahů, schopnosti sebeřízení, smyslu –, nikoli výjimečných vlastností.
Doložit, které z nich člověk má, je stejně podstatné jako popsat, co mu bylo vzato.

## Kde se pojem v knize vyskytuje

Jak bílý tým platformy dokládá, že systém skutečně drží, a proč „nenalezeno“ neznamená „doloženo“
v Dijkstrově (1972) smyslu, popisuje stránka [White Team a EA](@/kompendium/aiad-integration/white-team-ea-verification.md). Celou
soustavu týmů přibližuje stránka [Vztah ke Decision Engine a Color Teams](@/kompendium/02-uvod/vztah-k-decision-engine.md)
a stránky jednotlivých týmů, například [Red Team a EA](@/kompendium/aiad-integration/red-team-ea-detection.md)
a [Purple Team a EA](@/kompendium/aiad-integration/purple-team-ea-synthesis.md).

Lidskou obdobu neutrálního rozhodčího rozebírají kapitoly [Role ombudsmana](@/kompendium/organizational-defense/6-ombudsman-role.md)
a [Auditní výbor proti EA](@/kompendium/organizational-defense/5-audit-committee-EA.md); kvalitu
důkazního záznamu kapitola [Forenzní dokumentace](@/kompendium/forensic-legal/10-forensic-documentation.md).
Konstruktivní stránku zotavení – doložení obnovených schopností – rozvádí protokol
[Dlouhodobá kultivace resilience](@/kompendium/recovery-protocols/longterm-resilience-cultivation.md).
Potřebu nezávislé kontroly, která nestojí pod tlakem toho, koho kontroluje, popsal pro organizace
Reason (1997): instituce, v níž si provoz hodnotí jen sám, ztrácí schopnost zachytit vlastní skryté
slabiny.

## Od pojmu k praxi

### Rozpoznání

Varovným znakem je tvrzení o bezpečí nebo správnosti, které stojí jen na tom, že se nic nenašlo.
Altman a Bland (1995) tuto chybu popsali v medicínském výzkumu: studie, která neprokázala účinek, se
čte jako důkaz, že účinek neexistuje, ačkoli nepřítomnost dokladu není dokladem nepřítomnosti. V
organizaci se pozná podle formulací „nebyly zjištěny žádné nedostatky“ bez popisu, co a jak se
hledalo. V klinice podle závěru „bez známek manipulace“ po jediném rozhovoru. Kniha k tomu odkazuje na
kritickou kapitolu [Riziko falešně pozitivních detekcí](@/kompendium/critical-perspectives/5-false-positive-risk.md),
která rozebírá i opačné riziko – vidět manipulaci tam, kde není.

### Obrana

Obranou je oddělit dvě otázky: co se hledalo a nenašlo, a co se doložilo. Zpráva, posudek nebo audit
by měly uvádět obojí. Pro instituce kniha doporučuje, aby tvrzení o tom, že ochranné mechanismy fungují,
stálo na doložených případech, kdy fungovaly – například na stížnostech, které byly prošetřeny a vedly
k nápravě –, ne jen na jejich existenci v předpisech. Smith a Freyd (2014) ukázali, že selhání
instituce, která na oznámenou újmu nereaguje ochranně, prohlubuje škodu, kterou člověk utrpěl; pouhá
existence postupu na papíře před tímto selháním nechrání. Pro jednotlivce v zotavení je obranou zapisovat
nejen obtíže, ale i doklady obnovy: situace, v nichž dokázal důvěřovat vlastnímu úsudku.

### Náprava

Když se ukáže, že tvrzení o bezpečí stálo jen na „nenalezeno“, náprava spočívá v doplnění skutečného
ověření, ne v hledání viníka; Dekker (2006) ukazuje, že vysvětlit selhání chybou jednotlivce
zakrývá podmínky, které ho umožnily, a brání tomu, aby se jim předešlo příště. Kniha k tomu odkazuje na [Učení po incidentu](@/kompendium/organizational-defense/40-post-incident-learning.md).
U lidí, jejichž zkušenost byla odmítnuta s odkazem na to, že „nic se nenašlo“, je součástí nápravy uznání,
že absence dokladu nebyla vyvrácením jejich výpovědi.

### Rámec pro profesionály

Pro znalce, kliniky a supervizory plyne z modelu bílého týmu zásada formulovat závěry podle toho, co
bylo zkoumáno. Místo „k manipulaci nedošlo“ je přesnější „v dostupných podkladech jsem nenašel znaky,
které by ji doložily; zkoumal jsem tyto zdroje a tyto zdroje nebyly k dispozici“. Odpovídá to
zásadám forenzního posuzování, jak je shrnul Heilbrun (2001): závěr se opírá o více nezávislých
zdrojů informací a posudek uvádí, z čeho vychází a kde jsou meze jeho podkladů. Kniha rozvádí tuto
disciplínu v kapitolách [Supervizní rámce](@/kompendium/06-klinicke-aplikace/supervizni-ramce.md) a
[Znalec EA](@/kompendium/forensic-legal/21-expert-witness-EA.md).

## Odlišení od příbuzných pojmů

White Team je třeba odlišit od [Purple Teamu](@/glossary/purple-team.md): fialový tým propojuje
konkrétní nálezy útoku s obranou a uzavírá je, bílý tým dokládá vlastnosti systému jako celku. Od rámce
[QEVE](@/glossary/qeve.md) se liší předmětem – QEVE ověřuje jednotlivé závěry, bílý tým systémy. Od
auditu souladu se liší tím, že neověřuje, zda se dodržují pravidla, ale zda systém skutečně dělá to,
co má. Power (1997) upozornil, že audit má sklon ověřovat především to, zda jsou postupy
zdokumentované a kontrolovatelné, a že tato „rituální“ kontrola může nahradit otázku, zda organizace
skutečně dosahuje toho, co deklaruje.

## Časté omyly

Prvním omylem je považovat neúspěšný útok za důkaz bezpečí. Druhým omylem je domněnka, že formální
důkaz pokrývá všechno; dokazuje jen to, co bylo formálně vymezeno, a Fetzer (1988) připomněl, že
důkaz o programu se týká abstraktního modelu, nikoli fyzického stroje, na němž program běží. Třetím omylem je přenášet na lidi
představu „doložené správnosti“: lidské zotavení se nedokazuje, ale dokládá v čase a s vědomím, že
se může měnit.

## Příklad (anonymizovaný kompozit)

Sportovní klub pro mládež po stížnosti rodičů oznámí, že interní šetření „nezjistilo žádné
pochybení“ trenéra. Externí poradkyně, kterou si klub později přizve, se ptá, s kým šetření mluvilo.
Ukáže se, že jen s trenérem a se dvěma asistenty. Poradkyně doporučí nové šetření, v němž budou
vyslechnuti i hráči a rodiče, a zprávu, která uvede, co se zjišťovalo a co se zjistit nepodařilo.
Nové šetření nalezne vzorec ponižování, který první šetření nemohlo zachytit. Případ ilustruje to, co
Smith a Freyd (2014) nazývají institucionální zradou: první šetření nebylo jen neúplné, ale svým závěrem
sdělilo hráčům, že jejich zkušenost se nepočítá.

## Meze a otevřené otázky

Přenos formálního ověřování na lidské instituce je analogie, a Power (1997) ukazuje, jak snadno se
z ověřování v organizacích stává rituál, který potvrzuje sám sebe. Otevřená zůstává otázka, jak doložit
„správnost“ instituce nebo zotavení člověka, když neexistuje formální specifikace toho, co má platit,
a jak sdělit výsledek, který zní „nenalezeno, ale nedoloženo“, lidem, kteří potřebují jasnou odpověď.

## Literatura

- Altman, D. G., & Bland, J. M. (1995). Absence of evidence is not evidence of absence. *BMJ*, 311(7003), 485.
- Dekker, S. (2006). *The Field Guide to Understanding Human Error*. Ashgate.
- Dijkstra, E. W. (1972). The humble programmer. *Communications of the ACM*, 15(10), 859–866.
- Fetzer, J. H. (1988). Program verification: The very idea. *Communications of the ACM*, 31(9), 1048–1063.
- Heilbrun, K. (2001). *Principles of Forensic Mental Health Assessment*. Kluwer Academic/Plenum.
- Hoare, C. A. R. (1969). An axiomatic basis for computer programming. *Communications of the ACM*, 12(10), 576–580.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. Farrar, Straus and Giroux.
- Masten, A. S. (2001). Ordinary magic: Resilience processes in development. *American Psychologist*, 56(3), 227–238.
- Meyer, B. (1992). Applying „design by contract“. *Computer*, 25(10), 40–51.
- Power, M. (1997). *The Audit Society: Rituals of Verification*. Oxford University Press.
- Reason, J. (1997). *Managing the Risks of Organizational Accidents*. Ashgate.
- Smith, C. P., & Freyd, J. J. (2014). Institutional betrayal. *American Psychologist*, 69(6), 575–587.
- Zenko, M. (2015). *Red Team: How to Succeed by Thinking Like the Enemy*. Basic Books.

## Související

**Glosář**

- [White Team](@/glossary/white-team.md) – technické heslo, které most propojuje.
- [Color Teams](@/glossary/color-teams.md) – soustava barevných týmů.
- [Red Team](@/glossary/red-team.md) – tým, který se snaží systém rozbít.
- [Evidence-based](@/glossary/evidence-based.md) – praxe opřená o doklady.

**Kniha**

- [White Team a EA](@/kompendium/aiad-integration/white-team-ea-verification.md) – konstruktivní ověřování na platformě.
- [Riziko falešně pozitivních detekcí](@/kompendium/critical-perspectives/5-false-positive-risk.md) – opačné riziko.
- [Role ombudsmana](@/kompendium/organizational-defense/6-ombudsman-role.md) – neutrální rozhodčí v instituci.
- [Dlouhodobá kultivace resilience](@/kompendium/recovery-protocols/longterm-resilience-cultivation.md) – doložená obnova.

**Sesterské mosty**

- [Bridge: Color Teams](@/kompendium/glossary-bridges/bridge-color-teams.md) – celý systém týmů.
- [Bridge: Purple Team](@/kompendium/glossary-bridges/bridge-purple-team.md) – uzavírání nálezů.
- [Bridge: QEVE](@/kompendium/glossary-bridges/bridge-qeve.md) – ověřování závěrů.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [White Team (bílý tým)](@/glossary/white-team.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
