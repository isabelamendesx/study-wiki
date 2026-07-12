# update-competency-map

## Objetivo
Atualizar os `covered_by` no `competencies.md` quando uma nova página
cobre um tópico das `focus_areas`.

## Quando usar
- `/ingest` — passo 8, após mapear competências

## Entrada
- Slug da página criada e competências mapeadas
- `assistant/domain/competencies.md` — roadmap atual

## Passos

1. **Ler o roadmap** — `focus_areas` com tópicos e `covered_by`.
2. **Para cada tópico** coberto pela página:
   - Adicionar wikilink em `covered_by` no roadmap
   - Se era `pending`, atualizar para `covered`
3. **Sugerir próximos passos** — tópicos cujas dependências acabaram
   de ser satisfeitas.

## Saída
- `assistant/domain/competencies.md` com `covered_by` atualizados

## Estratégias relacionadas
- `map-competencies` — chamadora
- `update-log` — passo seguinte
