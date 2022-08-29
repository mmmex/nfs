# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = 'almalinux/8'

  config.vm.define "server" do |server|

    server.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end

    server.vm.host_name = 'server'
    server.vm.network :private_network, ip: "192.168.56.11"
    server.vm.provision "shell", name: "Init server script", path: "init_server.sh"
  end


  config.vm.define "client" do |client|
    client.vm.host_name = 'client'
    client.vm.network :private_network, ip: "192.168.56.12"
    client.vm.provider :virtualbox do |vb|
      vb.memory = "1024"
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
    client.vm.provision "shell", name: "Init client script", path: "init_client.sh"

  end

end
