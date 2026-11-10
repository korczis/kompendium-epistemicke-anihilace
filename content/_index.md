+++
title = "Kompendium epistemické a kognitivní anihilace"
description = "Defenzivní taxonomie epistemické a kognitivní manipulace: mechanismy, detekční signatury, klinické aplikace, obrana a zotavení."
template = "index.html"
sort_by = "weight"

[extra]
lead = "Ucelená taxonomie fenoménů, které systematicky narušují schopnost člověka poznávat, vyhodnocovat informace a udržet koherentní obraz reality. Kniha popisuje mechanismy na úrovni struktury, ne implementace, a ke každému jevu dává detekční markery, klinický rámec a cestu k obraně a zotavení."
audience = "Kvalifikovaní psychiatři, psychologové, terapeuti, vyšetřovatelé, filozofové a výzkumníci kognitivních věd."

# Úvodní stránka pod upozorněním: rizika, úvod, karusel, přehled knihy a hledání. Šablony
# (templates/partials/landing-*.html) jen vykreslují tyto texty; čísla, názvy a popisy
# oddílů odvozují z obsahu, ze static/data/graph.json a ze static/data/nav.json. Každý blok
# končí dvojicí akcí (…_actions: hlavní a vedlejší), která vede na odpovídající rejstřík.

[extra.landing]
risks_kicker = "Rizika čtení a užití"
risks_title = "S jakými riziky kniha počítá"
risks_text = "Kniha o tom, jak lze poznávání poškodit, nese rizika pro čtenáře i pro lidi, o nichž čtenář uvažuje. Upozornění nad tímto blokem říká, komu kniha není určena; zde je každé riziko vyloženo zvlášť a vede na stránku, která je rozebírá do hloubky (National Commission 1979)."
risks_more = "Podrobně"
risks_actions = [
  { path = "kompendium/01-predmluva/neni-pro-kazdeho/_index.md", label = "Proč tato kniha není pro každého" },
  { path = "kompendium/01-predmluva/eticke-aspekty.md", label = "Etické aspekty" },
]
intro_actions = [
  { path = "kompendium/_index.md", label = "Obsah kompendia" },
  { path = "kompendium/01-predmluva/_index.md", label = "Předmluva" },
]
carousel_actions = [
  { path = "kompendium/techniques/_index.md", label = "Katalog technik" },
  { path = "kompendium/_index.md", label = "Všechny oddíly" },
]
explore_actions = [
  { path = "mapa.md", label = "Mapa knihy" },
  { path = "glossary/_index.md", label = "Glosář" },
]
intro_kicker = "Úvod do knihy"
intro_title = "Co kniha je a jak ji číst"
literature_label = "Citovaná literatura"
steps_title = "Doporučené pořadí čtení"
steps_label = "Krok"
steps = [
  "kompendium/01-predmluva/jak-pouzivat.md",
  "kompendium/02-uvod/_index.md",
  "kompendium/techniques/_index.md",
  "glossary/_index.md",
]
carousel_title = "Rodiny technik a vybrané oddíly"
carousel_text = "Každá karta vede na svou stránku; počty stránek se počítají při každém sestavení webu."
carousel_role = "karusel"
slide_role = "snímek"
slide_label = "Snímek"
slide_of = "z"
prev_label = "Předchozí snímek"
next_label = "Další snímek"
indicators_label = "Výběr snímku"
family_kicker = "Rodina technik"
section_kicker = "Oddíl"
top_label = "Nejodkazovanější"
# Oddíly v karuselu, v tomto pořadí. Oddíl, který chybí nebo ještě není rozpracovaný
# (static/data/ia.json: porušení pravidla „detail“ nebo „generated“), se vynechá.
carousel_sections = [
  "kompendium/01-predmluva/neni-pro-kazdeho/_index.md",
  "kompendium/case-studies/_index.md",
  "kompendium/historical-cases/_index.md",
  "kompendium/emergency-protocols/_index.md",
  "glossary/_index.md",
]
explore_title = "Prozkoumat knihu"
explore_text = "Plocha každého pole odpovídá počtu stránek rodiny nebo oddílu. Pole grafu i položky seznamu vedou na příslušnou stránku."
explore_families = "Rodiny technik"
explore_sections = "Oddíly knihy"
explore_chart_label = "Plošný graf rodin technik a oddílů knihy; šipky vybírají pole, Enter otevře jeho stránku."
explore_selected = "Vybráno: {title}, {count}. Enter stránku otevře."
explore_loading = "Načítám přehled knihy…"
explore_error = "Přehled se nepodařilo načíst; stejné odkazy obsahuje seznam pod ním."
search_title = "Hledání v celé knize"
search_text = "Paleta prohledává názvy stránek, kódy technik ve tvaru EA-1.2.2 a hesla glosáře."
search_button = "Otevřít hledání"

