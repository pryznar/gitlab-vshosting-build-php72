FROM php:7.2

RUN apt-get update -y && apt-get -y install rsync openssh-client zip libzip-dev libfreetype6-dev libjpeg62-turbo-dev libpng12-dev \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) gd

ARG INSTALL_ZIP_ARCHIVE=true
RUN if [ ${INSTALL_ZIP_ARCHIVE} = true ]; then \
    # Install the zip extension
    pecl install zip && \
    docker-php-ext-enable zip \
;fi
