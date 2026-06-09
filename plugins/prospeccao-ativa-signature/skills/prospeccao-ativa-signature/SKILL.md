---
name: prospeccao-ativa-signature
description: >-
  Gera abordagens de prospecção ativa fria para a Mentoria Signature de Lilian Cidreira, usando o
  "método do espelho" (a pessoa enxerga o valor da própria experiência antes de qualquer oferta).
  Cobre LinkedIn (executivos e profissionais experientes) e Instagram (donos de negócio com autoridade:
  empresário, médico, dono de clínica, especialista). Use SEMPRE que a Lilian ou o time pedir para
  abordar/prospectar empresários e executivos, criar mensagem de abordagem, mensagem de conexão,
  primeira DM, follow-up de prospecção, ou conduzir a resposta de um contato frio até marcar reunião.
  Gatilhos: "cria uma abordagem", "mensagem pra prospectar", "como abordo esse [empresário/médico/executivo]",
  "primeira mensagem de LinkedIn", "DM de Instagram pra dono de clínica", "o lead respondeu, e agora",
  "como levo pra reunião", "follow-up de quem não respondeu". As mensagens saem do login da Lilian,
  em primeira pessoa. O objetivo nunca é vender na mensagem, é abrir conversa e marcar a reunião.
---

# Prospecção Ativa — Mentoria Signature

Gera abordagens frias de prospecção da Signature e conduz a conversa até o agendamento da reunião com a Lilian. Não vende por mensagem: a venda acontece na reunião (a `vendedora-spin` cobre o SPIN/sessão). O trabalho da prospecção é só um: abrir conversa e sair da DM com um "sim" e um telefone.

---

## Passo 0 — Sincronizar o cérebro (OBRIGATÓRIO, antes de tudo)

```bash
CONFIG="$(ls -1 /sessions/*/mnt/outputs/.cerebro-config 2>/dev/null | head -1)"
CLONE_URL=""
if [ -n "$CONFIG" ]; then
  source "$CONFIG"
  CLONE_URL="https://${CEREBRO_USER}:${CEREBRO_TOKEN}@github.com/liliancidreira/cerebro.git"
fi
if [ -n "$CLONE_URL" ] && (cd /tmp && rm -rf cerebro && git clone --depth 1 "$CLONE_URL" cerebro >/dev/null 2>&1); then
  echo "CEREBRO_OK"
else
  echo "CEREBRO_OFFLINE"
fi
```

- **Se CEREBRO_OK:** leia (nunca de cópia local):
  - `/tmp/cerebro/vendas/prospeccao/motor.md` — o método genérico (princípios, 4 movimentos, cadência, condução, handoff)
  - `/tmp/cerebro/vendas/prospeccao/angulo-signature.md` — o Método do Espelho, canais e modelos prontos
  - `/tmp/cerebro/nucleo/produtos/personas/signature.md` e `/tmp/cerebro/nucleo/produtos/cruzamentos.md` — ICP/persona
  - `/tmp/cerebro/nucleo/voz-e-tom.md` — voz e proibições
  - `/tmp/cerebro/vendas/sessao-de-vendas.md` — o que acontece na reunião (handoff)
  - `/tmp/cerebro/vendas/registro-no-cerebro.md` — como registrar a abordagem
- **Se CEREBRO_OFFLINE:** PARE e avise: *"Não consegui sincronizar o cérebro do GitHub. Quer que eu (a) use a última versão local, sabendo que pode estar desatualizada, ou (b) você renova o token primeiro?"* Não gere abordagem final sem esse aviso.

---

## Regras invioláveis
1. **Quem fala é a Lilian, em 1ª pessoa** (login dela). Nunca "sou da equipe". (Remetente é parâmetro — ver `motor.md`; hoje, Signature = Lilian.)
2. **A primeira mensagem não vende e não fala de reunião.** Abre com o espelho e termina numa pergunta.
3. **Uma pergunta por mensagem.**
4. **Personalização real obrigatória** (sinal verdadeiro do perfil).
5. **Nunca fale preço por mensagem.**
6. **Sem criticar o caminho atual** — proposta sempre aditiva.

## Fluxo
1. **Canal e perfil** — LinkedIn (executivos/experientes) ou Instagram (dono de negócio com autoridade). Confirme o ICP em `angulo-signature.md` + `/nucleo`.
2. **Sinal e tempo** — ache um sinal real; calibre a variável de tempo do espelho.
3. **Escreva** nos 4 movimentos (sinal → espelho → virada → pergunta de baixa pressão), usando os modelos de `angulo-signature.md` e as regras de escrita de `motor.md`.
4. **Follow-up** — no máximo 2 toques, agregando algo novo. Nunca "viu minha mensagem?".
5. **Conduza a resposta** até o sim para a reunião + WhatsApp (variantes em `angulo-signature.md`).
6. **Registre** a abordagem no cérebro (ver `registro-no-cerebro.md`): nome, canal, sinal, tempo, data, toque em que respondeu, telefone.
7. **Handoff** — reunião marcada → a Lilian apresenta a Signature + SPIN (a `vendedora-spin` cobre a reunião). Confirme a reunião um dia antes.

> O motor (`motor.md`) é genérico. Quando a prospecção for ampliada para seguidores/outros produtos, entra um novo arquivo de ângulo e o handoff passa a ser para a `vendedora-spin` — sem reescrever o método.
