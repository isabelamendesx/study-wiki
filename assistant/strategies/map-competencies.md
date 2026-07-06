# map-competencies

## Objetivo
Mapear uma página nova para as áreas de engenharia de software (competências) no campo `competencies` do frontmatter.

## Quando usar
- `/ingest` — passo 5, após `synthesize-page`

## Entrada
- Conteúdo da página criada
- Lista de slugs em `assistant/domain/competencies.md`

## Passos

1. **Ler as descrições** de cada competência em `assistant/domain/competencies.md`.
2. **Analisar o conteúdo da página** — quais áreas de engenharia de software ela cobre de forma substantiva.
3. **Selecionar slugs relevantes** (mínimo 1, normalmente 2-3).
4. **Preencher** o campo `competencies` no frontmatter da página.

## Critérios
- Uma página sobre "performance em Kafka" cobre `performance` e `infrastructure`
- Uma página sobre "testes em Go" cobre `code-quality` e `technical-depth`
- O campo `competencies` reflete **o que a página ensina**, não apenas tags de assunto

## Saída
- Frontmatter da página atualizado com competências

## Estratégias relacionadas
- `synthesize-page` — chamadora
- `update-competency-map` — passo seguinte
