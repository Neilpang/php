From php:7-apache
RUN apt-get update && apt-get install -qqy libpng-dev cron curl netcat-openbsd && AUTO_UPGRADE=1 curl https://get.acme.sh | sh
RUN a2enmod headers rewrite ssl
RUN docker-php-source extract && docker-php-ext-install gd mysqli pdo pdo_mysql && docker-php-source delete

ADD run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]

