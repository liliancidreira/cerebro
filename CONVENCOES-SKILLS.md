Convenção: Cérebro como Fonte Única de Verdade (regra para todas as skills)
Objetivo: garantir que todo conteúdo gerado (e toda venda conduzida) use sempre a versão mais recente e correta do conhecimento da Lilian. O episódio da data errada (demissão "2016" em vez de 2015) aconteceu porque havia duas fontes — o cérebro no GitHub e cópias embutidas no plugin — que saíram de sincronia. Esta convenção elimina isso.
A estrutura do cérebro (um repo só)
O repositório github.com/liliancidreira/cerebro é o único cérebro, organizado em três partes:

/nucleo — conhecimento transversal (serve para tudo): perfis dos produtos, personas, QFD, Big Ideia, diagnóstico, banco-de-historias.md, voz-e-tom.md, fatos.md, provas-e-depoimentos.md, ofertas-e-precos.md, cruzamentos.
/conteudo — específico de criação de conteúdo: Método Atenção (gatilhos, arquétipos, DNA, funil — hoje em skill-knowledge/metodo-atencao/), modelos de carrossel, referências (templates, storytelling, design, LinkedIn).
/vendas — específico de condução de venda: origem do lead, matriz desejo × R$11k, pitch de conversão, Masterclass, "como a sessão vende", SPIN, objeções, prospecção.
A regra (3 princípios invioláveis)
Fonte única. O repo cerebro é o único lugar onde mora o conhecimento da Lilian (voz, ICP, histórias, datas, produtos, preços, provas, aprendizados). Nenhuma skill mantém a própria cópia desses arquivos.
Sync obrigatório (Passo 0). Toda skill, antes de qualquer coisa, sincroniza o cérebro do GitHub e lê a partir de /tmp/cerebro. Ela lê sempre /nucleo (transversal) + o seu cérebro específico (/conteudo para skills de conteúdo, /vendas para skills de venda). Os arquivos da própria skill ficam restritos a método/lógica — nunca conhecimento sobre a Lilian.
Falhar alto, nunca baixo. Se o sync falhar, a skill NÃO gera/conduz silenciosamente com cópia local. Avisa explicitamente que está offline e pede confirmação antes de seguir com dados possivelmente desatualizados.

Precedência em caso de conflito: cérebro (GitHub) > qualquer arquivo local.
Bug histórico (e por que o sync nunca funcionava em sessão nova)
O bloco de sync antigo apontava para um caminho com o nome da sessão fixo:

CONFIG="/sessions/gallant-awesome-bohr/mnt/outputs/.cerebro-config"

O nome da sessão (gallant-awesome-bohr) muda a cada sessão — logo o token nunca era encontrado, o clone caía em modo público (falha, repo privado) e a skill usava a cópia local antiga. A versão corrigida abaixo localiza o config dinamicamente.
Passo 0 padronizado (colar no topo de TODA SKILL.md)
# === PASSO 0 — SINCRONIZAR O CÉREBRO (OBRIGATÓRIO) ===
# Localiza o token dinamicamente: a pasta outputs persiste entre sessões,
# mas o nome da sessão muda — por isso NÃO se hardcoda o caminho da sessão.
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

Regra de tratamento do resultado (colar logo abaixo do bloco no SKILL.md):

Se CEREBRO_OK: leia o conhecimento de /tmp/cerebro/nucleo/ + do cérebro específico da skill (/tmp/cerebro/conteudo/ ou /tmp/cerebro/vendas/) — nunca dos arquivos locais da skill.
Se CEREBRO_OFFLINE: PARE e diga à Lilian: "Não consegui sincronizar o cérebro do GitHub, então não posso garantir que a base está atualizada. Quer que eu (a) gere com a cópia local, sabendo que pode estar desatualizada, ou (b) você configura/renova o token primeiro?" Nunca gere conteúdo final (nem conduza venda) sem esse aviso.
Configuração do token (uma vez, de forma segura)
No GitHub, gere um fine-grained personal access token com acesso Read and write (Contents: Read and write) e apenas ao repositório cerebro (Only select repositories → cerebro). Não use token de conta inteira nem com acesso a todos os repos.
Por que read and write: o cérebro é um documento vivo. No Passo 1, quando a Lilian conta uma história nova, a skill grava em /tmp/cerebro/nucleo/banco-de-historias.md e faz push de volta — isso exige escrita. Sem write, a skill lê tudo atualizado mas não registra nada novo.
Salve em outputs/.cerebro-config (a pasta outputs persiste entre sessões):

CEREBRO_USER="liliancidreira"
CEREBRO_TOKEN="seu_token_aqui"

Não cole o token em conversas de chat — ele vive só nesse arquivo local.

Como agora é um repo só, o mesmo token (cerebro) serve para todas as skills, inclusive a vendedora-spin. O repo cerebro-vendedora será aposentado — a vendedora passa a ler de cerebro (/nucleo + /vendas).
Mudanças concretas a aplicar (na fonte do plugin)
a) gerar-conteudo-semanal (orquestradora — prioridade máxima)

Adicionar o Passo 0 como primeira ação, antes da pergunta de produto.
Trocar as leituras de references/brand-knowledge.md, references/banco-de-historias.md, references/storytelling-analogias.md, references/content-templates.md por: /tmp/cerebro/nucleo/voz-e-tom.md, /tmp/cerebro/nucleo/fatos.md, /tmp/cerebro/nucleo/produtos/, /tmp/cerebro/nucleo/banco-de-historias.md, /tmp/cerebro/nucleo/provas-e-depoimentos.md, /tmp/cerebro/nucleo/ofertas-e-precos.md e /tmp/cerebro/conteudo/....
Manter locais apenas arquivos de método que não falam da Lilian.

b) criador-carrossel, roteirista-reels, estrategista, etc. (conteúdo)

Substituir o bloco de sync antigo pelo Passo 0 padronizado (corrige o caminho fixo) + regra "falhar alto".
Ler /tmp/cerebro/nucleo/ + /tmp/cerebro/conteudo/ (modelos de carrossel + método).

c) vendedora-spin (venda)

Passo 0 padronizado lendo do repo cerebro (não mais cerebro-vendedora).
Ler /tmp/cerebro/nucleo/ (produtos, personas, preços, provas, fatos, voz) + /tmp/cerebro/vendas/ (origem/roteamento, matriz, masterclass, sessão, SPIN/objeções).

d) skill-creator (para o futuro)

O bloco Passo 0 como seção obrigatória de toda skill nova.
Frase de precedência: "Conhecimento sobre a Lilian vem sempre do cérebro (/tmp/cerebro/nucleo + o cérebro específico). A skill nunca duplica esse conhecimento localmente."
Como manter (checklist de governança)
Token fine-grained read and write, escopado só ao repo cerebro, configurado em outputs/.cerebro-config
Passo 0 padronizado no topo de todas as skills
Toda skill lê /nucleo + o seu cérebro (/conteudo ou /vendas)
Nenhuma skill com cópia local de conhecimento da Lilian
Regra "falhar alto" implementada (sem fallback silencioso)
skill-creator gera novas skills já com o Passo 0
Método movido de skill-knowledge/metodo-atencao/ para conteudo/metodo-atencao/ (limpeza)
cerebro-vendedora aposentado
Plugin republicado/reinstalado no app após as mudanças

