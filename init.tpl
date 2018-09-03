#!/bin/bash
echo "Updating Jenkins VM and installing Jenkins"
yum -y update
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
yum -y install java-1.8.0-openjdk-headless.x86_64  jenkins
service jenkins start
echo "Finished installing Jenkins now"

exit 0
