+++
title = "NWB"
weight = 100
description = "NWB (No Way Back): pilíř doktríny Prismatic Platform, který žádá trvalá řešení bez dočasných obezliček a vrstev zpětné kompatibility. Obsah, smysl a meze přenosu."

[taxonomies]
tags = ["glossary", "prismatic", "doctrine", "architecture"]

[extra]
category = "doctrine"
abbreviation = "NWB"
related_terms = ["doctrine", "nm-nd", "quality-debt", "regression-test", "zero-warning-policy"]
keywords = ["NWB", "No Way Back", "trvalé řešení", "architektura", "zpětná kompatibilita", "doktrína"]
+++

## Definice

**NWB** (*No Way Back*, „cesta zpět neexistuje“) je pilíř [doktríny](@/glossary/doctrine.md) Prismatic Platform, který příloha [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) řadí do domény *Permanence*. Index pojmů jej shrnuje jako doktrínu „permanentní řešení“. Pilíř žádá, aby každá změna v systému byla **trvalým zlepšením**, nikoli dočasnou záplatou, a aby se systém nevracel ke starším, překonaným řešením.

Pojem patří do kontextu platformy. V Kompendiu se často objevuje ve spojení **NMND/NWB/NCLB** v poznámkách o tom, že stránka nevznikla jako zástupný text a že je samostatně použitelná.

## Původ a kontext pojmu

NWB reaguje na jev, který softwarové inženýrství zná pod jménem technický dluh. Ward Cunningham tuto metaforu zavedl pro situaci, kdy tým dodá rychlé, ne zcela promyšlené řešení a „půjčí si“ tím čas, který později splácí v podobě obtížnějších změn; dluh, který se nesplácí, roste s úroky (Cunningham 1992). Dočasné obezličky jsou nejtypičtější formou takové půjčky, protože se málokdy vrátí na seznam práce, jakmile „fungují“.

Druhým kořenem je praxe soustavného přepracovávání kódu bez změny jeho chování. Martin Fowler ji popsal jako sérii malých, testy zajištěných kroků, jimiž se návrh systému postupně zlepšuje, místo aby se hromadily vrstvy kolem starého jádra (Fowler 1999). NWB z této praxe přebírá důraz na to, aby změna posunula návrh dopředu a nezanechala za sebou souběžnou „starou cestu“. Spojení s těmito zdroji je výkladové; dokumentace platformy je výslovně necituje.

## Jak se projevuje: co pilíř vyžaduje

Podle provozní dokumentace platformy NWB zahrnuje:

- **trvalou architekturu** – žádné dočasné obezličky (*hacks*);
- **žádné scénáře návratu** – řešení se navrhují tak, aby se k předchozímu stavu nemuselo a nedalo vracet;
- **postupné zlepšování** – každá změna systém trvale posouvá dopředu;
- **žádné vrstvy zpětné kompatibility** (*compatibility shims*) – čistý rozchod se starým rozhraním je preferován před jeho udržováním vedle nového;
- ověřování souladu při architektonické revizi.

Pilíř se vynucuje revizí architektury a v CI, nikoli blokací jednotlivých commitů. Spolu s [Doktrínou NM/ND](@/glossary/nm-nd.md) tvoří jádro zásady, že se nedokončená nebo provizorní práce nepřijímá.

V každodenní práci se NWB projevuje hlavně v revizích. Změna, která k novému rozhraní přidá „přechodnou“ kopii starého, nebo oprava, která chybu obejde místo toho, aby odstranila její příčinu, dostane v revizi výhradu s odkazem na pilíř. Typickým dokladem splnění je naopak změna, která staré rozhraní odstraní, všechna jeho použití převede na nové a přidá [regresní test](@/glossary/regression-test.md), který brání návratu původní chyby.

## Mechanismus: proč takové pravidlo existuje

