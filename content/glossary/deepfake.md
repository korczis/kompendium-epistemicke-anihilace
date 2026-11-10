+++
title = "Deepfake"
weight = 60

description = "Syntetická audiovizuální média vytvořená hlubokými neuronovými sítěmi, která věrně padělají projev konkrétních osob; strukturální hrozba pro epistemickou bezpečnost."

[taxonomies]
tags = ["glossary", "security", "epistemic", "kompendium", "digitalni"]

[extra]
category = "security"
related_terms = ["epistemic-security", "info-ops", "firehose-of-falsehood", "epistemicka-anihilace", "hyperreality", "delegitimizace"]
author = "Tomáš Korcak (korczis)"
date_created = "2026-04-25"
date_modified = "2026-11-10"
keywords = ["deepfake", "syntetická média", "generativní AI", "forenzní analýza médií", "epistemická hrozba", "GAN", "difuzní model"]
see_also = ["kompendium", "epistemicka-anihilace"]
image = "/images/sections/glossary.png"
image_alt = "Deepfake – glosář"
+++

## Definice

Deepfake je syntetický audiovizuální obsah vytvořený hlubokými neuronovými sítěmi, který
zobrazuje rozpoznatelnou osobu, jak říká nebo dělá něco, co neřekla ani neudělala. Slovo
spojuje *deep learning* (hluboké učení) a *fake* (padělek) a vzniklo v roce 2017
v internetovém prostředí, odkud je převzala odborná i právní literatura (Chesney a Citron,
2019). Technickým základem byly nejprve generativní adversariální sítě, tedy dvojice modelů,
z nichž jeden vzorky vytváří a druhý je odlišuje od pravých (Goodfellow a kol., 2014); dnes
k nim přibyly difuzní modely a architektury podmíněné textem, které jsou předmětem oboru
forenzní analýzy médií (Verdoliva, 2020).

Podstatné pro knihu není, jak se padělek vyrábí, ale co dělá s postavením audiovizuálního
záznamu jako důkazu. Dokud bylo padělání nahrávky nákladné a vzácné, fungovala nahrávka jako
to, co Regina Rini nazývá epistemickou záložkou: svědectví bylo kryto tím, že je v principu
možné je ověřit záznamem (Rini, 2020). Deepfake tuto záložku oslabuje, a oslabuje ji i tam,
kde žádný padělek neexistuje, protože mění stav vědomí účastníků o tom, co lze předstírat
(Fallis, 2021).

## Co drží ustálená literatura

