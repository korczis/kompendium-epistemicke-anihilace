+++
title = "Historický případ: Internet Research Agency"
date = 2026-04-26
description = "Petrohradská „trollí farma“ a její síť falešných identit na sociálních sítích kolem amerických voleb 2016. Případ koordinovaného neautentického chování."
weight = 100
draft = false

[extra]
category = "Disinformation"
type = "historical-case"
+++

# Historický případ: Internet Research Agency

> **Kategorie**: Dezinformace a manipulace veřejností · **Období**: přibližně 2013–2018 (činnost pokračovala i později) · **Místo**: Petrohrad, Rusko; cílení především na USA

Internet Research Agency (IRA) je modelový případ **koordinovaného neautentického chování**
na sociálních sítích. Nešlo v první řadě o šíření jedné lži, ale o výrobu falešných
společenských identit – „obyčejných Američanů“ všech politických barev –, jejichž
prostřednictvím organizace vstupovala do domácích sporů cizí země. Pro Kompendium je
případ důležitý tím, že útok nemíří na jednotlivé přesvědčení, ale na **schopnost
společnosti poznat, kdo v její debatě vůbec mluví**.

## Kontext

IRA vznikla kolem roku 2013 v Petrohradu jako soukromá firma napojená na podnikatele
Jevgenije Prigožina. Původně se zaměřovala na domácí publikum a na ukrajinské téma po roce
2014; postupně rozšířila činnost na anglicky mluvící prostor. Navazovala na tradici
sovětských [aktivních opatření](@/kompendium/historical-cases/21-soviet-active-measures.md),
ale pracovala v prostředí, kde distribuci obstarávaly algoritmy platforem a kde cena
vytvoření nové „identity“ klesla téměř na nulu. Prigožin v únoru 2023 veřejně přiznal, že
IRA založil a financoval.

## Co se stalo

- **2014–2017**: IRA provozovala stovky účtů a stránek na Facebooku, Instagramu, Twitteru,
  YouTube a dalších službách. Stránky se tvářily jako místní aktivistické skupiny – od
  afroamerických přes konzervativní, náboženské a veteránské až po secesionistické.
- **2016**: obsah IRA se týkal amerických prezidentských voleb; kromě online aktivit
  organizace přes falešné identity svolávala i skutečná shromáždění na území USA.
- **Říjen–listopad 2017**: platformy při slyšeních v Kongresu uvedly rozsah; Facebook
  odhadl, že obsah IRA mohl zasáhnout až kolem 126 milionů uživatelů.
- **16. února 2018**: zvláštní vyšetřovatel Robert Mueller obžaloval 13 ruských občanů a
  3 subjekty včetně IRA.
- **Duben 2019**: Muellerova zpráva popsala kampaň IRA v samostatné části; v říjnu 2019 se jí
  podrobně věnoval druhý svazek zprávy zpravodajského výboru amerického Senátu.

## Epistemické mechanismy

### Výroba falešného „my“

IRA nepřesvědčovala zvenčí, ale **mluvila jménem skupin**, k nimž se publikum hlásilo.
Falešná persona sdílela jazyk, humor a křivdy komunity a teprve na tomto základě
podsouvala interpretace. Tato strategie odpovídá
[síti sock-puppet účtů](@/kompendium/techniques/ea-9-4-3-sock-puppet-network.md) a
[trollí farmě](@/kompendium/techniques/ea-9-4-5-troll-farm-EA.md); diagnosticky jde o
[koordinované neautentické chování](@/kompendium/techniques/ea-9-4-2-coordinated-inauthentic-behavior.md).

### Polarizace obou pólů

Charakteristické bylo souběžné oslovování protichůdných táborů. Cílem nebylo prosadit jeden
názor, ale **zesílit vzájemnou nedůvěru**: každá strana viděla nejradikálnější verzi té
druhé, často vyrobenou stejnou organizací. Výsledkem je
[frame war](@/kompendium/techniques/ea-9-5-6-frame-war-coordination.md) a zúžení společného
faktického základu.

### Využití architektury platforem

Obsah byl optimalizován pro sdílení – emočně silné memy, identitní symboly, pobouření.
Algoritmy, které odměňují interakci, pak zajistily distribuci bez dalších nákladů
([algoritmická amplifikace](@/kompendium/techniques/ea-9-3-1-algorithmic-amplification.md),
[emoční inženýrství memů](@/kompendium/techniques/ea-9-5-3-emotional-meme-engineering.md)).

### Přechod z online do offline

Svolávání skutečných akcí ukazuje, že neautentické identity mohou koordinovat chování
reálných lidí, kteří o původu výzvy nevědí. Hranice mezi „informační“ a „fyzickou“
operací se tu stírá.

## Dopady na jednotlivce a společnost

Měřitelný vliv IRA na volební výsledek **nebyl prokázán**. Studie publikovaná v roce 2023
v *Nature Communications* (Eady a kol.) nenašla souvislost mezi expozicí ruským účtům na
Twitteru a změnou postojů či volebního chování; expozice se navíc koncentrovala u malé
skupiny silně stranických uživatelů. Podstatnější dopad je proto třeba hledat jinde:

