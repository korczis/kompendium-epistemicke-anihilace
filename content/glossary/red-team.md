+++
title = "Red Team (červený tým)"
aliases = ["/glossary/black-team/", "/glossary/color-teams/", "/glossary/gray-team/", "/glossary/white-team/", "/kompendium/glossary-bridges/bridge-black-team/", "/kompendium/glossary-bridges/bridge-color-teams/", "/kompendium/glossary-bridges/bridge-gray-team/", "/kompendium/glossary-bridges/bridge-white-team/"]
weight = 19
description = "Skupina, která hraje roli protivníka, aby prověřila plán, závěr nebo obranu: od válečných her přes kybernetickou bezpečnost po strukturované zpochybnění vlastního úsudku."

[taxonomies]
tags = ["glossary", "security", "decision-making"]

[extra]
category = "security"
related_terms = ["blue-team", "purple-team", "predbezna-pitva", "konfirmacni-bias"]
author = "Tomas Korcak (korczis)"
date_created = "2025-06-15"
date_modified = "2026-11-14"
keywords = ["red team", "červený tým", "red teaming", "simulace protivníka", "alternativní analýza", "ďáblův advokát", "MITRE ATT&CK", "kritické myšlení"]
+++

## Definice

**Red team** (červený tým) je skupina, která v cvičení nebo v posouzení hraje roli protivníka, aby prověřila
plán, závěr nebo obranu dřív, než je prověří skutečný protivník. Britské ministerstvo obrany ve své příručce
red teaming vymezuje jako nezávislé uplatnění strukturovaných, tvůrčích a kritických postupů myšlení, které
mají pomoci tomu, kdo rozhoduje, učinit lépe informované rozhodnutí (UK Ministry of Defence, 2021).

Podstatou pojmu je záměrně přijatý pohled zvenčí. Zenko (2015) popisuje red teaming jako způsob, jak
instituce mohou překonat vlastní slepá místa: lidé uvnitř organizace sdílejí předpoklady, které nedokážou
vidět, a red team je má za úkol odhalit tím, že myslí jako ten, kdo by organizaci chtěl porazit.

## Původ a kontext pojmu

Pojem pochází z vojenských válečných her, v nichž „červená“ strana simulovala nepřítele proti „modré“
straně, která se bránila. Zenko (2015) sleduje, jak se tato praxe přenesla z armády do zpravodajských služeb,
kde slouží k alternativní analýze a ke zpochybňování převládajících odhadů, a odtud do bezpečnosti, podnikání
a veřejné správy.

V informační bezpečnosti se red teaming stal součástí standardního hodnocení. Příručka NIST k technickému
testování bezpečnosti popisuje penetrační testy a jim příbuzné postupy, které napodobují útočníka (Scarfone a
kol., 2008), a katalog bezpečnostních opatření NIST uvádí cvičení red teamu jako jedno z opatření, jimiž
organizace ověřuje, zda její ochrana obstojí proti reálným útokům (NIST, 2020). Strom a kolegové (2018)
popisují, jak katalog MITRE ATT&CK dává red teamu společný slovník, v němž lze simulované chování
protivníka zapsat technika po technice.

## Jak se projevuje

V bezpečnostní praxi se red teaming projevuje jako emulace protivníka: red team provede techniky, které by
použil skutečný útočník, a zjišťuje, kde obrana selže (Strom a kol., 2018). Od běžného testu se liší tím, že
neověřuje jednotlivou zranitelnost, ale schopnost organizace odhalit a zastavit celý postup útoku.

V analytické práci se red teaming projevuje jako strukturované zpochybnění závěru. Britská příručka popisuje
postupy, jako je hledání alternativních vysvětlení, kontrola klíčových předpokladů nebo pohled očima
protivníka, které mají odhalit, kde se úsudek opírá o nevyslovené domněnky (UK Ministry of Defence, 2021).
Nově se red teaming uplatňuje i u systémů umělé inteligence: Ganguli a kolegové (2022) popisují, jak se
jazykové modely záměrně zkoušejí útočnými dotazy, aby se jejich slabiny našly dřív, než je využije někdo jiný.

## Mechanismus

Mechanismus red teamingu spočívá v tom, že nesouhlas dostane legitimní místo. Janis (1972) ukázal, že
soudržné skupiny pod tlakem na shodu potlačují pochybnosti, a doporučil pověřit někoho rolí ďáblova advokáta;
red team je institucionální podobou téhož principu, protože jeho úkolem je najít slabinu, nikoli potvrdit
plán.

Aby mechanismus fungoval, musí být red team nezávislý a jeho zjištění musí mít váhu. Zenko (2015) popisuje
případy, kdy red team selhal proto, že byl podřízen těm, jejichž plán měl prověřit, nebo proto, že jeho
zjištění vedení odbylo. Nemeth, Brown a Rogers (2001) navíc ukázali, že nesouhlas přidělený jako role
podněcuje uvažování méně než nesouhlas skutečný, a red team proto potřebuje lidi, kteří problém skutečně
vidí jinak.

## Odlišení

| Odlišit od | Rozdíl |
| --- | --- |
| [Blue team](@/glossary/blue-team.md) | obranná strana, kterou red team prověřuje |
| [Purple team](@/glossary/purple-team.md) | spolupráce útočné a obranné strany nad týmiž zjištěními |
| Penetrační test | ověřuje zranitelnosti určitého systému; red teaming prověřuje schopnost organizace odhalit a zastavit celý útok |
| Ďáblův advokát | jeden člověk pověřený hájit opačné stanovisko; red team je samostatná skupina se strukturovanými postupy |
| [Předběžná pitva](@/glossary/predbezna-pitva.md) | provádí ji tatáž skupina, která plán připravila; red team plán napadá zvenčí |

