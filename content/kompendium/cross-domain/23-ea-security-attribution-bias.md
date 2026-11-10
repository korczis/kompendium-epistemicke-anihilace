+++
title = "Bezpečnost: zkreslení při atribuci útoků"
description = "Kdo za útokem stojí: atribuce jako proces, falešné stopy, politický tlak, míra jistoty a analogie s připisováním viny v mezilidských vztazích a skupinách."
weight = 230

[taxonomies]
tags = ["kompendium", "cross-domain", "security"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["24-ea-security-threat-intelligence-validation", "16-ea-dd-confirmation-bias-prevention", "22-ea-security-incident-response-narrative", "20-ea-security-insider-threat"]
parent = "kompendium-cross-domain"
toc = true
+++

Otázka „kdo to udělal“ je u kybernetických útoků technicky obtížná a politicky výbušná.
Atribuce – připsání útoku konkrétnímu aktérovi – rozhoduje o reakci: o sankcích, o právních
krocích, o tom, komu organizace přestane důvěřovat. Zároveň je to oblast, v níž se uplatňují
všechna zkreslení lidského úsudku a v níž útočníci aktivně vytvářejí falešné stopy. Kniha
popisuje, jak manipulace přesouvá vinu (například vzorcem [DARVO](@/glossary/darvo.md))
a jak lidé připisují příčiny podle očekávání; v atribuci útoků se tytéž mechanismy uplatňují
na úrovni organizací a států.

## Doména a problém

Rid a Buchanan (2015) popsali atribuci jako proces, nikoli jako jednorázové zjištění:
kombinuje technické stopy (malware, infrastruktura, postupy), operační kontext (cíle,
načasování, motivy) a strategickou úvahu (komu útok prospívá, co je známo o schopnostech
aktérů). Atribuce je podle nich „umění i věda“, vždy s mírou nejistoty, a její kvalita
závisí na tom, kolik zdrojů a času má analytik k dispozici. Zdůraznili také, že veřejná
atribuce je politické rozhodnutí, které nemusí zveřejnit všechny důkazy.

Technické stopy lze napodobit. Dobře zdokumentovaným příkladem je útok Olympic Destroyer
na infrastrukturu zimních olympijských her 2018 v Pchjongčchangu: analýzy bezpečnostních
firem ukázaly, že škodlivý kód obsahoval prvky záměrně připomínající nástroje jiných
skupin, takže první atribuce ukazovaly různými směry. Falešné stopy (*false flags*) jsou
proto součástí uvažování každého zkušeného analytika.

Psychologicky se atribuce setkává se základní chybou atribuce (Ross 1977) – sklonem
přeceňovat úmysl a vlastnosti aktéra a podceňovat situační faktory – a s konfirmačním
zkreslením: analytik, který očekává určitého aktéra, snadno vidí jeho „podpis“ (Heuer 1999).

## Průnik s epistemickou anihilací

Kniha popisuje, jak v manipulativních vztazích a skupinách funguje připisování viny:
vina se přesouvá na oběť, na „vnější nepřátele“ nebo na „zrádce uvnitř“, a příběh o viníkovi
slouží k udržení soudržnosti a kontroly. Na organizační úrovni má rychlá atribuce podobnou
funkci: dává jednoduché vysvětlení, odvádí pozornost od vlastních chyb a sjednocuje. Proto
je pokušení atribuovat rychle silné – a proto je rychlá atribuce rizikem.

Atribuce je také cílem informačních operací. Útočník může chtít, aby byl útok připsán jinému
aktérovi, a aktivně k tomu vytváří stopy i mediální příběh; obviněný aktér může naopak
vytvářet [pseudo-kontroverzi](@/kompendium/techniques/ea-2-3-5-pseudo-kontroverze-amplifikace.md)
o doložené atribuci. Uvnitř organizace může předčasná atribuce na konkrétního zaměstnance
vést k honu na čarodějnice popsanému u [vnitřní hrozby](@/kompendium/cross-domain/20-ea-security-insider-threat.md).

Třetím průnikem je potřeba uzavření. Nejistota o původci je pro lidi i organizace
nepříjemná a jednoduché vysvětlení přináší úlevu. Kruglanski a Webster (1996) popsali
potřebu kognitivního uzavření jako motivaci, která vede k rychlému přijetí první
přijatelné odpovědi a k jejímu „zmrazení“. V atribuci útoků se projevuje tím, že první
zveřejněné jméno aktéra se stává pevným bodem, k němuž se další analýza vztahuje – i když
by data dovolovala jiný výklad.

## Rozpoznávací znaky

Na zkreslenou atribuci ukazuje, když **atribuce předchází analýze** (jméno aktéra zazní
v prvních hodinách), když **stojí na jediném typu stop** (např. jen na podobnosti kódu),
když **chybí alternativní hypotézy** včetně falešné stopy, když **míra jistoty není uvedena**,
když **atribuce odpovídá politickému očekávání** bez nezávislého ověření, a když **se změní
s publikem** (jinak interně, jinak veřejně) bez vysvětlení. Kniha k tomu nabízí obecný
popis [nepřiměřené sebejistoty](@/kompendium/detection-signatures/9-behavioral-disproportionate-confidence.md).

## Rámec: právo, standardy a odpovědnost

Na úrovni EU existuje rámec pro společnou diplomatickou reakci na škodlivé kybernetické
činnosti (tzv. kybernetická diplomatická souprava nástrojů, 2017), v jehož rámci Rada může
přijmout omezující opatření proti osobám a subjektům odpovědným za kybernetické útoky;
atribuce zůstává svrchovaným rozhodnutím členských států. Organizace, které atribuují útoky
veřejně, nesou riziko odpovědnosti za nepravdivá tvrzení o konkrétních subjektech. Pro
zpravodajské analýzy platí standardy vyjadřování jistoty (srov. Kent 1964).

## Ochranná opatření

Prvním opatřením je **oddělit fáze**: nejprve technická analýza bez jmenování aktéra,
potom strukturované posouzení hypotéz. Druhým je **analýza soupeřících hypotéz** (Heuer 1999)
včetně hypotézy falešné stopy a hypotézy neznámého aktéra (viz [prevence konfirmačního zkreslení](@/kompendium/cross-domain/16-ea-dd-confirmation-bias-prevention.md)).
Třetím je **vícezdrojové ověření** – technické stopy, infrastruktura, operační kontext
a ideálně nezávislá analýza jiného týmu. Čtvrtým je **standardizované vyjádření jistoty**
(„s nízkou/střední/vysokou mírou jistoty“) a jeho dodržení i ve veřejné komunikaci.
Pátým je **zdrženlivost ve veřejné atribuci** u organizací, které nejsou státními orgány:
pro reakci na incident většinou není nutné vědět, kdo útočil.

## Lidský rozměr a zotavení

Předčasná atribuce může poškodit lidi: zaměstnance, kteří jsou podezříváni, partnery,
kterým organizace přestane důvěřovat, i analytiky, jejichž chybná atribuce se později ukáže.
Na druhé straně stojí oběti útoku, které potřebují vědět, že incident je řešen, i když
odpověď na otázku „kdo“ zatím chybí. Kniha k přijetí nejistoty nabízí pojem
[epistemická pokora](@/glossary/epistemicka-pokora.md) – schopnost říct „nevíme“ bez ztráty
schopnosti jednat.

## Přesah do dalších oborů

Atribuce je ústřední otázkou mnoha oborů. V soudnictví jde o určení pachatele a o riziko
justičních omylů, kdy se vyšetřování zaměří na podezřelého příliš brzy. V medicíně
o určení příčiny onemocnění, kdy první hypotéza může zastínit jiné. V rodinném právu
o připisování odpovědnosti za konflikt mezi rodiči, kdy jednoduchý příběh o „viníkovi“
může být sám nástrojem manipulace (viz [Rodinné právo](@/kompendium/forensic-legal/41-family-court-EA.md)).
V terapii o to, jak člověk po zkušenosti s manipulací připisuje vinu sobě a druhým, a jak
se učí rozlišovat odpovědnost od viny. Rossovo (1977) poučení o základní chybě atribuce
platí ve všech těchto oblastech.

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Po útoku na informační systém městského úřadu se
objeví mediální spekulace, že za ním stojí zahraniční státní aktér, protože použitý nástroj
se podobá nástroji, který byl dříve připsán takové skupině. Bezpečnostní tým úřadu na
tiskové konferenci odmítne aktéra jmenovat a vysvětlí, že nástroj je veřejně dostupný a
používají ho i kriminální skupiny. Analýza po několika týdnech ukáže, že šlo o kriminální
ransomwarovou skupinu motivovanou finančně. Kdyby úřad atribuoval útok státnímu aktérovi,
musel by tvrzení odvolávat a důvěra v jeho další komunikaci by utrpěla.

Uvnitř úřadu se mezitím objevilo podezření vůči správci systémů, jehož účet útočníci
použili k pohybu v síti. Vedení podle předem dohodnutého postupu jasně řekne, že zneužití
účtu neznamená vinu jeho držitele, a analýza později ukáže, že přihlašovací údaje byly
ukradeny z jiného, dříve kompromitovaného systému. Správce dostane veřejné poděkování
za spolupráci při vyšetřování. Atribuce uvnitř organizace tak podléhá stejné kázni jako
atribuce navenek: nejprve doklady, pak jména.

## Meze a otevřené otázky

## Meze a otevřené otázky

Atribuce zůstane vždy pravděpodobnostním úsudkem a veřejná atribuce bude vždy i politickým
aktem. Otevřenou otázkou je, jak zvýšit transparentnost atribucí bez ohrožení zdrojů a jak
čelit tomu, že každá atribuce může být zpochybněna jako „politická“, i když je dobře podložená.

## Literatura

- Heuer, R. J. (1999). *Psychology of Intelligence Analysis.*
- Kent, S. (1964). Words of estimative probability.
- Kruglanski, A. W., Webster, D. M. (1996). Motivated closing of the mind: „Seizing“ and „freezing“.
- Rid, T., Buchanan, B. (2015). Attributing cyber attacks.
- Ross, L. (1977). The intuitive psychologist and his shortcomings: Distortions in the attribution process.

## Související

**Mezioborové mosty**

- [Validace threat intelligence](@/kompendium/cross-domain/24-ea-security-threat-intelligence-validation.md) – zdroje pro atribuci.
- [Prevence konfirmačního zkreslení](@/kompendium/cross-domain/16-ea-dd-confirmation-bias-prevention.md) – ACH a [red team](@/glossary/red-team.md).
- [Narativ při reakci na incident](@/kompendium/cross-domain/22-ea-security-incident-response-narrative.md) – co říkat veřejnosti.
- [Vnitřní hrozba](@/kompendium/cross-domain/20-ea-security-insider-threat.md) – předčasné podezření uvnitř.

**Signatury a techniky**

- [Nepřiměřená sebejistota](@/kompendium/detection-signatures/9-behavioral-disproportionate-confidence.md) – jistota bez opory.
- [EA-2.3.5 Pseudo-kontroverze](@/kompendium/techniques/ea-2-3-5-pseudo-kontroverze-amplifikace.md) – zpochybňování doložené atribuce.

**Pojmy**

- [DARVO](@/glossary/darvo.md) – [přesouvání viny](@/glossary/blame-shifting.md).
- [Epistemická pokora](@/glossary/epistemicka-pokora.md) – schopnost říct „nevíme“.
