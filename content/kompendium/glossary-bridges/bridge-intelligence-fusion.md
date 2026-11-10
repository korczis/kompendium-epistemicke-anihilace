+++
title = "Bridge: Intelligence fusion (fúze zpravodajství)"
description = "Most mezi heslem fúze zpravodajství a knihou: slučování nezávislých zdrojů, vážení spolehlivosti, práce s rozpory a riziko kruhového potvrzení, kdy jeden zdroj vypadá jako mnoho."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "intelligence-fusion", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["intelligence-fusion", "osint", "entity-resolution", "signal-plurality", "cirkularni-argumentace", "konfirmacni-bias"]
glossary_target = "intelligence-fusion"
toc = false
+++

# Bridge: Intelligence fusion (fúze zpravodajství)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a nápravě. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[Fúze zpravodajství](@/glossary/intelligence-fusion.md) (*intelligence fusion*) je analytická disciplína,
která koreluje informace z více nezávislých zdrojů, přiděluje jim míru jistoty podle spolehlivosti
zdroje a síly potvrzení, řeší rozpory strukturovanou metodikou a vytváří jednotný obraz předmětu. Od
prosté agregace se liší tím, že neskládá vše dohromady, ale váží kvalitu dokladů, posuzuje nezávislost
zdrojů, sleduje původ informací a výslovně zachází s protichůdnými signály. Technickou stránku
problému – slučování dat z více senzorů – systematizovali Hall a Llinas (1997); analytickou stránku,
tedy jak s takto sloučenými informacemi zachází lidský úsudek, rozebral Heuer (1999).

Heslo patří do kontextu platformy, z níž Kompendium vzešlo, a do zpravodajské a bezpečnostní praxe.
Kniha ho zařazuje mezi mosty proto, že princip fúze – potvrzení je silné jen tehdy, když jsou zdroje
skutečně nezávislé – je jádrem obrany proti řadě technik, které vytvářejí zdání konsenzu.

## Fúze očima knihy

Hodnota fúze stojí na **nezávislosti zdrojů**. Dva zdroje, které čerpají z téhož původního tvrzení,
nepřinášejí dvě potvrzení, ale jedno opakované. Zpravodajská praxe pro tento jev používá výraz
kruhové hlášení (*circular reporting*): informace oběhne několik kanálů a vrátí se k analytikovi jako
zdánlivě nezávislé potvrzení. Kniha stejný vzorec popisuje v detekčních signaturách
[Cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md) a
[Monokultura zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md) a v hesle
[kruhová argumentace](@/glossary/cirkularni-argumentace.md).

Druhým principem je **oddělení spolehlivosti zdroje od věrohodnosti informace**. Zpravodajská tradice
hodnotí obojí zvlášť: spolehlivý zdroj může jednou předat mylnou informaci a nespolehlivý zdroj může
říct pravdu. Kent (1964) navíc upozornil, že slovní vyjádření jistoty bývá čteno velmi rozdílně, a
doporučil je sjednotit. Pro knihu je toto oddělení obranou proti technikám, které útočí na mluvčího
místo na obsah, a zároveň proti slepé důvěře k autoritě.

Třetím principem je **práce s rozpory**. Heuer (1999) ukázal, že analytici mají sklon vybrat si
nejpravděpodobnější hypotézu brzy a pak nové informace hodnotit podle ní, a navrhl postup, v němž se
každý doklad posuzuje proti všem konkurenčním hypotézám najednou. Rozpor mezi zdroji je v tomto
pojetí nejcennější informací, ne poruchou, kterou je třeba zahladit. Kniha tento princip uplatňuje
v kapitole [Systemic Confirmation Bias Prevention](@/kompendium/cross-domain/16-ea-dd-confirmation-bias-prevention.md)
a v hesle [konfirmační bias](@/glossary/konfirmacni-bias.md).

Čtvrtým tématem je **záměr zdroje**. Fúze předpokládá, že chyby zdrojů jsou převážně náhodné a že se
při slučování navzájem vyruší. U záměrné dezinformace tento předpoklad neplatí: chyby jsou
systematické, koordinované a mohou být vyrobeny tak, aby vypadaly nezávisle. Wardle a Derakhshan
(2017) proto rozlišují mylnou informaci šířenou bez úmyslu škodit, dezinformaci šířenou s úmyslem
škodit a pravdivou informaci použitou ke škodě; každý druh vyžaduje při fúzi jiné zacházení. Kniha tuto
typologii rozebírá v kapitole [Wardle: Typologie dezinformačního ekosystému](@/kompendium/07-teoreticke-reflexe/wardle-disinformation-typology.md).

