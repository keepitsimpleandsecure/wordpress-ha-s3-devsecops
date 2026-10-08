#!/usr/bin/env bash
# Remet le labo a zero : releases, volumes, et Secrets si --secrets est passe.
set -euo pipefail
. "$(dirname "$0")/versions.env"
helm uninstall -n "$NAMESPACE" wordpress db --wait 2>/dev/null || true
kubectl -n "$NAMESPACE" delete pvc -l app.kubernetes.io/instance=db --wait=true 2>/dev/null || true
kubectl -n "$NAMESPACE" delete pvc -l app.kubernetes.io/instance=wordpress --wait=true 2>/dev/null || true
if [ "${1:-}" = "--secrets" ]; then
  kubectl -n "$NAMESPACE" delete secret db-credentials wordpress-credentials --ignore-not-found
fi
echo "labo remis a zero"