## Význam pro Kompendium

V Kompendiu se red teaming objevuje především v analytickém smyslu, jako ochrana závěru před konfirmačním
zkreslením. Stránky [prevence konfirmačního zkreslení](@/kompendium/cross-domain/16-ea-dd-confirmation-bias-prevention.md)
a [zkreslení při vyšetřování](@/kompendium/cross-domain/9-ea-dd-investigation-bias.md) uvádějí red team jako
skupinu, která má za úkol formulovat nejsilnější případ proti vlastnímu závěru, a stránka o [regulatorním
zajetí](@/kompendium/cross-domain/30-ea-compliance-regulatory-capture-detection.md) ho doporučuje u zásadních
rozhodnutí regulátora. *Interpretace knihy*: všechna tři užití stojí na Janisově (1972) pozorování, že skupina
bez legitimního nesouhlasu přestává vidět vlastní chyby.

Druhé užití se týká bezpečnosti a informačních operací, kde kniha red teaming uvádí jako způsob, jak prověřit
odolnost organizace vůči útoku na její pověst nebo dodavatelský řetězec. *Interpretace knihy*: rozdíl mezi
red teamingem a útokem netkví v technice, ale v souhlasu, vymezeném rozsahu a v tom, že výsledek slouží
obraně (Ganguli a kol., 2022).

## Obrana a zotavení

Legitimní red teaming má podmínky, které ho odlišují od útoku. Britská příručka zdůrazňuje, že red team
pracuje pro toho, kdo rozhoduje, na jeho žádost a v dohodnutém rozsahu, a že jeho zjištění patří tomu, kdo ho
pověřil (UK Ministry of Defence, 2021). Kde chybí souhlas, vymezený rozsah a příjemce výsledků, nejde o red
teaming, ale o útok, a to i tehdy, když se tak sám nazývá.

Na tento rozdíl se lze ptát i v běžném životě. Mitnick a Simon (2002) popisují, jak útočníci využívají
předstírání oprávněné role, například údajného testu bezpečnosti nebo kontroly, k získání přístupu nebo
informací. *Interpretace knihy*: kdo tvrdí, že „jen testuje odolnost“ člověka nebo skupiny, má umět doložit,
kdo ho k tomu pověřil a v jakém rozsahu; bez toho je tvrzení samo varovným znakem.

## Meze pojmu a kritika

Red teaming může selhat a stát se jen formalitou. Zenko (2015) ukazuje, že organizace někdy red team zřídí,
aby mohla tvrdit, že plán byl prověřen, a jeho zjištění pak nebere vážně; takový red team vytváří falešný
dojem jistoty, který je horší než jeho absence.

Druhou mezí je, že red team může prověřit jen to, co si dokáže představit. Strom a kolegové (2018)
upozorňují, že katalog chování protivníka zachycuje chování, které už někdo zaznamenal, a cvičení red teamu
proto ověřuje odolnost vůči známému, nikoli vůči všemu možnému. *Interpretace knihy*: úspěšně prověřený plán
je plán, který obstál proti představeným protivníkům, nikoli plán bez slabin.

## Literatura

- Ganguli, D., a kol. (2022). *Red teaming language models to reduce harms: Methods, scaling behaviors, and lessons learned*. arXiv:2209.07858.
- Janis, I. L. (1972). *Victims of Groupthink*. Boston: Houghton Mifflin.
- Mitnick, K. D., & Simon, W. L. (2002). *The Art of Deception: Controlling the Human Element of Security*. Indianapolis: Wiley.
- Nemeth, C., Brown, K., & Rogers, J. (2001). *Devil's advocate versus authentic dissent: Stimulating quantity and quality*. European Journal of Social Psychology, 31(6).
- NIST. (2020). *Security and Privacy Controls for Information Systems and Organizations* (SP 800-53 Rev. 5). Gaithersburg: National Institute of Standards and Technology.
- Scarfone, K., Souppaya, M., Cody, A., & Orebaugh, A. (2008). *Technical Guide to Information Security Testing and Assessment* (NIST SP 800-115). Gaithersburg: National Institute of Standards and Technology.
- Strom, B. E., a kol. (2018). *MITRE ATT&CK: Design and Philosophy*. MITRE.
- UK Ministry of Defence. (2021). *Red Teaming Handbook* (3rd ed.). Shrivenham: Development, Concepts and Doctrine Centre.
- Zenko, M. (2015). *Red Team: How to Succeed by Thinking Like the Enemy*. New York: Basic Books.

## Související

- [Blue Team](@/glossary/blue-team.md) – obranný protějšek, kterého red team prověřuje.
- [Purple Team](@/glossary/purple-team.md) – spolupráce útočné a obranné strany.
- [Předběžná pitva](@/glossary/predbezna-pitva.md) – vnitřní protějšek red teamu.
- [Konfirmační bias](@/glossary/konfirmacni-bias.md) – zkreslení, proti němuž red team v analýze slouží.
- [Epistemická bezpečnost](@/glossary/epistemic-security.md) – oblast, kterou útočná simulace testuje.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: red-team](@/kompendium/glossary-bridges/bridge-red-team.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
