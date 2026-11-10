+++
title = "Doxing"
weight = 100
description = "Doxing jako zveřejnění identifikujících údajů o člověku proti jeho vůli: typy, vztah k soukromí a umlčování, rozpoznání, právní rámec a obrana."

[taxonomies]
tags = ["glossary", "manipulace", "digitalni-prostredi", "pravo", "kompendium"]

[extra]
category = "manipulace a kontrola"
related_terms = ["delegitimizace", "panopticism", "osint", "dual-use-poznani", "socialni-izolace", "epistemic-security"]
author = "Tomas Korcak (korczis)"
date_created = "2026-05-03"
date_modified = "2026-11-10"
+++

## Vymezení

Doxing (také doxxing) označuje záměrné veřejné odhalení identifikujících údajů o člověku,
například jména skrytého za pseudonymem, adresy bydliště, pracoviště nebo údajů o rodině,
bez jeho souhlasu a zpravidla s cílem vystavit ho tlaku, obtěžování nebo ohrožení. David
Douglas, který pojem podrobil soustavnému filozofickému rozboru, ho vymezuje jako záměrné
zveřejnění informací, které umožňují druhého identifikovat nebo lokalizovat, a odlišuje tři
jeho podoby podle toho, čeho má odhalení dosáhnout (Douglas, 2016).

Toto heslo se věnuje doxingu jako pojmu a jako jevu narušujícímu soukromí. Jeho zvláštní
podobu, kterou taxonomie kompendia vede jako delegitimizační techniku zaměřenou na
umlčení hlasu v odborné nebo veřejné debatě, zpracovává stránka
[EA-2.3.8 Doxxing epistemický](@/kompendium/techniques/ea-2-3-8-doxxing-epistemicky.md).
Pro knihu je doxing podstatný tím, že nepůsobí na obsah toho, co člověk říká, ale na jeho
bezpečí, a tím mu odnímá možnost se do sdílení poznání vůbec zapojit (Citron, 2014).

## Pojmová historie

Termín vznikl v hackerské subkultuře devadesátých let jako zkomolenina slova *documents* a
původně označoval odhalení skutečné identity soupeře skrytého za přezdívkou. S rozšířením
sociálních sítí se přenesl do běžné řeči a začal zahrnovat i shromáždění a zveřejnění
údajů, které jsou jednotlivě dostupné, ale dohromady umožňují člověka vyhledat (Douglas,
2016). Danielle Citronová zařadila doxing do širšího spektra online obtěžování a ukázala,
že jeho dopady dopadají nerovnoměrně, nejčastěji na ženy a menšiny, a že často vedou ke
stažení obětí z veřejného prostoru (Citron, 2014).

Teoretický rámec pro porozumění, proč doxing škodí i tehdy, když jsou údaje formálně
veřejné, nabízí pojetí soukromí jako kontextové integrity. Helen Nissenbaumová ukazuje, že
každý informační tok je vázán normami kontextu, v němž vznikl, a že přenesení údaje do
jiného kontextu může tyto normy porušit, i když údaj sám tajný není (Nissenbaum, 2010).
Daniel Solove ve své taxonomii narušení soukromí rozlišuje mimo jiné agregaci, identifikaci,
zveřejnění a vystavení, tedy právě ty operace, z nichž se doxing skládá (Solove, 2008).

## Mechanismus a pozorovatelné znaky

Douglas rozlišuje doxing deanonymizační, který odhaluje identitu skrytou za pseudonymem,
doxing zacílující, který zveřejňuje údaje umožňující člověka fyzicky vyhledat, a doxing
delegitimizující, který zveřejňuje soukromé informace s cílem zpochybnit jeho důvěryhodnost
nebo pověst (Douglas, 2016). Všechny tři podoby spojuje přesun informace z kontextu, v
němž byla bezpečná, do kontextu, kde se stává nástrojem tlaku, což odpovídá porušení
kontextové integrity v Nissenbaumově smyslu (Nissenbaum, 2010).

