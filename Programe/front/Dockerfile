# Utiliser la dernière version LTS de Node.js en tant qu'image de base
FROM node:12.16.1-alpine as build-stage

# Créer le répertoire de travail et copier les fichiers de l'application
WORKDIR /app
COPY . .

# Installer les dépendances et construire l'application
RUN npm install && npm run build
