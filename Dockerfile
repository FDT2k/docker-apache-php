FROM php:5.6-apache


RUN \
    apt-get update && \
    apt-get install libldap2-dev -y && \
    apt-get install libxml2-dev -y && \
    apt-get install libzip-dev -y && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \
    docker-php-ext-install ldap \
    apt-get install -y phpunit


#RUN apt-get install -y php-xml

RUN docker-php-ext-configure mysqli
RUN docker-php-ext-install mysqli

RUN docker-php-ext-configure mysql
RUN docker-php-ext-install mysql

RUN pecl install mailparse-2.1.6

RUN docker-php-ext-configure pdo
RUN docker-php-ext-install pdo

RUN docker-php-ext-configure pdo_mysql
RUN docker-php-ext-install pdo_mysql

RUN docker-php-ext-configure mbstring

RUN docker-php-ext-configure iconv

RUN docker-php-ext-configure xml

RUN docker-php-ext-configure xmlwriter

RUN docker-php-ext-configure zip
RUN docker-php-ext-configure gmp


RUN docker-php-ext-install mbstring

RUN docker-php-ext-install iconv

RUN docker-php-ext-install xml

RUN docker-php-ext-install xmlwriter

RUN docker-php-ext-install zip

RUN docker-php-ext-install gmp

RUN docker-php-ext-enable mailparse
VOLUME /var/www/html
RUN a2enmod rewrite

EXPOSE 80
