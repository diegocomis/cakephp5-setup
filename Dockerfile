FROM php:8.1-apache

# Arguments defined in docker-compose.yml
ARG user
ARG uid

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev\
    zip \
    unzip \
    nano \
    libicu-dev

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd intl zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

# Add alias to container
RUN echo '#!/bin/bash\n bin/cake' > /usr/bin/cake && \
    chmod +x /usr/bin/cake

RUN echo "file_uploads = On\n" \
         "memory_limit = 1024M\n" \
         "upload_max_filesize = 256M\n" \
         "post_max_size = 256M\n" \
         "max_execution_time = 60\n" \
         > /usr/local/etc/php/conf.d/docker-php-uploads.ini

# Set working directory
WORKDIR /var/www

USER $user
