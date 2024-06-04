#!/bin/bash

## ? Install Ansible & Docker


echo "--------------------Installing Ansible--------------------"
sudo apt update -y
sudo apt install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

echo "--------------------Installing Docker--------------------"
sudo apt update
sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo systemctl status docker

echo "--------------------Add Docker to Sudo group--------------------"
sudo groupadd docker && sudo usermod -aG docker $USER && newgrp docker && sudo chmod 777 /var/run/docker.sock

echo "--------------------Installing Java--------------------"
sudo apt-get update -y
sudo apt upgrade -y
sudo apt install default-jre
sudo apt install default-jdk