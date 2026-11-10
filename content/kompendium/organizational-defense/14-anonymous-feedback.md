+++
title = "Anonymní zpětná vazba"
description = "Bez skutečně anonymního kanálu lidé problém s nadřízeným nenahlásí. Kapitola popisuje technickou anonymitu, prahy agregace, rozdíl mezi anonymitou a důvěrností a meze kanálu."
weight = 140

[taxonomies]
tags = ["kompendium", "organizational-defense", "hr-culture"]
categories = ["academic", "organizational", "governance"]

[extra]
related_terms = ["4-whistleblower-mechanism", "6-ombudsman-role", "13-exit-interview-EA", "15-culture-survey-EA"]
toc = true
+++

# Anonymní zpětná vazba

> **Pilíř:** Lidé a kultura · **Oddíl:** [Organizační obrana](@/kompendium/organizational-defense/_index.md)

Lidé v závislém postavení – podřízení, studenti, pacienti, mladší kolegové – se o problémech s
tím, na kom závisí, vyjadřují jen tehdy, když nehrozí, že budou poznáni. Milliken, Morrison a
Hewlin (2003) se v rozhovorech se zaměstnanci ptali, o čem mlčí a proč, a nejčastějšími důvody
byly obava, že budou vnímáni negativně, a strach z poškození vztahů a z odvety. Anonymní kanál
zpětné vazby je proto nástrojem, který zachytí slabé signály dřív, než přerostou v krizi.
Funguje však jen tehdy, když je anonymita skutečná, a ne jen slíbená.

## Původ pojmu a teoretický rámec

Výzkum organizačního mlčení (Morrison a Milliken, 2000) popsal, jak se v organizaci vytváří
sdílené přesvědčení, že mluvit o problémech je marné nebo nebezpečné, a jak toto přesvědčení
brání tomu, aby se informace dostaly k těm, kdo rozhodují. Detert a Burris (2007) ukázali, že
ochota zaměstnanců ozvat se závisí především na tom, jak se k hlasu staví jejich přímý vedoucí,
tedy zda je skutečně otevřený a zda zaměstnanec věří, že se ozvat je bezpečné. Anonymní kanál
je odpovědí na situaci, kdy tato důvěra chybí: obchází vztah, v němž je hlas riskantní.

Druhou teoretickou linií je výzkum anonymizace dat. Sweeney (2002) formalizovala požadavek
k-anonymity, podle něhož má být každý záznam nerozlišitelný od nejméně k − 1 dalších záznamů
podle údajů, které lze propojit s jinými zdroji, a ukázala, že zdánlivě neutrální kombinace
údajů (věk, pohlaví, místo) často identifikuje konkrétního člověka. Narayanan a Shmatikov
(2008) doložili, že i rozsáhlé „anonymizované“ soubory lze znovu identifikovat porovnáním s
jinými daty, a Ohm (2010) z toho vyvodil, že slib anonymity je často slibem, který nelze
dodržet. Kniha tyto poznatky přenáší na malé organizační jednotky, kde je riziko identifikace
autora mnohem vyšší než ve velkých datových souborech.

## Riziko v daném prostředí

Ve firmě je typickým selháním „anonymní“ průzkum rozesílaný firemním e-mailem s individuálními
odkazy. Na univerzitě jde o studentská hodnocení výuky, z nichž lze v malém semináři snadno
poznat autora podle stylu nebo detailu; Sweeney (2002) by takovou situaci popsala jako soubor s
velmi malým k. Ve škole jde o dotazníky pro žáky, které vyhodnocuje sám hodnocený učitel, a v
nemocnici o systémy hlášení nežádoucích událostí, které sice umožňují anonymitu, ale v malém
oddělení je autor zřejmý.

V malé neziskové organizaci je anonymita téměř nedosažitelná. Riziko je dvojí: lidé buď
nemluví, nebo mluví a jsou identifikováni, a druhá možnost organizaci poškodí dlouhodobě,
protože všichni ostatní se poučí. Morrison a Milliken (2000) popisují právě tento mechanismus:
zkušenost jednoho člověka s odvetou se rychle stává sdíleným přesvědčením celé skupiny.

## Strukturální zranitelnosti

