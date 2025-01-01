#!/bin/sh

# Create PHP runtime directory and set correct permissions
mkdir -p /run/php
chown -R www-data:www-data /run/php

# Wait for MySQL to be ready
echo "Waiting for MySQL to be ready..."
while ! mysqladmin ping -h"$SQL_HOST" -u"$DB_USER" -p"$DB_PASSWORD" --silent; do
    sleep 3
done
echo "MySQL is up and running!"

WP_DIR="/var/www/wordpress"

if [ ! -f "$WP_DIR/wp-config.php" ]; then
    echo "No wp-config.php found. Proceeding with a fresh installation."

    wp core download --path="$WP_DIR" --locale=en_US --allow-root
    chown -R www-data:www-data "$WP_DIR"

    wp config create --dbname="$DB_NAME" \
        --dbuser="$DB_USER" \
        --dbpass="$DB_PASSWORD" \
        --dbhost="$SQL_HOST" \
        --dbcharset="utf8" \
        --dbcollate="utf8_general_ci" \
        --allow-root

    if wp core install \
        --url="$WP_URL" \
        --title="$WP_TITLE" \
        --admin_user="$WP_ADMIN" \
        --admin_password="$WP_ADMINPWD" \
        --admin_email="$WP_EMAIL" \
        --allow-root; then
        echo "WordPress installed successfully!"
    else
        echo "WordPress installation failed."
        exit 1
    fi

    wp user create "$WP_USR" "$WP_EMAIL" --role=author --user_pass="$WP_PWD" --allow-root
else
    echo "wp-config.php already exists. Skipping installation."
fi

chown -R www-data:www-data "$WP_DIR"

echo "Starting PHP-FPM..."
exec php-fpm7.4 --nodaemonize
