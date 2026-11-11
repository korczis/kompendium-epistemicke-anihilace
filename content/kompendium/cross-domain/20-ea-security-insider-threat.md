+++
title = "Bezpečnost: vnitřní hrozba a manipulace zaměstnanců"
description = "Vnitřní hrozba mezi manipulací zvenčí a paranoiou zevnitř: rizikové faktory, znaky, programy prevence, presumpce neviny a ochrana organizace před honem na čarodějnice."
weight = 200

[taxonomies]
tags = ["kompendium", "cross-domain", "security"]
categories = ["academic"]

[extra]
related_terms = ["17-ea-security-social-engineering", "23-ea-security-attribution-bias", "22-ea-security-incident-response-narrative", "9-ea-dd-investigation-bias"]
toc = true
+++

Vnitřní hrozbou se rozumí riziko, že osoba s oprávněným přístupem – zaměstnanec, dodavatel,
bývalý pracovník – poškodí organizaci, ať úmyslně, nedbalostí, nebo proto, že ji někdo
zvenčí zmanipuloval. Je to oblast, v níž se kniha o epistemické manipulaci dotýká
bezpečnosti ze dvou stran. Na jedné straně jsou lidé, které útočník získává, ovlivňuje
nebo vydírá. Na druhé straně je organizace, která v obavě z vnitřní hrozby začne podezírat
vlastní lidi – a sama tak vytváří prostředí nedůvěry, které kniha popisuje jako ničivé.

## Doména a problém

Cappelli, Moore a Trzeciak (2012) v průvodci CERT k vnitřním hrozbám, vycházejícím z analýzy
stovek případů, rozlišují hlavní typy: sabotáž informačních systémů, krádež duševního
vlastnictví a podvod. Typickým znakem případů sabotáže byla předchozí nespokojenost
a konflikt se zaměstnavatelem, typickým znakem krádeže duševního vlastnictví odchod ke
konkurenci. Průvodce zdůrazňuje, že vnitřní incidenty obvykle nevznikají náhle – předcházejí
jim pozorovatelné změny chování a vztahu k organizaci.

Neúmyslné vnitřní incidenty – chyby, nedbalost, oběť sociálního inženýrství – jsou
mnohem častější než úmyslné. Hranice je přitom neostrá: zaměstnanec, kterého útočník
postupně získává, může zpočátku jednat v dobré víře a teprve později pochopit, do čeho
se zapletl.

Historie zpravodajských služeb ukazuje i opačné riziko. Hon na údajného sovětského agenta
uvnitř CIA, který v 60. a 70. letech vedl šéf kontrarozvědky James Jesus Angleton, je
dobře doloženým příkladem toho, jak podezření bez dostatečných důkazů poškodilo kariéry
loajálních pracovníků a ochromilo práci služby. Paranoia uvnitř organizace je sama
bezpečnostním rizikem.

## Průnik s epistemickou anihilací

Získávání zaměstnance zvenčí často probíhá postupně a využívá mechanismy, které kniha
popisuje u manipulativních vztahů: navázání vztahu a pocitu výjimečnosti ([love bombing](@/glossary/love-bombing.md)),
drobné první požadavky, které vytvářejí závazek, postupná [izolace](@/kompendium/detection-signatures/13-behavioral-isolation-acceleration.md)
od kolegů, kteří by si změn všimli, a nakonec vydírání tím, co už zaměstnanec udělal a co by nechtěl, aby vyšlo najevo
(srov. [future blackmail implantace](@/kompendium/techniques/ea-2-2-10-future-blackmail-implantace.md)).
Člověk v takové situaci prožívá rostoucí stud a strach, které mu brání se svěřit.

