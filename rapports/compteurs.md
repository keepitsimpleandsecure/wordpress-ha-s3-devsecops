| Scan | Avant | Apres |
|---|---|---|
| Trivy image WordPress | CRITICAL 78, HIGH 430 | CRITICAL 0, HIGH 0 |
| Trivy image Galera | CRITICAL 20, HIGH 184 | CRITICAL 4, HIGH 147 |
| Trivy config (manifestes) | CRITICAL 0, HIGH 0 | CRITICAL 0, HIGH 0 |
| Checkov (echecs) | 14 | 0 |
| Semgrep (constats) | 6 | 0 |

Apres : WordPress = image bitnami/wordpress epinglee par empreinte ; Galera = image reconstruite (images/mariadb-galera).
Checkov apres : 4 constats acceptes par annotation (raison et date de revue dans les fichiers de values).
