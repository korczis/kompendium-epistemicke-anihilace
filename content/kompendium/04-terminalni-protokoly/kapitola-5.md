+++
title = "Kapitola 5: Specializované bezpečnostní protokoly"
description = "Procedurální a institucionální safeguardy pro výzkum a praxi v oblasti terminálních protokolů."
weight = 2
insert_anchor_links = "right"

[taxonomies]
tags = ["kompendium", "terminalni-protokoly", "bezpecnostni-protokoly", "irb", "informovany-souhlas", "monitoring", "reintegrace", "etika-vyzkumu"]
categories = ["academic", "research"]

[extra]
related_terms = ["intra-simulacni-monitoring", "kapitola-4", "konceptualni-dekonstrukce", "kontrolovana-rekonstituce"]
access_level = "L2"
status = "publikovano"
+++

# Kapitola 5: Specializované bezpečnostní protokoly

> ⚠️ **L2 — Analytické porozumění.** Tato kapitola popisuje strukturální požadavky bezpečnostních protokolů pro práci s terminálními protokoly na úrovni výzkumné a klinické instituce. Implementační detaily konkrétních screeningových nástrojů, monitorovacích systémů a forenzních procedur jsou dostupné pouze prostřednictvím autorizovaných kanálů (úroveň L3+).

## Úvod: bezpečnost jako strukturální vlastnost, nikoli ad-hoc opatření

Práce v oblasti terminálních protokolů — ať už ve formě studia historických případů, klinické intervence po expozici, nebo simulativní výzkumné aktivity — generuje zvláštní třídu rizik, která **nelze mitigovat ad-hoc opatřeními**. Bezpečnost v této oblasti musí být **strukturální vlastností** výzkumné a klinické infrastruktury, integrovanou na úrovni protokolů, instituce, dokumentace a long-term follow-up.

Tato kapitola představuje systematickou taxonomii bezpečnostních protokolů, které musí být v platnosti pro etickou práci s terminálními protokoly. Pokrývá osm tematických oblastí:

1. Pre-engagement screening (před zahájením expozice)
2. Real-time monitoring (během expozice)
3. Post-engagement reintegrace (epistemická, emocionální, somatická)
4. Institucionální safeguards (IRB, etická komise, multi-tier review)
5. Whistleblower a consent withdrawal protokoly
6. Dokumentační požadavky a [chain of custody](@/glossary/chain-of-custody.md)
7. Long-term follow-up
8. Failure-mode response protokoly

Každá z těchto oblastí je nezbytná, ale žádná není sama o sobě dostatečná. Bezpečnost je **systémovou vlastností**, která vzniká pouze z koordinované implementace všech osmi vrstev.

## 1. Pre-engagement screening

Pre-engagement screening je první obranná linie. Jeho cílem je identifikovat subjekty, u nichž by participace v expozici terminálnímu protokolu (i v simulativní formě) představovala neúnosné riziko.

### Dimenze screeningu

Následující dimenze nejsou pořadím, v němž by cokoli bylo prováděno; jsou soubor míst, v nichž po vstupním posouzení zůstává stopa, a tedy míst, v nichž lze zpětně zjistit, že posouzení neproběhlo. Uvedené nástroje jsou standardní klinické instrumenty, a jejich jmenovitý výskyt v dokumentaci programu je proto sám dohledatelným znakem.

| Dimenze | Cíl | Nástroj, jehož použití bývá v záznamu doložené |
|---------|-----|-----------------------------------------------|
| **Anamnestická** | Identifikace historických rizikových faktorů | Strukturované anamnestické interview, zdravotní dokumentace |
| **Psychiatrická** | Identifikace aktivních psychiatrických kontraindikací | SCID-5, MINI, klinické interview |
| **Somatická** | Identifikace somatických kontraindikací | Komplexní fyzické vyšetření, kardiovaskulární a metabolický panel |
| **Neuropsychologická** | Baseline kognitivních funkcí, identifikace deficitů | Standardní neuropsychologická baterie (WAIS-IV, RBANS, etc.) |
| **Sociálně-kontextuální** | Identifikace sociálního rizika | Dotazníky sociální podpory, vztahová stabilita |
| **Motivační** | Identifikace problematických motivací (např. self-punishment) | Strukturované motivační interview |
| **Trauma-historická** | Identifikace komplexního traumatu | ACEs, Trauma History Questionnaire |
| **Suicidální** | Identifikace aktivního suicidálního rizika | C-SSRS, klinické zhodnocení |

