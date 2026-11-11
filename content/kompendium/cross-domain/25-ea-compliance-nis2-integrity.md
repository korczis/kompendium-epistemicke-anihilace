+++
title = "Compliance: NIS2 a integrita rozhodování"
description = "Směrnice NIS2 jako rámec, v němž se kybernetická bezpečnost stává otázkou řízení: odpovědnost vedení, řízení rizik, hlášení incidentů a riziko compliance na oko."
weight = 250

[taxonomies]
tags = ["kompendium", "cross-domain", "compliance"]
categories = ["academic"]

[extra]
related_terms = ["26-ea-compliance-zkb-epistemic-integrity", "21-ea-security-supply-chain-narrative", "22-ea-security-incident-response-narrative", "30-ea-compliance-regulatory-capture-detection"]
toc = true
+++

Směrnice Evropského parlamentu a Rady (EU) 2022/2555 o opatřeních k zajištění vysoké
společné úrovně kybernetické bezpečnosti v Unii (NIS2) rozšířila okruh organizací, na něž
dopadají povinnosti v kybernetické bezpečnosti, a výslovně přenesla odpovědnost na jejich
vedení. Tím se kybernetická bezpečnost stala otázkou řízení organizace, a tedy i otázkou
toho, jak vedení ví, co se v organizaci děje. Tato stránka se dívá na NIS2 z pohledu,
který kniha uplatňuje na poznání: co musí vedení vědět, z jakých zdrojů, a jak se brání
tomu, aby jeho obraz o bezpečnosti byl iluzí.

## Doména a problém

NIS2 rozlišuje **základní** a **důležité** subjekty v řadě odvětví (energetika, doprava,
bankovnictví, zdravotnictví, digitální infrastruktura, veřejná správa a další). Ukládá jim
přijmout přiměřená technická, provozní a organizační **opatření k řízení rizik** (čl. 21),
mezi něž patří analýza rizik, řešení incidentů, kontinuita provozu, bezpečnost dodavatelského
řetězce, zabezpečení vývoje a údržby, hodnocení účinnosti opatření, kybernetická hygiena
a školení, kryptografie, bezpečnost lidských zdrojů a řízení přístupu. Řídicí orgány musí
tato opatření **schvalovat a dohlížet na jejich provádění** a mohou za porušení nést
odpovědnost; jejich členové se mají pravidelně vzdělávat (čl. 20). Významné incidenty
se hlásí v lhůtách 24 hodin, 72 hodin a jednoho měsíce (čl. 23).

Směrnice vyžaduje transpozici do národního práva; v Česku ji provedl nový zákon
o kybernetické bezpečnosti, který nahradil zákon č. 181/2014 Sb. (k národnímu rámci viz
[Český zákon o kybernetické bezpečnosti](@/kompendium/cross-domain/26-ea-compliance-zkb-epistemic-integrity.md)).

Klíčovým problémem není text povinností, ale **informační asymetrie mezi vedením a technickou
realitou**. Vedení schvaluje opatření, o jejichž účinnosti se dozvídá z reportů, které
připravují lidé, kteří je provádějí. Pokud reporty ukazují zelená čísla a neříkají, co se
neměří, vedení nese odpovědnost za obraz, který nemusí odpovídat skutečnosti.

## Průnik s epistemickou anihilací

Kniha popisuje, jak se u jednotlivce může vytvořit stav, kdy jeho obraz reality řídí někdo
jiný a kdy vnější signály nedokážou tento obraz opravit. V organizacích má obdobu v jevu,
který lze nazvat **compliance na oko** (srov. [Scam Compliance](@/glossary/scam-compliance.md)):
dokumentace, politiky a kontrolní seznamy jsou v pořádku, ale skutečná bezpečnost je slabá.
Power (1997) popsal „společnost auditů“, v níž se kontrola přesouvá od podstaty k
ověřitelným formálním znakům – a v níž organizace mohou úspěšně projít auditem, aniž
by se zlepšily.

