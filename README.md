# docker-lamp
This repository contains an easy to customize local development environment containing php5, apache, mysql and phpmyadmin, built with docker.

## Requirements
Getting this to run, requires:
 - docker
 - docker-compose

## Installation
Setting up this development environment only requires you to:

```bash
git clone git@github.com:drupallerina/docker-lamp.git development_docker
cd development
docker-compose up -d
```

This will build the required image and launch 3 docker containers. One for apache2, php5 and additional development tools, one containing a mysql server and one containing phpmyadmin.
Your application will be available at http://172.17.0.1

## Configuration
Since it is unknown where you will clone this repository to, the docker-compose.yml does not mount volumes by default. To mount your projects into your docker container, add the following to the docker-compose.yml:

```
  volumes:
    - /c/Users/path_to_this_repository/www:/var/www/html
```

It is recommended to mount your projects directory to `/var/www/html` since it is the apache2 document root. But it is up to you if you want to change the configuration files or use vHosts.

### Customization
All configuration files are located in the `conf` directory. Once you have edited a configuration, you have to re-build the docker image. This can easily be done:

```
cd /c/Users/path_to_this_repository/
docker-compose build
docker-compose up
```

## Workflow
This stack mainly aims to work well with Jetbrains PHPStorm. Although it should also work with other IDEs.

### Debugging

Debugging is as easy as it gets. Simply use the [PhpStorm bookmarklets](https://www.jetbrains.com/phpstorm/marklets/) for Xdebug and let your [IDE listen](https://confluence.jetbrains.com/display/PhpStorm/Remote+debugging+in+PhpStorm+via+SSH+tunnel) for incoming debug connections.

### Remote PHP Interpreter
Since SSH is enabled by default in this environment. You can simply configure a remote interpreter via ssh.
Connect as `root@192.168.99.100:10022` with the password `docker`.

### phpmyadmin
Available at http://172.17.0.1:8080/
