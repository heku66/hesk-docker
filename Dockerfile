FROM php:apache
LABEL maintainer="Soly He"
LABEL org.opencontainers.image.source="https://github.com/heku66/hesk-docker.git"
COPY --chown=www-data:www-data hesk /srv
COPY vhost.conf /etc/apache2/sites-enabled/000-default.conf
RUN apt-get update && \
    apt-get install -y libc-client-dev libkrb5-dev --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
    docker-php-ext-install mysqli imap && \
    a2enmod rewrite
