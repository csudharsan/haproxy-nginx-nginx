#!/usr/bin/env bash
# sudo rpm -ivh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
sudo yum install epel-release -y
sudo yum install ansible -y

cat >> /etc/hosts << "EOL"
192.168.30.5 ansible-controller # ansible
192.168.30.2 Test1 # haproxy
192.168.30.3 Test2 # nginx
192.168.30.4 Test3 # nginx
EOL
