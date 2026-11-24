# 0002 — Bloquear vulnerabilidades críticas e acompanhar as demais

- Status: aceito
- Data: 24/11/2026

## Contexto

O CI já inclui revisão de dependências e bloqueia vulnerabilidades classificadas como críticas. O projeto também usa dependências Flutter/Dart e GitHub Actions, que precisam receber atualizações controladas. A lista atual de alertas deve ser conferida no GitHub antes de aceitar riscos específicos.

## Decisão

Manter o bloqueio de vulnerabilidades críticas no CI. Ativar alertas e atualizações de segurança do Dependabot, incluindo o ecossistema `pub` e GitHub Actions. Alertas `high` serão triados no GitHub; qualquer aceitação temporária deverá apontar a dependência afetada, justificar o risco e registrar um prazo de revisão em uma Issue.

## Alternativas consideradas

- Bloquear apenas alertas críticos sem triagem dos demais: deixaria riscos altos sem responsável ou prazo.
- Bloquear todos os níveis imediatamente: pode impedir atualizações não críticas antes da avaliação de impacto e correção.
- Ignorar alertas até a próxima release: não oferece acompanhamento contínuo.

## Verificação em 24/11/2026

- A página de alertas do Dependabot na `main` não apresentava alertas abertos; portanto, não há alerta `high` ou `critical` específico aceito nesta data.
- O grafo de dependências da `main` listava 24 dependências.
- A configuração `.github/dependabot.yml` foi incorporada à `main` pelo PR #10.
- O PR #11 do Dependabot atualiza `cupertino_icons` de 1.0.9 para 2.0.0. A revisão de dependências da CI não apontou vulnerabilidades, problemas de licença ou de Scorecard; o PR aguarda revisão do par antes do merge.

## Consequências

- PRs com vulnerabilidades críticas falham no job de revisão de dependências.
- Atualizações automáticas chegam como PRs com prefixo `chore(deps)` e passam pelo CI normal.
- A equipe precisa revisar alertas altos e registrar decisões e prazo; o estado real dos alertas ainda precisa ser consultado na página Security do repositório.
- Revisar esta decisão até 24/05/2027 ou antes se surgir uma vulnerabilidade relevante.
