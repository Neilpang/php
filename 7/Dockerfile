From php:7-apache
RUN a2enmod headers rewrite
RUN docker-php-source extract && docker-php-ext-install mysqli pdo pdo_mysql && docker-php-source delete


