FROM debian:stable 

RUN apt-get update && apt-get -y install mariadb-server

RUN mysql_install_db
RUN mkdir -p var/run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql /etc/mysql /run/mysqld /var/run/mysqld 
COPY my.cnf /etc/mysql/my.cnf


COPY init.sql /docker-entrypoint-initdb.d/init.sql
COPY createdb.sh /createdb.sh
RUN chmod +x /createdb.sh
CMD ["/createdb.sh"]
