+++
title = "Bezpečnost: dodavatelský řetězec a narativy o dodavatelích"
description = "Kompromitace dodavatelského řetězce a příběhy o důvěryhodnosti dodavatelů: jak odlišit doložené riziko od reputační kampaně a jak rozhodovat při neúplných informacích."
weight = 210

[taxonomies]
tags = ["kompendium", "cross-domain", "security"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["24-ea-security-threat-intelligence-validation", "23-ea-security-attribution-bias", "25-ea-compliance-nis2-integrity", "12-ea-dd-counterparty-manipulation"]
parent = "kompendium-cross-domain"
toc = true
+++

Organizace nejsou bezpečné jen samy o sobě; jsou tak bezpečné jako software, služby
a zařízení, které od dodavatelů přebírají. Kompromitace dodavatelského řetězce – kdy útočník
napadne dodavatele a přes jeho legitimní produkt se dostane k zákazníkům – patří k nejzávažnějším
typům útoků. Zároveň se kolem dodavatelů vedou spory, v nichž se mísí doložená bezpečnostní
rizika, geopolitika, obchodní konkurence a reputační kampaně. Pro organizaci je obtížné
rozhodnout, čemu věřit. Tato stránka spojuje obě roviny: technickou důvěru v dodavatele
a epistemickou důvěru v příběhy o nich.

## Doména a problém

Dva dobře doložené incidenty ilustrují technickou rovinu. V roce 2017 se škodlivý kód
NotPetya rozšířil přes aktualizaci ukrajinského účetního softwaru M.E.Doc a způsobil
rozsáhlé škody firmám po celém světě. V prosinci 2020 vyšlo najevo, že útočníci
kompromitovali sestavovací proces platformy Orion firmy SolarWinds a do legitimních
aktualizací vložili zadní vrátka, která se dostala k tisícům zákazníků včetně vládních
institucí. V obou případech zákazníci dělali přesně to, co se doporučuje – instalovali
aktualizace od důvěryhodného dodavatele.

Druhou rovinou jsou **varování a narativy** o dodavatelích. Národní úřad pro kybernetickou
a informační bezpečnost vydal v prosinci 2018 varování před používáním technických
a programových prostředků společností Huawei a ZTE v kritické infrastruktuře; německý
úřad BSI v březnu 2022 varoval před používáním antivirového softwaru Kaspersky. Taková
varování vycházejí z posouzení rizik, které zahrnuje právní prostředí země dodavatele
a možnost státního vlivu, a nikoli nutně z prokázané kompromitace konkrétního produktu.
Kolem nich se pak vedou veřejné spory, v nichž jedna strana mluví o bezpečnosti a druhá
o protekcionismu nebo politice.

Organizace, která rozhoduje o dodavateli, tak musí současně hodnotit technické důkazy,
oficiální varování, mediální příběhy a vlastní závislost na dodavateli – často bez přístupu
k utajeným podkladům, z nichž varování vychází.

## Průnik s epistemickou anihilací

Kniha popisuje, jak manipulace mění to, komu člověk věří, a jak lze důvěru zneužít právě
tam, kde je nejpevnější. Kompromitace dodavatelského řetězce je technickou podobou tohoto
mechanismu: útok prochází kanálem, který byl ověřen jako důvěryhodný. Epistemicky je
podobný [reputation laundering](@/kompendium/detection-signatures/23-network-reputation-laundering.md)
– škodlivý obsah získává důvěryhodnost tím, že prochází důvěryhodným prostředníkem.

Na rovině narativů se uplatňuje [falešná ekvivalence](@/kompendium/techniques/ea-1-2-2-falesna-ekvivalence.md)
(„všichni dodavatelé jsou stejně rizikoví“) i opačný extrém – [pseudo-kontroverze](@/kompendium/techniques/ea-2-3-5-pseudo-kontroverze-amplifikace.md),
v níž se doložené riziko prezentuje jako pouhý názor. Dodavatelé i jejich konkurenti mají
zájem příběh ovlivnit, a organizace, která hodnotí jen veřejně dostupné informace, může
snadno převzít rámec té strany, která komunikuje hlasitěji.

Třetím průnikem je závislost. Organizace, která je na dodavateli kriticky závislá, má
silnou motivaci věřit příběhům, které ho očišťují, a odbývat varování – podobně jako
člověk v závislém vztahu racionalizuje signály, které by vyžadovaly bolestnou změnu.

## Rozpoznávací znaky

Na technické úrovni ukazují na riziko dodavatelského řetězce **neobvyklé chování po
aktualizaci**, **neočekávaná síťová komunikace** produktu, **změny v podpisu či původu
balíčků** a **incidenty u dodavatele**, které nebyly transparentně komunikovány. Na úrovni
narativu je třeba rozlišovat **varování opřené o metodiku a odpovědnou instituci** od
**anonymních tvrzení**, **technickou analýzu s doložením** od **obecných obav**, a sledovat,
**kdo má z příběhu prospěch** a zda je to zveřejněno. Varovným znakem je i **absence
jakéhokoli příběhu** o dodavateli, na němž organizace kriticky závisí – znamená, že riziko
nikdo nehodnotil.

## Rámec: právo, standardy a odpovědnost

NIS2 (směrnice (EU) 2022/2555) výslovně zahrnuje do opatření řízení rizik bezpečnost
dodavatelského řetězce, včetně bezpečnostních aspektů vztahů s přímými dodavateli (čl. 21
odst. 2 písm. d)), a umožňuje koordinovaná posouzení rizik kritických dodavatelských řetězců
na úrovni Unie (čl. 22). V USA výkonné nařízení 14028 (2021) zavedlo požadavky na bezpečnost
softwarového dodavatelského řetězce včetně soupisu softwarových komponent (SBOM).
Na úrovni EU stanoví nařízení o kybernetické odolnosti požadavky na produkty s digitálními
prvky.

