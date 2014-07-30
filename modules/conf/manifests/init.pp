class conf{
      file {"/tmp/archivoconf.txt":
      	   ensure => file,
	   content => "mjse conf",
      }
}