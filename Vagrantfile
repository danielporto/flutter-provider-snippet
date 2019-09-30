# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "bento/ubuntu-18.04"

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
  config.vm.network "forwarded_port", guest: 3389, host: 3389, host_ip: "0.0.0.0"

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
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true

  #   # customize the number of CPUs
      vb.cpus = 4
  #   # Customize the amount of memory on the VM:
      vb.memory = "2048"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
    # java
    # add-apt-repository -y ppa:openjdk-r/ppa
    # apt-get update
    # apt install -y openjdk-8-jdk

    # Lubuntu minimum gui (working) https://code.luasoftware.com/tutorials/linux/lubuntu-setup-remote-desktop-with-xrdp/
    apt-get install -y lubuntu-core xrdp vnc4server
    echo "lxsession -e LXDE -s Lubuntu" > /home/vagrant/.xsession
    # make sure the user configuration has correct permissions
    chown vagrant.vagrant /home/vagrant/.xsession

    # extra packages
    apt install -y firefox \
                  sshuttle \
                  fish \
                  curl \
                  git \
                  unzip \
                  xz-utils \
                  tmux \
                  cpu-checker \
                  sed \
                  aria2 \
                  --no-install-recommends

    # install vscode 
    snap install code --classic

    # Docker
    # https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04
    apt install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
    apt update && apt install -y docker-ce
    # allow vagrant user to run docker without sudo
    usermod -aG docker vagrant

    # java 
    apt install -y openjdk-11-jdk lib32stdc++6
    # snap install android-studio --classic
    export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
    PATH=$PATH:/usr/lib/jvm/java-11-openjdk-amd64/bin

    INSTALL_DIR=/home/vagrant
    # deploy android sdk
    aria2c -c "https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip" -d /tmp
    unzip -qq "/tmp/sdk-tools-linux-4333796.zip" -d "$INSTALL_DIR/android-sdk"

    # adding java missing libraries
    mkdir "$INSTALL_DIR/android-sdk/tools/bin/jaxb_lib"
    aria2c -c  http://central.maven.org/maven2/javax/activation/activation/1.1.1/activation-1.1.1.jar -d "$INSTALL_DIR/android-sdk/tools/bin/jaxb_lib/activation.jar" 
    aria2c -c  http://central.maven.org/maven2/javax/xml/jaxb-impl/2.1/jaxb-impl-2.1.jar -d "$INSTALL_DIR/android-sdk/tools/bin/jaxb_lib/jaxb-impl.jar" 
    aria2c -c  http://central.maven.org/maven2/org/glassfish/jaxb/jaxb-xjc/2.3.2/jaxb-xjc-2.3.2.jar -d "$INSTALL_DIR/android-sdk/tools/bin/jaxb_lib/jaxb-xjc.jar" 
    aria2c -c  http://central.maven.org/maven2/org/glassfish/jaxb/jaxb-core/2.3.0.1/jaxb-core-2.3.0.1.jar -d "$INSTALL_DIR/android-sdk/tools/bin/jaxb_lib/jaxb-core.jar" 
    aria2c -c  http://central.maven.org/maven2/javax/xml/bind/jaxb-api/2.3.1/jaxb-api-2.3.1.jar -d "$INSTALL_DIR/android-sdk/tools/bin/jaxb_lib/jaxb-api.jar" 

    APP_HOME=$INSTALL_DIR/android-sdk/tools
    CLASSPATH_TO_ADD="CLASSPATH=$APP_HOME\/bin\/jaxb_lib\/activation.jar:$APP_HOME\/bin\/jaxb_lib\/jaxb-impl.jar:$APP_HOME\/bin\/jaxb_lib\/jaxb-xjc.jar:$APP_HOME\/bin\/jaxb_lib\/jaxb-core.jar:$APP_HOME\/bin\/jaxb_lib\/jaxb-jxc.jar:$APP_HOME\/bin\/jaxb_lib\/jaxb-api.jar:\\\$CLASSPATH"
    echo $CLASSPATH_TO_ADD
    sed -Ein "/^CLASSPATH=\\\$APP_HOME\/lib*/a $CLASSPATH_TO_ADD" "$INSTALL_DIR/android-sdk/tools/bin/avdmanager" || (echo "sed 1 failed" )
    sed -Ein "/^CLASSPATH=\\\$APP_HOME\/lib*/a $CLASSPATH_TO_ADD" "$INSTALL_DIR/android-sdk/tools/bin/sdkmanager" || (echo "sed 2 failed" )
    
    # Accept licenses
    # https://gist.github.com/Darkness4/cea964757ab0088940d89b3b30c9ef39
    PATH=$INSTALL_DIR/android-sdk/tools/bin:$PATH
    # need the new path right now
    export $PATH
    mkdir $INSTALL_DIR/.android
    echo 'count=0' > $INSTALL_DIR/.android/repositories.cfg
    yes | sdkmanager --licenses
    sdkmanager "tools" \
        "platforms;android-28" \
        "build-tools;29.0.1" \
        "platform-tools" \
    yes | sdkmanager --licenses || echo "Failed"

    # make paths persistent    
    P1="PATH=$INSTALL_DIR/android-sdk/tools/bin:\\\$PATH"
    P2="PATH=$INSTALL_DIR/android-sdk/platform-tools:\\\$PATH"
    P3="ANDROID_HOME=$INSTALL_DIR/android-sdk"
    P4="ANDROID_SDK_ROOT=$INSTALL_DIR/android-sdk"
    P5="ANDROID_SDK_HOME=/home/vagrant"
    P6="JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64"
    P7="PATH=\\\$PATH:/usr/lib/jvm/java-11-openjdk-amd64/bin"

    HOME_PROFILE=/home/vagrant/.profile
    for i in $P1 $P2 $P3 $P4 $P5 $P6 $P7; do
      grep -qxF "$i" $HOME_PROFILE || echo "$i" >> $HOME_PROFILE
    done;

    # deploy flutter
    aria2c -c https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.9.1+hotfix.2-stable.tar.xz -d /tmp
    # tar xf /tmp/flutter_linux_v1.9.1+hotfix.2-stable.tar.xz -C /home/vagrant --owner=vagrant
    PATH=$HOME/flutter/bin:$PATH

    P1="PATH=$INSTALL_DIR/flutter/bin:\\\$PATH"
    P2="PATH=$INSTALL_DIR/flutter/bin/cache/dart-sdk/bin:\\\$PATH"
    
    for i in $P1 $P2; do
      grep -qxF "$i" $HOME_PROFILE || echo "$i" >> $HOME_PROFILE
    done;
      
    
    # setup emulator
    sdkmanager "emulator"
    P1="PATH=\$ANDROID_HOME/emulator:\$PATH" 
    PATH=\$ANDROID_HOME/emulator:\$PATH
    for i in $P1; do
      grep -qxF "$i"  || echo "$i" >> $HOME_PROFILE
    done;
    # need the new path right now
    export PATH
    sdkmanager "system-images;android-28;default;x86"
    yes | sdkmanager --licenses
    avdmanager  --verbose create avd --force --name "Nexus_5X_API_28" --device "Nexus 5X"  --package "system-images;android-28;default;x86" --abi "x86"
       

    # remove duplicates from PATH:
    echo "# deduplicated expanded path:" >> $HOME_PROFILE
    echo "PATH=$(echo \$PATH | awk -v RS=: -v ORS=: '!(\$0 in a) {a[\$0]; print}')" >> $HOME_PROFILE 
    sed -i '/^:/ d' $HOME_PROFILE
    
    # clean after install
    apt clean all
    
    # make sure permissions are right
    chown -R vagrant.vagrant /home/vagrant
    SHELL
  end
