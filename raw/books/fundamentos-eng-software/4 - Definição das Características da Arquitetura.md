# Cap 4: Definição das Características da Arquitetura

**Source:** [[sources/cap-04.source|Cap 4 — texto original (EN)]]

## Resumo (3-5 linhas)

Características da arquitetura (ou "ilities") são os critérios de design que não fazem parte do domínio funcional, mas definem o sucesso do sistema. Elas se dividem em três categorias: operacionais (performance, disponibilidade, escalabilidade), estruturais (modularidade, manutenibilidade, extensibilidade) e transversais (segurança, legal, usabilidade). O trabalho do arquiteto não é maximizar todas — isso geraria uma solução genérica e inviável — mas escolher o menor conjunto possível e navegar os trade-offs entre elas. Os autores batem na tecla de que não existe "melhor arquitetura", e sim a "menos pior", e que a iteração é tão valiosa na arquitetura quanto no código.

![[../../../config/attachments/caracteristicas-arquiteturais-criterios.png]]

## Conceitos (explicados nas minhas palavras)

| Conceito | O que é | Exemplo do livro | Exemplo prático |
|---|---|---|---|
| Característica arquitetural | Critério de design não-funcional que influencia a estrutura do sistema e é crítico para o sucesso. Diferente de requisito funcional (o que o sistema faz), ela define como o sistema opera. | Performance, segurança, escalabilidade |  |
| Característica implícita vs. explícita | Implícitas raramente aparecem em documentos de requisito mas são essenciais (ex: disponibilidade). Explícitas estão escritas nos requisitos. | Empresa de high-frequency trading não precisa especificar "baixa latência" em todo sistema — é implícito no domínio. |  |
| Características operacionais | Capacidades que definem como o sistema se comporta em produção: performance, disponibilidade, escalabilidade, confiabilidade, recuperação. | Disponibilidade 24/7 exige estratégia de failover rápido. |  |
| Características estruturais | Dizem respeito à qualidade interna do código: modularidade, manutenibilidade, extensibilidade, portabilidade, reaproveitamento. | Um sistema que precisa rodar em Oracle e SAP DB exige portabilidade. |  |
| Características transversais | Não se encaixam em operacional nem estrutural, mas são restrições de design: segurança, autenticação, legal (LGPD, GDPR), acessibilidade, usabilidade. | GDPR obriga deletar dados de cliente após 3 meses — impacta arquivabilidade. |  |
| Trade-off arquitetural | Cada característica suportada adiciona complexidade ao design e frequentemente impacta outras. O papel do arquiteto é escolher o menor conjunto viável e balancear conflitos. | Melhorar segurança quase sempre degrada performance (mais criptografia, indireção). |  |
| Arquitetura "menos pior" | Em vez de buscar a arquitetura ideal, buscar a que tem o menor conjunto de trade-offs aceitáveis. Ser iterativo permite ajustar conforme se aprende. | Metáfora do helicóptero: cada controle afeta o outro, é um exercício de equilíbrio. |  |

## O que me pegou

Gostei da frase "Nunca mire na melhor arquitetura, mas na menos pior"

## Não entendi direito

Disponibilidade x Confiabilidade

## Conexões / Áreas de estudo
- [ ] product-acumen
- [ ] data-driven
- [ ] technical-communication
- [ ] problem-decomposition
- [ ] domain-knowledge
- [x] technical-breadth
- [ ] technical-depth
- [ ] persistence
- [ ] code-quality
- [ ] efficiency
- [ ] operation
- [x] security
- [ ] infrastructure
- [ ] performance
- [x] architecture
- [ ] ai-engineering

## Perguntas/Instruções para ingestão da LLM
- Qual a diferença prática entre disponibilidade e confiabilidade? O exemplo do UDP ajudou mas queria mais exemplos
- As características do ISO são um padrão que times realmente usam ou é mais referência teórica?
- Como decidir quais characteristics priorizar?
- Quero ter uma tabela com as caracteristicas transversais, operacionais e estruturais igual ao capitulo do livro
