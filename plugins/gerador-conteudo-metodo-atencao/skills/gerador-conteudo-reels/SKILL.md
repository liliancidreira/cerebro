---
name: gerador-conteudo-reels
description: Gera conteúdo de Reels usando o Método Atenção Digital de Elias Maman — pesquisa temas, define estratégia, escreve roteiros, revisa estrutura e gatilhos. Use sempre que a Lilian pedir para gerar Reels, criar roteiros de vídeo curto, ou qualquer variação de "gera os Reels", "roteiros da semana", "cria os vídeos".
---

# Comando /gerador-conteudo-reels

Orquestra o fluxo completo de geração de Reels para a Mentoria Signature, usando todas as skills do Método Atenção Digital em sequência.

## REGRA DE FLUXO

Cada passo flui automaticamente para o próximo. Só pausar quando houver uma decisão real da Lilian (AskUserQuestion). Nunca emitir mensagens intermediárias como "Pronto para o próximo passo...", "Agora vamos..." ou "Configurações salvas!".

---

## Fluxo Completo (6 Passos)

### PASSO 0: Sincronizar o Cérebro

```bash
cd /tmp && rm -rf cerebro && git clone https://github.com/liliancidreira/cerebro.git cerebro 2>/dev/null && echo "CEREBRO OK" || echo "CEREBRO OFFLINE"
```

Se CEREBRO OK: ler todos os arquivos de referência:
- `/tmp/cerebro/nucleo/banco-de-historias.md`
- `/tmp/cerebro/nucleo/voz-e-tom.md`
- `/tmp/cerebro/nucleo/produtos/ (perfis, ICP, personas, QFD, big-ideia, diagnóstico + cruzamentos.md), /tmp/cerebro/nucleo/voz-e-tom.md, /tmp/cerebro/nucleo/ofertas-e-precos.md, /tmp/cerebro/nucleo/provas-e-depoimentos.md, /tmp/cerebro/nucleo/fatos.md`
- `/tmp/cerebro/skill-knowledge/produtos/signature/` (produto.md, icp.md, copy-angles.md)
- `/tmp/cerebro/skill-knowledge/metodo-atencao/*.md` (todos os 7 arquivos)

Se CEREBRO OFFLINE: informar e usar conhecimento interno da skill.

### PASSO 1: Entrevista Rápida

**Usar `AskUserQuestion`** com 3 perguntas:

1. **Foco da semana**: "Qual é o foco da semana? Tem algum tema, lançamento, evento ou dor específica que quer endereçar?" (campo aberto)
2. **Volume**: "Quantos Reels quer para essa semana?" com opções:
   - "Pack completo (5 Reels)"
   - "Pack reduzido (3 Reels)"
   - "Personalizado (me diz quantos)"
3. **Histórias novas**: "Tem alguma história nova de cliente, insight ou situação que aconteceu essa semana?" (campo aberto)

Se a Lilian tiver história nova: registrar no banco-de-historias.md e fazer push.

### PASSO 2: Pesquisar Temas (skill: pesquisador-temas)

Com base no foco da semana e no volume escolhido:

1. Ativar a skill `pesquisador-temas`
2. Gerar o dobro de temas necessários (ex: 10 temas para pack de 5)
3. Apresentar os temas com formato resumido:

```
Gerei [N] temas. Aqui estão os favoritos:

1. [Título] — [Assunto Universal] × [Dor do Avatar] → [Gancho 1 linha]
2. [Título] — [Assunto Universal] × [Dor do Avatar] → [Gancho 1 linha]
...
```

4. Pedir para a Lilian escolher ou ajustar: "Escolhe os [N] que mais te chamaram atenção, ou me diz se quer trocar algum."

### PASSO 3: Definir Estratégia (skill: estrategista-atencao)

Para cada tema aprovado:

1. Ativar a skill `estrategista-atencao`
2. Definir os gatilhos, formato e posição no funil
3. Gerar o briefing para o roteirista

**Não apresentar o briefing para a Lilian** — é documento interno entre as skills.

