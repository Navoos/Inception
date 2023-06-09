FROM debian:stable

RUN apt-get update && apt-get install -y php
RUN apt-get update && apt-get install -y php-fpm
RUN apt-get update && apt-get install -y php-mysql
RUN apt-get update && apt-get install -y mariadb-client
RUN apt-get update && apt-get install -y curl
COPY conf /etc/php/7.4/fpm/pool.d/www.conf
COPY tools/createwsite.sh /createwsite.sh
RUN chmod +x /createwsite.sh
CMD ["bash", "./createwsite.sh"]
