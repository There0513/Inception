#!bin/bash

sleep 10


if [ ! -e "/var/www/wordpress/wp-config.php" ]; then
	wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306 --path="/var/www/wordpress" --allow-root

# echo "create WP admin + user"
wp core install     --url=$DOMAIN_NAME --title="Welcome" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root --path='/var/www/wordpress'
wp user create		--allow-root $WP_USER --user_pass=$WP_USER_PASSWORD $WP_USER_MAIL --path="/var/www/wordpress"
fi

	
# if /run/php folder does not exist, create it
if [ ! -d /run/php ]; then
    mkdir ./run/php
fi
exec "$@"