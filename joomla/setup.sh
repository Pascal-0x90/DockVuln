#!/bin/bash

apt-get remove docker docker-engine docker.io containerd runc
apt-get update
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    git -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

apt-key fingerprint 0EBFCD88

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update

apt-get install docker-ce docker-ce-cli containerd.io docker-compose -y

clear; echo "Verifying docker install:"
docker run hello-world
printf "\n\nIf no hello world ran, rerun this setup script.\n"

# Git clone
git clone https://github.com/Pascal-0x90/joomla-docker-example.git

cd ops; docker-compose up

