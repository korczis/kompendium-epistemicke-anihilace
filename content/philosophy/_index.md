+++
title = "Filozofická východiska a licenční filozofie"
description = "Úvod do filozofického oddílu: dílo jako epistemický artefakt, licence GHL a tři eseje o intelektuální suverenitě, hranicích a epistemické integritě."
weight = 5
sort_by = "weight"
template = "philosophy/list.html"
page_template = "philosophy/detail.html"

[extra]
tags = ["filozofie", "licence", "ghl", "autorstvi", "etika", "epistemologie"]
categories = ["foundations"]
author = "Tomas Korcak (korczis)"
date_created = "2026-02-23"
date_modified = "2026-11-10"
+++

## Předmět oddílu

Filozofický oddíl se zabývá předpoklady, na nichž stojí kompendium samo: jak kniha chápe vztah
mezi autorem, dílem a čtenářem, jakou roli v něm hrají hranice a co znamená zachovat poznání
neporušené napříč časem a výklady. Zatímco kapitoly knihy popisují jevy, které schopnost
poznávat rozkládají, tento oddíl reflektuje podmínky, za nichž poznání trvá, a licenční
filozofii, jíž autor tyto podmínky chrání u vlastního díla. Taková sebereflexe patří k
odborné poctivosti: kniha, která od zdrojů požaduje průhlednost původu a důvodů, má tytéž
nároky uplatnit na sebe (Clifford, 1877; Code, 1987).

Oddíl vznikl v linii Prismatic Platform jako manifest, který prosazoval licenční model
General Honest License a stavěl ho proti modelu otevřeného softwaru. V tomto vydání je
přepracován do podoby akademických esejí: teze původního textu jsou zachovány, ale vykládají se
jako filozofická stanoviska s vlastní historií a s námitkami, které proti nim stojí, a nikoli
jako samozřejmé pravdy. Toto přepracování odpovídá Popperovu požadavku, aby tvrzení byla
formulována tak, že je lze kritizovat a případně vyvrátit (Popper, 1959).

## Pojmový rámec: dílo jako epistemický artefakt

Výchozí tezí oddílu je, že software i text jsou epistemickými artefakty, tedy hmotnými
nositeli poznání, záměru a pohledu na svět. Každé jméno proměnné, architektonické rozhodnutí,
komentář nebo test podle původního textu ztělesňuje autorovy kognitivní procesy a filozofické
závazky. Karl Popper pro tento druh existence zavedl pojem třetího světa, světa objektivních
obsahů myšlení, jako jsou teorie, problémy a argumenty, které sice vznikají z lidské činnosti,
ale jakmile jsou vyjádřeny, mají vlastní logické vztahy nezávislé na tom, kdo je myslí
(Popper, 1972). Dílo v tomto smyslu není jen výrobkem, ale nositelem poznání, s nímž lze
zacházet poctivě nebo nepoctivě.

Teze má dvě stránky, které se v esejích oddílu rozcházejí. Na jedné straně vede k nároku, aby se
s dílem zacházelo s respektem, jaký náleží odborným a uměleckým textům, a aby jeho úpravy
nevydávaly za autorova slova něco, co autor neřekl; tuto stránku rozvádí esej
[intelektuální suverenita](@/philosophy/intellectual-sovereignty.md). Na druhé straně Popperovo
pojetí zdůrazňuje, že obsah díla, jakmile je vysloven, podléhá kritice nezávisle na autorovi,
a právě to je podmínkou jeho růstu (Popper, 1972). Michael Polanyi k tomu připomíná, že
každé poznání má složku osobní a tichou, kterou nelze zcela vyjádřit, a že porozumění dílu
proto vždy vyžaduje vlastní účast vykladače (Polanyi, 1958); kniha tuto myšlenku rozvádí v
kapitole o [tiché znalosti](@/kompendium/07-teoreticke-reflexe/polanyi-ticha-znalost.md).

