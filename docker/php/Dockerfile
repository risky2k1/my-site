# =========================
# Stage 1: Base PHP + extensions
# =========================
FROM php:8.2-fpm-alpine AS base

# System deps (runtime)
RUN apk add --no-cache \
    bash \
    git \
    curl \
    libpng \
    libjpeg-turbo \
    freetype \
    oniguruma \
    icu \
    libzip \
    zip \
    unzip \
    supervisor

# Build deps (only for build)
RUN apk add --no-cache --virtual .build-deps \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    oniguruma-dev \
    icu-dev \
    libzip-dev

# PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
 && docker-php-ext-install \
    pdo_mysql \
    mbstring \
    intl \
    gd \
    zip \
    opcache \
 && apk del .build-deps

# =========================
# Stage 2: Composer
# =========================
FROM composer:2 AS composer

# =========================
# Stage 3: Runtime
# =========================
FROM base

# Copy composer binary only
COPY --from=composer /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

# PHP config
COPY docker/php/php.ini /usr/local/etc/php/php.ini

# Supervisor
COPY docker/supervisor/laravel-worker.conf /etc/supervisor/conf.d/

CMD ["php-fpm"]
