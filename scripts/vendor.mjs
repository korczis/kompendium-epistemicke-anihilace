// Copies the pinned Flowbite browser bundle out of node_modules so the site self-hosts it (no CDN).
// Chart.js, p5, three.js and Mermaid are committed under static/js/vendor/ (see NOTICE.md).
import { copyFileSync, mkdirSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const ROOT = join(dirname(fileURLToPath(import.meta.url)), '..');
const TARGET = join(ROOT, 'static/js/vendor');
const BUNDLES = {
  'flowbite.min.js': 'node_modules/flowbite/dist/flowbite.min.js',
};

mkdirSync(TARGET, { recursive: true });
for (const [name, source] of Object.entries(BUNDLES)) {
  copyFileSync(join(ROOT, source), join(TARGET, name));
  console.log(`vendor ${source} -> static/js/vendor/${name}`);
}
