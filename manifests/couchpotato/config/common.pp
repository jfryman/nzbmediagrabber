class nzbmediagrabber::couchpotato::config::common {
  file { "${nzbmediagrabber::params::software_base}/couchpotato/config.ini":
		content => template('nzbmediagrabber/common/couchpotato/config.ini.erb'),
	}
}