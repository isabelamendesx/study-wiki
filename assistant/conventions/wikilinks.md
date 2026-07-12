# Wikilinks

## Estrutura

Todo wikilink entre páginas da wiki deve usar **pipe syntax** com nome de exibição descritivo:

```
[[arquivo-de-destino|Nome de Exibição Legível]]
```

O Obsidian resolve wikilinks pelo **nome do arquivo**, não pelo título ou aliases. Quando o texto do wikilink não corresponde ao nome do arquivo de destino, use **obrigatoriamente** pipe syntax: `[[nome-do-arquivo|Nome de Exibição]]`.

**Correto:**
```markdown
[[design-patterns-go|Design Patterns em Go]]
[[arquitetura-de-software|Arquitetura de Software]]
```

**Incorreto (NÃO resolve):**
```markdown
[[Design Patterns em Go]]          # Não existe arquivo "Design Patterns em Go.md"
[[Arquitetura]]                    # Arquivo é arquitetura-de-software.md
```

**Regra:** Todo wikilink deve usar `[[nome-do-arquivo|Nome de Exibição]]` onde `nome-do-arquivo` é o **nome exato do arquivo sem `.md`**. O nome de exibição pode ser qualquer coisa — é puramente cosmético.
