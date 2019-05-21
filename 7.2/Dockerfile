FROM php:7.2-fpm

RUN apt-get update && apt-get install -y \
  cron \
  git \
  gzip \
  libfreetype6-dev \
  libicu-dev \
  libjpeg62-turbo-dev \
  libmcrypt-dev \
  libpng-dev \
  libxslt1-dev \
  lsof \
  mysql-client \
  vim \
  zip \
  wget

RUN docker-php-ext-configure \
  gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN docker-php-ext-install \
  bcmath \
  gd \
  intl \
  mbstring \
  opcache \
  pdo_mysql \
  soap \
  xsl \
  zip


RUN pecl channel-update pecl.php.net \
  && pecl install xdebug mcrypt-1.0.2 \
  && docker-php-ext-enable xdebug mcrypt\
  && sed -i -e 's/^zend_extension/\;zend_extension/g' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# https://pecl.php.net/package/ssh2 -ssh2 is in alpha mode
# RUN apt-get install -y libssh2–1-dev libssh2–1 \
#  && pecl install ssh2 \
#  && docker-php-ext-enable ssh2

RUN groupadd -g 1000 app \
 && useradd -g 1000 -u 1000 -d /var/www -s /bin/bash app \
 && curl -sS https://getcomposer.org/installer | \
 php -- --install-dir=/usr/local/bin --filename=composer \
 && wget -O phpunit https://phar.phpunit.de/phpunit-6.phar \
 && chmod +x phpunit \
 && mv phpunit /usr/local/bin/phpunit

RUN apt-get install -y gnupg \
  && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs \
  && mkdir -p /var/www/.composer /var/www/.config /var/www/.npm \
  && chown app:app /var/www/.config /var/www/.npm /var/www/.composer \
  && ln -s /var/www/html/node_modules/grunt/bin/grunt /usr/bin/grunt

# RUN printf '* *\t* * *\tapp\t%s/usr/local/bin/php /var/www/html/update/cron.php\n' >> /etc/crontab
# RUN printf '* *\t* * *\tapp\t%s/usr/local/bin/php /var/www/html/bin/magento cron:run\n' >> /etc/crontab
# RUN printf '* *\t* * *\tapp\t%s/usr/local/bin/php /var/www/html/bin/magento setup:cron:run\n#\n' >> /etc/crontab

COPY conf/www.conf /usr/local/etc/php-fpm.d/
COPY conf/php.ini /usr/local/etc/php/
COPY conf/php-fpm.conf /usr/local/etc/
COPY bin/cronstart /usr/local/bin/

COPY /conf/wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh \
  && mkdir /sock \
  && chown -R app:app /usr/local/etc/php/conf.d /sock

USER app:app

RUN composer global require hirak/prestissimo

VOLUME /var/www

WORKDIR /var/www/html

EXPOSE 9001
