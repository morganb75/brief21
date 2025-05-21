# Étape 1 : Build
FROM rustlang/rust:nightly AS builder

WORKDIR /app
COPY . .
RUN cargo install --path .

# Étape 2 : Runtime minimal
FROM debian:bookworm-slim

# Installer les certificats SSL (si HTTPS ou requêtes HTTPS en sortie)
RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*

# Copier le binaire compilé
COPY --from=builder /usr/local/cargo/bin/shop_bin /usr/local/bin/shop_bin

# Commande de démarrage
CMD ["shop_bin"]


