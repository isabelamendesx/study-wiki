# find-stale

## Objetivo
Verificar se fontes mais recentes substituem ou contradizem afirmações de páginas baseadas em fontes antigas.

## Quando usar
- `/lint` — verificação de saúde completa

## Entrada
- Todas as páginas em `wiki/`
- Campo `updated` do frontmatter de cada página
- Fontes em `raw/`

## Passos

1. **Listar páginas** ordenadas por `updated` (mais antigas primeiro).
2. **Identificar páginas sem atualização recente** (ex: mais de 60 dias sem alteração).
3. **Comparar campo `sources`** — se uma página referencia fontes antigas e existem fontes mais recentes sobre o mesmo tópico.
4. **Verificar obsolescência** — fontes mais novas que contradizem ou refinam afirmações de páginas antigas.
5. **Reportar** páginas potencialmente obsoletas.
6. **Oferecer revisão** — sugerir atualização com base em fontes mais recentes.

## Saída
- Lista de páginas potencialmente desatualizadas
- Sugestões de atualização

## Estratégias relacionadas
- `/lint` — compõe o comando de lint completo
