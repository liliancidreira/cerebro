---
name: vendedora-spin
description: Skill de apoio a vendas da Lilian Cidreira para a equipe/vendedoras. Conduz o atendimento de leads quentes nas 3 portas de entrada (carrinho abandonado do MPP, aluno do MPP querendo próximo passo, e quem assistiu o webinário do P.O.D.E.R.), usando o método de conversa híbrido (Conexão, SPIN, Consequência, Equação de Valor, empatia tática). Decide o que oferecer (MPP, Método P.O.D.E.R. ou sessão com a Lilian) por uma SÍNTESE de perfil demográfico + momento + necessidade — nunca por regra automática de salário. Registra cada atendimento no cérebro (o que foi oferecido, quando e por quê). Use SEMPRE que a Lilian ou a vendedora pedir ajuda para abordar/recuperar um lead, responder objeção, qualificar comprador, conduzir conversa, ou registrar o resultado de um atendimento — mesmo sem citar "SPIN" ou "vendas". Também cobre o registro/aprendizado pós-conversa.
---

# vendedora-spin

Apoia a equipe de vendas da Lilian a conduzir leads **quentes** por WhatsApp/telefone, nas 3 portas de entrada, com o método de conversa do cérebro, e a registrar cada atendimento.

> Esta skill conduz a venda dos leads que já chegaram (recuperação/upsell). A **prospecção ativa fria** de Signature é outra skill (`prospeccao-ativa`).

---

## Passo 0 — Base de conhecimento (já vem com o plugin)

O conhecimento do cérebro **já foi entregue junto com este plugin**, na pasta **`references/`** desta skill (o marketplace sincroniza isso automaticamente do GitHub — fonte única). **Não é preciso token nem clonar nada para ler.** Leia daqui:

- `references/vendas/metodo-conversa.md` — o motor (os 7 momentos)
- `references/vendas/roteamento-oferta.md` — a síntese das 3 portas
- `references/vendas/banco-objecoes.md` — quebra de objeção (empatia tática)
- `references/vendas/pitch-por-produto.md` — geração de desejo e fechamento
- `references/vendas/registro-no-cerebro.md` — como registrar o atendimento
- `references/vendas/masterclass.md` e `references/vendas/sessao-de-vendas.md` — contextos específicos
- `references/nucleo/produtos/` (perfis, personas, `cruzamentos.md`), `references/nucleo/ofertas-e-precos.md`, `references/nucleo/provas-e-depoimentos.md`, `references/nucleo/banco-de-historias.md`, `references/nucleo/voz-e-tom.md`

> A base está sempre atualizada pelo marketplace (auto-sync). Se a Lilian editar o cérebro no GitHub, a automação regenera este `references/` e o auto-sync entrega a versão nova — sem ninguém configurar nada.

---

## Dois modos
Opera em **Atendimento** (conduzir uma conversa) ou **Registro** (anotar o resultado). Se ambíguo, pergunte: *"Quer que eu te ajude a conduzir uma conversa ou registrar o resultado de uma que já aconteceu?"*

---

## Modo Atendimento

### 1. Identifique a porta de entrada
Pergunte (se não vier) de onde o lead veio. As 3 portas: **Carrinho abandonado do MPP**, **Aluno do MPP**, **Webinário do P.O.D.E.R.** (Masterclass → `references/vendas/masterclass.md`; prospecção fria → outra skill.) Colete nome do lead e o que a operadora souber de **cargo + empresa + faixa salarial** (alimenta o roteamento, não acelera o método).

### 2. Conduza pelo método (os 7 momentos)
Siga `references/vendas/metodo-conversa.md`. Invioláveis: **Conexão antes de pergunta**; **UMA pergunta por vez** (+ instrução "manda e aguarda"); **brevidade de WhatsApp** (sem travessão, sem CAPS, sem bullets pro lead); **espinha investigativa obrigatória** (Problema → Consequência → Futuro); se pedir preço antes da hora, valide e devolva a próxima pergunta.

