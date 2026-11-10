+++
title = "Datová bezpečnost výzkumu"
description = "Ochrana citlivých výzkumných dat o manipulaci a násilí: minimalizace, šifrování, řízení přístupu, bezpečná komunikace s účastníky a plán pro únik dat."
weight = 35

[taxonomies]
tags = ["kompendium", "research-methodology", "ethics"]
categories = ["academic", "methodology", "research"]

[extra]
related_terms = ["anonymization-EA-research", "informed-consent-EA-research", "IRB-protocol-design-EA", "time-series-EA"]
toc = true
+++

Data z výzkumu [epistemické anihilace](@/glossary/epistemicka-anihilace.md) patří
k nejcitlivějším datům, s nimiž sociální vědy pracují: výpovědi o násilí, kontrole a studu,
údaje o zdraví, o náboženském přesvědčení, o třetích osobách, které o výzkumu nevědí.
Jejich únik může účastníka vystavit odvetě, ztrátě vztahů, právním potížím nebo veřejnému
zostuzení. Datová bezpečnost proto není technický detail, ale etická povinnost výzkumníka.

## Vymezení

Datová bezpečnost zahrnuje opatření, která chrání **důvěrnost** (k datům mají přístup jen
oprávnění), **integritu** (data nejsou neoprávněně změněna) a **dostupnost** (data jsou
k dispozici, když je třeba). GDPR vyžaduje u osobních údajů „vhodná technická a organizační
opatření“ a u zvláštních kategorií údajů (zdraví, náboženské a filozofické přesvědčení,
sexuální život) zvýšenou ochranu. U rozsáhlého zpracování zvláštních kategorií se obvykle
provádí posouzení vlivu na ochranu osobních údajů (DPIA). Pro výzkum platí zvláštní režim
podle čl. 89 GDPR a národních předpisů (v ČR zákon č. 110/2019 Sb., o zpracování osobních
údajů).

## Kdy je téma klíčové

Od prvního kontaktu s účastníkem do zničení posledního souboru. Zvlášť u:

- nahrávek, přepisů a osobních dokumentů;
- dat sbíraných přes mobilní aplikace a online formuláře;
- síťových dat a údajů o třetích osobách;
- dlouhodobých studií s kontaktními údaji
  ([longitudinální studie](@/kompendium/research-methodology/longitudinal-study-EA.md));
- spolupráce více pracovišť a předávání dat.

## Postup

1. **Mapa dat** – jaké údaje se sbírají, kde vznikají, kudy putují, kde se ukládají, kdo
   k nim má přístup, kdy se mažou.
2. **Minimalizace** – nesbírat nepotřebné, nesbírat identifikátory tam, kde nejsou nutné,
   oddělit kontaktní údaje od dat ([anonymizace](@/kompendium/research-methodology/anonymization-EA-research.md)).
3. **Šifrování** – zařízení (notebooky, diktafony, telefony) šifrovat celé; data při
   přenosu přenášet šifrovaně; zálohy šifrovat.
4. **Řízení přístupu** – přístup podle role, nejmenší nutná oprávnění, vícefaktorové
   ověření, záznam přístupů. Viz organizační obdobu [Řízení přístupů](@/kompendium/organizational-defense/28-access-control-EA.md).
5. **Bezpečná úložiště** – institucionální úložiště schválená pro citlivá data místo
   osobních cloudových účtů; surová data odděleně od zpracovaných.
6. **Přepisy a externí služby** – přepisovatelé pod smlouvou o mlčenlivosti; automatické
   přepisové služby jen pokud data neopouštějí schválené prostředí.
7. **Plán pro incident** – co dělat při ztrátě zařízení nebo úniku: kdo se informuje
   (pověřenec, dozorový úřad, účastníci), v jakých lhůtách, jak se zmírní škoda.
8. **Bezpečné mazání** podle harmonogramu.

## Specifika výzkumu epistemické manipulace

