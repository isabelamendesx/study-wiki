---
name: wiki-assess
description: "Gera perguntas de autoavaliação sobre conceitos da Study Wiki e avalia as respostas do usuário, atualizando o nível de entendimento."
disable-model-invocation: true
metadata:
  wiki_path: /Users/isabelam/Downloads/study-wiki
---

# /wiki-assess — Autoavaliação

Gera perguntas de verificação sobre um conceito ou fonte, avalia as respostas do usuário e atualiza o campo `understanding`.

## Entrada

`/wiki-assess <página-ou-conceito>`

Ex: `/wiki-assess arquitetura-de-software`

## Fluxo

1. **generate-questions** — Gerar perguntas em pt-BR calibradas para o conteúdo:
   - Definição, aplicação, análise, síntese
   - Diferentes formatos (diretas, cenários, comparações)
2. **(Usuário responde)**
3. **evaluate-answers** — Avaliar cada resposta e atualizar `understanding`:
   - `high` — respondeu corretamente, com exemplos, fez conexões
   - `medium` — respondeu corretamente mas sem profundidade
   - `low` — respostas incorretas ou incompletas
4. **(Opcional)** Salvar em `wiki/queries/` como registro permanente.

## Estratégias usadas

- `assistant/strategies/generate-questions.md`
- `assistant/strategies/evaluate-answers.md`
