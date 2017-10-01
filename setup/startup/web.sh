#!/usr/bin/env bash

echo 'STARTING CONSUL FOR NODE WEB'

# Get the ip of the current machine
ip=$(ifconfig eth1 | grep 'inet addr' | awk '{ print substr($2, 6) }')

echo 'COPY SERVICE DEFINITIONS'
sudo cp -a /vagrant/services/. /etc/consul.d

# Start consul agent
sudo nohup consul agent \ 
-bind $ip \
-config-file /vagrant/setup/agent/web.json \
-config-dir /etc/consul.d \
</dev/null &>/dev/null &


echo 'STARTING THE NGINX SERVICE'

# Add a simple html page to be served
echo '<h1>Node: $(hostname), Ip: $ip</h1>' > /home/vagrant/ip.html

# Run docker nginx image
docker run -d \
--name web \
-p 8080:80 \
--restart unless-stopped \
-v /home/vagrant/ip.html:/usr/share/nginx/html/ip.html:ro \
nginx

