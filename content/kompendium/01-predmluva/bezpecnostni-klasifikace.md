+++
title = "1.5 Bezpečnostní klasifikace přístupu"
description = "Detailní specifikace čtyř přístupových úrovní L1–L4, prerekvizit, výcviku, supervizních požadavků, audit mechanismů, eskalačních procedur a incident response."
weight = 5
insert_anchor_links = "right"

[taxonomies]
tags = ["kompendium", "predmluva", "bezpecnost", "klasifikace", "pristupove-urovne", "audit", "incident-response"]
categories = ["academic", "security"]

[extra]
related_terms = ["eticke-aspekty", "jak-pouzivat", "pro-koho-je-urceno"]
section_icon = "🔐"
toc = true
+++

# 1.5 Bezpečnostní klasifikace přístupu

Kniha rozlišuje čtyři úrovně, L1 až L4, podle toho, komu je která její část psaná a jakou supervizi
její použití předpokládá; postup čtení po úrovních popisuje
[Jak kompendium používat](@/kompendium/01-predmluva/jak-pouzivat.md). **Žádná certifikace, kurz, registr ani řízení přístupu k těmto úrovním
neexistují.** Nikdo úroveň neuděluje ani neodebírá.

Dřívější verze této kapitoly uváděla povinné kurzy v hodinách, dohodu o důvěrnosti, zkoušku před
etickou komisí, suspenzní karanténu a mezinárodní registr porušení. Nic z toho neexistovalo a je to
odsud odstraněno; jak se takové údaje do knihy dostaly, popisuje kapitola
[Odkud kniha pochází](@/kompendium/01-predmluva/vztah-k-platforme.md) a hranice, v nichž se s
materiálem pracuje, [etické aspekty](@/kompendium/01-predmluva/eticke-aspekty.md).

## K čemu rozlišení slouží

Vrstvení je kompromis mezi dvěma polohami, které obě selhávají: neomezený přístup přehlíží, že totéž
porozumění je použitelné útočně, a úplný zákaz spolu s rizikem odstraní i obrannou kapacitu, pro
kterou kniha vznikla. Miller a Selgelid (2007) ukazují na biomedicínském výzkumu, že ani jedna
krajní pozice není udržitelná a že volba je vždy mezi nedokonalými režimy.

Rozlišení tedy neříká, kdo smí číst, ale pro koho byla která část napsána, a tedy čí výcvik a čí
supervize dávají jejímu použití smysl. Beauchamp a Childress (2019) odvozují požadavek supervize
z principu neškodit: čím větší je potenciál zásahu uškodit, tím slabší je důvod nechávat rozhodnutí
na jediném člověku.

Supervize přitom není formalita. Herman (1992) popisuje u práce s traumatem přenos na terapeuta jako
pravidelný jev, nikoli jako selhání, a vyvozuje z toho, že klinik potřebuje vlastní oporu — tedy
přesně to, co sloupec supervize v tabulce níž pojmenovává.

## Přehled úrovní

| Úroveň | Komu je část psaná | Co pokrývá | Jakou supervizi předpokládá |
|--------|--------------------|------------|------------------------------|
| **L1** | Postgraduální student, začínající badatel | Předmluva, úvod, základní kategorie, taxonomie | Garant studia nebo vedoucí práce |
| **L2** | Klinický psycholog nebo psychiatr s atestací | Klinické aplikace a intervenční postupy rodiny EA-6 | Profesní supervize v oboru |
| **L3** | Kognitivní rehabilitátor, forenzní specialista | Vulnerabilní skupiny a forenzní kontext | Etická komise instituce |
| **L4** | Bezpečnostní analytik, vedoucí výzkumu | Teoretické reflexe a nejpodrobnější popis útočné struktury | Nezávislý etický dohled mimo vlastní instituci |

Sloupec supervize není podmínkou přístupu, nýbrž popisem rámce pro bezpečnou práci.

U forenzního použití je rozdíl zásadní a kniha na něm trvá: její kategorie nejsou diagnostické
jednotky a nemají v posudku stát jako nález. Zagzebski (2012) rozlišuje autoritu, která nahrazuje
úsudek adresáta, od opory, která jeho úsudek posiluje — a taxonomie této knihy smí být jen tou druhou.
Jak se s ní pracuje, popisuje [Jak kompendium používat](@/kompendium/01-predmluva/jak-pouzivat.md).

## Odkud ta myšlenka je a co jí v praxi odpovídá

Vrstvení přístupu k poznání, které může uškodit, není nápad této knihy. Zpráva National Research
Council (2004) o biotechnologickém výzkumu v době terorismu zavedla pro vybrané pokusy institucionální
posouzení před publikací právě proto, že plošný zákaz i plošná otevřenost selhávají; její autoři
zdůraznili, že posuzovat lze návrh výzkumu, ne budoucí užití výsledku.

Rozdíl mezi takovým režimem a touto kapitolou je podstatný a patří k mezím, které vymezují
[etické aspekty](@/kompendium/01-predmluva/eticke-aspekty.md). Tam o přístupu rozhoduje instituce,
která za to nese odpovědnost; tady jde o doporučení autora uvnitř textu na veřejném webu. Kniha si
rozvrstvení vypůjčuje jako způsob, jak text uspořádat, ne jako nástroj kontroly — a kdyby ho za
nástroj kontroly vydávala, tvrdila by o sobě něco, co nemůže splnit (*interpretace knihy*).

## Námitka proti vrstvení vůbec

