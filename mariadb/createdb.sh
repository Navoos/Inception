#!/bin/bash

mysqld &
while ! mysqladmin ping -hlocalhost --silent; do
	sleep 1
done
mysql -u root < /docker-entrypoint-initdb.d/init.sql
wait
