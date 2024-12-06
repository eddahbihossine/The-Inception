# Use the official Debian Buster image as the base
FROM debian:buster

# Update package list and install necessary packages
RUN apt-get update && apt-get install -y \
        php7.3 \
        php-fpm \
        php-mysql \
        wget \
        mariadb-client \
    && rm -rf /var/lib/apt/lists/*

# Download and extract WordPress
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www \
    && tar -xzf /var/www/wordpress-6.0-fr_FR.tar.gz -C /var/www \
    && rm /var/www/wordpress-6.0-fr_FR.tar.gz \
    && mkdir -p /var/www/html \
    && mv /var/www/wordpress/* /var/www/html \
    && chown -R www-data:www-data /var/www/html

# Install WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Copy the config creation script
COPY ./conf/start.sh /etc/wordpress/conf/start.sh
RUN chmod +x /etc/wordpress/conf/start.sh

# Copy the WordPress configuration file
# COPY conf/wp-config.php /var/www/html/wp-config.php

# Set up PHP-FPM directory
RUN mkdir -p /run/php \
    && chown -R www-data:www-data /run/php

# Expose the necessary port for PHP-FPM
EXPOSE 9000

# Start PHP-FPM in the foreground
CMD ["/etc/wordpress/conf/start.sh"]
