# Entregas das Aulas 2, 3 e 4

Este registro separa os arquivos preparados no repositório das evidências que só existem após execução e revisão no GitHub. Preencha os links depois de concluir cada etapa externa.

## Aula 2 — Integração contínua

- [x] Workflow de CI, análise, testes, cobertura e build.
- [x] Validação de título Conventional Commits.
- [x] PR de CI mesclado: https://github.com/leticiabreuh/tradutorDePalavras/pull/10 (merge em `main`, commit `4398274`)
- [x] Check de título inválido: https://github.com/leticiabreuh/tradutorDePalavras/actions/runs/45392065391
- [x] Check de lint falho intencionalmente: https://github.com/leticiabreuh/tradutorDePalavras/actions/runs/45392290061
- [x] Check de teste falho intencionalmente: https://github.com/leticiabreuh/tradutorDePalavras/actions/runs/45392602937
- [x] `ci-ok` e `titulo-pr` configurados como checks obrigatórios na `main`.
- [x] PR revisado e aprovado por IzaSouza09: https://github.com/leticiabreuh/tradutorDePalavras/pull/10

## Aula 3 — Entrega contínua

- [x] Workflow de CD e script de versão SemVer.
- [x] Workflow manual de rollback.
- [x] Environment `production` configurado com IzaSouza09 como revisora obrigatória; autoaprovação impedida.
- [x] Pacote candidato `1.0.0` gerado e disponibilizado em staging: https://github.com/leticiabreuh/tradutorDePalavras/actions/runs/45398416807
- [ ] Aprovação de produção pendente no Environment `production`: https://github.com/leticiabreuh/tradutorDePalavras/actions/runs/45398416807
- [ ] Release `v1.0.0`: <link>
- [ ] Release `v1.0.1`: <link>
- [ ] Release `v1.1.0`: <link>
- [ ] Execução de CD aprovada: <link>
- [ ] Execução de rollback aprovada: <link>
- [ ] PR `revert: ...`: <link>

## Aula 4 — Governança

- [x] Dependabot configurado para Pub e GitHub Actions em `main` após o merge do PR #10.
- [x] Formulário de Issue de mudança de alto risco.
- [x] Dois ADRs e guia de onboarding.
- [x] Alertas e atualizações de segurança do Dependabot ativados nas configurações.
- [x] Alertas revisados em 24/11/2026: 0 abertos; grafo da `main` com 24 dependências; nenhum risco específico a aceitar nesta data.
- [ ] PR do Dependabot revisado e tratado: https://github.com/leticiabreuh/tradutorDePalavras/pull/11 (atualiza `cupertino_icons` de 1.0.9 para 2.0.0; CI passou, aguardando revisão do par)
- [ ] Issue CCM com decisão do par e tag real para rollback: <link>
- [ ] PR de melhoria do onboarding aberto pelo par: <link>
- [ ] Rastreabilidade da Release `v1.1.0`:
  - Release: <link>
  - Commit/tag: <link>
  - PR: <link>
  - Revisão do par: <link>
  - CI: <link>
  - Issue de origem: <link>
  - Aprovação de produção: <link>
