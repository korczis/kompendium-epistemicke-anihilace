+++
title = "Info-Ops (informační operace)"
weight = 60

description = "Vojenské a zpravodajské informační operace, které spojují psychologické, klamné, kybernetické a elektronické prostředky k ovlivnění vnímání a rozhodování protivníka."

[taxonomies]
tags = ["glossary", "security", "epistemic", "kompendium", "propaganda"]

[extra]
category = "security"
related_terms = ["epistemic-security", "firehose-of-falsehood", "deepfake", "deplatforming", "epistemicka-anihilace", "delegitimizace"]
author = "Tomáš Korcak (korczis)"
reading_time = "4 min"
word_count = 888
date_created = "2026-04-25"
date_modified = "2026-11-10"
keywords = ["information operations", "info-ops", "psyops", "cyber operations", "military doctrine", "hybrid warfare", "PSYOP"]
quality_score = 88
see_also = ["kompendium", "philosophy", "decisions"]
image = "/images/sections/glossary.png"
image_alt = "Info-Ops – glosář"
+++

## Definice

**Informační operace** (*Information Operations*, Info-Ops, IO) jsou doktrinální kategorie armád a zpravodajských služeb, která zahrnuje integrované nasazení schopností k ovlivnění, narušení, zkreslení nebo převzetí rozhodování protivníka při současné ochraně vlastního. Americká společná publikace *Joint Publication 3-13* vymezuje pět základních schopností IO: **psychologické operace** (PSYOP, později MISO), **vojenské klamání** (MILDEC), **bezpečnost operací** (OPSEC), **elektronický boj** (EW) a **operace v počítačových sítích** (CNO, kybernetika). Doktríny NATO a Ruska definují obdobná, ale ne totožná seskupení; ruský pojem *informacionnaja borba* (informační zápas) výslovně spojuje kinetické a nekinetické, mírové a válečné, vojenské a civilní rozměry způsobem, který americká doktrína tradičně nepoužívala.

Informační operace se od civilní dezinformace liší ve třech strukturních ohledech:

1. **měřítko prostředků** – státní informační operace disponují zpravodajskými rozpočty, stálými kádry a přístupem k utajované sběrné infrastruktuře, které civilní aktéři nemají;
2. **propojení s kinetickou akcí** – IO je zřídka samostatná; utváří informační prostředí tak, aby fyzické operace umožnila, zakryla nebo zesílila;
3. **doktrinální kontinuita** – operace se vedou roky a desetiletí, s průběžným učením, investicemi do infrastruktury a budováním fiktivních person, čemuž krátkodobé civilní kampaně nemohou konkurovat.

## Původ a kontext pojmu

Současné informační operace byly rozsáhle zkoumány na kampaních, mezi něž patří operace ruské [Internet Research Agency](@/kompendium/historical-cases/22-russian-ira.md) v letech 2014–2018, čínská doktrína „diskurzivní moci“ a činnost Jednotné fronty, íránské vlivové sítě a různé západní programy proti IO. Historickým předchůdcem jsou sovětská [aktivní opatření](@/kompendium/historical-cases/21-soviet-active-measures.md) a v našem prostředí metody státní bezpečnosti, jejichž východoněmeckou obdobu popisuje [Zersetzung](@/kompendium/historical-cases/5-east-german-zersetzung.md). Empiricky dobře vybavené IO vytvářejí měřitelné účinky na přesvědčení, chování a důvěru cílové populace – konkrétní velikost příčinných účinků je však sporná kvůli obtížím s přiřazením a izolací účinku.

Rozšíření IO do operací **šedé zóny** (pod prahem ozbrojeného konfliktu, ale nad úrovní mírové soutěže) a do doktrín **hybridní války** znamená, že IO už nejsou omezeny na vyhlášenou válku. Civilní informační prostředí je trvale napadáno státními aktéry a jejich zástupci, s důsledky pro žurnalistiku, integritu voleb a komunikaci veřejného zdraví.

## Jak se projevuje

Pozorovatelné znaky probíhající informační operace:

- [koordinované nepravé chování](@/kompendium/techniques/ea-9-4-2-coordinated-inauthentic-behavior.md) – sítě účtů, které se chovají jednotně, ale tváří se jako nezávislé hlasy;
- [vkládání narativů](@/kompendium/detection-signatures/22-network-narrative-injection.md) do důvěryhodných kanálů;
- [praní reputace](@/kompendium/detection-signatures/23-network-reputation-laundering.md) – narativ přechází z okrajových zdrojů do mainstreamu přes zprostředkovatele;
- souběh informační kampaně s fyzickou událostí (volby, vojenská akce, krize);
- útoky na důvěryhodnost institucí, které by mohly kampaň odhalit.

## Mechanismus

Na platformě Prismatic, z níž kniha vzešla, představují informační operace **strop schopností protivníka**, vůči němuž musí být obranné architektury navrženy. Kompendium katalogizuje techniky relevantní pro IO napříč několika kapitolami, ale samotné Info-Ops chápe jako **třídu scénářů**, ne jako jedinou techniku. Státní protivníci nasazují kombinace z katalogu EA s prostředky a vytrvalostí, které přesahují běžný model hrozby předpokládaný pro manipulaci jednotlivcem nebo malou skupinou. Na úrovni jednotlivých technik se IO opírají o [Firehose of Falsehood](@/glossary/firehose-of-falsehood.md), [deepfaky](@/glossary/deepfake.md), [síť loutkových účtů](@/kompendium/techniques/ea-9-4-3-sock-puppet-network.md) a [trollí farmy](@/kompendium/techniques/ea-9-4-5-troll-farm-EA.md).

