class nzbmediagrabber::base::darwin {
  file { "${nzbmediagrabber::params::nr_home_dir}": 
		ensure  => directory,
		source  => '/System/Library/User Template/English.lproj',
		recurse => 'true',
		owner   => $nzbmediagrabber::params::nr_user_id,
		group   => $nzbmediagrabber::params::nr_user_id,
	}
}