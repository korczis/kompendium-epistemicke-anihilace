+++
title = "Bridge: Entity Resolution (sjednocování entit)"
description = "Most mezi heslem Entity Resolution a knihou: kdy dva záznamy patří jedné osobě, škoda z chybného sloučení, sjednocování údajů jako mechanismus doxingu a pravidla lidské revize."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "entity-resolution", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["entity-resolution", "due-diligence", "doxing", "osint", "sanctions-screening", "intelligence-fusion"]
glossary_target = "entity-resolution"
toc = false
+++

# Bridge: Entity Resolution (sjednocování entit)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a nápravě. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[Entity resolution](@/glossary/entity-resolution.md) (sjednocování entit, též propojování záznamů nebo
deduplikace) je proces, který určuje, zda různé záznamy – často z odlišných zdrojů, s jinými
identifikátory, pravopisem a úplností – patří téže skutečné entitě. Ve zpravodajství, v prověrkách a
v kybernetické bezpečnosti jde o propojování osob, firem, domén, adres a účtů napříč zdroji, které
nemají společný identifikátor. Teoretický základ položili Fellegi a Sunter (1969), kteří problém
formulovali pravděpodobnostně: dvojice záznamů se zařadí jako shoda, neshoda nebo případ k lidské
revizi podle toho, jak silně shodné a neshodné rysy svědčí pro jednu či druhou možnost. Ještě dříve
Newcombe a spolupracovníci (1959) ukázali automatické propojování záznamů o narozeních a sňatcích.

Na platformě, z níž Kompendium vzešlo, je sjednocování entit součástí subsystému prověrek
([due diligence](@/glossary/due-diligence.md)). Heslo patří do kontextu platformy; kniha ho zařazuje mezi
mosty kvůli jeho etické stránce, která přímo souvisí s ochranou lidí před epistemickou újmou.

## Sjednocování entit očima knihy

Každé sjednocování může selhat dvěma způsoby. **Chybné sloučení** spojí dva různé lidi do jedné
„entity“, takže na nevinného člověka přejdou údaje o jiném. **Chybné rozdělení** naopak rozloží jednu
osobu do více záznamů, takže se ztratí souvislost, která by byla podstatná. Christen (2012) v přehledu
metod upozorňuje, že mezi oběma chybami vždy existuje kompromis: přísnější práh snižuje chybná sloučení
a zvyšuje chybná rozdělení. Volba prahu je proto rozhodnutím o tom, jaký druh chyby je v dané situaci
přijatelnější – a to je otázka hodnotová, ne technická.

Pro knihu je chybné sloučení zvlášť závažné. Když se člověk v databázi „spojí“ s někým, kdo má podobné
jméno, datum narození nebo adresu, může být označen za dlužníka, podezřelého nebo sankcionovanou osobu,
aniž by o tom věděl. Taková újma má epistemickou povahu: člověk musí dokazovat, že není někým jiným,
a jeho tvrzení stojí proti autoritě záznamu. Fricker (2007) popsala jako
[testimoniální nespravedlnost](@/glossary/testimonialni-nespravedlnost.md) situaci, kdy je výpovědi
přisouzena menší váha z důvodů nesouvisejících s pravdivostí; v případě chybného sloučení se
výpověď člověka o vlastní identitě střetává s předpokladem, že „systém se nemýlí“.

Druhá stránka je odvrácená: sjednocování osobních údajů napříč zdroji je zároveň mechanismem
[doxingu](@/glossary/doxing.md). Douglas (2016) rozlišil doxing deanonymizační, cílící a delegitimizační
a ukázal, že škoda vzniká právě spojením údajů, které byly jednotlivě dostupné. Kniha tento vzorec
popisuje v technice [EA-2.3.8 Epistemický doxxing](@/kompendium/techniques/ea-2-3-8-doxxing-epistemicky.md).

## Kde se pojem v knize vyskytuje