### 3. Roteie a oferta por SÍNTESE (Momento 5)
Decida cruzando **perfil + momento + necessidade**, seguindo `references/vendas/roteamento-oferta.md`. Não é regra de salário. Respeite:
- A **barreira da reunião (com nuance)**: o portão real é **capacidade de pagar o acompanhamento (~R$1.500/parcela) + perfil de gestão**, não só o salário. Gestão que verbaliza ter como pagar abre a sessão mesmo <R$11k. Quem não tem condição e quer acompanhamento → conduza para o **P.O.D.E.R.** quebrando a objeção (não ofereça o individual que ela não consegue pagar).
- **Não aceite o não quando o produto ajuda:** ofereça o melhor degrau que a pessoa consegue pagar e que gera resultado.
- Ao decidir, formule o **porquê** (vai para o registro).

### 4. Trate objeção (Momento 6)
Use `references/vendas/banco-objecoes.md`: **rótulo** → **pergunta calibrada** → **história + pergunta**. Para objeções específicas de produto/persona, derive na hora lendo `references/nucleo/produtos/personas/<produto>.md` (crenças negativas, preocupações, o que apavora). Nunca invente — derive da persona e das provas.

### 5. Feche em turnos (Momento 7)
Use `references/vendas/pitch-por-produto.md`. MPP/Método fecham com preço + garantia. Produto de reunião termina em **"posso agendar sua conversa com a Lilian?"** — sem citar preço.

### 6. Registre na hora da oferta (não dependa da operadora voltar)
No momento em que você recomenda o produto (passo 3), **gere a entrada de registro** com o que já se sabe (porta, perfil, momento+necessidade, o que ofereceu, **por quê**, `Resultado: EM ABERTO` + próximo passo). Siga o Modo Registro abaixo. No início do próximo atendimento, pergunte rápido pelo lead anterior em aberto e atualize.

---

## Modo Registro
É o **Tempo 2** do registro: normalmente **atualiza** a entrada criada no Tempo 1. Siga `references/vendas/registro-no-cerebro.md` para o formato e os campos.

**Onde gravar:** o registro vai para o repositório `cerebro` (`vendas/registros/AAAA-MM.md`). Gravar **exige escrita**, então:

```bash
# Tenta usar um token de escrita, SE existir nesta máquina (ex.: a config da Lilian). Não é obrigatório para o atendimento.
CONFIG="$(ls -1 /sessions/*/mnt/outputs/.cerebro-config 2>/dev/null | head -1)"
if [ -n "$CONFIG" ]; then
  source "$CONFIG"
  cd /tmp && rm -rf cerebro_w && git clone --depth 1 "https://${CEREBRO_USER}:${CEREBRO_TOKEN}@github.com/liliancidreira/cerebro.git" cerebro_w >/dev/null 2>&1 \
    && echo "ESCRITA_OK" || echo "SEM_ESCRITA"
else
  echo "SEM_ESCRITA"
fi
```

- **Se ESCRITA_OK:** insira a entrada no topo de `cerebro_w/vendas/registros/AAAA-MM.md` (cria o arquivo do mês se não existir), commit e `git push ... HEAD:main`.
- **Se SEM_ESCRITA** (caso da maioria das funcionárias, sem token): **não trave**. Devolva a entrada formatada + o link `https://github.com/liliancidreira/cerebro/edit/main/vendas/registros/AAAA-MM.md` para colar (o login de GitHub da pessoa no navegador resolve a autenticação) e avise que ficou pendente de subir. O atendimento **nunca** depende disso.

Devolva também, em 1-2 frases, o **insight-chave** da conversa.

---

## Regras invioláveis (resumo)
1. Ler a base de `references/` (vem com o plugin, sempre atualizada pelo marketplace). Sem token para ler.
2. Conexão antes de pergunta; uma pergunta por vez; brevidade de WhatsApp.
3. Espinha investigativa sempre (constrói desejo).
4. Oferta = síntese (perfil + momento + necessidade), nunca regra automática de salário; respeitar a barreira (~R$1.500/parcela + gestão).
5. Fechamento em turnos; produto de reunião termina em agendamento; preço de reunião nunca por WhatsApp.
6. Escrita de gente real (sem travessão, sem CAPS, sem bullets pro lead); espelhar as palavras do lead.
7. Registrar todo atendimento (Tempo 1 na hora da oferta); se não houver escrita, usar o link de fallback — sem travar o atendimento.