# Rizika: každé vede na stránku, která je vykládá podrobně (cesta k obsahu).
[[extra.landing.risks]]
title = "Dvojí užití poznání"
text = "Popis mechanismu, který slouží rozpoznání a obraně, může stejně dobře posloužit tomu, kdo chce škodit. Proto kniha popisuje strukturu jevů a jejich znaky, nikoli postup, a citlivé poznání vystavuje jen v obranném rámci (National Research Council 2004; Selgelid 2009)."
path = "glossary/dual-use-poznani.md"

[[extra.landing.risks]]
title = "Zátěž a retraumatizace při čtení"
text = "Čtení o manipulaci, kontrole a rozkladu identity může u lidí s vlastní zkušeností vyvolat návrat obtíží a u odborníků, kteří s oběťmi pracují, zprostředkovanou traumatizaci. Je rozumné číst po částech, s oporou a s vědomím vlastních reakcí (Herman 1992; McCann a Pearlman 1990)."
path = "glossary/retraumatizace.md"

[[extra.landing.risks]]
title = "Zneužití taxonomie proti obětem"
text = "Seznam technik lze obrátit proti těm, které má chránit: označit výpověď oběti za manipulaci a upřít jí důvěryhodnost. Takové užití je formou testimoniální nespravedlnosti a kniha je výslovně odmítá; znaky v ní slouží k porozumění, ne k nálepkování lidí (Fricker 2007)."
path = "glossary/testimonialni-nespravedlnost.md"

[[extra.landing.risks]]
title = "Čtení v krizi nebo v kontrolujícím vztahu"
text = "Kdo prochází akutní krizí, žije v donucujícím vztahu nebo ve skupině s vysokou mírou kontroly, potřebuje nejprve bezpečí a pomoc, ne analýzu. Popis mechanismů může úzkost zvýšit a v kontrolujícím vztahu bývá sledováno i to, co člověk čte (Stark 2007; Lifton 1961)."
path = "kompendium/01-predmluva/neni-pro-kazdeho/kdy-ji-necist.md"

[[extra.landing.risks]]
title = "Co kniha není"
text = "Kompendium není návod ani operativní manuál, není diagnostický nástroj a nenahrazuje odbornou péči. Popis jevu neříká nic o konkrétním člověku; o tom rozhoduje odborník, který ho vyšetřil a jedná s jeho informovaným souhlasem (Beauchamp a Childress 2019)."
path = "kompendium/01-predmluva/neni-pro-kazdeho/k-cemu-neslouzi.md"

# Tvary podstatných jmen po číslovce: 1, 2–4, 5 a více.

[extra.plural]
technika = ["technika", "techniky", "technik"]
stranka = ["stránka", "stránky", "stránek"]
+++

