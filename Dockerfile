FROM php:5-apache

# Manually set up the apache environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

# install dependencies
RUN apt-get update && apt-get install -y zlib1g-dev libicu-dev g++

# install standard php extensions
RUN docker-php-ext-configure intl && \
        docker-php-ext-install intl && \
        docker-php-ext-install opcache

# install and configure xdebug
RUN pecl install xdebug && \
        docker-php-ext-enable xdebug && \
        echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
        echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# add custom configuration files
ADD ./conf/php.ini /usr/local/etc/php/php.ini
ADD ./conf/apache2.conf /etc/apache2/apache2.conf
ADD ./conf/sites-enabled /etc/apache2/sites-enabled