Pozorovatel rozpozná doxing podle několika znaků. Objevují se příspěvky, které shromažďují
osobní údaje o konkrétním člověku na jednom místě, často spolu s výzvou k reakci nebo s
náznakem, že „každý ví, kde ho najít“. Postižený dostává zprávy od neznámých lidí, kteří
zmiňují jeho soukromé okolnosti, a kontaktováni bývají i jeho zaměstnavatel nebo rodina.
Citronová popisuje, že takové útoky mají často kolektivní povahu a jejich účinek vyplývá z
počtu zúčastněných, nikoli z jednotlivého příspěvku (Citron, 2014).

Epistemický účinek doxingu spočívá v umlčení. Teorie spirály mlčení popisuje, jak obava z
izolace vede lidi k tomu, aby svůj názor nevyjadřovali, pokud se domnívají, že je v
menšině (Noelle-Neumann, 1974). Doxing tento mechanismus zesiluje tím, že obavu z izolace
nahrazuje obavou o bezpečí. Současně působí podobně jako
[panoptický dohled](@/glossary/panopticism.md): pouhé vědomí, že člověk může být kdykoli
identifikován, vede k sebecenzuře i u těch, kteří sami napadeni nebyli (Foucault, 1975).

## Odlišení od příbuzných jevů

Doxing je nutné odlišit od legitimního zveřejnění informací ve veřejném zájmu. Investigativní
novinářská práce, která odhaluje jednání osob ve veřejných funkcích, nebo zveřejnění
identity člověka, který se dopustil závažného jednání, se mohou pohybovat v blízkosti
doxingu, ale liší se účelem, přiměřeností a vztahem k veřejné roli dotčeného; Douglas proto
rozlišuje mezi doxingem, který lze ospravedlnit, a doxingem, který ospravedlnit nelze
(Douglas, 2016). Rozhodující je, zda zveřejněný údaj souvisí s veřejnou činností, nebo
slouží jen k tomu, aby člověka vystavil.

Odlišit je třeba také rešeršní práci s otevřenými zdroji. Metody [OSINT](@/glossary/osint.md)
slouží ověřování a prověrkám a samy o sobě doxingem nejsou; doxingem se stávají až tehdy,
když jejich výsledek míří ke zveřejnění s cílem člověka ohrozit. Jde o typický případ
[poznání dvojího užití](@/glossary/dual-use-poznani.md), u něhož o etice nerozhoduje
metoda, ale účel a kontext toku informace (Nissenbaum, 2010). U postiženého je třeba
odlišit oprávněnou obavu po skutečném doxingu od paranoidní symptomatiky; rozhodující je
doložitelnost zveřejnění, nikoli intenzita obavy (American Psychiatric Association, 2013).

## Klinický, právní a organizační rámec

Klinicky se doxing projevuje jako akutní stresová zátěž: hypervigilance, narušený spánek,
pocit ztráty kontroly nad vlastní identitou a stažení z veřejné komunikace. Hermanová
zdůrazňuje, že ztráta pocitu bezpečí je jádrem traumatické zkušenosti a že obnova bezpečí
předchází veškeré další práci (Herman, 1992). U lidí, jejichž práce je veřejná, se často
přidává profesní izolace.

Právní rámec v Česku poskytuje ochranu několika cestami. Obecné nařízení o ochraně osobních
údajů upravuje zpracování a zveřejňování osobních údajů (Evropský parlament a Rada Evropské
unie, 2016). Trestní zákoník, zákon č. 40/2009 Sb., zahrnuje mimo jiné neoprávněné
nakládání s osobními údaji a nebezpečné pronásledování, pokud zveřejnění vede k
opakovanému obtěžování nebo vyvolává důvodnou obavu o život či zdraví. Občanský zákoník,
zákon č. 89/2012 Sb., chrání osobnost člověka včetně soukromí a umožňuje domáhat se
zdržení zásahu a odčinění újmy. Organizace, jejichž zaměstnanci vystupují veřejně, mohou
doxingu předcházet jasnými postupy podpory a ochrany údajů (Citron, 2014).

## Obrana a zotavení

Pro postiženého je prvním krokem zajištění bezpečí, dokumentace zveřejněných údajů a
komunikace s časovými údaji a oznámení provozovatelům platforem, případně policii (Citron,
2014). Pomáhá informovat blízké a zaměstnavatele dříve, než je kontaktují útočníci, a
přesunout se dočasně do komunikace s menší veřejnou expozicí. Udržení vztahů a sdílení
zkušenosti s důvěryhodnými lidmi brání tomu, aby se doxing změnil v trvalou
[sociální izolaci](@/glossary/socialni-izolace.md) (Herman, 1992).

