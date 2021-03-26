FROM php:7.4-fpm-alpine
WORKDIR "/var/www"

# Install selected extensions and other stuff
RUN apk update && apk add build-base
RUN apk add zlib-dev libzip-dev libmcrypt-dev git openldap-dev postfix busybox-extras bash libpng-dev jpeg-dev
RUN mkfifo /var/spool/postfix/public/pickup

RUN docker-php-ext-install pdo_mysql zip exif pcntl ldap gd json iconv

# Get composer
RUN curl -sS https://getcomposer.org/installer | php \
      && chmod +x composer.phar && mv composer.phar /usr/local/bin/composer

# Install dependencies
COPY . .
RUN composer install --prefer-dist --no-scripts

EXPOSE 9000
CMD ["php-fpm"]

