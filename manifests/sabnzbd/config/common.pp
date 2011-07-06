class nzbmediagrabber::sabnzbd::config::common {
  file { "${nzbmediagrabber::params::nr_software_base}/sabnzbd":
    ensure => directory,
  }
  file { "${nzbmediagrabber::params::nr_software_base}/sabnzbd/config.ini":
	  content => template('nzbmediagrabber/sabnzbd/common/config.ini.erb'),
  }
}