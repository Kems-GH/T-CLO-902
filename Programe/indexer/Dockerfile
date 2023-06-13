# Utiliser l'image Node.js officielle en tant qu'image de base
FROM node:14

# Copier les fichiers de l'application dans l'image Docker
COPY . /app

# Définir le répertoire de travail pour l'application
WORKDIR /app

ENV AMQP_URI amqp://rabbitmq:5672
ENV ELASTICSEARCH_URI http://elasticsearch:9200

# Installer les dépendances de l'application avec npm
RUN npm install

# Exposer le port 3000 pour que l'application soit accessible depuis le navigateur
EXPOSE 3000

# Démarrer l'application
CMD ["npm", "start"]
