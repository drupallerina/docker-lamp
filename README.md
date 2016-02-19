# docker-lamp
This repository contains an easy to customize local development environment containing php5, apache and mysql, built with docker.

## Requirements
Getting this to run, requires:
 - docker
 - docker-compose

## Installation
Setting up this development environment only requires you to:

```bash
git clone git@github.com:PhilippSchaffrath/docker-lamp.git
cd development
docker-compose up
```

## Configuration
Since it is unknown where you will clone this repository to, the docker-compose.yml does not mount volumes by default. To mount your projects into your docker container, add the following to the docker-compose.yml:

```
  volumes:
    - /c/Users/path_to_this_repository/www:/var/www/html
```

### Apache and PHP5 configuration
You can find `apache2.conf` and `php.ini` files, as well as the `conf/sites-enabled` directory in the `conf` directory. Those can be used to customize your apache and php settings.
Once edited, you have to re-build the docker image. This can be easily done by:

```
cd /c/Users/path_to_this_repository/
docker-compose build
docker-compose up
```