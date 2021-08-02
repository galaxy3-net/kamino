# -*- mode: ruby -*-
# vi: set ft=ruby :

thedr_userid = "1001"
thedr_groupid = "1001"

Vagrant.configure("2") do |config|
  config.vm.box = "galaxy3/kamino"
  config.vm.box_version = "2021.01.13-0002"
  config.vm.hostname = "kamino"
#  config.vm.box = "kalilinux/rolling"
#  config.vm.box_version = "2020.4.0"

#  config.vm.network "private_network", ip: "10.55.55.4",
  config.vm.network "private_network", type: "dhcp",
    mac: "080027aaaaaa",
  	virtualbox__intnet: "g3main"
  config.vm.network "private_network", ip: "10.55.56.4",
  	virtualbox__intnet: "metasploitable3"
  config.vm.network "private_network", ip: "10.55.56.10",
  	virtualbox__intnet: "metasploitable3"

  config.vbguest.auto_update = false
  config.ssh.insert_key = false
  config.ssh.connect_timeout = 20

  config.vm.synced_folder	"../../bind",	"/bind", owner: thedr_userid, group: thedr_groupid, create: true
  config.vm.synced_folder	"../../",	"/vagrant", owner: thedr_userid, group: thedr_groupid
  config.vm.synced_folder "../../repos", "/repos", owner: thedr_userid, group: thedr_groupid, create: true
  config.vm.synced_folder "../../Downloads", "/home/vagrant/Downloads", owner: thedr_userid, group: thedr_groupid, create: true
 # config.vm.synced_folder "../../Downloads", "/Downloads", owner: "1001", group: "1001", mount_options: ["fmode=777", "dmode=777"], create: false

#  config.vm.synced_folder	"../../",	"/vagrant", owner: "2001", group: "2001"
#  config.vm.synced_folder "../../repos", "/repos", owner: "2001", group: "2001", create: true
#  config.vm.synced_folder "../../Downloads", "/Downloads", owner: "2001", group: "2001", create: true
#  #config.vm.synced_folder "../../log/nakadia", "/var/log/", owner: "2001", group: "2001", create: true

  config.vm.network "forwarded_port", guest: 22, host: 2200, id: "ssh", disabled: true
  config.vm.network "forwarded_port", guest: 5901, host: 24901, host_ip: "127.0.0.1", auto_correct: true
  config.vm.network "forwarded_port", guest: 5902, host: 24902, host_ip: "127.0.0.1", auto_correct: true
  config.vm.network "forwarded_port", guest: 3389, host: 24389, host_ip: "0.0.0.0", auto_correct: true
  config.vm.network "forwarded_port", guest: 22, host: 24022, host_ip: "0.0.0.0", auto_correct: true
  config.vm.network "forwarded_port", guest: 80, host: 24080, host_ip: "127.0.0.1", auto_correct: true
  config.vm.network "forwarded_port", guest: 8080, host: 24880, host_ip: "127.0.0.1", auto_correct: true

#  config.vm.provision "file", source: "playbook.yml", destination: "playbook.yml"
#  config.vm.provision "file", source: "../../functions", destination: "functions/bin"
#  config.vm.provision "file", source: "hosts", destination: "hosts"
#  config.vm.provision "file", source: "requirements.yml", destination: "requirements.yml"
#  config.vm.provision "file", source: "ansible", destination: "roles/ansible"

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    # Uncomment ONE the lines below to control how much RAM Vagrant gives the VM
    # We recommend starting with 4096 (4Gb), and moving down if necessary
    # vb.memory = "1024" # 1Gb
    # vb.memory = "2048" # 2Gb
    # vb.memory = "4096" # 4Gb
    vb.name = "Kamino (Kali Linux)"
    vb.gui = false
  end

  config.vm.provision "shell", inline: <<-SHELL
  sudo mkdir -p /Downloads
  sudo /sbin/mount.vboxsf Downloads /Downloads
#     tr -d '\r' < /vagrant/functions/ready >/usr/local/bin/ready && chmod 0700 /usr/local/bin/ready
#     /usr/local/bin/ready
#     #/usr/local/bin/install_pkgs
#     #/usr/local/bin/pull_repos
#     #iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
#     #iptables -A INPUT -p tcp --dport 3389 -m
#   #config.vm.provision "shell", inline: <<-SHELL state --state NEW -j ACCEPT

#    # setup_xrdp
#    # setup_vnc
#    ls -l /home/vagrant
SHELL
#  config.vm.provision "ansible_local" do |ansible|
#    ansible.playbook = "/home/vagrant/playbook.yml"
#    ansible.galaxy_role_file = "/home/vagrant/requirements.yml"
#    inventory_path = "/home/vagrant/hosts"
#  end
end