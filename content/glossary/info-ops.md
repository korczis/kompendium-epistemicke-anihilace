+++
title = "Info-Ops (informační operace)"
weight = 60

description = "Vojenské a zpravodajské informační operace, které spojují psychologické, klamné, kybernetické a elektronické prostředky k ovlivnění vnímání a rozhodování protivníka."

[taxonomies]
tags = ["glossary", "security", "epistemic", "kompendium", "propaganda"]

[extra]
category = "security"
related_terms = ["epistemic-security", "firehose-of-falsehood", "deepfake", "deplatforming", "epistemicka-anihilace", "delegitimizace"]
author = "Tomáš Korcak (korczis)"
date_created = "2026-04-25"
date_modified = "2026-11-10"
keywords = ["information operations", "info-ops", "psyops", "cyber operations", "military doctrine", "hybrid warfare", "PSYOP"]
see_also = ["kompendium", "philosophy", "decisions"]
image = "/images/sections/glossary.png"
image_alt = "Info-Ops – glosář"
+++

## Definice

**Informační operace** (*information operations*, Info-Ops, IO) jsou doktrinální kategorie
armád a zpravodajských služeb pro integrované nasazení prostředků, jimiž se má ovlivnit,
narušit nebo převzít rozhodování protivníka při současné ochraně rozhodování vlastního.
Americká společná publikace *Joint Publication 3-13* k tomuto účelu vymezuje souhru
psychologických operací, vojenského klamání, bezpečnosti operací, elektronického boje
a operací v počítačových sítích (U.S. Joint Chiefs of Staff, 2014). Pojem je tedy především
organizační: neoznačuje jednu techniku, nýbrž způsob, jakým se techniky skládají a řídí.

Od civilní dezinformace se informační operace odlišují trojím způsobem. Mají k dispozici
zpravodajské rozpočty, stálé kádry a sběrnou infrastrukturu; jsou obvykle vázány na jinou,
nekomunikační činnost, které mají připravit prostředí; a probíhají v časovém horizontu let
až desetiletí, s průběžným budováním fiktivních person a zprostředkujících kanálů (Rid,
2020). Ruská doktrína informačního zápasu přitom spojuje mírový a válečný, vojenský a civilní
rozměr způsobem, který západní doktríny tradičně oddělovaly (Paul a Matthews, 2016).

## Původ a kontext pojmu

Předchůdcem dnešního pojmu jsou sovětská aktivní opatření, tedy soubor zpravodajských
činností od zakládání krycích organizací přes podvrhy dokumentů až po podporu zástupných
hlasů. Rid na archivním materiálu několika zpravodajských služeb doložil, že jde o kontinuální
praxi dvacátého století, nikoli o jev vzniklý s internetem, a že většina kampaní působila
pomaleji a nejistěji, než jak je popisovaly jejich vlastní zprávy o úspěchu (Rid, 2020).
Insiderský popis sovětské dezinformační práce z osmdesátých let podal zpravodajský důstojník,
který z ní odešel (Bittman, 1985). Historii v knize sledují stránky [sovětská aktivní
opatření](@/kompendium/historical-cases/21-soviet-active-measures.md) a [ruská
IRA](@/kompendium/historical-cases/22-russian-ira.md).

V tomto prostředí má zvláštní místo východoněmecká praxe rozkladu, *Zersetzung*, jejíž cílem
nebylo ovlivnit veřejnost, ale rozložit konkrétního člověka a jeho vztahy. Gieseke ji popisuje
jako posun od otevřené represe k nenápadnému působení, které mělo zůstat pro postiženého
nedoložitelné (Gieseke, 2014); kniha jí věnuje stránku
[Zersetzung](@/kompendium/historical-cases/5-east-german-zersetzung.md).

Pojmový rámec se po roce 2010 rozšířil do doktrín hybridní války a operací v šedé zóně, tedy
pod prahem ozbrojeného konfliktu. Hoffman tento posun popsal jako prolínání pravidelných
a nepravidelných způsobů boje u téhož aktéra (Hoffman, 2007). Souběžně vznikla komerční
nabídka: Bradshaw a Howard dokumentovali organizované kampaně na sociálních sítích v desítkách
zemí, vedené státními i najatými aktéry (Bradshaw a Howard, 2019).

