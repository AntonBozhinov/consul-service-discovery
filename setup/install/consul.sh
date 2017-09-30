#!/usr/bin/env bash
sudo apt-get update
sudo apt-get install -y unzip

curl https://releases.hashicorp.com/consul/0.9.3/consul_0.9.3_linux_amd64.zip -o consul.zip

unzip consul.zip
sudo chmod +x consul
sudo mv consul /usr/bin/consul
sudo rm -f consul.zip

echo "Adding config dir"
sudo mkdir -p /etc/consul.d