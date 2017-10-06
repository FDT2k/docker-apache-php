FROM php:7.1.10-apache


RUN \
    apt-get update && \
    apt-get install libldap2-dev -y && \
    apt-get install libxml2-dev -y && \
    apt-get install libzip-dev -y && \
    apt-get install phpunit -y && \
    apt-get install wget -y && \
    apt-get install libgmp3-dev -y && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \
    docker-php-ext-install ldap

RUN ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h

RUN cd /usr/bin && wget https://phar.phpunit.de/phpunit-6.4.phar
RUN cd /usr/bin && chmod u+x phpunit-6.4.phar

#RUN apt-get install -y php-xml

RUN docker-php-ext-configure mysqli
RUN docker-php-ext-install mysqli





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

VOLUME /var/www/html
RUN a2enmod rewrite

EXPOSE 80
