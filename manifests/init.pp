#
# Module: puppet-nzbmediagrabber
#
#  Created by James Fryman on 2011-05-07.
#  Copyright (c) 2011 frymanet.com. All rights reserved.
#
# Define:
#  
#
# Parameters:
#
#   
# Actions:
#
# Requires:
#
# Sample Usage:
# (start code)
# (end)

# Class: nzbmediagrabber
#
#
class nzbmediagrabber(
        $software_base = '/usr/local/mediagrabber',
        $media_base    = '/opt/media',
        $user_id       = 'mediagrabber',
        $home_dir      = '/home/mediagrabber',
        $scratch_base  = '/opt/media/scratch'
) {
	include nzbmediagrabber::sabnzbd
	include nzbmediagrabber::sickbeard
	include nzbmediagrabber::couchpotato
       
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

	File{ owner => $user_id, group => $user_id, mode => '0644' }
	
	# Create base directory structure for files
	file {
                $media_base                             : ensure => directory;
                $software_base                          : ensure => directory;
                $scratch_base                           : ensure => directory;
		"${media_base}/movies"                  : ensure => directory; 
		"${media_base}/television"              : ensure => directory; 
		"${media_base}/software"                : ensure => directory; 
		"${software_base}/software"             : ensure => directory;
                "${scratch_base}/incoming"              : ensure => directory;
                "${scratch_base}/incoming/television"   : ensure => directory;
                "${scratch_base}/incoming/movies"       : ensure => directory;
                "${scratch_base}/post"                  : ensure => directory;
                "${scratch_base}/post/television"       : ensure => directory;
                "${scratch_base}/post/movies"           : ensure => directory;
                "${scratch_base}/processing"            : ensure => directory;
                "${scratch_base}/processing/incomplete" : ensure => directory;
                "${scratch_base}/processing/complete"   : ensure => directory;
                "${scratch_base}/processing/logs"       : ensure => directory;
                "${scratch_base}/processing/cache"      : ensure => directory;
		$home_dir:
			ensure  => directory,
			source  => '/etc/skel',
			recurse => 'true';
	}
}