### Stavy, za nichž odpovědné prostředí účast vylučuje

V záznamu odpovědného prostředí je dohledatelné, že u následujících stavů k účasti nedošlo. Rozpoznávacím znakem tedy není seznam sám, ale jeho uplatnění: prostředí, které někoho v některém z těchto stavů přijalo, je tím samo rozpoznatelné, a to bez ohledu na to, jak svůj výběr zdůvodňuje.

- Aktivní psychotická symptomatologie (jakéhokoli etiologie)
- Aktivní suicidální ideace s plánem
- Aktivní substance use disorder
- Komplexní PTSD bez stabilizace
- Disociativní porucha
- Aktivní major depressive episode mimo remisi
- Životně ohrožující somatické onemocnění
- Těhotenství nebo plánování těhotenství během periody expozice
- Mladší věk než 21 let (s výjimkou specificky designovaných pediatrických protokolů s nadstandardními safeguardy)

### Stavy, které odpovědné prostředí posuzuje jednotlivě

U následujících stavů je v záznamu dohledatelné individuální klinické posouzení, a to posouzení vedené někým, kdo na účasti daného člověka nemá zájem. Úplná absence takového posouzení je znak pozorovatelný zvenčí; jeho formální přítomnost u každého posuzovaného bez jediného odmítnutí je znak druhý.

- Reziduální PTSD symptomatologie
- Subklinické deprese nebo úzkost
- Recentní život events s vysokým stresovým impactem
- Limitovaná sociální podpora
- Profesionální vyhoření

### Informovaný souhlas

[Informovaný souhlas](@/glossary/informed-consent.md) v kontextu terminálních protokolů musí splňovat **rozšířené standardy** beyond běžných výzkumných nebo klinických norem:

- **Granulární souhlas** — Souhlas pro každou fázi separátně, nikoli jednorázový blanket consent
- **Iterativní obnovování** — Re-konsent před každou major expozicí
- **Kapacitní hodnocení** — Formální zhodnocení decision-making capacity před každým konsent eventem
- **Cooling-off period** — Odklad mezi prezentací informací a podpisem souhlasu; kompendium jeho délku neuvádí, protože rozpoznatelné je, zda odklad existoval, a ne jak byl dlouhý
- **Neutrální informátor** — Konsent získává osoba bez konfliktu zájmů s výzkumným programem
- **Plně dokumentované riziko** — Explicitní popis akutních i dlouhodobých rizik
- **Dokumentovaná možnost ukončení** — Subjekt explicitně potvrzuje porozumění abort signálu a absenci penalizace

## 2. Real-time monitoring během expozice

Během aktivní expozice (simulativní nebo terapeutické) musí být zaveden multi-modální real-time monitoring zachycující signály akutní dekompenzace v co nejranější fázi.

### Monitorované dimenze

| Dimenze | Indikátor | Frekvence měření |
|---------|-----------|------------------|
| **Kardiovaskulární** | HR, HRV, BP | Kontinuálně |
| **Respirační** | Frekvence, pattern | Kontinuálně |
| **Autonomní** | EDA (skin conductance), kortizol | Kontinuálně / periodicky |
| **Behaviorální** | Strukturované pozorování, video review | Kontinuálně |
| **Verbální** | Strukturované check-in, lingvistická analýza | Opakovaně v krátkých intervalech |
| **Kognitivní** | Krátké kognitivní probes (working memory, attention) | Opakovaně v delších intervalech |
| **Emocionální** | [Self-report](@/glossary/self-report.md) VAS, observer rating | Opakovaně v průběhu expozice |
| **Disociativní** | validovaná krátká forma DES (DES-T, DES-B), observer rating | podle protokolu pracoviště |

### Co pozorovatelé v záznamech nacházejí pohromadě

