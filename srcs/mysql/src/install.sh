#!bin/sh

rc default
/etc/init.d/mariadb setup #init mysql
rc-service mariadb start && mysql -u root mysql < /var/mysql_conf.sql && mysql wordpress -u root --password=  < /var/wordpress.sql
rc-sevice mariadb stop
/usr/bin/mysqld_safe