+++
title = "7.40 Friston: Active Inference a free energy principle"
description = "Karl Friston: princip volné energie, prediktivní kódování, přesnost a aktivní inference; kritiky rámce a interpretace pro EA techniky působící na očekávání a důvěru ve vnímání."
weight = 40
insert_anchor_links = "right"

[taxonomies]
tags = ["kompendium", "friston", "free-energy", "active-inference", "prediktivni-mozek", "neurovedy"]
categories = ["academic", "philosophy"]

[extra]
related_terms = ["filosoficky-ramec", "floridi-fourth-revolution", "hannah-arendt-myslení", "harari-sapiens-narativ"]
section_icon = "🪐"
toc = true
+++

# 7.40 Friston: Active Inference a free energy principle

Britský neurovědec Karl Friston, známý také jako autor metody statistického parametrického mapování pro analýzu zobrazovacích dat mozku, formuloval od poloviny 2000. let princip volné energie (*free energy principle*) a na něm založenou teorii aktivní inference (*active inference*). Základní stať vyšla s Jamesem Kilnerem a Lee Harrisonem (Friston a kol., 2006), přehledová stať pod názvem „The free-energy principle: a unified brain theory?“ (Friston, 2010) a souhrnná učebnice s Thomasem Parrem a Giovannim Pezzulem (Parr a kol., 2022). Kapitola vykládá rámec z těchto textů, shrnuje kritiky a odděleně uvádí, jak jej [kompendium EA](@/glossary/kompendium-ea.md) užívá; toto užití je interpretací knihy.

## Princip volné energie

Výchozí otázka zní, jak může živý systém přetrvávat v proměnlivém prostředí, tedy udržovat se v omezeném souboru stavů, které jsou s jeho existencí slučitelné. Friston odpovídá, že takový systém musí v průměru minimalizovat překvapení (*surprisal*), tedy nepravděpodobnost svých smyslových vstupů vzhledem k modelu světa, který ztělesňuje (Friston, 2010). Překvapení samo systém spočítat nemůže, ale může minimalizovat jeho horní mez, variační volnou energii, což je veličina převzatá ze statistické fyziky a strojového učení.

Minimalizace volné energie je formálně ekvivalentní přibližné bayesovské inferenci: systém má generativní model, který předpovídá smyslové vstupy z odhadovaných příčin, a průběžně jej upravuje tak, aby předpovědi odpovídaly datům (Friston a kol., 2006). Rámec tak navazuje na starší myšlenku vnímání jako nevědomého usuzování a na hierarchické prediktivní kódování, v němž vyšší úrovně mozkové kůry předpovídají činnost nižších a nižší úrovně posílají vzhůru jen chybu předpovědi (Rao a Ballard, 1999).

## Přesnost a chyba předpovědi

Klíčovým pojmem rámce je přesnost (*precision*), tedy odhadovaná spolehlivost signálu. Mozek podle modelu nepřikládá všem chybám předpovědi stejnou váhu, ale váží je podle toho, jak spolehlivé je považuje (Friston, 2010). Chyba s vysokou přesností vede k úpravě modelu, chyba s nízkou přesností je přehlížena. Pozornost se v tomto rámci vykládá právě jako optimalizace přesnosti. Andy Clark ve vlivném přehledu ukázal, jak tento princip propojuje vnímání, pozornost a jednání do jednoho obrazu „prediktivního mozku“ (Clark, 2013), a Jakob Hohwy jej rozpracoval jako obecnou teorii mysli (Hohwy, 2013).

## Aktivní inference

Chybu předpovědi lze snížit dvěma způsoby: změnou modelu, aby lépe odpovídal světu, nebo změnou světa, aby lépe odpovídal modelu. Druhou cestou je jednání, a teorie aktivní inference proto chápe pohyb a volbu jako součást téhož procesu jako vnímání (Friston a kol., 2017). Organismus jedná tak, aby získával vstupy, které jeho model předpovídá, včetně vstupů odpovídajících jeho preferovaným stavům.

Proti tomu se nabízí námitka „temné místnosti“: pokud organismus minimalizuje překvapení, proč nevyhledá tmavou, tichou místnost a nezůstane v ní? Friston, Christopher Thornton a Andy Clark odpovídají, že organismus minimalizuje překvapení vzhledem ke svému modelu, a model živého tvora předpovídá, že bude hledat potravu, společnost a informace; temná místnost by byla překvapivá (Friston a kol., 2012). V pozdějších formulacích teorie zahrnuje očekávaná volná energie i epistemickou hodnotu, tedy zisk informací, takže zvídavost a průzkum jsou součástí modelu, nikoli jeho výjimkou (Friston a kol., 2017).

## Markovova pokrývka

