#!/bin/bash
echo "Updating the ubuntu package repo and installing docker"
sudo apt update -y
sudo apt install -y docker.io
sudo systemctl start docker
sudo usermod -aG docker ubuntu
sudo systemctl restart docker
echo "Installing nginx.."
sudo docker run -d -p 8080:80 nginx