class nzbmediagrabber::sbeard::config::linux {
  file { "/etc/init.d/sickbeard":
		owner   => 'root',
		group   => 'root',
		mode    => '0755',
		content => template("nzbmediagrabber/sickbeard/etc/init.d/sickbeard-${operatingsystem}.erb"),
	}
}