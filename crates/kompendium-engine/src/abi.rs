//! The C ABI of the wasm module: JSON text in, JSON text out, through linear memory.
//!
//! One module instance holds one engine (a loader instantiates the compiled module once per
//! `create`). The host:
//!
//! 1. `alloc(len)` a buffer per input, writes the UTF-8 bytes there;
//! 2. `init(search_ptr, search_len, graph_ptr, graph_len)` builds the engine, then
//!    `dealloc(ptr, len)`s the buffers. Status 0: both inputs were JSON (data of a schema this
//!    version does not read still builds, and answers `schema_mismatch`); 1 or 2: search or
//!    graph was not JSON text, and every request answers `schema_mismatch`;
//! 3. `run(req_ptr, req_len)` returns a pointer to the response and `result_len()` its length
//!    in bytes. The response stays valid until the next call into the module, which frees it.
//!
//! `contract()` answers the contract name ("kompendium-engine/v1") and `normalise(ptr, len)`
//! the contract's normalisation of a string, both through the same result buffer.

use crate::Engine;
use core::cell::RefCell;

struct State {
    engine: Option<Engine>,
    result: Vec<u8>,
}

/// wasm32-unknown-unknown has no threads: the instance's single state.
struct Single(RefCell<State>);
// SAFETY: the target is single threaded; nothing is ever shared across threads.
unsafe impl Sync for Single {}

static STATE: Single = Single(RefCell::new(State { engine: None, result: Vec::new() }));

fn bytes<'a>(ptr: *const u8, len: usize) -> &'a [u8] {
    if ptr.is_null() || len == 0 {
        return &[];
    }
    // SAFETY: the host passes a buffer it obtained from `alloc(len)` and filled.
    unsafe { core::slice::from_raw_parts(ptr, len) }
}

fn answer(text: String) -> *const u8 {
    let mut state = STATE.0.borrow_mut();
    state.result = text.into_bytes();
    state.result.as_ptr()
}

#[unsafe(no_mangle)]
pub extern "C" fn alloc(len: usize) -> *mut u8 {
    let mut buf = Vec::<u8>::with_capacity(len.max(1));
    let ptr = buf.as_mut_ptr();
    core::mem::forget(buf);
    ptr
}

#[unsafe(no_mangle)]
pub extern "C" fn dealloc(ptr: *mut u8, len: usize) {
    if !ptr.is_null() {
        // SAFETY: `ptr` came from `alloc(len)`, whose capacity is `len.max(1)`.
        unsafe { drop(Vec::from_raw_parts(ptr, 0, len.max(1))) };
    }
}

#[unsafe(no_mangle)]
pub extern "C" fn init(search_ptr: *const u8, search_len: usize, graph_ptr: *const u8,
                       graph_len: usize) -> i32 {
    let read = |b: &[u8]| serde_json::from_slice::<serde_json::Value>(b).ok();
    let (search, graph) = (read(bytes(search_ptr, search_len)), read(bytes(graph_ptr, graph_len)));
    let status = if search.is_none() { 1 } else if graph.is_none() { 2 } else { 0 };
    let null = serde_json::Value::Null;
    let engine = Engine::new(search.as_ref().unwrap_or(&null), graph.as_ref().unwrap_or(&null));
    STATE.0.borrow_mut().engine = Some(engine);
    status
}

#[unsafe(no_mangle)]
pub extern "C" fn run(req_ptr: *const u8, req_len: usize) -> *const u8 {
    let text = {
        let state = STATE.0.borrow();
        match &state.engine {
            Some(engine) => engine.run_json(bytes(req_ptr, req_len)),
            None => crate::error(None, "schema_mismatch", "init was not called", None),
        }
    };
    answer(text)
}

#[unsafe(no_mangle)]
pub extern "C" fn result_len() -> usize {
    STATE.0.borrow().result.len()
}

#[unsafe(no_mangle)]
pub extern "C" fn contract() -> *const u8 {
    answer(crate::SCHEMA.to_string())
}

#[unsafe(no_mangle)]
pub extern "C" fn normalise(ptr: *const u8, len: usize) -> *const u8 {
    let text = core::str::from_utf8(bytes(ptr, len)).map(crate::normalise).unwrap_or_default();
    answer(text)
}
