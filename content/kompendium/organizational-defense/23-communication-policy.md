+++
title = "Komunikační politika"
description = "Neformální a mizející kanály umožňují obejít formální záznam i kontrolu. Kapitola popisuje, co musí jít auditovatelným kanálem, uchovávání, oficiální kanály vůči dětem a soukromí lidí."
weight = 230

[taxonomies]
tags = ["kompendium", "organizational-defense", "operational"]
categories = ["academic", "organizational", "governance"]

[extra]
related_terms = ["21-decision-traceability", "22-meeting-structure", "24-documentation-standards", "27-information-classification"]
toc = true
+++

# Komunikační politika

> **Pilíř:** Provoz · **Oddíl:** [Organizační obrana](@/kompendium/organizational-defense/_index.md)

Komunikační politika určuje, kterými kanály organizace komunikuje, co se zaznamenává a jak
dlouho se to uchovává. Na první pohled jde o technickou otázku. Ve skutečnosti rozhoduje o
tom, zda bude možné zpětně zjistit, co kdo komu řekl. Klíčová rozhodnutí v telefonátech,
pokyny ve zprávách, které po týdnu zmizí, a věta „to jsme řešili na obědě“ vytvářejí prostor,
v němž lze dodatečně tvrdit cokoli – a v němž se těžko brání ten, komu se nevěří.

## Riziko v daném prostředí

Ve firmě se rozhodnutí a pokyny přesouvají do soukromých chatů a mizejících zpráv, mimo
archiv. Ve veřejné správě platí povinnosti spisové služby (zákon č. 499/2004 Sb., o
archivnictví a spisové službě) a právo veřejnosti na informace; obcházení přes soukromé
kanály tak oslabuje i veřejnou kontrolu. Ve škole je komunikační politika ochranou dětí:
komunikace pedagogů s žáky má probíhat oficiálními kanály, protože soukromá komunikace je
typickým prostředím [groomingu](@/glossary/child-grooming.md). V nemocnici jde o sdílení
údajů o pacientech v neoficiálních aplikacích. Ve výzkumu o pokyny k datům, které nejsou
nikde zapsány. V neziskové organizaci a médiích o pokyny vedení, které „nikdy nepadly“.

## Strukturální zranitelnosti

- Neexistuje pravidlo, které komunikace musí jít auditovatelným kanálem.
- Mizející zprávy a soukromé účty se používají pro pracovní pokyny.
- Retence je nastavena tak, že záznamy zmizí dřív, než je lze potřebovat.
- Klíčoví lidé nejsou v kopii; informace se předává selektivně
  ([asymetrické odhalování](@/kompendium/detection-signatures/15-behavioral-asymmetric-disclosure.md)).
- Archivy nejsou prohledávatelné, takže záznam „existuje“, ale nelze ho najít.

## Ochranné struktury

- Seznam typů komunikace, které musí jít auditovatelným kanálem (pracovní e-mail, systém
  úkolů, spisová služba): rozhodnutí, pokyny, schválení výjimek, hodnocení, komunikace s
  dětmi a pacienty, komunikace s dodavateli o zakázkách.
- Pravidlo „potvrzení písemně“: ústní pokyn se do stanovené doby potvrdí písemně.
- Politika uchovávání s dobou podle typu záznamu, souladná s právem (archivnictví, ochrana
  osobních údajů, účetnictví) a s blokací mazání při sporu nebo šetření.
- Zákaz mizejících zpráv pro pracovní pokyny a rozhodnutí.
- Prohledávatelný archiv s řízeným přístupem.
- Hranice vůči soukromí: zákoník práce (zákon č. 262/2006 Sb.) a GDPR omezují, jak smí
  zaměstnavatel kontrolovat komunikaci zaměstnanců; politika chrání záznam, nikoli plošné
  sledování.

## Role a odpovědnosti

Vedení odpovídá za to, že samo dodržuje pravidla – politika, kterou porušuje nejvyšší
vedení, neplatí pro nikoho. IT zajišťuje technické nastavení retence a archivu. Pověřenec
pro ochranu osobních údajů posuzuje soulad. Compliance kontroluje dodržování. Každý
zaměstnanec odpovídá za to, že pracovní pokyn, který dostal neoficiálním kanálem, potvrdí
oficiálně.

## Politiky a postupy

