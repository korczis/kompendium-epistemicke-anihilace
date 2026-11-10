+++
title = "Bridge: EASM (správa vnější útočné plochy)"
description = "Most mezi heslem EASM a knihou: pohled na sebe očima protivníka, technická i lidská útočná plocha, škoda ze sloučení drobných údajů a sebeprověrka jako obrana."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "easm", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["easm", "censys", "shodan", "osint", "doxing", "entity-resolution"]
parent = "kompendium-glossary-bridges"
glossary_target = "easm"
toc = false
+++

# Bridge: EASM (správa vnější útočné plochy)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a nápravě. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[EASM](@/glossary/easm.md) (*External Attack Surface Management*, správa vnější útočné plochy) je
disciplína kybernetické bezpečnosti zaměřená na průběžné objevování, soupis, klasifikaci a sledování
zvenčí viditelných digitálních aktiv organizace – domén, subdomén, adres, certifikátů, cloudových zdrojů,
vystavených rozhraní a služeb dostupných z internetu. Poskytuje pohled „zvenku dovnitř“, tedy stejný,
jaký má potenciální útočník, a umožňuje odhalit a odstranit slabá místa dřív, než budou zneužita.
Pojem útočné plochy formalizovali Manadhata a Wing (2011) jako míru toho, kolik vstupních bodů,
kanálů a dat systém vystavuje okolí.

Na platformě, z níž Kompendium vzešlo, tvoří EASM samostatnou aplikaci, která čerpá mimo jiné z dat
služeb [Censys](@/glossary/censys.md) a [Shodan](@/glossary/shodan.md). Heslo patří do kontextu platformy
a kybernetické bezpečnosti. Kniha ho zařazuje mezi mosty kvůli základní myšlence: podívat se na sebe
očima protivníka a najít, co jsme sami přehlédli.

## Útočná plocha očima knihy

Kniha rozšiřuje pojem útočné plochy z techniky na lidi a instituce. Vedle otevřených portů a
zapomenutých serverů existuje **lidská útočná plocha**: veřejně dostupné údaje o lidech, jejich vztazích,
zvycích a slabinách, které mohou posloužit jako vstupní bod manipulace. Mitnick a Simon (2002) na
případech sociálního inženýrství ukázali, že většina úspěšných průniků nezačíná technickou zranitelností,
ale informacemi o lidech a organizaci, které útočník poskládá z veřejných a polo-veřejných zdrojů.
Hutchins, Cloppert a Amin (2011) zařadili tento průzkum jako první článek „řetězce průniku“ (*kill chain*);
obrana, která přeruší první článek, je nejlevnější.

Klíčovým poznatkem je **škoda ze sloučení**. Solove (2006) v taxonomii soukromí popsal agregaci jako
samostatný druh zásahu: jednotlivé údaje jsou neškodné, ale jejich spojení vytváří obraz, který
umožňuje nátlak, pronásledování nebo manipulaci. Nissenbaum (2010) tento problém vyjádřila pojmem
kontextové integrity – informace, která je v jednom kontextu přiměřená, se může stát škodlivou, když
je přenesena do jiného. Kniha na to navazuje v technice
[EA-2.3.8 Epistemický doxxing](@/kompendium/techniques/ea-2-3-8-doxxing-epistemicky.md) a v hesle
[doxing](@/glossary/doxing.md); spojování záznamů napříč zdroji je přitom totéž, co technicky dělá
[sjednocování entit](@/glossary/entity-resolution.md).

## Kde se pojem v knize vyskytuje

Jak agent platformy mapuje vystavená aktiva a spojuje technická rizika s riziky manipulace – a proč
obrana proti sociálnímu inženýrství stojí na lidech –, popisuje stránka
[Perimeter a EA](@/kompendium/aiad-integration/perimeter-ea-attack-surface.md). Souvislost s útoky
na lidi rozvádějí kapitoly [Social Engineering 2.0](@/kompendium/cross-domain/17-ea-security-social-engineering.md)
a [AI-Augmented Spear Phishing](@/kompendium/cross-domain/18-ea-security-spear-phishing.md).

