class nzbmediagrabber::sabnzbd::config::common {
  file { "${nzbmediagrabber::params::nr_software_base}/sabnzbd":
    ensure => directory,
    owner   => $nzbmediagrabber::params::nr_user_id,
	  group   => $nzbmediagrabber::params::nr_user_id,
  }
  file { "${nzbmediagrabber::params::nr_software_base}/sabnzbd/config-template.ini":
    ensure  => file,
    owner   => $nzbmediagrabber::params::nr_user_id,
	  group   => $nzbmediagrabber::params::nr_user_id,
	  content => template('nzbmediagrabber/sabnzbd/common/config.ini.erb'),
  }
  exec { 'copy-initial-sabnzbd-template':
	  command => "cp ${nzbmediagrabber::params::nr_software_base}/sabnzbd/config-template.ini ${nzbmediagrabber::params::nr_software_base}/sabnzbd/config.ini",
	  path    => '/bin:/sbin:/usr/bin:/usr/sbin',
	  creates => "${nzbmediagrabber::params::nr_software_base}/sabnzbd/config.ini",
	  user    => $nzbmediagrabber::params::nr_user_id,
	  group   => $nzbmediagrabber::params::nr_user_id,
	  require => File["${nzbmediagrabber::params::nr_software_base}/sabnzbd/config-template.ini"],
	}
}