Vážení zdrojů při prověrkách a sestavování matice rozporů popisuje stránka
[DD Engine a EA](@/kompendium/aiad-integration/dd-engine-ea-source-weighting.md); porovnávání údajů
českých veřejných rejstříků s dalšími zdroji stránka [Czech ARES a EA](@/kompendium/aiad-integration/czech-ares-ea-screening.md)
a kapitola [ARES Validation pod EA Lens](@/kompendium/cross-domain/2-ea-osint-czech-ares-validation.md).
Riziko chybné shody jmen při sankčních prověrkách rozebírá kapitola
[Sankční seznamy a atribuční bias](@/kompendium/cross-domain/4-ea-osint-sanctions-list-bias.md) a skrývání
skutečných vlastníků za řetězci entit kapitola [UBO Disinformation Patterns](@/kompendium/cross-domain/13-ea-dd-beneficial-ownership-disinformation.md).

Právní stránku – kdy chybné přiřazení údajů zakládá pomluvu a jak se bránit – rozvádí kapitola
[Pomluva v EA kontextu](@/kompendium/forensic-legal/14-defamation-EA.md); ochranu osobního příběhu
v rámci ochrany údajů kapitola [GDPR & Personal Narrative Rights](@/kompendium/cross-domain/27-ea-compliance-gdpr-narrative-protection.md).

## Od pojmu k praxi

### Rozpoznání

Chybné sloučení se pozná podle nesrovnalostí, které systém neumí vysvětlit: osoba je v jednom záznamu
o dvacet let starší, žije současně ve dvou městech nebo má profesní historii, která se nedá sladit.
V lidském úsudku se obdobná chyba projevuje jako ochota přijmout shodu na základě jediného nápadného
rysu. Wells a Olson (2003) v přehledu výzkumu svědeckých výpovědí ukázali, že chybná identifikace
osoby patří k nejzávažnějším zdrojům justičních omylů a že jistota svědka sama o sobě není spolehlivým
ukazatelem správnosti. Pozorovatel si klade otázku: Na kolika nezávislých rysech shoda stojí, a
existuje rys, který by ji vylučoval?

### Obrana

Obranou je pravidlo, které formulovali už Fellegi a Sunter (1969): nejisté případy nepatří ani mezi
shody, ani mezi neshody, ale k lidské revizi. Každé sloučení má mít zaznamenaný původ – z jakých
záznamů vzniklo a na základě jakých rysů – a musí být možné ho zrušit. U osobních údajů platí zásady
minimalizace a účelového omezení, jak je stanoví nařízení (EU) 2016/679 (GDPR): sjednocovat jen to,
co daný účel vyžaduje. Pro jednotlivce je obranou právo dozvědět se, jaké údaje o něm správce vede,
a požadovat jejich opravu.

### Náprava

Když chybné sloučení poškodí člověka, nestačí opravit jeden záznam; chyba se mezitím mohla rozšířit
do dalších systémů a zpráv. Náprava proto zahrnuje dohledání, kam se chybný údaj dostal, a aktivní
oznámení opravy. Kniha k tomu odkazuje na kapitoly [Třetiosobní potvrzení](@/kompendium/forensic-legal/37-third-party-corroboration.md)
a [Uchování důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md). U zasaženého člověka může
zkušenost, že musí dokazovat vlastní identitu proti systému, vyvolat pocit bezmoci; podpora se pak
zaměřuje na obnovu jistoty, že jeho výpověď o sobě samém má váhu.

### Rámec pro profesionály

Pro analytiky prověrek z toho plyne povinnost vyznačovat u každého závěru o osobě míru jistoty
sjednocení a rysy, na nichž stojí. Pro právníky a soudce je podstatné, že výpis z databáze, který
osobu „identifikuje“, je výsledkem algoritmického rozhodnutí s nenulovou chybovostí, a jeho spolehlivost
lze zpochybnit otázkou po pravidlech shody. Pro novináře platí zásada, že shoda jména není identifikace.

## Odlišení od příbuzných pojmů

Sjednocování entit je třeba odlišit od [fúze zpravodajství](@/glossary/intelligence-fusion.md): fúze
slučuje informace o již určené entitě, sjednocování teprve určuje, zda jde o tutéž entitu. Od
[sankční prověrky](@/glossary/sanctions-screening.md) se liší tím, že prověrka je jedním z jeho použití
– porovnává subjekt se seznamem –, kdežto sjednocování je obecný problém. Od doxingu se liší účelem,
souhlasem a právním základem, nikoli technikou; proto kniha trvá na pravidlech, ne na technických
omezeních.

