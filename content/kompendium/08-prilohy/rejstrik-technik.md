+++
title = "Kompletní rejstřík technik (master index)"
description = "Tabulkový master index všech technik kompendia EA-X.Y.Z s jednořádkovými popisky a odkazy na detailní per-technique články."
weight = 2
sort_by = "weight"

[taxonomies]
tags = ["kompendium", "08-prilohy"]

[extra]
related_terms = ["index-pojmu", "klasifikace", "zkratky", "eticky-kodex"]
kompendium = ["08-prilohy"]
prilohy = ["rejstrik", "master-index", "techniky"]
section_icon = "📋"
toc = true
insert_anchor_links = "right"
access_level = "L1-L4"
status = "complete"
+++

{% set cat = load_data(path="static/data/listings/techniques.json") %}

# Kompletní rejstřík technik (master index)

> **Master index všech technik kompendia.** Tabulky obsahují EA kód, kanonický název, jednořádkový popis a odkaz na detailní per-technique článek. Slouží jako primární navigační vrstva pro per-technique podknihovnu v `/kompendium/techniques/`.

## Notační konvence

Každá technika je identifikována kódem ve formátu `EA-X.Y.Z[-α]`:

| Komponenta | Význam | Příklad |
|------------|--------|---------|
| **EA** | [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) (konstantní prefix) | `EA` |
| **X** | Kapitola / primární kategorie (1–10) | `1` |
| **Y** | Subkategorie | `1` |
| **Z** | Specifický fenomén | `1` |
| **α** | Volitelná varianta | `a`, `b`, `c` |

Detailní popis notace viz [Klasifikační schéma](@/kompendium/08-prilohy/klasifikace.md) a [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md).

---

## Kapitola 1 — {{ cat.parent_names["1"] }}

> **Subjekt akademického a intelektuálního prostředí.** Techniky využívají legitimní akademické nástroje (selektivní citace, falešné dilema, rétorika autority) k systematické dezorientaci. Riziko: **střední**, reverzibilita: **vysoká**.

{% for f in cat.parents["1"] %}{% set fname = cat.group_names[f] | default(value="") %}

### EA-{{ f }}{% if fname %} {{ fname }}{% endif %}

| Kód | Název | Jednořádkový popis |
|-----|-------|--------------------|
{% for t in cat.groups[f] %}| [`{{ t.code }}`](@/kompendium/techniques/{{ t.slug }}.md) | {{ t.name }} | {{ t.summary }} |
{% endfor %}
{% endfor %}

---

## Kapitola 2 — {{ cat.parent_names["2"] }}

> **Cíl: zničení epistemické důvěryhodnosti zdroje.** Riziko: **střední–vysoké**, reverzibilita: **střední**. Plné articulace v sekci [03 Základní kategorie](@/kompendium/03-zakladni-kategorie/_index.md) a [04 Terminální protokoly](@/kompendium/04-terminalni-protokoly/_index.md).

{% for f in cat.parents["2"] %}{% set fname = cat.group_names[f] | default(value="") %}

### EA-{{ f }}{% if fname %} {{ fname }}{% endif %}

| Kód | Název | Jednořádkový popis |
|-----|-------|--------------------|
{% for t in cat.groups[f] %}| [`{{ t.code }}`](@/kompendium/techniques/{{ t.slug }}.md) | {{ t.name }} | {{ t.summary }} |
{% endfor %}
{% endfor %}

---

## Kapitola 3 — {{ cat.parent_names["3"] }}

> **Cíl: naučit subjekt manipulovat sebe sama.** Riziko: **vysoké**, reverzibilita: **nízká–střední**. Pokrývá doménu vzdělávacích, terapeutických a coachingových kontextů.

{% for f in cat.parents["3"] %}{% set fname = cat.group_names[f] | default(value="") %}

### EA-{{ f }}{% if fname %} {{ fname }}{% endif %}

| Kód | Název | Jednořádkový popis |
|-----|-------|--------------------|
{% for t in cat.groups[f] %}| [`{{ t.code }}`](@/kompendium/techniques/{{ t.slug }}.md) | {{ t.name }} | {{ t.summary }} |
{% endfor %}
{% endfor %}

---

## Kapitola 4 — {{ cat.parent_names["4"] }}