Dočasná řešení mají sklon stát se trvalými: zůstávají v systému, obrůstají závislostmi a vytvářejí [technický dluh](@/glossary/quality-debt.md). Vrstvy zpětné kompatibility zdvojují cesty, kterými systém může jít, a tím i místa, kde může selhat. NWB tento sklon obrací: požaduje, aby se problém řešil u kořene a jednou provždy.

Strukturálně jde o otázku počtu stavů, v nichž se systém může nacházet. Každá zachovaná stará cesta znásobuje kombinace, které je třeba testovat a chápat, a s rostoucím počtem kombinací klesá šance, že někdo celek skutečně rozumí. Cunninghamova metafora tu platí doslova: úrokem z dluhu je čas, který každá další změna spotřebuje na to, aby nerozbila některou ze starých cest (Cunningham 1992). Pilíř tedy nevychází z touhy po čistotě, ale z prosté ekonomie porozumění.

## Odlišení

NWB je třeba odlišit od několika pojmů, s nimiž se snadno plete. Od [Doktríny NM/ND](@/glossary/nm-nd.md) se liší předmětem: NM/ND zakazuje nedokončenou práci obecně, kdežto NWB se týká návrhu – i dokončené řešení může NWB porušit, pokud ponechá vedle sebe starou a novou cestu. Od [Zero Warning Policy](@/glossary/zero-warning-policy.md) se liší úrovní: zásada nulových varování hlídá kvalitu překladu jednotlivých souborů, NWB architekturu celku.

Neméně důležité je odlišení od nevratnosti v běžném smyslu. NWB neznamená, že se změny nesmějí vracet v systému správy verzí; chybnou změnu lze vrátit jako kteroukoli jinou. Pilíř zakazuje navrhovat systém tak, aby trvale nesl obě varianty a „cesta zpět“ zůstávala otevřená jako součást provozu. Konečně je NWB opakem hesla „když to funguje, nesahej na to“: pilíř požaduje sahat, dokud řešení nefunguje i z dlouhodobého hlediska (Fowler 1999).

## Význam pro Kompendium

Kniha NWB přebírá jako **redakční zásadu**: stránka má být úplná a samostatně použitelná, ne zástupný text, který „se doplní později“. Proto pravidla repozitáře knihy požadují odstranění poznámek typu „v rekonstrukci“, jakmile je stránka hotová, a brána informační architektury hlídá, aby se neúplné stránky nepřidávaly a stávající se jen zlepšovaly.

Obsahově je však vztah NWB ke knize **napjatý** a je třeba ho výslovně ohraničit. Kompendium popisuje jevy, kde „cesta zpět neexistuje“ je naopak **varovný znak**. Robert Lifton popsal u myšlenkové reformy kritérium, které nazval *dispensing of existence*: skupina si osobuje právo rozhodovat, kdo má právo na existenci, a odchod ze skupiny tím získává podobu duchovní nebo sociální smrti (Lifton 1961). Steven Hassan popsal blízký mechanismus jako „indoktrinaci fobií“ – cílené vštěpování přesvědčení, že člověka po odchodu čeká katastrofa, nemoc nebo zatracení (Hassan 1988). V obou případech je víra v nemožnost návratu nástrojem kontroly, ne vlastností skutečnosti. Techniky popsané v [kapitole 4](@/kompendium/04-terminalni-protokoly/_index.md) se navíc pokoušejí o změny, které mají být nevratné.

Proti tomu kniha klade důraz na **reverzibilitu**: [klasifikační schéma](@/kompendium/08-prilohy/klasifikace.md) třídí techniky podle toho, zda jsou jejich následky vratné, a [protokoly zotavení](@/kompendium/recovery-protocols/_index.md) vycházejí z předpokladu, že návrat k vlastnímu poznání je možný. Tento předpoklad má oporu v traumatologii: Judith Herman popisuje zotavení jako postup od bezpečí přes zpracování vzpomínek k obnově vztahů se světem, tedy jako návrat, který je obtížný, ale dosažitelný (Herman 1992).

