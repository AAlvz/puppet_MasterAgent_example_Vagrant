class motd{
      file {"/tmp/archivomotd.txt":
      	   ensure => file,
	   content => "mjse motd",
      }
      notify {$saludo:
      	     
      }
}