## Časté omyly

Prvním omylem je představa, že víc dat znamená spolehlivější sjednocení; víc zdrojů přináší i víc
chybných shod. Druhým omylem je považovat výstup s vysokou mírou shody za jistotu. Třetím omylem je
domněnka, že chybné sloučení je jen technickou vadou; pro člověka, kterého se týká, je to újma s
právními a sociálními důsledky.

## Příklad (anonymizovaný kompozit)

Muž středního věku je při žádosti o úvěr odmítnut a dozví se, že je veden jako dlužník s exekucí.
Exekuce se týká jiného muže se stejným jménem a rokem narození z jiného kraje. Banka zprvu trvá na
tom, že „systém ho identifikoval“. Teprve po předložení dokladů a žádosti o informaci, z jakých údajů
shoda vzešla, se ukáže, že systém porovnával jen jméno a rok narození. Záznam je opraven a banka
upraví pravidla tak, aby shoda vyžadovala další nezávislý rys a v nejistých případech lidskou revizi.

## Meze a otevřené otázky

Otevřená zůstává otázka, jak nastavit prahy sjednocování u zranitelných skupin, kde jsou jména a
údaje méně rozmanité nebo nepřesně přepisované z jiných písem, a chybná sloučení proto častější.
Druhou otázkou je, jak zajistit, aby oprava chybného sloučení dorazila do všech systémů, které
údaj převzaly. Christen (2012) upozorňuje, že kvalitu sjednocování lze měřit jen tam, kde je k dispozici
ověřený vzorek, a ten v praxi často chybí.

## Literatura

- Christen, P. (2012). *Data Matching: Concepts and Techniques for Record Linkage, Entity Resolution, and Duplicate Detection*. Springer.
- Douglas, D. M. (2016). Doxing: A conceptual analysis. *Ethics and Information Technology*, 18(3), 199–210.
- Fellegi, I. P., & Sunter, A. B. (1969). A theory for record linkage. *Journal of the American Statistical Association*, 64(328), 1183–1210.
- Fricker, M. (2007). *Epistemic Injustice: Power and the Ethics of Knowing*. Oxford University Press.
- Newcombe, H. B., Kennedy, J. M., Axford, S. J., & James, A. P. (1959). Automatic linkage of vital records. *Science*, 130(3381), 954–959.
- Wells, G. L., & Olson, E. A. (2003). Eyewitness testimony. *Annual Review of Psychology*, 54, 277–295.

## Související

**Glosář**

- [Entity Resolution](@/glossary/entity-resolution.md) – technické heslo, které most propojuje.
- [Doxing](@/glossary/doxing.md) – zneužití spojování údajů proti osobě.
- [Due Diligence](@/glossary/due-diligence.md) – prověrky, v nichž se sjednocování používá.
- [Sanctions screening](@/glossary/sanctions-screening.md) – porovnání subjektu se seznamem.

**Kniha**

- [EA-2.3.8 Epistemický doxxing](@/kompendium/techniques/ea-2-3-8-doxxing-epistemicky.md) – agregace údajů jako technika.
- [Pomluva v EA kontextu](@/kompendium/forensic-legal/14-defamation-EA.md) – právní obrana při chybném přiřazení.
- [DD Engine a EA](@/kompendium/aiad-integration/dd-engine-ea-source-weighting.md) – vážení zdrojů v prověrkách.
- [Sankční seznamy a atribuční bias](@/kompendium/cross-domain/4-ea-osint-sanctions-list-bias.md) – chybné shody jmen.

**Sesterské mosty**

- [Bridge: Sanctions screening](@/kompendium/glossary-bridges/bridge-sanctions-screening.md) – prověrka proti seznamům.
- [Bridge: Intelligence fusion](@/kompendium/glossary-bridges/bridge-intelligence-fusion.md) – slučování informací.
- [Bridge: OSINT](@/kompendium/glossary-bridges/bridge-osint.md) – otevřené zdroje.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Entity Resolution (sjednocování entit)](@/glossary/entity-resolution.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