## Odlišení

- **Od [propagandy](@/glossary/propaganda.md):** propaganda je jednou ze složek IO; IO zahrnují i klamání, kybernetické operace a ochranu vlastních informací.
- **Od civilní dezinformace:** viz tři strukturní rozdíly výše – měřítko, propojení s akcí, kontinuita.
- **Od legitimní veřejné diplomacie:** otevřené a přiznané šíření vlastního pohledu není IO; rozhodující je skrytost původce a záměr narušit rozhodování.
- **Od [OSINT](@/glossary/osint.md):** sběr informací z otevřených zdrojů je obranná i zpravodajská činnost, ne operace vlivu.

## Význam pro Kompendium

- [Decision Engine](@/glossary/decision-engine.md) platformy zavádí **hodnocení původu s ohledem na protivníka**: v prostředí s aktivními IO je rozmanitost zdrojů nutná, ale ne postačující – rozmanité zdroje musí projít i křížovou korelací na signatury koordinovaného nepravého chování.
- Audit původu zdrojů v [NABLA Infinity](@/glossary/nabla-infinity.md) je zčásti navržen k obraně proti IO, které zneužívají důvěryhodné kanály (kompromitovaní novináři, ovládnuté think-tanky, infiltrované neziskové organizace).
- Scénáře [Red Team](@/glossary/red-team.md) nejvyšší úrovně v rámci [Color Teams](@/glossary/color-teams.md) modelují kampaně IO státních aktérů jako stropní hrozbu – vydrží-li obrana proti nim, vydrží i proti menším hrozbám.
- [Epistemic Security](@/glossary/epistemic-security.md) poskytuje oborový rámec, v němž jsou IO hlavní vnější hrozbou.
- [Deplatforming](@/glossary/deplatforming.md) se proti odhaleným IO někdy používá, vyvolává však otázky řádného procesu, když jej soukromé platformy uplatňují bez soudního dohledu.

Informační operace jsou **realistickým protivníkem**, vůči němuž musí být navržena seriózní architektura epistemické bezpečnosti. Obrana dostatečná proti amatérským trollům nebo komerčním vlivovým operacím se může pod tlakem IO státní úrovně zhroutit. Pro jednotlivé čtenáře knihy je podstatné i to, že oběťmi IO nejsou jen populace, ale i konkrétní lidé – novináři, aktivisté, oznamovatelé –, na které se kampaně cílí; viz [ruský vliv v regionu](@/kompendium/international/7-russian-influence-EA/index.md) a [protokol pro novináře](@/kompendium/techniques/ea-6-4-9-novinari-protokol.md).

## Obrana a zotavení

**Na úrovni společnosti:** odolnost institucí, nezávislá média, [mediální gramotnost](@/kompendium/prevention-resilience/6-media-literacy-prevention.md), transparentnost platforem a právní rámec ([regulace platforem](@/kompendium/population-health/25-platform-regulation-EA.md)).

**Na úrovni organizace:** sledovat [vkládání narativů](@/kompendium/cross-domain/7-ea-osint-narrative-injection.md), ověřovat zdroje [křížovou triangulací](@/kompendium/cross-domain/8-ea-osint-cross-source-triangulation.md), připravit [obranu proti dezinformacím](@/kompendium/cross-domain/19-ea-security-disinformation-defense.md).

**Na úrovni jednotlivce:** rozmanitost zdrojů, odklad hodnocení, ochrana vlastního digitálního prostoru ([digitální hygiena](@/kompendium/prevention-resilience/7-digital-hygiene-prevention.md)) a u cílených osob podpora instituce, ne izolované čelení kampani.

## Literatura

- U.S. Joint Chiefs of Staff: *Joint Publication 3-13, Information Operations*.
- Christopher Paul, Miriam Matthews: *The Russian „Firehose of Falsehood“ Propaganda Model* (RAND, 2016).

## Související

**Pojmy**

- [Epistemic Security](@/glossary/epistemic-security.md) – oborový rámec.
- [Firehose of Falsehood](@/glossary/firehose-of-falsehood.md) – konkrétní doktrína IO.
- [Deepfake](@/glossary/deepfake.md) – schopnost začleňovaná do IO.
- [Deplatforming](@/glossary/deplatforming.md) – zásah proti IO.
- [Delegitimizace](@/glossary/delegitimizace.md) – častý cíl IO.
- [Propaganda](@/glossary/propaganda.md) – jedna ze složek IO.

**Kniha**

- [Sovětská aktivní opatření](@/kompendium/historical-cases/21-soviet-active-measures.md) – historický předchůdce.
- [Ruská IRA](@/kompendium/historical-cases/22-russian-ira.md) – doložená kampaň.
- [Obrana proti dezinformacím](@/kompendium/cross-domain/19-ea-security-disinformation-defense.md) – organizační obrana.
- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) – ústřední pojem Kompendia.