**Komunikace s účastníkem jako riziko.** E-mail s názvem studie, SMS připomínka, dopis
s logem výzkumného pracoviště nebo položka v kalendáři mohou prozradit účast osobě, která
účastníka kontroluje. Komunikační kanál a podobu zpráv si volí účastník; zprávy jsou neutrální
a neobsahují téma studie. U online dotazníků je vhodné tlačítko rychlého odchodu a žádné
ukládání historie.

**Zařízení účastníka.** Pokud účastník používá aplikaci (např. v [ESM studii](@/kompendium/research-methodology/time-series-EA.md)),
je jeho telefon součástí bezpečnostního obvodu studie. Aplikace má mít neutrální vzhled,
zámek, data na zařízení šifrovaná a pravidelně odesílaná a mazaná.

**Technologické sledování v blízkých vztazích.** Výzkum v oblasti počítačové bezpečnosti
popsal, jak násilní partneři využívají běžné technologie – sdílené účty, aplikace pro
sledování polohy, fyzický přístup k telefonu – ke kontrole druhé osoby (Freed a kol. 2018).
Pro výzkumný tým to znamená, že bezpečnostní model nesmí předpokládat, že zařízení
účastníka je pod jeho výhradní kontrolou. Modelování hrozeb (Shostack 2014) – systematické
pojmenování, kdo může chtít data získat, jakými cestami a s jakou motivací – je vhodné
provést zvlášť pro účastníky, kteří jsou stále v kontaktu s osobou, jež je kontrolovala.

**Cílené útoky.** Skupiny s vysokou kontrolou a jednotlivci s motivací zjistit, kdo o nich
mluví, mohou zkoušet výzkumníky kontaktovat pod záminkou, podat žádost o přístup k údajům,
nebo se pokusit o přístup k datům. Tým by měl mít pravidla pro ověřování totožnosti a pro
odpovědi na žádosti třetích stran a měl by vědět, jak rozpoznat [sociální inženýrství](@/kompendium/cross-domain/17-ea-security-social-engineering.md).

**Žádosti orgánů a soudů.** Výzkumná data mohou být vyžádána v soudním nebo správním řízení.
Ochrana výzkumných dat před takovou žádostí není ve všech zemích stejná. Účastníci by měli
být v souhlasu informováni o hranicích důvěrnosti; tým by měl předem vědět, kdo v instituci
na takové žádosti odpovídá.

**Výzkumník jako slabé místo.** Nejčastější příčiny úniků bývají lidské: ztracený notebook,
odeslání souboru špatnému adresátovi, sdílený odkaz. Školení týmu a jednoduchá pravidla jsou
účinnější než složitá technika, kterou nikdo nepoužívá.

**Integrita dat a manipulace s nimi.** Ve výzkumu, který zkoumá manipulaci, je zvlášť
důležité, aby data nebylo možné nepozorovaně měnit: verzování, záznam změn a oddělení
surových dat od zpracovaných umožní zpětně doložit, že výsledky odpovídají sebraným datům
(srov. [chain of custody](@/glossary/chain-of-custody.md)).

## Kritéria kvality

| Oblast | Co doložit |
|---|---|
| Mapa dat | celý životní cyklus |
| Minimalizace | co se nesbírá a proč |
| Technika | šifrování zařízení, přenosu a záloh, řízení přístupu |
| Komunikace | bezpečné kanály a podoba zpráv |
| Incident | plán reakce, odpovědné osoby |
| Školení | proškolení všech členů týmu |
| Mazání | harmonogram a způsob |

## Vztah k ostatním etickým pojistkám

Datová bezpečnost je technickou stranou slibu, který výzkumník dává v [informovaném souhlasu](@/kompendium/research-methodology/informed-consent-EA-research.md).
Posuzuje ji [etická komise](@/kompendium/research-methodology/IRB-protocol-design-EA.md)
a u větších projektů pověřenec pro ochranu osobních údajů. Anonymizace snižuje škodu
případného úniku, ale nenahrazuje zabezpečení dat před ní.

## Časté chyby