- **Kontaminace důvěry** – vědomí, že část debaty byla vyrobena, vede ke generalizované
  podezíravosti; skutečné hlasy jsou pak odbývány jako „boti“ nebo „trollové“.
- **Poškození komunit**, jejichž identita byla zneužita – zejména afroamerických
  aktivistických skupin, jejichž jazyk IRA napodobovala.
- **Precedens** pro další státní i nestátní aktéry, kteří metodu převzali.

## Odhalení, dokumentace a vyrovnání

Rozhodující roli sehrála kombinace investigativní žurnalistiky (ruská i západní média
popisovala petrohradskou firmu už v letech 2014–2015), interních vyšetřování platforem a
státních orgánů. Platformy zveřejnily datové sady odstraněných účtů, které umožnily
nezávislý výzkum; pro Senát připravily analytické zprávy mimo jiné týmy z Oxfordské
univerzity a firmy New Knowledge. Obžalovaní ruští občané nebyli vydáni a trestní stíhání
zůstalo symbolické.

Hlavním výsledkem jsou změny v praxi platforem: pravidla proti koordinovanému
neautentickému chování, pravidelné zprávy o odstraněných sítích, štítky u státních médií a
v Evropské unii povinnosti velkých platforem v oblasti systémových rizik
([regulace platforem](@/kompendium/population-health/25-platform-regulation-EA.md)).

## Poučení pro detekci a obranu dnes

- **Signatury koordinace**: synchronní publikování, sdílený obsah napříč „nezávislými“
  účty, krátká historie účtů, nesoulad jazyka a deklarované identity
  ([bot coordination](@/kompendium/detection-signatures/20-network-bot-coordination.md),
  [platformní koordinace](@/kompendium/detection-signatures/21-network-platform-coordination.md)).
- **OSINT postupy**: analýza sítí sdílení a časových vzorců
  ([detekce botů](@/kompendium/cross-domain/6-ea-osint-bot-detection.md),
  [manipulace na sociálních sítích](@/kompendium/cross-domain/5-ea-osint-social-media-manipulation.md)).
- **Individuální obrana**: u silně emotivního obsahu ověřit, kdo je jeho autorem, a vědomě
  vyhledávat přímý kontakt s lidmi z „druhé strany“ místo jejich internetových karikatur.
- **Institucionální obrana**: transparentnost datových přístupů pro výzkum a veřejná
  atribuce s doloženými důkazy.

## Hranice výkladu

Rozsah kampaně je dobře doložen; její účinek mnohem méně. Přeceňování vlivu IRA může být
samo zdrojem epistemické škody – nabízí jednoduché vysvětlení složitých domácích procesů a
legitimizuje označování nepohodlných názorů za cizí vliv. Rovněž role IRA v britském
referendu o Brexitu z roku 2016 nebyla prokázána v rozsahu, který starší verze této stránky
naznačovala. Viz [politická instrumentalizace](@/kompendium/critical-perspectives/6-political-instrumentalization.md).

## Literatura

- Mueller, R. S. (2019). *Report on the Investigation into Russian Interference in the 2016
  Presidential Election*, sv. I.
- DiResta, R., a kol. (2018). *The Tactics & Tropes of the Internet Research Agency*. New Knowledge.
- Jamieson, K. H. (2018). *Cyberwar: How Russian Hackers and Trolls Helped Elect a President*
  (silná interpretace vlivu, s níž část výzkumu nesouhlasí).
- Rid, T. (2020). *Active Measures: The Secret History of Disinformation and Political Warfare*.

## Související

**Sousední případy**

- [Sovětská aktivní opatření](@/kompendium/historical-cases/21-soviet-active-measures.md) – předchůdce metody
- [Cambridge Analytica](@/kompendium/historical-cases/23-cambridge-analytica.md) – jiný model cílení ve stejném období
- [QAnon](@/kompendium/historical-cases/28-qanon.md) – domácí, decentralizované šíření bez centrální „farmy“

**Techniky a pojmy**

- [Bot amplification](@/kompendium/techniques/ea-9-4-1-bot-amplification-coordinated.md) – automatizované zesilování
- [Firehose of falsehood](@/glossary/firehose-of-falsehood.md) – ruský model objemové propagandy
- [Epistemic bubble](@/glossary/epistemic-bubble.md) – prostředí, v němž falešné identity působí nejsnáz

**Klinika, právo a obrana**

- [Ruský vliv – vzorce EA](@/kompendium/international/7-russian-influence-EA/index.md) – regionální kontext
- [Populační dopad dezinformací](@/kompendium/population-health/04-disinformation-population-impact.md) – co lze měřit a co ne
- [Scénář: koordinace botů](@/kompendium/educational-scenarios/17-bot-coordination.md) – výcvik rozpoznávání

## Connect

Doplňující prameny, opravy, vlastní výzkum: [GitHub Issues](https://github.com/korczis/kompendium-epistemicke-anihilace/issues) | [GitHub](https://github.com/korczis)