> **Komplexní destrukční sekvence kombinující techniky z předchozích kapitol.** Riziko: **vysoké–extrémní**, reverzibilita: nízká. Vyžaduje úroveň přístupu **L2+**. Plný popis v [Sekci 04](@/kompendium/04-terminalni-protokoly/_index.md).

{% for f in cat.parents["4"] %}{% set fname = cat.group_names[f] | default(value="") %}

### EA-{{ f }}{% if fname %} {{ fname }}{% endif %}

| Kód | Název | Jednořádkový popis |
|-----|-------|--------------------|
{% for t in cat.groups[f] %}| [`{{ t.code }}`](@/kompendium/techniques/{{ t.slug }}.md) | {{ t.name }} | {{ t.summary }} |
{% endfor %}
{% endfor %}

---

## Kapitola 5 — {{ cat.parent_names["5"] }}

> **Fundamentální dekonstrukce.** Cíl: rozklad **základních struktur poznávání samotného**. Riziko: **extrémní**, reverzibilita: **velmi nízká**. Vyžaduje úroveň přístupu **L3+** s etickým dohledem.

{% for f in cat.parents["5"] %}{% set fname = cat.group_names[f] | default(value="") %}

### EA-{{ f }}{% if fname %} {{ fname }}{% endif %}

| Kód | Název | Jednořádkový popis |
|-----|-------|--------------------|
{% for t in cat.groups[f] %}| [`{{ t.code }}`](@/kompendium/techniques/{{ t.slug }}.md) | {{ t.name }} | {{ t.summary }} |
{% endfor %}
{% endfor %}

---

## Kapitola 6 — {{ cat.parent_names["6"] }}

> **Diagnostické a terapeutické rámce** pro práci s pacienty exponovanými technikám EA. Plný popis v [Sekci 06](@/kompendium/06-klinicke-aplikace/_index.md) a [Diagnostických nástrojích](@/kompendium/08-prilohy/diagnosticke-nastroje.md).

{% for f in cat.parents["6"] %}{% set fname = cat.group_names[f] | default(value="") %}

### EA-{{ f }}{% if fname %} {{ fname }}{% endif %}

| Kód | Název | Jednořádkový popis |
|-----|-------|--------------------|
{% for t in cat.groups[f] %}| [`{{ t.code }}`](@/kompendium/techniques/{{ t.slug }}.md) | {{ t.name }} | {{ t.summary }} |
{% endfor %}
{% endfor %}

---

## Kapitola 7 — {{ cat.parent_names["7"] }}

> **Filozofické, epistemologické a kognitivně-vědní zázemí taxonomie.** Kapitola 7 neobsahuje techniky v užším smyslu: kódy `EA-7.*` označují teoretické rámce, jimiž se jevy z kapitol 1–5 vysvětlují, kriticky prověřují a zasazují do dějin myšlení. Rozcestník kapitoly je [Sekce 07](@/kompendium/07-teoreticke-reflexe/_index.md), přehled tradic podle oborů [Filozofické tradice](@/kompendium/07-teoreticke-reflexe/filozoficke-tradice/_index.md), grafický přehled [mapa teoretických rámců](@/kompendium/07-teoreticke-reflexe/visualizations.md).

### 7.A Kódované teoretické rámce `EA-7.*`

{% set n7 = 0 %}{% for f in cat.parents["7"] %}{% set_global n7 = n7 + cat.groups[f] | length %}{% endfor %}{{ n7 }} hesel ve {{ cat.parents["7"] | length }} skupinách. Každé popisuje myšlenku autora, to, co z ní plyne pro rozpoznání epistemické anihilace, a meze jejího použití.

{% for f in cat.parents["7"] %}{% set fname = cat.group_names[f] | default(value="") %}

#### EA-{{ f }}{% if fname %} {{ fname }}{% endif %}

| Kód | Název | Jednořádkový popis |
|-----|-------|--------------------|
{% for t in cat.groups[f] %}| [`{{ t.code }}`](@/kompendium/techniques/{{ t.slug }}.md) | {{ t.name }} | {{ t.summary }} |
{% endfor %}
{% endfor %}

### 7.B Tematické kapitoly 7.1–7.9

