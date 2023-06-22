# Étape 1 : Construire l'application Angular
FROM node:14 as builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build:prod

# Étape 2 : Créer l'image finale avec Nginx
FROM nginx:1.21.3

# Copier les fichiers de l'application Angular construite dans l'étape précédente
COPY --from=builder /app/dist/front /usr/share/nginx/html

# Exposer le port 80 pour Nginx
EXPOSE 80

# Démarrer Nginx lors du démarrage du conteneur
CMD ["nginx", "-g", "daemon off;"]
