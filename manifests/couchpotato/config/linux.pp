class nzbmediagrabber::couchpotato::config::linux {
  file { "/etc/init.d/couchpotato":
		owner   => 'root',
		group   => 'root',
		mode    => '0755',
		content => template("nzbmediagrabber/${operatingsystem}/etc/init.d/couchpotato.erb"),
	}
}