FROM ubuntu:22.04

# Installer les dépendances nécessaires pour Laravel
RUN apt-get update && apt-get install -y \
    curl \
    zip \
    unzip \
    software-properties-common \
    && add-apt-repository ppa:ondrej/php \
    && apt-get update

# Install PHP 7.2 and extensions
RUN apt-get install -y \
    php7.2 \
    php7.2-cli \
    php7.2-fpm \
    php7.2-json \
    php7.2-pdo \
    php7.2-mysql \
    php7.2-zip \
    php7.2-gd \
    php7.2-mbstring \
    php7.2-curl \
    php7.2-xml \
    php7.2-bcmath \
    php7.2-json \
    php7.2-soap \
    php7.2-intl

# Installer Nginx
RUN apt-get install -y nginx

# Copier les fichiers de l'application dans l'image Docker
COPY . /var/www/html

# Définir le répertoire de travail pour l'application Laravel
WORKDIR /var/www/html

# Installer Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Définir la variable d'environnement COMPOSER_ALLOW_SUPERUSER
ENV COMPOSER_ALLOW_SUPERUSER=1

RUN composer update --no-interaction --no-dev --prefer-dist
# Installer les dépendances de l'application avec Composer
RUN composer install --no-interaction --no-dev --prefer-dist

# Copier le fichier de configuration de l'application
COPY .env.example .env

# Générer la clé de l'application
RUN php artisan key:generate

# Configurer les permissions des fichiers
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Copier la configuration de Nginx
COPY nginx.conf /etc/nginx/sites-available/default

# Exposer le port 80 pour Nginx
EXPOSE 80

RUN chmod +x create_env.sh

# Démarrer les services PHP-FPM et Nginx
CMD ./create_env.sh && service php7.2-fpm start && nginx -g "daemon off;"
