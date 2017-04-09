From php:5-apache
RUN a2enmod headers rewrite
RUN docker-php-source extract && docker-php-ext-install mysql mysqli pdo pdo_mysql && docker-php-source delete


