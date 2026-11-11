//! kompendium-engine/v1 in Rust, for wasm32-unknown-unknown.
//!
//! The contract is docs/engine/kompendium-engine-v1.md; the reference implementation is
//! scripts/engine.py, and this crate follows it line by line. Pure: [`Engine::new`] reads the
//! two derived documents (static/data/search.json and graph.json) and [`Engine::run`] maps a
//! request to a response, JSON text in and JSON text out, never panicking on any input.
//!
//! The wasm build exposes a C ABI (see `abi`): `alloc`, `dealloc`, `init`, `run`,
//! `result_len`, plus `contract` and `normalise` for the loader's checks and the tests.

mod fold;
mod tables;

#[cfg(target_arch = "wasm32")]
mod abi;

use serde_json::{Map, Number, Value};

pub use fold::{ea_code, normalise, tokens};
pub use tables::UNICODE_VERSION;

pub const SCHEMA: &str = "kompendium-engine/v1";
const SEARCH_SCHEMAS: &[&str] = &["kompendium-search/v1"];
const GRAPH_SCHEMAS: &[&str] = &["kompendium-graph/v2"];
const SEARCH_FIELDS: &[&str] = &["title", "description", "url", "code", "kind", "aliases", "in"];
const QUERY_MAX: usize = 200;
const PATH_MAX: usize = 512;
const SEARCH_LIMIT: (i128, i128) = (12, 50);
const NEIGHBOURHOOD_LIMIT: (i128, i128) = (28, 200);
const TIERS: &[&str] =
    &["exact_code", "exact_title", "exact_alias", "title_prefix", "title_word", "description"];
const SEARCH_OPS: &[&str] = &["op", "query", "limit"];
const NEIGHBOURHOOD_OPS: &[&str] = &["op", "path", "depth", "limit"];

struct Node {
    path: String,
    url: String,
    title: String,
    section: String,
    /// In-degree as the data spells it (echoed), and as an integer for ordering.
    in_text: String,
    in_key: i128,
}

struct Entry {
    node: usize,
    title: String,
    code: Option<String>,
    kind: String,
    ea: Option<String>,
    t: String,
    aliases: Vec<String>,
    words: Vec<String>,
    all: Vec<String>,
}

