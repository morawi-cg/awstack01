#!/bin/bash
echo "Updating Nginx VM and installing Nginx"
yum -y update
amazon-linux-extras install -y  nginx1.12
echo "Finished installing Nginx now"
systemctl start nginx
exit 0