Opačná strana je stejně důležitá. Organizace, která zavede plošné sledování a podezírání,
vytváří prostředí, v němž se zaměstnanci bojí mluvit o chybách, konfliktech i o tom, že
je někdo oslovil. Tím paradoxně zvyšuje riziko, protože ztrácí nejcennější zdroj včasného
varování – důvěru lidí, kteří by sami ohlásili pokus o získání. Kniha takové prostředí
popisuje jako [panoptické](@/glossary/panopticism.md) a varuje před jeho účinky na
schopnost lidí důvěřovat vlastnímu úsudku.

## Rozpoznávací znaky

Literatura o vnitřních hrozbách uvádí jako rizikové **dlouhodobý konflikt** se zaměstnavatelem,
**finanční tíseň**, **náhlé změny chování** (izolace, utajování, práce mimo obvyklou dobu
bez důvodu), **přístup k datům mimo pracovní potřebu** a **přípravu odchodu** spojenou s
hromaděním dat. Žádný z těchto znaků sám o sobě nic nedokazuje: finanční tíseň a konflikty
má mnoho loajálních lidí, a práce mimo obvyklou dobu může být známkou nasazení.

Ze strany manipulace zvenčí je varovným znakem, když zaměstnanec zmiňuje **nového kontakt
s neobvyklým zájmem** o jeho práci, **nabídky, které jsou příliš dobré**, nebo když se
**stáhne z kolektivu** a odmítá mluvit o určitém tématu. Ze strany organizace je varovným
znakem **plošné podezírání**, **sledování bez jasného účelu** a **atmosféra, v níž se
nikdo nesvěří**.

## Rámec: právo, standardy a odpovědnost

Monitorování zaměstnanců je omezeno pracovním právem a ochranou soukromí. Zákoník práce
(zákon č. 262/2006 Sb.) zakazuje zaměstnavateli bez závažného důvodu spočívajícího ve
zvláštní povaze činnosti narušovat soukromí zaměstnance otevřeným nebo skrytým sledováním,
odposlechem a kontrolou korespondence. GDPR vyžaduje zákonnost, přiměřenost a transparentnost
zpracování. Evropský soud pro lidská práva v rozsudku velkého senátu Bărbulescu proti
Rumunsku (2017) zdůraznil, že monitorování komunikace zaměstnance musí být přiměřené
a zaměstnanec o něm musí být předem informován.

## Ochranná opatření

Účinné programy prevence vnitřních hrozeb stojí více na důvěře než na sledování. Patří k nim
**princip nejmenších oprávnění** a [řízení přístupů](@/kompendium/organizational-defense/28-access-control-EA.md),
**oddělení povinností** u citlivých operací, **férové řešení konfliktů** a stížností,
**bezpečný kanál**, kde může zaměstnanec ohlásit, že ho někdo oslovil nebo vydírá, bez
obavy z postihu, **kontrolované odchody** se zrušením přístupů a citlivým rozhovorem (viz
[Exit interview s EA fokusem](@/kompendium/organizational-defense/13-exit-interview-EA.md)),
a **přiměřené, transparentní monitorování** citlivých systémů.

Šetření podezření má mít jasná pravidla: presumpce neviny, odborné vedení, ochrana
dotčené osoby a omezení okruhu lidí, kteří o šetření vědí. Postupy popisuje
[Interní vyšetřování](@/kompendium/organizational-defense/32-internal-investigation.md).

## Lidský rozměr a zotavení

Zaměstnanec, kterého někdo zvenčí postupně získal, je často zároveň obětí: prožívá strach,
stud a izolaci, které mu brání vystoupit. Organizace, která nabídne cestu ven (ohlášení,
spolupráce, podpora), získá víc než organizace, která hrozí jen tvrdými tresty. Na druhé
straně stojí lidé, kteří byli podezíráni neprávem; pro ně je šetření zkušeností zrady ze
strany instituce, kterou kniha popisuje jako [betrayal trauma](@/glossary/betrayal-trauma.md)
(Freyd 1996). Očištění má být stejně viditelné jako podezření.

## Přesah do dalších oborů

