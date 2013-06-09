class nzbmediagrabber::cpotato::package {
  file { "${nzbmediagrabber::params::nr_software_base}/couchpotato":
		ensure  => directory,
		owner   => $nzbmediagrabber::params::nr_user_id,
		group   => $nzbmediagrabber::params::nr_user_id,
		recurse => true,
		before  => Exec['initial-download-couchpotato'],
	} 
	exec { 'initial-download-couchpotato':
		command => "git clone https://github.com/RuudBurger/CouchPotatoServer.git ${nzbmediagrabber::params::nr_software_base}/couchpotato",
		path    => "/bin:/sbin:/usr/bin:/usr/sbin",
		user    => $nzbmediagrabber::params::nr_user_id,
		group   => $nzbmediagrabber::params::nr_user_id,
		creates => "${nzbmediagrabber::params::nr_software_base}/couchpotato/CouchPotato.py",
	}
}
