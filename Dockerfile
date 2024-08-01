FROM webdevops/php-apache:8.3-alpine
LABEL maintainer="solyhe"
LABEL org.opencontainers.image.source="https://github.com/luketainton/hesk-docker"
COPY --chown=www-data:www-data hesk /srv
COPY vhost.conf /etc/apache2/sites-enabled/000-default.conf
RUN apk update && \
    apk add libc-client-dev libkrb5-dev && \
    apk cache clean && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
    docker-php-ext-install mysqli imap && \
    a2enmod rewrite