Právnická analýza Roberta Chesneyho a Danielle Citronové zavedla pojem „dividenda lháře“
(*liar's dividend*): jakmile je veřejně známo, že věrné padělky existují, může pachatel
odbýt pravý záznam vlastního jednání jako podvrh, a čím lépe je veřejnost o deepfacích
poučena, tím lépe tato obrana funguje (Chesney a Citron, 2019). Jde o dnes nejcitovanější
systémový účinek deepfaků a o tvrzení o nich, které je v literatuře opakovaně potvrzeno
nezávisle na konkrétní technologii.

Druhý dobře doložený poznatek se týká skutečného rozložení škod. Zpráva firmy Deeptrace
z roku 2019 zmapovala volně dostupné deepfaky a zjistila, že jejich naprostou většinu, kolem
96 %, tvořily nesouhlasné intimní záznamy, převážně na úkor žen (Ajder a kol., 2019).
Danielle Citronová zařadila tento typ útoku do kontextu kybernetického nenávistného jednání
už před nástupem generativních modelů a popsala, proč je jeho dopad na postavení oběti ve
veřejném prostoru nesouměrný s pozorností, kterou mu věnují platformy (Citron, 2014).

Třetí poznatek je naopak omezující. Experimentální práce Cristiana Vaccariho a Andrewa
Chadwicka zjistila, že vystavení deepfaku nemuselo vést k přijetí jeho obsahu, ale zvyšovalo
nejistotu o tom, čemu věřit; hlavním měřitelným účinkem byl tedy úbytek důvěry, nikoli
přesvědčení o padělaném tvrzení (Vaccari a Chadwick, 2020). Tvrzení, že deepfaky už
rozhodly volby nebo že jim lidé běžně bez výhrad věří, doložená nejsou a kniha je nepřebírá.

## Jak se projevuje

Technické stopy slábnou s každou generací modelů. Nesouměrné mrkání, neodpovídající odlesky
v rohovce, rozmazané okraje obličeje, kovový nebo plochý hlas a charakteristické vzorce
v rozložení frekvencí obrazu byly spolehlivými znaky prvních ročníků; forenzní přehled Luisy
Verdolivové ukazuje, že každý zveřejněný detektor se stává cílem optimalizace a s odstupem
ztrácí přesnost (Verdoliva, 2020). Pro čtenáře knihy z toho plyne, že na technické stopě
nelze postavit úsudek a že chybějící stopa není důkazem pravosti.

Kontextové znaky jsou odolnější. Záznam se objeví bez dohledatelného zdroje, šíří se přes
účty bez historie, dokonale zapadá do již běžící kampaně proti určité osobě a nese
naléhavost, která má zabránit ověření. Přesně tento profil popisují Vaccari a Chadwick jako
prostředí, v němž syntetické médium působí nejsilněji – ne proto, že je nerozeznatelné, ale
proto, že na jeho prověření není čas ani důvod (Vaccari a Chadwick, 2020).

Třetí skupinou znaků je uplatnění proti jedinému člověku v soukromém styku: telefonát hlasem
nadřízeného nebo blízkého, který žádá o peníze nebo o okamžitý úkon. Právě zde se deepfake
chová jako technika [epistemické anihilace](@/glossary/epistemicka-anihilace.md), protože
zasahuje vztah, v němž se oběť na rozpoznání hlasu dosud mohla spolehnout (Chesney a Citron,
2019).

## Mechanismus

Strukturně působí deepfake dvěma cestami, které se navzájem posilují. První je zaplavení
prostoru padělky, blízké technice [firehose of
falsehood](@/glossary/firehose-of-falsehood.md); druhá je zpochybnění pravých záznamů
dividendou lháře (Chesney a Citron, 2019). Obě vedou ke stejnému výsledku: audiovizuální
důkaz přestává rozhodovat spory a rozhodovat je začíná to, komu kdo věří předem (Rini, 2020).

Filozoficky jde o posun v rozdělení epistemické práce. Don Fallis ukazuje, že hodnota
nahrávky nespočívá v tom, že je pravdivá, ale v tom, že nese informaci – že existuje
spolehlivá souvislost mezi tím, co je na ní vidět, a tím, co se stalo. Syntetická média tuto
souvislost zeslabují, a tím snižují informační hodnotu i těch záznamů, které jsou pravé
(Fallis, 2021). Kniha v tom vidí blízkost [hyperrealitě](@/glossary/hyperreality.md) Jeana
Baudrillarda, tedy stavu, v němž simulakra předcházejí skutečnosti a nahrazují ji
(Baudrillard, 1981); *interpretace knihy* je zde to spojení, ne Baudrillardův text sám.

Dopad není rozložen rovnoměrně. Kdo je už předem brán jako nedůvěryhodný, přijde o možnost
doložit se záznamem první; jde o případ testimoniální nespravedlnosti ve smyslu Miranda
Frickerové, kde újma spočívá v odepření kreditu svědkovi, ne v neznalosti faktu (Fricker,
2007). Tuto souvislost rozvíjí heslo [testimoniální
nespravedlnost](@/glossary/testimonialni-nespravedlnost.md).

## Odlišení

Od mělkého padělku (*cheapfake*) se deepfake liší jen prostředkem, nikoli účinkem: zpomalení
záběru, vystřižení z kontextu nebo falešný popisek dosahují často téhož a jsou běžnější;
obranou je v obou případech kontrola kontextu, ne rozbor jednotlivých snímků (Verdoliva,
2020). Od satiry a uměleckého užití se liší označením a úmyslem – problém nastává, když
označení při dalším šíření zmizí (Vaccari a Chadwick, 2020). Od dezinformace obecně se liší
jen tím, že je jejím nástrojem; širší rámec popisují hesla
[info-ops](@/glossary/info-ops.md) a [propaganda](@/glossary/propaganda.md).

Od oprávněné pochybnosti o záznamu je naopak třeba odlišit paušální nedůvěru. Dividenda
lháře funguje právě tím, že se tváří jako zdravá skepse (Chesney a Citron, 2019); rozdíl je
v tom, zda pochybnost směřuje k ověření původu, nebo jen k odmítnutí nepohodlného obsahu.
Heslo [skepticismus](@/glossary/skepticismus.md) rozebírá, kde se zdravá pochybnost láme
ve znehodnocení poznání vůbec.

## Právní a etický rámec

Zpracování podoby a hlasu konkrétního člověka je zpracováním osobních údajů, na něž se
v evropském prostoru vztahuje obecné nařízení o ochraně osobních údajů, nařízení (EU)
2016/679; dotčený se může obrátit na provozovatele služby i na dozorový úřad. Povinnost
označovat syntetický obsah zavedl akt o umělé inteligenci, nařízení (EU) 2024/1689. Chesney
a Citron přitom upozorňují, že žádný z těchto nástrojů neřeší jádro problému – rychlost
šíření a nerovný přístup k nápravě (Chesney a Citron, 2019).

Trestněprávně může útok deepfakem naplnit znaky pomluvy, vydírání, podvodu nebo šíření
nesouhlasných intimních záznamů, podle jurisdikce a okolností; Citronová dokumentuje, že
hlavní překážkou nebývá chybějící skutková podstata, ale náklady a čas, které vymáhání po
oběti vyžaduje (Citron, 2014). Eticky je proto podstatné nezacházet s takovým útokem jako
s internetovou maličkostí a nepřenášet odpovědnost za obranu výhradně na postiženého
(Fricker, 2007).

## Význam pro Kompendium

Kniha řadí útoky deepfakem mezi techniky poškození reputace a identity: [EA-2.3.7 Deepfake
personální](@/kompendium/techniques/ea-2-3-7-deepfake-personalni.md) popisuje cílený útok na
konkrétního člověka, [EA-9.2.1 Deepfake
personality](@/kompendium/techniques/ea-9-2-1-deepfake-personality.md) syntetickou personu.
Filozofické důsledky pro epistemologii svědectví rozebírá oddíl [7. Teoretické
reflexe](@/kompendium/07-teoreticke-reflexe/_index.md), kolektivní rozměr heslo [epistemic
security](@/glossary/epistemic-security.md); zařazení odpovídá tomu, že doložené škody míří
na konkrétní osoby, ne na obsah tvrzení (Ajder a kol., 2019).

Vlastním přínosem knihy je zařazení deepfaku do taxonomie útoků na jednotlivce vedle technik,
které s technologií nemají nic společného: z hlediska oběti je padělané video jedním z mnoha
způsobů, jak jí vzít možnost být považována za zdroj pravdy o vlastním životě (*interpretace
knihy*, navazující na Fricker, 2007). Souvislost s echo komorami, které padělek rozšíří
a zároveň znemožní jeho opravu, popsal Nguyen (Nguyen, 2020).

## Obrana a zotavení

Pro jednotlivce je nejúčinnější obranou ověření druhým, nezávislým kanálem a odstup u obsahu,
který vyvolává okamžitou reakci; Vaccari a Chadwick ukazují, že hlavní škodou je nejistota,
a tu snižuje právě dohledání původu, ne hlubší zkoumání záznamu (Vaccari a Chadwick, 2020).
Podrobněji k tomu vedou průvodci [Ověřování
tvrzení](@/kompendium/self-defense-guides/4-claim-verification.md) a [Rozpoznání obsahu
z AI](@/kompendium/self-defense-guides/40-ai-content-detection.md).

Pro postiženého zneužitím vlastní podoby je prvním krokem zajištění důkazů a právní pomoc;
Citronová zdůrazňuje, že rychlé a doložené podání je to, co v praxi rozhoduje o možnosti
nápravy (Citron, 2014). Zotavení má obvykle blíž k zotavení z pronásledování než z technické
nehody: pracuje se se studem, s hypervigilancí a s návratem do veřejného prostoru (srov.
[doxing](@/glossary/doxing.md)).

Pro organizace má smysl dvojí ověření u plateb a citlivých pokynů a výcvik, který učí
rozpoznávat kontext, ne artefakty; vzdělávací scénář [Detekce
deepfaků](@/kompendium/educational-scenarios/16-deepfake-detection.md) je na tomto rozlišení
postaven (Verdoliva, 2020).

## Meze pojmu a kritika

Pojem svádí k technologickému determinismu. Tvrzení o blízkém „konci důkazu“ nejsou doložena
a Fallis sám upozorňuje, že záznam byl vždy jen jedním z více zdrojů informace a že jeho
oslabení posiluje váhu ostatních – svědků, dokumentů, souvislostí (Fallis, 2021). Rini
podobně připouští, že společnosti si na nedůvěryhodnost nových médií historicky zvykly
a nové ověřovací praxe si vytvořily (Rini, 2020).

Druhou mezí je nerovnoměrné zaměření pozornosti: veřejná debata se soustředí na politické
padělky, zatímco doložená většina škod je intimní a soukromá (Ajder a kol., 2019). Kniha
proto bere deepfake především jako techniku proti konkrétnímu člověku, a teprve potom jako
hrozbu pro veřejnou debatu.

## Literatura

- Ajder, H., Patrini, G., Cavalli, F., & Cullen, L. (2019). *The State of Deepfakes: Landscape, Threats, and Impact*. Deeptrace.
- Baudrillard, J. (1981). *Simulacres et simulation*. Galilée.
- Chesney, R., & Citron, D. K. (2019). *Deep Fakes: A Looming Challenge for Privacy, Democracy, and National Security*. California Law Review.
- Citron, D. K. (2014). *Hate Crimes in Cyberspace*. Harvard University Press.
- Fallis, D. (2021). *The Epistemic Threat of Deepfakes*. Philosophy & Technology.
- Fricker, M. (2007). *Epistemic Injustice: Power and the Ethics of Knowing*. Oxford University Press.
- Goodfellow, I., et al. (2014). *Generative Adversarial Networks*. Advances in Neural Information Processing Systems.
- Nguyen, C. T. (2020). *Echo chambers and epistemic bubbles*. Episteme.
- Rini, R. (2020). *Deepfakes and the Epistemic Backstop*. Philosophers' Imprint.
- Vaccari, C., & Chadwick, A. (2020). *Deepfakes and Disinformation: Exploring the Impact of Synthetic Political Video on Deception, Uncertainty, and Trust in News*. Social Media + Society.
- Verdoliva, L. (2020). *Media Forensics and DeepFakes: An Overview*. IEEE Journal of Selected Topics in Signal Processing.

## Související

**Pojmy**

- [Epistemic security](@/glossary/epistemic-security.md) – obor, který studuje systémové hrozby pro kolektivní poznávání.
- [Info-Ops](@/glossary/info-ops.md) – informační operace, jejichž nástrojem deepfake bývá.
- [Firehose of Falsehood](@/glossary/firehose-of-falsehood.md) – zaplavení prostoru, první cesta účinku.
- [Hyperreality](@/glossary/hyperreality.md) – Baudrillardův rámec, k němuž kniha pojem vztahuje.
- [Delegitimizace](@/glossary/delegitimizace.md) – dynamika dividendy lháře.
- [Testimoniální nespravedlnost](@/glossary/testimonialni-nespravedlnost.md) – nerovné rozložení škody.
- [Skepticismus](@/glossary/skepticismus.md) – odlišení zdravé pochybnosti od paušální nedůvěry.
- [Doxing](@/glossary/doxing.md) – příbuzný útok na osobu mimo rovinu obsahu.

**Techniky a obrana**

- [EA-2.3.7 Deepfake personální](@/kompendium/techniques/ea-2-3-7-deepfake-personalni.md) – cílený útok na osobu.
- [Detekce deepfaků](@/kompendium/educational-scenarios/16-deepfake-detection.md) – vzdělávací scénář.
- [Ověřování tvrzení](@/kompendium/self-defense-guides/4-claim-verification.md) – obrana ověřením původu.
- [7. Teoretické reflexe](@/kompendium/07-teoreticke-reflexe/_index.md) – epistemologie svědectví.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: deepfake](@/kompendium/glossary-bridges/bridge-deepfake.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
