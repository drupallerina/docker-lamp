FROM php:5-apache

# install updates and dependencies
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y zlib1g-dev libicu-dev g++ openssh-server supervisor

# install standard php extensions
RUN docker-php-ext-configure intl && \
    docker-php-ext-install intl && \
    docker-php-ext-install opcache

# install and configure xdebug
RUN pecl install xdebug && \
    docker-php-ext-enable xdebug && \
    echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
    echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# create needed directories
RUN mkdir -p /var/run/sshd /var/log/supervisor

# configure root password and enable ssh via root
RUN echo 'root:docker' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# add custom configuration files
ADD ./conf/php.ini /usr/local/etc/php/php.ini
ADD ./conf/apache2.conf /etc/apache2/apache2.conf
ADD ./conf/sites-enabled /etc/apache2/sites-enabled
ADD ./conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# using supervisord to spawn apache2 and sshd processes
CMD ["/usr/bin/supervisord"]