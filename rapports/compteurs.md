| Scan | Avant | Apres |
|---|---|---|
| Trivy image WordPress | CRITICAL 78, HIGH 430 | CRITICAL 0, HIGH 0 |
| Trivy image Galera | CRITICAL 20, HIGH 184 | CRITICAL 2, HIGH 124 |
| Trivy config (manifestes WordPress et Galera) | CRITICAL 0, HIGH 0 | CRITICAL 0, HIGH 0 |
| Trivy config (manifestes Liqo) | CRITICAL 0, HIGH 7, MEDIUM 13, LOW 23 | CRITICAL 0, HIGH 0, MEDIUM 2, LOW 5 |
| Checkov WordPress et Galera (echecs) | 14 | 0 |
| Checkov Liqo (echecs) | 48 | 14 |
| Semgrep (constats) | 6 | 0 |

Apres : WordPress = image bitnami/wordpress epinglee par empreinte ; Galera = image reconstruite (images/mariadb-galera, toutes les mises a jour Debian).
Galera apres : 0 faille Debian corrigible ; restent 2 CRITICAL et 82 HIGH Debian sans correctif publie, et 42 HIGH dans le binaire Go ini-file de Bitnami (21 failles comptees deux fois, cible binaire et cible SPDX).
Checkov WordPress et Galera apres : 4 constats acceptes par annotation (raison et date de revue dans les fichiers de values).
Checkov Liqo apres : 14 echecs restants, dont 10 sur le patch Kustomize du frontend (lu seul, sans le manifeste distant qu'il complete) ; demo hors perimetre de deploiement.
