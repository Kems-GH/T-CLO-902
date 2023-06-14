# Utiliser l'image officielle Go en tant qu'image de base
FROM golang:1.16

# Copier les fichiers de l'application dans l'image Docker
COPY . /app

# Définir le répertoire de travail pour l'application
WORKDIR /app

# Compiler l'application
RUN go build -o app

# Exposer le port 8080 pour que l'application soit accessible depuis le navigateur
EXPOSE 8080

# Démarrer l'application
CMD ["./app"]
