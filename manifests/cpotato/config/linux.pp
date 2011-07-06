class nzbmediagrabber::cpotato::config::linux {
  file { "/etc/init.d/couchpotato":
		owner   => 'root',
		group   => 'root',
		mode    => '0755',
		content => template("nzbmediagrabber/couchpotato/etc/init.d/couchpotato-${operatingsystem}.erb"),
	}
}