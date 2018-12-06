FROM php:7.2-alpine

RUN apk update
RUN apk add rsync openssh

RUN apk add zlib-dev \
    && docker-php-ext-configure zip --with-zlib-dir=/usr \
    && docker-php-ext-install zip
