#!/bin/bash

if [ ! -d /var/www/Inception-website ]; then
	mkdir /var/www/Inception-website
fi
exec nginx -g "daemon off;" &
if [ $? ]; then
	echo "nginx is running."
else
	echo "nginx failed to launch"
fi
wait
