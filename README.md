Create a full configuration of Puppet Master and Agent using Vagrant. 

This is really awesome to begin with a development environment

To run this, just clone the repo and you can type:
`$ vagrant up puppetmaster`
`$ vagrant up agent`

Depending on your vagrant version the `share folder` line in Vagrantfile
could cause problems. Just check this. 

*What is important?*

- The puppet Master and Agent nodes take their configuration from 
puppet manifests located in the folder with that name. 

- The puppet Master will hold the modules for each node.
The modules folder is shared in /etc/puppet/modules in the master. 
Configurations are on the Vagrantfile.

- They autosign thanks to the file in the master /etc/puppet/autosign.conf
so you should not have problems in the signing part. 
To list certificates run `puppet cert list --all` on master. 

- To test the agent provision run `puppet agent -t`

- Explore through the commits to view changes. 
- Here is included a configuration to use an ENC (External Node Classifier) with puppet. This is a puppet extension, so it's a little more advanced...

Check out www.101pro.wordpress.com for more info. 

Enjoy and keep learning! 