## Jak se projevuje

Pozorovatelným znakem probíhající operace je koordinace bez přiznaného původce: skupina účtů
nebo kanálů, které se chovají jednotně, ale vystupují jako nezávislé hlasy. Starbird a kol.
ukázali, že v praxi jde často o práci rozloženou mezi placené aktéry a nevědomé účastníky,
takže hranice mezi kampaní a běžným provozem diskuse není ostrá (Starbird a kol., 2019).
Kniha tento znak vede jako [koordinované nepravé
chování](@/kompendium/techniques/ea-9-4-2-coordinated-inauthentic-behavior.md).

Druhým znakem je cesta narativu zdrojovou hierarchií: tvrzení se nejprve objeví v okrajovém
zdroji, pak je přeneseno zprostředkovatelem a nakonec citováno jako doložené v důvěryhodném
kanálu. Benkler a kol. na rozboru amerického mediálního ekosystému ukázali, že rozhodující
pro šíření není samotné vložení tvrzení, nýbrž ochota navazujících kanálů je převzít
(Benkler a kol., 2018). Jednotlivé kroky popisují signatury [vkládání
narativů](@/kompendium/detection-signatures/22-network-narrative-injection.md) a [praní
reputace](@/kompendium/detection-signatures/23-network-reputation-laundering.md).

Třetím znakem je souběh s nekomunikační událostí – volbami, vojenským pohybem, krizí – a útok
na důvěryhodnost institucí, které by kampaň mohly odhalit. Paul a Matthews popsali ruský model
jako vysokoobjemový, mnohokanálový, rychlý a nedbající na vnitřní rozpory, protože jeho cílem
není přesvědčit o jedné verzi, ale snížit důvěru v možnost rozhodnout (Paul a Matthews, 2016);
kniha jej vede jako [Firehose of Falsehood](@/glossary/firehose-of-falsehood.md).

## Mechanismus

Strukturně působí informační operace na třech úrovních současně. Na úrovni obsahu dodávají
tvrzení; na úrovni zdrojů vytvářejí nebo kompromitují kanály, které tvrzení nesou; a na úrovni
rozhodování útočí na schopnost rozlišit zdroj od obsahu. Benkler a kol. z toho vyvozují, že
obrana postavená jen na opravě jednotlivých tvrzení je nedostatečná, protože nechává nedotčenou
strukturu, jež tvrzení legitimizuje (Benkler a kol., 2018).

Druhým strukturním rysem je vytrvalost. Operace se neposuzuje jediným výstupem, ale
investicí do infrastruktury person, vztahů a archivů, kterou lze použít opakovaně; proto je
podle Rida užitečnější hodnotit ji podle nákladů, které si vybudovala, než podle dopadu
jednotlivé kampaně (Rid, 2020). *Interpretace knihy*: pro model hrozby to znamená, že
informační operace tvoří strop schopností protivníka – obrana, která obstojí proti nim,
obstojí i proti menším aktérům, kdežto obrana postavená na amatérské hrozbě se pod touto
úrovní rozpadá.

Pokud jde o účinek, je literatura výrazně opatrnější než veřejná debata. Bail a kol. na
vzorku amerických uživatelů nenašli měřitelnou změnu postojů ani chování v souvislosti
s mírou vystavení obsahu ruské agentury (Bail a kol., 2020) a Eady a kol. došli k témuž
výsledku na jiném vzorku a s jinou metodou, přičemž zároveň zjistili, že vystavení bylo
silně koncentrováno do malé části uživatelů (Eady a kol., 2023). Tvrzení o přímém ovlivnění
voleb proto nelze z těchto dat opřít; dobře doložené je působení na nákladech obrany, na
důvěře v instituce a na cílených jednotlivcích.

## Odlišení

