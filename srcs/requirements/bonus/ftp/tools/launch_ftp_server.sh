#!/bin/bash

if [ ! -d /var/run/vsftpd 2> /dev/null ]; then
	mkdir /var/run/vsftpd
	mkdir /var/run/vsftpd/empty
fi

if [[ ! $(id $FTP_USER 2> /dev/null) ]]; then
	echo "Creating ftp user ..."
	useradd -p $(openssl passwd -1 $FTP_PASS) $FTP_USER 
fi


if [ ! -d /home/$FTP_USER ]; then
	mkdir /home/$FTP_USER/
	chown -R $FTP_USER /home/$FTP_USER
fi
echo "FTP server is running."
exec vsftpd /etc/vsftpd.conf