Markery akutní dekompenzace se v tomto materiálu neohlašují po jednom. Nacházejí se v záznamech ve skupinách, a právě jejich souběh je tím, co pozorovatel zaznamená dříve, než dokáže pojmenovat, co vidí: pokles variability srdeční frekvence proti výchozí hodnotě spolu s přetrvávajícím vysokým subjektivním stresem a mírnou dezorientací; silná autonomní dysregulace spolu se střední disociativní symptomatologií a s verbalizací, která se k disociaci přibližuje; v nejvážnějších případech akutní psychotická symptomatologie, suicidální ideace, život ohrožující kardiovaskulární událost nebo disociativní stav s úplnou ztrátou kontaktu s realitou, zpravidla ve společnosti několika z předchozích znaků.

Kompendium k těmto souběhům neuvádí stupně, hodnoty ani odpovědi, které by na ně byly vázané, a nepodává je jako prahy, po jejichž překročení se něco koná. Steele a kol. (2017) upozorňují, že u disociativních stavů je jednotlivý znak vždy vysvětlitelný jinak a že klinickou váhu mu dává teprve souběh; tatáž vlastnost činí z každé publikované hranice spíše nástroj k jejímu obcházení než nástroj k ochraně.

Rozpoznatelné je něco jiného a v záznamech dohledatelné i po letech: zda byl souběh vůbec zapsán, zda u něj byla uvedena osoba, která o pokračování rozhodla, a zda tato osoba stála mimo tým, který expozici vedl. Poslední z těchto tří údajů má největší rozlišovací sílu, protože na rozdíl od prvních dvou nelze doplnit zpětně.

### Personální požadavky

Monitorovací tým musí zahrnovat:

- **Principal investigator / klinický supervizor** — Konečná autorita pro kontinuaci expozice
- **Medical officer** — Aktuálně licencovaný lékař přítomný on-site
- **Psychiatrist on call** — Dostupný v reálném čase
- **Behavioral observer** — Strukturované pozorování v reálném čase
- **Technical operator** — Operace monitorovacího systému
- **Subject advocate** — Nezávislá osoba zastupující zájmy subjektu, **bez konfliktu zájmů s výzkumným týmem**

## 3. Post-engagement reintegrace

Reintegrační fáze je integrální součástí, nikoli volitelným doplňkem. Její struktura musí adresovat tři dimenze: epistemickou, emocionální a somatickou.

### Epistemická reintegrace

Cíl: rekonstrukce koherentní epistemické narrativy zkušenosti a integrace případných destabilizací do funkčního epistemického systému.

**Komponenty:**

- **Strukturovaná narrativní rekonstrukce** — Subjekt vytváří vlastní narrativu zkušenosti, podporován bez direkce
- **Edukativní debrief** — Explicitní popis mechanismů, kterým byl subjekt vystaven (technika [transparentní dekonstrukce](@/kompendium/techniques/_index.md))
- **Meta-kognitivní review** — Reflexe vlastních reakčních vzorců a copingových strategií
- **Konfrontace s pre-existujícími konceptuálními schématy** — Strukturovaná integrace zkušenosti s [pre-existujícími přesvědčeními](@/glossary/epistemicka-anihilace.md)
- **Validace epistemické autonomie** — Explicitní afirmace subjektovy schopnosti vlastní interpretace zkušenosti

### Emocionální reintegrace

Cíl: zpracování akutních emocionálních reakcí; prevence vzniku perzistentních traumatických symptomů.

**Komponenty:**

- **Akutní emocionální regulace** — Bezprostřední post-exposure podpora regulace
- **Strukturovaný emocionální debrief** — Inspirovaný critical incident stress debriefing, ale adaptovaný pro extrémní expozici
- **Trauma-focused therapy** podle indikace (EMDR, prolonged exposure, CPT)
- **Skupinová podpora** s ostatními participanty (pokud aplikovatelné)
- **Long-term emocionální follow-up** — Periodická kontrola emocionálního stavu

### Somatická reintegrace

Cíl: regulace autonomního systému; resolution somatických sekvel; rekonstrukce somatické bezpečnosti.

**Komponenty:**

- **Akutní somatická stabilizace** — HR, BP, dýchání
- **Somatické techniky regulace** — Inspirované Somatic Experiencing, polyvagal-informed přístupy
- **Pohyb a bodywork** — Strukturované přístupy k re-embodiment
- **Sleep hygiene** — Specifické intervence pro post-exposure sleep disturbances
- **Nutriční podpora** — Adresování metabolických sekvel intenzivního stresu

