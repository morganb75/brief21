## brief21

# Déploiement de l'API Rust avec Docker et Traefik

## Étape 1 : Construction et publication de l’image Docker de l’API

Un Dockerfile a été rédigé pour containeriser l’API développée en Rust. Ce fichier décrit toutes les étapes nécessaires à la compilation et à l’exécution de l’API dans un conteneur.

Une fois l’image construite localement, elle est publiée sur un **registry Docker distant privé** :

Cela permet de la déployer facilement depuis n’importe quel serveur autorisé.

---

## Étape 2 : Orchestration avec `docker-compose.yml`

Un fichier docker-compose.yml est utilisé pour orchestrer les services nécessaires à l’application :

### Services déclarés

- **PostgreSQL**
  - Base de données relationnelle.
  - Configuration via variables d’environnement (`POSTGRES_DB`, `POSTGRES_USER`, etc.).
  - Données persistées grâce à un **volume Docker**.

- **API Rust**
  - L’image est récupérée depuis le registry (`registry.nocturlab.fr`).
  - Connectée à la base via un **réseau Docker privé**.
  - Configuration de l’API via variables d’environnement (hôte, identifiants DB, etc.).

- **Traefik
  - Reverse proxy qui route automatiquement les requêtes vers le bon conteneur.
  - Les labels Traefik (commentés par défaut) permettent de rediriger les requêtes vers `https://morgan.nocturlab.fr`.
