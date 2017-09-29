#!/usr/bin/env bash
echo 'STARTING CONSUL FOR NODE 2'
consul agent -config-file=/vagrant/setup/agent/agent-two.json -config-dir=/etc/consul.d