Lidskou obdobu sebeprověrky najde čtenář v návodu [Audit vztahů](@/kompendium/self-defense-guides/22-relationship-audit.md)
a v preventivní kapitole [Digitální hygiena](@/kompendium/prevention-resilience/7-digital-hygiene-prevention.md).
Institucionální podobu – co organizace o sobě a o svých lidech zveřejňuje a komu – popisují kapitoly
[Klasifikace informací](@/kompendium/organizational-defense/27-information-classification.md) a
[Reakce na incident s EA fokusem](@/kompendium/organizational-defense/31-incident-response-EA.md).

## Od pojmu k praxi

### Rozpoznání

U organizace je znakem zanedbané útočné plochy to, že nikdo nemá úplný přehled o tom, co je zvenčí
vidět: staré weby, zapomenuté účty, veřejné seznamy zaměstnanců s rolemi a kontakty. U jednotlivce je
obdobou situace, kdy cizí člověk ví o jeho životě víc, než by měl, a používá to k navázání důvěry
nebo k nátlaku. Kniha upozorňuje na signaturu [Asymetrické odhalování](@/kompendium/detection-signatures/15-behavioral-asymmetric-disclosure.md):
jedna strana vztahu o druhé ví mnoho a sama o sobě sděluje málo, což je u nově navázaných kontaktů
častým znakem připravovaného vlivu.

### Obrana

Obrana EASM spočívá v soupisu, minimalizaci a sledování: zjistit, co je vystaveno, odstranit, co
vystaveno být nemusí, a pravidelně kontrolovat změny. Pro jednotlivce kniha doporučuje obdobný postup
v přiměřené podobě – projít, co je o mně veřejně dostupné, zvážit, co z toho by šlo spojit do
citlivého obrazu, a omezit to, co nemá veřejnou funkci. Pro instituce je podstatné, aby se ochrana
nevztahovala jen na servery, ale i na lidi v exponovaných rolích; kapitola
[Tréninky odolnosti](@/kompendium/organizational-defense/12-training-resilience.md) popisuje, jak je
připravit na pokusy o manipulaci, které z veřejných údajů vycházejí.

### Náprava

Když se zjistí, že veřejně dostupné údaje už byly zneužity – například k cílenému podvodu nebo
k pronásledování –, je náprava technická i lidská. Technicky jde o odstranění údajů, kde je to možné,
a o změnu přístupových údajů. Lidsky jde o podporu toho, kdo byl zasažen: zkušenost, že cizí člověk
o mně „ví všechno“, vede k pocitu ztráty bezpečí, který kniha řeší v protokolu
[Akutní zajištění bezpečnosti](@/kompendium/recovery-protocols/acute-safety-establishment.md).

### Rámec pro profesionály

Pro bezpečnostní týmy a pověřence pro ochranu osobních údajů z toho plyne, že soupis útočné plochy
je sám citlivým dokumentem: obsahuje přesně ten agregovaný obraz, před nímž má chránit. Musí se proto
klasifikovat a chránit stejně přísně jako aktiva, která popisuje. Pro kliniky a vyšetřovatele je
důležité vědět, že oběti pronásledování často nejsou „paranoidní“, když tvrdí, že o nich pachatel ví
podrobnosti, které neměl znát; veřejná a polo-veřejná stopa to často umožňuje. Kniha k ochraně
důvěrnosti v detekci odkazuje na kapitolu [Důvěrnost v EA detekci](@/kompendium/critical-perspectives/17-confidentiality-EA.md).

## Odlišení od příbuzných pojmů

EASM je třeba odlišit od [OSINT](@/glossary/osint.md): OSINT je obecná disciplína zpravodajství
z otevřených zdrojů zaměřená na libovolný předmět, EASM uplatňuje podobné metody na vlastní organizaci.
Od penetračního testu se EASM liší tím, že je průběžné a nepřímé – neověřuje zneužitelnost aktivním
útokem, ale sleduje, co je vidět. Od [doxingu](@/glossary/doxing.md) se liší účelem a souhlasem:
sebeprověrka je obranná a provádí ji ten, koho se týká, doxing je zásah proti jiné osobě.

