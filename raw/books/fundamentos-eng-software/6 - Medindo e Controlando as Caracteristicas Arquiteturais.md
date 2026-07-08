# Cap 6: Medindo e Controlando as Características Arquiteturais

**Source:** [[sources/cap-06.source|Cap 6 — texto original (EN)]]

## TL;DR

Não basta identificar as características arquiteturais (cap 5) — é preciso medi-las com definições objetivas e governá-las com fitness functions automatizadas. O capítulo divide as métricas em três categorias: operacionais (performance, escalabilidade — com budgets estatísticos), estruturais (complexidade ciclomática, distância da sequência principal) e de processo (testabilidade, deployabilidade). Para governança, o conceito central são as *fitness functions*: qualquer mecanismo que forneça uma avaliação objetiva de integridade de uma característica arquitetural — de testes unitários com JDepend/ArchUnit até o Chaos Monkey da Netflix. A perspectiva correta: fitness functions são checklists automatizados, não mecanismos pesados de controle.

## Resumo

O capítulo 6 fecha o arco "características arquiteturais" (caps 4-6), ensinando **como medir e governar** as características identificadas.

**Por que medir?** Três problemas comuns nas organizações:
1. Características não são física — "agilidade" ou "deployabilidade" têm significados vagos
2. Definições variam até dentro da mesma empresa — desenvolvedores, arquitetos e operações discordam
3. Características são compostas — agilidade se decompõe em modularidade + deployabilidade + testabilidade

A solução é **definições objetivas** em toda a organização para criar uma linguagem ubíqua de arquitetura.

**Três categorias de medição:**

1. **Métricas operacionais** — performance, escalabilidade, elasticidade. Times maduros não usam números arbitrários, mas análise estatística (ex: alarmes disparam se métricas em tempo real saem dos modelos de predição). Performance budgets: first contentful paint, first CPU idle, K-weight budgets para páginas web.

2. **Métricas estruturais** — complexidade ciclomática (CC = E − N + 2P), que mede a complexidade do código via teoria dos grafos. Limiar recomendado < 5 (indústria diz < 10). TDD gera efeito colateral positivo de reduzir CC naturalmente. O caso extremo: uma função C com CC > 800 e 4000+ linhas.

3. **Métricas de processo** — testabilidade (code coverage), deployability (% de deploys bem-sucedidos, duração, bugs por deploy). Características de processo podem impactar decisões estruturais (ex: se deployability é prioritária, a arquitetura precisa de melhor modularidade).

**Governança com Fitness Functions:**

Fitness function = qualquer mecanismo que avalia objetivamente a integridade de uma característica arquitetural. Não é um framework novo — é uma nova perspectiva sobre ferramentas existentes (métricas, testes unitários, monitores, chaos engineering).

Exemplos concretos:
- **JDepend** — detecta dependências cíclicas entre pacotes (teste roda no CI, previne que desenvolvedores "trigger-happy" quebrem a modularidade com auto-imports)
- **Distância da sequência principal** — métrica de acoplamento verificada via fitness function com threshold
- **ArchUnit** (Java) / **NetArchTest** (.NET) — governam camadas arquiteturais: Controller → Service → Persistence, prevenindo erosão arquitetural
- **Netflix Simian Army** — Chaos Monkey (caos), Conformity Monkey (regras de governança), Security Monkey (falhas de segurança), Janitor Monkey (remove serviços órfãos)

**Perspectiva final:** fitness functions são como checklists de O Checklist Manifesto de Atul Gawande — não é que os profissionais sejam incompetentes ou esquecidos, mas em trabalhos altamente detalhados e repetitivos, detalhes escapam. Fitness functions codificam princípios arquiteturais importantes como verificações automatizadas no substrato da arquitetura.

## Insights

**A qualidade de uma arquitetura não depende só do desenho dela, mas também de como o time desenvolve o software.**
Algumas características da arquitetura \(como testabilidade, facilidade de implementação e agilidade\) podem ser medidas observando o processo de desenvolvimento.
Quando ele fala:
“a agilidade costuma aparecer como um recurso desejável”
Ele quer dizer que todo mundo quer desenvolver rápido.
Mas “agilidade” é algo muito abstrato. Então o arquiteto quebra esse conceito em coisas mais fáceis de medir, como:
- facilidade de testar;
- facilidade de implementar mudanças;
- facilidade de fazer deploy;
- facilidade de modificar módulos.

