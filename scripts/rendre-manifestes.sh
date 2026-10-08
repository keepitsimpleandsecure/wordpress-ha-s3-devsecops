#!/usr/bin/env bash
# Genere les manifestes Kubernetes du projet dans rendu/ pour les scanners (Trivy, Checkov).
set -euo pipefail
cd "$(dirname "$0")/.."
. scripts/versions.env
rm -rf rendu && mkdir -p rendu
helm repo add bitnami https://charts.bitnami.com/bitnami >/dev/null 2>&1 || true
helm repo update bitnami >/dev/null
helm template db bitnami/mariadb-galera --version "$CHART_GALERA_VERSION" -f db_values.yaml > rendu/db.yaml
helm template wordpress bitnami/wordpress --version "$CHART_WP_VERSION" -f wp_values.yaml > rendu/wordpress.yaml
if [ -d k8s ]; then cp k8s/*.yaml rendu/; fi
echo "manifestes generes dans rendu/ : $(ls rendu | tr '\n' ' ')"
