FROM php:7.2

RUN apt-get update -y && apt-get -y install rsync openssh-client

RUN apt-get install -y zlib1g-dev && rm -rf /var/lib/apt/lists/* && docker-php-ext-configure zip --with-zlib-dir=/usr && docker-php-ext-install zip
