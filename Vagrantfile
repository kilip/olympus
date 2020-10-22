# -*- mode: ruby -*-
# vi: set ft=ruby :

# Specify minimum Vagrant version and Vagrant API version
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

# Set cpus to half number of host cpus
cpus = case RbConfig::CONFIG["host_os"]
  when /darwin/ then `sysctl -n hw.ncpu`.to_i / 2
  when /linux/ then `nproc`.to_i / 2
  else 2
end

NODES_NUM = 3
IP_BASE ="10.0.60."
IP_GATEWAY="10.0.60.1"
NET_IFACE = "eno1"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.insert_key = false

  (1..NODES_NUM).each do |i|
    HOST_INDEX=i+10
    config.vm.define "k8s-node-#{HOST_INDEX}" do |config|

      hostname = "k8s-node-#{i + 10}"

      memory = 2048

      config.vm.box = "bento/ubuntu-20.04"
      config.vm.network "public_network", ip: "#{IP_BASE}#{HOST_INDEX}", bridge: "#{NET_IFACE}"
      config.vm.hostname = hostname
      config.vm.provider "virtualbox"
      config.vm.provider :virtualbox do |v|
        v.linked_clone = true
        v.gui = false
        v.customize [
          'modifyvm', :id,
          "--cpus", cpus,
          "--memory", memory,
          "--name", hostname,
          "--ioapic", "on",
          '--audio', 'none',
          "--uartmode1", "file", File::NULL,
        ]
      end

      # delete default gw on eth0
      #config.vm.provision "shell",
      #  run: "always",
      #  inline: "ip route del default"

      # default router
      config.vm.provision "shell",
        run: "always",
        inline: "ip route add default via #{IP_GATEWAY}"
      
      config.vm.provision "shell",
        run: "always",
        inline: "route del -net 0.0.0.0 gw 192.168.178.1 netmask 0.0.0.0 dev eth0"
    end
  end
end