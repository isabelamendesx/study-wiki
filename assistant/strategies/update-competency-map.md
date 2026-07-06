# update-competency-map

## Objetivo
Atualizar `wiki/summaries/acompanhamento-competencias.md` para refletir novas páginas e áreas cobertas.

## Quando usar
- `/ingest` — passo 8, após mapear competências

## Entrada
- Slug da página criada
- Competências mapeadas (campo `competencies` do frontmatter)
- Conteúdo atual do `acompanhamento-competencias.md`

## Passos

1. **Ler o mapa de competências** atual.
2. **Para cada competência** da nova página:
   - Adicionar ou confirmar que a página consta na lista daquela competência.
3. **Atualizar contagem** ou indicador visual de cobertura.
4. **Sugerir temas a explorar** — se alguma área continua com pouca cobertura, manter na lista de gaps.

## Saída
- `wiki/summaries/acompanhamento-competencias.md` atualizado

## Estratégias relacionadas
- `map-competencies` — chamadora
- `update-log` — passo seguinte
