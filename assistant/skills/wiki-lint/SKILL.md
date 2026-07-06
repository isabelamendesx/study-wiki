---
name: wiki-lint
description: "Executa verificação de saúde na Study Wiki: frontmatter, wikilinks, órfãs, contradições, obsolescência e gaps de competência."
metadata:
  wiki_path: /Users/isabela.gomes/SandBoxes/study-wiki
---

# /lint — Verificação de Saúde

Executa verificações de saúde na wiki com subcomandos opcionais.

## Entrada

`/lint` — verificação completa  
`/lint frontmatter` — apenas validação de frontmatter  
`/lint wikilinks` — links quebrados e pipe syntax  
`/lint gaps` — apenas gaps de competência

## Fluxo (completo)

1. **validate-frontmatter** — Verificar frontmatter YAML de todas as páginas.
2. **validate-wikilinks** — Verificar links quebrados e pipe syntax.
3. **find-orphans** — Encontrar páginas sem wikilinks de entrada.
4. **find-contradictions** — Procurar afirmações conflitantes entre páginas.
5. **find-stale** — Identificar páginas desatualizadas.
6. **competency-gaps** — Identificar gaps de cobertura por competência.

## Estratégias usadas

- `assistant/strategies/validate-frontmatter.md`
- `assistant/strategies/validate-wikilinks.md`
- `assistant/strategies/find-orphans.md`
- `assistant/strategies/find-contradictions.md`
- `assistant/strategies/find-stale.md`
- `assistant/strategies/competency-gaps.md`

## Convenções

- `assistant/conventions/frontmatter.md`
- `assistant/conventions/wikilinks.md`
