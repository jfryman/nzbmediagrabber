# Class: nzbmediagrabber::sabnzbd
#
#
class nzbmediagrabber::sabnzbd inherits nzbmediagrabber {
	$package_install = $operatingsystem ? { 
		ubuntu => ['python-cheetah', 'unrar', 'javascript-common',
                           'libjs-excanvas', 'libjs-mochikit', 'libtidy-0.99-0',
                           'par2', 'python-chardet', 'python-configobj', 
                           'python-feedparser', 'python-utidylib', 'python-yenc',
                           'sabnzbdplus', 'sabnzbdplus-theme-classic', 
                           'sabnzbdplus-theme-plush', 'sabnzbdplus-theme-smpl',
                           'wwwconfig-common'] 
	}

	package { $package_install:
		ensure => present,
	}

        file { "${nzbmediagrabber::software_base}/sabnzbd/sabnzbd.ini":
                ensure => file,
                content => template('nzbmediagrabber/common/sabnzbd/sabnzbd.ini.erb'),
        }

        # TODO Fix this area - ubuntu specific
        file { '/etc/default/sabnzbdplus': 
                content => template('nzbmediagrabber/ubuntu/etc/default/sabnzbdplus.erb'),
        }
}