| Č. | Kapitola | Co řeší |
|----|----------|---------|
| 7.1 | [Filosofický rámec EA](@/kompendium/07-teoreticke-reflexe/filosoficky-ramec.md) | Foucault, Adorno, Sloterdijk a Habermas jako čtyři optiky moci, rozumu a komunikace. |
| 7.2 | [Vztah k epistemickému traumatu](@/kompendium/07-teoreticke-reflexe/epistemicke-trauma.md) | Empirická psychotraumatologie: [komplexní trauma](@/glossary/complex-trauma.md), [trauma ze zrady](@/glossary/betrayal-trauma.md), [disociace](@/glossary/disociace.md). |
| 7.3 | [Sociální epistemologie EA](@/kompendium/07-teoreticke-reflexe/socialni-epistemologie.md) | Svědectví, důvěra a epistemická nespravedlnost (Goldman, Fricker, Longino, Anderson). |
| 7.4 | [EA a postmodernismus](@/kompendium/07-teoreticke-reflexe/postmodernismus.md) | Lyotard, Baudrillard, Derrida: kde kritika metanarativů končí a začíná rozklad poznání. |
| 7.5 | [Kognitivní vědy a EA](@/kompendium/07-teoreticke-reflexe/kognitivni-vedy.md) | Duální systém, [prediktivní zpracování](@/glossary/predictive-processing.md), [vtělená kognice](@/glossary/embodied-cognition.md) jako vysvětlení zranitelnosti. |
| 7.6 | [7.6 Computational epistemology](@/kompendium/07-teoreticke-reflexe/computational-epistemology.md) | Formální modely přesvědčení a jejich vztah k platformě. |
| 7.7 | [EA v digitálním věku](@/kompendium/07-teoreticke-reflexe/digitalni-vek.md) | Algoritmy, generativní modely a *deepfakes* jako nové prostředí starých vzorců. |
| 7.8 | [Politická a ideologická EA](@/kompendium/07-teoreticke-reflexe/politicka-ea.md) | Totalitní systémy, [propaganda](@/glossary/propaganda.md) a populismus jako kolektivní rovina jevu. |
| 7.9 | [Otevřené výzkumné otázky](@/kompendium/07-teoreticke-reflexe/otevrene-otazky.md) | Co taxonomie zatím neumí vysvětlit nebo změřit. |

### 7.C Monografické kapitoly 7.10–7.59

