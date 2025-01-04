#!/bin/bash

mkdir -p /var/run/mysqld
chown mysql:mysql /var/run/mysqld

mysqld_safe &

until mysqladmin ping -u root --silent; do
    echo "Waiting for MariaDB to be available..."
    sleep 2
done

mysql -u root -p"${SQL_ROOT_PASSWORD}" <<-EOSQL
    CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;
    CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%';

    FLUSH PRIVILEGES;
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
EOSQL

mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown || echo "Failed to shut down MySQL cleanly."

mysqld
