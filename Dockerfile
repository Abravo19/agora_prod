FROM php:8.2-apache

# Extensions PHP pour Symfony
RUN apt-get update && apt-get install -y \
    libicu-dev \
    libzip-dev \
    unzip \
    git \
    && docker-php-ext-install pdo pdo_mysql intl zip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Activer mod_rewrite pour Symfony
RUN a2enmod rewrite

# Configurer Apache pour Symfony - pointer vers /var/www/html/public
RUN echo '<VirtualHost *:80>\n\
    DocumentRoot /var/www/html/public\n\
    <Directory /var/www/html/public>\n\
        AllowOverride All\n\
        Require all granted\n\
        FallbackResource /index.php\n\
    </Directory>\n\
</VirtualHost>' > /etc/apache2/sites-available/000-default.conf

WORKDIR /var/www/html

# Copiar el proyecto
COPY . .

# Instalar dependencias de Composer (sin dev)
RUN composer install --no-dev --optimize-autoloader

# Permisos para Symfony
RUN chown -R www-data:www-data var/ || true

EXPOSE 80
