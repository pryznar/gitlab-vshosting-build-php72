FROM php:7.2

RUN apt-get update -y && apt-get -y install rsync openssh-client zip libzip-dev libpng-dev

ARG INSTALL_ZIP_ARCHIVE=true
RUN if [ ${INSTALL_ZIP_ARCHIVE} = true ]; then \
    # Install the zip extension
    pecl install zip && \
    docker-php-ext-enable zip \
;fi

RUN docker-php-ext-install gd