pub struct Engine {
    problem: Option<(&'static str, String)>,
    nodes: Vec<Node>,
    by_path: std::collections::HashMap<String, usize>,
    adjacent: Vec<Vec<usize>>,
    edges: Vec<(usize, usize)>,
    entries: Vec<Entry>,
}

/// The integer a JSON number stands for (1 and 1.0 alike), else None; booleans are not numbers.
fn integer(v: &Value) -> Option<i128> {
    let n = v.as_number()?;
    if let Some(i) = n.as_i64() {
        return Some(i as i128);
    }
    if let Some(u) = n.as_u64() {
        return Some(u as i128);
    }
    let f = n.as_f64()?;
    if f.is_finite() && f.fract() == 0.0 && f.abs() < 1e38 { Some(f as i128) } else { None }
}

fn str_of(v: Option<&Value>) -> Option<&str> {
    v.and_then(Value::as_str)
}

fn check_data(search: &Value, graph: &Value) -> Option<(&'static str, String)> {
    let schema_in = |doc: &Value, allowed: &[&str]| {
        doc.as_object()
            .and_then(|o| str_of(o.get("schema")))
            .is_some_and(|s| allowed.contains(&s))
    };
    if !schema_in(search, SEARCH_SCHEMAS) {
        return Some((
            "search.schema",
            format!("search.json schema must be one of {}", SEARCH_SCHEMAS.join(", ")),
        ));
    }
    if !schema_in(graph, GRAPH_SCHEMAS) {
        return Some((
            "graph.schema",
            format!("graph.json schema must be one of {}", GRAPH_SCHEMAS.join(", ")),
        ));
    }
    let search = search.as_object()?;
    let graph = graph.as_object()?;
    let fields = match search.get("fields").and_then(Value::as_array) {
        Some(f) if SEARCH_FIELDS.iter().all(|n| f.iter().any(|x| x.as_str() == Some(n))) => f,
        _ => {
            return Some((
                "search.fields",
                format!("search.json fields must name {}", SEARCH_FIELDS.join(", ")),
            ));
        }
    };
    let Some(entries) = search.get("entries").and_then(Value::as_array) else {
        return Some(("search.entries", "search.json entries must be a list".into()));
    };
    // The first position of each name, as list.index finds it.
    let at = |name: &str| fields.iter().position(|x| x.as_str() == Some(name)).unwrap_or(0);
    for (i, e) in entries.iter().enumerate() {
        let ok = e.as_array().is_some_and(|e| {
            e.len() >= fields.len()
                && ["title", "description", "url", "code", "kind"]
                    .iter()
                    .all(|k| e[at(k)].is_string())
                && e[at("aliases")].as_array().is_some_and(|a| a.iter().all(Value::is_string))
        });
        if !ok {
            return Some(("search.entries", format!("search.json entry {i} does not match its fields")));
        }
    }
    let (Some(nodes), Some(edges)) =
        (graph.get("nodes").and_then(Value::as_array), graph.get("edges").and_then(Value::as_array))
    else {
        return Some(("graph.nodes", "graph.json must carry nodes and edges lists".into()));
    };
    for (i, n) in nodes.iter().enumerate() {
        let ok = n.as_object().is_some_and(|n| {
            n.get("id").and_then(integer) == Some(i as i128)
                && ["path", "url", "title", "section"].iter().all(|k| str_of(n.get(*k)).is_some())
                && n.get("in").and_then(integer).is_some()
        });
        if !ok {
            return Some((
                "graph.nodes",
                format!("graph.json node {i} lacks id, path, url, title, section or in"),
            ));
        }
    }
    for e in edges {
        let ok = e.as_array().is_some_and(|e| {
            e.len() == 2
                && e.iter().all(|x| integer(x).is_some_and(|x| 0 <= x && x < nodes.len() as i128))
        });
        if !ok {
            return Some(("graph.edges", "graph.json edges must be [from, to] pairs of node ids".into()));
        }
    }
    None
}

impl Engine {
    /// The engine over the two documents; data it cannot read is remembered as the problem
    /// every request then answers (`schema_mismatch`).
    pub fn new(search: &Value, graph: &Value) -> Engine {
        let mut engine = Engine {
            problem: check_data(search, graph),
            nodes: Vec::new(),
            by_path: Default::default(),
            adjacent: Vec::new(),
            edges: Vec::new(),
            entries: Vec::new(),
        };
        if engine.problem.is_some() {
            return engine;
        }
        let empty = Vec::new();
        let raw_nodes = graph["nodes"].as_array().unwrap_or(&empty);
        let mut by_url = std::collections::HashMap::new();
        for (i, n) in raw_nodes.iter().enumerate() {
            let s = |k: &str| str_of(n.get(k)).unwrap_or_default().to_string();
            let inn = n.get("in").cloned().unwrap_or(Value::Number(Number::from(0)));
            engine.nodes.push(Node {
                path: s("path"),
                url: s("url"),
                title: s("title"),
                section: s("section"),
                in_key: integer(&inn).unwrap_or(0),
                in_text: inn.to_string(),
            });
            // Later nodes win a shared path or url, as a dict built in order does.
            engine.by_path.insert(s("path"), i);
            by_url.insert(s("url"), i);
        }
        let mut edges: Vec<(usize, usize)> = graph["edges"]
            .as_array()
            .unwrap_or(&empty)
            .iter()
            .filter_map(|e| {
                let a = integer(&e[0])? as usize;
                let b = integer(&e[1])? as usize;
                (a != b).then_some((a, b))
            })
            .collect();
        edges.sort_unstable();
        edges.dedup();
        engine.adjacent = vec![Vec::new(); engine.nodes.len()];
        for &(a, b) in &edges {
            engine.adjacent[a].push(b);
            engine.adjacent[b].push(a);
        }
        for list in &mut engine.adjacent {
            list.sort_unstable();
            list.dedup();
        }
        engine.edges = edges;
        // The last position of each name, as the reference's {name: i} dict keeps it.
        let fields = search["fields"].as_array().unwrap_or(&empty);
        let f = |name: &str| fields.iter().rposition(|x| x.as_str() == Some(name)).unwrap_or(0);
        let (ft, fd, fu, fc, fk, fa) =
            (f("title"), f("description"), f("url"), f("code"), f("kind"), f("aliases"));
        for e in search["entries"].as_array().unwrap_or(&empty) {
            let text = |i: usize| str_of(e.get(i));
            let node = text(fu).and_then(|u| by_url.get(u)).copied();
            let (Some(node), Some(title), Some(desc), Some(code), Some(kind), Some(aliases)) = (
                node,
                text(ft),
                text(fd),
                text(fc),
                text(fk),
                e.get(fa).and_then(Value::as_array),
            ) else {
                engine.problem = Some((
                    "search.entries",
                    "a search.json entry has no graph.json node with its url; \
                     the two files are not from the same build"
                        .into(),
                ));
                return engine;
            };
            let t = normalise(title);
            let norm_aliases: Vec<String> =
                aliases.iter().map(|a| normalise(a.as_str().unwrap_or_default())).collect();
            let mut words = tokens(&t);
            for a in &norm_aliases {
                words.extend(tokens(a));
            }
            let mut all = words.clone();
            all.extend(tokens(&normalise(desc)));
            let code = (!code.is_empty()).then(|| code.to_string());
            engine.entries.push(Entry {
                node,
                title: title.to_string(),
                ea: code.as_deref().and_then(|c| ea_code(&normalise(c))),
                code,
                kind: kind.to_string(),
                t,
                aliases: norm_aliases,
                words,
                all,
            });
        }
        engine
    }