### Časová struktura reintegrace

Reintegrace má rozpoznatelnou časovou strukturu, ale kompendium k žádné z jejích fází neuvádí trvání. Publikovaná čísla by se stala lhůtami, a lhůta je v prostředí, které reintegraci nechce platit, používána jako doklad, že reintegrace proběhla. Rozpoznatelná je proto posloupnost, a ne délka: akutní stabilizace a monitoring bezprostředně po ukončení expozice; strukturovaný debrief a první integrace, jejichž místo v posloupnosti je až po stabilizaci; pokračující terapie a vzájemná podpora účastníků; strukturovaná follow-up sezení; a nakonec periodické kontroly s dostupnou intervencí na vyžádání.

Herman (1992) popisuje tutéž posloupnost u zotavení z traumatu a upozorňuje, že její členy nelze zaměnit: bezpečí předchází vzpomínání a vzpomínání předchází opětovné spojení se světem. Porušení pořadí je v záznamech patrné a projevuje se dříve než samo selhání reintegrace — nejčastěji tím, že strukturovaný debrief je veden v době, kdy účastník ještě nespal.

## 4. Institucionální safeguards

Žádný individuální výzkumník ani klinik nemá kapacitu nést plnou odpovědnost za bezpečnost práce s terminálními protokoly. Bezpečnost vyžaduje **multi-tier institucionální infrastrukturu**.

### IRB (Institutional Review Board) struktura

Standardní IRB nepostačuje. Pro práci s terminálními protokoly je nezbytný **specializovaný review board** s následující strukturou:

**Povinné role:**

- Klinický psycholog nebo psychiatr s expertízou v trauma a [epistemické anihilaci](@/glossary/epistemicka-anihilace.md)
- Etik specializovaný na výzkumnou etiku v high-risk oblastech
- Právní expert v oblasti výzkumné etiky a informovaného souhlasu
- Subject advocate — osoba zastupující perspektivu participantů
- Komunita representative — externí osoba bez vazby na výzkumnou instituci
- Expert v relevantní subject area (vojenský, klinický, intelligence)

**Procedurální požadavky:**

- Prospektivní review každého protokolu před zahájením
- Ongoing review v pravidelných intervalech (typicky kvartálně)
- Adverse event review bez odkladu
- Annual program review s power to suspend or modify
- Externí audit minimálně 1× ročně

### Multi-tier review

Kritická rozhodnutí (modifikace protokolu, intervence v reálném čase, řešení adverse events) musí procházet **multi-tier review**:

**Tier 1 — Operativní:** Principal investigator + medical officer (real-time decisions)

**Tier 2 — Supervizní:** PI + IRB chair + nezávislý klinický supervizor (denní review)

**Tier 3 — Strategický:** Plný IRB + institutional officer + externí expert (týdenní/měsíční review)

**Tier 4 — Eskalovaný:** Plný IRB + institutional executive + externí etická konsultace (adverse events, major modifications)

## 5. Whistleblower a consent withdrawal protokoly

### Consent withdrawal

Informovaný souhlas musí být **withdrawable** v kterémkoli okamžiku **bez negativních konsekvencí**:

- **Žádné penalizace** — Subjekt nesmí utrpět profesionální, finanční ani sociální újmu
- **Plný přístup k post-engagement péči** — Withdrawal nesmí ukončit přístup k reintegrační podpoře
- **Plná destrukce / kontrola dat** — Subjekt má právo na destrukci či kontrolu nad daty zaznamenanými během jeho participace
- **Strukturovaný withdrawal proces** — Withdrawal je strukturovaný proces s dedicated personnel, ne ad-hoc událost
- **Long-term contact rights** — Subjekt si zachovává právo kontaktu s programem i po withdrawal

### Whistleblower protokoly

Pro adresování problematických praktik uvnitř výzkumného programu:

- **Anonymní reporting kanály** — Externí (mimo organizační hierarchii)
- **Ochrana před retaliation** — Formální i strukturální
- **Externí ombudsman** — Nezávislý kontaktní bod
- **Strukturovaný investigation proces** — Pro každé reportované concern
- **Mandatory reporting** některých kategorií concerns externím autoritám (federal agencies, professional licensing boards)
- **Public accountability** — Periodické reporty o whistleblower aktivitě (anonymizované)

