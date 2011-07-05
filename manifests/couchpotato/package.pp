class nzbmediagrabber::couchpotato::package {
	exec { 'initial-download-couchpotato':
		command => "git clone https://github.com/RuudBurger/CouchPotato.git ${nzbmediagrabber::params::nr_software_base}/couchpotato",
		path    => "/bin:/sbin:/usr/bin:/usr/sbin",
		creates => "${nzbmediagrabber::params::nr_software_base}/couchpotato/CouchPotato.py",
	}
}