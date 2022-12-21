#!/usr/bin/env bash

# Install package
yum install epel-release -y
yum install vim-enhanced -y
yum install net-tools -y

# Install docker
sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Start docker
sudo systemctl start docker

# Install docker-compose
sudo curl -SL https://github.com/docker/compose/releases/download/v2.7.0/docker-compose-linux-x86_64 -o /usr/bin/docker-compose
sudo chown -R root:root /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose

# Generate mariaDB data docker folder
sudo mkdir -p /docker/mariaDB/data

# Install mariaDB
sudo docker-compose -f /docker/shoppingmall/docker-compose.yml up -d
