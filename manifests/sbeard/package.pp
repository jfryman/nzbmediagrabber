class nzbmediagrabber::sbeard::package {
  file { "${nzbmediagrabber::params::nr_software_base}/sickbeard":
		ensure  => directory,
		owner   => $nzbmediagrabber::params::nr_user_id,
		group   => $nzbmediagrabber::params::nr_user_id,
		recurse => true,
		before  => Exec['initial-download-sickbeard'],
	}
  exec { 'initial-download-sickbeard':
		command => "git clone https://github.com/midgetspy/Sick-Beard.git ${nzbmediagrabber::params::nr_software_base}/sickbeard",
		path    => "/bin:/sbin:/usr/bin:/usr/sbin",
		user    => $nzbmediagrabber::params::nr_user_id,
		group   => $nzbmediagrabber::params::nr_user_id,
		creates => "${nzbmediagrabber::params::nr_software_base}/sickbeard/SickBeard.py",
	}
}