První zranitelností je kanál, který provozuje IT nebo HR organizace se záznamy přístupů (IP
adresy, časy, účty). Už samotné vědomí, že přístupy mohou být sledovány, působí podobně jako
dohled, který Foucault (1975) popsal na modelu [panoptika](@/glossary/panopticism.md): člověk
se chová, jako by byl pozorován, i když pozorován není. Druhou zranitelností jsou výsledky
zobrazované pro malé skupiny, z nichž lze autora odvodit, a třetí otevřené odpovědi s detaily,
podle nichž je autor poznatelný (Sweeney, 2002).

Čtvrtou zranitelností je hodnocený, který má přístup k surovým odpovědím, a pátou kanál, na
jehož podnět nelze reagovat, protože s anonymním autorem nelze komunikovat. Poslední
zranitelnost vede k tomu, že podněty zůstávají bez odezvy a lidé dojdou k závěru, že mluvit je
marné, což je druhý hlavní důvod mlčení vedle strachu (Milliken, Morrison a Hewlin, 2003).

## Ochranné struktury

Základní ochranou je externí provozovatel, u něhož organizace technicky nemá přístup k
identifikačním údajům. Druhou je práh agregace: výsledky se zobrazují jen pro skupiny s
dostatečným počtem odpovědí, například deset a více, a menší skupiny se slučují; jde o
praktické uplatnění k-anonymity (Sweeney, 2002). Třetí je anonymizace otevřených odpovědí třetí
stranou před předáním, tedy odstranění jmen, dat a míst, a čtvrtá možnost obousměrné anonymní
komunikace, například kód, pod nímž se autor může vrátit k odpovědi.

Pátou ochranou je jasné rozlišení pojmů. Anonymita znamená, že identitu nezná nikdo; důvěrnost
znamená, že ji zná jen určená osoba, která ji chrání. Vnitřní oznamovací systém podle zákona č.
171/2023 Sb., o ochraně oznamovatelů, pracuje zpravidla s důvěrností; přijímání anonymních
oznámení zákon neukládá. Rozdíl má i rozměr ochrany dat: obecné nařízení o ochraně osobních
údajů se podle svého odůvodnění nevztahuje na skutečně anonymní informace, zatímco
pseudonymizované údaje zůstávají osobními údaji (Evropský parlament a Rada EU, 2016).

## Role a odpovědnosti

HR vlastní kanál a jeho pravidla, externí provozovatel zajišťuje technickou anonymitu. Analytik
agreguje podněty a hledá vzorce. Vedení odpovídá za reakci a za zveřejnění, co se s podněty
stalo, protože viditelná reakce je nejsilnějším protilékem na přesvědčení, že mluvit je marné
(Morrison a Milliken, 2000).
[Ombudsman](@/kompendium/organizational-defense/6-ombudsman-role.md) může pomáhat interpretovat
podněty bez identifikace autorů. Hodnocení vedoucí nemají přístup k surovým datům svých týmů.

## Politiky a postupy

Pravidla kanálu stanoví, co je anonymní a co důvěrné a kdo vidí jaká data, dále práh agregace a
pravidlo slučování malých skupin. Postup vyřizování podnětů zahrnuje kategorizaci, hledání
vzorců, předání k prověření a odpověď. Kaptein (2011) ukázal, že etická kultura organizace
ovlivňuje, zda zaměstnanci na pozorované pochybení reagují vnitřním hlášením, nebo mlčením či
vnějším oznámením, a jasná pravidla kanálu jsou jednou z jejích viditelných složek.

Organizace výslovně zakazuje pátrání po identitě autora a jeho porušení je kázeňským
proviněním. Pravidelně zveřejňuje souhrn: kolik podnětů přišlo, jakých typů a jaká opatření z
nich vzešla. Kanál je propojen s
[kulturním průzkumem](@/kompendium/organizational-defense/15-culture-survey-EA.md) a s
[exit interview](@/kompendium/organizational-defense/13-exit-interview-EA.md) pro triangulaci,
protože jednotlivý zdroj dat má vždy vlastní slepá místa (Detert a Burris, 2007, ukazují, že
ochota mluvit se liší podle vedoucího; kniha z toho vyvozuje, že srovnání zdrojů pomáhá odlišit
tichý tým od spokojeného).

