# Wikilinks

## Wikilinks só para páginas que existem

**Nunca crie wikilinks para páginas que não existem.** Um link quebrado é pior do que nenhum link — ele engana o leitor e acumula dívida na wiki.

Se um conceito mencionado merece uma página própria mas ainda não tem, use o callout `[!note] Páginas futuras` no final da seção Conexões para sinalizar, sem criar o wikilink:

```markdown
> [!note] Páginas futuras
> **Trade-off arquitetural** — a 1ª Lei desenvolve esse conceito. Criar
> página quando houver mais fontes (ex: Cap 4 do Fundamentos).
```

Quando esse conceito ganhar uma página própria, a LLM deve voltar e trocar a nota por um wikilink real.

## Mínimo de 2 wikilinks por página (flexível)

Toda página deve mirar em pelo menos **dois wikilinks** para outras páginas existentes. Se a wiki ainda for pequena e só houver uma página para linkar, use a única disponível e adicione o callout `Páginas futuras` para as demais. O mínimo de 2 é uma meta, não um bloqueador.

## Resolução de Wikilinks — Pipe Syntax Obrigatória

O Obsidian resolve wikilinks pelo **nome do arquivo**, não pelo título ou aliases. Quando o texto do wikilink não corresponde ao nome do arquivo de destino, use **obrigatoriamente** pipe syntax: `[[nome-do-arquivo|Nome de Exibição]]`.

**Correto:**
```markdown
[[design-patterns-go|Design Patterns em Go]]
[[acompanhamento-competencias|Acompanhamento de Competências]]
```

**Incorreto (NÃO resolve):**
```markdown
[[Design Patterns em Go]]          # Não existe arquivo "Design Patterns em Go.md"
[[Acompanhamento]]                 # Arquivo é acompanhamento-competencias.md
```

**Regra:** Todo wikilink deve usar `[[nome-do-arquivo|Nome de Exibição]]` onde `nome-do-arquivo` é o **nome exato do arquivo sem `.md`**. O nome de exibição pode ser qualquer coisa — é puramente cosmético.
