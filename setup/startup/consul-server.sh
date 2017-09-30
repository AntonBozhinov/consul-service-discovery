#!/usr/bin/env bash
echo 'STARTING CONSUL FOR CONSUL SERVER'
sudo nohup consul agent \
-config-file /vagrant/setup/agent/consul-server.json \
-config-dir /etc/consul.d \
</dev/null &>/dev/null &