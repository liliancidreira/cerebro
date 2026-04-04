# Plugin: Gerador de Conteúdo — Método Atenção Digital

Plugin de geração de conteúdo baseado no Método Atenção Digital de Elias Maman para a Mentoria Signature de Lilian Cidreira.

## Arquitetura

5 skills especializadas + 1 comando orquestrador:

```
gerador-conteudo-metodo-atencao/
├── skills/
│   ├── pesquisador-temas/      — Gera temas virais (universal × nicho)
│   ├── estrategista-atencao/   — Define gatilhos e formato por conteúdo
│   ├── roteirista-reels/       — Escreve roteiros com Roteiro Explosivo
│   ├── copywriter-legenda/     — Escreve legendas, posts e carrosseis
│   └── revisor-gatilhos/       — Revisa tudo antes de publicar
├── commands/
│   └── gerar-conteudo-semanal.md — Orquestra o fluxo completo
└── README.md
```

## Fluxo

```
/gerar-conteudo-semanal
    │
    ├── 1. pesquisador-temas     → gera 14+ temas virais
    ├── 2. estrategista-atencao  → define gatilhos e briefing
    ├── 3. roteirista-reels      → escreve roteiros de Reels
    │   copywriter-legenda       → escreve legendas, posts, carrosseis
    ├── 4. revisor-gatilhos      → revisa e aprova cada peça
    └── 5. entrega               → pack pronto para publicar
```

## Dependência

Requer o repositório `cerebro` (github.com/liliancidreira/cerebro) com a pasta `skill-knowledge/metodo-atencao/` contendo os 7 arquivos de base de conhecimento.

## Uso Individual

Cada skill pode ser usada independentemente:
- "Me dá ideias de temas virais" → pesquisador-temas
- "Define a estratégia de gatilhos para esse tema" → estrategista-atencao
- "Escreve o roteiro desse Reel" → roteirista-reels
- "Escreve a legenda/post/carrossel" → copywriter-legenda
- "Revisa esse conteúdo" → revisor-gatilhos
