#!/bin/bash

if [ ! -d /var/www/Inception-website ]; then
	mkdir /var/www/Inception-website
fi
echo "nginx is running ..."
exec nginx -g "daemon off;"
