#!/bin/sh

mkdir -p /run/php
chown -R www-data:www-data /run/php

while ! mysqladmin ping -h"$SQL_HOST" -u"$DB_USER" -p"$DB_PASSWORD" --silent; do
    sleep 3
done

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    wp core download --path=/var/www/wordpress/ --locale=en_US --allow-root
    chown -R www-data:www-data /var/www/wordpress/
    wp config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASSWORD" --dbhost="$SQL_HOST" --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root

    if ! wp core install --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMINPWD" --admin_email="$WP_EMAIL" --allow-root; then
        echo "WordPress installation failed."
        exit 1
    fi
    wp user create "$WP_USR" "$WP_EMAIL" --role=author --user_pass="$WP_PWD" --allow-root

    wp theme install SaasLauncher --activate --allow-root
else
    echo "WordPress is already installed. Skipping installation."
fi

php-fpm7.4 --nodaemonize
