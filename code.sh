#! /bin/bash
sudo su -
yum install httpd -y
systemctl start httpd
chkconfig httpd on
