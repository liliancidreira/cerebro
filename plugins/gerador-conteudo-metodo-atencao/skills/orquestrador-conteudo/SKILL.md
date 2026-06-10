---
name: orquestrador-conteudo
description: Orquestra a geração de um PACK de conteúdos (vários formatos de uma vez) para um produto da Lilian. Use APENAS para pedidos de pacote: "gera os conteúdos da semana/quinzena", "monta o pack", "monta o calendário", "não sei o que postar". Para UMA peça específica, use a skill de formato (conteudo-linkedin, conteudo-reel, conteudo-legenda, criador-carrossel) — não esta. Segue o intake obrigatório (produto → objetivo → categoria + checklist) e chama as skills de formato.
---

# Comando /orquestrador-conteudo
> **Intake obrigatório:** este orquestrador segue `references/conteudo/intake-conteudo.md` — define produto e objetivo do pack, e CADA peça gerada passa pelo checklist pré-escrita (via a skill de formato). Nunca pular o checklist.


Orquestra a geração do pack completo de conteúdos para qualquer produto da Lilian Cidreira. Coordena as skills de geração por formato (Reels, Carrossel, Texto) e garante que tudo siga o Método Atenção Digital de Elias Maman.

## PRINCÍPIO ESTRATÉGICO

**Todo conteúdo tem um único objetivo final: despertar no ICP o desejo de entrar em contato com a Lilian para conhecer seus serviços.**

Isso não significa que todo post é uma venda direta. Significa que cada peça é construída para que o ICP, ao terminar de ler ou assistir, sinta: "eu preciso conhecer o trabalho dela."

Para isso, cada peça deve ter dois elementos inegociáveis:

**1. Storytelling que gera desejo.**
O conteúdo precisa criar identificação com a dor do ICP, mostrar a transformação possível e deixar claro que a Lilian é quem sabe o caminho.

**2. Traços da história e autoridade da Lilian.**
Toda peça carrega — de forma orgânica, nunca forçada — elementos da trajetória dela: os anos de experiência, os resultados dos alunos, os padrões que ela observa no mercado.

**A regra de ouro:** se ao final da peça o ICP não sente vontade de descobrir mais sobre o que a Lilian oferece, a peça ainda não está pronta.

---

## Fluxo do Orquestrador

### Passo 0 — Base do cérebro (já vem com o plugin, em `references/`)


