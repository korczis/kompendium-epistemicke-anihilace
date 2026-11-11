# kompendium-engine

The query engine of the Kompendium, contract `kompendium-engine/v1`
([`docs/engine/kompendium-engine-v1.md`](../../docs/engine/kompendium-engine-v1.md)), in Rust
for `wasm32-unknown-unknown`. It follows the reference `scripts/engine.py` line by line and
answers byte for byte as it does. A pure library: `serde_json` (and through it `serde`) is its
only dependency, and it does not use wasm-bindgen.

| File | Role |
| --- | --- |
| `src/lib.rs` | the engine: data checks, `search`, `neighbourhood`, error objects, JSON output |
| `src/fold.rs` | `normalise`, words and EA codes |
| `src/tables.rs` | Unicode tables, **generated** by `scripts/build-engine-unicode.py` from Python's `unicodedata` (the reference's source of truth); never edit by hand |
| `src/abi.rs` | the C ABI of the wasm module |
| `../../static/js/viz/jadro-wasm.js` | the loader (browser and Node); `jadro.js` uses it when it is ready |
| `../../test/cases/06_engine_wasm.sh` | the conformance run: fixtures, the 05 sweep byte for byte, `normalise` on every code point, broken modules |

## ABI

JSON text in, JSON text out, through the module's linear memory. One instance holds one engine.
The loader compiles the module once and instantiates it per `create`.

| Export | Meaning |
| --- | --- |
| `alloc(len) -> ptr`, `dealloc(ptr, len)` | buffers for the inputs |
| `init(search_ptr, search_len, graph_ptr, graph_len) -> status` | builds the engine; 0, or 1/2 when search/graph is not JSON text |
| `run(req_ptr, req_len) -> ptr` | the response; `result_len()` gives its length; valid until the next call |
| `contract() -> ptr` | `kompendium-engine/v1`, for the loader's check |
| `normalise(ptr, len) -> ptr` | the contract's normalisation, for the loader's check and test 06 |

## Build

The module is a build product. `static/wasm/` is gitignored, so the binary is never committed.

```sh
cargo build --release --locked --target wasm32-unknown-unknown \
  --manifest-path crates/kompendium-engine/Cargo.toml
cp "${CARGO_TARGET_DIR:-crates/kompendium-engine/target}/wasm32-unknown-unknown/release/kompendium_engine.wasm" \
  static/wasm/
bash test/cases/06_engine_wasm.sh
```

- **CI** (`.github/workflows/ci.yml`, job `validate`): `dtolnay/rust-toolchain` with target
  `wasm32-unknown-unknown`, then `Swatinem/rust-cache` keyed on `Cargo.lock`. After that the
  same build, copied into `static/wasm/` before the tests and `zola build`, then
  `06_engine_wasm.sh` and a size gate (300 KB).
- **The owner's Mac**: never run cargo there. Build on `lundra`. First check `df -h ~` there,
  and stop if less than 35 GiB is free. Then use a private target directory and remove it
  afterwards:

  ```sh
  rsync -a --delete crates/kompendium-engine/ lundra:.cache/kea-wasm-src/kompendium-engine/
  ssh lundra 'cd ~/.cache/kea-wasm-src/kompendium-engine &&
    CARGO_TARGET_DIR=~/.cache/kea-wasm-target cargo build --release --locked --target wasm32-unknown-unknown &&
    CARGO_TARGET_DIR=~/.cache/kea-wasm-target cargo test --release --locked'
  scp lundra:.cache/kea-wasm-target/wasm32-unknown-unknown/release/kompendium_engine.wasm static/wasm/
  ssh lundra 'rm -rf ~/.cache/kea-wasm-target ~/.cache/kea-wasm-src'
  ```

- Without the module, test 06 skips with a notice. With `KEA_WASM_BUILD=1` and cargo
  present, it builds the module into its temporary copy first.

## Unicode

`normalise` needs NFKD, General_Category (M\*, L\*, N\*), lower case and the Final_Sigma
properties. The crate has no Unicode library, so `scripts/build-engine-unicode.py` writes them out
from the same Python that runs the reference. The tables record that Python's Unicode version.
`--check`, run by test 06, compares them only on that version; on another version it reports and
passes. Regenerate the tables, rebuild the module and run 06 whenever the reference's Python
changes its Unicode version.
