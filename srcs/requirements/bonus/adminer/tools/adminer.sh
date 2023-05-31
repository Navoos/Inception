#!/bin/bash

if [ ! -d /run/adminer ]; then
	mkdir /run/adminer
fi

if [ ! -f /run/adminer/my-adminer.php ]; then
	wget -q https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O /run/adminer/my-adminer.php
fi

if [ ! -d /run/php ]; then
	mkdir /run/php
fi
php-fpm7.4
echo "You can now visit localhost:7000/my-adminer.php"
exec nginx -g "daemon off;"

