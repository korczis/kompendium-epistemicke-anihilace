+++
title = "NCLB"
weight = 100
description = "NCLB (No Claim Left Behind): pilíř doktríny Prismatic Platform, podle něhož žádné tvrzení nezůstane bez ověřitelného důkazu. Co vyžaduje a proč je obranným principem knihy."

[taxonomies]
tags = ["glossary", "prismatic", "doctrine", "evidence", "quality"]

[extra]
category = "doctrine"
abbreviation = "NCLB"
related_terms = ["doctrine", "falsifikovatelnost", "evidence-based", "chain-of-custody", "signal-plurality"]
keywords = ["NCLB", "No Claim Left Behind", "doložitelnost tvrzení", "evidence", "ověřitelnost", "doktrína"]
+++

## Definice

**NCLB** (*No Claim Left Behind*, volně „žádné tvrzení bez opory“) je pilíř [doktríny](@/glossary/doctrine.md) Prismatic Platform v doméně *Evidence integrity*. Požaduje, aby **každé tvrzení**, které platforma vysloví – v dokumentaci, v reportu, v analýze –, bylo **podloženo ověřitelným důkazem**. Index pojmů jej shrnuje jako doktrínu „evidence-based platform integrity“.

Na rozdíl od většiny ostatních pilířů má NCLB pro knihu přímý obsahový význam: podrobně ho rozebírá [most k pojmu NCLB](@/kompendium/glossary-bridges/bridge-nclb/_index.md). Toto heslo shrnuje jeho platformní podobu a vztah ke Kompendiu.

## Původ a kontext pojmu

Pilíř vznikl z praktického problému: dokumentace platformy obsahovala čísla („tolik aplikací“, „tolik agentů“, „tolik testů“), která se psala ručně a po několika týdnech přestávala platit. Nikdo nelhal, ale tvrzení se rozešla se skutečností a čtenář nemohl poznat, které ještě platí. NCLB odpovídá tím, že tvrzení se nemají psát, ale **odvozovat** z běžícího systému, a kde odvodit nejdou, mají nést odkaz na důkaz.

Myšlenkově stojí pilíř v širší tradici, která spojuje důvěru s ověřitelností: v kritickém racionalismu (tvrzení má být formulováno tak, aby šlo prověřit), v medicíně založené na důkazech ([evidence-based](@/glossary/evidence-based.md)) a ve forenzní praxi, kde důkaz bez doloženého původu ztrácí váhu. Tato návaznost je výkladová; platforma se na tyto tradice formálně neodvolává.

## Jak se projevuje: co pilíř vyžaduje

Podle provozní dokumentace platformy NCLB zahrnuje:

- **univerzální ověřování tvrzení** – každé tvrzení platformy musí být podloženo ověřitelným důkazem;
- **dynamický sběr důkazů** – čísla a metriky se mají brát z běžícího systému, ne psát natvrdo;
- **validační proces** – tvrzení a jejich důkazy se dávkově ověřují v CI;
- **konzistenci napříč platformou** – dokumentace má odpovídat živým datům.

Pilíř je v CI **blokující**: změna, jejíž tvrzení neprojdou ověřením, se nesloučí. Platforma k tomu má sadu příkazů, které tvrzení v dokumentaci vyhledají, ověří proti živým datům a dokumentaci aktualizují. Na mnoha stránkách Kompendia, které vznikly v prostředí platformy, se NCLB uvádí v poznámce o souladu s doktrínou – například že tvrzení odvozená umělou inteligencí musí být doložena.

## Mechanismus: proč takové pravidlo existuje

Dokumentace velkého systému zastarává rychleji, než ji kdo stačí opravit, a čísla v ní se brzy rozejdou se skutečností. Tvrzení bez zdroje pak mate uživatele i autory. NCLB nahrazuje víru v dokumentaci jejím průběžným ověřováním.

Strukturálně pilíř rozlišuje tři druhy tvrzení:

1. **Odvoditelná** – čísla a stavy, které lze spočítat z dat; ta se nepíší, ale generují.
2. **Doložitelná** – tvrzení, která se opírají o vnější zdroj; ta nesou odkaz.
3. **Interpretační** – úsudky a hodnocení; ta se označují jako úsudek a mají uvedeno, z čeho vycházejí.

Chyba vzniká hlavně tam, kde se tvrzení jednoho druhu vydává za jiný – kde se úsudek prezentuje jako změřený fakt nebo kde se odhad píše jako přesné číslo.

## Odlišení

NCLB sousedí s pilířem [GITL](@/glossary/gitl.md): GITL váže změnu kódu na důvod, NCLB tvrzení na důkaz. Od [falsifikovatelnosti](@/glossary/falsifikovatelnost.md) se liší otázkou, kterou klade. Popper chápal vědecké tvrzení jako takové, které lze v principu vyvrátit zkušeností (Popper 1959); NCLB se neptá, zda tvrzení může být vyvráceno, ale zda je podloženo. Dobré tvrzení splňuje obojí.

Doložení nelze zaměňovat s počtem zdrojů. Deset zdrojů, které opakují jeden původní, nejsou deset důkazů, a NCLB se proto doplňuje s principem [plurality signálů](@/glossary/signal-plurality.md), který žádá nezávislost zdrojů. Stejně tak doložení není totéž co odkaz na autoritu: tvrzení „říkají to odborníci“ není důkazem, pokud neukazuje, o co se odborníci opírají. Ioannidis ukázal, že i publikovaný výzkum v recenzovaných časopisech může být častěji chybný, než se předpokládá, zvlášť u malých studií a v oborech s velkou volností analýzy (Ioannidis 2005); autorita publikace tak nenahrazuje otázku, na čem výsledek stojí.

Konečně je třeba NCLB odlišit od radikálního [skepticismu](@/glossary/skepticismus.md). Pilíř nežádá, aby se pochybovalo o všem, ale aby se u každého tvrzení dalo říct, o co se opírá. Radikální pochybnost, která žádný důkaz nepřijme, je stejně neplodná jako slepá důvěra – a v manipulačním prostředí bývá cíleně pěstována, aby člověk přestal věřit i vlastním pozorováním.

## Význam pro Kompendium

Kniha o tom, jak se ničí důvěra v poznání, nesmí sama vyrábět tvrzení bez opory. Proto Kompendium uplatňuje princip NCLB na sebe:

- **zdroje** – cituje se jen literatura, o jejíž existenci a obsahu není pochyb; čísla jen se zdrojem; interpretace se označuje jako interpretace; citovanou literaturu shromažďuje generovaný [přehled literatury](@/references.md);
- **čísla o knize** se nepíší ručně, ale odvozují se z obsahu skripty;
- **falsifikovatelnost** – u závěru má být zřejmé, co by ho vyvrátilo (viz [falsifikovatelnost](@/glossary/falsifikovatelnost.md)).

Obsahově je NCLB obranou proti vzorcům, které kniha popisuje: proti [vytváření pseudokonsenzu](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md), proti [pseudoempirické validaci](@/kompendium/techniques/ea-1-3-2-pseudo-empiricka-validace.md), která tvrzení obléká do podoby dat, proti [cirkulárním argumentům](@/glossary/cirkularni-argumentace.md) a proti tvrzením, která nic nemůže vyvrátit. Klinická, forenzní a analytická praxe má vlastní obdoby – oddělení pozorování od interpretace, [řetězec úschovy důkazů](@/glossary/chain-of-custody.md), [pluralitu signálů](@/glossary/signal-plurality.md).

Obecný příklad (kompozit): ve sporu o péči o dítě předloží jedna strana znalecký posudek s větou „opakovaně doloženo, že matka manipuluje dítětem“. Uplatnit na tuto větu princip NCLB znamená zeptat se: čím doloženo, kdo to pozoroval, kdy, a jde-li o pozorování, nebo o převzatý výklad. Ukáže-li se, že „opakované doložení“ je jediná výpověď, citovaná v několika dokumentech, mění se váha tvrzení zásadně – aniž by bylo třeba cokoli tvrdit o pravdě opačné strany.