    /// The response to a request given as JSON text; text that is not JSON is a request that
    /// is not an object.
    pub fn run_json(&self, request: &[u8]) -> String {
        let request = serde_json::from_slice::<Value>(request).unwrap_or(Value::Null);
        self.run(&request)
    }

    /// The response (JSON text) to a request.
    pub fn run(&self, request: &Value) -> String {
        let obj = request.as_object();
        let op = obj
            .and_then(|o| str_of(o.get("op")))
            .filter(|s| *s == "search" || *s == "neighbourhood");
        if let Some((field, message)) = &self.problem {
            return error(op, "schema_mismatch", message, Some(*field));
        }
        let Some(obj) = obj else {
            return error(None, "bad_input", "the request must be a JSON object", None);
        };
        if str_of(obj.get("op")).is_none() {
            return error(None, "bad_input", "op must be a string", Some("op"));
        }
        let Some(op) = op else {
            return error(None, "bad_input", "op must be one of search, neighbourhood", Some("op"));
        };
        let allowed = if op == "search" { SEARCH_OPS } else { NEIGHBOURHOOD_OPS };
        // serde_json's map is ordered by key (byte order, which is code point order).
        if let Some(k) = obj.keys().find(|k| !allowed.contains(&k.as_str())) {
            let message = format!("{k} is not a field of {op}");
            return error(Some(op), "bad_input", &message, Some(k.as_str()));
        }
        if op == "search" { self.search(obj) } else { self.neighbourhood(obj) }
    }

