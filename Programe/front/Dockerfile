# Utiliser la dernière version LTS de Node.js en tant qu'image de base
FROM node:14.17.0-alpine3.13 AS build

# Créer le répertoire de travail et copier les fichiers de l'application
WORKDIR /app
COPY . .

# Installer les dépendances et construire l'application
RUN npm install && npm run build

# Utiliser une image légère de nginx pour servir l'application construite
FROM nginx:1.21.0-alpine

# Copier les fichiers construits depuis l'étape précédente
# COPY --from=build /app/dist/app /usr/share/nginx/html

# Copier la configuration de Nginx pour servir correctement l'application
#COPY ./nginx.conf /etc/nginx/conf.d/default.conf
