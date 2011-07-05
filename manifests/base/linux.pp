class nzbmediagrabber::base::linux {
  file { "${nzbmediagrabber::params::nr_home_dir}": 
		ensure  => directory,
		source  => '/etc/skel',
		recurse => 'true',
		owner   => $nzbmediagrabber::params::nr_user_id,
		group   => $nzbmediagrabber::params::nr_user_id,
	}
}