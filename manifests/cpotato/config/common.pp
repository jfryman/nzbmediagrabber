class nzbmediagrabber::cpotato::config::common {
  file { "${nzbmediagrabber::params::nr_software_base}/couchpotato/config.ini":
    ensure  => file,
    owner   => $nzbmediagrabber::params::nr_user_id,
	  group   => $nzbmediagrabber::params::nr_user_id,
		content => template('nzbmediagrabber/couchpotato/common/config.ini.erb'),
	}
}