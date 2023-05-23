from debian:stable

RUN apt-get update && apt-get install -y mariadb-server
COPY ./tools/createdb.sh /createdb.sh
COPY ./tools/init.sql /mariadb-conf.d/init.sql
COPY ./conf /etc/mysql/my.cnf

RUN chmod +x /createdb.sh 

CMD ["./createdb.sh"]

