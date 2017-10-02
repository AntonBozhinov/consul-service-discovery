#!/usr/bin/env bash
echo 'STARTING CONSUL FOR LOAD BALANCER'

echo "COPY SERVICE DEFINITIONS"
sudo cp -a /vagrant/services/lb/ha-proxy.json /etc/consul.d/.

sudo nohup consul agent \
-config-file /vagrant/setup/agent/lb.json \
-config-dir /etc/consul.d \
</dev/null &>/dev/null &

echo "COPY HA-PROXY CONFIGURATION"
sudo cp -a /vagrant/services/lb/haproxy.cfg /home/vagrant/.
chmod +x /home/vagrant/haproxy.cfg



echo "START DOCKER HA-PROXY IMAGE"

docker run -d \
--name haproxy \
-p 80:80 \
--restart unless-stopped \
-v /home/vagrant/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg:ro \
haproxy

echo "START CONSUL TEMPLATE"

sudo nohup consul-template \
-config /vagrant/services/lb/lb.template.hcl \
</dev/null &>/dev/null &