## Obrana a zotavení

Princip „žádné tvrzení bez opory“ lze použít jako osobní obranný nástroj, zvláště v prostředí, kde se tvrzení o člověku opakují tak dlouho, až začnou platit:

- **Oddělit tvrzení od jeho opakování.** Zapsat si, kdo tvrzení řekl poprvé a o co se opíral; další opakování k němu nic nepřidává.
- **Ptát se na druh tvrzení.** Je to změřený fakt, odkaz na zdroj, nebo něčí úsudek?
- **Uplatnit pravidlo i na sebe.** Vlastní vzpomínku zapsat jako vzpomínku, vlastní dojem jako dojem; tím se posiluje rozlišení, které manipulace rozmazává.
- **Pro profesionály:** v dokumentaci rozlišovat výpověď klienta, vlastní pozorování a interpretaci; v posudcích uvádět zdroj každého tvrzení o třetích osobách.

## Meze přenosu

NCLB je nárok na **vlastní tvrzení** – platformy nebo autora knihy. Nesmí se obrátit proti lidem, kteří vypovídají o své zkušenosti: výpověď oběti bez listinného důkazu není bezcenná a požadavek důkazu nemá sloužit k umlčení; Fricker popisuje snižování důvěryhodnosti mluvčího kvůli předsudku jako samostatnou epistemickou křivdu (Fricker 2007; srov. [testimoniální nespravedlnost](@/glossary/testimonialni-nespravedlnost.md)). V klinické praxi se výpověď zaznamenává jako výpověď a teprve úsudek o ní se opírá o důkazy.

Požadavek důkazu lze také zneužít jako techniku: soustavné „a máte na to důkaz?“ vůči každému tvrzení protistrany, při němž se vlastní tvrzení dokládat nemusí, je asymetrií, kterou kniha popisuje u [sealioningu](@/glossary/sealioning.md). NCLB platí symetricky, nebo vůbec.

Otevřenou otázkou je, jak princip uplatnit na texty, které spoluvytvářejí jazykové modely. Model dokáže vyprodukovat věrohodně znějící citaci, která neexistuje, a čtenář ji od skutečné nerozezná. Pravidla repozitáře knihy proto žádají, aby každá citace byla ověřena člověkem a aby se nejisté údaje raději vynechaly, než aby se doplnily odhadem. Pilíř, který vznikl kvůli zastaralým číslům v dokumentaci, se tak v době generativních modelů stává základní hygienou každého odborného textu.

## Literatura

- Popper, K. R. (1959). *The Logic of Scientific Discovery*. Hutchinson (orig. *Logik der Forschung*, 1934).
- Ioannidis, J. P. A. (2005). Why most published research findings are false. *PLoS Medicine*, 2(8).
- Fricker, M. (2007). *Epistemic Injustice: Power and the Ethics of Knowing*. Oxford University Press.

## Související

**Platforma**

- [Doctrine](@/glossary/doctrine.md) – soustava pilířů.
- [Most k pojmu NCLB](@/kompendium/glossary-bridges/bridge-nclb/_index.md) – podrobný výklad pro knihu.
- [GITL](@/glossary/gitl.md) – dohledatelnost změn.

**Kniha**

- [Falsifikovatelnost](@/glossary/falsifikovatelnost.md) – co by tvrzení vyvrátilo.
- [Evidence-based](@/glossary/evidence-based.md) – praxe založená na důkazech.
- [Chain of custody](@/glossary/chain-of-custody.md) – forenzní dohledatelnost.
- [Pseudokonsenzus (EA-2.1.9)](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md) – zdání shody bez opory.
- [Sealioning](@/glossary/sealioning.md) – zneužitý požadavek důkazu.
- [Testimoniální nespravedlnost](@/glossary/testimonialni-nespravedlnost.md) – mez požadavku důkazu.
- [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) – tabulka platformních zkratek.
