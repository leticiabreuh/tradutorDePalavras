# 0001 — Releases do GitHub são a baseline de produção

- Status: aceito
- Data: 24/11/2026

## Contexto

O Tradutor de Palavras é um aplicativo Flutter e não tem, neste projeto, um servidor de produção já configurado. A entrega precisa gerar um pacote reproduzível, permitir revisão antes da publicação e oferecer rollback rastreável.

## Decisão

O workflow de CD compila o app Web uma vez, disponibiliza o pacote como artefato de staging e, após aprovação no Environment `production`, anexa o mesmo pacote a uma GitHub Release versionada. A Release marcada como `Latest` representa a baseline oficial. A publicação no GitHub Pages fica opcional.

## Alternativas consideradas

- Publicar automaticamente em um serviço externo: exigiria hospedagem e credenciais que não fazem parte do projeto.
- Compilar novamente após a aprovação: poderia produzir um pacote diferente do que foi revisado no staging.
- Usar apenas uma tag sem pacote: não deixaria o artefato aprovado disponível para conferência.

## Consequências

- Cada versão oficial tem tag, notas e pacote anexado à Release.
- A produção exige uma pessoa revisora configurada nas regras do Environment `production`.
- Sem GitHub Pages ou outra hospedagem, a Release é a baseline oficial para download e auditoria, não um site público atualizado automaticamente.
- O rollback pode reclassificar uma Release anterior como `Latest` sem recompilar o código.
