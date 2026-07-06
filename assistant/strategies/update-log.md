# update-log

## Objetivo
Registrar eventos significativos da wiki em `log.md` (formato append-only).

## Quando usar
- `/ingest` — passo 9
- `/lint` — após executar lint
- `/progress` — após atualizar progresso

## Entrada
- Tipo de evento: `ingestão`, `lint`, `progresso`, `infra`, `crystallize`
- Descrição do que mudou
- Data ISO atual

## Passos

1. **Ler `log.md`** para saber o formato das entradas existentes.
2. **Criar entrada** no formato:
   ```markdown
   ## [YYYY-MM-DD] <ação> | <descrição>
   
   <detalhes em parágrafo>
   ```
3. **Adicionar ao final** do arquivo (append).
4. **Incluir detalhes relevantes**: caminhos de fontes, páginas criadas, alterações significativas.

## Convênção de ações
| Ação | Quando usar |
|---|---|
| `ingestão` | Nova fonte ingerida |
| `lint` | Verificação de saúde executada |
| `progresso` | Progresso de leitura atualizado |
| `infra` | Mudança estrutural na wiki |
| `crystallize` | Sessão destilada em aprendizado |

## Saída
- `log.md` com nova entrada no final

## Estratégias relacionadas
- Qualquer comando que produza mudanças significativas
