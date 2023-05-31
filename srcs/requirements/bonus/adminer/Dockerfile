FROM debian:stable

RUN apt-get update && apt-get install -y wget
RUN apt-get update && apt-get install -y nginx
RUN apt-get update && apt-get install -y php-fpm
RUN apt-get update && apt-get install -y php-mysql
RUN apt-get update && apt-get install -y php
RUN mkdir -p /etc/nginx
COPY conf_nginx /etc/nginx/nginx.conf
COPY conf_php_fpm /etc/php/7.4/fpm/pool.d/www.conf
COPY tools/adminer.sh /adminer.sh
RUN chmod +x /adminer.sh

CMD ["./adminer.sh"]
