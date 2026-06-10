---
description: (Unificado) Gera um pack de conteúdo da semana — encaminha para a skill orquestrador-conteudo.
---

# /gerar-conteudo-semanal

Este comando foi **unificado** na skill **`orquestrador-conteudo`** (a porta única para gerar um PACK de conteúdos).

Ao ser chamado, aja como o `orquestrador-conteudo`:
1. Leia a base embutida em `references/` (vem com o plugin; sem token).
2. Siga o intake obrigatório de `references/conteudo/intake-conteudo.md` (produto → objetivo → categoria) e o **checklist pré-escrita** para cada peça.
3. Distribua os formatos e chame as skills de formato dedicadas: `conteudo-linkedin`, `conteudo-reel`, `conteudo-legenda`, `criador-carrossel`.

> Para UMA peça específica (um post de LinkedIn, um reel), não use este comando — chame direto a skill de formato.
