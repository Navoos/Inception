from debian:stable

RUN apt-get update && apt-get install -y php
RUN apt-get update && apt-get install -y php-fpm
RUN apt-get update && apt-get install -y php-mysql
RUN apt-get update && apt-get install -y sendmail
RUN apt-get update && apt-get install -y mariadb-client
RUN apt-get update && apt-get install -y curl
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY tools/createwsite.sh /createwsite.sh
COPY conf ./etc/php/7.4/fpm/pool.d/www.conf
RUN chmod +x /createwsite.sh
CMD ["./createwsite.sh"]
