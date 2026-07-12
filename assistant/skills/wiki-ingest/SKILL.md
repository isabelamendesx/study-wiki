---
name: wiki-ingest
description: Ingere uma fonte de estudo (capítulo de livro, artigo) e cria páginas na Study Wiki, discutindo com o usuário antes de sintetizar.
metadata:
  wiki_path: /Users/isabela.gomes/SandBoxes/study-wiki
---

# /ingest — Ingestão de Fonte

Lê uma fonte e a transforma em página(s) na wiki, discutindo os pontos principais com o usuário primeiro.

## Entrada

`/ingest <caminho-da-fonte>` ou `/ingest <livro> <capítulo>`

Ex: `/ingest fundamentos-eng-software cap-5`

## Fluxo

1. **discuss-source** — Ler a fonte, resumir, destacar novidades, perguntar. Aguardar OK do usuário.
2. **synthesize-page** — Criar página(s) na wiki usando o template adequado (`assistant/templates/`).
3. **enrich-visuals** — Adicionar diagramas Mermaid (paleta Minimalista TCC), tabelas, callouts. Ver `references/mermaid-pitfalls.md` para erros comuns de sintaxe.
4. **map-competencies** — Mapear para áreas de engenharia de software.
5. **update-graph** — Adicionar wikilinks (pipe syntax, mínimo 2).
6. **update-book-index** — Atualizar `_index.md` do livro com progresso de leitura.
7. **update-index** — Atualizar `index.md`.
8. **update-competency-map** — Atualizar `covered_by` no roadmap.
9. **update-log** — Registrar a ingestão em `log.md`.

## Diretrizes de Estilo Didático

As páginas da wiki devem ser **didáticas e visualmente ricas**, seguindo o mesmo estilo do `/prepare`. O usuário aprende melhor com explicações narrativas, exemplos concretos e elementos visuais.

### Fase 1: discuss-source (diálogo)

Ao discutir a fonte com o usuário:
- Estruture a explicação em **3 atos** (problema → solução → aplicação prática)
- Use **metáforas e analogias** para conceitos abstratos
- Destaque **o que mudou** em relação ao conhecimento prévio (antes × depois)
- Faça **perguntas provocativas** que conectem o conteúdo à experiência do usuário (stack, projetos, desafios atuais)
- Se o capítulo tiver um **kata ou case study**, use-o como fio condutor da explicação

### Fase 2: synthesize-page (criação da página)

A página final deve incluir:

**Elementos textuais:**
- Estrutura clara com headings hierárquicos
- Definições em destaque (blockquote ou callout)
- Contraste antes × depois quando aplicável
- Exemplos numéricos e cenários concretos

**Elementos visuais (obrigatórios):**
- **Diagramas Mermaid** com a paleta Minimalista TCC para conceitos estruturais
- **Tabelas** para comparações (múltiplas entidades, múltiplos atributos)
- **Diagramas ASCII** para conceitos simples que não justificam Mermaid
- **Callouts** (> [!note], > [!warning], > [!tip]) para destaques

**Elementos de síntese:**
- Uma seção de **"Na prática"** com aplicações no mundo real
- **Conexões** com outras páginas da wiki (wikilinks com pipe syntax)
- **Litmus tests** ou heurísticas de decisão quando o capítulo oferecer

### Fase 3: enrich-visuals (enriquecimento visual)

- Use a paleta **Minimalista TCC**: azul #dbeafe/#3b82f6, verde #dcfce7/#22c55e, amarelo #fef9c3/#eab308, cinza #f3f4f6/#9ca3af, rosa #fee2e2/#ef4444
- Diagramas Mermaid devem ter no máximo 6-8 nós para manter legibilidade
- Tabelas com mais de 4 colunas devem ser repensadas (dividir em múltiplas tabelas ou usar outro formato)
- Ver `references/mermaid-pitfalls.md` para erros comuns de sintaxe

### O que evitar

- Páginas que são apenas transcrições do capítulo
- Blocos de texto sem quebras visuais (máximo 4-5 linhas por parágrafo)
- Diagramas complexos demais (prefira 2-3 diagramas pequenos a 1 enorme)
- Jargão sem definição contextual
- Listas secas de tópicos sem elaboração

## Estratégias usadas

- `assistant/strategies/discuss-source.md`
- `assistant/strategies/synthesize-page.md`
- `assistant/strategies/enrich-visuals.md`
- `assistant/strategies/map-competencies.md`
- `assistant/strategies/update-graph.md`
- `assistant/strategies/update-book-index.md`
- `assistant/strategies/update-index.md`
- `assistant/strategies/update-competency-map.md`
- `assistant/strategies/update-log.md`

## Convenções

- `assistant/conventions/frontmatter.md`
- `assistant/conventions/wikilinks.md`
- `assistant/conventions/language.md`
- `assistant/conventions/visual-enrichment.md`

## Domínio

- `assistant/domain/page-types.md`
- `assistant/domain/competencies.md`
- `assistant/domain/taxonomy.md`

## Templates

- `assistant/templates/` — usar o template correspondente ao tipo de página
