+++
title = "Due diligence: narativní válka kolem firem a transakcí"
description = "Reputační kampaně, obrácení viny vůči kritikům a soupeřící příběhy kolem firem: jak je odlišit od oprávněné kritiky a jak se v nich rozhodovat podle doložených faktů."
weight = 140

[taxonomies]
tags = ["kompendium", "cross-domain", "due-diligence"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["7-ea-osint-narrative-injection", "12-ea-dd-counterparty-manipulation", "22-ea-security-incident-response-narrative", "16-ea-dd-confirmation-bias-prevention"]
toc = true
+++

Kolem firem, transakcí a jejich představitelů se vedou spory nejen u soudů a na trzích,
ale i v příbězích: kdo je inovátor a kdo podvodník, kdo je oběť útoku a kdo útočník, kdo
je whistleblower a kdo zahořklý bývalý zaměstnanec. Tyto příběhy ovlivňují investory,
regulátory, zákazníky i prověřovatele. Pro [due diligence](@/glossary/due-diligence.md) je klíčové, že **v narativní válce
mohou obě strany lhát, obě mohou mít pravdu v něčem a příběh s větším objemem nemusí být
ten pravdivý**. Kniha popisuje, jak se u jednotlivce ztrácí schopnost odlišit vlastní vnímání
od cizího výkladu; v narativní válce hrozí prověřovateli totéž.

## Doména a problém

Narativní válka zahrnuje koordinované reputační kampaně proti konkurentům, „černé PR“,
kampaně spekulantů sázejících na pokles akcií, i obranné kampaně firem proti kritice.
Někdy jde o čistou manipulaci, jindy o oprávněné odhalení šířené agresivně. Zvlášť poučný
je případ Wirecardu: novinové články Financial Times, které od roku 2015 upozorňovaly
na nesrovnalosti, byly firmou i částí veřejnosti odbývány jako útok spekulantů; německý
finanční regulátor BaFin v roce 2019 dočasně zakázal krátké prodeje akcií Wirecardu a
podal trestní oznámení na novináře. V červnu 2020 firma přiznala, že vykázaná hotovost
ve výši 1,9 miliardy eur pravděpodobně neexistuje. Kritika se ukázala jako oprávněná
a narativ „útoku na úspěšnou firmu“ jako obrana podvodu.

Opačné případy existují také: koordinované kampaně, které šíří nepravdivá obvinění proti
firmám kvůli zisku z poklesu jejich akcií, jsou předmětem regulace manipulace s trhem.
Prověřovatel proto nemůže vyjít z předpokladu, že kritik má vždy pravdu, ani z předpokladu,
že každá kampaň je útok. Musí hodnotit jednotlivá tvrzení podle doložení.

Rid (2020) v historii dezinformací upozorňuje, že nejúčinnější operace kombinují pravdivé
a nepravdivé prvky, protože pravdivé detaily zvyšují věrohodnost celku. To platí i pro
reputační kampaně: dokument, který je pravý, může být použit v kontextu, který mu dává
nepravdivý význam.

## Průnik s epistemickou anihilací

Kniha popisuje [DARVO](@/glossary/darvo.md) – popření, útok a obrácení role oběti
a pachatele – jako vzorec, který se objevuje u osob konfrontovaných s jejich jednáním.
Na úrovni organizací má stejnou strukturu: firma, která čelí oprávněné kritice, ji
popře, zaútočí na kritiky a představí se jako oběť kampaně. Vzorec popsala Freydová (1997)
u jednotlivců; jeho přítomnost u organizace není důkazem viny, ale důvodem zbystřit.
Kniha jej rozvádí ve [vzdělávacím scénáři rozpoznání DARVO](@/kompendium/educational-scenarios/20-darvo-recognition.md).

Druhým průnikem je [pseudo-kontroverze](@/kompendium/techniques/ea-2-3-5-pseudo-kontroverze-amplifikace.md):
vytvoření dojmu, že o faktech „existují dva názory“, i když jeden je doložen a druhý ne.
Pro prověřovatele to znamená riziko [falešné ekvivalence](@/kompendium/techniques/ea-1-2-2-falesna-ekvivalence.md)
– dát stejnou váhu doloženému tvrzení a jeho popření jen proto, že obojí zaznívá hlasitě.

## Rozpoznávací znaky

Při hodnocení narativního sporu je užitečné sledovat, **zda strany odpovídají na konkrétní
tvrzení**, nebo na osoby (útok na motiv kritika místo vyvrácení jeho tvrzení); **zda
existují nezávislé doklady** pro tvrzení obou stran; **kdo má z příběhu prospěch** a zda
je to zveřejněno; **jak se příběh vyvíjí** – zda se upřesňuje s novými fakty, nebo mění
podle potřeby; a **zda se objevují znaky koordinace** (viz [injekce narativu](@/kompendium/cross-domain/7-ea-osint-narrative-injection.md)).
Varovným znakem je i **institucionální podpora jedné strany** bez vlastního šetření – jak
ukázal postup regulátora v případě Wirecardu.

## Rámec: právo, standardy a odpovědnost

Nařízení (EU) č. 596/2014 o zneužívání trhu zakazuje manipulaci s trhem, včetně šíření
nepravdivých nebo zavádějících informací, které ovlivňují cenu finančních nástrojů. Ochrana
dobré pověsti právnických osob a pomluva jsou upraveny občanským a trestním právem (viz
[Pomluva v EA kontextu](@/kompendium/forensic-legal/14-defamation-EA.md)). Ochranu
oznamovatelů upravuje směrnice (EU) 2019/1937 a v Česku zákon č. 171/2023 Sb., o ochraně
oznamovatelů (viz [Mechanismus oznamovatelů](@/kompendium/organizational-defense/4-whistleblower-mechanism.md)).

## Ochranná opatření

Pro prověřovatele je nejdůležitější **rozložit spor na jednotlivá tvrzení** a každé hodnotit
podle doložení, nezávisle na tom, kdo ho vyslovil. Dále **oddělit fakta od motivů**: to,
že kritik má finanční zájem, nevyvrací jeho tvrzení; to, že firma je úspěšná, nevyvrací
kritiku. Třetím opatřením je **hledat nezávislé ověření** u klíčových tvrzení (banky,
auditoři, zákazníci, úřední záznamy). Čtvrtým je **sledovat vývoj příběhu v čase** a
zaznamenávat, které předpovědi kterých stran se naplnily. Pátým je **vnitřní [red team](@/glossary/red-team.md)**,
který zastává pozici opačnou k převládajícímu dojmu (viz [prevence konfirmačního zkreslení](@/kompendium/cross-domain/16-ea-dd-confirmation-bias-prevention.md)).

Organizace, která je sama terčem kampaně, by měla odpovídat věcně a doložitelně, nikoli
útokem na kritiky – i proto, že útok na kritiky je jedním ze znaků, podle nichž ji okolí
bude hodnotit. Organizační postupy popisuje [PR obrana narativu](@/kompendium/organizational-defense/34-PR-narrative-defense.md).

## Lidský rozměr a zotavení

V narativních válkách jsou lidé na obou stranách: novináři a oznamovatelé, kteří čelí
žalobám a obtěžování, i zaměstnanci a představitelé firem, kteří čelí nepravdivým obviněním.
Obě skupiny popisují izolaci, ztrátu důvěry okolí a pochybnosti o vlastním úsudku – zvlášť
když proti nim stojí instituce s autoritou. Kniha tyto zkušenosti rozvádí v kazuistice
[mediální mob](@/kompendium/case-studies/04-medialni-mob-attack.md); pro oznamovatele je
klíčová institucionální ochrana a sociální opora.

## Přesah do dalších oborů

Narativní válka se odehrává i ve vědě (spory o škodlivost látek, v nichž zájmové skupiny
financují zpochybňování; Oreskesová a Conway 2010), v politice, ve sportu (dopingové kauzy,
v nichž se kritici označují za zrádce) a v náboženských a jiných skupinách, kde bývalí
členové a vedení vedou protichůdné příběhy. Ve všech případech platí stejné pravidlo:
hodnotit tvrzení, ne hlasitost; ptát se po dokladech, ne po loajalitě.

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Fond zvažuje investici do rychle rostoucí firmy.
Ve stejné době se objeví zpráva skupiny analytiků, kteří sázejí na pokles jejích akcií,
s tvrzením, že tržby v jedné zemi jsou fiktivní. Firma zprávu označí za útok spekulantů
a podá žalobu. Fond spor rozloží: tvrzení o fiktivních tržbách lze ověřit u odběratelů
a z bankovních potvrzení. Firma ověření odmítne „z důvodu žaloby“. Fond investici
odloží a čeká na nezávislý audit. Ten po několika měsících potvrdí část tvrzení
analytiků a vyvrátí jinou část.

Fond tak nevsadil ani na jeden příběh. Rozhodl se podle toho, co šlo ověřit, a tam,
kde ověření nebylo možné, považoval odmítnutí ověření za informaci samu o sobě.

## Meze a otevřené otázky

Rozlišit oprávněnou kritiku od kampaně je v reálném čase často nemožné; pravda se ukáže
až později. Otevřenou otázkou je, jak by měli regulátoři a média postupovat, aby
neposilovali stranu s větší mocí, a jak chránit kritiky před tím, aby je narativ „útoku“
umlčel dřív, než se fakta ověří. Případ Wirecardu ukazuje, že instituce, které měly
nezávisle ověřovat, převzaly příběh silnější strany; prověrky by proto měly výslovně
počítat s tím, že ani autorita regulátora či auditora není náhradou za vlastní ověření
klíčových tvrzení.

## Literatura

- Freyd, J. J. (1997). Violations of power, adaptive blindness, and [betrayal trauma](@/glossary/betrayal-trauma.md) theory.
- Oreskes, N., Conway, E. M. (2010). *Merchants of Doubt.*
- Rid, T. (2020). *Active Measures: The Secret History of Disinformation and Political Warfare.*
- Nařízení (EU) č. 596/2014 o zneužívání trhu; směrnice (EU) 2019/1937; zákon č. 171/2023 Sb., o ochraně oznamovatelů.

## Související

**Mezioborové mosty**

- [Injekce narativu](@/kompendium/cross-domain/7-ea-osint-narrative-injection.md) – vkládání příběhů.
- [Manipulace ze strany protistrany](@/kompendium/cross-domain/12-ea-dd-counterparty-manipulation.md) – obrana podvodu.
- [Narativ při reakci na incident](@/kompendium/cross-domain/22-ea-security-incident-response-narrative.md) – komunikace pod tlakem.

**Techniky a scénáře**

- [EA-1.2.2 Falešná ekvivalence](@/kompendium/techniques/ea-1-2-2-falesna-ekvivalence.md) – dvě strany, nestejné doložení.
- [Vzdělávací scénář: rozpoznání DARVO](@/kompendium/educational-scenarios/20-darvo-recognition.md) – nácvik.

**Organizace a právo**

- [Mechanismus oznamovatelů](@/kompendium/organizational-defense/4-whistleblower-mechanism.md) – ochrana kritiků uvnitř.
- [PR obrana narativu](@/kompendium/organizational-defense/34-PR-narrative-defense.md) – věcná obrana organizace.

**Pojmy**

- [DARVO](@/glossary/darvo.md) – obrácení role oběti a pachatele.