Validar distribuição:
- Pelo menos 70% topo de funil
- No máximo 30% meio de funil
- Variedade de gatilhos (não repetir a mesma combinação)

### PASSO 4: Gerar Roteiros (skill: roteirista-reels)

Para cada tema com briefing pronto, ativar a skill `roteirista-reels` que gera o roteiro completo do Reel.

Gerar todos os roteiros de uma vez.

### PASSO 4.5: Revisão Estrutural dos Reels (skill: revisor-estrutura-reels)

Para cada **roteiro de Reels** gerado no Passo 4, ativar a skill `revisor-estrutura-reels` que verifica:

- DNA do Roteiro (7 elementos obrigatórios)
- Blocos do Arquétipo correto (8/6/4 conforme Revelador/Provocador/Professor)
- Conformidade (template, duração, indicações de gravação, checklist)

- Se nota **A**: roteiro aprovado, seguir para revisão criativa (Passo 5)
- Se nota **B**: aplicar correções pontuais e seguir para Passo 5
- Se nota **C**: reescrever o roteiro inteiro respeitando a estrutura, e revisar novamente neste passo

### PASSO 5: Revisão Criativa (skill: revisor-gatilhos)

Ativar a skill `revisor-gatilhos` para cada roteiro já validado estruturalmente.

- Se nota **A**: manter como está
- Se nota **B**: aplicar os ajustes sugeridos automaticamente
- Se nota **C**: reescrever o roteiro inteiro e revisar novamente

Após a revisão, apresentar o pack para a Lilian no **formato limpo de entrega** (ver abaixo).

### PASSO 6: Aprovação e Entrega

Após a revisão criativa, apresentar cada roteiro no **formato limpo** — sem cabeçalhos técnicos, sem metadata (gatilhos, funil, notas do revisor). Entregar o texto corrido do roteiro, exatamente como a Lilian vai gravar, seguido da legenda.

**Formato obrigatório de entrega de cada Reel:**

```
---
REEL [N] — [Título curto]
---

[Texto completo do roteiro — corrido, sem marcações técnicas,
exatamente como será falado na gravação. Incluir quebras de
parágrafo naturais entre os blocos narrativos. O gancho vem
primeiro, depois o desenvolvimento, depois o CTA.]

LEGENDA:
[Texto da legenda — sem emojis, sem hashtags]
```

**O que NÃO colocar na entrega:**
- Nenhum cabeçalho de metadata (Gatilhos, Funil, Posição, Arquétipo, Nota do revisor)
- Nenhuma indicação técnica de gravação (corte aqui, zoom, B-roll)
- Nenhuma marcação de estrutura interna (Bloco 1, Bloco 2, etc.)
- Nenhum comentário entre colchetes dentro do texto do roteiro

**O que a Lilian precisa receber:**
- O texto limpo, pronto para ler e gravar
- A legenda pronta para colar na publicação
- Separação clara entre um Reel e outro

Após apresentar todos os roteiros:

1. Perguntar: "Quer ajustar algum roteiro? Me indica qual e o que mudar."
2. Se houver ajustes: aplicar e revisar novamente com o `revisor-gatilhos`
3. Quando aprovado: salvar o pack completo em arquivo no formato limpo:

```bash
# Salvar no outputs
ARQUIVO="/sessions/determined-sharp-fermi/mnt/outputs/reels-$(date +%Y-%m-%d).md"
```

---

## Regras do Gerador de Reels

- O fluxo é sequencial: Temas → Estratégia → Roteiros → Revisão Estrutural → Revisão Criativa → Aprovação
- A Lilian só é consultada no Passo 1 (entrevista), Passo 2 (escolha de temas) e Passo 6 (aprovação)
- Todos os passos intermediários rodam automaticamente
- Se algo falhar (cerebro offline, por exemplo), adaptar e seguir — não travar o fluxo
- Garantir variedade: nunca dois Reels com o mesmo gancho/gatilho
- Todo roteiro gerado deve passar pelos dois revisores antes de ser apresentado
- O revisor é a última instância — se ele não aprova, o roteiro é reescrito antes de chegar à Lilian