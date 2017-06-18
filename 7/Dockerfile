From php:7-apache
RUN apt-get update && apt-get install -qqy \
  libpng-dev \
  libfreetype6-dev \
  libmcrypt-dev \
  libpng12-dev \
  libjpeg-dev \
  libpng-dev \
  cron curl netcat-openbsd \
  && apt-get -y autoremove && apt-get clean all && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo "IncludeOptional /conf/*.conf" >>/etc/apache2/apache2.conf

RUN a2enmod headers rewrite ssl
RUN docker-php-ext-install iconv mcrypt \
&& docker-php-ext-configure gd \
  --enable-gd-native-ttf \
  --with-freetype-dir=/usr/include/freetype2 \
  --with-png-dir=/usr/include \
  --with-jpeg-dir=/usr/include \
&& docker-php-source extract \
&& docker-php-ext-install \
  gd \
  mbstring \
  mysqli \
  pdo \
  pdo_mysql \
&& docker-php-ext-enable opcache gd \
&& docker-php-source delete

RUN echo 'memory_limit = 1024M' >> /usr/local/etc/php/conf.d/php.ini \
  && echo 'post_max_size = 2048M' >> /usr/local/etc/php/conf.d/php.ini \
  && echo 'upload_max_filesize = 2048M' >> /usr/local/etc/php/conf.d/php.ini \
  && echo 'max_execution_time = 180' >> /usr/local/etc/php/conf.d/php.ini

ADD run.sh /run.sh
RUN chmod +x /run.sh
RUN mkdir -p /conf

VOLUME /conf
VOLUME /acme.sh

EXPOSE 443

CMD ["/run.sh"]



