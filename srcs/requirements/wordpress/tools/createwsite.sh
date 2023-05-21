#!/bin/bash

#wordpress
if [ ! -d /var/www/Inception-website ]; then
	mkdir /var/www/Inception-website
fi

if [ ! -f /var/www/Inception-website/wp-config.php ]; then
	wp core download --path=/var/www/Inception-website --allow-root
	wp core config --path=/var/www/Inception-website --dbname=$DB_NAME --dbhost=$DB_HOST --dbuser=$USER --dbpass=$USER_PASSWORD --allow-root

	wp core install --path=/var/www/Inception-website --url=https://yakhoudr.42.fr --title=Inception --admin_user=$WORD_ADMIN --admin_password=$WORD_ADMIN_PASSWORD --admin_email=$WORD_ADMIN_EMAIL --allow-root
else
	echo "Wordpress is already installed."
fi
#php-fpm
if [ ! -d /run/php ]; then
	mkdir /run/php
fi
echo "php-fpm is now running."
exec php-fpm7.4 -F