| Skupina | Kapitoly |
|---------|----------|
| Jazyk, věda a tiché vědění (7.10–7.13) | [7.10 Wittgenstein](@/kompendium/07-teoreticke-reflexe/wittgenstein-jezykove-hry.md) · [7.11 Kuhn](@/kompendium/07-teoreticke-reflexe/kuhn-paradigmaticke-revoluce.md) · [7.12 Feyerabend](@/kompendium/07-teoreticke-reflexe/feyerabend-anti-method.md) · [7.13 Polanyi](@/kompendium/07-teoreticke-reflexe/polanyi-ticha-znalost.md) |
| Fenomenologie a existence (7.14–7.17) | [7.14 Heidegger](@/kompendium/07-teoreticke-reflexe/heidegger-byt-ve-svete.md) · [7.15 Sartre](@/kompendium/07-teoreticke-reflexe/sartre-existencialismus.md) · [7.16 Merleau-Ponty](@/kompendium/07-teoreticke-reflexe/merleau-ponty-vtelena-percepce.md) · [7.17 Ricoeur](@/kompendium/07-teoreticke-reflexe/ricoeur-troji-mimese.md) |
| Úsudek, druhý a uznání (7.18–7.22) | [7.18 Arendtová: banalita zla](@/kompendium/07-teoreticke-reflexe/arendt-banalita-zla.md) · [7.19 Arendtová: myšlení](@/kompendium/07-teoreticke-reflexe/hannah-arendt-myslení.md) · [7.20 Levinas](@/kompendium/07-teoreticke-reflexe/levinas-jiny.md) · [7.21 Butlerová](@/kompendium/07-teoreticke-reflexe/butler-performative.md) · [7.22 Honneth](@/kompendium/07-teoreticke-reflexe/honneth-rozpoznani.md) |
| Význam, interpretace a pravda (7.23–7.30) | [7.23 Brandom](@/kompendium/07-teoreticke-reflexe/brandom-inferential-semantics.md) · [7.24 McDowell](@/kompendium/07-teoreticke-reflexe/mcDowell-mind-and-world.md) · [7.25 Davidson](@/kompendium/07-teoreticke-reflexe/davidson-radical-interpretation.md) · [7.26 Quine](@/kompendium/07-teoreticke-reflexe/quine-web-of-belief.md) · [7.27 Putnam](@/kompendium/07-teoreticke-reflexe/putnam-internal-realism.md) · [7.28 Rorty](@/kompendium/07-teoreticke-reflexe/rorty-contingency.md) · [7.29 Nagel](@/kompendium/07-teoreticke-reflexe/nagel-view-from-nowhere.md) · [7.30 Williams](@/kompendium/07-teoreticke-reflexe/williams-truth-and-truthfulness.md) |
| Morální jazyk, identita a rozkvět (7.31–7.34) | [7.31 MacIntyre](@/kompendium/07-teoreticke-reflexe/macintyre-after-virtue.md) · [7.32 Taylor](@/kompendium/07-teoreticke-reflexe/taylor-sources-of-self.md) · [7.33 Nussbaumová](@/kompendium/07-teoreticke-reflexe/nussbaum-capabilities.md) · [7.34 Sen](@/kompendium/07-teoreticke-reflexe/sen-development-as-freedom.md) |
| Mysl a vědomí (7.35–7.40) | [7.35 Dennett](@/kompendium/07-teoreticke-reflexe/dennett-intentional-stance.md) · [7.36 Searle](@/kompendium/07-teoreticke-reflexe/searle-chinese-room.md) · [7.37 Chalmers](@/kompendium/07-teoreticke-reflexe/chalmers-hard-problem.md) · [7.38 Block](@/kompendium/07-teoreticke-reflexe/block-phenomenal-vs-access.md) · [7.39 Tononi](@/kompendium/07-teoreticke-reflexe/tononi-iit.md) · [7.40 Friston](@/kompendium/07-teoreticke-reflexe/friston-active-inference.md) |
| Vtělená, rozšířená a distribuovaná kognice (7.41–7.49) | [7.41 Clark: rozšířená mysl](@/kompendium/07-teoreticke-reflexe/clark-extended-mind.md) · [7.42 Metzinger](@/kompendium/07-teoreticke-reflexe/metzinger-ego-tunnel.md) · [7.43 Thompson](@/kompendium/07-teoreticke-reflexe/thompson-mind-in-life.md) · [7.44 Varela](@/kompendium/07-teoreticke-reflexe/varela-enactivism.md) · [7.45 Damasio](@/kompendium/07-teoreticke-reflexe/damasio-somatic-marker.md) · [7.46 Lakoff](@/kompendium/07-teoreticke-reflexe/lakoff-conceptual-metaphor.md) · [7.47 Johnson](@/kompendium/07-teoreticke-reflexe/johnson-body-in-mind.md) · [7.48 Hutchins](@/kompendium/07-teoreticke-reflexe/hutchins-distributed-cognition.md) · [7.49 Clark: Natural-Born Cyborgs](@/kompendium/07-teoreticke-reflexe/clark-andy-natural-born-cyborgs.md) |
| Kulturní evoluce a narativ (7.50–7.53) | [7.50 Dawkins](@/kompendium/07-teoreticke-reflexe/dawkins-meme.md) · [7.51 Dennett: From Bacteria to Bach](@/kompendium/07-teoreticke-reflexe/dennett-from-bacteria-to-bach.md) · [7.52 Harari](@/kompendium/07-teoreticke-reflexe/harari-sapiens-narativ.md) · [7.53 Snyder](@/kompendium/07-teoreticke-reflexe/snyder-tyranny-essays.md) |
| Média, propaganda a infosféra (7.54–7.59) | [7.54 Chomsky](@/kompendium/07-teoreticke-reflexe/chomsky-manufacturing-consent.md) · [7.55 Herman a Chomsky](@/kompendium/07-teoreticke-reflexe/herman-chomsky-propaganda-model.md) · [7.56 Zuboffová](@/kompendium/07-teoreticke-reflexe/zuboff-surveillance-capitalism.md) · [7.57 boyd](@/kompendium/07-teoreticke-reflexe/boyd-disinformation-age.md) · [7.58 Wardleová](@/kompendium/07-teoreticke-reflexe/wardle-disinformation-typology.md) · [7.59 Floridi](@/kompendium/07-teoreticke-reflexe/floridi-fourth-revolution.md) |

