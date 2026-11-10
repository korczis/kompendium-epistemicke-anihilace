+++
title = "Elektronické důkazy"
description = "Zprávy, e-maily, metadata, lokalizace a syntetická média v kauzách EA: jak je zajistit, ověřit a vyložit a jak čelit námitce, že jde o podvrh."
weight = 35

[taxonomies]
tags = ["kompendium", "forensic-legal", "documentation-standards"]
categories = ["academic", "legal", "clinical"]

[extra]
related_terms = ["1-forensic-interview-protocol", "10-forensic-documentation", "11-undue-influence-doctrine", "12-coercive-control-law"]
parent = "kompendium-forensic-legal"
toc = true
+++

# Elektronické důkazy

Kapitola z [části o standardech dokumentace](@/kompendium/forensic-legal/_index.md) se zabývá
digitálními stopami, které jsou v kauzách epistemického zneužívání (EA) často nejbohatším
zdrojem důkazů: komunikací, záznamy polohy, finančními transakcemi a aktivitou na sociálních
sítích. Zároveň popisuje digitální technologie jako nástroje kontroly a nová rizika syntetických
médií. Casey (2011) definuje digitální důkaz jako jakákoli data uložená nebo přenášená
počítačem, která podporují nebo vyvracejí hypotézu o tom, jak k události došlo; tato šíře
platí i pro kauzy EA. Kapitola je určena vyšetřovatelům, znalcům z oboru kybernetiky,
advokátům a podpůrným organizacím.

## Právní a forenzní kontext

Elektronické důkazy se v řízení hodnotí podle své povahy jako listiny, věci nebo záznamy.
Zákon č. 141/1961 Sb., trestní řád, v § 89 odst. 2 stanoví, že za důkaz může sloužit vše, co
může přispět k objasnění věci, a zákon č. 99/1963 Sb., občanský soudní řád, připouští obdobně
široký okruh důkazních prostředků. Soud přitom zkoumá autenticitu (záznam pochází od toho, komu
je připisován), integritu (nebyl změněn) a úplnost (není vytržen z kontextu); Casey (2011)
tyto tři otázky považuje za jádro každého posouzení digitální stopy.

Pro identifikaci, sběr, získání a uchování digitálních důkazů vydala Mezinárodní organizace pro
normalizaci normu ISO/IEC 27037 (ISO/IEC, 2012), která klade důraz na dokumentaci každého kroku
a na minimalizaci zásahů do původních dat. Kent a kol. (2006) v příručce amerického NIST
popisují obdobný sled shromáždění, prozkoumání, analýzy a zprávy. Mezinárodní spolupráci při
zajišťování dat upravuje Úmluva Rady Evropy o počítačové kriminalitě přijatá v Budapešti roku
2001.

Zákonnost zajištění je samostatnou podmínkou. Zákon č. 40/2009 Sb., trestní zákoník, postihuje
v § 230 neoprávněný přístup k počítačovému systému a nosiči informací a v § 182 porušení
tajemství dopravovaných zpráv, takže získání dat z cizího zařízení nebo účtu bez oprávnění může
být trestné a důkaz znehodnotit. Orgány činné v trestním řízení mají k zajištění dat vlastní
zákonné nástroje, včetně vyžádání údajů o telekomunikačním provozu podle § 88a trestního řádu.
Zpracování osobních údajů třetích osob obsažených v exportech podléhá obecnému nařízení o
ochraně osobních údajů, nařízení (EU) 2016/679, což je třeba zohlednit i při předávání
materiálu podpůrným organizacím (Casey, 2011).

## Specifika epistemického zneužívání

Digitální technologie hrají v EA dvojí roli. Jsou nástrojem kontroly: sledování polohy, kontrola
telefonu, přístup do účtů, požadavek neustálé dostupnosti a okamžité odpovědi, přepisování a
mazání komunikace i kontrola online reputace postižené osoby. Harris a Woodlock (2019) pro tento
soubor jevů používají pojem digitální donucující kontrola (digital coercive control) a ukazují,
že technologie umožňuje pachateli být „přítomen“ i tam, kde fyzicky není. Dragiewicz a kol.
(2018) doplňují, že platformy samy svým návrhem ovlivňují, jak snadno lze tuto kontrolu
vykonávat a jak obtížně se jí lze bránit.

