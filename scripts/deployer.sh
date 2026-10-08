#!/usr/bin/env bash
# Deploie la base MariaDB Galera (release db) puis WordPress sur le cluster courant.
set -euo pipefail
cd "$(dirname "$0")/.."
. scripts/versions.env
helm repo add bitnami https://charts.bitnami.com/bitnami >/dev/null 2>&1 || true
helm repo update bitnami >/dev/null
# Image Galera locale : construite dans Minikube si absente (jamais telechargee, pullPolicy Never)
if ! minikube image ls 2>/dev/null | grep -qx "$IMAGE_GALERA"; then
  echo "construction de $IMAGE_GALERA"
  minikube image build -t "$IMAGE_GALERA" images/mariadb-galera >/dev/null
fi
kubectl create namespace "$NAMESPACE" --dry-run=client -o yaml | kubectl apply -f - >/dev/null
./scripts/creer-secrets.sh
if [ -d k8s ]; then kubectl -n "$NAMESPACE" apply -f k8s/ >/dev/null && echo "manifestes k8s/ appliques"; fi
helm upgrade --install -n "$NAMESPACE" db bitnami/mariadb-galera --version "$CHART_GALERA_VERSION" -f db_values.yaml --wait --timeout 15m >/dev/null
echo "release db prete"
helm upgrade --install -n "$NAMESPACE" wordpress bitnami/wordpress --version "$CHART_WP_VERSION" -f wp_values.yaml --wait --timeout 15m >/dev/null
echo "release wordpress prete"
kubectl -n "$NAMESPACE" get pods