## Vzdělávání a trénink

Zaměstnanci mají vědět, jak kanál funguje a proč je bezpečný; nejpřesvědčivější je nezávislé
ověření (audit provozovatele) a viditelné reakce na podněty (Milliken, Morrison a Hewlin, 2003,
uvádějí pocit marnosti mezi hlavními důvody mlčení). Vedoucí se učí přijímat anonymní kritiku
bez pátrání po autorovi a bez „kolektivního trestu“ týmu.

Analytici potřebují umět rozlišit vzorec od jednotlivého podnětu a vědět, že anonymní kanál
může být zneužit ke koordinované kampani proti jednotlivci
([koordinace davu](@/kompendium/techniques/ea-2-3-4-mob-coordination.md)). Leymann (1996)
popsal mobbing na pracovišti jako soustavné nepřátelské jednání jedné nebo více osob zaměřené
na jednotlivce, a anonymní kanál se může stát jedním z jeho nástrojů. Znaky takové kampaně –
podobné formulace, časové shluky, tvrzení bez ověřitelných detailů – nejsou důkazem, ale
důvodem k opatrnosti; kniha je řadí ke znakům
[pattern evidence](@/glossary/pattern-evidence.md), které je třeba číst oběma směry, tedy jako
vzorec problému i jako vzorec kampaně.

## Řešení incidentu

Podnět s vážným obsahem (šikana, ohrožení bezpečnosti) se předá k prověření bez identifikace
autora. Prověření se opírá o další zdroje: vzorce v datech, rozhovory s celým týmem, dokumenty.
Pokud se podnět týká jednotlivce, má dotčený právo se vyjádřit, protože anonymní tvrzení samo o
sobě nestačí k sankci; zásada vyslechnout obě strany platí i tam, kde zdroj podnětu zůstává
skrytý. Autor se přes anonymní kód dozví, že se věc řeší, a tím se oslabuje přesvědčení o
marnosti hlasu (Morrison a Milliken, 2000).

Jako anonymizovaný kompozit může posloužit městský úřad, kde anonymní podněty z jednoho útvaru
opakovaně popisovaly, že vedoucí ponižuje zaměstnance na poradách a mění zápis. Prověření
nevycházelo z podnětů samotných, ale z porovnání zápisů s nahrávkami a z rozhovorů se všemi
členy týmu. Teprve tento souběh zdrojů umožnil opatření. Kniha v tom vidí obecné pravidlo:
anonymní kanál ukazuje, kam se dívat, ale důkaz vzniká jinde. Morrison a Milliken (2000) navíc
upozorňují, že vedení má sklon číst mlčení jako souhlas, takže útvar bez podnětů může být
stejně problémový jako útvar, odkud podněty přicházejí.

## Ochrana dotčené osoby

Ochrana autora spočívá v tom, že identita není technicky dostupná a že pátrání po ní je
zakázáno; Ohm (2010) upozornil, že právo i praxe spoléhají na anonymizaci víc, než unese, a
kniha z toho vyvozuje, že slib anonymity, který nelze technicky dodržet, je horší než otevřené
přiznání, že jde jen o důvěrnost. Ochrana osoby, na kterou podnět míří, spočívá v tom, že
anonymní tvrzení se ověřuje, nesdílí se jako fakt a dotčený má právo se vyjádřit. Pokud se
ukáže, že kanál byl použit k cílené kampani, je třeba chránit i jejího adresáta, protože i to
je forma [poškození pověsti](@/kompendium/forensic-legal/14-defamation-EA.md).

## Vyhodnocení a indikátory selhání

O selhání svědčí „anonymní“ průzkum přes firemní e-mail, sledování přístupů a malé skupiny
umožňující identifikaci (Sweeney, 2002). Dalšími indikátory jsou málo podnětů nebo podněty jen
pozitivní, pátrání po autorovi nebo kolektivní tlak na tým po podnětu a lidé, kteří v průzkumu
uvádějí, že kanálu nevěří. Měří se míra důvěry v anonymitu, počet a typy podnětů, podíl podnětů
s reakcí a doba reakce; nízký počet podnětů je třeba číst opatrně, protože může znamenat zdravé
prostředí i hluboké mlčení (Morrison a Milliken, 2000).