## 6. Dokumentační požadavky a chain of custody

Robustní dokumentace je nezbytná pro:

- Etickou accountability
- Forenzní potřeby (pokud dojde k adverse event)
- Reprodukovatelnost výzkumu
- Ochranu subjektů i výzkumníků

### Dokumentační vrstvy

| Vrstva | Obsah | Retence |
|--------|-------|---------|
| **Protokol** | Plný popis výzkumného/klinického protokolu, IRB approval, modifikace | Permanentně |
| **Konsent** | Všechny verze konsent dokumentů, signed copies, capacity assessments | Permanentně |
| **Pre-engagement** | Screening data, inclusion/exclusion rozhodnutí, baseline measurements | 25 let |
| **Engagement** | Real-time monitoring data, observer notes, video/audio recordings | 25 let |
| **Post-engagement** | Debrief notes, klinické záznamy, follow-up data | 25 let |
| **Adverse events** | Plný incident report, root cause analysis, corrective actions | Permanentně |
| **IRB komunikace** | Všechny submisions, reviews, korespondence | Permanentně |

### Chain of custody

Pro citlivé data (zejména video/audio recordings, identifikovatelné psychiatrické záznamy):

- **Cryptographic integrity** — Hash-based verification of integrity
- **Access logging** — Plný audit trail každého přístupu
- **Tiered access control** — Rozdělené úrovně přístupu podle role
- **Encrypted at rest a in transit**
- **Geographic separation** primary a backup storage
- **Periodic integrity audits**

### Audit logs

Standardní auditní log musí zachycovat:

- Kdo přistupoval k datům
- Kdy
- Z jaké lokace
- K jakým specifickým záznamům
- Pro jaký účel
- Pod jakou autorizací

## 7. Long-term follow-up

Reintegrační fáze nekončí ukončením aktivního programu. Long-term follow-up je integrální součástí.

### Struktura dlouhodobého sledování

Dlouhodobé sledování má v odpovědném prostředí předem stanovené body, v nichž se účastník s klinikem potká bez ohledu na to, zda si o to řekl. Kompendium jejich rozvrh neuvádí: počet měsíců je údajem o provedení, a navíc by vytvářel zdání, že program, který rozvrh formálně vyhlásil, jej také naplnil. Dohledatelné je, zda sledování začalo dříve, než o ně někdo požádal, zda zahrnovalo opakované klinické interview a cílený screening na posttraumatickou, depresivní a úzkostnou symptomatologii, zda se někdy opakovalo neuropsychologické vyšetření proti výchozímu nálezu, a zda byl přechod do běžné péče někde zaznamenán, nebo zda sledování pouze přestalo.

Briere a Scott (2014) upozorňují, že pozdní nástup příznaků po expozici tohoto druhu je pravidlem, a nikoli výjimkou, a že programy bez dlouhodobého sledování o něm proto nemají žádná data — nikoli proto, že by k němu nedocházelo, nýbrž proto, že nikdo nebyl v kontaktu, aby je zaznamenal.

### On-demand availability

Mimo strukturovaný schedule musí být dostupná **on-demand péče**:

- 24/7 krizová linka
- Rapid access ke specializovanému kliniku
- Strukturovaný re-engagement protokol pro late-onset symptomy

### Long-term outcome research

Etická obligace pokračuje v podobě long-term outcome research:

- Sledování dlouhodobých outcomes (5+ let)
- Identifikace late-onset adverse effects
- Refinement protokolů na základě long-term dat
- Publikace findings (anonymizovaně) pro benefit field

## 8. Failure-mode response protokoly

I při dokonale designovaném programu může dojít k akutní dekompenzaci subjektu. Protokoly odpovědi na selhání musí být **explicitně připravené**.

### Klasifikace failure modes

**Acute decompensation:**

- Akutní psychotická epizoda
- Suicidální krize
- Disociativní stav
- Život ohrožující somatická událost

**Sub-acute decompensation:**

- Vznikající PTSD symptomatologie
- Disociativní symptomy přetrvávající i po odeznění akutní expozice
- Major depressive episode
- Substance use jako coping

**Chronic decompensation:**

