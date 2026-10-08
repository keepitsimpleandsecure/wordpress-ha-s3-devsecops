#!/usr/bin/env bash
# Deploie la base MariaDB Galera (release db) puis WordPress sur le cluster courant.
set -euo pipefail
cd "$(dirname "$0")/.."
. scripts/versions.env
helm repo add bitnami https://charts.bitnami.com/bitnami >/dev/null 2>&1 || true
helm repo update bitnami >/dev/null
./scripts/creer-secrets.sh
if [ -d k8s ]; then kubectl apply -f k8s/ >/dev/null && echo "manifestes k8s/ appliques"; fi
helm upgrade --install db bitnami/mariadb-galera --version "$CHART_GALERA_VERSION" -f db_values.yaml --wait --timeout 15m >/dev/null
echo "release db prete"
helm upgrade --install wordpress bitnami/wordpress --version "$CHART_WP_VERSION" -f wp_values.yaml --wait --timeout 15m >/dev/null
echo "release wordpress prete"
kubectl get pods