K vymezení systému proti prostředí Friston užívá pojem Markovovy pokrývky (*Markov blanket*), převzatý ze statistiky: souboru stavů, které oddělují vnitřní stavy systému od vnějších tak, že vnitřní a vnější stavy jsou na sobě podmíněně nezávislé (Friston, 2013). Smyslové stavy zprostředkují vliv prostředí dovnitř, aktivní stavy vliv systému navenek. Friston tvrdí, že každý systém s Markovovou pokrývkou, který přetrvává, se bude chovat, jako by minimalizoval volnou energii, a odtud plyne ambice rámce vysvětlit nejen mozek, ale život vůbec.

## Prediktivní výklad psychózy

Rámec se uplatnil v počítačové psychiatrii. Rick Adams a spolupracovníci, mezi nimi Friston, navrhli, že některé příznaky psychózy lze vykládat jako narušení přesnosti, s níž mozek váží předpovědi a smyslové důkazy (Adams a kol., 2013). Paul Fletcher a Chris Frith předtím ukázali, jak bayesovský rámec může vysvětlit souvislost bludů a halucinací: nepřesně vážená chyba předpovědi vyžaduje vysvětlení a vysvětlení zpětně ovlivňuje vnímání (Fletcher a Frith, 2009). Na tyto práce navazuje starší hypotéza Shitije Kapura o aberantní salienci, podle níž psychóza začíná tím, že běžné podněty začnou působit nepatřičně významně (Kapur, 2003). Přehled Philippa Sterzera a kolegů upozorňuje, že empirická data jsou smíšená a že různé příznaky mohou odpovídat různým poruchám přesnosti (Sterzer a kol., 2018).

## Hlavní kritiky

Nejčastější námitka se týká statusu principu. Friston sám jej popisuje jako princip podobný variačním principům fyziky, který neplatí empiricky, ale matematicky; kritici z toho vyvozují, že princip sám nelze vyvrátit a empiricky testovatelné jsou jen konkrétní modely, které se z něj odvozují (Colombo a Wright, 2021). Jelle Bruineberg a spolupracovníci ukázali, že pojem Markovovy pokrývky se v literatuře užívá ve dvou odlišných smyslech: jako nástroj statistického modelování a jako tvrzení o skutečné hranici organismu, a že přechod mezi nimi není zdůvodněn (Bruineberg a kol., 2022).

Další námitky se týkají srozumitelnosti a rozsahu. Matematický aparát je náročný, terminologie se v čase měnila a ambice vysvětlit „vše živé“ vyvolává obavu, že teorie vysvětluje příliš mnoho, a tedy málo (Colombo a Wright, 2021). Andy Clark, sám zastánce prediktivního přístupu, upozorňuje, že prediktivní zpracování jako empirická teorie mozku a princip volné energie jako obecný princip života jsou dvě různá tvrzení s různou mírou opory (Clark, 2016).

## Interpretace pro rámec EA

Následující čtení je interpretací knihy a není součástí Fristonovy teorie. Kniha přebírá z rámce pojem přesnosti a s jeho pomocí popisuje rozpoznatelnou strukturu některých vzorců z taxonomie. Pojmy [predictive processing](@/glossary/predictive-processing.md) a přesnost poskytují jazyk pro to, co klinická literatura o donucující kontrole popisuje fenomenologicky: postižený člověk postupně přestává důvěřovat vlastnímu vnímání a paměti a přikládá větší váhu výkladu druhé osoby (srov. Stark, 2007).

V tomto čtení působí [gaslighting](@/glossary/gaslighting.md) na váhu, kterou člověk přikládá vlastním smyslovým důkazům a vzpomínkám, a uzavřené skupiny upevňují předpoklady tak silné, že protichůdná zkušenost je vysvětlena jako potvrzení (srov. Fletcher a Frith, 2009). [Sociální izolace](@/glossary/socialni-izolace.md) podle téhož čtení odebírá zdroje, které by mohly předpovědi korigovat. Kniha zdůrazňuje, že jde o analogii pomocí pojmového rámce, nikoli o neurovědecké zjištění o lidech, kteří manipulaci zažili.

## Rozpoznání, odlišení a obrana

Rozpoznávacím znakem v tomto rámci je asymetrie důvěry: člověk soustavně dává přednost výkladu jedné osoby nebo skupiny před vlastním vnímáním a před výpověďmi jiných, a každá nesrovnalost je vysvětlena tak, že výklad posílí (Stark, 2007). Tento vzorec je třeba odlišit od psychózy, která má vlastní klinický obraz a vyžaduje psychiatrické posouzení; prediktivní modely psychózy nejsou diagnostickým nástrojem a kniha je jako takové neužívá (Sterzer a kol., 2018).

Obrana, kterou kniha odvozuje, odpovídá epistemické hodnotě, kterou do modelu zabudovali sami autoři teorie: obnovit přísun nezávislé zkušenosti a informací, které mohou předpovědi korigovat (Friston a kol., 2017). Prakticky to znamená vést si vlastní záznamy událostí, ověřovat si vnímání u osob mimo vztah nebo skupinu a postupně obnovovat důvěru ve vlastní smysly v bezpečném prostředí. Kontext klinické práce rozebírá [sekce klinických aplikací](@/kompendium/06-klinicke-aplikace/_index.md) a zásady zotavení po traumatu shrnuje Judith Hermanová (Herman, 1992).

