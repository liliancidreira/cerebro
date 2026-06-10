#!/usr/bin/env bash
# Gera o conteudo embutido (references/) de cada plugin a partir da FONTE UNICA do repo.
# Rodado pela GitHub Action a cada push em nucleo/, vendas/, conteudo/, skill-knowledge/.
# Nunca editar references/ a mao: este script as regenera.
set -euo pipefail
cd "$(dirname "$0")/.."

# Manifesto: plugin -> diretorios-fonte que ele precisa
declare -A SRC
SRC[vendedora-spin]="nucleo vendas"
SRC[prospeccao-ativa]="nucleo vendas"
SRC[gerador-conteudo-metodo-atencao]="nucleo conteudo skill-knowledge/metodo-atencao"
SRC[criador-carrossel]="nucleo conteudo skill-knowledge/metodo-atencao"

for plugin in "${!SRC[@]}"; do
  pdir="plugins/$plugin"
  [ -d "$pdir" ] || { echo "skip (sem plugin): $plugin"; continue; }
  # alvos: cada pasta de skill + a pasta commands (se houver)
  for tdir in "$pdir"/skills/*/ "$pdir"/commands/; do
    [ -d "$tdir" ] || continue
    rm -rf "${tdir}references"
    for src in ${SRC[$plugin]}; do
      mkdir -p "${tdir}references/$(dirname "$src")"
      cp -r "$src" "${tdir}references/$src"
    done
    # exclusoes: stub descontinuado e registros (dados, nao conhecimento)
    rm -f  "${tdir}references/nucleo/icp.md" 2>/dev/null || true
    rm -rf "${tdir}references/vendas/registros" 2>/dev/null || true
  done
  echo "bundle OK: $plugin"
done
