#!/usr/bin/env bash
echo 'STARTING CONSUL FOR NODE 1'
consul agent -config-file=/vagrant/setup/agent/agent-one.json -config-dir=/etc/consul.d