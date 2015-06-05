#!bin/bash

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
ln -s /vagrant /var/www/html
service httpd start
# PHP
yum install -y php php-cli php-common php-devel php-mysql
# MySQL
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on
service mysqld start
# Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/aberthet/vagrant/01dbb637467134ec1be3d4140c63bbab6330e688/files/index.php

service httpd restart