## Ochranná opatření

Technicky pomáhá **inventář dodavatelů a komponent** včetně soupisu softwaru, **segmentace**
a **princip nejmenších oprávnění** i pro produkty dodavatelů, **monitorování chování** po
aktualizacích, **smluvní požadavky** na hlášení incidentů a bezpečnostní postupy dodavatele
a **plán pro výpadek** klíčového dodavatele (viz [Řízení dodavatelů s EA fokusem](@/kompendium/organizational-defense/25-vendor-management-EA.md)
a [Prověřování kontraktorů](@/kompendium/organizational-defense/26-contractor-vetting.md)).

Epistemicky pomáhá **oddělit typy informací** – technické důkazy, oficiální varování,
mediální tvrzení, tvrzení dodavatele – a hodnotit je zvlášť (srov. [Hodnocení kvality důkazů](@/kompendium/cross-domain/15-ea-dd-evidence-quality-assessment.md)).
Dále **zapisovat důvody rozhodnutí** a jejich předpoklady, aby bylo možné rozhodnutí přehodnotit,
když se předpoklady změní, a **konzultovat s odpovědnou institucí** (u nás NÚKIB, vládní
CERT) namísto rozhodování podle mediálního obrazu. Užitečný je i **[red team](@/glossary/red-team.md) pohled**: jak
by vypadal útok přes tohoto dodavatele a co bychom viděli.

## Lidský rozměr a zotavení

Incidenty dodavatelského řetězce zasahují lidi, kteří nic neudělali špatně – administrátory,
kteří instalovali aktualizace podle doporučení. Pocit, že „ani správný postup nechrání“,
může vést k rezignaci nebo k přehnané nedůvěře, která brzdí běžný provoz. Pomáhá otevřené
vyhodnocení, které odliší, co šlo a co nešlo předvídat (viz [Učení po incidentu](@/kompendium/organizational-defense/40-post-incident-learning.md)).
Pracovníci dodavatele, jehož produkt byl zneužit, čelí veřejnému obviňování; i oni jsou
často obětí útoku.

