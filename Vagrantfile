# -*- mode: ruby -*-
# vi: set ft=ruby :

%w(vagrant-hostmanager vagrant-auto_network vagrant-nfs_guest).each do |plugin|
 unless Vagrant.has_plugin?(plugin)
   raise 'In order to use this box, you must install plugin: ' + plugin
 end
end

require_relative 'vagrant/inline/config'
require_relative 'vagrant/inline/nfs-plugin'

# Define Vagrantfile configuration options
VagrantApp::Config.option(:name, '')
  .option(:hostname, '') # Hostname
  .option(:domains, []) # Domain list
  .option(:user, 'app') # User name for share
  .option(:group, 'app') # Group name for share
  .option(:uid, Process.euid) # User ID for mapping
  .option(:gid, Process.egid) # Group ID for mapping

Vagrant.configure("2") do |config|


  # Prepare configuration and setup shell scripts for it
  current_file = Pathname.new(__FILE__)
  box_config = VagrantApp::Config.new


    config.vm.box = "creatuity/MageScotchBox"
    config.vm.box_version >= "2.0.3"
    config.vm.network "private_network", ip: "192.168.33.10"
    config.vm.provision :shell, path: "bootstrap.sh"
    config.vm.hostname = "magescotch"
    config.vm.synced_folder "./", "/var/www", type:"nfs_guest", create:true, 
		linux__nfs_options: %w(rw no_subtree_check all_squash insecure async),
    		map_uid: box_config.get(:uid).to_s,
    		map_gid: box_config.get(:gid).to_s,
    		owner: box_config.get(:user),
    		group: box_config.get(:group) 
    config.vm.provider "virtualbox" do |v|
  	v.memory = 4096
  	v.cpus = 4
 	v.customize [
      		"modifyvm", :id, 
      		"--paravirtprovider", "kvm" # for linux guest
    	]
    end
    config.ssh.forward_agent = true

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

end
