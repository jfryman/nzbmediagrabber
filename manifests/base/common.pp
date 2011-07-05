class nzbmediagrabber::base::common {
  include nzbmediagrabber::params
  
  File {
    owner => $nzbmediagrabber::params::nr_user_id,
    group => $nzbmediagrabber::params::nr_user_id,
    mode  => '0644',
  }
  
  user { "${nzbmediagrabber::params::nr_user_id}":
    ensure  => present,
    comment => "Automated Media Grabber",
    home    => $nzbmediagrabber::params::nr_home_dir,
    shell   => "/bin/bash",
    uid     => '63342',
    gid     => $nzbmediagrabber::params::nr_user_id,
	}
	group { "${nzbmediagrabber::params::nr_user_id}": 
		ensure  => present,
		gid     => '63342'
	}
	
	# Create base directory structure for files
	file { "${nzbmediagrabber::params::nr_media_base}":
		ensure => directory,
	}
	file { "${nzbmediagrabber::params::nr_software_base}":
		ensure => directory,
	}
	file { "${nzbmediagrabber::params::nr_scratch_base}":
		ensure => directory,
	}
	file { "${nzbmediagrabber::params::nr_media_base}/movies":
		ensure => directory,
	}
	file { "${nzbmediagrabber::params::nr_media_base}/television":
		ensure => directory,
	}
	file { "${nzbmediagrabber::params::nr_media_base}/software":
		ensure => directory,
	}
	file {"${nzbmediagrabber::params::nr_scratch_base}/incoming":
		ensure => directory,
	}
	file { "${nzbmediagrabber::params::nr_scratch_base}/incoming/television":
		ensure => directory,
	}
	file { "${nzbmediagrabber::params::nr_scratch_base}/incoming/movies":
		ensure => directory,
	}
	file { "${nzbmediagrabber::params::nr_scratch_base}/post":
		ensure => directory,
	}
	file { "${nzbmediagrabber::params::nr_scratch_base}/post/television":
		ensure => directory,
	}
	file { "${nzbmediagrabber::params::nr_scratch_base}/post/movies":
		ensure => directory,
	}
	file { "${nzbmediagrabber::params::nr_scratch_base}/processing":
		ensure => directory,
	}
	file { "${nzbmediagrabber::params::nr_scratch_base}/processing/incoming":
		ensure => directory,
	}
	file { "${nzbmediagrabber::params::nr_scratch_base}/processing/complete":
		ensure => directory,
	}
	file { "${nzbmediagrabber::params::nr_scratch_base}/processing/logs":
		ensure => directory,
	}
	file { "${nzbmediagrabber::params::nr_scratch_base}/processing/cache":
		ensure => directory,
	}
}