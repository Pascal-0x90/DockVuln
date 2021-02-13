#!/bin/bash

#############################################
# Author: Pascal
#
# Description:
#   Setup docker for the host.
#
# Main installs:
#   Docker-ce
#
# Residual Install:
#   apt-transport-https
#   ca-certificates
#   curl 
#   gnupg-agent 
#   software-properties-common 
#   git
#   docker-ce 
#   docker-ce-cli 
#   containerd.io 
#   python3 
#   python3-pip
#
# Containers Pulled:
#   hello-world
#############################################

# Colors
RED='\033[0;31m'
GREEN='\033[1;32m'
NC='\033[0m' # No Color

# Presets 
PLUS="[${GREEN}+${NC}]"
MIN="[${RED}-${NC}]"

setup_env () {
	# Taken from https://docs.docker.com/install/linux/docker-ce/ubuntu/
    # https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04

	# Print status
	printf "${PLUS} Checking for docker install\n"

	if which docker 1>/dev/null; then
		echo "Remove current version of docker?[yY/nN]"
		read resp
		if [[ ! $resp =~ ^[Yy]$ ]]; then
    		continue
		else
			# Remove old versions
    		sudo apt-get remove docker docker-engine docker.io containerd runc
		fi
	fi

	# Print status
	printf "${PLUS} Installing Docker dependencies\n"

	# Update the system
	sudo apt-get update
	
	# Install preq for getting docker setup
	if ! sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common git -y; then
		echo "${MIN} Docker Preq install FAILED!"
		exit 1
	fi
	
	# Check OS https://unix.stackexchange.com/questions/6345/how-can-i-get-distribution-name-and-version-number-in-a-simple-shell-script
	if [ -f /etc/os-release ]; then
	    # freedesktop.org and systemd
	    . /etc/os-release
	    OS=$NAME
	    VER=$VERSION_ID
	elif type lsb_release >/dev/null 2>&1; then
	    # linuxbase.org
	    OS=$(lsb_release -si)
	    VER=$(lsb_release -sr)
	elif [ -f /etc/lsb-release ]; then
	    # For some versions of Debian/Ubuntu without lsb_release command
	    . /etc/lsb-release
	    OS=$DISTRIB_ID
	    VER=$DISTRIB_RELEASE
	elif [ -f /etc/debian_version ]; then
	    # Older Debian/Ubuntu/etc.
	    OS=Debian
	    VER=$(cat /etc/debian_version)
	else
	    # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
	    OS=$(uname -s)
	    VER=$(uname -r)
	fi
	
	# So far only supporting debian, kali, and ubuntu
	os1="Ubuntu"
	os2="Kali GNU/Linux"
	os3="Debian GNU/Linux"
    	os4="Pop"
	
	# Different osses are weird
	if [ "$OS" == "$os1" ] || [ "$OS" == "$os4" ]; then
		# Key For ubuntu and pop
		sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
		sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	elif [ "$OS" == "$os2" ]; then
		# Key For kali
		sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
		sudo echo 'deb [arch=amd64] https://download.docker.com/linux/debian buster stable' | sudo tee /etc/apt/sources.list.d/docker.list
	elif [ "$OS" == "$os3" ]; then
		# Key for debian
		sudo echo 'deb [arch=amd64] https://download.docker.com/linux/debian buster stable' | sudo tee /etc/apt/sources.list.d/docker.list
		sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
	fi
	
	# Update with new repo in place
	sudo apt-get update 
	
	# Install docker packages
	sudo apt-get install docker-ce docker-ce-cli containerd.io python3 python3-pip -y
	
	# Clear screen and attempt to run docker hello-world
	echo "Verifying docker install:"
	sudo docker run hello-world
	printf "\n\nIf no hello world ran, rerun this setup script.\n"
	
    echo "+++++++++++++++++++++++++++++++++++++"
    echo "If this failed, run sudo apt-get install docker-ce docker-ce-cli containerd.io python3 python3-pip -y"
    echo "+++++++++++++++++++++++++++++++++++++"


    # Add user to group
    echo "Execute docker command without Sudo? (This adds your user to the docker group.) [yY/nN]"
    read choice

    # Both of the choices are if the user selects y/Y
    # If no, who cares. Not me. This is a cry for help.
    case $choice in 
        y)
            sudo usermod -aG docker ${USER}
            ;;
        Y)
            sudo usermod -aG docker ${USER}
            ;;
    esac
}

setup_dockercompose () {
    # Get compose packeage
    sudo curl -L "https://github.com/docker/compose/releases/download/1.28.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

    # Executable making it executable
    sudo chmod +x /usr/local/bin/docker-compose
}

# Check if we need to install binaries
if ! which docker 1>/dev/null || ! which docker-compose 1>/dev/null || ! which dockerd 1>/dev/null || ! which docker-init 1>/dev/null || ! which docker-proxy 1>/dev/null || ! which python 1>/dev/null || ! which python3 1>/dev/null; then
	# If any of these are not there, go ahead and just setup everything   
	setup_env
fi

