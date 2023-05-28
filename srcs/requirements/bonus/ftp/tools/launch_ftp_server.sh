#!/bin/bash

if [ ! -d /var/run/vsftpd 2> /dev/null ]; then
	mkdir /var/run/vsftpd
	mkdir /var/run/vsftpd/empty
fi

if [[ ! $(id wordpressuser 2> /dev/null) ]]; then
	echo "Creating ftp user ..."
	useradd -p $(openssl passwd -1 pass) wordpressuser
fi


if [ ! -d /home/wordpressuser ]; then
	mkdir /home/wordpressuser/
	mkdir /home/wordpressuser/files
	chown -R wordpressuser /home/wordpressuser
fi
echo "FTP server is running."
exec vsftpd /etc/vsftpd.conf