Druhým průnikem je [epistemická slepota](@/glossary/epistemicka-slepota.md) vedení vůči
nepříjemným zprávám. Pokud se špatné zprávy trestají, přestanou přicházet. Westrum (2004)
v typologii organizačních kultur rozlišil kultury patologické (informace jsou skrývány,
poslové trestáni), byrokratické (informace jsou přehlíženy) a generativní (informace jsou
aktivně hledány, poslové oceňováni); jen generativní kultura umožňuje vedení vědět, co
skutečně potřebuje.

Třetím průnikem je **delegování porozumění**. Členové řídicích orgánů často nemají technické
vzdělání a spoléhají na výklad bezpečnostního manažera, dodavatele nebo auditora. To je
nevyhnutelné, ale nese riziko, které kniha popisuje jako [hermeneutický outsourcing](@/glossary/hermeneuticky-outsourcing.md):
vedení nepřebírá jen informace, ale i jejich výklad, a ztrácí schopnost položit otázku,
která by výklad zpochybnila. NIS2 na to odpovídá povinností vzdělávání členů řídicích
orgánů (čl. 20 odst. 2); smyslem není udělat z nich odborníky, ale umožnit jim rozpoznat,
kdy odpověď nedává smysl nebo kdy chybí informace, na kterou by se měli zeptat.

## Rozpoznávací znaky

Na to, že vedení nemá věrný obraz o bezpečnosti, ukazují **reporty bez negativních nálezů**
po dlouhou dobu, **metriky zaměřené na aktivity** (počet školení, počet politik) místo
výsledků (doba odhalení incidentu, podíl zranitelností opravených včas), **nesoulad mezi
auditem a incidenty**, **absence přímého kontaktu** vedení s technickými týmy, **nejasná
odpovědnost** za konkrétní rizika a **nehlášené téměř-incidenty**. Kniha k tomu nabízí
organizační pohled [Sledovatelnost rozhodnutí](@/kompendium/organizational-defense/21-decision-traceability.md).

## Rámec: právo, standardy a odpovědnost

Vedle NIS2 a národního zákona jsou relevantní normy ISO/IEC 27001 (systém řízení bezpečnosti
informací) a pro finanční sektor nařízení (EU) 2022/2554 o digitální provozní odolnosti
(DORA). NIS2 umožňuje dozorovým orgánům ukládat správní pokuty a u základních subjektů
i dočasně zakázat výkon řídicích funkcí osobám odpovědným za porušení. Odpovědnost vedení
je tedy osobní, a proto je v zájmu vedení mít o bezpečnosti pravdivé informace.

## Ochranná opatření

Prvním opatřením je **report, který říká i to, co se neví** – oblasti bez měření, známé
slabiny, akceptovaná rizika s datem přezkumu. Druhým je **nezávislé ověřování** – interní
audit, externí test, [red team](@/glossary/red-team.md) – s přímou cestou k vedení (viz [Auditní výbor proti EA](@/kompendium/organizational-defense/5-audit-committee-EA.md)).
Třetím jsou **výsledkové metriky** místo aktivitních. Čtvrtým je **vzdělávání vedení**
v míře, která umožní klást dobré otázky. Pátým je **kultura, která oceňuje špatné zprávy**
a **bezpečný kanál** pro ty, kdo vidí problém (viz [Mechanismus oznamovatelů](@/kompendium/organizational-defense/4-whistleblower-mechanism.md)).
Šestým je **cvičení** – simulace incidentu s účastí vedení ukáže, zda postupy fungují
a zda vedení ví, co dělat.

## Lidský rozměr a zotavení

