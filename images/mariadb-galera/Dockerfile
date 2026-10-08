# Image MariaDB Galera corrigee pour le labo.
# L'image bitnamilegacy n'est plus reconstruite par Bitnami : on part de la version epinglee
# par empreinte et on applique toutes les mises a jour de securite Debian disponibles.
FROM docker.io/bitnamilegacy/mariadb-galera:12.0.2-debian-12-r0@sha256:04060d220627a70f9dd05d2a6ee11d0c2843c47633e78491cfcfd96f97a6d918

USER 0
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y --no-install-recommends \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
USER 1001
