# Registro no Cérebro — o que foi oferecido, quando e por quê

A Lilian precisa enxergar **o que cada lead recebeu, quando e por qual raciocínio**. O problema prático: não dá pra exigir que a funcionária volte e reporte o resultado — ela pode parar no meio. Por isso o registro **não depende** disso. Funciona em **dois tempos**.

## Princípio: registrar o que já se sabe, na hora que se sabe
Quem monta a oferta é a própria skill. No momento em que ela recomenda o produto (Momento 5 do `metodo-conversa.md`), ela **já tem** a porta de entrada, o perfil, o momento, a necessidade, o que foi oferecido e o **porquê** (a síntese). Esse é o conteúdo que a Lilian mais quer — e ele existe **antes** de saber o desfecho. Então a skill grava isso **automaticamente**, sem esperar a funcionária voltar.

## Tempo 1 — Registro automático no momento da oferta (não depende de ninguém voltar)
Assim que a skill entrega a recomendação/oferta, ela grava a entrada com:
- data/hora, lead, porta de entrada, perfil, momento + necessidade, **o que foi oferecido**, **por quê (a síntese)**
- `Resultado: EM ABERTO` + próximo passo + data de follow-up

Mesmo que a conversa pare aqui, a Lilian já tem registrado **o que foi oferecido e por quê** — exatamente o que ela pediu.

## Tempo 2 — Atualização do resultado (oportunística, quando aparecer)
O desfecho (fechou / agendou / pediu tempo / não avançou) é preenchido depois, sem cobrança rígida. Três gatilhos capturam isso naturalmente:
1. **A funcionária relata** ("o lead X fechou", "a Y pediu pra falar semana que vem") → a skill atualiza a entrada existente.
2. **No início do PRÓXIMO atendimento**, a skill pergunta rápido pelo anterior: *"Antes de começar: o [lead anterior] teve algum desfecho? (se não souber ainda, segue normal)"*. Captura o resultado sem virar burocracia.
3. **Pelas pendências** (abaixo) — a Lilian ou um painel veem o que ficou em aberto e cobram.

> Resultado em aberto **não é falha** — é o estado natural de um lead que ainda está em conversa. O que não pode é perder o "o quê/quando/por quê", e esse já está salvo no Tempo 1.

## Pendências (transforma o que falta em lista visível)
Como as entradas em aberto ficam marcadas `Resultado: EM ABERTO`, elas viram automaticamente a **lista de follow-up**: dá pra ver quem foi abordado, o que recebeu, e quem ainda não teve desfecho. Isso é o que o painel sugerido (abaixo) mostra de cara.

## Onde
Arquivo mensal em `/tmp/cerebro/vendas/registros/AAAA-MM.md` (um por mês; entradas mais novas no topo). A skill cria o arquivo do mês se não existir.

## Formato da entrada
```markdown
### [AAAA-MM-DD HH:MM] [Nome ou iniciais] — oferta: [MPP / P.O.D.E.R. / Sessão (Aceleração|MMV|Signature) / nenhuma]

**Operadora:** [nome]
**Porta de entrada:** [Carrinho MPP / Aluno MPP / Webinário P.O.D.E.R.]
**Perfil:** [cargo, senioridade, faixa salarial se souber]
**Momento + necessidade:** [resumo do SPIN — dor real, urgência, o que já tentou]
**O que foi oferecido:** [produto/ação]
**POR QUÊ (a síntese):** [raciocínio perfil + momento + necessidade — ex: "gestora R$14k, travada há 3 anos no platô de gerência, quer acompanhamento e consegue pagar → sessão (direção Aceleração)"]
**Objeções e tratamento:** [objeção literal → como foi desarmada]
**Resultado:** [EM ABERTO / fechou / agendou sessão / pediu tempo / não avançou]
**Próximo passo:** [ação + data de follow-up]

---
```

## Como a skill grava/atualiza (token read+write já carregado no Passo 0)
```bash
CONFIG="$(ls -1 /sessions/*/mnt/outputs/.cerebro-config 2>/dev/null | head -1)"
source "$CONFIG"
cd /tmp/cerebro
MES="vendas/registros/$(date +%Y-%m).md"
mkdir -p vendas/registros
[ -f "$MES" ] || printf '# Registros de atendimento — %s\n\n' "$(date +%Y-%m)" > "$MES"
# Tempo 1: insere a nova entrada no topo (Resultado: EM ABERTO)
# Tempo 2: localiza a entrada do lead e troca a linha "Resultado:" + "Próximo passo:"
git config user.email "vendas@futureminds.com.br"
git config user.name "vendedora-spin"
git add "$MES"
git commit -q -m "registro: [lead] — [oferta] / [resultado] ($(date +%Y-%m-%d))"
git push "https://${CEREBRO_USER}:${CEREBRO_TOKEN}@github.com/liliancidreira/cerebro.git" HEAD:main
```

## Fallback (se o push falhar / cérebro offline)
Não perde o registro: devolve a entrada formatada + o link `https://github.com/liliancidreira/cerebro/edit/main/vendas/registros/AAAA-MM.md` pra colar manualmente, e avisa que ficou pendente de subir.

## Aprendizado (opcional, mesmo motor)
Quando a operadora relata **o que funcionou** (frase/objeção que destravou), a skill registra em `/tmp/cerebro/vendas/aprendizados.md` pelo mesmo fluxo de commit+push. Alimenta o `banco-objecoes.md` ao longo do tempo. (Antes era no `cerebro-vendedora`, a aposentar — agora tudo no `cerebro`.)

## Visão para a Lilian (próximo passo sugerido)
Com os registros estruturados, dá pra montar um **painel** (artifact) que lê esses arquivos e mostra: ofertas por porta de entrada, taxa de fechamento, sessões agendadas, e **os EM ABERTO** (follow-ups pendentes). Construir quando a Lilian quiser.