1. Komunikační politika s rozdělením kanálů a typů komunikace.
2. Postup při ústních a neformálních pokynech (potvrzení e-mailem nebo v systému).
3. Retenční plán a postup blokace mazání (legal hold).
4. Pravidla pro komunikaci s dětmi, pacienty a jinými zranitelnými osobami.
5. Pravidla pro oficiální komunikaci navenek – navazuje na
   [PR obranu narativu](@/kompendium/organizational-defense/34-PR-narrative-defense.md).
6. Vazba na [klasifikaci informací](@/kompendium/organizational-defense/27-information-classification.md).

## Vzdělávání a trénink

Zaměstnanci se učí, proč je písemné potvrzení ochranou i pro ně, a jak ho formulovat
nekonfliktně („Abych to měl správně: dohodli jsme se, že…“). Vedoucí se učí, že
požadavek „to nepiš“ je varovný signál, a to i když ho sami vyslovují z pohodlnosti. Ve
školách pedagogové procházejí pravidly komunikace s žáky a rodiči. Pro všechny je užitečné
vědět, jak si vést vlastní pracovní poznámky.

## Řešení incidentu

Zjistí-li se, že klíčová komunikace probíhala mimo auditovatelné kanály nebo byla smazána:

1. Okamžitě vyhlásit blokaci mazání pro dotčené osoby a systémy.
2. Zajistit dostupné záznamy u všech účastníků a dokumentovat, co chybí – viz
   [uchování důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md).
3. Rekonstruovat komunikaci z nepřímých stop (kalendáře, odpovědi, poznámky).
4. Posoudit, zda šlo o nedbalost, nebo o úmysl; úmyslné ničení záznamů při šetření je
   vážné porušení.

**Příklad (anonymizovaný kompozit).** Při šetření stížností na vedoucího ve veřejné instituci
se ukázalo, že všechny pokyny dával jen telefonicky a v aplikaci s mizejícími zprávami.
Podřízení si však vedli poznámky a někteří posílali potvrzující e-maily. Souběh těchto
záznamů umožnil rekonstruovat vzorec, který vedoucí popíral.

## Ochrana dotčené osoby

Zaměstnanec, který žádá písemné potvrzení pokynu nebo upozorní na mazání záznamů, nesmí být
označen za nedůvěřivého nebo nelojálního. Pokud upozorní na ničení záznamů v souvislosti s
protiprávním jednáním, může být chráněn podle zákona č. 171/2023 Sb. Člověk, jehož slovo
stojí proti slovu nadřízeného bez záznamu, se ocitá v situaci, kdy se mu nevěří; vlastní
záznamy mu pomáhají udržet si důvěru ve vlastní paměť (srov.
[paměťový archiv](@/kompendium/self-defense-guides/43-memory-archive.md)).

## Vyhodnocení a indikátory selhání

- Klíčová rozhodnutí v telefonátech, mizející zprávy, „to jsme řešili na obědě“.
- Retence maže záznamy dřív, než mohou být potřeba.
- Vedení pravidla nedodržuje.
- Při šetření chybí záznamy právě z rozhodných období.

## Meze a otevřené otázky

Ne všechno lze a má být zaznamenáno; lidé potřebují prostor pro neformální rozhovor a
soukromí. Nadměrné zaznamenávání může vést k chladné, obranné komunikaci. Otevřené zůstává,
jak zacházet s automatickými přepisy online jednání a s nástroji umělé inteligence, které
komunikaci shrnují – shrnutí není záznam.

## Související

**Sesterské kapitoly**

- [Sledovatelnost rozhodnutí](@/kompendium/organizational-defense/21-decision-traceability.md)
  – záznamy rozhodnutí.
- [Struktura jednání](@/kompendium/organizational-defense/22-meeting-structure.md) –
  formální místo rozhodování.
- [Dokumentační standardy](@/kompendium/organizational-defense/24-documentation-standards.md)
  – kam záznamy patří.
- [Klasifikace informací](@/kompendium/organizational-defense/27-information-classification.md)
  – citlivost komunikace.

**Forenzní praxe**

- [Uchování důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md) – blokace
  mazání a zajištění.
- [Protokoly nahrávání](@/kompendium/forensic-legal/36-recording-protocols.md) – kdy a jak
  nahrávat.

**Pojmy a sebe-obrana**

- [Child grooming](@/glossary/child-grooming.md) – proč je oficiální kanál ochranou dětí.
- [Sebe-obrana: Paměťový archiv](@/kompendium/self-defense-guides/43-memory-archive.md) –
  vlastní záznamy.
