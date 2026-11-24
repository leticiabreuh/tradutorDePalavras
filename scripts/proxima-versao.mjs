import { execFileSync } from 'node:child_process';

function git(...args) {
  return execFileSync('git', args, { encoding: 'utf8' }).trim();
}

const tags = git('tag', '--list', 'v[0-9]*', '--sort=-v:refname')
  .split('\n')
  .filter(Boolean);

if (tags.length === 0) {
  const output = 'versao=1.0.0';
  console.log(output);
  process.exit(0);
}

const ultimaTag = tags[0];
const correspondencia = /^v(\d+)\.(\d+)\.(\d+)$/.exec(ultimaTag);
if (!correspondencia) throw new Error(`Tag SemVer invalida: ${ultimaTag}`);

const [major, minor, patch] = correspondencia.slice(1).map(Number);
const mensagens = git('log', '--format=%B%x1e', `${ultimaTag}..HEAD`)
  .split('\x1e')
  .map((mensagem) => mensagem.trim())
  .filter(Boolean);

let nivel = 0;
for (const mensagem of mensagens) {
  const titulo = mensagem.split('\n', 1)[0];
  if (/^[a-z]+(?:\([^)]+\))?!:/.test(titulo) || /BREAKING CHANGE:/.test(mensagem)) {
    nivel = 3;
    break;
  }
  if (/^feat(?:\([^)]+\))?:/.test(titulo)) nivel = Math.max(nivel, 2);
  if (/^(?:fix|perf)(?:\([^)]+\))?:/.test(titulo)) nivel = Math.max(nivel, 1);
}

let proxima = '';
if (nivel === 3) proxima = `${major + 1}.0.0`;
if (nivel === 2) proxima = `${major}.${minor + 1}.0`;
if (nivel === 1) proxima = `${major}.${minor}.${patch + 1}`;

const output = `versao=${proxima}`;
console.log(output);
