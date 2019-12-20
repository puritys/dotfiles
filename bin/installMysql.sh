# Centos 7
rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
yum install mysql-community-server
sudo /usr/bin/systemctl enable mysqld
sudo /usr/bin/systemctl start mysqld
