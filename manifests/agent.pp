$str = "127.0.0.1 localhost
${ipaddress_eth1} agent.example.com agent
10.10.1.100 puppetmaster.example.com puppetmaster
"

file {'/etc/hosts':
     ensure => file, 
     content => $str,
}

exec {'agent':
     provider => shell,
     command => "echo '[agent]' >> /etc/puppet/puppet.conf && echo 'server = puppetmaster.example.com' >> /etc/puppet/puppet.conf && sudo service puppet restart && sudo service networking restart"
}

## && echo 'certname = agent.example.com' >> /etc/puppet/puppet.conf