> **Vztah obou řad**: kódovaná hesla `EA-7.*` jsou krátká a slouží jako uzly sítě technik; monografické kapitoly 7.10–7.59 stejné myšlenky rozvádějí v plné šíři. Kde existují obě (např. Kuhn, Feyerabend, Quine, Davidson, Williams, Nagel, Friston, Clark, Metzinger, Thompson, Dennett, Chalmers, Tononi), čtěte nejprve heslo a pak kapitolu.

---

## Kapitola 8 — {{ cat.parent_names["8"] }}

> **Nástroje posouzení, klinické a teoretické rámce a literatura**, o něž se opírají kapitoly
> 1–7. Kódy `EA-8.*` neoznačují manipulativní techniky, ale odborné opory pro jejich
> rozpoznání a posouzení; podrobně je rozvádějí [Diagnostické
> nástroje](@/kompendium/08-prilohy/diagnosticke-nastroje.md) a
> [Bibliografie](@/kompendium/08-prilohy/bibliografie.md).

{% for f in cat.parents["8"] %}{% set fname = cat.group_names[f] | default(value="") %}

### EA-{{ f }}{% if fname %} {{ fname }}{% endif %}

| Kód | Název | Jednořádkový popis |
|-----|-------|--------------------|
{% for t in cat.groups[f] %}| [`{{ t.code }}`](@/kompendium/techniques/{{ t.slug }}.md) | {{ t.name }} | {{ t.summary }} |
{% endfor %}
{% endfor %}

Skupina 8.1 sdružuje nástroje, jejichž psychometrické vlastnosti jsou publikované, například
posouzení schopnosti rozhodovat podle Appelbauma a Grissa (1988) nebo škálu disociativních
zážitků DES-II (Carlson a Putnam, 1993); kniha je uvádí jako odkaz na odbornou literaturu, ne
jako návod k samostatnému použití bez klinického výcviku. Skupina 8.2 shrnuje rámce, z nichž
taxonomie vychází: Liftonova kritéria myšlenkové reformy (Lifton, 1961), podmínky popsané
Singerovou (Singer a Lalich, 1995), Starkův koncept [coercive control](@/glossary/coercive-control.md) (Stark, 2007) a fázový
model zotavení Hermanové (Herman, 1992).

## Kapitola 9 — {{ cat.parent_names["9"] }}

> **Epistemické útoky v prostředí jazykových modelů, syntetických médií a platforem.** Kódy
> `EA-9.*` popisují, jak se mechanismy z kapitol 1–5 přenášejí do digitálních systémů; každá
> stránka uvádí znaky, obranu a meze poznání, nikdy postup útoku.

{% for f in cat.parents["9"] %}{% set fname = cat.group_names[f] | default(value="") %}

### EA-{{ f }}{% if fname %} {{ fname }}{% endif %}

| Kód | Název | Jednořádkový popis |
|-----|-------|--------------------|
{% for t in cat.groups[f] %}| [`{{ t.code }}`](@/kompendium/techniques/{{ t.slug }}.md) | {{ t.name }} | {{ t.summary }} |
{% endfor %}
{% endfor %}

Kapitola navazuje na typologii informační poruchy Wardleové a Derakhshana (2017), na výzkum
výpočetní propagandy (Woolley a Howard, 2018) a na právní a společenskou analýzu deepfakes
(Chesney a Citron, 2019); u jazykových modelů vychází z popisu nepřímé injekce promptu jako
bezpečnostní třídy problému (Greshake a kol., 2023). Rozsah kapitoly a počty stránek ve
skupinách ukazuje odvozený [stav knihy](@/stav.md), ne tento rejstřík.

## Souhrnná statistika

Počty kódů, stránek technik a jejich rozvinutí se zde nepíšou ručně, protože by zastaraly
s každou vlnou obsahu. Odvozuje je skript knihy z katalogu technik a z odkazů mezi stránkami
a zobrazuje [stav knihy](@/stav.md); rozložení rodin a podrodin ukazuje [přehled
vizualizací](@/kompendium/visualizations/_index.md) a síť technik [mapa knihy](@/mapa.md).

## Vazby na další přílohy