Kompendium je odborná taxonomie jevů, jimiž lze systematicky narušovat lidské poznávání: schopnost přijímat informace, vyhodnocovat je a udržet soudržný obraz sebe i světa. Navazuje na klinický a sociálněpsychologický výzkum myšlenkové reformy a donucující kontroly (Lifton 1961; Stark 2007) a na filozofickou analýzu epistemické nespravedlnosti (Fricker 2007). Každý jev popisuje na úrovni struktury, tedy co se v poznávání ztrácí a podle čeho to lze rozpoznat, nikoli na úrovni provedení.

Poznání o tom, jak lze poznávání poškodit, má dvojí užití: tytéž znalosti slouží diagnostice a ochraně, mohly by však posloužit i ke škodě (National Research Council 2004; Selgelid 2009). Kniha proto vychází z etických zásad výzkumu s lidmi, tedy z úcty k osobám, prospěchu a spravedlnosti (National Commission 1979), a ke každému mechanismu připojuje detekční znaky, klinický rámec a cestu k obraně a zotavení místo postupu, jak jej provést.

Čtení začíná [návodem k používání](@/kompendium/01-predmluva/jak-pouzivat.md), který vymezuje účel, publikum a etické hranice knihy, a [úvodem](@/kompendium/02-uvod/_index.md) s definicemi základních pojmů. [Katalog technik](@/kompendium/techniques/_index.md) je uspořádán do rodin podle kódu EA a lze jej filtrovat podle rodiny i míry rizika; [historické případy](@/kompendium/historical-cases/_index.md) ukazují, jak se tytéž jevy projevily v konkrétních společenských situacích. Neznámý pojem vysvětlí [glosář](@/glossary/_index.md) a souvislosti mezi oddíly ukazuje [mapa knihy](@/mapa.md). Kdo hledá pomoc pro sebe nebo pro klienta, má začít [krizovými protokoly](@/kompendium/emergency-protocols/_index.md).

Kniha není psána k souvislému čtení od začátku do konce; je to odborná příručka, ke které se čtenář vrací podle potřeby. Kdo ji čte pro svou praxi, má začít oddílem, který se týká jeho role, a obecné kapitoly číst až poté. Kdo se v popisech pozná osobně, má číst po částech, s oporou blízkého člověka nebo odborníka, a při silné reakci čtení přerušit; zprostředkovaná zátěž je u práce s traumatem dobře popsaná (McCann a Pearlman 1990).

## Literatura

- Beauchamp, T. L., & Childress, J. F. (2019). *Principles of Biomedical Ethics* (8th ed.). Oxford University Press.
- Fricker, M. (2007). *Epistemic Injustice: Power and the Ethics of Knowing*. Oxford University Press.
- Herman, J. L. (1992). *Trauma and Recovery*. Basic Books.
- Lifton, R. J. (1961). *[Thought Reform](@/glossary/thought-reform.md) and the Psychology of Totalism: A Study of „Brainwashing“ in China*. W. W. Norton.
- McCann, I. L., & Pearlman, L. A. (1990). Vicarious traumatization: A framework for understanding the psychological effects of working with victims. *Journal of Traumatic Stress*, 3(1), 131–149.
- National Commission for the Protection of Human Subjects of Biomedical and Behavioral Research (1979). *The Belmont Report*.
- National Research Council (2004). *Biotechnology Research in an Age of Terrorism*. National Academies Press.
- Selgelid, M. J. (2009). Governance of dual-use research: an ethical dilemma. *Bulletin of the World Health Organization*, 87(9), 720–723.
- Stark, E. (2007). *[Coercive Control](@/glossary/coercive-control.md): How Men Entrap Women in Personal Life*. Oxford University Press.

## Související

- [Pro koho je kniha určena](@/kompendium/01-predmluva/pro-koho-je-urceno.md) – publikum a předpoklady čtení.
- [Etické aspekty a upozornění](@/kompendium/01-predmluva/eticke-aspekty.md) – rámec dvojího užití a závazné směrnice.
- [Etický kodex výzkumníka EA](@/kompendium/08-prilohy/eticky-kodex.md) – pravidla práce s citlivým materiálem.
