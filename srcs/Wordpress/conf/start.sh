#!/bin/bash

echo "Waiting for MariaDB to start..."

# Wait for MariaDB to be available
until mysqladmin ping -h "${DB_HOST}" -u"${DB_USER}" -p"${DB_PASSWORD}" --silent; do
    echo "Waiting for MariaDB..."
    sleep 5
done

echo "MariaDB is up. Proceeding with WordPress setup..."

# Download WordPress core if not present
if [ ! -f "/var/www/html/wp-config.php" ]; then
    echo "Downloading WordPress core files..."
    wp core download --allow-root --path='/var/www/html/'
fi

# Create wp-config.php if it doesn’t exist
if [ ! -f "/var/www/html/wp-config.php" ]; then
    echo "Creating the configuration file..."
    wp config create --allow-root \
        --dbname="${DB_NAME}" \
        --dbuser="${DB_USER}" \
        --dbpass="${DB_PASSWORD}" \
        --dbhost="${DB_HOST}" \
        --path='/var/www/html/' || echo "Failed to create wp-config.php."
else
    echo "wp-config.php already exists. Skipping configuration creation."
fi

# Proceed with WordPress installation if not already installed
if ! wp core is-installed --allow-root --path='/var/www/html/'; then
    echo "Installing WordPress..."
    wp core install --allow-root \
        --url="${WP_URL}" \
        --title="${WP_TITLE}" \
        --admin_user="${WP_ADMIN}" \
        --admin_password="${WP_ADMINPWD}" \
        --admin_email="${WP_EMAIL}" \
        --path='/var/www/html/'
else
    echo "WordPress is already installed. Skipping installation."
fi

# Start PHP-FPM
php-fpm7.3 -F
