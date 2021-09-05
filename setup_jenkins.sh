#!/bin/bash


sudo apt install -y unzip wget
#Install JAVA

sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install -y openjdk-8-jdk

#Install Jenkins

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-get update
sudo apt-get install -y jenkins
sudo systemctl start jenkins

#Install Maven  ( on Jenkins machine )


cd /tmp ; sudo wget https://downloads.apache.org/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz
cd /tmp ; sudo tar -xzf apache-maven-3.8.1-bin.tar.gz -C  /opt/



#Set JAVA_HOME & MAVEN_HOME as environment variables on Jenkins machine
mkdir -p /home/backup
cp -p /etc/profile /home/backup/profile_`date +%d%b%Y-%H%M`
echo "MAVEN_HOME=/opt/apache-maven-3.8.1" >> /etc/profile
#echo "JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /etc/profile
echo "JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> /etc/profile
echo "PATH=\$JAVA_HOME/bin:\$MAVEN_HOME/bin:\$PATH" >> /etc/profile
source /etc/profile  ## to reload the configuration

exit
