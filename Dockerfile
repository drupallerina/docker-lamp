FROM php:5-apache
RUN apt-get update

VOLUME /var/www
VOLUME /etc/apache