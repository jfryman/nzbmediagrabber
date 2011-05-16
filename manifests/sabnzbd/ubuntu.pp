class nzbmediagrabber::sabnzbd::ubuntu {
	$package_install = ['python-cheetah', 'unrar', 'javascript-common',
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
    file { "${nzbmediagrabber::software_base}/sabnzbd":
        ensure => directory,
    }
    file { "${nzbmediagrabber::software_base}/sabnzbd/config.ini":
	    content => template('nzbmediagrabber/common/sabnzbd/config.ini.erb'),
      	require => Package[$package_install],
      	before => Service['sabnzbdplus'],
	}
    file { '/etc/default/sabnzbdplus': 
        content => template('nzbmediagrabber/ubuntu/etc/default/sabnzbdplus.erb'),
        require => Package[$package_install],
    }
    service { 'sabnzbdplus':
        enable => true,
        ensure => running,
        hasstatus => true,
        subscribe => File['/etc/default/sabnzbdplus', '/etc/default/sabnzbdplus'],
    }        
}