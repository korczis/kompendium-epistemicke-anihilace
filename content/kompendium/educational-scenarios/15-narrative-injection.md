+++
title = "Vzdělávací scénář: Injekce narativu"
date = 2026-04-26
description = "Totožné fráze od různých účtů v obecní diskusi: extrahovat jazykové markery, časové korelace a síť odkazů a odlišit připravený narativ od přirozeného ohlasu."
weight = 100
draft = false

[taxonomies]
tags = ["kompendium", "educational-scenario", "intermediate", "narativ"]

[extra]
level = "Intermediate"
type = "educational-scenario"
+++

# Vzdělávací scénář: Injekce narativu

> **Úroveň**: Intermediate
> **Učební cíl**: Rozpoznat infiltraci připraveného narativu do veřejné diskuse
> **Doporučená délka**: 120 minut (práce s datovým souborem)
> **Pro koho**: moderátoři diskusí, analytici, pracovníci samospráv, výzkumníci veřejného mínění

Narativ není jednotlivé tvrzení, ale **rámec, který určuje, jak se o věci mluví**: kdo je oběť,
kdo viník, co je „zdravý rozum“ a co je „[propaganda](@/glossary/propaganda.md)“. Rámcování
přitom nepůsobí tím, že by lhalo, ale tím, co vybírá do popředí a co nechává mimo zorné pole, a
tak předurčuje závěr ještě dříve, než začne spor o fakta (Entman, 1993). Injekce narativu znamená,
že takový rámec vstupuje do diskuse zvenčí, připravený a ve více kopiích, a tváří se jako spontánní
názor místních lidí. Účinek nespočívá v přesvědčení jednotlivce, ale ve vytvoření dojmu, že „takhle
to vidí všichni“ – tedy v [pseudo-konsenzu](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md).
Scénář navazuje na [mediální smečku](@/kompendium/educational-scenarios/14-media-mob-recognition.md)
a zaměřuje se na textovou a časovou stopu.

## Učební cíle a jejich zdůvodnění

Cvičení směřuje k tomu, aby účastník z diskuse extrahoval opakující se fráze, rámce a argumentační
šablony, propojil jazykové markery s časovými údaji a metadaty účtů a zmapoval, na jaké zdroje
komentáře odkazují a zda se odkazy sbíhají. Zaměření na dojem jednomyslnosti je zvoleno proto, že
hlavní silou injektovaného narativu je zdánlivý konsenzus: jakmile se zdá, že převládá jeden názor,
lidé s odlišným míněním se stahují do mlčení a zdánlivá většina se sama posiluje, i kdyby byla ve
skutečnosti menšinou (Noelle-Neumann, 1984). Dalším cílem je odlišit připravený narativ od
přirozeného šíření úspěšné formulace v komunitě a navrhnout reakci moderátora, která chrání diskusi
a nepoškodí skutečné občany.

## Scénář

Fiktivní obec projednává záměr postavit na okraji katastru solární park a na obecním webu je
otevřená diskuse. Moderátorka si všimne změny: během tří dnů přibylo přes čtyři sta komentářů,
zatímco dříve jich bývalo kolem dvaceti týdně. Týmy dostanou anonymizovaný export (text, čas,
přezdívka, datum registrace účtu, uvedené odkazy) a při práci najdou několik nápadných rysů.
Jedenašedesát komentářů obsahuje frázi „nikdo se nás neptal, rozhodli to za nás v Praze“, často
i s toutéž interpunkcí, a to v jinak různorodých textech; tři argumentační šablony – zdraví, ceny
pozemků a „cizí investor“ – se střídají v pevném pořadí; velká část komentářů vznikla ve dvou
časových oknech po přibližně čtyřiceti minutách; sedmdesát procent účtů bylo registrováno
v posledních deseti dnech a nikdy předtím nediskutovalo; odkazy vedou převážně na dva weby bez
tiráže, které vznikly v posledním měsíci. Vedle toho existuje skupina starších účtů místních lidí,
jejichž obavy jsou věcné, rozdílné a často převzaly jednu z frází prostě proto, že se jim „líbila“.
Úkolem je rozhodnout, co z toho svědčí o připravené kampani a co o přirozeném ohlasu. Právě
kombinace mladých účtů, časových shluků a sbíhajících se odkazů je typickým otiskem
poloautomatizovaných sítí, jejichž odhalení z metadat je samo samostatným výzkumným problémem
(Ferrara et al., 2016).

