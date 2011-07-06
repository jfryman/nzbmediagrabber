class nzbmediagrabber::sbeard::config::common {
  file { "${nzbmediagrabber::params::nr_software_base}/sickbeard/config.ini":
    ensure  => file,
    owner   => $nzbmediagrabber::params::nr_user_id,
		group   => $nzbmediagrabber::params::nr_user_id,
		content => template('nzbmediagrabber/sickbeard/common/config.ini.erb'),
		require => File["${nzbmediagrabber::params::nr_software_base}/sickbeard"],
	}
}