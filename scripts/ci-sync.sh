#!/usr/bin/env bash
# Rodado pela GitHub Action: regenera os references/ dos plugins a partir da fonte unica,
# sobe a versao dos plugins que mudaram, e commita. Nao editar references/ a mao.
set -euo pipefail
cd "$(dirname "$0")/.."

bash scripts/bundle-cerebro.sh

git config user.name "cerebro-bot"
git config user.email "actions@users.noreply.github.com"
git add plugins/

for pj in plugins/*/.claude-plugin/plugin.json; do
  pdir="$(dirname "$(dirname "$pj")")"
  if ! git diff --cached --quiet -- "$pdir/"; then
    python3 - "$pj" <<'PY'
import json, sys
p = sys.argv[1]
d = json.load(open(p, encoding="utf-8"))
v = (d.get("version", "0.0.0") + ".0.0").split(".")[:3]
v[2] = str(int(v[2]) + 1)
d["version"] = ".".join(v)
json.dump(d, open(p, "w", encoding="utf-8"), ensure_ascii=False, indent=2)
print("bump", p, d["version"])
PY
    git add "$pj"
  fi
done

if ! git diff --cached --quiet; then
  git commit -m "chore(bundle): regenera references/ e bump versoes [skip ci]"
  git push
else
  echo "nada mudou nos bundles"
fi
