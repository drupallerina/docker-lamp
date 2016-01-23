FROM php:5-apache
RUN apt-get update

VOLUME /www:/var/www
VOLUME /apache:/etc/apache