## Přesah do dalších oborů

Problém důvěry v dodavatelský řetězec a příběhy o něm má obdoby jinde. Ve zdravotnictví jde
o léky a zdravotnické prostředky, jejichž kvalitu pacient ani lékař nemohou sami ověřit
a spoléhají na regulátora (srov. [FDA a opioidy](@/kompendium/historical-cases/40-fda-opioid.md)).
Ve vědě o data a software, které výzkumníci přebírají od jiných a jejichž chyby se šíří
dál. V potravinářství o falšování potravin. V informačním prostředí o zdroje, z nichž
média přebírají zprávy (agentury, tiskové zprávy). Všude platí, že důvěra v kanál nesmí
nahradit ověřování obsahu, a že rozhodnutí o důvěře má být doložené a přezkoumatelné.

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Krajská nemocnice zvažuje výměnu systému pro správu
zdravotnické techniky. Nabídka dodavatele ze třetí země je nejlevnější. V médiích se
objevují články o bezpečnostních rizicích tohoto dodavatele, z nichž některé citují
oficiální varování a jiné anonymní „odborníky“. Nemocnice rozdělí informace: existuje
varování odpovědné instituce týkající se právního prostředí dodavatele; technická analýza
konkrétního produktu není veřejně dostupná; anonymní tvrzení nelze ověřit. Konzultuje
s NÚKIB a krajským bezpečnostním týmem, posoudí, k jakým datům by systém měl přístup,
a rozhodne se pro jiného dodavatele s odůvodněním, které se opírá o varování a o citlivost
dat – nikoli o mediální obraz.

Nemocnice své rozhodnutí zdokumentuje včetně předpokladů a stanoví, že ho přehodnotí,
pokud se změní varování nebo pokud bude k dispozici nezávislá technická analýza produktu.
Dodavatel, který nebyl vybrán, dostane věcné vysvětlení důvodů – nikoli odkaz na mediální
zprávy, které nemocnice sama nepovažovala za ověřené.

## Meze a otevřené otázky

Varování opřená o utajené podklady nelze zvenčí ověřit; organizace musí rozhodnout,
jak velkou důvěru vložit do instituce, která je vydala. Otevřenou otázkou je, jak budovat
transparentnost těchto rozhodnutí, aby nebyla vnímána jako politická, a jak hodnotit
rizika dodavatelů, kteří jsou zároveň jedinými dostupnými.

## Literatura

- Executive Order 14028 (2021). *Improving the Nation's Cybersecurity.*
- NÚKIB (2018). Varování před hrozbou spočívající v užívání technických a programových prostředků společností Huawei a ZTE.
- Směrnice (EU) 2022/2555 (NIS2), čl. 21 a 22.

## Související

**Mezioborové mosty**

- [Validace threat intelligence](@/kompendium/cross-domain/24-ea-security-threat-intelligence-validation.md) – hodnocení zpráv o hrozbách.
- [Zkreslení při atribuci](@/kompendium/cross-domain/23-ea-security-attribution-bias.md) – kdo za útokem stojí.
- [NIS2 a integrita rozhodování](@/kompendium/cross-domain/25-ea-compliance-nis2-integrity.md) – regulatorní rámec.

**Organizace**

- [Řízení dodavatelů s EA fokusem](@/kompendium/organizational-defense/25-vendor-management-EA.md) – správa vztahů.
- [Prověřování kontraktorů](@/kompendium/organizational-defense/26-contractor-vetting.md) – prověrka dodavatelů.

**Signatury, techniky a pojmy**

- [Reputation laundering](@/kompendium/detection-signatures/23-network-reputation-laundering.md) – důvěryhodný kanál jako nosič.
- [EA-1.2.2 Falešná ekvivalence](@/kompendium/techniques/ea-1-2-2-falesna-ekvivalence.md) – nestejná rizika jako stejná.
- [EASM](@/glossary/easm.md) – správa vnějšího útočného povrchu.
