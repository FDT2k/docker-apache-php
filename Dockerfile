FROM php:5.6-apache


RUN \
    apt-get update && \
    apt-get install libldap2-dev -y && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \
    docker-php-ext-install ldap

#RUN apt-get install -y php-xml

RUN docker-php-ext-configure mysqli
RUN docker-php-ext-install mysqli

RUN docker-php-ext-configure mysql
RUN docker-php-ext-install mysql

RUN pecl install mailparse

RUN docker-php-ext-configure pdo
RUN docker-php-ext-install pdo

RUN docker-php-ext-configure pdo_mysql
RUN docker-php-ext-install pdo_mysql

VOLUME /var/www/html
RUN a2enmod rewrite

EXPOSE 80
