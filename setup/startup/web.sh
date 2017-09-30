#!/usr/bin/env bash

echo 'STARTING CONSUL FOR NODE WEB'

ip=$(ifconfig eth1 | grep 'inet addr' | awk '{ print substr($2, 6) }')

sudo nohup consul agent \ 
-bind $ip \
-config-file /vagrant/setup/agent/web.json \
-config-dir /etc/consul.d \
</dev/null &>/dev/null &