# update-graph

## Objetivo
Atualizar wikilinks entre páginas existentes quando uma nova página é criada ou uma existente é modificada.

## Quando usar
- `/ingest` — passo 6, após criar nova página

## Entrada
- Slug/nome da página nova
- Lista de páginas existentes (via `index.md` ou explorando `wiki/`)

## Passos

1. **Identificar conexões** — quais páginas existentes mencionam ou deveriam mencionar o conceito da nova página.
2. **Adicionar wikilinks** na nova página para as existentes (mínimo 2, com pipe syntax).
3. **Adicionar wikilinks** nas páginas existentes para a nova página onde pertinente.
4. **Seguir as regras** de `assistant/conventions/wikilinks.md`:
   - Pipe syntax obrigatória
   - Só linkar para páginas que existem
   - Usar `[!note] Páginas futuras` para conceitos sem página própria

## Saída
- Novas páginas com wikilinks para existentes
- Páginas existentes atualizadas com wikilinks para a nova

## Estratégias relacionadas
- `synthesize-page` — chamadora
- `update-index` — passo seguinte
