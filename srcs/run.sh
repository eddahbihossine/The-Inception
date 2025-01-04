#

sudo rm -rf data
MARIADB_DIR=data/mariadb
WORDPRESS_DIR=data/wp

DIR=data
mkdir -p $DIR
mkdir -p $MARIADB_DIR
mkdir -p $WORDPRESS_DIR






sudo chown -R $(whoami) $DIR
chmod -R 755 $DIR
chmod -R 755 $MARIADB_DIR
chmod -R 755 $WORDPRESS_DIR