Freed a kol. (2018) na základě rozhovorů s postiženými a s pracovníky podpůrných služeb
popsali, že většina takového zneužívání nevyžaduje technickou zdatnost: opírá se o znalost
hesel, sdílené účty, rodinné tarify a fyzický přístup k telefonu. Pro forenzní praxi z toho
plyne, že stopa kontroly se často nachází v nastavení účtů a v historii přihlášení, nikoli ve
speciálním software. Woodlock (2017) zdůrazňuje, že technologicky zprostředkované sledování
prodlužuje vztah kontroly i po rozchodu.

Digitální stopy jsou zároveň zdrojem důkazů: komunikace zachycuje vzorce kontroly,
[gaslightingu](@/glossary/gaslighting.md) a eskalace přesněji než paměť. Specifickým rizikem je
obrácení, kdy pachatel tvrdí, že důkazy jsou podvržené, nebo sám vytvoří syntetický obsah, který
postiženou osobu diskredituje ([deepfake](@/glossary/deepfake.md), [klonovaný
hlas](@/kompendium/techniques/ea-9-2-2-voice-cloning-EA.md), [padělané
dokumenty](@/kompendium/techniques/ea-9-2-9-AI-document-forgery.md)). Chesney a Citron (2019)
pro situaci, kdy existence přesvědčivých podvrhů umožňuje odbýt i pravý záznam jako podvrh,
zavedli pojem „dividenda lháře“ (liar's dividend); námitka „to je fake“ je pak novou podobou
zpochybnění reality postižené osoby.

## Klíčové principy

Metadata jsou součástí důkazu: datum, čas, odesílatel a zařízení dávají obsahu váhu, bez nich se
z něj stává tvrzení. Casey (2011) proto upřednostňuje zajištění úplných exportů nebo forenzních
kopií před snímky obrazovky a vyžaduje, aby byla zachována i informace o tom, jak a kdy byla
data získána. Z téhož důvodu platí přednost celku před výběrem: předkládají se úplné konverzace,
ne jen vybrané zprávy, protože vytržení z kontextu je nejčastější a nejúčinnější námitkou
protistrany.

U klíčových zařízení je na místě odborné zajištění s ověřením integrity kryptografickým otiskem
(hash), jak ho popisuje norma ISO/IEC 27037 (ISO/IEC, 2012). Technická námitka vyžaduje
technickou odpověď: obecné „může to být podvrh“ se vyvrací znaleckým ověřením, ne sporem o
dojmy. Farid (2016) zároveň upozorňuje, že forenzní analýza obrazu dokáže prokázat řadu typů
úprav, ale neumí obecně dokázat, že záznam upraven nebyl; znalecký závěr proto vždy uvádí své
meze.

## Procedurální rámec

Práce s elektronickými důkazy začíná identifikací zdrojů: telefonů, počítačů, cloudových účtů,
komunikačních aplikací, sociálních sítí, bankovnictví, chytré domácnosti a lokalizačních služeb.
Následuje bezpečnostní posouzení, zda pachatel nemá přístup k zařízením postižené osoby; Freed a
kol. (2018) upozorňují, že náhlé odstřižení přístupu může pachateli prozradit, že osoba hledá
pomoc, a vyvolat eskalaci, takže změny se plánují spolu s podpůrnou organizací.

Zajištění spočívá v exportu dat se zachováním metadat, u klíčových zařízení ve forenzní kopii s
otiskem a v zachování originálního zařízení. Každý krok se dokumentuje v záznamu o zajištění a v
řetězu úschovy (viz [Chain of custody](@/kompendium/forensic-legal/7-evidence-chain-of-custody.md)),
jak to požadují Kent a kol. (2006). Analýza pak vyhledává vzorce: frekvenci kontaktů, reakce na
nedostupnost, popírání dřívějších sdělení a eskalaci v čase, a výsledek se předkládá jako výtah
s odkazy na úplná data, případně s vizualizací časových vzorců (srov. [Rekonstrukce časové
osy](@/kompendium/forensic-legal/33-timeline-reconstruction.md)).

Při námitce podvrhu se provádí znalecká analýza metadat, souladu se záznamy poskytovatele služby
a konzistence s ostatními důkazy. Casey (2011) doporučuje vždy hledat nezávislé potvrzení
digitální stopy mimo samotné zařízení, například u poskytovatele nebo u druhé strany komunikace,
protože shoda dvou nezávislých kopií je silnějším dokladem integrity než jakákoli analýza jediného
souboru.

## Markery a diferenciální úvahy

Na technologickou kontrolu ukazuje sdílení polohy, které postižená osoba nemůže vypnout bez
sankce, požadavky na okamžitou odpověď a reakce na nedostupnost, znalost informací, které mohl
pachatel získat jen z přístupu do zařízení, a mazání nebo úpravy konverzací. Harris a Woodlock
(2019) zdůrazňují, že jednotlivé projevy bývají samy o sobě nenápadné a jejich význam se ukazuje
až v souhrnu a v kontextu vztahu.

Na možnou manipulaci s důkazy ukazuje nesoulad metadat s obsahem, chybějící části konverzací,
soubory bez původních metadat nebo technické artefakty syntetického obsahu (Farid, 2016).
Diferenciálně je nutné odlišit dohodnuté sdílení polohy nebo účtů mezi partnery, které je běžné,
od jednostranné kontroly, a běžnou ztrátu dat od záměrného mazání; rozhodující není technický
stav, ale to, zda osoba mohla sdílení bez obav ukončit, což zdůrazňuje i Stark (2007) v obecném
rozboru [donucující kontroly](@/glossary/coercive-control.md).

## Riziková místa

Snímky obrazovky jako jediný důkaz jsou snadno zpochybnitelné, protože nenesou metadata a lze je
upravit; Casey (2011) je považuje za doplněk, nikoli za náhradu exportu. Neoprávněný přístup
postižené osoby nebo jejích podporovatelů do účtů pachatele může být trestný a obrátit pozornost
řízení proti nim. Synchronizace mezi zařízeními může způsobit, že smazání na jednom zařízení
odstraní data všude, a proto se zajištění plánuje dřív, než se mění nastavení účtů.

Zvláštním rizikem je sledovací software (stalkerware) v zařízení postižené osoby, který pachateli
prozradí, že osoba sbírá důkazy nebo hledá pomoc (Freed a kol., 2018); komunikaci o případu je
proto vhodné vést z bezpečného zařízení. Přeceňovat nelze ani detekci syntetického obsahu:
Chesney a Citron (2019) upozorňují, že nástroje pro rozpoznání podvrhů zaostávají za nástroji
pro jejich výrobu, a výstup detektoru proto nemůže sám rozhodnout.

## Modelová situace (anonymizovaná)

Anonymizovaný kompozit: muž tvrdí, že ho bývalá partnerka léta sledovala a popírala, co mu
psala. Partnerka v řízení předloží zvukovou nahrávku, na níž muž údajně vyhrožuje, a tvrdí, že
jeho zprávy jsou upravené. Znalec provede forenzní zajištění obou telefonů. Zprávy muže odpovídají
datům v zařízení i záznamům poskytovatele. U nahrávky chybějí původní metadata a obsahuje
technické nesrovnalosti; znalec však výslovně uvede, že synteticky vytvořený obsah nelze s
jistotou prokázat (Farid, 2016). Soud nahrávce nepřizná váhu, protože její původ nelze ověřit, a
opře se o zprávy s doloženou integritou.

## Doporučení pro praxi

Dotčená osoba nic neodstraňuje a exportuje konverzace se zachováním dat. Kontrolu, kdo má přístup
k jejím zařízením a účtům, provádí opatrně a ideálně s podporou, protože náhlé změny mohou být
rizikové (Freed a kol., 2018). Do účtů druhé osoby nevstupuje, i když k nim zná heslo, protože
tím může ohrozit vlastní postavení v řízení.

Vyšetřovatelé a znalci zajišťují data se zachováním metadat a s ověřením integrity, u námitky
podvrhu provádějí technické ověření a uvádějí jeho meze a technologickou kontrolu zkoumají jako
součást skutku, nikoli jen jako zdroj důkazů (Harris a Woodlock, 2019). Advokáti předkládají
úplné exporty místo výběrů a na námitku podvrhu odpovídají návrhem na znalecké ověření, nikoli
polemikou o věrohodnosti (Casey, 2011).

## Limity a otevřené otázky

Rozvoj syntetických médií podkopává důvěru v jakýkoli záznam; dividenda lháře, jak ji popsali
Chesney a Citron (2019), znamená, že pravý záznam lze odbýt jako podvrh. Šifrované komunikační
služby a mizející zprávy ztěžují zajištění. Otevřenou otázkou je, jak v řízení nakládat s
obrovským objemem komunikace a zda lze použít automatizovanou analýzu, aniž by se do ní
promítly skryté předpoklady o tom, co je „normální“ komunikace mezi partnery (Dragiewicz a kol.,
2018).

## Literatura

- Casey, E. (2011). *Digital Evidence and Computer Crime: Forensic Science, Computers and the Internet* (3. vyd.). Academic Press.
- Chesney, R., & Citron, D. K. (2019). Deep fakes: A looming challenge for privacy, democracy, and national security. *California Law Review*.
- Dragiewicz, M., Burgess, J., Matamoros-Fernández, A., Salter, M., Suzor, N. P., Woodlock, D., & Harris, B. (2018). Technology facilitated coercive control: Domestic violence and the competing roles of digital media platforms. *Feminist Media Studies*.
- Farid, H. (2016). *Photo Forensics*. MIT Press.
- Freed, D., Palmer, J., Minchala, D., Levy, K., Ristenpart, T., & Dell, N. (2018). „A stalker's paradise“: How intimate partner abusers exploit technology. *Proceedings of the 2018 CHI Conference on Human Factors in Computing Systems*. ACM.
- Harris, B. A., & Woodlock, D. (2019). Digital coercive control: Insights from two landmark domestic violence studies. *British Journal of Criminology*.
- ISO/IEC (2012). *ISO/IEC 27037:2012 Information technology – Security techniques – Guidelines for identification, collection, acquisition and preservation of digital evidence*. International Organization for Standardization.
- Kent, K., Chevalier, S., Grance, T., & Dang, H. (2006). *Guide to Integrating Forensic Techniques into Incident Response* (NIST SP 800-86). National Institute of Standards and Technology.
- Stark, E. (2007). *Coercive Control: How Men Entrap Women in Personal Life*. Oxford University Press.
- Woodlock, D. (2017). The abuse of technology in domestic violence and stalking. *Violence Against Women*.

## Související

**V této sekci**

- [Chain of custody](@/kompendium/forensic-legal/7-evidence-chain-of-custody.md) – integrita digitálních stop.
- [Uchování důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md) – praktické zajištění.
- [Protokoly nahrávání](@/kompendium/forensic-legal/36-recording-protocols.md) – audio a video záznamy.
- [Rekonstrukce časové osy](@/kompendium/forensic-legal/33-timeline-reconstruction.md) – časová razítka v chronologii.

**Techniky**

- [Deepfake Personality](@/kompendium/techniques/ea-9-2-1-deepfake-personality.md) – syntetická identita.
- [Synthetic Witness Testimony](@/kompendium/techniques/ea-9-2-7-synthetic-witness-testimony.md) – podvržená svědectví.
- [Real-time monitoring](@/kompendium/techniques/ea-4-2-2-real-time-monitoring.md) – technologická kontrola.

**Glosář a sebeobrana**

- [Deepfake](@/glossary/deepfake.md) – syntetická média.
- [OSINT](@/glossary/osint.md) – otevřené zdroje a jejich etické meze.
- [Detekce AI obsahu](@/kompendium/self-defense-guides/40-ai-content-detection.md) – osobní obrana proti syntetickému obsahu.
