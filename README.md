# brief21
Brief 21 Simplon

Etape1:
Ecriture du Dockerfile afin de générer une image de notre API Rust.
On place ensuite cette image sur le registry du server pour le déploiement.

Etape2:
Ecriture du docker-compose.yml, c'est l'orchestrateur et grâce à ce fichier:
- on met à disposition une base postgre sql (définie en volume pour persister).
- on configure également le network qui permet la communication entre base et Api.
- on utilise Traefik, qui est un reverse proxy afin de router correctement ce qu'on expose via l'URL de déploiement.