Pro software formuloval obdobnou tezi Frederick Brooks, když tvrdil, že nejdůležitější
vlastností návrhu je koncepční celistvost a že ji lze zachovat jen tehdy, když návrh vychází z
jednotné vize (Brooks, 1975). Tato teze je nejsilnější oporou původního textu oddílu, protože
ukazuje, že ochrana autorské vize není jen otázkou vlastnictví, ale i kvality díla. Zároveň
však Brooks mluví o rozhodovací pravomoci nad architekturou, a nikoli o kontrole nad tím, kdo
smí dílo užívat, a toto rozlišení prochází všemi třemi esejemi.

## Licenční filozofie knihy

Kompendium má za sebou dvě licenční období, která zaznamenává soubor licence obsahu v
repozitáři. Do 10. listopadu 2026 byl obsah knihy šířen pod licencí Creative Commons
BY-NC-SA 4.0 a kód pod licencí MIT; od tohoto data je veškerý obsah repozitáře, tedy text
knihy, glosář, archiv, grafika i kód, licencován pod General Honest License (GHL) v1.0, s
výjimkou knihoven třetích stran, které si ponechávají vlastní licence (Korcak, 2025). Licence
o sobě výslovně prohlašuje, že není licencí otevřeného zdroje ani permisivním udělením práv,
ale ochranným nástrojem autorovy intelektuální suverenity.

Rozdíl mezi oběma modely lze vyjádřit jako rozdíl mezi implicitním a výslovným povolením.
Permisivní licence typu MIT dovolují užití k jakémukoli účelu, licence GPL dovolují užití a
úpravy za podmínky, že odvozené dílo zůstane stejně svobodné, a licence Apache připojují
požadavky na uvedení autorství a změn; ve všech případech je užití dovoleno, pokud není
výslovně omezeno (St. Laurent, 2004). GHL obrací výchozí stav: užití je zakázáno, pokud k němu
autor písemně neudělí licenci vymezenou časem, účelem a rozsahem, a úpravy vyžadují samostatné
udělení (Korcak, 2025). Richard Stallman by v tomto obratu viděl návrat k moci vývojáře nad
uživatelem, kterou hnutí svobodného softwaru odmítá (Stallman, 2002).

Licence k výchozímu zákazu připojuje tři další prvky, které původní text oddílu označoval za
filozofické inovace. Prvním je interpretační autorita autora, tedy jeho poslední slovo o
zamýšleném smyslu a správném užití díla. Druhým je ochrana proti „epistemickému posunu“, tedy
proti zkreslení díla nesprávným výkladem, zjednodušením nebo převedením do cizích rámců.
Třetím je pojetí užití jako ceremoniální „invokace“, vědomého vstupu do vztahu s autorem, který
předpokládá porozumění a souhlas (Korcak, 2025). Eseje oddílu tyto prvky posuzují odděleně,
protože každý z nich stojí na jiné filozofické tradici: první na sporu o autorský záměr v
hermeneutice, druhý na teorii kontextové integrity a třetí na etice souhlasu (Hirsch, 1967;
Nissenbaum, 2010; Faden a Beauchamp, 1986).

## Tři eseje

Esej [intelektuální suverenita](@/philosophy/intellectual-sovereignty.md) sleduje autorský nárok
od Kantova a Fichtova argumentu proti nedovolenému přetisku přes tradici morálních práv autora
až k jeho podobě v GHL a konfrontuje ho s hermeneutickou kritikou autorského záměru a s
ekonomií společných statků. Dochází k rozlišení, které tezi činí obhajitelnou: autor může
oprávněně chránit to, co řekl, ale nemůže určovat, jak čtenář soudí (Kant, 1785; Gadamer, 1960).

Esej [etika hranic](@/philosophy/boundary-ethics.md) vykládá tezi, že omezení nejsou překážkou,
ale podmínkou tvorby a vztahu, v rámci estetiky, teorie soukromí, rodinné terapie a ekonomie
společných statků. Rozlišuje technické, právní, pojmové a časové hranice a s oporou v klinické
etice odlišuje překročení hranice, které slouží chráněné straně, od porušení, které slouží
tomu, kdo hranici překračuje (Ostrom, 1990; Gutheil a Gabbard, 1993).

