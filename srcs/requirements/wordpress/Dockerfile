from debian:stable

RUN apt-get update && apt-get install -y php
RUN apt-get update && apt-get install -y curl
RUN apt-get update && apt-get install -y php-fpm
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
