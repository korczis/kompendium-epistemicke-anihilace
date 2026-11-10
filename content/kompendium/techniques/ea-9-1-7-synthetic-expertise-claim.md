+++
title = "EA-9.1.7 Synthetic Expertise Claim"
description = "Vzorec předstírané odbornosti, v němž generovaný text – analýzy, posudky, „whitepapery“ – slouží jako důkaz expertízy, kterou autor nemá. Znaky, odlišení, obrana."
weight = 917

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-1", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-1-6-llm-source-attribution-bypass", "ea-9-2-3-synthetic-text-narrative", "ea-9-4-4-AI-bot-personhood", "ea-2-1-1-expertni-disinflation"]
parent = "kompendium-techniques"
ea_code = "EA-9.1.7"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.1 LLM-mediated EA"
section_icon = "🤖"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.1.7 Synthetic Expertise Claim

> *Subkategorie 🤖 **9.1 LLM-mediated EA** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.1.7`
**Název:** Synthetic Expertise Claim
**Subkategorie:** 9.1 LLM-mediated EA
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High
**[Doctrine](@/glossary/doctrine.md) alignment:** NCLB (claim-evidence validation), SEAL (security enforcement), ZERO (runtime verification)

## 2. Definice

*Synthetic expertise claim* je předstírání odbornosti pomocí obsahu vytvořeného jazykovým modelem: rozsáhlé analýzy, odborně znějící posudky, „whitepapery“ nebo série článků, které autor publikuje pod vlastním či smyšleným jménem a používá jako doklad expertízy v profesním nebo veřejném prostoru. Epistemicky jde o padělání *signálu* odbornosti, nikoli odbornosti samé.

## 3. Mechanismus (strukturálně)

Odbornost se v praxi často posuzuje podle zástupných znaků: objemu publikací, terminologie, sebejistého tónu, citací. Jazykové modely tyto znaky levně produkují, a tak se rozpadá vazba mezi znakem a schopností. Publikum, které obsah nedokáže věcně posoudit, se řídí formou. Vzorec se stává epistemickou agresí tam, kde předstíraná autorita slouží k přehlasování skutečných odborníků nebo k ovlivnění rozhodnutí (klienti, média, soudy). Souvisí s [expertní disinflací](@/kompendium/techniques/ea-2-1-1-expertni-disinflation.md) v kapitole 2: obě narušují, komu společnost přiznává právo mluvit.

## 4. Detekční markery

- Velký objem textu za krátkou dobu bez stopy předchozí práce v oboru (publikace, praxe, kolegové).
- Text je terminologicky bohatý, ale obecný: chybí vlastní data, konkrétní případy, chyby a pochybnosti.
- Autor nedokáže obsah rozvést v přímém rozhovoru nebo na otázky odpovídá opět obecně.
- Stylistická homogenita napříč tématy, která by běžně vyžadovala různé odborníky.
- Odkazy na zdroje mají znaky [smyšlených citací](@/kompendium/techniques/ea-9-1-6-llm-source-attribution-bypass.md).

## 5. Odlišení

*Legitimní použití AI odborníkem*: autor nástroj přizná, obsah ručí vlastním jménem a umí ho obhájit. *Popularizace*: zjednodušuje skutečnou odbornost, nepředstírá ji. *Podvodné tituly*: padělá formální kvalifikaci; zde se padělá obsahová stopa.

## 6. Dopad a rámec

Dopad nesou ti, kdo podle falešné odbornosti jednají – klienti, pacienti, čtenáři, instituce –, a skuteční odborníci, jejichž hlas se ztrácí. Právně může jít o klamání spotřebitele, neoprávněné poskytování odborných služeb nebo nepravdivý znalecký posudek; v akademickém prostředí o porušení zásad vědecké integrity. Detekce generovaného textu nástroji je nespolehlivá a nesmí sama o sobě sloužit jako důkaz.

## 7. Obrana a zotavení

*Čtenář a klient*: hledat stopu práce mimo text – praxi, recenzované publikace, reference, schopnost odpovídat na konkrétní otázky. *Instituce a redakce*: ověřovat odborníky přes jejich práci, ne přes objem textu; vyžadovat prohlášení o použití AI. *Soudy a úřady*: u znalců a expertů trvat na doložitelné kvalifikaci a výslechu. *Osobní obrana*: [Hodnocení mentorů](@/kompendium/self-defense-guides/27-mentor-evaluation.md) – podle čeho poznat, komu svěřit úsudek.

## 8. Příklad (anonymizovaný kompozit)

Konzultant bez praxe v oboru během několika měsíců publikuje desítky odborně znějících článků o kybernetické bezpečnosti a získá pozvánky do médií jako „expert“. Když ho na konferenci kolega požádá o konkrétní případ z praxe, odpoví obecnými frázemi. Pozdější kontrola ukáže, že články mají shodnou strukturu, opakují tytéž obecné body a část citovaných zdrojů neexistuje. Média, která ho zvala, nemají vlastní postup, jak odborníky ověřovat.

## 9. Meze a otevřené otázky

Hranice mezi asistovaným psaním a předstíranou odborností je otázkou míry a poctivosti. Strojová detekce generovaného textu dává falešně pozitivní výsledky a může poškodit skutečné autory – zejména ty, kdo nepíší v rodném jazyce. Spolehlivější je ověřovat práci a kompetenci, ne text.

Pro výzkum je otevřené, jak se mění důvěra veřejnosti v odborníky v prostředí, kde odborně znějící text může vytvořit kdokoli; je možné, že poroste důvěra v instituce, které odbornost ověřují, ale také, že poroste paušální nedůvěra ke všem expertům. Kniha obě možnosti uvádí jako otevřené.

## 10. Pohled zevnitř a práce s postiženým

Klient, který na radu falešného odborníka jednal, se po odhalení cítí podveden a zahanben, že nepoznal rozdíl. Je důležité mu ukázat, že signály, podle nichž se řídil, běžně fungují, a že selhání bylo v jejich padělání. Skutečný odborník, jehož hlas byl přehlušen, potřebuje institucionální oporu: možnost veřejně opravit chybné informace bez rizika, že bude vtažen do nekonečného sporu. Redakcím a pořadatelům akcí pomůže jednoduchý seznam otázek, jimiž si odbornost ověří ještě před pozváním.

Pro skutečné odborníky je užitečná podpora jejich institucí při veřejné komunikaci, aby nemuseli s falešnou odborností soupeřit sami a bez času.

Klientům, kteří podle falešné rady utrpěli škodu, pomáhá i informace o možnostech právní ochrany spotřebitele.

## 11. Postup při ověřování odborníka

1. **Dohledat práci mimo vlastní kanály** – publikace, projekty, praxi.
2. **Ověřit uvedené pracoviště** a reference.
3. **Zeptat se kolegů z oboru**, zda osobu a její práci znají.
4. **Položit konkrétní otázku**, na kterou nelze odpovědět obecně.
5. **Rozhodnout podle doložené práce**, ne podle objemu textu.

## 12. Prevence a odolnost

Prevence spočívá v tom, že instituce a média posuzují odborníky podle doložitelné práce a hodnocení kolegů, nikoli podle objemu a stylu textů. Pro veřejnost je užitečné vědět, že odborník se pozná i podle ochoty přiznat nejistotu a meze vlastního poznání. Odborné společnosti mohou pomoci veřejně dostupnými seznamy členů a jejich oborů, které usnadní ověření, a médiím mohou nabídnout kontakty na ověřené experty pro rychlé dotazy.

## Odborný kontext

Otázku, komu a proč věříme jako odborníkovi, rozebírá sociální epistemologie. Goldman (2001) formuloval problém laika, který má rozhodnout mezi dvěma experty, aniž by sám rozuměl oboru, a ukázal, že laik se musí opírat o nepřímé znaky: argumentační výkon, shodu s dalšími experty, nezávislé hodnocení a doložené výsledky. Syntetická odbornost padělá právě ty znaky, které jsou laikovi nejdostupnější – plynulost, terminologii, objem –, zatímco doložené výsledky a nezávislé hodnocení chybějí.

Fricker (2007) ukazuje druhou stranu téhož problému: v rozdělování důvěryhodnosti hrají roli předsudky, a kdo má „správnou“ formu, získá víc důvěry, než odpovídá jeho znalostem, zatímco jiní jsou neprávem přehlíženi. Generovaný text prohlubuje tuto nerovnost tím, že „správnou“ formu zpřístupňuje komukoli bez ohledu na obsah, a skuteční odborníci, kteří píší pomaleji a s výhradami, mohou v soutěži o pozornost prohrávat.

Detekce generovaného textu podle stylu je zatím nespolehlivá a nesmí sloužit jako samostatný důkaz; obrana proto musí směřovat k ověřování práce, nikoli textu. Goldmanova kritéria nabízejí praktický postup i pro redakce a úřady: ptát se po doložených výsledcích a po hodnocení od nezávislých kolegů.

## Souvislosti pro praxi

Pro média a pořadatele odborných akcí se vyplácí krátký ověřovací postup před pozváním experta: dohledat jeho práci mimo vlastní web a sociální sítě, ověřit uvedené pracoviště, zeptat se kolegů z oboru a položit v předběžném rozhovoru jednu konkrétní otázku, na kterou nelze odpovědět obecně. Takový postup nediskriminuje mladé nebo nezávislé odborníky, protože se netýká titulů, ale doložitelné práce, a zároveň spolehlivě odhalí většinu případů, kdy za odborným textem žádná odbornost nestojí.

## Literatura

- Fricker, M. (2007). *Epistemic Injustice: Power and the Ethics of Knowing*. Oxford University Press.
- Goldman, A. I. (2001). Experts: Which ones should you trust? *Philosophy and Phenomenological Research*.

## Související

**Sourozenecké techniky**

- [EA-9.1.6 LLM Source Attribution Bypass](@/kompendium/techniques/ea-9-1-6-llm-source-attribution-bypass.md) – smyšlené zdroje jako součást předstírané odbornosti.
- [EA-9.2.3 Synthetic Text Narrative](@/kompendium/techniques/ea-9-2-3-synthetic-text-narrative.md) – generovaný text ve větším měřítku.
- [EA-9.4.4 AI Bot Personhood](@/kompendium/techniques/ea-9-4-4-AI-bot-personhood.md) – předstíraná osoba místo předstírané odbornosti.

**Kapitola 2**

- [EA-2.1.1 Expertní disinflace](@/kompendium/techniques/ea-2-1-1-expertni-disinflation.md) – diskvalifikace skutečné odbornosti, zrcadlový vzorec.

**Obrana a právo**

- [Sebe-obrana: Hodnocení mentorů](@/kompendium/self-defense-guides/27-mentor-evaluation.md) – rozpoznání skutečné kompetence.
- [Znalec a EA](@/kompendium/forensic-legal/21-expert-witness-EA.md) – ověřování odborníků v řízení.
- [Sebe-obrana: Detekce AI obsahu](@/kompendium/self-defense-guides/40-ai-content-detection.md) – meze rozpoznávání generovaného textu.