## Časté omyly

Prvním omylem je domněnka, že útočná plocha je jen technická. Druhým omylem je přesvědčení, že veřejně
dostupná informace je neškodná; Solove (2006) ukazuje, že škodu vytváří spojení, ne jednotlivý údaj.
Třetím omylem je opačná krajnost – úplné stažení z veřejného prostoru. Kniha nedoporučuje izolaci, která
by byla sama rizikem, ale vědomé rozhodování o tom, co a komu je sdíleno.

## Příklad (anonymizovaný kompozit)

Ředitelka malé nadace dostane e-mail, který působí jako zpráva od jejího účetního: zmiňuje projekt,
na kterém spolu pracují, oslovuje ji přezdívkou, kterou používají kolegové, a žádá urgentní převod.
Převod neprovede, protože zná pravidlo ověřovat platby jiným kanálem. Následná prověrka ukáže, že
všechny údaje v e-mailu šlo poskládat z výroční zprávy, z profilů zaměstnanců a z fotografie z akce
na sociální síti. Nadace upraví, co zveřejňuje, a zavede krátké školení pro zaměstnance.

## Meze a otevřené otázky

Kniha se EASM dotýká jen v rozsahu, v němž souvisí s obranou proti manipulaci; nenahrazuje odbornou
literaturu o bezpečnosti. Otevřená zůstává otázka, jak vyvážit transparentnost veřejných institucí,
která je hodnotou, s ochranou jejich lidí před agregací údajů. Druhou otázkou je, jak se lidská útočná
plocha mění s generativními modely, které dokážou z veřejných textů napodobit styl konkrétní osoby.

## Literatura

- Hutchins, E. M., Cloppert, M. J., & Amin, R. M. (2011). Intelligence-driven computer network defense informed by analysis of adversary campaigns and intrusion kill chains. *Proceedings of the 6th International Conference on Information Warfare and Security*.
- Manadhata, P. K., & Wing, J. M. (2011). An attack surface metric. *IEEE Transactions on Software Engineering*, 37(3), 371–386.
- Mitnick, K. D., & Simon, W. L. (2002). *The Art of Deception*. Wiley.
- Nissenbaum, H. (2010). *Privacy in Context: Technology, Policy, and the Integrity of Social Life*. Stanford University Press.
- Solove, D. J. (2006). A taxonomy of privacy. *University of Pennsylvania Law Review*, 154(3), 477–564.

## Související

**Glosář**

- [EASM](@/glossary/easm.md) – technické heslo, které most propojuje.
- [Doxing](@/glossary/doxing.md) – zneužití agregovaných údajů proti osobě.
- [Entity Resolution](@/glossary/entity-resolution.md) – technika spojování záznamů.
- [OSINT](@/glossary/osint.md) – obecná disciplína otevřených zdrojů.

**Kniha**

- [Perimeter a EA](@/kompendium/aiad-integration/perimeter-ea-attack-surface.md) – technická a lidská útočná plocha.
- [Social Engineering 2.0](@/kompendium/cross-domain/17-ea-security-social-engineering.md) – útoky, které začínají veřejnými údaji.
- [Audit vztahů](@/kompendium/self-defense-guides/22-relationship-audit.md) – osobní sebeprověrka.
- [EA-2.3.8 Epistemický doxxing](@/kompendium/techniques/ea-2-3-8-doxxing-epistemicky.md) – agregace jako zbraň.

**Sesterské mosty**

- [Bridge: Censys](@/kompendium/glossary-bridges/bridge-censys.md) – zdroj skenovacích dat.
- [Bridge: Shodan](@/kompendium/glossary-bridges/bridge-shodan.md) – vyhledávač zařízení.
- [Bridge: OSINT](@/kompendium/glossary-bridges/bridge-osint.md) – zpravodajství z otevřených zdrojů.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [EASM (správa vnější útočné plochy)](@/glossary/easm.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
