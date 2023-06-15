FROM node:14 AS build

# Créer le répertoire de travail et copier les fichiers de l'application
WORKDIR /app

# Copie du fichier package.json et du fichier package-lock.json dans le conteneur
COPY package*.json ./

# Installation des dépendances
RUN npm install

COPY . .

# Installer les dépendances et construire l'application
RUN npm run build -- --configuration=production

CMD ["npm", "start"]