Proti celému rozlišení stojí vážná výtka a kniha ji nevyvrací. Vrstvit poznání o manipulaci znamená
rozhodovat, kdo je dost kvalifikovaný, aby rozuměl tomu, co se mu může dít. Fricker (2007) pojmenovává
mírnější podobu téhož jako hermeneutickou nespravedlnost: člověk nemá pojmy, jimiž by svou zkušenost
vyložil, protože mu je prostředí neposkytlo. Věta „tato část není pro tebe" se toho dopouští v malém,
a u čtenáře, který jev prožívá a atestaci nemá, nejvíc.

Kniha z toho vyvozuje dvě věci. Žádná část není zamčená, protože zamčená být nemůže. A obranné pasáže,
tedy rozpoznání a náprava, patří co nejníž: popis toho, co se člověku děje, nemá čekat na kvalifikaci.
Longino (1990) k tomu dodává důvod, který není etický, ale epistemický — poznání se opravuje tím, že
ho zkoumá víc lidí z víc pozic, takže zužování okruhu čtenářů zhoršuje i kvalitu textu samého.

Zbývající napětí je skutečné a nevyřešené, a je to právě to napětí, které Miller a Selgelid (2007)
popisují jako jádro dilematu dvojího užití: nejpodrobnější popis útočné struktury je zároveň nejlepší
obranný materiál. Kniha ho řeší tím, že nepopisuje postup, ne tím, že by popis komukoli odepřela;
hranici popisuje [etika popisu újmy](@/philosophy/boundary-ethics.md) a problém dvojího užití
pojmenovává heslo [dual-use poznání](@/glossary/dual-use-poznani.md).

## Když se čtenář nezařadí

Nejčastější případ není čtenář, který úroveň překročí, ale čtenář, který se do žádné nezařadí: člověk,
jehož se popisované jevy týkají osobně a který žádnou atestaci ani garanta nemá. Fricker (2007)
popisuje právě tuto pozici — ten, kdo zkušenost má, nemá postavení, z něhož by o ní platně mluvil. Pro ten případ kniha
nemá procedurální odpověď a předstírat ji nebude. Má jen věcnou: obranné části — rozpoznání, meze
kategorií, náprava — jsou psané tak, aby byly čitelné bez odborného rámce, zatímco intervenční
postupy jsou psané pro někoho, kdo je povede s oporou.

Herman (1992) k tomu dodává zjištění, které je pro tuto kapitolu určující: zotavení z traumatu
neprobíhá v izolaci a vnější vztah je jeho podmínkou, ne jeho příjemným doplňkem. Rozlišení úrovní
proto nemá čtenáře odrazovat od čtení, nýbrž ho nasměrovat k tomu, aby si k náročnějšímu materiálu
hledal někoho dalšího — a to i tehdy, když ten někdo není supervizor v odborném smyslu.

## Co klasifikace nezaručuje

Úroveň říká, pro koho je text psán, ne jak bude použit. Záměr doložit nelze.

Druhou mezí je vymahatelnost, a ta je nulová: kniha nemá jak zjistit, kdo ji čte. Kde dřívější verze
slibovala sankce, slibovala něco, co nemohla učinit. Ochrana oznamovatele, pokud se někdo rozhodne
zneužití ohlásit, není vlastností kompendia, nýbrž práva — v českém prostředí ji zakládá zákon
č. 171/2023 Sb., o ochraně oznamovatelů, provádějící směrnici (EU) 2019/1937.

Třetí mezí je sebeposouzení. Rozlišení funguje jen tak dobře, jak dobře čtenář odhadne vlastní
kontext, a právě tento odhad je u člověka vystaveného popisovaným jevům nejmíň spolehlivý; Herman
(1992) proto u této práce trvá na vnější oporě místo na vlastním úsudku.

## Literatura

- Beauchamp, T. L., & Childress, J. F. (2019). *Principles of Biomedical Ethics* (8. vyd.). New
  York: Oxford University Press.
- Fricker, M. (2007). *Epistemic Injustice: Power and the Ethics of Knowing*. Oxford: Oxford
  University Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Longino, H. E. (1990). *Science as Social Knowledge: Values and Objectivity in Scientific
  Inquiry*. Princeton: Princeton University Press.
- Miller, S., & Selgelid, M. J. (2007). Ethical and philosophical consideration of the dual-use
  dilemma in the biological sciences. *Science and Engineering Ethics*, 13(4).
- National Research Council (2004). *Biotechnology Research in an Age of Terrorism*. Washington,
  DC: The National Academies Press.
- Zagzebski, L. T. (2012). *Epistemic Authority: A Theory of Trust, Authority, and Autonomy in
  Belief*. New York: Oxford University Press.
- Zákon č. 171/2023 Sb., o ochraně oznamovatelů.
- Směrnice Evropského parlamentu a Rady (EU) 2019/1937 o ochraně osob, které oznamují porušení
  práva Unie.

## Související

- [Účel kompendia](@/kompendium/01-predmluva/ucel-kompendia.md)
- [Pro koho je určeno](@/kompendium/01-predmluva/pro-koho-je-urceno.md)
- [Etické aspekty a upozornění](@/kompendium/01-predmluva/eticke-aspekty.md)
- [Jak používat toto kompendium](@/kompendium/01-predmluva/jak-pouzivat.md)
- [Odkud kniha pochází](@/kompendium/01-predmluva/vztah-k-platforme.md)
- [Taxonomie EA](@/glossary/taxonomie-ea.md)
- [Dual-use poznání](@/glossary/dual-use-poznani.md)
- [Etika popisu újmy](@/philosophy/boundary-ethics.md)
