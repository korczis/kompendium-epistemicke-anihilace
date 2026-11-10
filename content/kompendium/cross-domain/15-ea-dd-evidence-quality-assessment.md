+++
title = "Due diligence: hodnocení kvality důkazů"
description = "Co dokument, výpověď nebo záznam skutečně dokládá: autenticita, relevance, síla důkazu, řetězce úsudků, Toulminova struktura argumentu a záznam nejistoty."
weight = 150

[taxonomies]
tags = ["kompendium", "cross-domain", "due-diligence"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["10-ea-dd-source-weighting", "8-ea-osint-cross-source-triangulation", "3-ea-osint-justice-cz-screening", "16-ea-dd-confirmation-bias-prevention"]
parent = "kompendium-cross-domain"
toc = true
+++

Závěr prověrky je jen tak silný jako důkazy, na nichž stojí, a jako úsudky, které je spojují.
V praxi se kvalita důkazů často hodnotí intuitivně: dokument „vypadá“ oficiálně, výpověď
„zní“ věrohodně, záznam „je v systému“. Kniha popisuje, jak manipulace u jednotlivce postupně
mění kritéria, podle nichž člověk posuzuje, co je doklad – až přestane rozlišovat mezi
tvrzením a důkazem. Tato stránka nabízí rámec, jak kvalitu důkazů v [due diligence](@/glossary/due-diligence.md) hodnotit
výslovně a jak se bránit tomu, aby ji někdo nenápadně posunul.

## Doména a problém

Teorie důkazu rozlišuje tři vlastnosti každého důkazu: **relevanci** (souvisí s hypotézou?),
**věrohodnost** (je pravý a přesný?) a **sílu** (jak moc mění pravděpodobnost hypotézy?).
Schum (1994) a Anderson, Schum a Twining (2005) ukázali, že většina důkazů v reálných
rozhodnutích není přímá: mezi důkazem a závěrem vede řetěz úsudků, z nichž každý přidává
nejistotu. Bankovní výpis dokládá, že platba proběhla; že šlo o úplatek, je úsudek, který
potřebuje další články řetězu.

Toulmin (1958) navrhl strukturu argumentu, v níž **tvrzení** stojí na **datech**
prostřednictvím **zdůvodnění** (warrant), které je podloženo **oporou** (backing), omezeno
**výhradami** (rebuttals) a vyjádřeno s určitou **mírou jistoty** (qualifier). V prověrkách
bývá nejslabším místem právě zdůvodnění – předpoklad, který spojuje data se závěrem, ale
nikdo ho nevyslovil (viz [Toulmin Model](@/glossary/toulmin-model.md)).

Třetím problémem je **chybějící důkaz**. Absence záznamu o problému neznamená absenci problému,
pokud se nehledalo tam, kde by se záznam objevil. Zpráva „nebyly nalezeny negativní informace“
má hodnotu jen s popisem, kde se hledalo.

## Průnik s epistemickou anihilací

Kniha popisuje [modifikaci evidenčních kritérií](@/kompendium/techniques/ea-4-3-5-evidential-criteria-modification.md)
jako proces, při němž se člověku postupně mění, co považuje za doklad – například že pocit
nebo slovo autority začne mít váhu vyšší než vlastní pozorování. V organizacích má tento
proces podobu kultury, v níž se „ví“, co je pravda, a důkazy se hledají jen na potvrzení.
[Pseudo-empirická validace](@/kompendium/techniques/ea-1-3-2-pseudo-empiricka-validace.md)
popisuje použití vnějších znaků vědeckosti nebo úřednosti (čísla, grafy, razítka) bez
skutečného doložení.

Druhým průnikem je [cirkulární argumentace](@/glossary/cirkularni-argumentace.md): závěr
je skrytě obsažen v předpokladech. V prověrkách se projevuje tak, že podezření vede k výkladu
důkazů, který podezření potvrzuje, a potvrzené podezření se pak používá jako důkaz.

Třetím průnikem je přesvědčivost formy. Dokument s logem, razítkem a tabulkami působí
jako silnější důkaz než prostý popis, i když obsahuje stejnou informaci. Prezentace
důkazů v profesionální podobě – zpráva poradenské firmy, graf, „forenzní analýza“ –
může nahradit otázku, na čem obsah stojí. Kniha tento jev popisuje u [iluzorní komplexity](@/kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md):
složitost a odbornost formy odrazuje od kontroly obsahu.

## Rozpoznávací znaky

Na nízkou kvalitu důkazního základu ukazuje, když **závěr stojí na jediném typu důkazu**,
když **mezi důkazem a závěrem chybí vyslovené zdůvodnění**, když **dokumenty pocházejí
od strany se zájmem** a nebyly ověřeny jinak, když **nejsou uvedeny alternativní výklady**
týchž důkazů, když **chybí popis negativního hledání**, a když **jistota závěru** neodpovídá
počtu a kvalitě důkazů. U jednotlivých dokumentů je třeba sledovat znaky neautenticity –
nesoulad metadat, formy, dat a podpisů –, zvlášť u digitálních dokumentů a snímků obrazovky
(viz [elektronické důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md)).

## Rámec: právo, standardy a odpovědnost

V soudním řízení platí zásada volného hodnocení důkazů: soud hodnotí důkazy jednotlivě
i v jejich souhrnu podle vlastního uvážení, které musí odůvodnit. Pro due diligence není
tento standard závazný, ale je užitečným vzorem – závěr má být odůvodněn tak, aby ho
třetí osoba mohla přezkoumat. Pro digitální důkazy je klíčový [chain of custody](@/glossary/chain-of-custody.md):
doložitelný původ a neporušenost. V medicíně a veřejném zdraví slouží jako vzor hodnocení
jistoty důkazů přístup GRADE (Guyatt a kol. 2008), který odlišuje kvalitu jednotlivých
studií od jistoty celkového závěru.

## Ochranná opatření

Prvním opatřením je **tabulka důkazů** u každého klíčového závěru: důkaz, jeho zdroj,
autenticita, co přímo dokládá, jaké úsudky vedou k závěru, jaké jsou alternativní výklady.
Druhým je **výslovné zdůvodnění** v Toulminově smyslu – proč z těchto dat plyne tento závěr.
Třetím je **stupnice jistoty** se slovními vyjádřeními svázanými s rozpětími (srov.
[vážení zdrojů](@/kompendium/cross-domain/10-ea-dd-source-weighting.md)). Čtvrtým je
**popis negativního hledání**. Pátým je **nezávislé čtení** – kolega, který dostane
tabulku důkazů bez závěru a formuluje vlastní. Šestým je **zachování důkazů** v původní
podobě s metadaty (viz [chain of custody](@/kompendium/forensic-legal/7-evidence-chain-of-custody.md)).

Tato opatření mají ještě jednu funkci: chrání prověřovatele před tím, aby se kritéria
důkazu posunula nepozorovaně. Když je tabulka důkazů vedena od začátku, je vidět, kdy
se začaly přijímat slabší doklady a proč.

## Lidský rozměr a zotavení

Pro osobu, o níž prověrka rozhoduje, je kvalita důkazů otázkou spravedlnosti: závěr
„pravděpodobně zapojen do podvodu“ na základě slabých důkazů může zničit kariéru. Pro lidi,
kteří se zotavují z manipulace, je obnova vlastních kritérií důkazu – co jsem viděl, co
mi bylo řečeno, co z toho plyne – jedním z hlavních úkolů; kniha k tomu nabízí návod
[hodnocení důkazů](@/kompendium/self-defense-guides/2-evidence-evaluation.md) a
[vzdělávací scénář vážení důkazů](@/kompendium/educational-scenarios/7-evidence-weighting.md).

## Přesah do dalších oborů

Hodnocení kvality důkazů je společné všem oborům, které rozhodují o lidech. V medicíně
jde o rozdíl mezi „pacient udává“ a „objektivně zjištěno“; v soudnictví o rozdíl mezi
nepřímými důkazy a přímým důkazem; v sociální práci o rozdíl mezi podezřením a doloženým
ohrožením; ve vědě o rozdíl mezi korelací a kauzalitou (viz [kauzální inference](@/kompendium/research-methodology/causal-inference-EA.md)).
Ve forenzní praxi ukázal Dror a kolegové (2006), že kontext ovlivňuje i hodnocení
„objektivních“ důkazů. Univerzálním poučením je, že důkaz nikdy nemluví sám – vždy ho
někdo vykládá, a výklad má být vyslovený, aby mohl být zpochybněn.

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Prověrka manažera, který má převzít vedení dceřiné
společnosti, obsahuje e-mail, v němž údajně schvaluje fiktivní fakturu. E-mail předložil
bývalý zaměstnanec jako snímek obrazovky. Analytik sestaví tabulku: snímek neobsahuje
hlavičky, nelze ověřit odesílatele, faktura existuje v účetnictví, ale byla schválena
jinou osobou. Zdůvodnění „manažer schválil fiktivní fakturu“ by vyžadovalo, aby e-mail byl
pravý, aby se týkal této faktury a aby faktura byla fiktivní – ani jeden článek není doložen.
Firma požádá o přístup k původní e-mailové schránce; e-mail v ní není. Závěr zní: tvrzení
nebylo prokázáno a důkaz nelze považovat za autentický.

Analytik přitom nezapíše, že tvrzení bylo vyvráceno – jen že nebylo prokázáno a že
předložený důkaz nesplňuje požadavky na autenticitu. Rozdíl je podstatný, kdyby se později
objevily nové doklady.

## Meze a otevřené otázky

Formalizace hodnocení důkazů zvyšuje průhlednost, ale nezaručuje správnost; tabulky
lze vyplnit zaujatě. Otevřenou otázkou je, jak hodnotit autenticitu digitálních důkazů
v době, kdy lze dokumenty, hlas i video věrohodně vytvořit uměle (viz [deepfake](@/glossary/deepfake.md)).

## Literatura

- Anderson, T., Schum, D., Twining, W. (2005). *Analysis of Evidence* (2. vyd.).
- Dror, I. E., Charlton, D., Péron, A. E. (2006). Contextual information renders experts vulnerable to making erroneous identifications.
- Guyatt, G. H. a kol. (2008). GRADE: an emerging consensus on rating quality of evidence and strength of recommendations.
- Schum, D. A. (1994). *The Evidential Foundations of Probabilistic Reasoning.*
- Toulmin, S. (1958). *The Uses of Argument.*

## Související

**Mezioborové mosty**

- [Vážení zdrojů](@/kompendium/cross-domain/10-ea-dd-source-weighting.md) – věrohodnost zdroje.
- [Triangulace napříč zdroji](@/kompendium/cross-domain/8-ea-osint-cross-source-triangulation.md) – nezávislé potvrzení.
- [Prověrka v justice.cz a ISIR](@/kompendium/cross-domain/3-ea-osint-justice-cz-screening.md) – úřední záznam jako důkaz.

**Forenzní rovina**

- [Elektronické důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md) – autenticita digitálních dokladů.
- [Chain of custody](@/kompendium/forensic-legal/7-evidence-chain-of-custody.md) – původ a neporušenost.

**Techniky, sebeobrana a pojmy**

- [EA-4.3.5 Evidential criteria modification](@/kompendium/techniques/ea-4-3-5-evidential-criteria-modification.md) – posun kritérií důkazu.
- [Hodnocení důkazů](@/kompendium/self-defense-guides/2-evidence-evaluation.md) – osobní praxe.
- [Toulmin Model](@/glossary/toulmin-model.md) – struktura argumentu.
