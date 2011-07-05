class nzbmediagrabber::sickbeard::config::linux {
  file { "/etc/init.d/sickbeard":
		owner   => 'root',
		group   => 'root',
		mode    => '0755',
		content => template("nzbmediagrabber/${operatingsystem}/etc/init.d/sickbeard.erb"),
	}
}