    fn search(&self, request: &Map<String, Value>) -> String {
        let op = Some("search");
        let Some(query) = str_of(request.get("query")) else {
            return error(op, "bad_input", "query must be a string", Some("query"));
        };
        if query.chars().count() > QUERY_MAX {
            let message = format!("query must be at most {QUERY_MAX} code points");
            return error(op, "bad_input", &message, Some("query"));
        }
        let mut q = normalise(query);
        if q.is_empty() {
            return error(op, "bad_input", "query is empty after normalisation", Some("query"));
        }
        let limit = match limit_of("search", request, SEARCH_LIMIT) {
            Ok(l) => l,
            Err(e) => return e,
        };
        let code = ea_code(&q);
        if let Some(c) = &code {
            // Every spelling of a code is one query: its canonical form, tiers 1-4 only.
            q = normalise(c);
        }
        let words = if code.is_some() { Vec::new() } else { tokens(&q) };
        let every = |pool: &[String]| {
            !words.is_empty() && words.iter().all(|x| pool.iter().any(|w| w.starts_with(x.as_str())))
        };
        let mut hits: Vec<(usize, &Entry)> = Vec::new();
        for e in &self.entries {
            let tier = if code.is_some() && e.ea == code {
                Some(0)
            } else if e.t == q {
                Some(1)
            } else if e.aliases.contains(&q) {
                Some(2)
            } else if e.t.starts_with(q.as_str()) {
                Some(3)
            } else if every(&e.words) {
                Some(4)
            } else if every(&e.all) {
                Some(5)
            } else {
                None
            };
            if let Some(t) = tier {
                hits.push((t, e));
            }
        }
        let node = |e: &Entry| &self.nodes[e.node];
        hits.sort_by(|a, b| {
            a.0.cmp(&b.0)
                .then(node(b.1).in_key.cmp(&node(a.1).in_key))
                .then(node(a.1).path.as_bytes().cmp(node(b.1).path.as_bytes()))
        });
        let mut out = String::with_capacity(256 + 256 * hits.len().min(limit));
        out.push_str(r#"{"schema":"kompendium-engine/v1","ok":true,"op":"search","query":"#);
        json_str(&mut out, query);
        out.push_str(r#","normalised":"#);
        json_str(&mut out, &q);
        out.push_str(r#","code":"#);
        json_opt(&mut out, code.as_deref());
        out.push_str(&format!(r#","limit":{limit},"total":{},"hits":["#, hits.len()));
        for (i, (tier, e)) in hits.iter().take(limit).enumerate() {
            let n = node(e);
            if i > 0 {
                out.push(',');
            }
            out.push_str(r#"{"path":"#);
            json_str(&mut out, &n.path);
            out.push_str(r#","url":"#);
            json_str(&mut out, &n.url);
            out.push_str(r#","title":"#);
            json_str(&mut out, &e.title);
            out.push_str(r#","code":"#);
            json_opt(&mut out, e.code.as_deref());
            out.push_str(r#","kind":"#);
            json_str(&mut out, &e.kind);
            out.push_str(&format!(
                r#","in":{},"tier":{},"why":"{}"}}"#,
                n.in_text,
                tier + 1,
                TIERS[*tier]
            ));
        }
        out.push_str("]}");
        out
    }

    fn neighbourhood(&self, request: &Map<String, Value>) -> String {
        let op = Some("neighbourhood");
        let path = match str_of(request.get("path")) {
            Some(p) if (1..=PATH_MAX).contains(&p.chars().count()) => p,
            _ => {
                let message = format!("path must be a string of 1 to {PATH_MAX} code points");
                return error(op, "bad_input", &message, Some("path"));
            }
        };
        let depth = match request.get("depth") {
            None => 1,
            Some(v) => match integer(v) {
                Some(d @ (1 | 2)) => d as usize,
                _ => return error(op, "bad_input", "depth must be 1 or 2", Some("depth")),
            },
        };
        let limit = match limit_of("neighbourhood", request, NEIGHBOURHOOD_LIMIT) {
            Ok(l) => l,
            Err(e) => return e,
        };
        let Some(&centre) = self.by_path.get(path) else {
            return error(op, "unknown_path", "no page has this path in graph.json", Some("path"));
        };
        const UNSEEN: usize = usize::MAX;
        let mut distance = vec![UNSEEN; self.nodes.len()];
        distance[centre] = 0;
        let mut reached = Vec::new();
        let mut frontier = vec![centre];
        for d in 1..=depth {
            let mut next = Vec::new();
            for &i in &frontier {
                for &j in &self.adjacent[i] {
                    if distance[j] == UNSEEN {
                        distance[j] = d;
                        next.push(j);
                        reached.push(j);
                    }
                }
            }
            frontier = next;
        }
        let nodes = &self.nodes;
        reached.sort_by(|&a, &b| {
            distance[a]
                .cmp(&distance[b])
                .then(nodes[b].in_key.cmp(&nodes[a].in_key))
                .then(nodes[a].path.as_bytes().cmp(nodes[b].path.as_bytes()))
        });
        let total = reached.len();
        let mut chosen = vec![centre];
        chosen.extend(reached.iter().take(limit));
        let mut keep = vec![false; nodes.len()];
        for &i in &chosen {
            keep[i] = true;
        }
        let mut kept: Vec<(usize, usize)> =
            self.edges.iter().copied().filter(|&(a, b)| keep[a] && keep[b]).collect();
        kept.sort_by(|x, y| {
            nodes[x.0]
                .path
                .as_bytes()
                .cmp(nodes[y.0].path.as_bytes())
                .then(nodes[x.1].path.as_bytes().cmp(nodes[y.1].path.as_bytes()))
        });
        let mut out = String::with_capacity(512 + 160 * (chosen.len() + kept.len()));
        out.push_str(r#"{"schema":"kompendium-engine/v1","ok":true,"op":"neighbourhood","path":"#);
        json_str(&mut out, path);
        out.push_str(&format!(
            r#","depth":{depth},"limit":{limit},"total":{total},"truncated":{},"nodes":["#,
            total > limit
        ));
        for (k, &i) in chosen.iter().enumerate() {
            if k > 0 {
                out.push(',');
            }
            out.push_str(r#"{"path":"#);
            json_str(&mut out, &nodes[i].path);
            out.push_str(r#","title":"#);
            json_str(&mut out, &nodes[i].title);
            out.push_str(r#","class":"#);
            json_str(&mut out, &nodes[i].section);
            out.push_str(&format!(r#","distance":{},"in":{}}}"#, distance[i], nodes[i].in_text));
        }
        out.push_str(r#"],"edges":["#);
        for (k, &(a, b)) in kept.iter().enumerate() {
            if k > 0 {
                out.push(',');
            }
            out.push_str(r#"{"from":"#);
            json_str(&mut out, &nodes[a].path);
            out.push_str(r#","to":"#);
            json_str(&mut out, &nodes[b].path);
            out.push_str(r#","kind":"link"}"#);
        }
        out.push_str("]}");
        out
    }
}

fn limit_of(op: &str, request: &Map<String, Value>, bounds: (i128, i128)) -> Result<usize, String> {
    let Some(v) = request.get("limit") else { return Ok(bounds.0 as usize) };
    match integer(v) {
        Some(l) if 1 <= l && l <= bounds.1 => Ok(l as usize),
        _ => {
            let message = format!("limit must be an integer from 1 to {}", bounds.1);
            Err(error(Some(op), "bad_input", &message, Some("limit")))
        }
    }
}

fn json_str(out: &mut String, s: &str) {
    // serde_json's escaping; serialising a str cannot fail.
    out.push_str(&serde_json::to_string(s).unwrap_or_else(|_| "\"\"".into()));
}

fn json_opt(out: &mut String, s: Option<&str>) {
    match s {
        Some(s) => json_str(out, s),
        None => out.push_str("null"),
    }
}

fn error(op: Option<&str>, code: &str, message: &str, field: Option<&str>) -> String {
    let mut out = String::from(r#"{"schema":"kompendium-engine/v1","ok":false,"op":"#);
    json_opt(&mut out, op);
    out.push_str(r#","error":{"code":"#);
    json_str(&mut out, code);
    out.push_str(r#","message":"#);
    json_str(&mut out, message);
    out.push_str(r#","field":"#);
    json_opt(&mut out, field);
    out.push_str("}}");
    out
}

/// An engine built from JSON text; text that is not JSON reads as a document of no schema.
pub fn from_json(search: &[u8], graph: &[u8]) -> Engine {
    let read = |b: &[u8]| serde_json::from_slice::<Value>(b).unwrap_or(Value::Null);
    Engine::new(&read(search), &read(graph))
}