- Komplexní PTSD
- Maladaptivní coping mechanismy
- Profesionální dysfunkce
- Sociální isolation

### Response protokoly

**Pro akutní dekompenzaci:**

1. **Okamžitá stabilizace** — Medical officer + psychiatrist on call
2. **Bezpečnostní zajištění** — Subjekt v bezpečném prostředí, suicide watch pokud indikováno
3. **Akutní psychiatrická intervence** — Hospitalization pokud indikována
4. **Notifikace** — Family member (s pre-konsentem subjektu), institutional leadership, IRB
5. **Adverse event report** — Bez odkladu
6. **Root cause analysis** — Neprodleně po stabilizaci subjektu
7. **Programová pauza** — Suspendování engagementu ostatních subjektů do RCA completion

**Pro sub-akutní dekompenzaci:**

1. **Strukturovaná klinická eskalace** — Intenzivnější terapeutická intervence
2. **Možná pauza** v further engagement
3. **Adverse event report** — Bez odkladu
4. **Modifikace protokolu** podle findings

**Pro chronickou dekompenzaci:**

1. **Long-term klinická péče** — Plně hrazena programem
2. **Zaměstnanecká podpora** v případě profesionálních impactů
3. **Vztahová a rodinná podpora**
4. **Outcome documentation** pro long-term research

### Lessons learned integration

Každý adverse event musí vést k **strukturované integraci poznatků** do programu:

- Root cause analysis s nezávislou účastí
- Konkrétní corrective actions
- Modifikace protokolu pokud indikováno
- Sdílení findings s broader research community (anonymizovaně)
- Re-screening předchozích participantů pro related risk faktors

## Vztah ke specializovaným platformovým komponentám

Robustní bezpečnostní protokoly nejsou pouze procedurálním ukotvením, ale vyžadují integraci s platformovou infrastrukturou:

- **[Filozofie: Intelektuální suverenita](@/philosophy/intellectual-sovereignty.md)** — Filozofický rámec, který informuje cílový stav reintegrace (zachování či rekonstituce epistemické autonomie).
- **[Filozofie: Epistemická integrita](@/philosophy/epistemic-integrity.md)** — Etický rámec definující obligace výzkumníka vůči subjektovi.

## Závěr

Specializované bezpečnostní protokoly pro práci s terminálními protokoly tvoří **osmivrstvý systém**, kde každá vrstva adresuje specifickou kategorii rizika a žádná vrstva sama o sobě nepostačuje. Implementace tohoto systému vyžaduje:

1. **Institucionální commitment** s adekvátní investicí zdrojů
2. **Multi-disciplinární expertízu** napříč klinickými, etickými a forenzními oblastmi
3. **Robustní governance** s aktivním IRB a externí supervizí
4. **Long-term perspectivu** s dlouhodobým follow-upem
5. **Kulturu transparentnosti** umožňující whistleblower aktivitu a learning from failures

Pro výzkumné a klinické instituce z toho vyplývá, že **práce s terminálními protokoly nemá být zahájena bez plně etablované všech osmi vrstev** bezpečnostního systému. Pokus o ad-hoc adaptaci v průběhu programu je strukturálně neefektivní a eticky problematický.

Žádný protokol nemůže garantovat absolutní bezpečnost při práci v této oblasti. Cílem je dosáhnout **přijatelné úrovně rizika** ve vztahu k explicitně artikulovaným benefitům, s plnou transparentností tohoto trade-off vůči všem stakeholderům — subjektům, výzkumníkům, instituci a širší společnosti.

Návaznost: [Sekce 06 — Klinické aplikace](@/kompendium/06-klinicke-aplikace/_index.md) detailuje terapeutické rámce pro post-traumatic recovery a long-term care subjektů, kteří byli (ať už v klinickém, výcvikovém nebo adversariálním kontextu) vystaveni terminálním protokolům.

## Osm vrstev jako rozpoznávací rastr

