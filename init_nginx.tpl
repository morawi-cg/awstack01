#!/bin/bash
echo "Updating Nginx VM and installing Nginx"
yum -y update
yum -y install nginx
echo "Finished installing Nginx now"

exit 0 
