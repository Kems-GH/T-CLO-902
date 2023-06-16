#!/bin/bash

# Copier le fichier .env.example dans .env
cp .env.example .env

# Remplacer les valeurs des variables d'environnement dans le fichier .env
# avec les valeurs définies dans l'environnement Docker
sed -i "s|APP_NAME=|APP_NAME=${APP_NAME:-}|g" .env
sed -i "s|APP_ENV=|APP_ENV=${APP_ENV:-}|g" .env
sed -i "s|APP_KEY=|APP_KEY=${APP_KEY:-}|g" .env
sed -i "s|APP_DEBUG=|APP_DEBUG=${APP_DEBUG:-}|g" .env
sed -i "s|APP_URL=|APP_URL=${APP_URL:-}|g" .env

sed -i "s|LOG_CHANNEL=|LOG_CHANNEL=${LOG_CHANNEL:-}|g" .env

sed -i "s|DB_CONNECTION=|DB_CONNECTION=${DB_CONNECTION:-}|g" .env
sed -i "s|DB_HOST=|DB_HOST=${DB_HOST:-}|g" .env
sed -i "s|DB_PORT=|DB_PORT=${DB_PORT:-}|g" .env
sed -i "s|DB_DATABASE=|DB_DATABASE=${DB_DATABASE:-}|g" .env
sed -i "s|DB_USERNAME=|DB_USERNAME=${DB_USERNAME:-}|g" .env
sed -i "s|DB_PASSWORD=|DB_PASSWORD=${DB_PASSWORD:-}|g" .env

sed -i "s|BROADCAST_DRIVER=|BROADCAST_DRIVER=${BROADCAST_DRIVER:-}|g" .env
sed -i "s|CACHE_DRIVER=|CACHE_DRIVER=${CACHE_DRIVER:-}|g" .env
sed -i "s|QUEUE_CONNECTION=|QUEUE_CONNECTION=${QUEUE_CONNECTION:-}|g" .env
sed -i "s|SESSION_DRIVER=|SESSION_DRIVER=${SESSION_DRIVER:-}|g" .env
sed -i "s|SESSION_LIFETIME=|SESSION_LIFETIME=${SESSION_LIFETIME:-}|g" .env

sed -i "s|RABBITMQ_HOST=|RABBITMQ_HOST=${RABBITMQ_HOST:-}|g" .env
sed -i "s|RABBITMQ_PORT=|RABBITMQ_PORT=${RABBITMQ_PORT:-}|g" .env
sed -i "s|RABBITMQ_USER=|RABBITMQ_USER=${RABBITMQ_USER:-}|g" .env
sed -i "s|RABBITMQ_PASSWORD=|RABBITMQ_PASSWORD=${RABBITMQ_PASSWORD:-}|g" .env
sed -i "s|RABBITMQ_VHOST=|RABBITMQ_VHOST=${RABBITMQ_VHOST:-}|g" .env

sed -i "s|ELASTICSEARCH_HOST=|ELASTICSEARCH_HOST=${ELASTICSEARCH_HOST:-}|g" .env
sed -i "s|ELASTICSEARCH_PORT=|ELASTICSEARCH_PORT=${ELASTICSEARCH_PORT:-}|g" .env
sed -i "s|ELASTICSEARCH_SCHEME=|ELASTICSEARCH_SCHEME=${ELASTICSEARCH_SCHEME:-}|g" .env

# Autres variables d'environnement à ajouter selon vos besoins

echo "Fichier .env généré avec succès."
