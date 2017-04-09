From php:7-apache
RUN a2enmod headers rewrite ssl
RUN docker-php-source extract && docker-php-ext-install mysqli pdo pdo_mysql && docker-php-source delete
RUN apt-get update && apt-get install -qqy cron curl netcat-openbsd && AUTO_UPGRADE=1 curl https://get.acme.sh | sh

ADD run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]

