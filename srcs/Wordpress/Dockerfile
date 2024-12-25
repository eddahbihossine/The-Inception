FROM debian:bullseye-slim

# Install necessary packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl bash vim mariadb-client \
    php php-cli php-curl php-fpm php-mysqli php-json php-phar php-iconv \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN update-ca-certificates

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp


RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

WORKDIR /var/www/wordpress

COPY tools/start.sh /tmp/configure.sh

# Set entrypoint
ENTRYPOINT ["sh", "/tmp/configure.sh"]
