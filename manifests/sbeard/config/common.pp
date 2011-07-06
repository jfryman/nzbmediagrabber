class nzbmediagrabber::sbeard::config::common {
  file { "${nzbmediagrabber::params::nr_software_base}/sickbeard/config-template.ini":
    ensure  => file,
    owner   => $nzbmediagrabber::params::nr_user_id,
		group   => $nzbmediagrabber::params::nr_user_id,
		content => template('nzbmediagrabber/sickbeard/common/config.ini.erb'),
	}
	exec { 'copy-initial-sickbeard-template':
	  command => "cp ${nzbmediagrabber::params::nr_software_base}/sickbeard/config-template.ini ${nzbmediagrabber::params::nr_software_base}/sickbeard/config.ini",
	  path    => '/bin:/sbin:/usr/bin:/usr/sbin',
	  creates => "${nzbmediagrabber::params::nr_software_base}/sickbeard/config.ini",
	  user    => $nzbmediagrabber::params::nr_user_id,
	  group   => $nzbmediagrabber::params::nr_user_id,
	  require => File["${nzbmediagrabber::params::nr_software_base}/sickbeard/config-template.ini"],
	}
}