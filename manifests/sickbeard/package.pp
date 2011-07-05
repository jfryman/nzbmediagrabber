class nzbmediagrabber::sabnzbd::package {
  file { "${nzbmediagrabber::params::nr_software_base}/sickbeard":
		ensure  => directory,
		recurse => true,
		before  => Exec['initial-download-sickbeard'],
	}
  exec { 'initial-download-sickbeard':
		command => "git clone https://github.com/midgetspy/Sick-Beard.git ${nzbmediagrabber::params::nr_software_base}/sickbeard",
		path    => "/bin:/sbin:/usr/bin:/usr/sbin",
		creates => "${nzbmediagrabber::params::nr_software_base}/sickbeard/SickBeard.py",
	}
}