Esej [epistemická integrita](@/philosophy/epistemic-integrity.md) popisuje závazek zachovat
pravdivost, význam a původ poznatků a vykládá zásady, jimiž ho doktrinální aparát knihy převádí
do metody: pluralitu a nezávislost zdrojů, zachování rozporu, informativní absenci, časové
vědomí, uznání nevědění a povinný původ. Navazuje na etiku přesvědčení a na epistemologii
ctností a ukazuje, kde formalizace pomáhá a kde vytváří zdánlivou přesnost (Clifford, 1877;
Zagzebski, 1996).

## Vztah k ostatním částem knihy

Filozofický oddíl doplňuje dvě části kompendia, které se filozofii věnují přímo.
[Filosofický rámec](@/kompendium/02-uvod/filosoficky-ramec.md) v úvodu knihy vykládá
epistemologická, fenomenologická a hermeneutická východiska taxonomie a
[teoretické reflexe](@/kompendium/07-teoreticke-reflexe/_index.md) zpracovávají jednotlivé
myslitele, od nichž kniha přebírá pojmy. Tento oddíl se od obou liší tím, že se neobrací k
jevům, ale ke knize samé: ptá se, jaké nároky si kniha klade a jak je obhajuje. Takové
rozlišení mezi teorií předmětu a reflexí vlastní metody odpovídá Lakatosovu požadavku, aby
výzkumný program výslovně formuloval své tvrdé jádro i ochranný pás pomocných hypotéz
(Lakatos, 1970).

Zásady práce s důkazy, které esej o epistemické integritě vykládá, se v knize objevují v
hesle [NABLA Infinity](@/glossary/nabla-infinity.md) a v kapitole o
[vztahu k NABLA Infinity](@/kompendium/02-uvod/vztah-k-nabla.md); redakční standard, který z
nich plyne, rozvádí [most k doktríně NM/ND](@/kompendium/glossary-bridges/bridge-nm-nd.md).
Etický rámec, v němž kniha zachází s citlivým poznáním, stanoví kapitola
[etické aspekty](@/kompendium/01-predmluva/eticke-aspekty.md), a kritické námitky proti
celému rámci shromažďuje oddíl [kritické perspektivy](@/kompendium/critical-perspectives/_index.md).
Hranice mezi ochranou a kontrolou, kterou esej o hranicích formuluje, je přitom tatáž hranice,
kterou kniha sleduje u manipulativních vztahů (Stark, 2007).

## Meze a otevřené otázky

Původní text oddílu vytyčil několik směrů dalšího rozvoje: rozšíření suverenity na autorské
týmy tak, aby se zachovaly jednotlivé příspěvky a nevznikla tyranie většiny, ochranu různých
verzí díla v čase, přizpůsobení ceremoniálních prvků odlišným kulturním kontextům a
ekonomické modely, které by udržitelnost takto chráněných děl zajistily. Každý z těchto směrů
naráží na problém, který Michael Heller popsal jako tragédii antikomonu: čím více práv k
rozhodování o užití existuje a čím jsou roztříštěnější, tím snáze zdroj zůstane nevyužit
(Heller, 1998).

Hlavní otevřenou otázkou oddílu je, zda lze autorskou kontrolu nad celistvostí díla oddělit od
kontroly nad jeho užitím a výkladem. Pokud ano, lze zachovat koncepční celistvost, o kterou
usiluje Brooks, a zároveň ponechat čtenáři úsudek, který kniha všude jinde hájí (Brooks, 1975;
Zagzebski, 2012). Pokud ne, ocitá se licenční filozofie knihy v napětí s jejím obsahem, a toto
napětí je třeba pojmenovat, a ne zakrývat. Eseje oddílu je proto třeba číst jako pokus o
odpověď, nikoli jako uzavřený výklad.

## Literatura