- nahrávky na nešifrovaném telefonu výzkumníka;
- data v osobním cloudovém úložišti;
- sdílení souborů e-mailem;
- kontaktní údaje ve stejném souboru jako odpovědi;
- automatická přepisová služba bez posouzení, kam data odcházejí;
- žádný plán pro ztrátu zařízení;
- e-mail účastníkovi s názvem studie v předmětu.

## Ilustrativní příklad

*Hypotetická situace.* Výzkumnici ukradnou v tramvaji batoh s diktafonem, na němž jsou
nahrávky dvou rozhovorů. Diktafon nebyl šifrovaný. Podle plánu okamžitě informuje vedoucího
projektu a pověřence; ti posoudí riziko (nahrávky obsahují hlas a jména třetích osob) a
rozhodnou o oznámení dozorovému úřadu a o informování obou účastníků. Výzkumnice s nimi
mluví osobně, vysvětlí, co se stalo a jaká je pravděpodobnost zneužití, a nabídne podporu.
Jeden z účastníků je ve vleklém sporu s bývalým partnerem a obává se; tým mu pomůže
s kontaktem na právní poradnu. Projekt poté nahradí diktafony šifrovanými zařízeními
a stanoví, že nahrávky se ze zařízení přenášejí do bezpečného úložiště ještě týž den.

## Využití v praxi

Stejné zásady platí pro poradny, krizová centra a organizace, které shromažďují výpovědi
o manipulaci a násilí: minimalizace, oddělení identifikátorů, šifrování, bezpečná
komunikace s klienty a plán pro incident. Pro organizace popisuje navazující opatření
[Klasifikace informací](@/kompendium/organizational-defense/27-information-classification.md)
a [Reakce na incident s EA fokusem](@/kompendium/organizational-defense/31-incident-response-EA.md).

## Jak posoudit studii z tohoto hlediska

- **Popisuje studie, jak chránila data**, nebo jen uvádí soulad s předpisy?
- **Jak komunikovala s účastníky** v rizikových situacích?
- **Kdo měl přístup k surovým datům?**
- **Kdy a jak budou data zničena?**

## Meze a otevřené otázky

Absolutní bezpečnost neexistuje; cílem je přiměřená ochrana vzhledem k riziku. Otevřenou
otázkou je, jak zajistit bezpečnost u studií vedených mimo instituce (podpůrné organizace,
nezávislí výzkumníci) a jak se vyrovnat s tím, že rostoucí využití cloudových a AI služeb
při zpracování dat přesouvá citlivá data mimo kontrolu výzkumníka.

## Literatura

- Nařízení Evropského parlamentu a Rady (EU) 2016/679 (GDPR), čl. 5, 9, 32, 35 a 89.
- Zákon č. 110/2019 Sb., o zpracování osobních údajů.
- Freed, D., Palmer, J., Minchala, D., Levy, K., Ristenpart, T., Dell, N. (2018). „A Stalker's Paradise“: How intimate partner abusers exploit technology.
- Shostack, A. (2014). *Threat Modeling: Designing for Security.*

## Související

**Etika v této sekci**

- [Anonymizace](@/kompendium/research-methodology/anonymization-EA-research.md) – snížení škody při úniku.
- [Informovaný souhlas](@/kompendium/research-methodology/informed-consent-EA-research.md) – slib důvěrnosti.
- [Časové řady](@/kompendium/research-methodology/time-series-EA.md) – zabezpečení aplikace na zařízení účastníka.

**Organizace a bezpečnost**

- [Řízení přístupů s EA fokusem](@/kompendium/organizational-defense/28-access-control-EA.md) – přístup podle role.
- [Reakce na incident s EA fokusem](@/kompendium/organizational-defense/31-incident-response-EA.md) – postup při úniku.
- [Sociální inženýrství](@/kompendium/cross-domain/17-ea-security-social-engineering.md) – pokusy získat data podvodem.

**Pojmy**

- [Chain of custody](@/glossary/chain-of-custody.md) – doložitelná integrita dat.
- [Doxing](@/glossary/doxing.md) – zveřejnění identity jako škoda.
