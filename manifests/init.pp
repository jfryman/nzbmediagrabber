#
# Module: puppet-nzbmediagrabber
#
#  Created by James Fryman on 2011-05-07.
#  Copyright (c) 2011 frymanet.com. All rights reserved.
#

class nzbmediagrabber(
        $software_base = '/usr/local/mediagrabber',
        $media_base    = '/opt/media',
        $user_id       = 'mediagrabber',
        $scratch_base  = '/opt/media/scratch'
) {
	$sabnzbd_version = '0.6.0'
	$home_dir = $kernel ? {
		'darwin' => "/Users/${user_id}",
		default  => "/home/${user_id}",
	}

	# Setup Operating Specific Variables
	case $::kernel {
		'darwin': { 
			include nzbmediagrabber::sabnzbd::darwin
			file { $home_dir: 
				ensure  => directory,
				source  => '/System/Library/User Template/English.lproj',
				recurse => 'true',
				owner   => $nzbmediagrabber::user_id,
				group   => $nzbmediagrabber::user_id,
			}
		}
		default:  { 
			file { $home_dir: 
				ensure  => directory,
				source  => '/etc/skel',
				recurse => 'true',
				owner   => $nzbmediagrabber::user_id,
				group   => $nzbmediagrabber::user_id,
			}
			# Setup Linux Distribution Specific Variables
			case $::operatingsystem {
				'ubuntu': {
					include nzbmediagrabber::sabnzbd::ubuntu
					include nzbmediagrabber::sickbeard::ubuntu
					include nzbmediagrabber::couchpotato::ubuntu
				}		
			}
		}	
	}
	## BEGIN Universal Layout ##
	# Create default user to execute scripts
	user { $user_id:
		ensure 	=> present,
		comment => "Automated Media Grabber",
		home 	=> $home_dir,
		shell 	=> "/bin/bash",
		uid 	=> '63342',
		gid 	=> $user_id,
	}
	group { $user_id: 
		ensure  => present,
		gid     => '63342'
	}
	# Create base directory structure for files
	file { $media_base:
		ensure => directory,
		owner  => $user_id,
		group  => $user_id,
		mode   => '0644',
	}
	file { $software_base:
		ensure => directory,
		owner  => $user_id,
		group  => $user_id,
		mode   => '0644',
	}
	file { $scratch_base:
		ensure => directory,
		owner  => $user_id,
		group  => $user_id,
		mode   => '0644',
	}
	file { "${media_base}/movies":
		ensure => directory,
		owner  => $user_id,
		group  => $user_id,
		mode   => '0644',
	}
	file { "${media_base}/television":
		ensure => directory,
		owner  => $user_id,
		group  => $user_id,
		mode   => '0644',
	}
	file { "${media_base}/software":
		ensure => directory,
		owner  => $user_id,
		group  => $user_id,
		mode   => '0644',
	}
	file {"${scratch_base}/incoming":
		ensure => directory,
		owner  => $user_id,
		group  => $user_id,
		mode   => '0644',
	}
	file { "${scratch_base}/incoming/television":
		ensure => directory,
		owner  => $user_id,
		group  => $user_id,
		mode   => '0644',
	}
	file { "${scratch_base}/incoming/movies":
		ensure => directory,
		owner  => $user_id,
		group  => $user_id,
		mode   => '0644',
	}
	file { "${scratch_base}/post":
		ensure => directory,
		owner  => $user_id,
		group  => $user_id,
		mode   => '0644',
	}
	file { "${scratch_base}/post/television":
		ensure => directory,
		owner  => $user_id,
		group  => $user_id,
		mode   => '0644',
	}
	file { "${scratch_base}/post/movies":
		ensure => directory,
		owner  => $user_id,
		group  => $user_id,
		mode   => '0644',
	}
	file { "${scratch_base}/processing":
		ensure => directory,
		owner  => $user_id,
		group  => $user_id,
		mode   => '0644',
	}
	file { "${scratch_base}/processing/incoming":
		ensure => directory,
		owner  => $user_id,
		group  => $user_id,
		mode   => '0644',
	}
	file { "${scratch_base}/processing/complete":
		ensure => directory,
		owner  => $user_id,
		group  => $user_id,
		mode   => '0644',
	}
	file { "${scratch_base}/processing/logs":
		ensure => directory,
		owner  => $user_id,
		group  => $user_id,
		mode   => '0644',
	}
	file { "${scratch_base}/processing/cache":
		ensure => directory,
		owner  => $user_id,
		group  => $user_id,
		mode   => '0644',
	}
}
