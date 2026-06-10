# Design System — Lilian Cidreira / Future Minds

## Paleta de cores

| Nome          | Hex       | Uso principal |
|---------------|-----------|---------------|
| Carvão        | `#212121` | Fundo primário dos slides |
| Cinza ardósia | `#404c58` | Fundo secundário, variação entre slides |
| Dourado       | `#cc9f2a` | Destaque, títulos de slide, linhas decorativas |
| Areia escura  | `#958471` | Bordas, elementos de suporte |
| Areia clara   | `#b5a58c` | Texto secundário, subtítulos, handle |
| Branco        | `#ffffff` | Texto principal sobre fundos escuros |

**Cor removida da paleta:** `#103d61` (azul) — não usar em nenhum slide.

### Combinações de slide recomendadas

- **Slide capa:** fundo `#212121`, título `#ffffff`, acento `#cc9f2a`
- **Slides de desenvolvimento (ímpares):** fundo `#212121`, título `#cc9f2a`, texto `#ffffff`
- **Slides de desenvolvimento (pares):** fundo `#404c58`, título `#cc9f2a`, texto `#ffffff`
- **Slide final (CTA):** fundo `#212121`, texto `#ffffff`, linha e handle em `#cc9f2a`

---

## Tipografia

| Fonte            | Uso                              |
|------------------|----------------------------------|
| Simple Michael   | Títulos grandes, capa            |
| Neue Montreal    | Texto de corpo, desenvolvimento  |
| Autaut Grotesk   | Labels, números, textos pequenos |

### Instruções para o gerador de imagens

As fontes Simple Michael, Neue Montreal e Autaut Grotesk são fontes personalizadas.
O script verifica se os arquivos `.ttf` ou `.otf` estão em `references/fonts/`.

**Se os arquivos de fonte estiverem presentes:** usa as fontes exatas.
**Se não estiverem:** usa as fontes de fallback abaixo, mantendo a hierarquia visual:
- Fallback para títulos: `Georgia` (serif)
- Fallback para corpo: `Arial` (sans-serif)
- Fallback para labels: `Arial Narrow` (sans-serif condensed)

Para usar as fontes exatas: coloque os arquivos `.ttf` ou `.otf` na pasta `references/fonts/` com os nomes:
- `SimpleMichael.ttf`
- `NouveauMontreal.ttf` (ou `NouveauMontreal-Regular.ttf`)
- `AutautGrotesk.ttf`

---

## Layout dos slides

**Dimensões:** 1080 × 1350 px (4:5 portrait — padrão Instagram)
**Margem interna:** 90px em todos os lados
**Área segura de conteúdo:** 900 × 1170 px
**Alinhamento:** texto centralizado horizontalmente; bloco de conteúdo centralizado verticalmente no slide

### Princípio de composição

O texto é o elemento visual principal. Cada slide entrega uma ideia com o máximo de clareza e respiro. O conteúdo é posicionado no centro óptico do slide — centralizado horizontalmente e verticalmente dentro da área segura.

### Elementos fixos em todos os slides
- **Linha decorativa dourada** (`#cc9f2a`): 3px de altura, 80px de largura, centralizada — posicionada entre título e subtítulo na capa, ou acima do texto no CTA
- **Linha dourada de rodapé** (`#cc9f2a`): 2px, da margem à margem — presente apenas nos slides de desenvolvimento
- **Handle `@aliliancidreira`** no rodapé de todos os slides — Autaut Grotesk 20px, centralizado, cor `#b5a58c` (exceto CTA onde usa `#cc9f2a`)
- **Número do slide** (exceto capa) — canto superior direito, Autaut Grotesk 18px, cor `#cc9f2a`

### Hierarquia tipográfica

**Slide capa:**
- Título: Simple Michael, 72px, `#ffffff`, maiúsculas, centralizado
- Linha decorativa dourada centralizada (80px largura, 3px espessura)
- Subtítulo: Neue Montreal, 30px, `#b5a58c`, centralizado

**Slides de desenvolvimento (2 ao penúltimo):**
- Título do slide: Neue Montreal, 38px, `#cc9f2a`, centralizado
- Linha decorativa dourada centralizada (50px largura, 2px espessura)
- Corpo do texto: Neue Montreal, 28px, `#ffffff`, espaçamento 1.7, centralizado

**Slide final (CTA):**
- Fundo: `#212121`
- Linha decorativa dourada centralizada acima do texto
- Texto do CTA: Neue Montreal, 44px, `#ffffff`, centralizado, espaçamento 1.5
- Handle: `@aliliancidreira`, Autaut Grotesk 20px, `#cc9f2a`, centralizado

---

## Tom visual geral

Clean, executivo, sem enfeites desnecessários. O peso visual vem da tipografia e da cor — não de ícones, ilustrações ou elementos decorativos complexos. Cada slide comunica uma ideia com clareza máxima.