## Kde se pojem v knize vyskytuje

Metodiku nezávislého potvrzení v rámci [taxonomie EA](@/glossary/taxonomie-ea.md) rozvádí kapitola
[Cross-Source Triangulation v EA Frameworku](@/kompendium/cross-domain/8-ea-osint-cross-source-triangulation.md);
ověřování zdrojů zpravodajství o hrozbách kapitola [Threat Intel Source Validation](@/kompendium/cross-domain/24-ea-security-threat-intelligence-validation.md)
a stupňování kvality dokladů kapitola [Evidence Quality Tiering](@/kompendium/cross-domain/15-ea-dd-evidence-quality-assessment.md).
Matici rozporů při prověrkách protistran popisuje stránka
[DD Engine a EA](@/kompendium/aiad-integration/dd-engine-ea-source-weighting.md).

Lidskou obdobu fúze najde čtenář v návodech [Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md)
a [Rutina cross-source](@/kompendium/self-defense-guides/36-cross-source-routine.md); forenzní obdobu
v kapitolách [Třetiosobní potvrzení](@/kompendium/forensic-legal/37-third-party-corroboration.md) a
[Pattern důkaz](@/kompendium/forensic-legal/38-pattern-evidence.md), kde se jednotlivé, samy o sobě slabé
doklady skládají do vzorce.

## Od pojmu k praxi

### Rozpoznání

Kniha upozorňuje na tři situace, v nichž fúze selhává. První je **falešný konsenzus**: mnoho hlasů
říká totéž, ale všechny se odvolávají na jeden zdroj nebo jsou koordinované – viz technika
[EA-2.1.9 Vytvoření pseudo-konsenzu](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md).
Druhá je **potlačený rozpor**: nepohodlná informace se odloží jako „odlehlá hodnota“. Třetí je
**zaměnění zdroje a obsahu**: tvrzení se přijme nebo odmítne podle toho, kdo ho řekl. Allport a
Postman (1947) ukázali na šíření fám, že informace se při předávání zjednodušuje, zaostřuje a
přizpůsobuje očekávání posluchače; čím víc převyprávění, tím méně z původní informace zbývá, i když
počet „zdrojů“ roste.

### Obrana

Obranou je u každého důležitého tvrzení dohledat původní zdroj, zjistit, zda jsou potvrzující zdroje
skutečně nezávislé, a posuzovat spolehlivost zdroje odděleně od věrohodnosti informace. Pro
jednotlivce kniha doporučuje jednoduchou otázku: „Odkud to ví ten, od koho to vím?“ Pro instituce
doporučuje, aby zprávy a posudky uváděly u klíčových tvrzení původ a míru jistoty a aby výslovně
zaznamenaly, co závěru odporuje.

### Náprava

Když se ukáže, že rozhodnutí stálo na kruhovém potvrzení, nestačí opravit závěr; je třeba zjistit,
kudy informace obíhala a kam všude se dostala. U lidí, kteří dlouho žili v prostředí, kde „všichni
věděli“, že něco platí, je náprava pomalejší: zjištění, že konsenzus byl vyroben, může otřást důvěrou
v jakoukoli shodu. Kniha k tomu vede v protokolu [Subakutní rekonstrukce důvěry](@/kompendium/recovery-protocols/subacute-trust-rebuilding.md).

### Rámec pro profesionály

Pro vyšetřovatele a soudce má princip fúze přímý význam: výpovědi několika svědků, kteří spolu
o události mluvili, nejsou nezávislé, a jejich shoda proto váží méně, než se zdá. Pro kliniky platí
obdobně, že kolaterální informace od rodiny jsou cenné, ale mohou nést společný výklad, který se
v rodině ustálil – viz [Collateral Interview Protokol](@/kompendium/06-klinicke-aplikace/collateral-interview-protokol.md).

## Odlišení od příbuzných pojmů