Osm vrstev popsaných výše bylo v původním rámcování seznamem toho, co má instituce zavést. V defenzivním čtení mají jiný a pro čtenáře této knihy podstatnější smysl: tvoří rastr, v němž je nepřítomnost každé vrstvy zjistitelná zvenčí a zpětně, protože každá z nich po sobě nechává jiný druh dokumentu. Vstupní posouzení nechává nález, monitoring záznam, reintegrace účet, dohled zápis z jednání, dokumentace vlastní evidenci přístupů, dlouhodobé sledování kontaktní historii a odpověď na selhání analýzu příčin. Tento závazek vůči dohledatelnosti je formulován v [etickém kodexu](@/kompendium/08-prilohy/eticky-kodex.md) kompendia.

Prostředí, v němž je materiál tohoto druhu studován, lze proto od prostředí, v němž je vykonáván, odlišit bez přístupu k průběhu kterékoli expozice. Rozhodující není, co která instituce o sobě tvrdí, nýbrž která z těchto stop u ní existuje a která nikdy nevznikla. Emanuel a kol. (2000) uvádějí nezávislost hodnocení a doložitelnost dohledu mezi podmínkami, bez nichž výzkumná účast není eticky obhajitelná, a obě tyto podmínky jsou právě tou částí, jejíž absence je nejsnáze prokazatelná.

Pro klinika, který vidí člověka po takové expozici, z toho vyplývá postup, který nevyžaduje nic z technického obsahu této kapitoly: zjistit, které z uvedených stop existují, a nepovažovat jejich absenci za administrativní nedostatek. Pro vyšetřovatele platí totéž s opačným pořadím zájmu. Pro čtenáře, který expozici prošel sám, má popsaný rastr ještě jiný význam: nepřítomnost stop není tím, co by si měl vyčítat, a vysvětlení, že záznam nebyl veden „kvůli ochraně soukromí účastníků“, je samo zaznamenatelným jevem.

*Interpretace knihy:* z toho plyne, proč tato kapitola neuvádí lhůty, hodnoty ani rozvrhy. Každé takové číslo se stává nejprve kritériem splnění a vzápětí náhradou za to, co mělo měřit; rozpoznávací síla naopak zůstává tomu, co je buď doloženo, nebo doloženo není.

## Literatura

- Briere, J., & Scott, C. (2014). *Principles of Trauma Therapy: A Guide to Symptoms, Evaluation, and Treatment*. 2. vydání. Sage.
- Emanuel, E. J., Wendler, D., & Grady, C. (2000). „What Makes Clinical Research Ethical?“ *JAMA*, 283(20), 2701–2711.
- Herman, J. L. (1992). *Trauma and Recovery*. Basic Books.
- Steele, K., Boon, S., & Van der Hart, O. (2017). *Treating Trauma-Related Dissociation: A Practical, Integrative Approach*. W. W. Norton.

## Související

- [Sekce 04 — Terminální protokoly (úvod)](@/kompendium/04-terminalni-protokoly/_index.md)
- [Kapitola 4: Extrémní výcviková sekvence](@/kompendium/04-terminalni-protokoly/kapitola-4.md)
- [Sekce 03: Základní kategorie epistemických manipulací](@/kompendium/03-zakladni-kategorie/_index.md)
- [Sekce 06: Klinické aplikace](@/kompendium/06-klinicke-aplikace/_index.md) — terapeutické rámce
- [Techniky: EA-1.X.Y](@/kompendium/techniques/_index.md) — specifické manipulační techniky
- [Glosář: Epistemická anihilace](@/glossary/epistemicka-anihilace.md)
- [Glosář: Kognitivní anihilace](@/glossary/kognitivni-anihilace.md)
- [Glosář: Anankastický režim](@/glossary/anankasticky-rezim.md)
- [Glosář: Metakognitivní destrukce](@/glossary/metakognitivni-destrukce.md)
- [Glosář: Ontologická anihilace](@/glossary/ontologicka-anihilace.md)
- [Filozofie: Intelektuální suverenita](@/philosophy/intellectual-sovereignty.md)
- [Filozofie: Epistemická integrita](@/philosophy/epistemic-integrity.md)
- [Etický kodex kompendia](@/kompendium/08-prilohy/eticky-kodex.md) · [Supervizní rámce](@/kompendium/06-klinicke-aplikace/supervizni-ramce.md) · [Před-simulační screening](@/kompendium/04-terminalni-protokoly/pred-simulacni-screening.md) · [Intra-simulační monitoring](@/kompendium/04-terminalni-protokoly/intra-simulacni-monitoring.md)
