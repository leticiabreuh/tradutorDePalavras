# Guia de onboarding — Tradutor de Palavras

## Pré-requisitos

- Git instalado e acesso ao repositório.
- Flutter e Dart instalados e disponíveis no terminal.
- Acesso ao GitHub e, para aprovar uma produção, permissão de revisora no Environment `production`.

## Instalar e executar

Na raiz do repositório:

```bash
cd tradutor_palavras
flutter pub get
flutter run
```

Para escolher um dispositivo, consulte `flutter devices` e execute `flutter run -d <id>`. Para gerar a versão Web localmente, use `flutter build web`.

## Analisar e testar

Execute na pasta `tradutor_palavras`:

```bash
flutter analyze
flutter test
flutter test --coverage
```

O workflow de CI executa análise, testes, cobertura mínima de 60% e build Web em Pull Requests direcionados à `main`.

## Criar branch e Pull Request

1. Abra uma Issue para descrever a mudança e seu critério de aceite.
2. Atualize a `main` e crie uma branch com o número da Issue, por exemplo `feature/12-melhorar-traducao` ou `fix/13-corrigir-acentos`.
3. Faça commits claros e abra um PR para `main` com título Conventional Commits, como `feat: adiciona palavra favorita` ou `fix: corrige traducao de agua`.
4. Inclua `Closes #<numero>` na descrição do PR, explique o que mudou e como foi verificado.
5. Aguarde os checks `ci-ok` e `titulo-pr`; corrija falhas na mesma branch.
6. Solicite revisão do par. Faça merge somente depois da aprovação e dos checks obrigatórios.

## Ler o resultado do pipeline

- Na aba **Checks** do PR, abra o job que falhou e leia o passo com erro. `qualidade` reúne análise, testes, cobertura e build; `dependencias` verifica vulnerabilidades; `ci-ok` agrega o resultado; `titulo-pr` valida o padrão do título.
- Depois do merge, consulte **Actions → CD**. Baixe o artefato `pacote-*` para conferir o candidato de staging.
- Se houver uma nova versão semântica, a execução aguardará revisão no Environment `production`. Após aprovação, confira a tag e a GitHub Release com o pacote anexado.
- Para rollback, use **Actions → Rollback → Run workflow**, informe uma tag de Release existente e aprove a execução no Environment `production`.

## Dependências e mudanças de alto risco

- Revise PRs do Dependabot como qualquer mudança: confira release notes, CI e aprovação do par.
- Para mudanças de alto risco, abra uma Issue usando o formulário **Mudança de alto risco (CCM)**. Registre evidências, risco, plano de rollback com tag real e decisão justificada do par antes de implementar.
- Decisões de arquitetura e exceções de risco devem permanecer registradas nos ADRs em `docs/adr/`.
