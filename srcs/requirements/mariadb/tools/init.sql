create database :DB_NAME;
create user ':USER'@'%' identified by ':UPASS';
grant all privileges on :DB_NAME.* to ':USER'@'%';
create user ':ADMIN'@'%' identified by ':APASS';
grant all privileges on *.* to ':ADMIN'@'%';
flush privileges;
