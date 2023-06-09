#!/bin/bash

sed -i "s/\:DB_NAME/${DB_NAME}/g" /mariadb-conf.d/init.sql
sed -i "s/\:USER/${DB_USER}/g" /mariadb-conf.d/init.sql
sed -i "s/\:UPASS/${USER_PASSWORD}/g" /mariadb-conf.d/init.sql
sed -i "s/\:ADMIN/${ADMIN}/g" /mariadb-conf.d/init.sql
sed -i "s/\:APASS/${ADMIN_PASSWORD}/g" /mariadb-conf.d/init.sql

if [ ! -d /var/run/mysqld ]; then
	mkdir /var/run/mysqld
fi
if [ ! -d /run/mysqld ]; then
	mkdir /run/mysqld
fi

if [ ! -d /var/lib/mysql/mysql ]; then
	mysql_install_db --user=root
fi

service mariadb start
while ! mysqladmin ping -hlocalhost --silent 2>/dev/null; do
	sleep 1
done
mysql -u root < /mariadb-conf.d/init.sql
service mariadb stop
while  mysqladmin ping -hlocalhost --silent 2>/dev/null; do
	sleep 1
done
exec mysqld -u root
