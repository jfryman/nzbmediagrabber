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
class nzbmediagrabber {
	include sabnzbd
	include sickbeard
	include couchpotato
	
	# Globals to be converted into Class Variables
	$software_base 	= '/usr/local/mediagrabber'
	$media_base		= '/opt/media'
	
	# Create default user to execute scripts
	user { "mediagrabber":
		ensure 	=> present,
		comment => "Automated Media Grabber",
		home 	=> "/home/mediagrabber",
		shell 	=> "/bin/bash",
		uid 	=> '63342',
		gid 	=> '63342',
	}
	
	File{ owner => 'mediagrabber', group => 'mediagrabber', mode => '0755' }
	
	# Create base directory structure for files
	file { 
		"${media_base}/movies": { ensure => directory, }
		"${media_base}/television": { ensure => directory, }
		"${media_base}/software": { ensure => directory, }
		"${software_base}/software": { ensure => directory, }
	}
}