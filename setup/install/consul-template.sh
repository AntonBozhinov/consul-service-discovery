#!/usr/bin/env bash

# Download consul template
URL=https://releases.hashicorp.com/consul-template/0.19.3/consul-template_0.19.3_linux_amd64.zip
curl $URL -o consul-template.zip

# Install consul template
unzip consul-template.zip
sudo chmod +x consul-template
sudo mv consul-template /usr/bin/consul-template

