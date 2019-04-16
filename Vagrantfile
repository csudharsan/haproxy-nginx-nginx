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
  config.vm.box = "base"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "source/", "/vagrant", :nfs => { :mount_options => ["dmode=777","fmode=777"] }
  config.vm.synced_folder "./", "/vagrant", type: 'rsync'

  # Configure the window for gatling to coalesce writes.
  if Vagrant.has_plugin?("vagrant-gatling-rsync")
      config.gatling.latency = 2.5
      config.gatling.time_format = "%H:%M:%S"
    end

    # Automatically sync when machines with rsync folders come up.
   config.gatling.rsync_on_startup = true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
   config.vm.provider :virtualbox do |v|
     v.customize ["modifyvm", :id, "--nictype1", "virtio"]   
   end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL

  # Ansible-Controller. This machines controls the behaviour of other machines.
  config.vm.define :ac do |ac|
      ac.vm.box = "centos/6"
      ac.vm.hostname = "ansible-controller"
      ac.vm.network :private_network, ip: "192.168.30.5"
      ac.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
      ac.vm.provision :shell, path: "ansible-controller-settings.sh"
      ac.vm.provision :shell, path: "all-machine-settings.sh"
      ac.vm.provision :file, source: "./celera_automation", destination: "/home/vagrant/"

  end

  # HAProxy Server Configuration
  config.vm.define :lb do |lb|
      lb.vm.box = "centos/6"
      lb.vm.hostname = "Test1"
      lb.vm.network :private_network, ip: "192.168.30.2"
      lb.vm.network "forwarded_port", guest: 80, host: 8001
      lb.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
      lb.vm.provision :shell, path: "all-machine-settings.sh"
  end

  # NGINX Web Server Configuration
  config.vm.define :webserver2 do |webserver|
      webserver.vm.box = "centos/6"
      webserver.vm.hostname = "Test2"
      webserver.vm.network :private_network, ip: "192.168.30.3"
      webserver.vm.network "forwarded_port", guest: 8000, host: 8003
      webserver.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
      webserver.vm.provision :shell, path: "all-machine-settings.sh"
  end

  config.vm.define :webserver3 do |webserver|
        webserver.vm.box = "centos/6"
        webserver.vm.hostname = "Test3"
        webserver.vm.network :private_network, ip: "192.168.30.4"
        webserver.vm.network "forwarded_port", guest: 8000, host: "8004"
        webserver.vm.provider "virtualbox" do |vb|
          vb.memory = "256"
        end
        webserver.vm.provision :shell, path: "all-machine-settings.sh"
   end
end
