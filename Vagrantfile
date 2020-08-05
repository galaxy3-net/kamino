# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  #config.vm.box = "file:///home/korben/kali/package.box"
  config.vm.box = "file:///Users/korbenkirscht/repositories/github/galaxy3/kamino/package.box"
  #config.vm.box = "galaxy3/kamino"
  config.vm.hostname = "kamino"
#  config.ssh.forward_agent = "true" 
#  ssh_info_public = "true"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  #config.vm.network "bridged"
  config.vm.network "forwarded_port", guest: 5901, host: 55042, host_ip: "127.0.0.1", auto_correct: true
  config.vm.network "forwarded_port", guest: 5902, host: 55043, host_ip: "127.0.0.1", auto_correct: true
  config.vm.network "forwarded_port", guest: 3389, host: 55044, host_ip: "127.0.0.1", auto_correct: true
  config.vm.network "forwarded_port", guest: 22, host: 55041, host_ip: "127.0.0.1", auto_correct: true
#  config.vm.network "forwarded_port", guest: 22, host: 22, auto_correct: true

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"


  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "private_network", ip: "10.55.55.4"
  #config.vm.network "public_network", auto_config: false
  #config.vm.network "forwarded_port", guest: 22, host: 5222, host_ip: "10.0.2.15"

  # manual ip
# config.vm.provision "shell",
#   run: "always",
#   inline: "ifconfig eth1 192.168.0.17 netmask 255.255.255.0 up"

  # manual ipv6
# config.vm.provision "shell",
#   run: "always",
#   inline: "ifconfig eth1 inet6 add fc00::17/7"

#  config.vm.network "private_network", type: "dhcp"
#  config.vm.network "public_network", type: "dhcp"
#    virtualbox__intnet: true

# config.vm.network :public_network
#config.vm.network "private_network", ip: "192.168.50.4",
#    virtualbox__intnet: true
#  config.vm.network "public_network", bridge: "enp1s0f0"  #, use_dhcp_assigned_default_route: true
#  config.vm.network "private_network", type: "dhcp", use_dhcp_assigned_default_route: true
#   config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"
#  config.vm.network "public_network", :bridge => "enp1s0f0", :use_dhcp_assigned_default_route => true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder	"../../bind",	"/bind", owner: "2001", group: "2001", create: true
  config.vm.synced_folder	"../../",	"/vagrant", owner: "2001", group: "2001"
  config.vm.synced_folder "../../repos", "/repos", owner: "2001", group: "2001", create: true
  config.vm.synced_folder "../../Downloads", "/Downloads", owner: "2001", group: "2001", create: true
  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
   config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
#    vb.gui = true
  
     # Customize the amount of memory on the VM:
     vb.name = "Kamino (Kali)"
     vb.memory = "4096"
     vb.cpus = "4"

	 vb.customize ['modifyvm', :id, '--nictype0', 'virtio']
     vb.customize ['modifyvm', :id, '--nictype1', 'virtio']
#     vb.customize ['modifyvm', :id, '--nicpromisc1', 'allow-all']
     vb.customize ['modifyvm', :id, '--nictype2', 'virtio']
#     vb.customize ['modifyvm', :id, '--nicpromisc2', 'allow-all']

   end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
   config.vm.provision "shell", inline: <<-SHELL
   exit
     apt-get update
     apt-get autoremove -y
     apt-get install -yq apache2 make docker docker.io net-tools ansible dos2unix supervisor htop
     apt-get clean
     apt-get auto-clean
     file /vagrant/functions/ready | grep CRLF && dos2unix -n /vagrant/functions/ready /usr/local/bin/ready
     file /vagrant/functions/ready | grep CRLF || cp /vagrant/functions/ready /usr/local/bin/ready
     chmod 0700 /usr/local/bin/ready
     ready

     /vagrant/bin/g3common

     pull_repos
#     rm /etc/resolv.conf
#     cp /vagrant/resolv.conf /etc/resolv.conf
#     . /ansible/bin/key_setup.sh
SHELL
end
