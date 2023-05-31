#!/bin/bash

if [ ! -d ~/data ]; then
	mkdir ~/data
	mkdir ~/data/wordpress
	mkdir ~/data/mariadb
fi
chmod -R 777 ~/data
echo "folder for bind mounts in now created."
