#!/usr/bin/env bash

# Install package
yum install epel-release -y
yum install vim-enhanced -y
yum install net-tools -y

# Install apache
yum install httpd -y

# Start apache
sudo apachectl start

# 패키지 설치
sudo yum install -y curl policycoreutils-python openssh-server perl
sudo systemctl enable sshd
sudo systemctl start sshd


# 방화벽 설정
# sudo yum -y install firewalld
# sudo systemctl start firewalld

# sudo firewall-cmd --permanent --add-service=https
# sudo firewall-cmd --permanent --add-service=http
# sudo systemctl reload firewalld

# 메일서버 설치
sudo yum install postfix
sudo systemctl enable postfix
sudo systemctl start postfix

# 패키지 저장소 등록
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash
sudo EXTERNAL_URL="http://192.168.56.104:90" yum install -y gitlab-ce


# 패스워드 확인
sudo cat /etc/gitlab/initial_root_password