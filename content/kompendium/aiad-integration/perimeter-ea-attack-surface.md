+++
title = "Perimeter a vnější útočná plocha s ohledem na EA"
description = "Jak agent Perimeter na Prismatic Platform mapuje vystavená aktiva a spojuje technická rizika s riziky manipulace – a proč obrana proti sociálnímu inženýrství stojí na lidech."
weight = 33

[taxonomies]
tags = ["kompendium", "aiad-integration", "prismatic", "agents", "security"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["hawkeye-ea-visitor-intelligence", "osint-ea-source-validation", "strategic-command-ea-coordination", "blue-team-ea-defense", "compliance-ea-regulatory-screening"]
parent = "kompendium-aiad-integration"
toc = true
+++

# Perimeter a vnější útočná plocha s ohledem na EA

Perimeter je podle původní verze této stránky doménovým agentem Prismatic Platform, softwarové platformy, z níž kniha vzešla, který provozuje správu vnější útočné plochy – v odborné terminologii [EASM](@/glossary/easm.md) (*External Attack Surface Management*). Mapuje, která aktiva organizace jsou vystavena do internetu, odhaluje systémy, o nichž organizace neví, a spojuje údaje o zranitelnostech s riziky, která kniha popisuje jako epistemické útoky (EA). Jeho specifikou je propojení dvou světů: technické bezpečnosti a psychologické manipulace. Útoky, které kombinují technické zneužití s klamáním lidí – například cílené podvodné zprávy podpořené syntetickými médii –, nelze bránit jen na jedné z obou stran. Stránka popisuje tuto roli a vysvětluje, proč kniha v této souvislosti zdůrazňuje lidskou stránku obrany.

## Agent v kostce

Správa vnější útočné plochy vychází z poznatku, že organizace často nemají úplný přehled o tom, co ze své infrastruktury vystavují: domény, certifikáty, služby, zapomenuté testovací systémy nebo uniklé přístupové údaje. Heslo [EASM](@/glossary/easm.md) a hesla nástrojů, které platforma k mapování používá ([Shodan](@/glossary/shodan.md), [Censys](@/glossary/censys.md), [GreyNoise](@/glossary/greynoise.md)), popisují technický kontext. Původní stránka uvádí, že Perimeter pro každé aktivum posuzuje **kombinované riziko**: technickou zranitelnost, vystavení vůči manipulaci a význam aktiva pro chod organizace. Výstupem je mapa útočné plochy s prioritizovanými nápravnými kroky.

Agent pracuje průběžně i na vyžádání v rámci konkrétních šetření. Jeho výstupy slouží především k obraně – k tomu, aby organizace věděla, co má chránit, a mohla zranitelná místa uzavřít dřív, než je někdo zneužije.

## Proč se týká technik EA

Většina úspěšných útoků na organizace nestojí jen na technické chybě, ale na tom, že někdo uvěří zprávě, kterou neměl považovat za důvěryhodnou. Kniha tuto oblast rozvádí na stránkách [Cross-Domain](@/kompendium/cross-domain/_index.md): [sociální inženýrství z pohledu EA](@/kompendium/cross-domain/17-ea-security-social-engineering.md), [cílený phishing posílený umělou inteligencí](@/kompendium/cross-domain/18-ea-security-spear-phishing.md), [obrana podniku proti dezinformacím](@/kompendium/cross-domain/19-ea-security-disinformation-defense.md) a [vnitřní hrozba](@/kompendium/cross-domain/20-ea-security-insider-threat.md). Původní stránka zmiňuje zejména kombinaci cíleného klamání se [syntetickými médii](@/glossary/deepfake.md), kdy se útočník opírá o věrohodně vypadající hlas nebo obraz známé osoby. Takové útoky využívají mechanismy, které kniha popisuje u technik autority a časového tlaku – například [vytváření časového tlaku](@/kompendium/detection-signatures/14-behavioral-time-pressure-creation.md) a zneužití důvěry v nadřízeného.

## Jak pracuje

Mapování útočné plochy navazuje na obecné postupy modelování hrozeb: nejprve zjistit, co systém tvoří a kde se stýká s okolím, a pak u každého styčného bodu posoudit, jak by mohl selhat (Shostack 2014). Pro mapování útočných technik a jejich vztahu k obraně se v bezpečnostní praxi používá znalostní báze MITRE ATT&CK (Strom et al. 2018). Perimeter tento přístup rozšiřuje o lidskou stránku: u aktiva, jako je veřejně dostupný seznam zaměstnanců s kontakty, neposuzuje jen technickou zranitelnost, ale i to, jak snadno se takový seznam stane podkladem pro cílené klamání.

Literatura o sociálním inženýrství ukazuje, proč je lidská stránka rozhodující. Mitnick a Simon (2002) popsali na řadě případů, jak útočníci obcházejí technická opatření tím, že získají důvěru lidí; Hadnagy (2010) shrnul, že obrana proti sociálnímu inženýrství stojí především na vzdělávání a na procesech, které umožňují lidem bezpečně ověřit neobvyklý požadavek. Kniha z těchto prací přebírá obrannou část, nikoli popis technik.

Mapa útočné plochy je přitom užitečná jen tehdy, když se podle ní jedná. Zjištění, které zůstane v přehledu bez vlastníka a bez termínu nápravy, chrání stejně málo jako zjištění, které nebylo učiněno.

## Spolupráce s dalšími agenty

Perimeter získává kontext provozu od [HAWKEYE](@/kompendium/aiad-integration/hawkeye-ea-visitor-intelligence.md), reputaci adres a domén od [OSINT](@/kompendium/aiad-integration/osint-ea-source-validation.md), abstraktní modely hrozeb od [Black Teamu](@/kompendium/aiad-integration/black-team-ea-modeling.md) a jeho mapy využívá [Strategic Command](@/kompendium/aiad-integration/strategic-command-ea-coordination.md) při rozhodování o investicích do obrany. Obranné kroky navazují na práci [Blue Teamu](@/kompendium/aiad-integration/blue-team-ea-defense.md) a regulatorní souvislosti posuzuje [Compliance](@/kompendium/aiad-integration/compliance-ea-regulatory-screening.md).

## Příklad

Perimeter při pravidelném mapování zjistí, že organizace má veřejně dostupnou stránku s organizační strukturou, jmény a přímými kontakty pracovníků finančního oddělení, a zároveň starší, zapomenutou e-mailovou doménu, kterou lze snadno zaměnit s hlavní. Žádné z těchto zjištění samo nepředstavuje kritickou technickou zranitelnost. Kombinace však vytváří příznivé podmínky pro cílené klamání: falešnou zprávu, která se tváří jako pokyn vedení. Perimeter proto zjištění vyhodnotí jako vysokou prioritu a doporučí dvojí nápravu – technickou (převzít nebo zablokovat zaměnitelnou doménu, omezit veřejně dostupné údaje) a procesní (zavést ověřování neobvyklých platebních pokynů jiným kanálem). Druhý krok je mimo dosah softwaru: musí jej zavést a udržovat lidé.

## Co z toho plyne pro čtenáře knihy

Prvním poučením je, že **obrana proti sociálnímu inženýrství je obranou lidí**. Technická opatření snižují příležitosti, ale rozhodující je, zda člověk v rozhodující chvíli zpomalí, ověří požadavek a nebojí se odmítnout. Kniha k tomu nabízí [časově odložené hodnocení](@/kompendium/self-defense-guides/37-time-locked-evaluation.md), [ověřování tvrzení](@/kompendium/self-defense-guides/4-claim-verification.md) a [detekci obsahu vytvořeného umělou inteligencí](@/kompendium/self-defense-guides/40-ai-content-detection.md).

Druhým poučením je **kultura, ne jen pravidla**. Proces ověřování neobvyklých pokynů funguje jen tam, kde se člověk nemusí bát, že ověřením urazí nadřízeného. Kniha proto v obraně organizací zdůrazňuje [psychologické bezpečí](@/kompendium/organizational-defense/16-psychological-safety.md), [klasifikaci informací](@/kompendium/organizational-defense/27-information-classification.md) a [školení odolnosti](@/kompendium/organizational-defense/12-training-resilience.md). Organizace, v níž se pokyny nadřízených nesmějí zpochybnit, je vůči cílenému klamání zranitelnější než organizace se slabší technikou, ale silnou kulturou ověřování.

Třetím poučením je **vědět, co je vystaveno**. Lidé i organizace často nevědí, kolik informací o nich je veřejně dostupných. Pro jednotlivce, kteří se obávají pronásledování, je užitečné tento přehled získat – kniha k tomu odkazuje na [digitální hygienu](@/kompendium/prevention-resilience/7-digital-hygiene-prevention.md) – a pro organizace je to první krok obrany.

## Útočná plocha člověka

Pojem útočné plochy lze s opatrností přenést i na jednotlivce. Člověk, o němž je veřejně známo, kde pracuje, s kým se stýká a čeho se obává, je snáze cílem klamání – ať už podvodníka, nebo manipulativního partnera či skupiny. Kniha tuto analogii nepoužívá k tomu, aby lidem radila stáhnout se z veřejného života, ale k tomu, aby věděli, které informace o sobě sdílejí a s kým. U lidí, kteří odcházejí z kontrolujících vztahů nebo skupin, má tento přehled konkrétní bezpečnostní význam: bývalé prostředí často zná jejich slabá místa a může je využít k nátlaku na návrat. Proto kniha v [protokolu kultovní extrakce](@/kompendium/recovery-protocols/recovery-cult-extraction-protocol.md) a v [akutním zajištění bezpečí](@/kompendium/recovery-protocols/acute-safety-establishment.md) zahrnuje i ochranu osobních informací.

## Meze a otevřené otázky

Perimeter vidí jen vnější povrch organizace; vnitřní hrozby, včetně manipulace uvnitř týmů, jsou mimo jeho rozsah. Je závislý na úplnosti soupisu aktiv. Mapování vnější útočné plochy je činností dvojího použití: stejné postupy mohou sloužit útočníkovi k výběru cíle. Platforma je proto používá pro obranu vlastní infrastruktury a v autorizovaných kontextech a kniha je popisuje jen z obranné strany. Otevřenou otázkou je, jak měřit „vystavení vůči manipulaci“, které je mnohem obtížněji kvantifikovatelné než technická zranitelnost.

## Literatura

- Hadnagy, C. (2010). *Social Engineering: The Art of Human Hacking*. Indianapolis: Wiley.
- Mitnick, K. D., & Simon, W. L. (2002). *The Art of Deception: Controlling the Human Element of Security*. Indianapolis: Wiley.
- Shostack, A. (2014). *Threat Modeling: Designing for Security*. Indianapolis: Wiley.
- Strom, B. E., Applebaum, A., Miller, D. P., Nickels, K. C., Pennington, A. G., & Thomas, C. B. (2018). *MITRE ATT&CK: Design and Philosophy*. McLean, VA: The MITRE Corporation.

## Související

**Agenti**

- [HAWKEYE a koordinované chování](@/kompendium/aiad-integration/hawkeye-ea-visitor-intelligence.md) – kontext provozu.
- [OSINT a validace zdrojů](@/kompendium/aiad-integration/osint-ea-source-validation.md) – reputace domén.
- [Strategic Command a koordinace](@/kompendium/aiad-integration/strategic-command-ea-coordination.md) – investice do obrany.

**Pojmy**

- [EASM](@/glossary/easm.md) – správa vnější útočné plochy.
- [Deepfake](@/glossary/deepfake.md) – syntetická média v cíleném klamání.

**Kniha**

- [Sociální inženýrství z pohledu EA](@/kompendium/cross-domain/17-ea-security-social-engineering.md) – podrobný rozbor.
- [Psychologické bezpečí](@/kompendium/organizational-defense/16-psychological-safety.md) – kultura ověřování.
