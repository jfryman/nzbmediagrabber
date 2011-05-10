# Class: nzbmediagrabber::sabnzbd
#
#
class nzbmediagrabber::sabnzbd {
	case $operatingsystem {
		'ubuntu': { $packageInstall = ['python-cheetah', 'unrar'] }
		default : { $packageInstall = ['python-cheetah', 'unrar'] }
	}
	
	
}