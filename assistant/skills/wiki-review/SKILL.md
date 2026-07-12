---
name: wiki-review
description: Gera um resumo de estudos em um período (dia, semana, mês) — o que estudou, o que revisar e progresso no roadmap.
metadata:
  wiki_path: /Users/isabelam/life-wiki/study-wiki
---

# /wiki-review — Revisão de Estudos

Gera um resumo do que foi estudado em um período e sugere o que revisar
com base em tempo desde a última visita.

## Entrada

`/wiki-review` — esta semana (padrão)
`/wiki-review today` — hoje
`/wiki-review week` — esta semana
`/wiki-review month` — este mês
`/wiki-review since YYYY-MM-DD` — desde uma data específica

## Fluxo

### 1. Identificar o período

Se nenhum argumento, usar a semana atual (segunda a domingo).
Calcular `start_date` e `end_date` (ISO 8601).

### 2. Coletar dados

#### 2a. O que estudei no período — `log.md`

Ler `log.md` e filtrar entradas cuja data (`## [YYYY-MM-DD]`) está
dentro do período. Extrair:
- Data
- Ação (ingestão, lint, roadmap, crystallize, infra, etc.)
- Descrição (primeira linha após o cabeçalho)

#### 2b. O que preciso revisar — frontmatter das páginas

Varrer `wiki/concepts/`, `wiki/comparisons/`, `wiki/queries/`,
`wiki/recipes/`, `wiki/summaries/` e para cada página extrair:
- `title`
- `updated` (data da última modificação significativa)
- `understanding` (high, medium, low)

Classificar por tempo desde `updated` (sem emojis no output, usar palavras):
- 1-7 dias: recente
- 8-14 dias: atenção
- 15-30 dias: revisar
- 31+ dias: urgente

Ordenar por urgência, priorizando `understanding: low` ou `medium`.

#### 2c. Progresso no roadmap — `competencies.md`

Ler `assistant/domain/competencies.md` e extrair:
- `profile.name`
- `focus_areas` com tópicos e status
- Calcular: `covered / total` por área

#### 2d. Conteúdo das páginas relevantes — `wiki/concepts/`

Para as entradas encontradas no log do período, ler as páginas de
conceito associadas e extrair a ideia central (primeiro parágrafo
após o H1, ou seção de TL;DR se existir). Compactar em 1-2 frases.

Para os conceitos a revisar (da etapa 2b), fazer o mesmo: ler cada
página e extrair o núcleo. O objetivo é que o leitor relembre o
conteúdo sem precisar abrir a página.

### 3. Gerar e salvar o resumo

Estrutura limpa, sem emojis. Usar `##` para seções, bullets para itens.

**Frontmatter da página:**

```yaml
---
title: "Revisão — 7 a 13 Jul 2026"
created: "2026-07-13"
updated: "2026-07-13"
type: summary
tags:
  - review
  - self-assessment
sources: []
competencies: []
understanding: high
aliases:
  - revisão semana 13 jul
---
```

**Formato do conteúdo:**

```
# Revisão da Semana (7–13 Jul 2026) — <nome do perfil>

## O que estudou

<Se não houver entradas:>
Nenhuma atividade registrada essa semana.

<Se houver, para cada entrada do log, ler a página e extrair:>
### <Título do conceito>
<1-2 frases resumindo a ideia central da página.>
→ [[slug-da-pagina|Ver página completa]]

---

## O que revisar

Conceitos que não são revisitados há mais de 14 dias, ordenados
por urgência (dias desde última visita, understanding mais baixo primeiro).

### <Título> — 45 dias
<2-3 frases com o núcleo do conceito, extraídas da página.>
→ [[slug|Ver página]] | /wiki-assess <slug>

### <Título> — 22 dias
<2-3 frases com o núcleo do conceito.>
→ [[slug|Ver página]] | /wiki-assess <slug>

---

## Progresso no roadmap

| Área | Cobertura | Status |
|------|-----------|--------|
| ai-engineering | 0/6 | pendente |
| infrastructure | 0/9 | pendente |
| architecture | 6/9 | em andamento |

---

## Sugestões

- Revisar Conascência — 45 dias sem visita, understanding: medium
- Primeiro tópico de infrastructure: container-runtime (sem dependências)
- Próximo /wiki-assess: architecture (6 tópicos covered, validar retenção)
```

**Nomenclatura do arquivo:**
- Diário: `review-2026-07-13.md`
- Semanal: `review-2026-07-13.md` (data do domingo, fim da semana)
- Mensal: `review-2026-07.md`

Após salvar, atualizar `index.md` com a nova entrada na seção Summaries.

### 4. Tratar usuário novo (sem dados)

Se `log.md` não tem entradas ou `competencies.md` não tem `focus_areas`:

```\n# Revisão — <nome>\n\nAinda não há dados suficientes. Para começar:\n\n1. Rode /wiki-roadmap para configurar seu perfil\n2. Estude algo com /wiki-prepare + /wiki-ingest\n3. Depois volte aqui!\n```

## Estratégias usadas

- `assistant/strategies/competency-gaps.md` — progresso das focus_areas
- `assistant/strategies/update-index.md` — adicionar página ao index

## Domínio

- `assistant/domain/competencies.md` — perfil e focus_areas
- `log.md` — registro de atividades
- Frontmatter das páginas (`updated`, `understanding`)

## Referências

- `references/example-weekly-review.md` — exemplo de output semanal completo

---

## Configurando revisões automáticas (cron)

Depois de rodar `/wiki-roadmap`, você pode agendar `/wiki-review`
para rodar automaticamente. Peça para a LLM:

```
"Configura uma revisão semanal toda segunda 9h"
"Configura uma revisão diária às 18h"
"Me manda um resumo mensal no dia 1º"
```

A LLM usará o `cronjob` do Hermes para agendar. Exemplo:

```
cronjob(
  action='create',
  schedule='0 9 * * 1',
  prompt='/wiki-review week',
  skills=['wiki-review'],
  name='Revisão semanal de estudos'
)
```

O resumo será entregue no mesmo canal em que o cron foi criado
(Telegram, Discord, chat do Hermes, etc.).
