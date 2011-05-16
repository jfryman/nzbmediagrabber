class nzbmediagrabber::sabnzbd::darwin {
	$package_install = ['python-cheetah', 'unrar', 'javascript-common',
                        'libjs-excanvas', 'libjs-mochikit', 'libtidy-0.99-0',
                        'par2', 'python-chardet', 'python-configobj', 
                        'python-feedparser', 'python-utidylib', 'python-yenc',
                        'sabnzbdplus', 'sabnzbdplus-theme-classic', 
                        'sabnzbdplus-theme-plush', 'sabnzbdplus-theme-smpl',
                        'wwwconfig-common'] 
	
	
    file { "${nzbmediagrabber::software_base}/sabnzbd":
        ensure => directory,
    }
	file { "${nzbmediagrabber::os::darwin::home_dir}/Library/Application Support/SABnzbd":
		ensure => directory,
		owner  => $nzbmediagrabber::user_id,
		group  => $nzbmediagrabber::group,
	}
	file { "${nzbmediagrabber::os::darwin::home_dir}/Library/Application Support/SABnzbd/sabnzbd.ini":
	    content => template('nzbmediagrabber/common/sabnzbd/config.ini.erb'),
	}
	exec { 'download-sabnzbd-source':
		command => "curl -L http://sourceforge.net/projects/sabnzbdplus/files/sabnzbdplus/sabnzbd-${nzbmediagrabber::sabnzbd_version}/SABnzbd-${nzbmediagrabber::sabnzbd_version}-src.tar.gz/download > /tmp/sabnzbd.tar.gz",
		path	=> '/bin:/usr/bin:/sbin:/usr/sbin',
		creates	=> "/tmp/sabnzbd.tar.gz",
		before  => Exec['extract-sabnzbd'],
	}

	exec { 'extract-sabnzbd':
		command => "tar zxf /tmp/sabnzbd.tar.gz -C ${nzbmediagrabber::software_base}/",
		path	=> '/bin:/usr/bin:/sbin:/usr/sbin',
		creates	=> "${nzbmediagrabber::software_base}/SABnzbd-${nzbmediagrabber::sabnzbd_version}/SABnzbd.py",
	}
	
	file { '/Library/LaunchDaemons/com.nzbmediagrabber.sabnzbd':
		ensure  => file,
		owner   => 'root',
		group   => 'wheel',
		content => template('nzbmediagrabber/darwin/Library/LaunchDaemons/com.nzbmediagrabber.sabnzbd.erb'),
	}

/*    file { "${nzbmediagrabber::software_base}/sabnzbd/config.ini":
	    content => template('nzbmediagrabber/common/sabnzbd/config.ini.erb'),
      	require => Package[$package_install],
      	before => Service['sabnzbdplus'],
	}
	
	# Make OSX Specific
    service { 'sabnzbdplus':
        enable => true,
        ensure => running,
        hasstatus => true,
        subscribe => File['/etc/default/sabnzbdplus', '/etc/default/sabnzbdplus'],
    }        
*/
}