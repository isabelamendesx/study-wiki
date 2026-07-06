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
