# validate-frontmatter

## Objetivo
Validar que todas as páginas da wiki têm frontmatter YAML completo e correto.

## Quando usar
- `/lint` — verificação de saúde completa

## Entrada
- Lista de todas as páginas em `wiki/` (recursivo)
- Regras em `assistant/conventions/frontmatter.md`

## Passos

1. **Listar todas as páginas** em `wiki/` (exceto `wiki/summaries/acompanhamento-competencias.md` que é gerido separadamente).
2. **Para cada página**, verificar:
   - `title` presente e igual ao H1
   - `created` presente e formato ISO
   - `updated` presente e formato ISO
   - `type` presente e válido (concept, comparison, query, recipe, summary)
   - `tags` presente, mínimo 1, da taxonomia aprovada
   - `sources` presente (pode ser `[]` para recipes)
   - `competencies` presente, slugs válidos
   - `understanding` presente (high, medium, low)
   - `aliases` presente (pode ser `[]`)
3. **Reportar problemas** encontrados (página, campo, problema).
4. **Oferecer correção** para cada problema.

## Saída
- Lista de páginas com problemas de frontmatter
- Correções oferecidas

## Estratégias relacionadas
- `/lint` — compõe o comando de lint completo
