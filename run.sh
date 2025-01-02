#

MARIADB_DIR=$(pwd)/data/mariadb
WORDPRESS_DIR=$(pwd)/data/wp

DIR=$(pwd)/data
mkdir -p $DIR
mkdir -p $MARIADB_DIR
mkdir -p $WORDPRESS_DIR






sudo chown -R $(whoami) $DIR
chmod -R 755 $DIR