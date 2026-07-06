# update-index

## Objetivo
Atualizar `index.md` com novas páginas criadas ou páginas existentes alteradas.

## Quando usar
- `/ingest` — passo 7, após criar/alterar página(s)
- `/lint` — quando páginas são corrigidas

## Entrada
- Lista de páginas criadas ou alteradas
- Conteúdo atual do `index.md`

## Passos

1. **Identificar a categoria** correta em `index.md` (concepts, comparisons, queries, recipes, summaries).
2. **Adicionar entrada** no formato:
   ```markdown
   - [[slug-da-pagina|Título]] — resumo de uma linha.
   ```
3. **Manter ordem alfabética** aproximada (ou agrupamento lógico, o que for mais legível).
4. **Remover entradas** se uma página foi deletada (raro).
5. **Não duplicar** — verificar se a página já consta no índice.

## Saída
- `index.md` atualizado

## Estratégias relacionadas
- `synthesize-page` — chamadora
- `update-log` — passo seguinte