- [Bibliografie](@/kompendium/08-prilohy/bibliografie.md) — primární literatura k jednotlivým kategoriím technik.
- [Index pojmů](@/kompendium/08-prilohy/index-pojmu.md) — anglické ekvivalenty kanonizovaných českých termínů.
- [Klasifikační schéma](@/kompendium/08-prilohy/klasifikace.md) — metodologie přiřazování EA kódů.
- [Diagnostické nástroje](@/kompendium/08-prilohy/diagnosticke-nastroje.md) — instrumenty pro detekci jednotlivých technik.
- [Etický kodex](@/kompendium/08-prilohy/eticky-kodex.md) — hranice studia a aplikace.
- [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) — formální notační konvence.

## Kam rejstřík vede

Rejstřík je propojen s ostatními částmi knihy:

- [Glosář](@/glossary/_index.md) — každý kanonizovaný název má glosářové heslo.

## Jak rejstřík používat

Rejstřík je referenční nástroj, ne text k lineární četbě: vyplatí se do něj vstupovat s
konkrétní otázkou, tedy s kódem, názvem techniky nebo tématem, a odtud přejít na stránku
techniky, heslo [glosáře](@/glossary/_index.md) nebo do [knihovny
technik](@/kompendium/techniques/_index.md). Kódy jsou stabilní identifikátory; význam kódu
vykládá [klasifikační schéma](@/kompendium/08-prilohy/klasifikace.md) a jeho formát [zkratky a
notace](@/kompendium/08-prilohy/zkratky.md).

## Literatura

- Appelbaum, P. S., & Grisso, T. (1988). Assessing patients' capacities to consent to treatment. *New England Journal of Medicine*, 319(25), 1635–1638.
- Carlson, E. B., & Putnam, F. W. (1993). An update on the Dissociative Experiences Scale. *Dissociation*, 6(1), 16–27.
- Chesney, R., & Citron, D. K. (2019). Deep fakes: A looming challenge for privacy, democracy, and national security. *California Law Review*, 107(6), 1753–1820.
- Greshake, K., Abdelnabi, S., Mishra, S., Endres, C., Holz, T., & Fritz, M. (2023). Not what you've signed up for: Compromising real-world LLM-integrated applications with indirect prompt injection. In *Proceedings of the 16th ACM Workshop on Artificial Intelligence and Security*, 79–90.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism*. New York: W. W. Norton.
- Singer, M. T., & Lalich, J. (1995). *Cults in Our Midst*. San Francisco: Jossey-Bass.
- Stark, E. (2007). *Coercive Control: How Men Entrap Women in Personal Life*. Oxford: Oxford University Press.
- Wardle, C., & Derakhshan, H. (2017). *Information Disorder: Toward an Interdisciplinary Framework for Research and Policy Making*. Strasbourg: Council of Europe.
- Woolley, S. C., & Howard, P. N. (Eds.). (2018). *Computational Propaganda: Political Parties, Politicians, and Political Manipulation on Social Media*. Oxford: Oxford University Press.

## Související

**Navigace v taxonomii**

- [Knihovna technik](@/kompendium/techniques/_index.md) – podrobné články ke všem kódům.
- [Klasifikační schéma](@/kompendium/08-prilohy/klasifikace.md) – podle čeho se kódy přidělují.
- [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) – formát EA-X.Y.Z a jeho varianty.
- [Index pojmů](@/kompendium/08-prilohy/index-pojmu.md) – pojmy, k nimž techniky patří.

**Kapitoly s technikami**

- [03. Základní kategorie](@/kompendium/03-zakladni-kategorie/_index.md) – techniky EA-1 až EA-3.
- [04. Terminální protokoly](@/kompendium/04-terminalni-protokoly/_index.md) – sekvence vedoucí k systémové destrukci.
- [05. Ultramární techniky](@/kompendium/05-ultramari-techniky/_index.md) – nejzávažnější skupina.
- [06. Klinické aplikace](@/kompendium/06-klinicke-aplikace/_index.md) – detekce a léčba.
- [7. Teoretické reflexe](@/kompendium/07-teoreticke-reflexe/_index.md) – teoretické rámce EA-7.

**Glosář**

- [Taxonomie EA](@/glossary/taxonomie-ea.md) – heslo o systému kódů.
