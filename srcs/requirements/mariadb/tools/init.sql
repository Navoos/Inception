create database if not exists :DB_NAME;
create user if not exists ':USER'@'%' identified by ':UPASS';
grant all privileges on :DB_NAME.* to ':USER'@'%' identified by ':UPASS';
flush privileges;
create user if not exists ':ADMIN'@'%' identified by ':APASS';
grant all privileges on *.* to ':ADMIN'@'%';
flush privileges;
