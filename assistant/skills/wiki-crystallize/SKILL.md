---
name: wiki-crystallize
description: "Destila uma sessão de estudo em aprendizado consolidado e salva na Study Wiki, extraindo insights, decisões e conexões."
disable-model-invocation: true
metadata:
  wiki_path: /Users/isabelam/Downloads/study-wiki
---

# /wiki-crystallize — Destilar Sessão

Extrai insights, decisões e conexões de uma sessão de estudo e os preserva na wiki.

## Entrada

`/wiki-crystallize` ou `/wiki-crystallize <descrição da sessão>`

Usável de qualquer contexto — após resolver um problema, aprender algo novo, ou discutir um tema.

## Fluxo

1. **distill-session** — Revisar a sessão e extrair:
   - Insights novos que não estão em nenhuma página
   - Decisões de estudo importantes
   - Conexões entre conceitos que emergiram
   - Perguntas não respondidas
2. **(Opcional) synthesize-page** — Criar página na wiki se algum insight justificar.
3. **update-log** — Registrar a sessão em `log.md`.

## Estratégias usadas

- `assistant/strategies/distill-session.md`
- `assistant/strategies/synthesize-page.md` (opcional)
- `assistant/strategies/update-log.md`
