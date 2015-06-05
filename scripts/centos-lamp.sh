#!/bin/bash

# Update CentOS
yum update -y --exclude=kernel
# Tools
yum install -y vim git unzip screen
# Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig -add httpd
chkconfig httpd on
service httpd stop
rm -rf /var/www/html
ln -fs /vagrant /var/www/html
service httpd starti
# PHP
yum install -y php php-cli php-common php-devel php-mysql
# MySQL
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on
service mysqld start
# Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/aberthet/vagrant/master/files/index.php

service httpd restart