- Brooks, F. P. (1975). *The mythical man-month: Essays on software engineering*.
  Addison-Wesley.
- Clifford, W. K. (1877). The ethics of belief. *Contemporary Review, 29*, 289–309.
- Code, L. (1987). *Epistemic responsibility*. University Press of New England.
- Faden, R. R., & Beauchamp, T. L. (1986). *A history and theory of informed consent*. Oxford
  University Press.
- Gadamer, H.-G. (1960). *Wahrheit und Methode*. J. C. B. Mohr (Paul Siebeck).
- Gutheil, T. G., & Gabbard, G. O. (1993). The concept of boundaries in clinical practice:
  Theoretical and risk-management dimensions. *American Journal of Psychiatry, 150*(2),
  188–196.
- Heller, M. A. (1998). The tragedy of the anticommons: Property in the transition from Marx to
  markets. *Harvard Law Review, 111*(3), 621–688.
- Hirsch, E. D. (1967). *Validity in interpretation*. Yale University Press.
- Kant, I. (1785). Von der Unrechtmäßigkeit des Büchernachdrucks. *Berlinische Monatsschrift*.
- Korcak, T. (2025). *General Honest License (GHL) v1.0* [licenční text].
  https://github.com/korczis/prismatic/tree/master/docs/ghl
- Lakatos, I. (1970). Falsification and the methodology of scientific research programmes. In
  I. Lakatos & A. Musgrave (Eds.), *Criticism and the growth of knowledge*. Cambridge University
  Press.
- Nissenbaum, H. (2010). *Privacy in context: Technology, policy, and the integrity of social
  life*. Stanford University Press.
- Ostrom, E. (1990). *Governing the commons: The evolution of institutions for collective
  action*. Cambridge University Press.
- Polanyi, M. (1958). *Personal knowledge: Towards a post-critical philosophy*. University of
  Chicago Press.
- Popper, K. R. (1959). *The logic of scientific discovery*. Hutchinson.
- Popper, K. R. (1972). *Objective knowledge: An evolutionary approach*. Clarendon Press.
- St. Laurent, A. M. (2004). *Understanding open source and free software licensing*. O’Reilly.
- Stallman, R. M. (2002). *Free software, free society: Selected essays of Richard M. Stallman*.
  GNU Press.
- Stark, E. (2007). *Coercive control: How men entrap women in personal life*. Oxford University
  Press.
- Zagzebski, L. T. (1996). *Virtues of the mind: An inquiry into the nature of virtue and the
  ethical foundations of knowledge*. Cambridge University Press.
- Zagzebski, L. T. (2012). *Epistemic authority: A theory of trust, authority, and autonomy in
  belief*. Oxford University Press.

## Související

**Eseje oddílu**

- [Intelektuální suverenita](@/philosophy/intellectual-sovereignty.md) – autorský nárok, jeho
  historie a meze.
- [Etika hranic](@/philosophy/boundary-ethics.md) – hranice jako podmínka tvorby, vztahu a
  ochrany.
- [Epistemická integrita](@/philosophy/epistemic-integrity.md) – zachování pravdivosti, významu
  a původu poznání.

**Filozofie v kapitolách knihy**

- [Filosofický rámec](@/kompendium/02-uvod/filosoficky-ramec.md) – východiska taxonomie.
- [Teoretické reflexe](@/kompendium/07-teoreticke-reflexe/_index.md) – myslitelé, od nichž kniha
  přebírá pojmy.
- [Kritické perspektivy](@/kompendium/critical-perspectives/_index.md) – námitky proti rámci
  knihy.

**Doktrína a etika**

- [NABLA Infinity](@/glossary/nabla-infinity.md) – zásady práce s důkazy.
- [Most k doktríně NM/ND](@/kompendium/glossary-bridges/bridge-nm-nd.md) – redakční standard
  knihy a jeho meze.
- [Etické aspekty](@/kompendium/01-predmluva/eticke-aspekty.md) – etický rámec práce s citlivým
  poznáním.
