# Convenção: Cérebro como Fonte Única de Verdade (regra para todas as skills)

Objetivo: garantir que todo conteúdo gerado use sempre a versão mais recente e correta do conhecimento da Lilian. O episódio da data errada (demissão "2016" em vez de 2015) aconteceu porque havia **duas fontes** — o cérebro no GitHub e cópias embutidas no plugin — que saíram de sincronia. Esta convenção elimina isso.

---

## A regra (3 princípios invioláveis)

1. **Fonte única.** O repositório `github.com/liliancidreira/cerebro` é o único lugar onde mora o conhecimento da Lilian: voz, ICP, histórias, datas, produtos, aprendizados. Nenhuma skill mantém a própria cópia desses arquivos.

2. **Sync obrigatório (Passo 0).** Toda skill, antes de qualquer coisa, sincroniza o cérebro do GitHub e lê a partir de `/tmp/cerebro`. Os arquivos da skill ficam restritos a *método* (ex.: os 12 modelos de carrossel, os arquétipos de Reel) — nunca conhecimento sobre a Lilian.

3. **Falhar alto, nunca baixo.** Se o sync falhar, a skill NÃO gera conteúdo silenciosamente com cópia local. Ela avisa explicitamente que está offline e pede confirmação antes de seguir com dados possivelmente desatualizados.

Precedência em caso de conflito: **cérebro (GitHub) > qualquer arquivo local**.

---

## Bug encontrado (e por que o sync nunca funciona em sessão nova)

O bloco de sync atual das skills aponta para um caminho com o nome da sessão **fixo**:

```
CONFIG="/sessions/gallant-awesome-bohr/mnt/outputs/.cerebro-config"
```

O nome da sessão (`gallant-awesome-bohr`) muda a cada sessão. Logo, em qualquer sessão nova o arquivo de token nunca é encontrado, o clone cai em modo público (falha, porque o repo é privado) e a skill usa a cópia local antiga — exatamente o que aconteceu. A versão corrigida abaixo localiza o config dinamicamente.

---

## Passo 0 padronizado (colar no topo de TODA SKILL.md)

```bash
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
```

Regra de tratamento do resultado (texto a colar logo abaixo do bloco no SKILL.md):

> Se o resultado for **CEREBRO_OK**: leia todo o conhecimento de `/tmp/cerebro/` (nunca dos arquivos locais da skill).
>
> Se for **CEREBRO_OFFLINE**: PARE e diga à Lilian: "Não consegui sincronizar o cérebro do GitHub, então não posso garantir que a base está atualizada. Quer que eu (a) gere com a cópia local, sabendo que pode estar desatualizada, ou (b) você configura/renova o token primeiro?" Nunca gere conteúdo final sem esse aviso.

---

## Configuração do token (uma vez, de forma segura)

1. No GitHub, gere um **fine-grained personal access token** com acesso **somente-leitura** e **apenas ao repositório `cerebro`** (Contents: Read). Não use um token de conta inteira.
2. Salve em `outputs/.cerebro-config` (a pasta outputs persiste entre sessões) com este conteúdo:

```
CEREBRO_USER="liliancidreira"
CEREBRO_TOKEN="ghp_xxx_o_seu_token_aqui"
```

3. Não cole o token em conversas de chat — ele deve viver só nesse arquivo local.

Observação: o mesmo padrão vale para a `vendedora-spin`, trocando o repo para `cerebro-vendedora`.

---

## Mudanças concretas a aplicar (na fonte do plugin)

### a) `gerar-conteudo-semanal` (a orquestradora — prioridade máxima)
Hoje ela lê os arquivos **embutidos** (`references/brand-knowledge.md`, etc.) — foi a que usou a data velha. Mudar para:
- Adicionar o **Passo 0** acima como primeira ação, antes da pergunta de produto.
- Trocar todas as leituras de `references/brand-knowledge.md`, `references/banco-de-historias.md`, `references/storytelling-analogias.md`, `references/content-templates.md` por `/tmp/cerebro/...`.
- Manter locais apenas arquivos de método que não falam da Lilian.

### b) `criador-carrossel` e `vendedora-spin`
Já têm sync, mas com o caminho de sessão fixo (o bug). Substituir o bloco antigo pelo Passo 0 padronizado e aplicar a regra "falhar alto".

### c) `skill-creator` (para o futuro)
Adicionar ao template de criação de skills:
- O bloco **Passo 0** como seção obrigatória de toda skill nova.
- A frase de precedência: "Conhecimento sobre a Lilian vem sempre do cérebro (`/tmp/cerebro`). A skill nunca duplica esse conhecimento localmente."
Assim, toda skill nova nasce já com a regra.

---

## Como manter (checklist de governança)

- [ ] Token fine-grained read-only configurado em `outputs/.cerebro-config`
- [ ] Passo 0 padronizado no topo de todas as skills
- [ ] Nenhuma skill com cópia local de brand-knowledge / banco-de-historias / storytelling / templates
- [ ] Regra "falhar alto" implementada (sem fallback silencioso)
- [ ] `skill-creator` gera novas skills já com o Passo 0
- [ ] Plugin republicado/reinstalado no app após as mudanças
