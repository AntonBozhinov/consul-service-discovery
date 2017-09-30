#!/usr/bin/env bash
echo 'STARTING CONSUL FOR LOAD BALANCER'
sudo nohup consul agent \
-config-file /vagrant/setup/agent/lb.json \
-config-dir /etc/consul.d \
</dev/null &>/dev/null &