#!/usr/bin/env bash
# Cree les Secrets Kubernetes du projet avec des mots de passe aleatoires.
# Les valeurs ne sont jamais affichees, jamais ecrites sur disque, jamais passees en argument.
# Idempotent : un Secret deja present est conserve (la base garde ses mots de passe).
set -euo pipefail
. "$(dirname "$0")/versions.env"
NS="${NS:-$NAMESPACE}"

alea() { tr -dc 'A-Za-z0-9' </dev/urandom | head -c 32; }

creer_si_absent() {
  local nom="$1"; shift
  if kubectl -n "$NS" get secret "$nom" >/dev/null 2>&1; then
    echo "Secret $nom deja present : conserve"
    return 0
  fi
  kubectl -n "$NS" create secret generic "$nom" "$@" >/dev/null
  echo "Secret $nom cree"
}

creer_si_absent db-credentials \
  --from-file=mariadb-root-password=<(alea) \
  --from-file=mariadb-password=<(alea) \
  --from-file=mariadb-galera-mariabackup-password=<(alea)

creer_si_absent wordpress-credentials \
  --from-file=wordpress-password=<(alea)
