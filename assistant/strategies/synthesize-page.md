# synthesize-page

## Objetivo
Sintetizar e enriquecer uma fonte em uma página da wiki. Não apenas reorganizar notas brutas — conectar conceitos, adicionar exemplos e implicações práticas.

## Quando usar
- `/ingest` — passo 3, após `discuss-source`
- `/assess` — após `evaluate-answers`, para consolidar aprendizado como página
- `/crystallize` — após `distill-session`

## Entrada
- Fonte(s) ou sessão de estudo
- Instruções ou direcionamento do usuário
- Tipo de página a criar (concept, comparison, query, recipe, summary)

## Passos

1. **Identificar o tipo de página** adequado (ver `assistant/domain/page-types.md`).
2. **Usar o template correspondente** em `assistant/templates/`:
   - `concept.md` para técnicas, teorias, métodos
   - `comparison.md` para análises lado a lado
   - `query.md` para perguntas e respostas permanentes
   - `recipe.md` para how-tos e soluções práticas
   - `summary.md` para sínteses multi-fonte
3. **Conectar conceitos entre si** — usar wikilinks para páginas existentes (mínimo 2, com pipe syntax).
4. **Adicionar exemplos concretos** do dia a dia quando possível.
5. **Explicar o porquê** por trás de cada afirmação, não só o quê.
6. **Usar elementos visuais** (ver `assistant/conventions/visual-enrichment.md`):
   - Diagramas Mermaid para fluxos e hierarquias
   - Tabelas para comparações e definições multi-atributo
   - Callouts para destacar, resumir ou alertar
7. **Preencher frontmatter completo** conforme `assistant/conventions/frontmatter.md`.

## Saída
- Arquivo em `wiki/<tipo>/<slug>.md` com conteúdo completo

## Estratégias relacionadas
- `enrich-visuals` — detalhamento dos elementos visuais
- `map-competencies` — passo seguinte para mapear áreas
- `update-graph` — passo seguinte para linkar páginas existentes
