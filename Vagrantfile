Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision "shell", path: "setup/install/docker.sh", privileged: false
  config.vm.provision "shell", path: "setup/install/consul.sh", privileged: false

  config.vm.define "node1" do |cs|
    cs.vm.hostname = "agent1"
    cs.vm.network "private_network", ip: "172.20.20.10"
  end

  config.vm.define "node2" do |cs|
    cs.vm.hostname = "agent2"
    cs.vm.network "private_network", ip: "172.20.20.11"
  end
end
