FROM debian:bullseye

# Install necessary packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl bash vim mariadb-client \
    php7.4 php7.4-cli php7.4-curl php7.4-fpm php7.4-mysqli php7.4-json php7.4-phar php7.4-iconv \
    ca-certificates wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Update CA certificates
RUN update-ca-certificates

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Prepare PHP-FPM runtime
RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

# Copy PHP configuration
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# COPY /tools/wp-config.php /var/www/wordpress/wp-config.php

# Set working directory for WordPress
WORKDIR /var/www/wordpress

# Copy entrypoint script
COPY tools/start.sh /tmp/configure.sh
RUN chmod +x /tmp/configure.sh

# Set entrypoint
ENTRYPOINT ["sh", "/tmp/configure.sh"]
