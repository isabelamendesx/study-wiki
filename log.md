# Registro de Alterações

Registro cronológico (append-only) de ingestões, perguntas, verificações de
lint e outros eventos significativos da wiki.

Cada entrada começa com `## [YYYY-MM-DD] <ação> | <descrição>` para que o
log seja parseável com `grep "^## \[" log.md`.

---

## [2026-07-05] refatoração | Arquitetura Commands + Strategies + Wiki

Refatoração completa da wiki: de SCHEMA.md monolítico para arquitetura modular.

- **`assistant/`** — criado com 21 estratégias, 7 adapters Hermes, 5 convenções, 3 arquivos de domínio, 5 templates
- **`SCHEMA.md`** — decomposto e removido
- **`.manifest.json`** e **`llm-wiki-skills/`** — removidos
- **`/prepare`** — novo comando que extrai capítulos de EPUB via pandoc e preenche TL;DR + Resumo
- **Skills Hermes** — `wiki-ingest`, `wiki-prepare`, `wiki-ask`, `wiki-assess`, `wiki-lint`, `wiki-crystallize`, `wiki-progress`
- **Setup** — `./setup` instala skills globalmente
- **EPUB workflow** — livros agora em `sources/livro.epub` (não PDF)
- **GitHub** — repo público `isabelamendesx/study-wiki` (main = estrutura, isabela = conteúdo pessoal)

<!-- LLM: adicionar entradas abaixo conforme a wiki evolui -->