Dynamika vnitřní hrozby se objevuje ve zdravotnictví (zneužití přístupu ke zdravotní
dokumentaci, nátlak na zdravotníky), ve školství (obavy z radikalizace studentů a riziko
jejich plošného podezírání), ve sportu a v umění (kultury, v nichž se podezřívá každý,
kdo kritizuje). V manipulativních skupinách je hledání „zrádců“ a „nepřátel uvnitř“ jedním
z nástrojů kontroly: Lifton (1961) popsal atmosféru neustálého sebeobviňování a vzájemného
podezření jako součást totalistického prostředí. Organizace, která se brání vnitřní hrozbě
metodami, jež připomínají tuto atmosféru, poškozuje sama sebe.

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Vývojář v technologické firmě je přes profesní síť
osloven „náborářem“, který mu nabízí konzultační práci a postupně se ptá na detaily interních
systémů. Vývojář po několika týdnech znejistí a využije anonymní kanál, o němž ví ze
školení. Bezpečnostní tým s ním mluví bez obviňování, zjistí, že žádné citlivé informace
nepředal, a pomůže mu kontakt ukončit. Firma upozorní ostatní zaměstnance na vzorec oslovení,
aniž by vývojáře jmenovala. O měsíc později ohlásí podobné oslovení další dva zaměstnanci.

Firma v následném vyhodnocení konstatuje, že rozhodující nebyl technický nástroj, ale to,
že vývojář věřil, že ohlášení nebude obráceno proti němu. Kdyby firma o měsíc dříve
zavedla plošné sledování komunikace zaměstnanců v profesních sítích, o kterém se uvažovalo,
vývojář by se podle vlastních slov bál přiznat, že s „náborářem“ vůbec mluvil – a firma by
se o pokusu dozvěděla až z následků.

## Meze a otevřené otázky

Prediktivní modely vnitřních hrozeb slibují včasné odhalení, ale nesou riziko falešně
pozitivních nálezů a plošného sledování. Otevřenou otázkou je, jak vyvážit bezpečnost
a důvěru a jak měřit, zda program prevence spíše chrání, nebo spíše vytváří nedůvěru.

## Literatura

- Cappelli, D. M., Moore, A. P., Trzeciak, R. F. (2012). *The CERT Guide to Insider Threats.*
- Freyd, J. J. (1996). *Betrayal Trauma: The Logic of Forgetting Childhood Abuse.*
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism.*
- Rozsudek ESLP (velký senát) ze dne 5. 9. 2017, Bărbulescu proti Rumunsku, stížnost č. 61496/08.
- Zákon č. 262/2006 Sb., zákoník práce.

## Související

**Mezioborové mosty**

- [Sociální inženýrství](@/kompendium/cross-domain/17-ea-security-social-engineering.md) – manipulace zvenčí.
- [Zkreslení při atribuci](@/kompendium/cross-domain/23-ea-security-attribution-bias.md) – kdo za incidentem stojí.
- [Kognitivní zkreslení vyšetřovatele](@/kompendium/cross-domain/9-ea-dd-investigation-bias.md) – riziko tunelového vidění.

**Organizace**

- [Interní vyšetřování](@/kompendium/organizational-defense/32-internal-investigation.md) – férové šetření.
- [Řízení přístupů s EA fokusem](@/kompendium/organizational-defense/28-access-control-EA.md) – nejmenší oprávnění.
- [Exit interview s EA fokusem](@/kompendium/organizational-defense/13-exit-interview-EA.md) – kontrolované odchody.

**Techniky a pojmy**

- [EA-2.2.10 Future Blackmail Implantace](@/kompendium/techniques/ea-2-2-10-future-blackmail-implantace.md) – vydírání závazkem.
- [Panopticism](@/glossary/panopticism.md) – sledování jako nástroj kontroly.
- [Betrayal trauma](@/glossary/betrayal-trauma.md) – zrada institucí.