Profesionál by měl postiženého podpořit v tom, aby stažení z veřejného prostoru chápal jako
dočasné ochranné opatření, nikoli jako přiznání viny, a aby návrat do debaty plánoval
podle vlastního tempa. Na úrovni institucí je obranou vnitřní pravidlo, že útok na
zaměstnance se řeší jako bezpečnostní incident, nikoli jako jeho soukromý problém; tento
přístup rozvádí oddíl [epistemická bezpečnost](@/glossary/epistemic-security.md)
(Nissenbaum, 2010).

## Meze a otevřené otázky

Hranice mezi doxingem a legitimním zveřejněním ve veřejném zájmu není ostrá a závisí na
posouzení účelu a přiměřenosti, které se v jednotlivých případech liší (Douglas, 2016).
Empirické údaje o četnosti doxingu jsou omezené a obtížně srovnatelné, protože studie užívají
různé definice; toto heslo proto žádná čísla neuvádí. Otevřenou otázkou zůstává, jak
uplatnit kontextovou integritu v prostředí, kde se kontexty komunikace neustále prolínají a
kde agregaci údajů usnadňují automatizované nástroje (Nissenbaum, 2010).

## Literatura

- American Psychiatric Association. (2013). *Diagnostic and statistical manual of mental
  disorders* (5th ed.). American Psychiatric Publishing.
- Citron, D. K. (2014). *Hate crimes in cyberspace*. Harvard University Press.
- Douglas, D. M. (2016). Doxing: A conceptual analysis. *Ethics and Information Technology,
  18*(3), 199–210.
- Evropský parlament a Rada Evropské unie. (2016). Nařízení (EU) 2016/679 o ochraně fyzických
  osob v souvislosti se zpracováním osobních údajů a o volném pohybu těchto údajů (obecné
  nařízení o ochraně osobních údajů). *Úřední věstník Evropské unie*.
- Foucault, M. (1975). *Surveiller et punir: Naissance de la prison*. Gallimard.
- Herman, J. L. (1992). *Trauma and recovery*. Basic Books.
- Nissenbaum, H. (2010). *Privacy in context: Technology, policy, and the integrity of social
  life*. Stanford University Press.
- Noelle-Neumann, E. (1974). The spiral of silence: A theory of public opinion. *Journal of
  Communication, 24*(2), 43–51.
- Solove, D. J. (2008). *Understanding privacy*. Harvard University Press.

## Související

**Techniky a pojmy**

- [EA-2.3.8 Doxxing epistemický](@/kompendium/techniques/ea-2-3-8-doxxing-epistemicky.md) –
  hlavní zpracování doxingu jako delegitimizační techniky.
- [QR: EA-2.3.8 Doxxing](@/kompendium/quick-reference/qr-ea-2-3-8.md) – stručná referenční
  karta k rozpoznání.
- [Delegitimizace](@/glossary/delegitimizace.md) – širší vzorec, jemuž delegitimizující
  doxing slouží.
- [Panoptismus](@/glossary/panopticism.md) – sebecenzura vyvolaná vědomím možného dohledu.
- [OSINT](@/glossary/osint.md) – legitimní rešeršní praxe, od níž je doxing nutné odlišit.
- [Poznání dvojího užití](@/glossary/dual-use-poznani.md) – etika metod, které lze zneužít.

**Obrana a souvislosti**

- [Sociální izolace](@/glossary/socialni-izolace.md) – důsledek, kterému obrana předchází.
- [Epistemická bezpečnost](@/glossary/epistemic-security.md) – institucionální ochrana
  účastníků veřejné debaty.
- [Stalking Behavior Checklist](@/kompendium/techniques/ea-8-1-3-stalking-behavior-checklist.md)
  – posouzení, kdy doxing přechází v pronásledování.
- [Zuboff: Surveillance Capitalism](@/kompendium/07-teoreticke-reflexe/zuboff-surveillance-capitalism.md)
  – ekonomický kontext agregace osobních údajů.
