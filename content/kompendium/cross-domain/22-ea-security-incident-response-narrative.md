+++
title = "Bezpečnost: narativ při reakci na incident"
description = "Komunikace během kybernetického incidentu a po něm: pravdivost v nejistotě, útoky typu hack-and-leak, dvojí vydírání, vnitřní příběh organizace a péče o lidi."
weight = 220

[taxonomies]
tags = ["kompendium", "cross-domain", "security"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["19-ea-security-disinformation-defense", "23-ea-security-attribution-bias", "18-ea-security-spear-phishing", "26-ea-compliance-zkb-epistemic-integrity"]
parent = "kompendium-cross-domain"
toc = true
+++

Kybernetický incident je technická událost i událost výkladová. Od prvních hodin vzniká
příběh – co se stalo, kdo za to může, jak vážné to je – a tento příběh ovlivňuje rozhodnutí
vedení, chování zaměstnanců, reakci klientů, regulátorů i útočníků. Útočníci s tím
počítají: vydírají zveřejněním dat, vypouštějí upravené dokumenty, šíří zprávy o rozsahu
útoku. Kniha popisuje, jak manipulace mění výklad reality u jednotlivce; během incidentu
se o výklad reality vede boj v reálném čase a organizace v něm musí zůstat pravdivá,
i když sama ještě neví, co se stalo.

## Doména a problém

Standardní rámce reakce na incidenty, například doporučení NIST SP 800-61 (Cichonski a kol.
2012), rozdělují proces na přípravu, detekci a analýzu, omezení, odstranění a obnovu
a vyhodnocení; komunikace je součástí každé fáze. Tyto rámce se ale soustředí na technický
průběh. Výkladová rovina – co a kdy říct, komu a jak – bývá ponechána krizové komunikaci,
která pracuje s jinými předpoklady.

Coombs (2007) v teorii situační krizové komunikace ukázal, že reakce veřejnosti na krizi
závisí na tom, jakou odpovědnost organizaci přisuzuje, a že organizace, která je vnímána
jako oběť (např. útoku), má jiné možnosti než organizace vnímaná jako viník. Útočníci i další
aktéři se proto snaží výklad posunout: z oběti udělat viníka („zanedbali zabezpečení“)
nebo z incidentu udělat skandál („tajili to“).

Zvláštní kategorií jsou operace typu **hack and leak**, v nichž útočník ukradená data
zveřejní, často s cílem ovlivnit veřejnou debatu. Dobře doložené jsou případy úniku
e-mailů Národního výboru Demokratické strany v USA v roce 2016 a úniku dokumentů kampaně
Emmanuela Macrona těsně před druhým kolem prezidentských voleb v roce 2017, kde bylo podle
kampaně mezi pravé dokumenty vmícháno i padělané. U ransomwaru se rozšířilo **dvojí
vydírání**: šifrování dat spojené s hrozbou jejich zveřejnění.

## Průnik s epistemickou anihilací

Během incidentu se uplatňují mechanismy, které kniha popisuje u manipulace jednotlivce.
[Časový tlak](@/kompendium/detection-signatures/14-behavioral-time-pressure-creation.md)
ze strany útočníka (lhůta k zaplacení), [emocionální modulace](@/kompendium/detection-signatures/16-behavioral-emotional-modulation.md)
(strach z odhalení), [asymetrické odhalování](@/kompendium/detection-signatures/15-behavioral-asymmetric-disclosure.md)
(útočník postupně zveřejňuje vzorky dat) a míšení pravdivého s nepravdivým, které ztěžuje
vyvrácení. Organizace se ocitá v situaci podobné oběti [gaslightingu](@/glossary/gaslighting.md):
útočník tvrdí věci o jejích systémech, které ona sama ještě nedokáže ověřit.

Uvnitř organizace vzniká druhý boj o výklad. Zaměstnanci se ptají, kdo za incident může;
pokud vedení mlčí, vznikají fámy a hledání viníků. Incident tak může poškodit důvěru
uvnitř organizace víc než samotná technická škoda – zvlášť pokud je jeho příčinou chyba
konkrétního člověka (viz [cílený phishing](@/kompendium/cross-domain/18-ea-security-spear-phishing.md)).

## Rozpoznávací znaky

Na to, že incident má výkladovou složku, kterou je třeba aktivně řídit, ukazuje **komunikace
útočníka** směrem k médiím nebo klientům, **zveřejňování vzorků dat**, **objevení dokumentů,
jejichž pravost je nejasná**, **rychlé šíření tvrzení o rozsahu** útoku, která organizace
nezveřejnila, **vnitřní fámy** a **politizace** incidentu. Varovným znakem na straně
organizace je **pokušení minimalizovat** („nic se nestalo“), které se později obrátí proti ní,
nebo naopak **spekulace o útočníkovi** dřív, než jsou k dispozici důkazy (viz
[zkreslení při atribuci](@/kompendium/cross-domain/23-ea-security-attribution-bias.md)).

## Rámec: právo, standardy a odpovědnost

NIS2 (směrnice (EU) 2022/2555, čl. 23) ukládá subjektům v rozsahu hlásit významné incidenty:
včasné varování do 24 hodin od zjištění, oznámení incidentu do 72 hodin a závěrečnou zprávu
do jednoho měsíce; v případě potřeby informovat i příjemce služeb. GDPR vyžaduje ohlášení
porušení zabezpečení osobních údajů dozorovému úřadu bez zbytečného odkladu a pokud možno
do 72 hodin (čl. 33) a při vysokém riziku i dotčeným osobám (čl. 34). Lhůty vytvářejí tlak
komunikovat dřív, než je vše známo; proto je klíčové umět říkat pravdu o nejistotě.

## Ochranná opatření

Prvním opatřením je **komunikační plán připravený předem**, s rolemi, schvalovacím postupem
a šablonami, které obsahují i formulace pro nejistotu („zatím víme…, zatím nevíme…, další
informace poskytneme…“). Druhým je **pravdivost bez spekulací**: nepotvrzovat ani
nevyvracet tvrzení útočníka, dokud je nelze ověřit, a nezveřejňovat domněnky o původci.
Třetím je **ověřování pravosti** dokumentů, které se objeví – s vědomím, že útočník může
míchat pravé a padělané. Čtvrtým je **vnitřní komunikace** dřív nebo současně s vnější,
aby se zaměstnanci nedozvídali o incidentu z médií. Pátým je **kultura bez hledání viníka**
při vyhodnocení. Šestým je **koordinace s úřady** (CSIRT, NÚKIB, policie) a s pojišťovnou.
Postupy popisují [Reakce na incident s EA fokusem](@/kompendium/organizational-defense/31-incident-response-EA.md)
a [Komunikační politika](@/kompendium/organizational-defense/23-communication-policy.md).

## Lidský rozměr a zotavení

Incident je pro lidi v organizaci akutní stresovou situací: bezpečnostní tým pracuje
dlouhé hodiny pod tlakem, zaměstnanec, jehož účet byl zneužit, se cítí vinen, klienti
se bojí o svá data. Lidé, jejichž osobní údaje byly zveřejněny, prožívají ztrátu kontroly
nad tím, co o nich ostatní vědí, a mohou čelit obtěžování. Organizace by měla dotčeným
nabídnout konkrétní pomoc (informace, poradenství, ochranu identity) a vlastním lidem
podporu po skončení akutní fáze (viz [Asistence zaměstnancům v krizi](@/kompendium/organizational-defense/35-employee-assistance-EA.md)
a [Trauma-aware management](@/kompendium/organizational-defense/36-trauma-aware-management.md)).

## Přesah do dalších oborů

Komunikace v nejistotě pod tlakem je společná všem krizovým oborům. Ve zdravotnictví při
epidemiích a pochybeních (jak říct pacientům, co se stalo, když se to teprve zjišťuje);
ve školství po závažné události; v justici při únicích ze spisů; v neziskovém sektoru při
odhalení zneužívání uvnitř organizace. Coombsovo (2007) poučení platí obecně: veřejnost
hodnotí nejen událost, ale i to, zda organizace mluví pravdivě a přebírá odpovědnost
přiměřeně své roli. Kniha k tomu nabízí širší rámec [Kolektivní/institucionální intervence](@/kompendium/06-klinicke-aplikace/kolektivni-intervence.md).

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Regionální poskytovatel sociálních služeb zjistí
šifrování serverů a vzkaz útočníků, kteří tvrdí, že stáhli záznamy o klientech, a hrozí
jejich zveřejněním. Do hodiny se na sociálních sítích objeví příspěvek „zaměstnance“, který
tvrdí, že vedení o slabém zabezpečení vědělo a ignorovalo ho. Organizace postupuje podle
plánu: informuje zaměstnance, nahlásí incident, zveřejní stručné sdělení s tím, co ví
a neví, a vyzve klienty, aby nereagovali na zprávy, které by se za ni vydávaly. Tvrzení
o stažení dat nepotvrzuje ani nevyvrací, dokud forenzní analýza neukáže rozsah. Po třech
dnech oznámí, že data části klientů byla skutečně stažena, a kontaktuje je jednotlivě.

Příspěvek „zaměstnance“ se ukáže jako vytvořený z neexistujícího účtu. Organizace ho
veřejně nevyvrací, ale vnitřně vysvětlí, co je pravda, a zaměstnanci sami začnou na sítích
odkazovat na oficiální informace.

## Meze a otevřené otázky

Pravdivá komunikace v nejistotě je v konfliktu s právními a pojistnými zájmy, které tlačí
k mlčení. Otevřenou otázkou je, jak sladit povinnost hlásit s ochranou vyšetřování a jak
chránit dotčené osoby před tím, aby se zveřejněná data stala nástrojem dalšího zneužívání.

## Literatura

- Cichonski, P., Millar, T., Grance, T., Scarfone, K. (2012). *Computer Security Incident Handling Guide* (NIST SP 800-61 Rev. 2).
- Coombs, W. T. (2007). Protecting organization reputations during a crisis: The development and application of situational crisis communication theory.
- Rid, T. (2020). *Active Measures: The Secret History of Disinformation and Political Warfare.*
- Směrnice (EU) 2022/2555 (NIS2), čl. 23; nařízení (EU) 2016/679 (GDPR), čl. 33 a 34.

## Související

**Mezioborové mosty**

- [Obrana proti dezinformacím](@/kompendium/cross-domain/19-ea-security-disinformation-defense.md) – kampaně kolem incidentu.
- [Zkreslení při atribuci](@/kompendium/cross-domain/23-ea-security-attribution-bias.md) – předčasné jmenování útočníka.
- [Český zákon o kybernetické bezpečnosti](@/kompendium/cross-domain/26-ea-compliance-zkb-epistemic-integrity.md) – národní rámec.

**Organizace**

- [Reakce na incident s EA fokusem](@/kompendium/organizational-defense/31-incident-response-EA.md) – postup reakce.
- [Komunikační politika](@/kompendium/organizational-defense/23-communication-policy.md) – pravidla komunikace.
- [Učení po incidentu](@/kompendium/organizational-defense/40-post-incident-learning.md) – vyhodnocení bez hledání viníka.

**Signatury a pojmy**

- [Asymetrické odhalování](@/kompendium/detection-signatures/15-behavioral-asymmetric-disclosure.md) – postupné zveřejňování dat.
- [Gaslighting](@/glossary/gaslighting.md) – tvrzení o vlastní realitě, která nelze ověřit.