Fúzi je třeba odlišit od [sjednocování entit](@/glossary/entity-resolution.md), které určuje, zda
různé záznamy patří téže entitě; fúze slučuje informace o entitě již určené. Od prosté agregace se
liší vážením a prací s rozpory. Od [OSINT](@/glossary/osint.md) se liší tím, že OSINT je druh zdroje,
kdežto fúze je metoda slučování zdrojů libovolného druhu. Od průměrování se liší tím, že rozpor
nerozpouští v průměru, ale vysvětluje.

## Časté omyly

Prvním omylem je přesvědčení, že víc zdrojů znamená víc jistoty; rozhoduje nezávislost, ne počet.
Druhým omylem je domněnka, že fúze má vždy dospět k jednomu závěru; poctivým výsledkem může být
několik hypotéz s vyznačenou jistotou. Třetím omylem je považovat spolehlivý zdroj za záruku pravdivosti
každé jeho informace.

## Příklad (anonymizovaný kompozit)

Obecní zastupitelstvo projednává stížnosti na ředitele školy. Na stole leží patnáct stížností, což
působí jako drtivý doklad. Členka kontrolního výboru stížnosti porovná a zjistí, že dvanáct z nich
používá shodné formulace a odvolává se na jednu událost, o níž stěžovatelé vědí z vyprávění téže
rodiny. Tři zbývající popisují jiné, na sobě nezávislé situace. Výbor neposuzuje počet, ale obsah:
vyžádá si k události doklady a tři nezávislé stížnosti prošetří zvlášť. Výsledkem je přiměřené
opatření, ne odvolání na základě dojmu.

## Meze a otevřené otázky

Otevřená zůstává otázka, jak posoudit nezávislost zdrojů v informačním prostředí, kde téměř všechno
prochází několika málo platformami a agenturami, takže skutečná nezávislost je vzácná. Druhou otázkou
je, jak sdělit výsledek fúze s vyznačenou nejistotou lidem, kteří očekávají jednoznačnou odpověď.
DiFonzo a Bordia (2007) ukazují, že nejistota sama je jednou z podmínek, za nichž se fámy šíří; kdo
nejistotu přizná, musí zároveň nabídnout oporu, jinak ji vyplní někdo jiný.

## Literatura

- Allport, G. W., & Postman, L. (1947). *The Psychology of Rumor*. Henry Holt.
- DiFonzo, N., & Bordia, P. (2007). *Rumor Psychology: Social and Organizational Approaches*. American Psychological Association.
- Hall, D. L., & Llinas, J. (1997). An introduction to multisensor data fusion. *Proceedings of the IEEE*, 85(1), 6–23.
- Heuer, R. J. (1999). *Psychology of Intelligence Analysis*. Center for the Study of Intelligence, CIA.
- Kent, S. (1964). Words of estimative probability. *Studies in Intelligence*, 8(4), 49–65.
- Wardle, C., & Derakhshan, H. (2017). *Information Disorder: Toward an Interdisciplinary Framework for Research and Policy Making*. Council of Europe.

## Související

**Glosář**

- [Intelligence fusion](@/glossary/intelligence-fusion.md) – heslo, které most propojuje.
- [Kruhová argumentace](@/glossary/cirkularni-argumentace.md) – logická obdoba kruhového hlášení.
- [Konfirmační bias](@/glossary/konfirmacni-bias.md) – sklon hodnotit doklady podle předem zvolené hypotézy.
- [Signal Plurality](@/glossary/signal-plurality.md) – zásada nezávislých zdrojů.

**Kniha**

- [Cross-Source Triangulation v EA Frameworku](@/kompendium/cross-domain/8-ea-osint-cross-source-triangulation.md) – metodika potvrzení.
- [Cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md) – jeden zdroj jako mnoho.
- [EA-2.1.9 Vytvoření pseudo-konsenzu](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md) – vyrobená shoda.
- [Pattern důkaz](@/kompendium/forensic-legal/38-pattern-evidence.md) – skládání slabých dokladů do vzorce.

**Sesterské mosty**

- [Bridge: OSINT](@/kompendium/glossary-bridges/bridge-osint.md) – otevřené zdroje.
- [Bridge: Entity Resolution](@/kompendium/glossary-bridges/bridge-entity-resolution.md) – určení entity před fúzí.
- [Bridge: Decision Engine](@/kompendium/glossary-bridges/bridge-decision-engine.md) – slučování signálů do rozhodnutí.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Intelligence fusion (fúze zpravodajství)](@/glossary/intelligence-fusion.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
