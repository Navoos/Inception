#!/bin/bash

# installing of wp-cli
curl -q -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /opt/wp-cli.phar
# php
if [ ! -d /run/php ]; then                                                                                                                                                                     
        mkdir /run/php                                                                                                                                                                         
fi                                                                                                                                                                                             
#wordpress
if [ ! -d /var/www/Inception-website ]; then
        mkdir /var/www/Inception-website
	chmod -R 777 /var/www/Inception-website
fi

if [ ! -f /var/www/Inception-website/wp-config.php ]; then
        /opt/wp-cli.phar core download --path=/var/www/Inception-website --allow-root
        /opt/wp-cli.phar config create --path=/var/www/Inception-website --dbname=$DB_NAME --dbhost=$DB_HOST --dbuser=$USER --dbpass=$USER_PASSWORD --allow-root
        /opt/wp-cli.phar core install --path=/var/www/Inception-website --url=https://yakhoudr.42.fr --title=Inception --admin_user=$WORD_ADMIN --admin_password=$WORD_ADMIN_PASSWORD --admin_email=$WORD_ADMIN_EMAIL --allow-root                                                                                                                                                                          
        /opt/wp-cli.phar user create $WORD_USER $WORD_USER_EMAIL --role=$WORD_USER_ROLE --user_pass=$WORD_USER_PASS --path=/var/www/Inception-website --allow-root                                           
        /opt/wp-cli.phar plugin install redis-cache --activate --allow-root --path=/var/www/Inception-website
        /opt/wp-cli.phar config set WP_REDIS_HOST redis_server --allow-root --path=/var/www/Inception-website
        /opt/wp-cli.phar config set WP_REDIS_PORT 6379 --allow-root --path=/var/www/Inception-website
        /opt/wp-cli.phar redis enable --allow-root --path=/var/www/Inception-website
else                                                                                                                                                                                           
        echo "Wordpress is already installed."                                                                                                                                                 
fi
#php-fpm                                                                                                                                                                                       
echo "php-fpm is now running."
exec php-fpm7.4 -F