Od [propagandy](@/glossary/propaganda.md) se informační operace liší tím, že propaganda je
jednou z jejich složek, zatímco celek zahrnuje i klamání, bezpečnost vlastních informací
a technické operace (U.S. Joint Chiefs of Staff, 2014). Od veřejné diplomacie se liší
skrytostí původce: otevřeně přiznané šíření vlastního pohledu není operací vlivu, i když
sleduje státní zájem (Rid, 2020).

Od [OSINT](@/glossary/osint.md) se liší směrem činnosti – sběr informací z otevřených zdrojů
je zpravodajská a obranná práce, ne působení na protivníka. Od běžné komerční manipulace
trhem se liší pobídkou: komerční kampaň sleduje zisk a končí s ním, kdežto státní operace
může být roky nerentabilní a přesto pokračovat (Bradshaw a Howard, 2019).

Od spontánní polarizace je nutné odlišit situaci, kdy se tatáž tvrzení šíří bez
koordinovaného původce. Benkler a kol. upozorňují, že domácí mediální dynamika může vytvořit
stejný výsledek jako zahraniční operace, a že připisovat vše vnějšímu aktérovi je samostatná
chyba s vlastními politickými důsledky (Benkler a kol., 2018).

## Právní a etický rámec

Protiopatření proti odhaleným operacím se pohybují mezi dvěma riziky. Odstraňování účtů
a obsahu soukromými platformami je rychlé, ale probíhá bez soudního přezkumu a může zasáhnout
legitimní mluvčí; kniha tento nástroj vede v hesle
[Deplatforming](@/glossary/deplatforming.md). Bradshaw a Howard dokládají, že mnohé kampaně
vedou domácí aktéři proti vlastní veřejnosti, takže zásah nelze rámovat jen jako obranu proti
vnějšímu protivníkovi (Bradshaw a Howard, 2019).

Druhým rizikem je zrcadlení. Odpověď stejnými prostředky poškozuje právě to, co má být
chráněno, totiž možnost rozhodovat na základě dostupných dokladů; Rid popisuje opakovaný
historický vzorec, v němž se dezinformační praxe obrátila proti vlastní službě i proti vlastní
veřejnosti (Rid, 2020). Pro oběti cílených kampaní – novináře, aktivisty, oznamovatele – je
podstatná institucionální podpora, ne individuální čelení (Starbird a kol., 2019); kniha k tomu
vede [protokol pro novináře](@/kompendium/techniques/ea-6-4-9-novinari-protokol.md).

## Obrana a zotavení

Na úrovni společnosti je nejlépe doloženým opatřením posílení institucí, které tvrzení ověřují,
a mediální gramotnost zaměřená na posuzování zdrojů, ne obsahu (Benkler a kol., 2018). Kniha
k tomu vede stránky [mediální
gramotnost](@/kompendium/prevention-resilience/6-media-literacy-prevention.md) a [regulace
platforem](@/kompendium/population-health/25-platform-regulation-EA.md).

Na úrovni organizace jde o sledování vkládání narativů a o ověřování zdrojů křížovou
triangulací, tedy porovnáním více zdrojů, které jsou na sobě skutečně nezávislé; samotná
rozmanitost zdrojů nestačí, protože koordinovaná síť rozmanitost napodobí (Starbird a kol.,
2019). Postupy popisují stránky [obrana proti
dezinformacím](@/kompendium/cross-domain/19-ea-security-disinformation-defense.md)
a [křížová triangulace](@/kompendium/cross-domain/8-ea-osint-cross-source-triangulation.md).

Na úrovni jednotlivce je účinné odložení hodnocení, ochrana vlastního digitálního prostoru
a u cílených osob rozdělení zátěže mezi více lidí. Paul a Matthews upozorňují, že proti
vysokoobjemovému modelu nefunguje symetrická odpověď, nýbrž snížení jeho dosahu a rychlá,
důvěryhodná korekce u dotčené skupiny (Paul a Matthews, 2016); návod vede stránka [digitální
hygiena](@/kompendium/prevention-resilience/7-digital-hygiene-prevention.md).

## Meze a kritika pojmu

