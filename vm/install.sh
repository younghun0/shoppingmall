#!/usr/bin/env bash

# Install package
yum install epel-release -y
yum install vim-enhanced -y
yum install net-tools -y

# Install apache
yum install httpd -y

# Start apache
sudo apachectl start