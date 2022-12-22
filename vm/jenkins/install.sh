#!/usr/bin/env bash

# Install package
yum install epel-release -y
yum install vim-enhanced -y
yum install net-tools -y

# Install apache
yum install httpd -y
# Start apache
sudo apachectl start

# # java
sudo yum install -y java-11-openjdk-devel.x86_64
echo -e 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.17.0.8-2.el7_9.x86_64\nPATH=$PATH:$JAVA_HOME/bin\nexport PATH' | sudo tee -a /etc/profile
source /etc/profile


# wget 설치
sudo yum -y install wget
sudo yum install -y ca-certificates


# maven 설치
sudo wget https://dlcdny.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz
tar xvzf apache-maven-3.8.6-bin.tar.gz
echo -e 'MAVEN_HOME=/usr/local/apple/Tools/apache-maven-3.8.6\nPATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin\nexport PATH
' | sudo tee -a /etc/profile.d/gradle.sh
source /etc/profile

# git 설치
sudo yum -y install git

# Jenkins 설치
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum -y install jenkins

# jenkins 실행
sudo systemctl start jenkins.service

# 방화벽 설치
sudo yum -y install firewalld
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --permanent --remove-port=9090/tcp
sudo firewall-cmd --permanent --zone=public --add-port=9090/tcp

sudo service jenkins start

#비밀번호 확인
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
