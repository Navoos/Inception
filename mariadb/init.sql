create database Wordpress;

create user 'navoos'@'%';

grant all privileges on Wordpress.* to 'navoos'@'%';
flush privileges;