## Meze a otevřené otázky

Princip volné energie je ambiciózní a sporný rámec a kniha na něm nestaví žádné empirické tvrzení o konkrétních lidech (Bruineberg a kol., 2022). Otevřená zůstává otázka, zda pojem přesnosti přidává k fenomenologickému popisu manipulace něco víc než přesnější slovník, a zda by se dal empiricky ověřit, například ve výzkumu, jak se po odchodu z kontrolujícího vztahu obnovuje důvěra ve vlastní vnímání (srov. Clark, 2016). Otevřená je i etická otázka: výpočetní modely mysli mohou sloužit porozumění i cílenému ovlivňování, a jejich užití proto vyžaduje stejný obranný rámec jako zbytek knihy (srov. Parr a kol., 2022).

## Literatura

- Adams, R. A., Stephan, K. E., Brown, H. R., Frith, C. D., & Friston, K. J. (2013). The computational anatomy of psychosis. *Frontiers in Psychiatry*, 4.
- Bruineberg, J., Dołęga, K., Dewhurst, J., & Baltieri, M. (2022). The Emperor's new Markov blankets. *Behavioral and Brain Sciences*, 45.
- Clark, A. (2013). Whatever next? Predictive brains, situated agents, and the future of cognitive science. *Behavioral and Brain Sciences*, 36.
- Clark, A. (2016). *Surfing Uncertainty: Prediction, Action, and the Embodied Mind*. Oxford University Press.
- Colombo, M., & Wright, C. (2021). First principles in the life sciences: The free-energy principle, organicism, and mechanism. *Synthese*, 198.
- Fletcher, P. C., & Frith, C. D. (2009). Perceiving is believing: A Bayesian approach to explaining the positive symptoms of schizophrenia. *Nature Reviews Neuroscience*, 10.
- Friston, K. (2010). The free-energy principle: A unified brain theory? *Nature Reviews Neuroscience*, 11.
- Friston, K. (2013). Life as we know it. *Journal of the Royal Society Interface*, 10.
- Friston, K., Kilner, J., & Harrison, L. (2006). A free energy principle for the brain. *Journal of Physiology – Paris*, 100.
- Friston, K., Thornton, C., & Clark, A. (2012). Free-energy minimization and the dark-room problem. *Frontiers in Psychology*, 3.
- Friston, K., FitzGerald, T., Rigoli, F., Schwartenbeck, P., & Pezzulo, G. (2017). Active inference: A process theory. *Neural Computation*, 29.
- Herman, J. L. (1992). *Trauma and Recovery*. Basic Books.
- Hohwy, J. (2013). *The Predictive Mind*. Oxford University Press.
- Kapur, S. (2003). Psychosis as a state of aberrant salience. *American Journal of Psychiatry*, 160.
- Parr, T., Pezzulo, G., & Friston, K. J. (2022). *Active Inference: The Free Energy Principle in Mind, Brain, and Behavior*. MIT Press.
- Rao, R. P. N., & Ballard, D. H. (1999). Predictive coding in the visual cortex. *Nature Neuroscience*, 2.
- Stark, E. (2007). *Coercive Control: How Men Entrap Women in Personal Life*. Oxford University Press.
- Sterzer, P., Adams, R. A., Fletcher, P., Frith, C., a kol. (2018). The predictive coding account of psychosis. *Biological Psychiatry*, 84.

## Související

**Teoretické reflexe**

- [7.5 Kognitivní vědy a EA](@/kompendium/07-teoreticke-reflexe/kognitivni-vedy.md) – prediktivní zpracování v širším kontextu.
- [7.41 Clark: Rozšířená mysl](@/kompendium/07-teoreticke-reflexe/clark-extended-mind.md) – Clarkův filozofický rámec prediktivní mysli.
- [7.44 Varela: Enaktivismus](@/kompendium/07-teoreticke-reflexe/varela-enactivism.md) – alternativní pojetí organismu a prostředí.
- [7.39 Tononi: IIT](@/kompendium/07-teoreticke-reflexe/tononi-iit.md) – jiná ambiciózní teorie vědomí a její kritiky.

**Techniky a klinika**

- [EA-7.3.3 Friston: Aktivní inference](@/kompendium/techniques/ea-7-3-3-friston-active-inference.md) – technická stránka rámce.
- [EA-4.1 Gaslighting](@/kompendium/techniques/ea-4-1-gaslighting.md) – vzorec, který kniha čte jako zásah do důvěry ve vnímání.
- [Sekce 06 – Klinické aplikace](@/kompendium/06-klinicke-aplikace/_index.md) – odlišení od psychózy a klinický rámec.

**Pojmy**

- [Predictive processing](@/glossary/predictive-processing.md) – prediktivní zpracování jako obecný rámec.
- [Reality testing](@/glossary/reality-testing.md) – ověřování reality jako klinická funkce.
- [Coercive control](@/glossary/coercive-control.md) – klinický popis ztráty důvěry ve vlastní vnímání.
