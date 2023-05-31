#!/bin/bash

#php-fpm                                                                                                                                                                                       
if [ ! -d /run/php ]; then                                                                                                                                                                     
        mkdir /run/php                                                                                                                                                                         
fi                                                                                                                                                                                             
echo "php-fpm is now running."                                                                                                                                                                 
exec php-fpm7.4 -F &                                                                                                                                                                            
#wordpress
if [ ! -d /var/www/Inception-website ]; then
        mkdir /var/www/Inception-website
	chmod 777 /var/www/Inception-website
fi

if [ ! -f /var/www/Inception-website/wp-config.php ]; then
        wp core download --path=/var/www/Inception-website --allow-root
        wp core config --path=/var/www/Inception-website --dbname=$DB_NAME --dbhost=$DB_HOST --dbuser=$USER --dbpass=$USER_PASSWORD --allow-root
        wp core install --path=/var/www/Inception-website --url=https://yakhoudr.42.fr --title=Inception --admin_user=$WORD_ADMIN --admin_password=$WORD_ADMIN_PASSWORD --admin_email=$WORD_ADMIN_EMAIL --allow-root                                                                                                                                                                          
        wp user create $WORD_USER $WORD_USER_EMAIL --role=$WORD_USER_ROLE --user_pass=$WORD_USER_PASS --path=/var/www/Inception-website --allow-root                                           
        wp plugin install redis-cache --activate --allow-root --path=/var/www/Inception-website
        wp config set WP_REDIS_HOST redis_server --allow-root --path=/var/www/Inception-website
        wp config set WP_REDIS_PORT 6379 --allow-root --path=/var/www/Inception-website
        wp redis enable --allow-root --path=/var/www/Inception-website
else                                                                                                                                                                                           
        echo "Wordpress is already installed."                                                                                                                                                 
fi                                                                                                                                                                                             
wait
