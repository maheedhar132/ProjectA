#!/bin/bash

# Update your package list
sudo apt update -y || sudo yum update -y || sudo dnf update -y || sudo zypper refresh

# Install prerequisites based on the package manager available
if command -v apt > /dev/null; then
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
elif command -v yum > /dev/null; then
    sudo yum install -y yum-utils device-mapper-persistent-data lvm2
elif command -v dnf > /dev/null; then
    sudo dnf install -y dnf-plugins-core
elif command -v zypper > /dev/null; then
    sudo zypper install -y curl ca-certificates
else
    echo "Unsupported package manager. Please install Docker manually."
    exit 1
fi

# Add Docker’s GPG key
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release && echo "$ID")/gpg | sudo apt-key add -

# Add the Docker repository based on the Linux distribution
if command -v apt > /dev/null; then
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt update -y
    sudo apt install -y docker-ce docker-ce-cli containerd.io
elif command -v yum > /dev/null; then
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    sudo yum install -y docker-ce docker-ce-cli containerd.io
elif command -v dnf > /dev/null; then
    sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
    sudo dnf install -y docker-ce docker-ce-cli containerd.io
elif command -v zypper > /dev/null; then
    sudo zypper addrepo https://download.docker.com/linux/opensuse/docker-ce.repo
    sudo zypper install -y docker-ce docker-ce-cli containerd.io
else
    echo "Unsupported package manager. Please install Docker manually."
    exit 1
fi

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Verify the installation
sudo docker run hello-world

echo "Docker has been installed successfully!"
