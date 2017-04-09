From php:5-apache
RUN apt-get update && apt-get install -qqy \
  libpng-dev \
  libfreetype6-dev \
  libmcrypt-dev \
  libpng12-dev \
  libjpeg-dev \
  libpng-dev \
  cron curl netcat-openbsd \
&& AUTO_UPGRADE=1 curl https://get.acme.sh | sh

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

ADD run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]

