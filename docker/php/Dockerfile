FROM php:8.2-fpm-alpine

# System deps
RUN apk add --no-cache \
    bash \
    git \
    curl \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    oniguruma-dev \
    icu-dev \
    libzip-dev \
    zip \
    unzip \
    supervisor

# PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
 && docker-php-ext-install \
    pdo_mysql \
    mbstring \
    intl \
    gd \
    zip \
    opcache

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

# PHP config
COPY docker/php/php.ini /usr/local/etc/php/php.ini

# Supervisor (queue)
COPY docker/supervisor/laravel-worker.conf /etc/supervisor/conf.d/

CMD ["php-fpm"]