## Jak se vzorec pozná

Nejsilnějším markerem je lexikální otisk, tedy shodné fráze včetně chyb a interpunkce u údajně
nezávislých autorů
([signatura injekce narativu](@/kompendium/detection-signatures/22-network-narrative-injection.md)),
doplněný o šablonu argumentace se stejným pořadím argumentů a stejnou stavbou odstavců. Druhým jsou
časové shluky, tedy komentáře v krátkých oknech neodpovídajících běžnému rytmu diskuse, spolu
s mladými účty bez historie ([EA-9.4.3 Sock Puppet Network](@/kompendium/techniques/ea-9-4-3-sock-puppet-network.md));
koordinaci tohoto typu dnes umožňují i poloautomatizované sítě účtů, jejichž rozpoznání je samo
předmětem výzkumu (Ferrara et al., 2016). Třetím markerem jsou sbíhající se odkazy (mnoho komentářů,
málo zdrojů, zdroje bez autora) a posun rámce, kdy se debata přesouvá od solárního parku k „nám“
proti „nim“ ([posun rámování](@/kompendium/detection-signatures/4-linguistic-framing-shift.md));
právě budování rámce „my versus oni“ pomocí opakovaných jazykových vzorců je klasickým nástrojem
politického rámcování (Lakoff, 2004). Posledním vodítkem je syntetická variabilita, kdy se texty
liší povrchně, ale ne obsahem – možný otisk
[syntetického textu](@/kompendium/techniques/ea-9-2-3-synthetic-text-narrative.md). Žádný marker
sám o sobě není důkaz; síla závěru plyne ze sbíhání nezávislých indicií, jak zdůrazňuje rámec
informačního nepořádku, který odlišuje obsah, tvůrce a způsob šíření (Wardle & Derakhshan, 2017).

## Odlišení připraveného narativu od přirozeného ohlasu

Místního občana, který převzal úspěšnou frázi, poznáme od účtu zapojeného do kampaně podle historie
(starší účet, jiná témata), variability (fráze je zasazena do vlastního textu) a interakce (reaguje
na protiargumenty). Přirozené šíření formulace je normální součástí komunikace; sdílený příběh
komunity se tak tvoří i bez manipulace. Zásadní je, že odhalení kampaně nemění nic na legitimitě
věcných obav místních lidí – naopak, jednou z největších škod koordinované injekce je, že skutečné
hlasy po jejím odhalení snadno zapadnou jako „boti“, čímž se umlčí právě ti, jejichž účast je
autentická. Tím se spirála mlčení uzavírá podruhé, zvenčí (Noelle-Neumann, 1984). Odlišení je proto
nejen analytický, ale i etický úkol: označit nesouhlasné hlasy za boty je samo epistemickým útokem.
Hypotéza o injekci se považuje za vyvrácenou, pokud se ukáže, že nové účty patří obyvatelům
registrovaným po společné schůzi a odkazované weby provozuje dohledatelný místní spolek.

## Obrana a zotavení

Moderátorka chrání diskusi tím, že zveřejní její pravidla (ověření bydliště pro hlasování, nikoli
pro komentování), shrne věcné argumenty obou stran a oddělí diskusi od rozhodování; kontraproduktivní
je naopak hromadné mazání, veřejné obvinění konkrétních lidí nebo uzavření diskuse. Smyslem obrany
není zvítězit v jednotlivém sporu, ale obnovit podmínky, za nichž je skutečný rozptyl názorů opět
viditelný, protože injektovaný narativ škodí hlavně tím, že falešně zužuje spektrum toho, co se zdá
přijatelné říci (Entman, 1993). Zotavení komunity spočívá ve [správě narativu](@/kompendium/self-defense-guides/41-narrative-stewardship.md)
– v trpělivém obnovování důvěry a v tom, že se autentickým, byť menšinovým hlasům vrátí váha. Je
také třeba dbát na bezpečnost dat, protože export obsahuje osobní údaje a vyžaduje anonymizaci a
omezený přístup.

## Debriefing pro facilitátora

