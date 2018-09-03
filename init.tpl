#!/bin/bash
echo "Updating Jenkins VM and installing Jenkins"
yum -y update
yum -y install jenkins
echo "Finished installing Jenkins now"

exit 0 