## Meze a otevřené otázky

Anonymita chrání autora, ale ztěžuje ověření a dialog. V malých kolektivech je téměř
nedosažitelná a je poctivější nabídnout důvěrnost u externí osoby; výzkum znovuidentifikace
(Narayanan a Shmatikov, 2008) ukazuje, že s rostoucím množstvím propojitelných údajů se
anonymita stává spíše mírou rizika než vlastností dat. Anonymní kanál nenahradí kulturu, v níž
lze mluvit otevřeně; je přechodným nástrojem, ne cílem, a organizace, která se na něj spoléhá
trvale, přiznává, že otevřený hlas je u ní riskantní (Detert a Burris, 2007). Otevřené zůstává,
jak vyvážit ochranu autora a spravedlnost vůči osobě, na kterou podnět míří.

## Literatura

- Detert, J. R., a Burris, E. R. (2007). Leadership behavior and employee voice: Is the door
  really open? *Academy of Management Journal*, 50(4), 869–884.
- Evropský parlament a Rada EU (2016).
  *Nařízení (EU) 2016/679 o ochraně fyzických osob v souvislosti se zpracováním osobních údajů a o volném pohybu těchto údajů (obecné nařízení o ochraně osobních údajů)*.
  Úřední věstník Evropské unie.
- Foucault, M. (1975). *Surveiller et punir: Naissance de la prison*. Gallimard.
- Kaptein, M. (2011). From inaction to external whistleblowing: The influence of the ethical
  culture of organizations on employee responses to observed wrongdoing.
  *Journal of Business Ethics*, 98(3), 513–530.
- Leymann, H. (1996). The content and development of mobbing at work.
  *European Journal of Work and Organizational Psychology*, 5(2), 165–184.
- Milliken, F. J., Morrison, E. W., a Hewlin, P. F. (2003). An exploratory study of employee
  silence: Issues that employees don't communicate upward and why.
  *Journal of Management Studies*, 40(6), 1453–1476.
- Morrison, E. W., a Milliken, F. J. (2000). Organizational silence: A barrier to change and
  development in a pluralistic world. *Academy of Management Review*, 25(4), 706–725.
- Narayanan, A., a Shmatikov, V. (2008). Robust de-anonymization of large sparse datasets. In
  *Proceedings of the 2008 IEEE Symposium on Security and Privacy* (s. 111–125). IEEE.
- Ohm, P. (2010). Broken promises of privacy: Responding to the surprising failure of
  anonymization. *UCLA Law Review*, 57, 1701–1777.
- Sweeney, L. (2002). k-anonymity: A model for protecting privacy.
  *International Journal of Uncertainty, Fuzziness and Knowledge-Based Systems*, 10(5),
  557–570.

## Související

**Sesterské kapitoly**

- [Mechanismus oznamovatelů](@/kompendium/organizational-defense/4-whistleblower-mechanism.md)
  – formální kanál pro protiprávní jednání.
- [Role ombudsmana](@/kompendium/organizational-defense/6-ombudsman-role.md) – důvěrný osobní
  kanál.
- [Kulturní průzkum s EA detekcí](@/kompendium/organizational-defense/15-culture-survey-EA.md)
  – strukturovaný sběr dat.
- [Psychologická bezpečnost](@/kompendium/organizational-defense/16-psychological-safety.md) –
  cíl, k němuž anonymní kanál vede.

**Kritika a etika**

- [Důvěrnost v EA detekci](@/kompendium/critical-perspectives/17-confidentiality-EA.md) – etika
  zacházení s důvěrnými údaji.
-
  [Riziko falešně pozitivních detekcí](@/kompendium/critical-perspectives/5-false-positive-risk.md)
  – proč anonymní tvrzení vyžaduje ověření.
- [Panopticism](@/glossary/panopticism.md) – dohled, který umlčuje i bez pozorování.

**Techniky**

- [EA-2.3.4 Mob Coordination](@/kompendium/techniques/ea-2-3-4-mob-coordination.md) – zneužití
  kanálu ke kampani.
