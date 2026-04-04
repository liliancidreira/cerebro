---
description: Gera conteúdo semanal completo usando o Método Atenção Digital de Elias Maman — pesquisa temas, define estratégia, escreve roteiros e legendas, revisa tudo
---

# Comando /gerar-conteudo-semanal

Orquestra o fluxo completo de geração de conteúdo semanal para a Mentoria Signature, usando todas as 5 skills do Método Atenção Digital em sequência.

## REGRA DE FLUXO

Cada passo flui automaticamente para o próximo. Só pausar quando houver uma decisão real da Lilian (AskUserQuestion). Nunca emitir mensagens intermediárias como "Pronto para o próximo passo...", "Agora vamos..." ou "Configurações salvas!".

---

## Fluxo Completo (6 Passos)

### PASSO 0: Sincronizar o Cérebro

```bash
cd /tmp && rm -rf cerebro && git clone https://github.com/liliancidreira/cerebro.git cerebro 2>/dev/null && echo "CEREBRO OK" || echo "CEREBRO OFFLINE"
```

Se CEREBRO OK: ler todos os arquivos de referência:
- `/tmp/cerebro/banco-de-historias.md`
- `/tmp/cerebro/voz-e-aprendizados.md`
- `/tmp/cerebro/skill-knowledge/brand-knowledge.md`
- `/tmp/cerebro/skill-knowledge/metodo-atencao/*.md` (todos os 7 arquivos)

Se CEREBRO OFFLINE: informar e usar conhecimento interno da skill.

### PASSO 1: Entrevista Rápida

**Usar `AskUserQuestion`** com 3 perguntas:

1. **Foco da semana**: "Qual é o foco da semana? Tem algum tema, lançamento, evento ou dor específica que quer endereçar?" (campo aberto)

2. **Volume**: "Quantos conteúdos quer para essa semana?" com opções:
   - "Pack completo (7 peças: 3 Reels + 2 Carrosseis + 2 Posts)"
   - "Pack reduzido (4 peças: 2 Reels + 1 Carrossel + 1 Post)"
   - "Personalizado (me diz o que precisa)"

3. **Histórias novas**: "Tem alguma história nova de cliente, insight ou situação que aconteceu essa semana?" (campo aberto)

Se a Lilian tiver história nova: registrar no banco-de-historias.md e fazer push.

### PASSO 2: Pesquisar Temas (skill: pesquisador-temas)

Com base no foco da semana e no volume escolhido:

1. Ativar a skill `pesquisador-temas`
2. Gerar o dobro de temas necessários (ex: 14 temas para pack de 7)
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
3. Gerar o briefing para o roteirista/copywriter

**Não apresentar o briefing para a Lilian** — é documento interno entre as skills.

Validar distribuição:
- Pelo menos 70% topo de funil
- No máximo 30% meio de funil
- Zero fundo de funil no feed
- Variedade de gatilhos (não repetir a mesma combinação)
- Variedade de formatos

### PASSO 4: Gerar Conteúdo

Para cada tema com briefing pronto, ativar a skill correspondente ao formato:

- **Reels** → skill `roteirista-reels` (gera o roteiro completo)
- **Carrosseis e Posts de Texto** → skill `copywriter-legenda` (gera a estrutura/texto)
- **Legendas de Reels** → skill `copywriter-legenda` (gera a legenda que acompanha o roteiro)

Gerar todos os conteúdos de uma vez.

### PASSO 5: Revisar Tudo (skill: revisor-gatilhos)

Ativar a skill `revisor-gatilhos` para cada peça gerada.

- Se nota **A**: manter como está
- Se nota **B**: aplicar os ajustes sugeridos automaticamente
- Se nota **C**: reescrever a peça inteira e revisar novamente

Após a revisão, apresentar o pack completo para a Lilian:

```
## Pack Semanal — [Data]

### 1. [REEL] [Título]
**Gatilhos**: [lista] | **Funil**: [posição] | **Nota do revisor**: [A/B]

[Roteiro completo]

**Legenda:**
[Texto da legenda]

---

### 2. [CARROSSEL] [Título]
**Gatilhos**: [lista] | **Funil**: [posição] | **Nota do revisor**: [A/B]

[Estrutura slide por slide]

---

[... todos os conteúdos ...]
```

### PASSO 6: Aprovação e Entrega

Após apresentar o pack:

1. Perguntar: "Quer ajustar alguma peça? Me indica qual e o que mudar."
2. Se houver ajustes: aplicar e revisar novamente com o `revisor-gatilhos`
3. Quando aprovado: salvar o pack completo em arquivo:

```bash
# Salvar no outputs
ARQUIVO="/sessions/determined-sharp-fermi/mnt/outputs/conteudo-semanal-$(date +%Y-%m-%d).md"
```

4. Se a Lilian quiser roteiros de carrossel para o Canva: gerar no formato slide a slide (sem títulos, só texto narrativo)

5. Registrar conteúdos aprovados em `/tmp/cerebro/exemplos/conteudos-aprovados.md` e fazer push

---

## Regras do Orquestrador

- O fluxo é sequencial: Temas → Estratégia → Geração → Revisão → Aprovação
- A Lilian só é consultada no Passo 1 (entrevista), Passo 2 (escolha de temas) e Passo 6 (aprovação)
- Todos os passos intermediários rodam automaticamente
- Se algo falhar (cerebro offline, por exemplo), adaptar e seguir — não travar o fluxo
- Garantir variedade: nunca dois Reels com o mesmo gancho/gatilho, nunca dois carrosseis com o mesmo arquétipo de história
- Todo conteúdo gerado deve passar pelo revisor antes de ser apresentado
- O revisor é a última instância — se ele não aprova, o conteúdo é reescrito antes de chegar à Lilian