Bezpečnostní pracovníci, kteří dlouhodobě upozorňují na rizika a nejsou slyšeni, popisují
frustraci a cynismus; když pak incident nastane, často jsou to oni, na koho se ukazuje.
Vedení, které nese osobní odpovědnost, může prožívat úzkost a tlak na „zelená čísla“.
Zdravá organizace dává oběma stranám společný jazyk: vedení se ptá, technici odpovídají
pravdivě, a nejistota je legitimní odpověď. Kniha tuto rovnováhu rozvádí v
[Odolnosti představenstva](@/kompendium/organizational-defense/1-board-resilience.md).

## Přesah do dalších oborů

Problém, kdy vedení odpovídá za oblast, o níž se dozvídá zprostředkovaně, je společný
mnoha oborům. Ve zdravotnictví jde o bezpečnost pacientů, kde se ukázalo, že systémy
hlášení nežádoucích událostí fungují jen v kultuře, která netrestá hlášení; v letectví
o kulturu hlášení incidentů, kterou Reason (1997) popsal jako základ „kultury bezpečnosti“;
ve školství o ochranu dětí, kde vedení škol odpovídá za postupy, o jejichž dodržování
často neví. Westrumova (2004) typologie a Reasonův (1997) důraz na kulturu hlášení jsou
přenositelné do každého oboru, kde se odpovědnost a informace rozcházejí.

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Regionální distributor energie spadá pod NIS2. Čtvrtletní
reporty pro představenstvo ukazují splnění všech opatření. Nový člen představenstva se zeptá,
kolik kritických zranitelností je otevřeno déle než měsíc; odpověď nikdo nezná, protože
se to neměří. Analýza ukáže desítky takových zranitelností v provozních systémech, které
nebylo možné aktualizovat bez odstávky. Představenstvo schválí plán odstávek, nechá si
reportovat stav zranitelností a jejich stáří a vyhlásí, že hlášení problému není
selháním, ale splněním povinnosti. Bezpečnostní tým poprvé po letech předloží report
s červenými položkami – a představenstvo za něj poděkuje. O rok později je stav horší
čísly než dřív, ale lepší skutečností: rizika jsou známá, mají vlastníky a termíny.

## Meze a otevřené otázky

Regulace může zvýšit pozornost vedení, ale také podpořit compliance na oko, pokud dozor
hodnotí hlavně dokumentaci. Otevřenou otázkou je, jak dozorové orgány a auditoři mohou
ověřovat skutečnou bezpečnost a ne jen formální soulad, a jak měřit kulturu, která
umožňuje vedení vědět, co se děje.

## Literatura

- Power, M. (1997). *The Audit Society: Rituals of Verification.*
- Reason, J. (1997). *Managing the Risks of Organizational Accidents.*
- Westrum, R. (2004). A typology of organisational cultures.
- Směrnice (EU) 2022/2555 (NIS2), čl. 20, 21 a 23; nařízení (EU) 2022/2554 (DORA).

## Související

**Mezioborové mosty**

- [Český zákon o kybernetické bezpečnosti](@/kompendium/cross-domain/26-ea-compliance-zkb-epistemic-integrity.md) – národní rámec.
- [Dodavatelský řetězec](@/kompendium/cross-domain/21-ea-security-supply-chain-narrative.md) – povinnost řídit rizika dodavatelů.
- [Narativ při reakci na incident](@/kompendium/cross-domain/22-ea-security-incident-response-narrative.md) – hlášení a komunikace.
- [Regulatorní zajetí](@/kompendium/cross-domain/30-ea-compliance-regulatory-capture-detection.md) – meze dozoru.

**Organizace**

- [Odolnost představenstva](@/kompendium/organizational-defense/1-board-resilience.md) – informovanost vedení.
- [Auditní výbor proti EA](@/kompendium/organizational-defense/5-audit-committee-EA.md) – nezávislé ověřování.

**Pojmy**

- [Scam Compliance](@/glossary/scam-compliance.md) – soulad na oko.
- [Compliance framework](@/glossary/compliance-framework.md) – rámec souladu.
- [Epistemická slepota](@/glossary/epistemicka-slepota.md) – nevidění nepříjemného.
