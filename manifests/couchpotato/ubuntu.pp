class nzbmediagrabber::couchpotato::ubuntu {
	$init_template = "nzbmediagrabber/ubuntu/etc/init.d/couchpotato.erb" 
	exec { 'initial-download-couchpotato':
		command => "git clone https://github.com/RuudBurger/CouchPotato.git ${nzbmediagrabber::software_base}/couchpotato",
		path    => "/bin:/sbin:/usr/bin:/usr/sbin",
		creates => "${nzbmediagrabber::software_base}/couchpotato/CouchPotato.py",
		notify  => File["${nzbmediagrabber::software_base}/couchpotato"],
	}
	file { "${nzbmediagrabber::software_base}/couchpotato":
		ensure  => directory,
		recurse => true,
	}
	file { "${nzbmediagrabber::software_base}/couchpotato/config.ini":
		content => template('nzbmediagrabber/common/couchpotato/config.ini.erb'),
		require => File["${nzbmediagrabber::software_base}/couchpotato"],
	}
	file { "/etc/init.d/couchpotato":
		owner   => 'root',
		group   => 'root',
		mode    => '0755',
		content => template($nzbmediagrabber::couchpotato::init_template),
		before  => Service['couchpotato'],
	}
	service { 'couchpotato':
		ensure    => running,
		enable    => true,
		require => File["${nzbmediagrabber::software_base}/couchpotato/config.ini"],
	}
}
