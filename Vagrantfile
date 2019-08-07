Vagrant.configure("2") do |config|
  # centos
  # config.vm.box = "bento/centos-7.2"
  ####### Provision #######
  # config.vm.provision :shell, path: "bootstrap_centos.sh"
  

  ubuntu
  config.vm.box = "bento/ubuntu-19.04"
  config.vm.box_version = "201906.18.0"
  ###### Provision #######
  config.vm.provision :shell, path: "bootstrap.sh"

  # enable rdp port
  config.vm.network "forwarded_port", guest: 3389, host: 3389

  
end