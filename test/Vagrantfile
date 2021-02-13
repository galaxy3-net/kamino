# -*- mode: ruby -*-
# vi: set ft=ruby :

thedr_userid = "2001"
thedr_groupid = "2001"

Vagrant.configure("2") do |config|
  config.vm.box = "galaxy3/dummy"
  #config.vm.box_version = "2021.01.05-0000"
  #config.vm.box = "kalilinux/rolling"
  config.vm.hostname = "kamino-build"
  #config.vm.box_version = "2020.4.0"
  config.vm.box_url = "file:///home/korben/kali.box"
  # config.disksize.size = '75GB'

  config.vm.network "private_network", ip: "10.55.55.4",
  	virtualbox__intnet: "g3main"
  config.vm.network "private_network", ip: "10.55.56.4",
  	virtualbox__intnet: "metasploitable3"
  config.vm.network "private_network", ip: "10.55.56.10",
  	virtualbox__intnet: "metasploitable3"
  #config.vm.network "private_network", ip: "10.55.55.4"

  config.vbguest.auto_update = false

  config.ssh.insert_key = false
  config.ssh.connect_timeout = 20

  config.vm.synced_folder	"../../bind",	"/bind", owner: thedr_userid, group: thedr_groupid, create: true
  config.vm.synced_folder	"../../",	"/vagrant", owner: thedr_userid, group: thedr_groupid
  config.vm.synced_folder "../../repos", "/repos", owner: thedr_userid, group: thedr_groupid, create: true
  config.vm.synced_folder "../../Downloads", "/Downloads", owner: thedr_userid, group: thedr_groupid, create: true

  config.vm.network "forwarded_port", guest: 22, host: 2200, id: "ssh", disabled: true
  config.vm.network "forwarded_port", guest: 5901, host: 24901, host_ip: "127.0.0.1", auto_correct: true
  config.vm.network "forwarded_port", guest: 5902, host: 24902, host_ip: "127.0.0.1", auto_correct: true
  config.vm.network "forwarded_port", guest: 3389, host: 24389, host_ip: "0.0.0.0", auto_correct: true
  config.vm.network "forwarded_port", guest: 22, host: 24022, host_ip: "0.0.0.0", auto_correct: true
  config.vm.network "forwarded_port", guest: 80, host: 24080, host_ip: "127.0.0.1", auto_correct: true
  config.vm.network "forwarded_port", guest: 8080, host: 24880, host_ip: "127.0.0.1", auto_correct: true


  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    # Uncomment ONE the lines below to control how much RAM Vagrant gives the VM
    # We recommend starting with 4096 (4Gb), and moving down if necessary
    # vb.memory = "1024" # 1Gb
    # vb.memory = "2048" # 2Gb
    # vb.memory = "4096" # 4Gb
    vb.name = "Kamino (Kali) Test"
    vb.gui = false

  end
end