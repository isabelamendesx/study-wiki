# Nomenclatura

## Estrutura de Diretórios

```
study-wiki/
├── README.md                    # Visão geral da wiki
├── ASSISTANT.md                 # Manual de entrada
├── index.md                     # Catálogo de páginas por categoria
├── log.md                       # Registro cronológico (append-only)
│
├── assistant/                   # Engenharia interna do assistente
│   ├── commands/                # Comandos invocáveis
│   ├── strategies/              # Estratégias reutilizáveis
│   ├── domain/                  # Modelo de domínio
│   ├── conventions/            # Regras de formatação e estilo
│   └── templates/              # Templates markdown puro
│
├── config/                      # Infra da wiki
│   └── attachments/             # Imagens e assets (versionados)
│
├── wiki/                        # CONTEÚDO — páginas por tipo
│   ├── concepts/
│   ├── comparisons/
│   ├── queries/
│   ├── recipes/
│   └── summaries/
│
└── raw/                         # IMUTÁVEL — fontes brutas
    ├── books/
    ├── articles/
    ├── courses/
    ├── talks/
    └── recipes/
```

## Convenção de Nomenclatura para Attachments

`<pagina-destino>-<descricao>.png`

- **Prefixo:** nome do arquivo da página de conceito onde a imagem é usada (ex: `conascencia`, `caracteristicas-arquiteturais`, `arquitetura-software`)
- **Sufixo:** descrição curta do conteúdo da imagem (ex: `forca`, `criterios`, `dimensoes`)
- **Extensão:** `.png`

Exemplos:

- `conascencia-forca.png` — diagrama da força da conascência, usado em `wiki/concepts/conascencia.md`
- `caracteristicas-arquiteturais-criterios.png` — triângulo de critérios (Figura 4-2), usado em `wiki/concepts/caracteristicas-arquiteturais.md`
- `arquitetura-software-dimensoes.png` — as 4 dimensões da arquitetura (Figura 1-2), usado em `wiki/concepts/arquitetura-de-software.md`

Imagens de livros seguem o mesmo padrão — o prefixo é sempre o nome da página de conceito de destino, não o nome do livro ou capítulo.

## raw/ é imutável

A LLM lê as fontes brutas mas nunca as modifica. Elas são a verdade fundamental. Se uma fonte tiver informação errada, a LLM anota a correção nas páginas da wiki, não na fonte.
