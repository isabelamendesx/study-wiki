# Registro de Alterações

Registro cronológico (append-only) de ingestões, perguntas, verificações de
lint e outros eventos significativos da wiki.

Cada entrada começa com `## [YYYY-MM-DD] <ação> | <descrição>` para que o
log seja parseável com `grep "^## \[" log.md`.

---

<!-- LLM: adicionar entradas abaixo conforme a wiki evolui -->

## [2026-07-06] infra | setup: wiki_path automático nos adapters

O script `assistant/setup.sh` agora atualiza automaticamente o campo `wiki_path` nos
metadados dos arquivos em `assistant/adapters/hermes/*.md` para o path real da wiki
antes de criar os symlinks. Antes era necessário editar manualmente após clonar em
outro diretório ou máquina.

## [2026-06-18] scaffold | Estrutura inicial da wiki de estudos criada

Criada a estrutura de diretórios, SCHEMA.md, README.md, index.md, log.md,
.manifest.json, acompanhamento-competencias.md e índice do primeiro livro
(Fundamentos de Engenharia de Software).

A wiki está pronta para receber a primeira ingestão de estudo.

## [2026-06-21] ingestão | Cap 1-2: Introdução e Pensamento Arquitetônico

Livro: Fundamentos de Engenharia de Software. Criada página [[arquitetura-de-software|Arquitetura de Software]]
com os 4 componentes (estrutura, características, decisões, princípios) e as duas leis
(tudo é trade-off; porquê > como). Cobriu `architecture`, `technical-breadth` e `code-quality`.
Primeira página de conceito da wiki.

## [2026-06-21] ingestão | Cap 3: Modularidade

Livro: Fundamentos de Engenharia de Software. Criadas páginas [[wiki/concepts/modularidade|Modularidade]]
(coesão, acoplamento aferente/eferente, abstração/instabilidade/distância da sequência principal)
e [[conascencia|Conascência]] (tipos estáticos e dinâmicos, Page-Jones, Weirich). Cobriu
`architecture`, `code-quality` e `technical-breadth`. Primeira ingestão com múltiplas
páginas e diagramas Mermaid.

## [2026-07-01] ingestão | Cap 4: Definição das Características da Arquitetura

Livro: Fundamentos de Engenharia de Software. Criada página [[caracteristicas-arquiteturais|Características Arquiteturais]]
(critérios de definição, implícitas vs. explícitas, categorias operacionais/estruturais/transversais,
trade-offs e least worst architecture). Cobriu `architecture`, `technical-breadth`, `security`,
`operation` e `performance`.

## [2026-07-01] infra | PDF, sources, attachments e SCHEMA

- PDF do livro copiado de Downloads → `raw/books/fundamentos-eng-software/livro.pdf`
- Sources extraídos do PDF: `sources/cap-01-02.source.md` (1110 linhas), `sources/cap-03.source.md` (533 linhas)
- Subdiretório `sources/` criado para separar texto original (EN, imutável) das notas (PT-BR)
- Template `capitulo-livro.md` atualizado com wikilink para source
- Caps 1-2, 3 e 4 atualizados com `[[sources/cap-NN.source|Cap N — texto original (EN)]]`
- Attachments renomeados para padrão `<conceito>-<descricao>.png` e embedados nas páginas de conceito
- SCHEMA.md atualizado: idioma na ingestão, estrutura `sources/`, convenção de attachments
- `index.md`, `acompanhamento-competencias.md`, `_index.md`, `.manifest.json` atualizados

## [2026-07-05] ingestão | Cap 5: Identifying Architectural Characteristics

Fonte preparada via `/prepare` com EPUB + pandoc. Template `5 - Identificando Caracteristicas Arquiteturais.md`
criado com TL;DR e Resumo automáticos. Aguardando completar com insights para `/ingest`.
