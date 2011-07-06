class nzbmediagrabber::cpotato::config::common {
  file { "${nzbmediagrabber::params::nr_software_base}/couchpotato/config-template.ini":
    ensure  => file,
    owner   => $nzbmediagrabber::params::nr_user_id,
	  group   => $nzbmediagrabber::params::nr_user_id,
		content => template('nzbmediagrabber/couchpotato/common/config.ini.erb'),
	}
	exec { 'copy-initial-couchpotato-template':
	  command => "cp ${nzbmediagrabber::params::nr_software_base}/couchpotato/config-template.ini ${nzbmediagrabber::params::nr_software_base}/couchpotato/config.ini",
	  path    => '/bin:/sbin:/usr/bin:/usr/sbin',
	  creates => "${nzbmediagrabber::params::nr_software_base}/couchpotato/config.ini",
	  user    => $nzbmediagrabber::params::nr_user_id,
	  group   => $nzbmediagrabber::params::nr_user_id,
	  require => File["${nzbmediagrabber::params::nr_software_base}/couchpotato/config-template.ini"],
	}	
}