Obecný příklad (kompozit): mladá žena několik let žila ve skupině, která odchod označovala za „bod, odkud není návratu“. Když skupinu opustila, nejvíce ji neochromovala ztráta vztahů, ale přesvědčení, že se rozhodla nevratně a že rodina ani dřívější přátelé ji už nepřijmou. Část práce s ní spočívala v ověřování právě tohoto přesvědčení – v drobných, bezpečných kontaktech, které ukázaly, že řada cest zpět je otevřená. Slovo „nevratné“ se tak ukázalo jako tvrzení, které lze přezkoumat, ne jako fakt.

## Obrana a zotavení

Pro čtenáře z toho plyne jednoduché pravidlo: kdykoli prostředí trvá na tom, že nějaké rozhodnutí je nevratné, má se tvrzení prověřit stejně jako kterékoli jiné. V rozhodnutích o vztazích, víře, práci nebo bydlišti jsou skutečně nevratné kroky vzácné; tvrzení o nevratnosti bývá častěji prostředkem, jak zkrátit čas na rozmyšlenou. Hassan proto doporučuje u lidí, kteří zvažují odchod ze skupiny, mapovat konkrétní obavy z odchodu a ověřovat je proti zkušenosti jiných, kteří odešli (Hassan 1988).

Pro profesionály to znamená nevnášet do práce s klientem vlastní verzi „cesty zpět není“. Terapeutický plán, který by klientovi sděloval, že po určitém kroku už nelze nic změnit, by opakoval vzorec, z něhož se klient zotavuje. Herman zdůrazňuje, že zotavení není přímočaré a že návraty k dřívějším fázím jsou jeho přirozenou součástí, ne selháním (Herman 1992).

## Meze přenosu

NWB je pravidlo pro návrh softwaru. Na lidi, jejich rozhodnutí a jejich zotavení se nepřenáší: v práci s lidmi je možnost změnit názor, vrátit se a začít znovu hodnotou, nikoli chybou. Kniha proto NWB používá jen jako nárok na vlastní úplnost, ne jako model lidské změny.

I v softwaru má pilíř meze. Systém, který slouží mnoha vnějším uživatelům, nemůže vždy změnit rozhraní naráz, a rozhodnutí o čistém rozchodu musí vážit náklady, které ponesou ostatní. Otevřenou otázkou zůstává, kdy je přechodné období ještě odpovědným řízením změny a kdy už obezličkou, kterou NWB zakazuje.

## Literatura

- Cunningham, W. (1992). The WyCash portfolio management system. *OOPSLA '92 Experience Report*. ACM.
- Fowler, M. (1999). *Refactoring: Improving the Design of Existing Code*. Addison-Wesley.
- Hassan, S. (1988). *Combatting Cult Mind Control*. Park Street Press.
- Herman, J. L. (1992). *Trauma and Recovery*. Basic Books.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism*. W. W. Norton.

## Související

**Platforma**

- [Doctrine](@/glossary/doctrine.md) – soustava pilířů.
- [Doktrína NM/ND](@/glossary/nm-nd.md) – nulová tolerance k nedokončené práci.
- [Quality Debt](@/glossary/quality-debt.md) – dluh, kterému NWB předchází.
- [Regression Test](@/glossary/regression-test.md) – pojistka, že se oprava nevrátí.

**Kniha**

- [Klasifikační schéma](@/kompendium/08-prilohy/klasifikace.md) – osa reverzibility.
- [Longitudinální rekonstruktivní protokoly](@/kompendium/recovery-protocols/_index.md) – zotavení jako návrat.
- [Thought reform](@/glossary/thought-reform.md) – kontext Liftonových kritérií.
- [Doktrinální rámec](@/kompendium/02-doktrinalni-ramec/_index.md) – jak kniha přebírá platformní zásady.
- [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) – tabulka platformních zkratek.
