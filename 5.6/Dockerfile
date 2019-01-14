FROM php:5.6-apache
MAINTAINER opepin <opepin@optaros.com>

RUN apt-get update 
RUN apt-get install -y cron curl wget mysql-client libxslt1-dev libxml2-dev libmcrypt-dev libicu-dev libfreetype6-dev libjpeg62-turbo-dev libpng12-dev php5-intl php5-apcu netcat git vim strace

RUN docker-php-ext-install zip bcmath pdo_mysql iconv mcrypt json ctype intl mbstring soap xsl opcache \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

RUN a2enmod rewrite && a2enmod headers && a2enmod expires && a2enmod deflate 

RUN curl --silent --location https://deb.nodesource.com/setup_0.12 | bash - && apt-get install --yes nodejs

RUN  curl -s https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

ENV TZ=UTC
RUN echo date.timezone=\"$TZ\" > /usr/local/etc/php/conf.d/timezone.ini  

EXPOSE 80

ENV APACHE_LOG_DIR=/var/log/apache2
RUN mkdir -p $APACHE_LOG_DIR 

LABEL new build

