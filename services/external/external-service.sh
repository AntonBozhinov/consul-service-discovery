#!/usr/bin/env bash

echo "Registering google.com as an external service"
curl -X PUT -d '{"Datacenter": "dc1", "Node": "google",
   "Address": "www.google.com",
   "Service": {"Service": "search", "Port": 80}}' \
http://127.0.0.1:8500/v1/catalog/register