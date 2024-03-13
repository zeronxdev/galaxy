#!/bin/bash

wget https://getcomposer.org/installer -O composer.phar
php composer.phar
php composer.phar install

read -p "Nhập link website (https://linkweb.com): " web
read -p "Nhập tên database: " dbname
read -p "Nhập tên user database: " dbuser
read -p "Nhập mật khẩu database: " dbpass
echo

mysql -u $dbuser -p$dbpass $dbname < ./sql/galaxy.sql

cp ./config/.config.php.o ./config/.config.php
cp ./config/settings.json.o ./config/settings.json

sed -i "s|https://localhost.com|${web}|" ./config/settings.json
sed -i "s|\(\$_ENV\['db_database'\] = \)'[^']*';|\1'${dbname}';|" ./config/.config.php
sed -i "s|\(\$_ENV\['db_username'\] = \)'[^']*';|\1'${dbuser}';|" ./config/.config.php
sed -i "s|\(\$_ENV\['db_password'\] = \)'[^']*';|\1'${dbpass}';|" ./config/.config.php

php xcat Tool importAllSettings

php xcat User createAdmin

pathweb=$(dirname "$(readlink -f "$0")")
mkdir -p $pathweb/storage/framework/smarty/compile/
sudo chmod -R 777 $pathweb/storage/framework/smarty/compile/
echo "Xây dựng máy chủ GalaXyPanel thành công!"