Leia a base de conhecimento embutida (pasta `references/`, sincronizada do GitHub pelo marketplace):
- \`references/nucleo/banco-de-historias.md\`
- \`references/nucleo/voz-e-tom.md\`
- \`references/nucleo/produtos/ (perfis, ICP, personas, QFD, big-ideia, diagnóstico + cruzamentos.md), references/nucleo/voz-e-tom.md, references/nucleo/ofertas-e-precos.md, references/nucleo/provas-e-depoimentos.md, references/nucleo/fatos.md\` — para saber quais produtos existem
- \`references/skill-knowledge/metodo-atencao/*.md\` (todos os 7 arquivos)


### PASSO 1: Identificar Produto

**Usar \`AskUserQuestion\`**:

1. **Produto**: "Para qual produto quer gerar conteúdo?" com opções baseadas nos produtos em \`references/nucleo/produtos/\`:
   - "Mentoria Signature"
   - (futuros produtos aparecerão aqui conforme forem adicionados)

Após escolher o produto, ler os arquivos da pasta correspondente:
- \`references/nucleo/produtos/[produto]/produto.md\`
- \`references/nucleo/produtos/[produto]/icp.md\`
- \`references/nucleo/produtos/[produto]/copy-angles.md\`

### PASSO 2: Entrevista e Volume

**Usar \`AskUserQuestion\`** com 3 perguntas:

1. **Foco da quinzena**: "Qual é o foco dessa quinzena? Tem algum tema, lançamento, evento ou dor específica que quer endereçar?" (campo aberto)
2. **Volume e formato**: "Qual o pack que quer gerar?" com opções:
   - "Pack completo (5 Reels + 5 Carrosseis + 5 Posts de Texto)"
   - "Pack reduzido (3 Reels + 2 Carrosseis + 2 Posts)"
   - "Só Reels (me diz quantos)"
   - "Só Carrosseis (me diz quantos)"
   - "Personalizado (me diz o que precisa)"
3. **Histórias novas**: "Tem alguma história nova de cliente, insight ou situação que aconteceu recentemente?" (campo aberto)

Se a Lilian tiver história nova: registrar no banco-de-historias.md e fazer push.

### PASSO 3: Distribuir e Gerar por Formato

Com base no volume escolhido, distribuir a geração:

**Para Reels:**
- Ativar a skill \`conteudo-reel\` com o número de Reels solicitado
- Essa skill cuida de todo o pipeline: temas → estratégia → roteiros → revisão estrutural → revisão criativa

**Para Carrosseis:**
- (Futuro) Ativar a skill \`gerador-conteudo-carrossel\`
- Enquanto não existir, usar a skill \`conteudo-legenda\` para gerar as estruturas slide a slide

**Para Posts de Texto:**
- Ativar a skill \`conteudo-legenda\` para gerar os textos para LinkedIn e Instagram

### PASSO 4: Consolidar e Apresentar

Após todos os formatos serem gerados e revisados, consolidar em um pack único:

\`\`\`
## Pack de Conteúdo — [Produto] — [Data]

### REELS
1. [REEL] [Título] — Gatilhos: [lista] | Nota: [A/B]
2. [REEL] [Título] — Gatilhos: [lista] | Nota: [A/B]
...

### CARROSSEIS
1. [CARROSSEL] [Título] — Gatilhos: [lista] | Nota: [A/B]
2. [CARROSSEL] [Título] — Gatilhos: [lista] | Nota: [A/B]
...

### POSTS DE TEXTO
1. [POST] [Título] — Gatilhos: [lista] | Nota: [A/B]
2. [POST] [Título] — Gatilhos: [lista] | Nota: [A/B]
...
\`\`\`

### PASSO 5: Aprovação e Entrega

1. Perguntar: "Quer ajustar alguma peça? Me indica qual e o que mudar."
2. Se houver ajustes: aplicar e revisar novamente
3. Quando aprovado: salvar o pack completo em arquivo:

\`\`\`bash
ARQUIVO="/sessions/determined-sharp-fermi/mnt/outputs/conteudo-quinzenal-$(date +%Y-%m-%d).md"
\`\`\`

4. Se a Lilian quiser roteiros de carrossel para o Canva: gerar no formato slide a slide (sem títulos, só texto narrativo)

---

## Regras do Orquestrador

- Sempre perguntar qual produto ANTES de gerar qualquer conteúdo
- Carregar os dados do produto correto (ICP, ângulos, copy) da pasta correspondente
- Delegar a geração para as skills especializadas por formato
- Garantir distribuição temática: pelo menos 5 dos 7 temas cobertos no pack completo
- Garantir distribuição de funil: 70% topo, 30% meio, zero fundo no feed
- Garantir variedade: nunca repetir combinação de gatilho + arquétipo
- Todo conteúdo deve ser revisado antes de ser apresentado à Lilian
- A Lilian só é consultada nos Passos 1, 2 e 5
- Se algo falhar, adaptar e seguir — não travar o fluxo

## Checklist de Voz (aplicar a todas as peças)

- [ ] Começa com o problema concreto (não com motivação)
- [ ] Usa "eu" e "você" — nunca "a gente" ou "vocês"
- [ ] Tem pelo menos uma frase de autoridade da Lilian
- [ ] Não contém frases proibidas (ver nucleo/voz-e-tom.md)
- [ ] Tem CTA claro no final
- [ ] Concordância de gênero feminino quando Lilian fala de si
- [ ] Zero emojis
- [ ] Zero hashtags
