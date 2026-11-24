import { execFileSync } from 'node:child_process';

function git(...args) {
  return execFileSync('git', args, { encoding: 'utf8' }).trim();
}

const tag = git('tag', '--list', 'v[0-9]*', '--sort=-v:refname')
  .split('\n')
  .find(Boolean);
const range = tag ? `${tag}..HEAD` : 'HEAD';
const titulos = git('log', '--format=%s%x1e', range)
  .split('\x1e')
  .map((titulo) => titulo.trim())
  .filter(Boolean);

const secoes = {
  Funcionalidades: [],
  Correcoes: [],
  Outros: [],
};

for (const titulo of titulos) {
  if (/^feat(?:\([^)]+\))?!?:/.test(titulo)) {
    secoes.Funcionalidades.push(titulo);
  } else if (/^(?:fix|perf)(?:\([^)]+\))?!?:/.test(titulo)) {
    secoes.Correcoes.push(titulo);
  } else {
    secoes.Outros.push(titulo);
  }
}

for (const [secao, itens] of Object.entries(secoes)) {
  if (itens.length === 0) continue;
  console.log(`## ${secao}\n`);
  for (const item of itens.reverse()) console.log(`- ${item}`);
  console.log();
}

if (titulos.length === 0) console.log('Sem mudanças registradas desde a última baseline.');
