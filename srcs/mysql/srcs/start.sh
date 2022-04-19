#! /bin/sh

openrc reboot
/etc/init.d/mariadb setup
sudo pkill mariadb
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb start

mysql -u root -e "CREATE DATABASE db_wordpress;"
mysql -u root -e "GRANT ALL PRIVILEGES ON db_wordpress.* TO 'admin'@'%' IDENTIFIED BY 'admin';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' IDENTIFIED BY 'admin';"
mysql -u root -e "FLUSH PRIVILEGES;"

mysql -u root db_wordpress < db_wordpress.sql

telegraf
