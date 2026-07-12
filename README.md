# Wiki de Estudos

Wiki pessoal de estudos de engenharia de software, assistida por LLM.
Conceitos técnicos, comparações, resumos de livros, autoavaliação e
anotações de cursos e palestras — tudo interligado.

## ⚡ Setup (primeira vez)

```bash
./setup
```

Cria symlinks das 9 skills (`wiki-ingest`, `wiki-prepare`, `wiki-ask`,
`wiki-assess`, `wiki-lint`, `wiki-crystallize`, `wiki-progress`,
`wiki-roadmap`, `wiki-review`) no Hermes e Claude Code.

Depois do setup, configure seu plano de estudos:

```bash
/wiki-roadmap
```

A LLM vai te guiar: perfil, stacks, objetivo em 6 meses → e gera
um roadmap em `assistant/domain/competencies.md` com áreas de foco
e tópicos fundamentados em dados reais (roadmap.sh).

Pronto. Agora é só usar de qualquer diretório: `/wiki-ingest`, `/wiki-ask`, `/wiki-assess`, `/wiki-progress`.

## 🎯 Como usar

### Livros (via EPUB)

```
1. Coloque o EPUB em raw/books/<livro>/sources/livro.epub
2. /wiki-prepare <livro> <cap>  → extrai capítulo, preenche TL;DR + Resumo
3. Complete o template           → insights, citações, dúvidas
4. /wiki-ingest <livro> <cap>    → discute e cria páginas na wiki
5. /wiki-assess <conceito>       → verifica seu entendimento
6. /wiki-progress                → vê gaps e progresso de leitura
```

### Artigos, cursos, palestras

```
1. Coloque a fonte em raw/articles/, raw/courses/ ou raw/talks/
2. /wiki-ingest <caminho>        → discute e cria página direto
3. /wiki-assess <conceito>       → verifica entendimento
```

### No dia a dia

```
/wiki-crystallize                → captura aprendizado de qualquer sessão
/wiki-ask "o que é conascência?" → consulta a wiki com citações
/wiki-lint                       → verifica saúde da wiki
/wiki-progress                   → consulta gaps e progresso
/wiki-roadmap                    → configura ou revisa seu plano de estudos
/wiki-review                     → resumo da semana (ou /wiki-review month)
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
| `wiki-roadmap` | Configura o roadmap: perfil, áreas de foco e tópicos de estudo |
| `wiki-review` | Resumo de estudos: o que estudou, o que revisar, progresso |

## Estrutura

```
study-wiki/
├── ASSISTANT.md              # Manual de entrada
├── index.md                  # Catálogo de páginas
├── log.md                    # Registro cronológico
│
├── assistant/                # Engenharia do assistente
│   ├── strategies/           # 21 estratégias reutilizáveis
│   ├── adapters/hermes/      # 9 skills instaláveis
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

Rode `/wiki-roadmap` para definir seu perfil e áreas de foco.
O comando guia você por 3 etapas:

1. **Perfil e fontes** — nome, cargo, stacks (hard + soft skills),
   objetivo em 6 meses, e opcionalmente PDI da empresa.
2. **Curadoria de prioridades** — a LLM busca roadmaps disponíveis
   no [roadmap.sh](https://roadmap.sh), cruza com suas stacks e interesses,
   e sugere 3-4 áreas de foco com justificativa explícita baseada em gaps.
3. **Mapeamento de tópicos** — cada área vira uma lista de tópicos
   objetivos (do Catálogo em `competencies.md`) com ordem de estudo
   baseada em dependências.

Depois de configurado, rode `/wiki-roadmap` de novo a qualquer momento para
adicionar/remover áreas, ajustar prioridades ou trocar roadmaps.

O resultado fica em [`assistant/domain/competencies.md`](assistant/domain/competencies.md) —
um arquivo vivo que alimenta `/wiki-progress` e `/wiki-assess`.

Você também pode editar o arquivo manualmente — a LLM respeita.

## Links

- [ASSISTANT.md](ASSISTANT.md) — manual completo da wiki
- [index.md](index.md) — catálogo de páginas
- [assistant/](assistant/) — engenharia interna
