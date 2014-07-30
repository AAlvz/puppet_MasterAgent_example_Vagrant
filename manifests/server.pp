$str = "127.0.0.1 localhost
${ipaddress_eth1} puppetmaster.example.com puppetmaster
10.10.1.110 agent.example.com agent
"

file {'/etc/hosts':
     ensure => file, 
     content => $str,
}

exec {'autosign':
     provider => shell,
     command => "echo '*' >> /etc/puppet/autosign.conf"
}

exec {'activate_ENC':
     provider => shell,
     command => "echo 'node_terminus = exec' >> /etc/puppet/puppet.conf && echo 'external_nodes = /vagrant/enc.py' >> /etc/puppet/puppet.conf",
     notify => Exec['restart_puppet'],
}

exec {'restart_puppet':
     provider => shell,
     command => "sudo service puppetmaster restart",
}


exec {'install_pyyaml':
     provider => shell,
     command => "sudo apt-get install python-pip -y && sudo pip install PyYAML"
}