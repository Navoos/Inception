#!/bin/bash

sed -i "s/\:DB_NAME/${DB_NAME}/g" /mariadb-conf.d/init.sql
sed -i "s/\:USER/${USER}/g" /mariadb-conf.d/init.sql
sed -i "s/\:UPASS/${USER_PASSWORD}/g" /mariadb-conf.d/init.sql
sed -i "s/\:ADMIN/${ADMIN}/g" /mariadb-conf.d/init.sql
sed -i "s/\:APASS/${ADMIN_PASSWORD}/g" /mariadb-conf.d/init.sql

mysqld &

while ! mysqladmin ping -hlocalhost --silent; do
	sleep 1
done
mysql -u root < /mariadb-conf.d/init.sql
wait 
