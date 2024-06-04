#!/bin/bash

## ? Install Jenkins

echo "--------------------Installing Jenkins--------------------"
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo ufw allow 8080
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo "--------------------Installing Java--------------------"
sudo apt-get update -y
sudo apt upgrade -y
sudo apt install default-jre
sudo apt install default-jdk