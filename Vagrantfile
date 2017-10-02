Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision "shell", path: "setup/install/docker.sh", privileged: false
  config.vm.provision "shell", path: "setup/install/consul.sh", privileged: false
  config.vm.provision "shell", path: "setup/install/consul-template.sh", privileged: false

  config.vm.define "consul-server" do |cs|
    cs.vm.provision "shell", path: "setup/startup/consul-server.sh"
    cs.vm.hostname = "consul-server"
    cs.vm.network "private_network", ip: "172.20.20.10"
  end

  config.vm.define "lb" do |cs|
    cs.vm.provision "shell", path: "setup/startup/lb.sh"
    cs.vm.hostname = "load-balancer"
    cs.vm.network "private_network", ip: "172.20.20.11"
  end

  (1..3).each do |i|
    config.vm.define "web#{i}" do |web|
      web.vm.provision "shell", path: "setup/startup/web.sh"
      web.vm.hostname = "web#{i}"
      web.vm.network "private_network", ip: "172.20.20.2#{i}"
    end
  end
end
