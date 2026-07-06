# Wiki de Estudos

Wiki pessoal de estudos de engenharia de software, assistida por LLM.
Conceitos técnicos, comparações, resumos de livros, autoavaliação e
anotações de cursos e palestras — tudo interligado.

## ⚡ Setup (primeira vez)

```bash
./setup
```

Instala as 7 skills (`wiki-ingest`, `wiki-prepare`, `wiki-ask`,
`wiki-assess`, `wiki-lint`, `wiki-crystallize`, `wiki-progress`)
no Hermes. Depois é só usar de qualquer diretório.

## 🎯 Como usar

### Livros (via EPUB)

```
1. Coloque o EPUB em raw/books/<livro>/sources/livro.epub
2. /prepare <livro> <cap>     → extrai capítulo, preenche TL;DR + Resumo
3. Complete o template         → insights, citações, dúvidas
4. /ingest <livro> <cap>       → discute e cria páginas na wiki
5. /assess <conceito>          → verifica seu entendimento
6. /progress                   → vê gaps e progresso de leitura
```

### Artigos, cursos, palestras

```
1. Coloque a fonte em raw/articles/, raw/courses/ ou raw/talks/
2. /ingest <caminho>           → discute e cria página direto
3. /assess <conceito>          → verifica entendimento
```

### No dia a dia

```
/crystallize                   → captura aprendizado de qualquer sessão
/ask "o que é conascência?"    → consulta a wiki com citações
/lint                          → verifica saúde da wiki
/progress                      → consulta gaps e progresso
```

| Skill | O que faz |
|---|---|
| `wiki-prepare` | Extrai capítulo de EPUB e preenche TL;DR + Resumo |
| `wiki-ingest` | Discute uma fonte e cria páginas na wiki |
| `wiki-assess` | Gera perguntas e avalia seu entendimento |
| `wiki-ask` | Responde consultas com citações das fontes |
| `wiki-crystallize` | Destila uma sessão em aprendizado consolidado |
| `wiki-lint` | Verifica frontmatter, wikilinks, órfãs, contradições |
| `wiki-progress` | Mostra gaps de competência + progresso de leitura |

## Estrutura

```
study-wiki/
├── ASSISTANT.md              # Manual de entrada
├── index.md                  # Catálogo de páginas
├── log.md                    # Registro cronológico
│
├── assistant/                # Engenharia do assistente
│   ├── strategies/           # 21 estratégias reutilizáveis
│   ├── adapters/hermes/      # 7 skills instaláveis
│   ├── conventions/          # Frontmatter, wikilinks, idioma, visual
│   ├── domain/               # Tipos de página, competências, taxonomia
│   ├── templates/            # Modelos para criar páginas
│   └── setup.sh              # Instalador das skills
│
├── wiki/                     # CONTEÚDO — páginas por tipo
│   ├── concepts/             # Técnicas, teorias, princípios
│   ├── comparisons/          # Análises lado a lado
│   ├── queries/              # Q&A permanente
│   ├── recipes/              # How-tos e soluções práticas
│   └── summaries/            # Sínteses multi-fonte
│
├── config/                   # Infra (attachments, templates Templater)
└── raw/                      # Fontes brutas IMUTÁVEIS
    ├── books/
    ├── articles/
    ├── courses/
    └── talks/
```

## Personalizando seus estudos

Cada pessoa define suas áreas de foco em [`assistant/domain/competencies.md`](assistant/domain/competencies.md).
Edite os slugs e descrições para refletir **sua** stack e objetivos.
As skills usam esse arquivo para classificar páginas e sugerir gaps de estudo.

**Exemplo (Isabela):** Java, Go, Kotlin, Spring Boot, Kafka, Redis, Kubernetes, com foco em fundamentos de engenharia de software + IA aplicada.

## Links

- [ASSISTANT.md](ASSISTANT.md) — manual completo da wiki
- [index.md](index.md) — catálogo de páginas
- [assistant/](assistant/) — engenharia interna
