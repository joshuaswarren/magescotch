require 'vagrant-nfs_guest/guests/ubuntu/cap/nfs_server'

module VagrantPlugins
  module VagrantAppPlugin
    module Cap
      class NFSServer < ::VagrantPlugins::SyncedFolderNFSGuest::GuestUbuntu::Cap::NFSServer
        def self.nfs_server_install(machine)
          super machine
          machine.communicate.sudo("ufw disable")
        end
      end
    end

    class Plugin < Vagrant.plugin("2")
      name "Ubuntu guest capability plugin for fixing firewall issue of nfs guest"

      guest_capability(:ubuntu, :nfs_server_install) do
        Cap::NFSServer
      end
    end
  end
end
