#! /usr/bin/env bash

# Test we can access the db container allowing for start
for i in {1..50}; do mysql -u root -p${MYSQL_ROOT_PASSWORD} -h db -e "show databases" && s=0 && break || s=$? && sleep 2; done
if [ ! $s -eq 0 ]; then exit $s; fi

# Init some stuff in db before leaving the floor to the application
mysql -u root -p${MYSQL_ROOT_PASSWORD} -h db -e "create database wp_bd"
mysql -u root -p${MYSQL_ROOT_PASSWORD} -h db -e "create table wp_bd.table_wp (id int unsigned not null auto_increment primary key, myval varchar(255) not null)"
mysql -u root -p${MYSQL_ROOT_PASSWORD} -h db -e "insert into wp_bd.table_wp (myval) values ('it'), ('bd'), ('wp')"
