+++
title = "Bezpečnost: obrana organizace proti dezinformacím"
description = "Jak se organizace připravuje na dezinformační kampaň: monitoring, prebunking, rychlá a věcná oprava, spolupráce s platformami a péče o lidi, na které kampaň míří."
weight = 190

[taxonomies]
tags = ["kompendium", "cross-domain", "security"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["5-ea-osint-social-media-manipulation", "22-ea-security-incident-response-narrative", "7-ea-osint-narrative-injection", "14-ea-dd-narrative-warfare"]
parent = "kompendium-cross-domain"
toc = true
+++

Dezinformace už nejsou jen problémem států a voleb. Terčem kampaní bývají firmy (fámy
o škodlivosti výrobků, o finanční situaci), nemocnice a úřady (falešné zprávy o nebezpečí),
univerzity a výzkumníci, neziskové organizace i jednotliví zaměstnanci. Pro organizaci je
dezinformační kampaň bezpečnostním incidentem: ohrožuje provoz, pověst, důvěru klientů
a bezpečí lidí. Tato stránka popisuje obranu proti dezinformacím jako součást bezpečnostního
řízení a propojuje ji s tím, co kniha říká o působení manipulace na lidi.

## Doména a problém

Wardleová a Derakhshanová (2017) rozlišují misinformace, dezinformace a malinformace
a upozorňují, že pro obranu je klíčové rozumět celému cyklu: kdo obsah vytvořil, jak byl
vyroben, jak se šíří a jak ho příjemci přijímají a dál sdílejí. Paul a Matthews (2016)
popsali model „hadice nepravd“ (*firehose of falsehood*), který nespoléhá na přesvědčivost
jednotlivých tvrzení, ale na objem, rychlost, opakování a nedbání na konzistenci; obrana
založená na vyvracení jednotlivých tvrzení proti němu nestačí.

Lewandowsky a kolegové (2012) shrnuli výzkum o tom, proč je oprava dezinformace obtížná:
přijatá informace ovlivňuje úsudek i po opravě, opakování mýtu v opravě ho může posílit
a oprava je účinnější, pokud nabídne alternativní vysvětlení. Na tento výzkum navazuje
inokulační přístup: Roozenbeek a van der Linden (2019) ukázali, že krátká zkušenost
s oslabenými manipulativními technikami zvyšuje schopnost lidí je rozpoznat (prebunking).

Na úrovni EU existuje institucionální rámec: Evropská služba pro vnější činnost zřídila
v roce 2015 pracovní skupinu East StratCom, Kodex zásad boje proti dezinformacím byl přijat
v roce 2018 a posílen v roce 2022, a nařízení (EU) 2022/2065 (DSA) ukládá velkým platformám
posuzovat systémová rizika.

## Průnik s epistemickou anihilací

Kniha popisuje, jak se u jednotlivce postupně rozpadá schopnost odlišit pravdivé od
nepravdivého a jak se ztrácí důvěra v jakékoli zdroje. Dezinformační kampaně cílí na
stejný výsledek u celých populací: nikoli nutně na to, aby lidé uvěřili konkrétní lži,
ale aby přestali věřit čemukoli. To je kolektivní podoba [epistemické bezdomovosti](@/glossary/epistemicka-bezdomovost.md)
a [metanarativního kolapsu](@/glossary/metanarrative-collapse.md). Organizace, která
odpovídá na kampaň, proto nebrání jen vlastní pověst, ale i schopnost svých klientů
a zaměstnanců orientovat se.

Druhým průnikem jsou lidé uvnitř organizace. Zaměstnanci, na které kampaň míří jménem
(mluvčí, vedoucí výzkumu, lékaři), prožívají zkušenost blízkou [mediálnímu mobu](@/kompendium/case-studies/04-medialni-mob-attack.md):
masová obvinění, výhrůžky, pocit, že „všichni“ jsou proti nim. Kampaň tak může
destabilizovat organizaci přes jednotlivce, i když organizace jako celek obstojí.

Třetím průnikem je vnitřní soudržnost organizace. Kampaně často cílí na štěpení: šíří
tvrzení, že vedení něco tají před zaměstnanci, nebo že jedno oddělení obětovalo jiné.
Pokud zaměstnanci dostávají informace o kampani hlavně z médií a sociálních sítí, a ne od
vlastní organizace, ztrácejí důvěru v ni dřív než veřejnost. Vnitřní komunikace je proto
součástí obrany stejně jako vnější.

## Rozpoznávací znaky

Na začínající dezinformační kampaň proti organizaci ukazuje **náhlý nárůst zmínek**
s podobnými formulacemi, **původ v okrajových zdrojích** a rychlý přechod na hlavní
platformy, **vazba na událost** (incident, rozhodnutí, výročí), **emocionální rámování**
(strach, vztek, morální pohoršení), **zapojení skutečných lidí**, kteří obsah sdílejí
v dobré víře, a **útoky na konkrétní osoby** v organizaci. Kniha tyto znaky popisuje
v signaturách [injekce narativu](@/kompendium/detection-signatures/22-network-narrative-injection.md)
a [asymetrie amplifikace](@/kompendium/detection-signatures/19-network-amplification-asymmetry.md).

## Rámec: právo, standardy a odpovědnost

Pro subjekty v rozsahu NIS2 může dezinformační kampaň souviset s kybernetickým incidentem
(např. při útoku typu „hack and leak“) a podléhat povinnosti hlášení. DSA dává uživatelům
a organizacím nástroje k oznámení nezákonného obsahu platformám. Pomluvy a nepravdivé
údaje o organizaci lze řešit civilněprávně, ve vážných případech trestněprávně (viz
[Pomluva v EA kontextu](@/kompendium/forensic-legal/14-defamation-EA.md)). Právní kroky
jsou ale pomalé a mohou kampani dodat pozornost; obvykle nejsou první volbou.

## Ochranná opatření

Obrana má tři časové vrstvy. **Před kampaní**: mapa pravděpodobných témat útoků (citlivé
oblasti činnosti organizace), připravené ověřené informace a kanály, prebunking pro
zaměstnance a klíčové publikum (vysvětlit předem, jak by kampaň mohla vypadat), vztahy
s novináři a platformami. **Během kampaně**: monitoring a rychlé vyhodnocení, věcná oprava
s alternativním vysvětlením a bez opakování mýtu v titulku, jeden hlas organizace,
ochrana zaměstnanců, na které kampaň míří, a dokumentace pro platformy a případné právní
kroky. **Po kampani**: vyhodnocení, co fungovalo, a úprava připravenosti (viz
[Učení po incidentu](@/kompendium/organizational-defense/40-post-incident-learning.md)).

Organizace by se měla vyhnout dvěma chybám: mlčení, které nechá prostor kampani, a agresivní
odpovědi, která kampaň zesílí a vyvolá dojem, že organizace má co skrývat. Věcná, rychlá
a opakovaná komunikace ověřených informací je obvykle účinnější než vyvracení každého tvrzení
(Lewandowsky a kol. 2012). Organizační postupy popisuje [PR obrana narativu](@/kompendium/organizational-defense/34-PR-narrative-defense.md).

## Lidský rozměr a zotavení

Zaměstnanci, na které kampaň míří, potřebují konkrétní ochranu: omezení zveřejňování
osobních údajů, pomoc s hlášením obtěžování, právní podporu a psychologickou pomoc (viz
[Asistence zaměstnancům v krizi](@/kompendium/organizational-defense/35-employee-assistance-EA.md)).
Důležité je i veřejné zastání organizace – člověk, za nímž instituce nestojí, prožívá
kampaň jako osobní selhání. Klienti a veřejnost, kteří dezinformaci uvěřili, nemají být
zesměšňováni; zesměšnění posiluje příslušnost k narativu a ztěžuje návrat.

## Přesah do dalších oborů

Ve zdravotnictví se obrana proti dezinformacím stala součástí veřejného zdraví; Světová
zdravotnická organizace mluví o „infodemii“ jako o nadbytku informací včetně nepravdivých
během zdravotních krizí. Ve vzdělávání jde o mediální gramotnost a prebunking ve školách
(viz [Mediální gramotnost](@/kompendium/prevention-resilience/6-media-literacy-prevention.md)).
Ve vědě o ochranu výzkumníků, kteří se stali terčem kampaní. V justici o ochranu soudců
a svědků před mediálními útoky. Ve všech oborech platí, že obrana je účinnější, když
začne před kampaní – inokulace funguje lépe než léčba (Roozenbeek a van der Linden 2019).

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Po technické poruše ve vodárenské společnosti se
na sociálních sítích šíří tvrzení, že voda je kontaminovaná a firma to tají. Během hodin
se tvrzení objeví ve stovkách příspěvků a lidé vykupují balenou vodu. Firma má připravený
postup: do hodiny zveřejní výsledky aktuálních rozborů, vysvětlí, co se při poruše stalo
a proč nemá vliv na kvalitu vody, a nabídne průběžné aktualizace. Hygienická stanice
výsledky nezávisle potvrdí. Firma nezveřejňuje vyvracení s opakováním tvrzení v titulku,
ale zprávu „Voda je pitná – výsledky rozborů“. Mluvčí, na kterou se zaměřily útoky,
dostane podporu a firma veřejně odsoudí výhrůžky.

Po týdnu firma vyhodnotí, že nejrychleji se situace uklidnila tam, kde lidé dostali
informaci od místních autorit, kterým důvěřují, a připraví s obcemi společný komunikační
plán pro další krize.

## Meze a otevřené otázky

Obrana proti dezinformacím může sklouznout k cenzuře nebo k označování legitimní kritiky
za dezinformaci. Otevřenou otázkou je, jak organizace odliší kampaň od oprávněné nespokojenosti
a jak budovat důvěru, která je nejlepší ochranou, v prostředí, kde důvěra v instituce
dlouhodobě klesá.

## Literatura

- Lewandowsky, S., Ecker, U. K. H., Seifert, C. M., Schwarz, N., Cook, J. (2012). Misinformation and its correction.
- Paul, C., Matthews, M. (2016). *The Russian „Firehose of Falsehood“ [Propaganda](@/glossary/propaganda.md) Model.*
- Roozenbeek, J., van der Linden, S. (2019). Fake news game confers psychological resistance against online misinformation.
- Wardle, C., Derakhshan, H. (2017). *Information Disorder.*
- Nařízení (EU) 2022/2065 (DSA).

## Související

**Mezioborové mosty**

- [Manipulace na sociálních sítích](@/kompendium/cross-domain/5-ea-osint-social-media-manipulation.md) – analýza kampaní.
- [Narativ při reakci na incident](@/kompendium/cross-domain/22-ea-security-incident-response-narrative.md) – komunikace během incidentu.
- [Narativní válka v due diligence](@/kompendium/cross-domain/14-ea-dd-narrative-warfare.md) – reputační spory.

**Organizace a prevence**

- [PR obrana narativu](@/kompendium/organizational-defense/34-PR-narrative-defense.md) – komunikační postupy.
- [Mediální gramotnost](@/kompendium/prevention-resilience/6-media-literacy-prevention.md) – prevence.

**Teorie a pojmy**

- [Wardle: Typologie dezinformačního ekosystému](@/kompendium/07-teoreticke-reflexe/wardle-disinformation-typology.md) – pojmový rámec.
- [Firehose of falsehood](@/glossary/firehose-of-falsehood.md) – strategie objemu.
- [Epistemic security](@/glossary/epistemic-security.md) – bezpečnost poznání jako cíl.
