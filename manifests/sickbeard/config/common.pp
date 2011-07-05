class nzbmediagrabber::sickbeard::config::common {
  file { "${nzbmediagrabber::params::nr_software_base}/sickbeard/config.ini":
		content => template('nzbmediagrabber/common/sickbeard/config.ini.erb'),
		require => File["${nzbmediagrabber::params::nr_software_base}/sickbeard"],
	}
}