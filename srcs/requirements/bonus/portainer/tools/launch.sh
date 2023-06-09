#!/bin/bash

if [ ! -d /opt/portainer ]; then
	mkdir /tmp/portainer
	cd /tmp/portainer
	wget -q https://github.com/portainer/portainer/releases/download/2.18.3/portainer-2.18.3-linux-amd64.tar.gz
	tar -zxvf portainer-2.18.3-linux-amd64.tar.gz
	mv portainer /opt/portainer
	rm -f portainer-2.18.3-linux-amd64.tar.gz
fi

echo "portainer is now running."
exec /opt/portainer/portainer
