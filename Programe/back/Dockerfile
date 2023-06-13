# Utiliser la dernière version LTS de PHP en tant qu'image de base
FROM php:7.4-fpm

# Installer les dépendances nécessaires pour Laravel
RUN apt-get update && \
    apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    && docker-php-ext-install pdo_mysql zip

# Installer NGINX
RUN apt-get update && apt-get install -y nginx

# Copier les fichiers de l'application dans l'image Docker
COPY . /var/www/html

# Définir le répertoire de travail pour l'application Laravel
WORKDIR /var/www/html

# Installer les dépendances de l'application avec Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer update --no-interaction
RUN composer install --no-interaction

# Copier le fichier de configuration nginx dans l'image Docker
# COPY ./laravel.conf /etc/nginx/sites-available/

# Activer le site Nginx pour l'application Laravel
# RUN ln -s /etc/nginx/sites-available/laravel.conf /etc/nginx/sites-enabled/

# Exposer le port 80 pour que l'application soit accessible depuis le navigateur
EXPOSE 80

# Démarrer le serveur Nginx et PHP-FPM
CMD service nginx start && php-fpm