Ou seja:
`Agilidade`
`    ↓`
`Testabilidade`
`Implementabilidade`
`Modularidade`
`...`
Em vez de perguntar:
“Nossa arquitetura é ágil?”
é melhor perguntar:
- Quanto tempo leva para implementar uma funcionalidade?
- Quantos testes conseguimos escrever?
- Quanto esforço é necessário para modificar um módulo?

Essas perguntas geram números.

Implementabilidade.
Imagine que sua API tenha 100% de cobertura de testes.
Isso significa que ela é boa?
Não necessariamente.
Você pode escrever testes inúteis.
Por exemplo:
`Assert.True(true);`
Esse teste aumenta a cobertura, mas não verifica nada importante.
Então o autor diz:
cobertura é uma métrica objetiva, mas ela sozinha não garante qualidade.
Depois ele fala que podemos medir a facilidade de implementação.
Exemplos:
- porcentagem de implementações que deram certo de primeira;
- quantos bugs aparecem depois da implementação;
- quanto tempo demora para entregar uma funcionalidade;
- quantas vezes uma implementação precisa ser refeita.

Imagine duas arquiteturas.
**Arquitetura A**
Para adicionar um endpoint novo:

- altera 2 arquivos;
- demora 30 minutos;
- poucos bugs.

**Arquitetura B**
Para adicionar um endpoint:

- altera 15 arquivos;
- demora 3 dias;
- aparecem vários bugs.

Mesmo que as duas “funcionem”, a Arquitetura A tem melhor implementabilidade.
**Último parágrafo \(o mais importante\)**
Aqui está a principal mensagem.
Ele diz:
se o processo de desenvolvimento valoriza facilidade de implementação e facilidade de teste…
…então o arquiteto vai tomar decisões pensando nisso.
Por exemplo.
Imagine um sistema enorme.
Em vez de tudo ficar misturado:
`Sistema`
` ├── Tudo acessa tudo`
` ├── Dependências cruzadas`
` ├── Código acoplado`
o arquiteto cria módulos bem separados:
`Sistema`
`Usuários`
`Pedidos`
`Pagamento`
`Notificações`
Assim:

- fica mais fácil testar;
- fica mais fácil alterar;
- um módulo não quebra o outro.

Essa é uma decisão arquitetural motivada pelas métricas do processo.
**A frase final**
“Quase nada dentro do escopo de um projeto de software pode chegar no nível de uma característica da arquitetura se ele consegue atender aos nossos três critérios…”
O autor está retomando uma definição anterior do livro.
Uma característica arquitetural só merece esse nome quando ela é importante o suficiente para influenciar decisões de arquitetura.

Já algo como:
“o botão deve ser azul”
não é uma característica arquitetural, porque não muda a estrutura do sistema.
**Arquitetura não é medida apenas olhando para o código. Também podemos medir se ela é boa observando como o time consegue desenvolver: quão fácil é implementar mudanças, testar, corrigir erros e entregar funcionalidades. Essas métricas ajudam o arquiteto a tomar melhores decisões de design.**
## A aprofundar

<!-- Temas que merecem estudo mais profundo -->

## Citações marcantes
A engenharia do caos oferece uma nova perspectiva interessante na arquitetura não é uma questão de Siahu parará de funcionar mas quando antecipar essas interrupções e testes para evitá las tornam sistemas muito mais robustos.
<!-- Citações do capítulo que valem a pena destacar -->

## Figuras e diagramas

<!-- LLM: diagramas/figuras do capítulo a serem adicionados -->

## Conexões / Áreas de estudo

- [ ] product-acumen
- [ ] data-driven
- [ ] technical-communication
- [ ] problem-decomposition
- [ ] domain-knowledge
- [ ] technical-breadth
- [ ] technical-depth
- [ ] persistence
- [ ] code-quality
- [ ] efficiency
- [ ] operation
- [ ] security
- [ ] infrastructure
- [ ] performance
- [x] architecture
- [ ] ai-engineering

## Perguntas/Instruções para ingestão da LLM

- E quando se fala de uma base que tem a arquitetura bagunçada, e não ha tempo habil no dia a dia para refatorar toda uma arquitetura, como medir e melhorar as caracteristicas arquiteturais?
