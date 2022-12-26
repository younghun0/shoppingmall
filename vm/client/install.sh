#!/usr/bin/env bash

# Install package
yum install epel-release -y
yum install vim-enhanced -y
yum install net-tools -y

# Install apache
yum install httpd -y

# Start apache
sudo apachectl start

# java 설치
yum -y install java-1.8.0-openjdk-devel.x86_64


# wget 설치
sudo yum -y install wget
sudo yum install -y ca-certificates

# Tomcat 설치
cd /usr/local/
wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.84/bin/apache-tomcat-8.5.84.tar.gz
sudo tar -zxf apache-tomcat-8.5.84.tar.gz

# Tomcat 실행
sudo chmod 777 /usr/local/apache-tomcat-8.5.84/bin/
cd /usr/local/apache-tomcat-8.5.84/bin/
sudo ./startup.sh

# 패키지 설치
sudo yum -y install gcc gcc-c++ httpd-devel


# tomcat-connectors 설치
cd /usr/local
sudo wget https://dlcdn.apache.org/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.48-src.tar.gz
sudo tar -zxf tomcat-connectors-1.2.48-src.tar.gz
cd tomcat-connectors-1.2.48-src/native/
sudo ./configure --with-apxs=/usr/bin/apxs
sudo make
sudo make install

# 설정변경
echo -e 'LoadModule jk_module modules/mod_jk.so
<VirtualHost *:80>
	ServerName localhost
  	JkMount /* tomcat
</VirtualHost>
<IfModule mod_jk.c>
	JkWorkersFile conf/workers.properties 
 	JkShmFile run/mod_jk.shm     
 	JkLogFile logs/mod_jk.log     
 	JkLogLevel info     
 	JkLogStampFormat "[%y %m %d %H:%M:%S] " 
</IfModule>' | sudo tee -a /etc/httpd/conf/httpd.conf

echo -e 'worker.list=tomcat
worker.tomcat.port=8009 
worker.tomcat.host=localhost 
worker.tomcat.type=ajp13 
worker.tomcat.lbfactor=1' | sudo tee -a /etc/httpd/conf/workers.properties
# sudo vi /usr/local/apache-tomcat-8.5.84/conf/server.xml
sudo sed -i '115d' /usr/local/apache-tomcat-8.5.84/conf/server.xml
sudo sed -i '119d' /usr/local/apache-tomcat-8.5.84/conf/server.xml
sudo sed -i '117 i\ secretRequired="false"' /usr/local/apache-tomcat-8.5.84/conf/server.xml
sudo sed -i '116s/.*/address="0.0.0.0"/g' /usr/local/apache-tomcat-8.5.84/conf/server.xml


# 재시작
sudo systemctl restart httpd
cd /usr/local/apache-tomcat-8.5.84/bin/
sudo ./shutdown.sh
sudo ./startup.sh