Facilitátor nechá týmy prezentovat nejsilnější a nejslabší marker, který našly, a zaměří se na
skupinu starších účtů: kolik týmů je omylem zařadilo do kampaně? Tato chyba je nejpoučnější, protože
ukazuje, jak snadno se obrana zvrhne v nové umlčování. Je třeba hlídat čtyři časté chyby: nálepku
„boti“ na nesouhlasné hlasy, spoléhání na jediný marker, hodnocení obsahu sporu (zda je solární
park dobrý nápad) místo struktury šíření a opomenutí bezpečnosti dat. Facilitátor uzavře otázkou,
jak by se skuteční občané cítili, kdyby je moderátorka označila za součást kampaně, a připomene,
že opakování téže formulace samo zvyšuje její vnímanou pravdivost bez ohledu na pravdivostní
hodnotu, takže i poctivý účastník může šířit cizí rámec nevědomky (Fazio et al., 2015).

## Meze a otevřené otázky

Scénář pracuje s relativně čitelným souborem; reálné exporty bývají neúplné, metadata účtů lze
falšovat a hranice mezi organickým a koordinovaným šířením je často nerozhodnutelná. Otevřenou
otázkou zůstává, jak nastavit moderaci tak, aby omezila vliv koordinovaných účtů, a přitom
nevylučovala nové, autentické účastníky, kteří se k tématu připojili poprvé. Diskutovat je rovněž
třeba rostoucí roli jazykových modelů, které dokážou vytvořit povrchně rozmanité, ale obsahově
jednotné texty, čímž oslabují spolehlivost lexikálního otisku jako markeru a posouvají těžiště
analýzy od obsahu ke způsobu šíření a k tvůrci, jak doporučuje rámec informačního nepořádku
(Wardle & Derakhshan, 2017).

## Literatura

- Entman, R. M. (1993). Framing: Toward Clarification of a Fractured Paradigm. *Journal of Communication*, 43(4).
- Fazio, L. K., Brashier, N. M., Payne, B. K., & Marsh, E. J. (2015). Knowledge Does Not Protect Against Illusory Truth. *Journal of Experimental Psychology: General*, 144(5).
- Ferrara, E., Varol, O., Davis, C., Menczer, F., & Flammini, A. (2016). The Rise of Social Bots. *Communications of the ACM*, 59(7).
- Lakoff, G. (2004). *Don't Think of an Elephant! Know Your Values and Frame the Debate*. Chelsea Green.
- Noelle-Neumann, E. (1984). *The Spiral of Silence: Public Opinion – Our Social Skin*. University of Chicago Press.
- Wardle, C., & Derakhshan, H. (2017). *Information Disorder: Toward an Interdisciplinary Framework for Research and Policy Making*. Council of Europe.

## Související

**Navazující scénáře**

- [Rozpoznání mediální smečky](@/kompendium/educational-scenarios/14-media-mob-recognition.md) – mediální vrstva téhož jevu.
- [Koordinace botů](@/kompendium/educational-scenarios/17-bot-coordination.md) – kvantitativní analýza účtů.
- [Emergentní vzorec](@/kompendium/educational-scenarios/29-emergent-pattern.md) – vzorce viditelné až v agregaci.

**Techniky**

- [EA-9.4.6 Mass Comment Coordination](@/kompendium/techniques/ea-9-4-6-mass-comment-coordination.md) – hromadné koordinované komentáře.
- [EA-9.1.5 LLM Narrative Injection](@/kompendium/techniques/ea-9-1-5-llm-narrative-injection.md) – narativ generovaný jazykovým modelem.

**Detekční signatury**

- [Injekce narativu](@/kompendium/detection-signatures/22-network-narrative-injection.md) – kritéria a validace.
- [Sémantická eroze](@/kompendium/detection-signatures/8-linguistic-semantic-erosion.md) – posun významu klíčových slov.

**Sebe-obrana a teorie**

- [Správa narativu](@/kompendium/self-defense-guides/41-narrative-stewardship.md) – jak chránit vlastní příběh komunity.
- [Wardle: typologie dezinformací](@/kompendium/07-teoreticke-reflexe/wardle-disinformation-typology.md) – rámec pro třídění.
- [Info-ops](@/glossary/info-ops.md) – širší kontext informačních operací.
