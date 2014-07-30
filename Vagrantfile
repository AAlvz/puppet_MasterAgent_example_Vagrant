# -*- mode: ruby -*-

Vagrant::Config.run do |config|
  # Puppetmaster vm config
  config.vm.define :puppetmaster do |config|
    config.vm.box = "puppetmaster.example.com"
    config.vm.box_url = "file:///home/aalvz/Documents/vagrant/boxes/precise64.box"
    config.vm.forward_port 80, 8080
    config.vm.network :hostonly, "10.10.1.100"
    config.vm.host_name = "puppetmaster.example.com"
    config.vm.share_folder "modules", "/etc/puppet/modules", "./modules"

    config.vm.provision :shell, :inline => '
if ! test -f /usr/bin/puppet; then
  sudo apt-get update && sudo apt-get install -y puppetmaster
fi
'
    
    config.vm.provision :puppet,
    :options => ["--debug", "--verbose", "--summarize"] do |puppet|#,
    #:facter => { "fqdn" => "puppetmaster.example.com" } do |puppet|
      #puppet.manifests_path = "manifests"
      #puppet.module_path    = "modules"
      puppet.manifest_file  = "server.pp" #Default=>default.pp
    end

      config.vm.provision :puppet_server do |puppet|
        #puppet.options = ["--onetime", "-D"]    ##LINEA QUE RESUELVE PROBLEMAS DE CERTIFICADOS. HACE QUE NO SE DAEMONICE. 
        puppet.puppet_server = "puppetmaster.example.com"
      end

  end

    # Agent vm Config
    config.vm.define :agent do |agentconfig|
      agentconfig.vm.box = "agent.example.com"
      agentconfig.vm.box_url = "file:///home/aalvz/Documents/vagrant/boxes/precise64.box"
      agentconfig.vm.forward_port 3306, 3306
      agentconfig.vm.network :hostonly, "10.10.1.110"
      agentconfig.vm.host_name = "agent.example.com"      

      agentconfig.vm.provision :shell, :inline => '
if ! test -f /usr/bin/puppet; then
  sudo apt-get update && sudo apt-get install -y puppet
fi'

      agentconfig.vm.provision :puppet,
      :options => ["--debug", "--verbose", "--summarize"] do |puppet| #,
      #:facter => { "fqdn" => "agent.example.com" } do |puppet|
        puppet.manifests_path = "manifests"
        #puppet.module_path    = "modules"
        puppet.manifest_file  = "agent.pp" #Default=>default.pp
      end

      agentconfig.vm.provision :puppet_server do |puppet|
        #puppet.options = ["--onetime", "-D"]    ##LINEA QUE RESUELVE PROBLEMAS DE CERTIFICADOS 
        puppet.options = ["--test"]
        puppet.puppet_server = "puppetmaster.example.com"
        puppet.puppet_node = "agent.example.com"
      end

    end
end
