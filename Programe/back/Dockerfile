# Utiliser la dernière version LTS de PHP en tant qu'image de base
FROM php:7.4-fpm

# Installer les dépendances nécessaires pour Laravel
RUN apt-get update && \
    apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    && docker-php-ext-install pdo_mysql zip

# Copier les fichiers de l'application dans l'image Docker
COPY . /var/www/html

# Définir le répertoire de travail pour l'application Laravel
WORKDIR /var/www/html
ENV COMPOSER_ALLOW_SUPERUSER=1

# Installer les dépendances de l'application avec Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer update --no-interaction
RUN composer install --no-interaction

# Exposer le port 80 pour que l'application soit accessible depuis le navigateur
EXPOSE 80

# Démarrer le serveur Nginx et PHP-FPM
CMD service nginx start && php-fpm
