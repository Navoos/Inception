#!/bin/bash

mkdir -p /var/www/Inception-website
cd /var/www/Inception-website
wp core download --allow-root
wp core config --dbname=$DB_NAME --dbhost=$DB_HOST --dbuser=$USER --dbpass=$USER_PASSWORD --allow-root

wp core install --url=https://yakhoudr.42.fr --title=Inception --admin=$WORD_ADMIN --admin_password=$WORD_ADMIN_PASSWORD --admin_email=$WORD_ADMIN_EMAIL --allow-root