Pojem má dvě slabá místa. První je přisouzení: identifikace původce vychází z technických
a zpravodajských indicií, které bývají nejisté, a ochota přisoudit kampaň státu se liší podle
politického kontextu (Rid, 2020). Druhým je sklon pojmu k nadhodnocení účinku; experimentální
i observační studie vystavení kampaním opakovaně nenacházejí měřitelnou změnu postojů, zatímco
veřejná debata jim přisuzuje rozhodující vliv (Eady a kol., 2023).

Pro knihu z toho plyne zdrženlivost: informační operace jsou realistickým protivníkem, podle
něhož má smysl navrhovat architekturu obrany, ale nejsou vysvětlením každého názorového posunu
(*interpretace knihy*); k témuž výsledku postačí i domácí mediální dynamika (Benkler a kol.,
2018). Oborový rámec, v němž jsou hlavní vnější hrozbou, vede heslo
[Epistemic Security](@/glossary/epistemic-security.md).

## Literatura

- Bail, C. A., et al. (2020). *Assessing the Russian Internet Research Agency's impact on the political attitudes and behaviors of American Twitter users in late 2017*. PNAS.
- Benkler, Y., Faris, R., & Roberts, H. (2018). *Network Propaganda: Manipulation, Disinformation, and Radicalization in American Politics*. Oxford University Press.
- Bittman, L. (1985). *The KGB and Soviet Disinformation: An Insider's View*. Pergamon-Brassey's.
- Bradshaw, S., & Howard, P. N. (2019). *The Global Disinformation Order: 2019 Global Inventory of Organised Social Media Manipulation*. Oxford Internet Institute.
- Eady, G., et al. (2023). *Exposure to the Russian Internet Research Agency foreign influence campaign on Twitter in the 2016 US election and its relationship to attitudes and voting behavior*. Nature Communications.
- Gieseke, J. (2014). *The History of the Stasi: East Germany's Secret Police, 1945–1990*. Berghahn Books.
- Hoffman, F. G. (2007). *Conflict in the 21st Century: The Rise of Hybrid Wars*. Potomac Institute for Policy Studies.
- Paul, C., & Matthews, M. (2016). *The Russian „Firehose of Falsehood“ Propaganda Model*. RAND Corporation.
- Rid, T. (2020). *Active Measures: The Secret History of Disinformation and Political Warfare*. Farrar, Straus and Giroux.
- Starbird, K., Arif, A., & Wilson, T. (2019). *Disinformation as collaborative work: Surfacing the participatory nature of strategic information operations*. Proceedings of the ACM on Human-Computer Interaction.
- U.S. Joint Chiefs of Staff (2014). *Joint Publication 3-13: Information Operations*.

## Související

**Pojmy**

- [Epistemic Security](@/glossary/epistemic-security.md) – oborový rámec, v němž jsou IO hlavní vnější hrozbou.
- [Firehose of Falsehood](@/glossary/firehose-of-falsehood.md) – doktrinální model vysokého objemu.
- [Deepfake](@/glossary/deepfake.md) – schopnost začleňovaná do operací.
- [Deplatforming](@/glossary/deplatforming.md) – zásah proti odhalené operaci a jeho rizika.
- [Delegitimizace](@/glossary/delegitimizace.md) – častý cíl operací.
- [Propaganda](@/glossary/propaganda.md) – jedna ze složek.
- [OSINT](@/glossary/osint.md) – sběr z otevřených zdrojů, který se s IO plete.

**Kniha**

- [Sovětská aktivní opatření](@/kompendium/historical-cases/21-soviet-active-measures.md) – historický předchůdce.
- [Ruská IRA](@/kompendium/historical-cases/22-russian-ira.md) – doložená kampaň.
- [Zersetzung](@/kompendium/historical-cases/5-east-german-zersetzung.md) – rozklad mířený na jednotlivce.
- [Obrana proti dezinformacím](@/kompendium/cross-domain/19-ea-security-disinformation-defense.md) – organizační obrana.
- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) – ústřední pojem Kompendia.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: info-ops](@/kompendium/glossary-bridges/bridge-info-ops.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
