# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  # server environment
  config.vm.box = "precise32"

  # download vm if need it
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  # config port vm
  config.vm.network :forwarded_port, guest: 80, host: 8888, auto_correct: true  

  # folder to sync
  config.vm.synced_folder "./www", "/var/www", create: true, group: "www-data", owner: "www-data"

  # config shell script to run in the creation
  config.vm.provision :shell, path: "bootstrap.sh"

  #make sure that some things is running
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifest"
    puppet.manifest_file = "base.pp"
  end

  # Enable symlinks
  config.vm.provider "virtualbox" do |v|
    ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end
end
