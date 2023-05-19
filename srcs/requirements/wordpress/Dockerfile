from debian:stable

RUN apt-get update && apt-get install -y php
RUN apt-get update && apt-get install -y php-mysql
RUN apt-get update && apt-get install -y sendmail
RUN apt-get update && apt-get install -y mariadb-client
RUN apt-get update && apt-get install -y curl
RUN apt-get update && apt-get install -y php-fpm
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY tools/createwsite.sh /createwsite.sh
RUN chmod +x /createwsite.sh
CMD ["./createwsite.sh"]
