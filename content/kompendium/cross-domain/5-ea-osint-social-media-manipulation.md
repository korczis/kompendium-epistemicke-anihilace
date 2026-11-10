+++
title = "OSINT: manipulace na sociálních sítích"
description = "Jak rozpoznat koordinované neautentické chování, informační poruchy a algoritmické zesílení při analýze sociálních sítí a jak z nich nevyvozovat víc, než unesou."
weight = 50

[taxonomies]
tags = ["kompendium", "cross-domain", "osint"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["6-ea-osint-bot-detection", "7-ea-osint-narrative-injection", "19-ea-security-disinformation-defense", "1-ea-osint-source-credibility"]
toc = true
+++

Sociální sítě jsou pro analytika OSINT zároveň nejbohatším a nejméně spolehlivým zdrojem.
Ukazují, co lidé sdílejí, jak reagují a kdo s kým souvisí; zároveň je to prostředí, kde lze
levně vytvořit zdání veřejného mínění, zesílit okrajový názor a zakrýt původ obsahu. Kniha
popisuje, jak se na úrovni jednotlivce rozkládá schopnost poznávat; na sociálních sítích
se tento rozklad odehrává hromadně a analytik, který je zkoumá, je mu sám vystaven.

## Doména a problém

Wardleová a Derakhshanová (2017) navrhly ve zprávě pro Radu Evropy rozlišovat tři typy
informačních poruch: **misinformace** (nepravdivá informace šířená bez úmyslu škodit),
**dezinformace** (nepravdivá informace šířená se záměrem škodit) a **malinformace**
(pravdivá informace použitá ke škodě, např. zveřejnění soukromých údajů). Toto rozlišení
je pro analýzu zásadní, protože většina lidí, kteří sdílejí nepravdivý obsah, nejsou
autory kampaně, ale jejími nositeli. Typologii kniha rozvádí na stránce
[Wardle: Typologie dezinformačního ekosystému](@/kompendium/07-teoreticke-reflexe/wardle-disinformation-typology.md).

Woolley a Howard (2018) zavedli pojem **výpočetní [propaganda](@/glossary/propaganda.md)** pro využití algoritmů,
automatizace a lidské práce k cílené distribuci zavádějících informací na sociálních sítích.
Vosoughi, Roy a Aral (2018) ukázali na rozsáhlém souboru dat z Twitteru, že nepravdivé
zprávy se šířily rychleji a dál než pravdivé a že rozhodující roli v tom hráli lidé,
nikoli boti. Platformy samy používají pojem **koordinované neautentické chování** pro sítě
účtů, které skrývají svou identitu a koordinují se, aby ovlivnily veřejnou debatu.

## Průnik s epistemickou anihilací

Mnohé techniky popsané v knize mají na sociálních sítích masovou podobu. [Mob coordination](@/kompendium/techniques/ea-2-3-4-mob-coordination.md)
a [platform coordinated attack](@/kompendium/techniques/ea-2-3-6-platform-coordinated-attack.md)
popisují soustředěný útok na osobu; [context collapse](@/kompendium/techniques/ea-2-3-2-context-collapse.md)
vytržení výroku z kontextu, pro který byl určen; [pseudo-kontroverze](@/kompendium/techniques/ea-2-3-5-pseudo-kontroverze-amplifikace.md)
umělé vytvoření sporu tam, kde v odborné komunitě žádný není. [Firehose of falsehood](@/glossary/firehose-of-falsehood.md)
popisuje strategii, která nespoléhá na přesvědčivost jednotlivých tvrzení, ale na objem,
rychlost a opakování (Paul a Matthews 2016).

Benkler, Faris a Roberts (2018) ukázali na americkém mediálním ekosystému, že klíčovým
faktorem šíření dezinformací nebyly jednotlivé sítě botů ani zahraniční kampaně, ale
asymetrická struktura mediálního prostředí, v němž část publika přestala uznávat jakékoli
vnější korektivy. To je kolektivní obdoba toho, co kniha nazývá [epistemickou bublinou](@/glossary/epistemic-bubble.md)
a [epistemickou monokulturou](@/glossary/epistemicka-monokultura.md).

## Rozpoznávací znaky

Při analýze je užitečné sledovat **časovou synchronizaci** (mnoho účtů publikuje stejný
nebo velmi podobný obsah v krátkém okně), **textovou podobnost** (stejné formulace, stejné
chyby, stejné hashtagy), **charakteristiky účtů** (datum vzniku, poměr vlastního a
sdíleného obsahu, změny jména a zaměření), **strukturu sítě** (účty, které se navzájem
zesilují a mají málo vazeb mimo skupinu) a **přechody mezi platformami** (obsah vzniká na
okrajové platformě a teprve potom se přesouvá na hlavní). Kniha tyto znaky shrnuje v
signaturách [asymetrie amplifikace](@/kompendium/detection-signatures/19-network-amplification-asymmetry.md)
a [platformní koordinace](@/kompendium/detection-signatures/21-network-platform-coordination.md).

Žádný z těchto znaků sám nestačí. Lidé reagují na stejné události současně, používají
stejné hashtagy, protože je viděli jinde, a zakládají účty, protože je téma zaujalo.
Starbirdová, Arifová a Wilsonová (2019) upozornily, že dezinformace je často „kolaborativní
prací“, na níž se vedle organizovaných aktérů podílí i velké množství upřímně přesvědčených
lidí. Hranice mezi kampaní a spontánní mobilizací je proto rozostřená a závěr o koordinaci
vyžaduje kombinaci znaků a srovnání s běžnou aktivitou.

## Rámec: právo, standardy a odpovědnost

V Evropské unii stanoví povinnosti velmi velkých online platforem nařízení (EU) 2022/2065
o jednotném trhu digitálních služeb (DSA), které ukládá posuzovat a zmírňovat systémová rizika
včetně rizik pro občanský diskurz a volební procesy a zpřístupňovat data výzkumníkům.
Analýza veřejných dat ze sociálních sítí zahrnuje zpracování osobních údajů a musí mít
právní základ podle GDPR; „veřejné“ neznamená „bez ochrany“.

## Ochranná opatření

Pro analytika jsou klíčové čtyři zásady. Zaprvé **oddělit popis vzorce od tvrzení
o původci**: síťová analýza může ukázat koordinaci, ale ne to, kdo ji řídí (viz [atribuce](@/kompendium/cross-domain/23-ea-security-attribution-bias.md)).
Zadruhé **rozlišovat aktéry a nositele**: lidé, kteří obsah sdílejí v dobré víře, nejsou
pachateli a nemají být v analýze označováni. Zatřetí **zachovávat důkazy** – snímky
s metadaty, archivní kopie, časové údaje – protože obsah na sítích mizí. Začtvrté **chránit
vlastní úsudek**: analytik, který dlouho pracuje s manipulativním obsahem, je mu vystaven
a měl by mít pravidla pro odstup, supervizi a kalibraci (srov. [detoxikace feedu](@/kompendium/self-defense-guides/32-feed-detoxification.md)).

## Lidský rozměr a zotavení

Cíli koordinovaných kampaní jsou často konkrétní lidé – novináři, vědci, aktivisté, úředníci.
Zkušenost masového útoku popisuje kniha v kazuistice [mediální mob](@/kompendium/case-studies/04-medialni-mob-attack.md)
a v signatuře [deplatformingové kaskády](@/kompendium/detection-signatures/24-network-deplatforming-cascade.md).
Kromě bezpečnosti a dokumentace potřebují tito lidé především ujištění, že masový odpor
není důkazem jejich chyby – že objem kritiky nevypovídá o její oprávněnosti.

## Přesah do dalších oborů

Manipulace na sociálních sítích zasahuje obory, které s analýzou sítí nemají nic společného.
Ve veřejném zdraví se projevuje šířením zavádějících informací o očkování a léčbě, které
mění chování pacientů (srov. [Hesitance vůči vakcínám](@/kompendium/historical-cases/27-vaccine-hesitancy.md)).
Ve vzdělávání v tom, že žáci a studenti získávají podstatnou část informací ze zdrojů,
jejichž původ neznají. V soudnictví v tom, že mediální a online kampaně mohou ovlivňovat
svědky, porotce i veřejný tlak na rozhodování. V psychoterapii v tom, že klienti přicházejí
s výklady své situace převzatými z online komunit, které mohou být užitečné, ale i
manipulativní. Pennycook a Rand (2019) ukázali, že náchylnost k přijímání falešných
titulků souvisí více s nedostatkem analytického přemýšlení než s politickou motivací –
což naznačuje, že podpora pomalého, reflektivního hodnocení je užitečná napříč obory.
Kniha k tomu nabízí praktický návod [časově odloženého hodnocení](@/kompendium/self-defense-guides/37-time-locked-evaluation.md).

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Po zveřejnění studie o kvalitě vody v jednom regionu
se na sítích objeví stovky příspěvků, které autorku obviňují z podvodu. Analýza ukáže, že
první vlna vznikla během dvou hodin z několika desítek účtů založených v posledním měsíci,
které sdílely téměř identický text; druhá, mnohem větší vlna pochází od skutečných
obyvatel regionu, kteří reagovali na první. Zpráva popisuje první vlnu jako pravděpodobně
koordinovanou, druhou jako spontánní reakci a nespekuluje o tom, kdo kampaň zadal,
protože data to neumožňují. Zpráva neuvádí jména ani přezdívky účtů z druhé vlny, protože
jejich autoři nejsou aktéry kampaně, ale lidmi, kteří na ni reagovali. Autorce doporučí,
jak dokumentovat obtěžování, kam se obrátit a jak omezit vlastní vystavení obsahu útoku.

## Meze a otevřené otázky

Přístup výzkumníků k datům platforem se mění a závisí na pravidlech, která platformy
mohou měnit. Otevřenou otázkou je, jak analyzovat manipulaci v uzavřených skupinách
a šifrovaných kanálech, kde se dnes odehrává velká část koordinace, aniž by se porušilo
soukromí uživatelů.

## Literatura

- Benkler, Y., Faris, R., Roberts, H. (2018). *Network Propaganda.*
- Pennycook, G., Rand, D. G. (2019). Lazy, not biased: Susceptibility to partisan fake news is better explained by lack of reasoning than by motivated reasoning.
- Paul, C., Matthews, M. (2016). *The Russian „Firehose of Falsehood“ Propaganda Model.*
- Starbird, K., Arif, A., Wilson, T. (2019). Disinformation as collaborative work.
- Vosoughi, S., Roy, D., Aral, S. (2018). The spread of true and false news online.
- Wardle, C., Derakhshan, H. (2017). *Information Disorder.*
- Woolley, S. C., Howard, P. N. (eds.) (2018). *Computational Propaganda.*

## Související

**Mezioborové mosty**

- [Detekce botů](@/kompendium/cross-domain/6-ea-osint-bot-detection.md) – automatizované účty.
- [Injekce narativu](@/kompendium/cross-domain/7-ea-osint-narrative-injection.md) – vkládání příběhů.
- [Obrana proti dezinformacím](@/kompendium/cross-domain/19-ea-security-disinformation-defense.md) – organizační reakce.

**Signatury a techniky**

- [Platformní koordinace](@/kompendium/detection-signatures/21-network-platform-coordination.md) – koordinace napříč platformami.
- [EA-2.3.4 Mob Coordination](@/kompendium/techniques/ea-2-3-4-mob-coordination.md) – soustředěný útok.

**Teorie a historie**

- [Wardle: Typologie dezinformačního ekosystému](@/kompendium/07-teoreticke-reflexe/wardle-disinformation-typology.md) – pojmový rámec.
- [Historický případ: Internet Research Agency](@/kompendium/historical-cases/22-russian-ira.md) – doložená kampaň.

**Pojmy**

- [Firehose of falsehood](@/glossary/firehose-of-falsehood.md) – strategie objemu.
- [Epistemická bublina](@/glossary/epistemic-bubble.md) – uzavřený informační prostor.
